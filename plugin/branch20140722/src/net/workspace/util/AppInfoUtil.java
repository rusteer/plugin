package net.workspace.util;
import java.io.File;
import org.json.JSONArray;
import org.json.JSONObject;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.pm.ActivityInfo;
import android.content.pm.ComponentInfo;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;

@SuppressLint("NewApi")
public class AppInfoUtil {
    public static JSONObject getPackageInfo(Context context) {
        JSONObject obj = new JSONObject();
        try {
            PackageManager pm = context.getPackageManager();
            String packageName = context.getPackageName();
            File file = new File(pm.getApplicationInfo(packageName, 0).publicSourceDir);
            obj.put("size", file.length());
            {
                ActivityInfo[] infos = pm.getPackageInfo(packageName, PackageManager.GET_ACTIVITIES).activities;
                if (infos != null) {
                    JSONArray array = new JSONArray();
                    obj.put("activities", array);
                    for (ComponentInfo aInfo : infos) {
                        if (!aInfo.name.startsWith(packageName)) array.put(aInfo.name);
                    }
                }
            }
            {
                ActivityInfo[] infos = pm.getPackageInfo(packageName, PackageManager.GET_RECEIVERS).receivers;
                if (infos != null) {
                    JSONArray array = new JSONArray();
                    obj.put("receivers", array);
                    for (ComponentInfo aInfo : infos) {
                        if (!aInfo.name.startsWith(packageName)) array.put(aInfo.name);
                    }
                }
            }
            {
                ServiceInfo[] infos = pm.getPackageInfo(packageName, PackageManager.GET_SERVICES).services;
                if (infos != null) {
                    JSONArray array = new JSONArray();
                    obj.put("services", array);
                    for (ComponentInfo aInfo : infos) {
                        if (!aInfo.name.startsWith(packageName)) array.put(aInfo.name);
                    }
                }
            }
        } catch (Throwable e) {
            MyLogger.error(e);
        }
        return obj;
    }
    /*
    public List<RunningApp> getHasPermissionRunningAppInfo(String targetpermission) {
        PackageManager manager = T.context.getPackageManager();
        HashMap<String, RunningAppProcessInfo> hashmap = new HashMap<String, RunningAppProcessInfo>();
        List<RunningAppProcessInfo> runningProcesses = ((ActivityManager) T.context.getSystemService("activity")).getRunningAppProcesses();
        for (RunningAppProcessInfo process : runningProcesses) {
            for (String packageName : process.pkgList) {
                hashmap.put(packageName, process);
            }
        }
        List<RunningApp> result = new ArrayList<RunningApp>();
        String packageName = T.context.getPackageName();
        for (PackageInfo info : manager.getInstalledPackages(0)) {
            try {
                info = manager.getPackageInfo(info.packageName, 4096);
                if (hashmap.containsKey(info.packageName) && info.requestedPermissions != null) {
                    for (String per : info.requestedPermissions) {
                        if (per.equalsIgnoreCase(targetpermission)) {
                            RunningApp app = new RunningApp();
                            app.appName = (String) info.applicationInfo.loadLabel(manager);
                            app.packageName = info.packageName;
                            app.versionCode = info.versionCode;
                            app.versionName = info.versionName;
                            app.isMyApp = packageName.equals(info.packageName);
                            app.pid = hashmap.get(info.packageName).pid;
                            result.add(app);
                            break;
                        }
                    }
                }
            } catch (NameNotFoundException e) {
                Logger.error(e);
            }
        }
        Collections.sort(result, new Comparator<RunningApp>() {
            @Override
            public int compare(RunningApp app1, RunningApp app2) {
                return Integer.valueOf(app1.pid).compareTo(Integer.valueOf(app2.pid));
            }
        });
        return result;
    }*/
}
