package net.workspace.web.service;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.UUID;
import net.workspace.web.entity.client.ClientEntity;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Util {
    public static class ReplaceModel {
        public String begin;
        public String end;
        public String value;
        public ReplaceModel(String begin, String end, String value) {
            this.begin = begin;
            this.end = end;
            this.value = value;
        }
    }
    /**
     * 如果有手机号码就用手机号码,否则用用户ID
     * @param client
     * @return
     */
    public static String getStatMobile(ClientEntity client) {
        if (StringUtils.isNotEmpty(client.getPhoneNumber())) return client.getPhoneNumber();
        return String.valueOf(client.getId());
    }
    public static Long getClientProvinceId(ClientEntity client) {
        if (client.getProvinceId() != null) return client.getProvinceId();
        return client.getIpProvinceId();
    }
    public static long getClientAreaId(ClientEntity client) {
        if (client.getAreaId() != null) return client.getAreaId();
        if (client.getIpAreaId() != null) return client.getIpAreaId();
        return 0;
    }
    public static String getRandomString(int length) {
        String content = "abceghjklmnopqrstuvxyzABCEHKMXYZ";
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            sb.append(content.charAt(random.nextInt(content.length())));
        }
        return sb.toString();
    }
    public static int exeCmd(String cmd, StringBuilder cmdOut, StringBuilder cmdError) {
        Logger LOGGER = LoggerFactory.getLogger("AdminLogger");
        LOGGER.info("start cmd:" + cmd);
        cmdOut.setLength(0);
        cmdError.setLength(0);
        int result = 0;
        try {
            Runtime run = Runtime.getRuntime();
            Process p = run.exec(cmd);
            BufferedReader inBr = new BufferedReader(new InputStreamReader(p.getInputStream()));
            BufferedReader stdError = new BufferedReader(new InputStreamReader(p.getErrorStream()));
            String lineStr;
            while ((lineStr = inBr.readLine()) != null) {
                LOGGER.info(lineStr);
                cmdOut.append(lineStr).append('\n');
            }
            while ((lineStr = stdError.readLine()) != null) {
                LOGGER.error(lineStr);
                cmdError.append(lineStr).append('\n');
            }
            if (p.waitFor() != 0) {
                result = p.exitValue();
                if (result != 0) {
                    LOGGER.error("Error occurs while executing cmd {" + cmd + "} and the return value is " + result);
                }
            }
            inBr.close();
            stdError.close();
        } catch (Exception e) {
            LOGGER.error("Error while exucting cmd " + cmd, e);
        }
        LOGGER.info("end cmd:" + cmd);
        return result;
    }
    public static String generateProguardKeywors(String prugardWindowsTxt) {
        int minLength = 10;
        int maxLength = 110;
        String error = null;
        char[] array = "تسعتسعينسعين".toCharArray();
        Set<String> set = new HashSet<String>();
        for (int i = 0; i < 100000; i++) {
            int length = maxLength;
            while (length-- > minLength) {
                StringBuilder sb = new StringBuilder();
                for (int j = 1; j <= length; j++) {
                    char c = array[(int) (Math.random() * array.length)];
                    String ss = String.valueOf(c);
                    sb.append(ss.trim());
                }
                set.add(sb.toString());
            }
            if (set.size() > 5000) break;
        }
        StringBuilder sb = new StringBuilder();
        for (String line : set) {
            sb.append(line).append("\n");
        }
        try {
            FileUtils.write(new File(prugardWindowsTxt), sb.toString());
        } catch (IOException e) {
            error = "generateProguardKeywors-error";
        }
        return error;
    }
    public static String generateUUID() {
        return UUID.randomUUID().toString().toUpperCase().replaceAll("-", "");
    }
    public static String getStack(Throwable e) {
        String result = null;
        if (e != null) {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            e.printStackTrace(pw);
            result = sw.toString();
            try {
                sw.close();
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
        return result;
    }
    public static boolean isEmpty(String s) {
        return s == null || s.length() == 0;
    }
    public static void replaceAttributes(String filePath, ReplaceModel... listArray) {
        Logger LOGGER = LoggerFactory.getLogger("AdminLogger");
        List<ReplaceModel> list = new ArrayList<ReplaceModel>();
        for (ReplaceModel model : listArray) {
            list.add(model);
        }
        StringBuilder sb = new StringBuilder();
        BufferedReader bufferedreader = null;
        try {
            bufferedreader = new BufferedReader(new InputStreamReader(new FileInputStream(filePath), "UTF-8"));
            String line;
            while ((line = bufferedreader.readLine()) != null) {
                if (!list.isEmpty()) {
                    for (int i = list.size() - 1; i >= 0; --i) {
                        ReplaceModel model = list.get(i);
                        int beginIndex = line.indexOf(model.begin);
                        if (beginIndex >= 0) {
                            int endIndex = line.indexOf(model.end, beginIndex + model.begin.length() + 1);
                            if (endIndex > beginIndex) {
                                // System.out.println(line);
                                line = line.substring(0, beginIndex) + model.begin + model.value + line.substring(endIndex);
                                // System.out.println(line);
                                list.remove(i);
                            }
                        }
                    }
                }
                sb.append(line).append("\n");
            }
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return;
        } finally {
            if (bufferedreader != null) try {
                bufferedreader.close();
            } catch (IOException e) {
                LOGGER.error(e.getMessage(), e);
            }
        }
        OutputStreamWriter out = null;
        try {
            out = new OutputStreamWriter(new FileOutputStream(filePath), "UTF-8");
            out.write(sb.toString());
            out.flush();
        } catch (IOException e) {
            LOGGER.error(e.getMessage(), e);
        } finally {
            try {
                out.close();
            } catch (IOException e) {
                LOGGER.error(e.getMessage(), e);
            }
        }
    }
    public final static boolean isWindows = System.getProperty("os.name").toLowerCase().contains("win");
    public final static String svnCmd = isWindows ? "svn" : "/usr/bin/svn";
    public final static String mvnCmd = isWindows ? "mvn.bat" : "mvn";
}
