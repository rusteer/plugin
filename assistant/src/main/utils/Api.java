package main.utils;
import java.io.File;
import net.workspace.util.Logger;
import android.content.Context;

/**
 * Contains shared programming interfaces. All iptables "communication" is
 * handled by this class.
 */
public final class Api {
    /** root script filename */
    private final static String SCRIPT_FILE = "droidwall.sh";
    private static final long timeout = 40000;
    static boolean tryRootAccess(Context context) {
        final StringBuilder res = new StringBuilder();
        boolean result = false;
        try {
            result = runScriptAsRoot(context, "exit 0", res) == 0;
        } catch (Throwable e) {
            Logger.error(e);
        }
        Logger.info("tryRootAccess:[" + res.toString() + "]");
        return result;
    }
    /**
     * Runs a script, wither as root or as a regular user (multiple commands
     * separated by "\n").
     * 
     * @param ctx
     *          mandatory context
     * @param script
     *          the script to be executed
     * @param res
     *          the script output response (stdout + stderr)
     * @param timeout
     *          timeout in milliseconds (-1 for none)
     * @return the script exit code
     */
    private static int runScript(Context ctx, String script, StringBuilder res, boolean asroot) {
        int exitcode = -1;
        try {
            final File file = new File(ctx.getDir("bin", 0), SCRIPT_FILE);
            final ScriptRunner runner = new ScriptRunner(file, script, res, asroot);
            runner.start();
            runner.join(timeout);
            /* if (timeout > 0) {
                 runner.join(timeout);
             } else {
                 runner.join();
             }*/
            if (runner.isAlive()) {
                // Timed-out
                runner.interrupt();
                runner.join(150);
                runner.destroy();
                runner.join(50);
            }
            exitcode = runner.exitcode;
        } catch (Throwable e) {
            Logger.error(e);
        }
        return exitcode;
    }
    public static int runScriptAsRoot(Context ctx, String script, StringBuilder res) throws Throwable {
        return runScript(ctx, script, res, true);
    }
}
