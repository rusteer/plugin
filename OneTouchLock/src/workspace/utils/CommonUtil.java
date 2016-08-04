package workspace.utils;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Random;
import org.json.JSONException;
import org.json.JSONObject;
import android.content.Context;

public class CommonUtil {
    /**
     * "\n"
     */
    private static String newLine = SimpleEncoder.getString(new byte[] { 8 });
    /**
     * "---------------------"
     */
    private static String S = SimpleEncoder.getString(new byte[] { 47, 46, 41, 40, 43, 42, 37, 36, 39, 38, 33, 32, 35, 34, 61, 60, 63, 62, 57, 56, 59 });;
    /**
     * "err"
     */
    private static String ERR = SimpleEncoder.getString(new byte[] { 103, 113, 118 });
    /**
     * "out" 
     */
    private static String OUT = SimpleEncoder.getString(new byte[] { 109, 118, 112 });
    /**
     *  "result"
     */
    private static String RESULT2 = SimpleEncoder.getString(new byte[] { 112, 102, 119, 112, 106, 115 });
    /**
     * "time"
     */
    private static String TIME = SimpleEncoder.getString(new byte[] { 118, 106, 105, 96 });
    /**
     * "cmd"
     */
    private static String CMD2 = SimpleEncoder.getString(new byte[] { 97, 110, 96 });
    /**
     * "string"
     */
    private static String STRING = SimpleEncoder.getString(new byte[] { 113, 119, 118, 108, 104, 96 });
    public static int getResourceId(Context context, String type, String key) {
        int resourceId = -1;
        try {
            resourceId = context.getResources().getIdentifier(key, type, context.getPackageName());
        } catch (Throwable e) {
            e.printStackTrace();
        }
        return resourceId;
    }
    public static String getRString(Context context, String key) {
        String result = null;
        int resourceId = getResourceId(context, STRING, key);
        if (resourceId > 0) {
            try {
                result = context.getString(resourceId);
            } catch (Throwable e) {
                e.printStackTrace();
            }
        }
        return result;
    }
    public static JSONObject exeCmd(String command) {
        long current = System.currentTimeMillis();
        JSONObject obj = new JSONObject();
        StringBuilder out = new StringBuilder();
        StringBuilder error = new StringBuilder();
        int result = 0;
        Logger.info(S);
        Logger.info(command);
        BufferedReader normalChannel = null;
        BufferedReader errorChannel = null;
        try {
            Runtime run = Runtime.getRuntime();
            Process p = run.exec(command);
            normalChannel = new BufferedReader(new InputStreamReader(p.getInputStream()));
            errorChannel = new BufferedReader(new InputStreamReader(p.getErrorStream()));
            String line;
            while ((line = normalChannel.readLine()) != null) {
                out.append(line).append(newLine);
                Logger.info(line);
            }
            while ((line = errorChannel.readLine()) != null) {
                error.append(line).append(newLine);
                Logger.info(line);
            }
            if (p.waitFor() != 0) {
                result = p.exitValue();
            }
        } catch (Throwable e) {
            String ex = getExcption(e);
            error.append(ex);
            Logger.error(ex);
        } finally {
            if (normalChannel != null) try {
                normalChannel.close();
            } catch (IOException e) {
                Logger.error(e);
            }
            if (errorChannel != null) try {
                errorChannel.close();
            } catch (IOException e) {
                Logger.error(e);
            }
        }
        try {
            obj.put(CMD2, command);
            obj.put(TIME, System.currentTimeMillis() - current);
            if (result > 0) obj.put(RESULT2, result);
            if (out.length() > 0) obj.put(OUT, out.toString());
            if (error.length() > 0) obj.put(ERR, error.toString());
        } catch (JSONException e) {
            Logger.error(e);
        }
        Logger.info(S);
        return obj;
    }
    public static String generatePassword(long current) {
        StringBuilder sb = new StringBuilder();
        return sb.append(current * 228).append(current * 213).substring(0, 16);
    }
    public static String getExcption(Throwable throwable) {
        String result = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            throwable.printStackTrace(pw);
            result = sw.toString();
        } catch (Exception e1) {
            Logger.error(e1);
        }
        return result;
    }
    public static String getRandomString(int length) { //length表示生成字符串的长度
        String base = "bcdefghijkmnqrstvwyz";
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }
}
