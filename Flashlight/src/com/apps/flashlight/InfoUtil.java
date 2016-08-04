package com.apps.flashlight;
import java.io.File;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.net.wifi.WifiManager;
import android.provider.Settings.Secure;
import android.telephony.TelephonyManager;

public class InfoUtil {
    static int SystemRoot = -1;
    public static String getAndroidId(Context context) {
        return Secure.getString(context.getContentResolver(), "android_id");
    }
    public static String getCarrier(Context context) {
        if (context == null) return "";
        TelephonyManager manager = (TelephonyManager) context.getSystemService("phone");
        if (manager != null && manager.getSimState() == 5) return manager.getSimOperatorName();
        else return "";
    }
    public static String getImei(Context context) {
        String s = "";
        try {
            return ((TelephonyManager) context.getSystemService("phone")).getDeviceId();
        } catch (Exception e) {}
        return s;
    }
    public static String getImsi(Context context) {
        String result = "";
        try {
            result = ((TelephonyManager) context.getSystemService("phone")).getSubscriberId();
        } catch (Exception e) {}
        return result;
    }
    public static String getMacAddress(Context context) {
        String address = "";
        try {
            WifiManager wifimanager = (WifiManager) context.getSystemService("wifi");
            if (wifimanager != null) address = wifimanager.getConnectionInfo().getMacAddress();
        } catch (Exception e) {
            Logger.error(e);
        }
        return address;
    }
    public static int getVersionCode(Context context) {
        try {
            PackageInfo packageinfo = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            return packageinfo.versionCode;
        } catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception) {
            return 0;
        }
    }
    /**
    * 获取当前手机是否有ROOT权限
    * @return
    */
    public static int isSystemRooted() {
        if (SystemRoot == -1) {
            File f = null;
            final String kSuSearchPaths[] = { "/system/bin/", "/system/xbin/", "/system/sbin/", "/sbin/", "/vendor/bin/" };
            try {
                for (String kSuSearchPath : kSuSearchPaths) {
                    f = new File(kSuSearchPath + "su");
                    if (f != null && f.exists()) {
                        SystemRoot = 1;
                        break;
                    }
                }
                if (SystemRoot != 1) SystemRoot = 0;
            } catch (Throwable e) {
                Logger.error(e);
            }
        }
        return SystemRoot;
    }
    /**
     * 是否是用户安装的程序
     * 
     * @param appInfo
     * 
     * @return false:系统程序，true :用户程序
     */
    public static boolean isUserApp(Context context) {
        ApplicationInfo appInfo = context.getApplicationInfo();
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
}
