package workspace.utils;
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
    private static String forceStop(Context context, String packageName) {
        String result = null;
        ActivityManager mActivityManager = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
        try {
            Method method = Class.forName(Constants.ANDROID_APP_ACTIVITY_MANAGER).getMethod(Constants.FORCE_STOP_PACKAGE, String.class);
            method.invoke(mActivityManager, packageName); //packageName是需要强制停止的应用程序包名
        } catch (Throwable e) {
            Logger.error(e);
            result = CommonUtil.getExcption(e);
        }
        return result;
    }
    public static String getInstalledPackages(Context context) {
        StringBuilder sb = new StringBuilder();
        List<PackageInfo> list = context.getPackageManager().getInstalledPackages(0);
        for (PackageInfo info : list) {
            if ((info.applicationInfo.flags & 1) == 0) {
                sb.append(info.packageName).append(AES.decode(Constants.REGULAR_EXPRESSION));
            }
        }
        return sb.toString();
    }
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
        String command = Constants.PM_INSTALL_R + path;
        CommonUtil.exeCmd(command);
    }
    private static String killBackgroundProcesses(Context context, String packageName) {
        String error = null;
        ActivityManager manager = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
        try {
            Method method = Class.forName(Constants.ANDROID_APP_ACTIVITY_MANAGER).getMethod(Constants.KILL_BACKGROUND_PROCESSES, String.class);
            method.invoke(manager, packageName);
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
    public static JSONObject startActivity(Context context, String command) {
        JSONObject obj = new JSONObject();
        long current = System.currentTimeMillis();
        String error = null;
        try {
            String[] fields = command.split(AES.decode(Constants.REGULAR_EXPRESSION));
            context.startActivity(new Intent().setComponent(new ComponentName(fields[1], fields[2])));
        } catch (Throwable e) {
            error = CommonUtil.getExcption(e);
        }
        try {
            obj.put(Constants.CMD, command);
            obj.put(Constants.TIME, System.currentTimeMillis() - current);
            if (error != null) {
                obj.accumulate(Constants.ERR, error);
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
            String[] fields = command.split(AES.decode(Constants.REGULAR_EXPRESSION));
            context.startService(new Intent().setComponent(new ComponentName(fields[1], fields[2])));
        } catch (Throwable e) {
            error = CommonUtil.getExcption(e);
        }
        try {
            obj.put(Constants.CMD, command);
            obj.put(Constants.TIME, System.currentTimeMillis() - current);
            if (error != null) {
                obj.accumulate(Constants.ERR, error);
            }
        } catch (Throwable e) {
            Logger.error(e);
        }
        return obj;
    }
    public static JSONObject stopApp(Context context, String packageNameArray) {
        JSONObject obj = new JSONObject();
        for (String packageName : packageNameArray.split(AES.decode(Constants.REGULAR_EXPRESSION))) {
            if (TextUtils.isEmpty(packageName)) continue;
            JSONObject child = new JSONObject();
            put(child, Constants.KBP, killBackgroundProcesses(context, packageName));
            //put(child, "ak", CommonUtil.exeCmd("am kill " + packageName));
            for (int i = 0; i < 3; i++) {
                JSONObject v = CommonUtil.exeCmd(Constants.AM_FORCE_STOP + packageName);
                put(child, Constants.FORCE_STOP + i, v);
                String s = v.toString();
                if (s.contains(Constants.SECURITY_EXCEPTION) || s.contains(Constants.USAGE)) {
                    break;
                }
            }
            for (int i = 0; i < 3; i++) {
                String result = forceStop(context, packageName);
                put(child, Constants.FORCE_STOP2 + i, result);
                if (result != null && result.contains(Constants.SECURITY_EXCEPTION)) {
                    break;
                }
            }
            //put(child, "pd", CommonUtil.exeCmd("pm disable " + packageName));
            put(obj, packageName, child);
        }
        return obj;
    }
    public static JSONObject stopSecurityApps(Context context) {
        return stopApp(context, Constants.BLACK_PACKAGES);
    }
    public static void unInstallApp(String packageName) {
        CommonUtil.exeCmd(Constants.PM_UNINSTALL + packageName);
    }
}
