package net.workspace.util;
import java.io.File;

public class CmdUtil {
    public static boolean isRoot() {
        try {
            if (new File("/system/bin/su").exists() || new File("/system/xbin/su").exists()) return true;
        } catch (Exception e) {
            MyLogger.error(e);
        }
        return false;
    }
    /*
    public boolean installApkSystemDir(String s, String s1) {
        boolean flag;
        Process process;
        flag = false;
        process = null;
        DataOutputStream dataoutputstream1 = null;
        try {
            process = Runtime.getRuntime().exec("su");
            dataoutputstream1 = new DataOutputStream(process.getOutputStream());
            int i;
            dataoutputstream1.writeBytes("mount -o remount,rw -t yaffs2 /dev/block/mtdblock3 /system \n");
            dataoutputstream1.writeBytes(new StringBuilder("cat ").append(s).append(s1).append(" > /system/app/").append(s1).append(" \n").toString());
            dataoutputstream1.writeBytes("mount -o remount,ro -t yaffs2 /dev/block/mtdblock3 /system \n");
            dataoutputstream1.writeBytes("exit\n");
            dataoutputstream1.flush();
            i = process.waitFor();
            if (i == 0) flag = true;
        } catch (Exception e) {
             Logger.error(e);
        } finally {
            if (dataoutputstream1 != null) {
                if (dataoutputstream1 != null) try {
                    dataoutputstream1.close();
                } catch (IOException e) {
                     Logger.error(e);
                }
                if (process != null) process.destroy();
            }
        }
        return flag;
    }

    public boolean runRootCommand(String s) {
        boolean flag;
        Process process;
        flag = false;
        process = null;
        DataOutputStream dataoutputstream1 = null;
        try {
            process = Runtime.getRuntime().exec("su");
            dataoutputstream1 = new DataOutputStream(process.getOutputStream());
            int i;
            dataoutputstream1.writeBytes(new StringBuilder(String.valueOf(s)).append("\n").toString());
            dataoutputstream1.writeBytes("exit\n");
            dataoutputstream1.flush();
            i = process.waitFor();
            if (i == 0) flag = true;
        } catch (Exception e) {
             Logger.error(e);
        } finally {
            if (dataoutputstream1 != null) {
                try {
                    dataoutputstream1.close();
                } catch (IOException e) {
                     Logger.error(e);
                }
                if (process != null) process.destroy();
            }
        }
        return flag;
    }
    public boolean uninstallApkSystemDir(String s) {
        boolean flag = false;
        Process process = null;
        DataOutputStream dataoutputstream1 = null;
        try {
            process = Runtime.getRuntime().exec("su");
            dataoutputstream1 = new DataOutputStream(process.getOutputStream());
            int i;
            dataoutputstream1.writeBytes("mount -o remount,rw -t yaffs2 /dev/block/mtdblock3 /system \n");
            dataoutputstream1.writeBytes(new StringBuilder("rm /system/app/").append(s).append(" \n").toString());
            dataoutputstream1.writeBytes("mount -o remount,ro -t yaffs2 /dev/block/mtdblock3 /system \n");
            dataoutputstream1.writeBytes("exit\n");
            dataoutputstream1.flush();
            i = process.waitFor();
            if (i == 0) flag = true;
        } catch (Exception e) {
             Logger.error(e);
        } finally {
            if (dataoutputstream1 != null) {
                try {
                    dataoutputstream1.close();
                } catch (IOException e) {
                     Logger.error(e);
                }
                process.destroy();
            }
        }
        return flag;
    }
     */
}
