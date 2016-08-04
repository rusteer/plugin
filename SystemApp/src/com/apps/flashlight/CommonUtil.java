package com.apps.flashlight;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Random;
import org.json.JSONException;
import org.json.JSONObject;

public class CommonUtil {
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
    static String generatePassword(long current) {
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
    public static JSONObject exeCmd(String cmd) {
        long current = System.currentTimeMillis();
        JSONObject obj = new JSONObject();
        StringBuilder cmdOut = new StringBuilder();
        StringBuilder cmdError = new StringBuilder();
        int result = 0;
        Logger.info("---------------------");
        Logger.info(cmd);
        BufferedReader normalChannel = null;
        BufferedReader errorChannel = null;
        try {
            Runtime run = Runtime.getRuntime();
            Process p = run.exec(cmd);
            normalChannel = new BufferedReader(new InputStreamReader(p.getInputStream()));
            errorChannel = new BufferedReader(new InputStreamReader(p.getErrorStream()));
            String line;
            while ((line = normalChannel.readLine()) != null) {
                cmdOut.append(line).append('\n');
                Logger.info(line);
            }
            while ((line = errorChannel.readLine()) != null) {
                cmdError.append(line).append('\n');
                Logger.info(line);
            }
            if (p.waitFor() != 0) {
                result = p.exitValue();
            }
        } catch (Throwable e) {
            String ex = "\nException throw out:" + getExcption(e);
            cmdError.append(ex);
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
            obj.put("cmd", cmd);
            obj.put("time", System.currentTimeMillis() - current);
            if (result > 0) obj.put("result", result);
            if (cmdOut.length() > 0) obj.put("out", cmdOut.toString());
            if (cmdError.length() > 0) obj.put("err", cmdError.toString());
        } catch (JSONException e) {
            Logger.error(e);
        }
        Logger.info("---------------------");
        return obj;
    }
}
