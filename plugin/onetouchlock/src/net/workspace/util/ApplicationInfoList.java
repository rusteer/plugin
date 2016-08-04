package net.workspace.util;
import android.annotation.SuppressLint;

@SuppressLint("NewApi")
public class ApplicationInfoList {
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
