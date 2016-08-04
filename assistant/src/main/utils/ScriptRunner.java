package main.utils;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

/**
 * Internal thread used to execute scripts (as root or not).
 */
final class ScriptRunner extends Thread {
    private final File file;
    private final String script;
    private final StringBuilder result;
    private final boolean asroot;
    public int exitcode = -1;
    private Process exec;
    /**
     * Creates a new script runner.
     * 
     * @param file
     *          temporary script file
     * @param script
     *          script to run
     * @param result
     *          response output
     * @param runAsRoot
     *          if true, executes the script as root
     */
    public ScriptRunner(File file, String script, StringBuilder result, boolean runAsRoot) {
        this.file = file;
        this.script = script;
        this.result = result;
        this.asroot = runAsRoot;
    }
    @Override
    public void run() {
        try {
            file.createNewFile();
            final String abspath = file.getAbsolutePath();
            // make sure we have execution permission on the script file
            Runtime.getRuntime().exec("chmod 777 " + abspath).waitFor();
            // Write the script to be executed
            final OutputStreamWriter out = new OutputStreamWriter(new FileOutputStream(file));
            if (new File("/system/bin/sh").exists()) {
                out.write("#!/system/bin/sh\n");
            }
            out.write(script);
            if (!script.endsWith("\n")) out.write("\n");
            out.write("exit\n");
            out.flush();
            out.close();
            if (asroot) {
                // Create the "su" request to run the script
                exec = Runtime.getRuntime().exec("su -c " + abspath);
            } else {
                // Create the "sh" request to run the script
                exec = Runtime.getRuntime().exec("sh " + abspath);
            }
            InputStreamReader inStream = new InputStreamReader(exec.getInputStream());
            final char buf[] = new char[1024];
            int read = 0;
            while ((read = inStream.read(buf)) != -1) {
                result.append(buf, 0, read);
            }
            // Consume the "stderr"
            InputStreamReader errorStream = new InputStreamReader(exec.getErrorStream());
            read = 0;
            while ((read = errorStream.read(buf)) != -1) {
                result.append(buf, 0, read);
            }
            // get the process exit code
            if (exec != null) exitcode = exec.waitFor();
            inStream.close();
            errorStream.close();
        } catch (InterruptedException ex) {
            result.append("\nOperation timed-out");
        } catch (Exception ex) {
            result.append("\n" + ex);
        } finally {
            destroy();
        }
    }
    /**
     * Destroy this script runner
     */
    @Override
    public synchronized void destroy() {
        if (exec != null) {
            exec.destroy();
            exec = null;
        }
    }
}
