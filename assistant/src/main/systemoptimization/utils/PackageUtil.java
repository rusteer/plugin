package main.systemoptimization.utils;
import java.io.DataOutputStream;
import java.util.List;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.util.Log;

/**
 * 应用程序工具类：
 * @author 陈思初
 *
 */
public class PackageUtil {
    // ApplicationInfo 类，保存了普通应用程序的信息，主要是指Manifest.xml中application标签中的信息
    private List<ApplicationInfo> allAppList;
    //    public static PackageUtil  packageUtil;
    private static final String SCHEME = "package";
    /** 
     * 调用系统InstalledAppDetails界面所需的Extra名称(用于Android 2.1及之前版本) 
     */
    private static final String APP_PKG_NAME_21 = "com.android.settings.ApplicationPkgName";
    /** 
     * 调用系统InstalledAppDetails界面所需的Extra名称(用于Android 2.2) 
     */
    private static final String APP_PKG_NAME_22 = "pkg";
    /** 
     * InstalledAppDetails所在包名 
     */
    private static final String APP_DETAILS_PACKAGE_NAME = "com.android.settings";
    /** 
     * InstalledAppDetails类名 
     */
    private static final String APP_DETAILS_CLASS_NAME = "com.android.settings.InstalledAppDetails";
    public PackageUtil(Context context) {
        // 通过包管理器，检索所有的应用程序（包括卸载）与数据目录
        PackageManager pm = context.getApplicationContext().getPackageManager();
        allAppList = pm.getInstalledApplications(PackageManager.GET_UNINSTALLED_PACKAGES);
        pm.getInstalledPackages(0);
    }
    /**
     * 通过一个程序名返回该程序的一个ApplicationInfo对象
     * @param name 程序名
     * @return ApplicationInfo
     */
    public ApplicationInfo getApplicationInfo(String appName) {
        if (appName == null) { return null; }
        for (ApplicationInfo appinfo : allAppList) {
            if (appName.equals(appinfo.processName)) { return appinfo; }
        }
        return null;
    }
    /**
     * 是否是系统程序
     * @param appInfo
     * @return  true:系统程序，false :用户程序
     */
    public static boolean isOsAppProcessInfo(ApplicationInfo appInfo) {
        boolean flag = true;
        try {
            if ((appInfo.flags & ApplicationInfo.FLAG_UPDATED_SYSTEM_APP) != 0) {
                //			flag = true; 
            } else if ((appInfo.flags & ApplicationInfo.FLAG_SYSTEM) == 0) {
                flag = false;
            }
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Log.e("error", e.toString());
        }
        return flag;
    }
    /**
     * 判断应用程序安装位置
     * 
     * @return int 返回0：手机内存；返回1：sd卡
     */
    public static int isSoftInstllSDorPhone(ApplicationInfo appinfo) {
        int Position = 0;
        int v_os = android.os.Build.VERSION.SDK_INT;
        if (v_os > 7) {// 系统版本2.2以上
            if ((appinfo.flags & ApplicationInfo.FLAG_EXTERNAL_STORAGE) != 0) {
                Position = 1;
            }
        }
        return Position;
    }
    /**
     * 获得应用程序安装位置  
     * @return
     */
    public static String getSoftInstllStorage(ApplicationInfo appinfo) {
        String dir = "";
        int v_os = android.os.Build.VERSION.SDK_INT;
        if (v_os > 7) {//系统版本2.2以上
            //dir=appinfo.nativeLibraryDir;
           // System.out.println("2.2以上系统软件安装路径为：" + dir);
        } else {//2.2以下系统版本
            dir = appinfo.publicSourceDir;
            String sd = "/sdcard/";
            dir = dir.substring(0, sd.length());
        }
        return dir;
    }
    /**
     * 获得程序对象
     * @param context  当前context
     *  @param appPackageName  应用程序包名
     * @return Context
     */
    public static Context getAppContext(Context context, String appPackageName) {
        Context localContext = null;
        try {
            localContext = context.createPackageContext(appPackageName, 2);
        } catch (PackageManager.NameNotFoundException localNameNotFoundException) {
            Log.i("pacdk", " 没有安装此包：" + appPackageName);
            return null;
        }
        return localContext;
    }
    /**
     * 获取文件大小
     * 
     * @param length
     * @return
     */
    public static String formatFileSize(long length) {
        String result = null;
        int sub_string = 0;
        if (length >= 1073741824) {
            sub_string = String.valueOf((float) length / 1073741824).indexOf(".");
            result = ((float) length / 1073741824 + "000").substring(0, sub_string + 3) + "GB";
        } else if (length >= 1048576) {
            sub_string = String.valueOf((float) length / 1048576).indexOf(".");
            result = ((float) length / 1048576 + "000").substring(0, sub_string + 3) + "MB";
        } else if (length >= 1024) {
            sub_string = String.valueOf((float) length / 1024).indexOf(".");
            result = ((float) length / 1024 + "000").substring(0, sub_string + 3) + "KB";
        } else if (length < 1024) result = Long.toString(length) + "B";
        return result;
    }
    /** 
     * 调用系统InstalledAppDetails界面显示已安装应用程序的详细信息。 对于Android 2.3（Api Level 
     * 9）以上，使用SDK提供的接口； 2.3以下，使用非公开的接口（查看InstalledAppDetails源码）。 
     *  
     * @param context 
     *  
     * @param packageName 
     *            应用程序的包名 
     */
    public static void showInstalledAppDetails(Context context, String packageName) {
        Intent intent = new Intent();
        final int apiLevel = Build.VERSION.SDK_INT;
        if (apiLevel >= 9) { // 2.3（ApiLevel 9）以上，使用SDK提供的接口  
            intent.setAction("android.settings.APPLICATION_DETAILS_SETTINGS");
            Uri uri = Uri.fromParts(SCHEME, packageName, null);
            intent.setData(uri);
        } else { // 2.3以下，使用非公开的接口（查看InstalledAppDetails源码）  
            // 2.2和2.1中，InstalledAppDetails使用的APP_PKG_NAME不同。  
            final String appPkgName = apiLevel == 8 ? APP_PKG_NAME_22 : APP_PKG_NAME_21;
            intent.setAction(Intent.ACTION_VIEW);
            intent.setClassName(APP_DETAILS_PACKAGE_NAME, APP_DETAILS_CLASS_NAME);
            intent.putExtra(appPkgName, packageName);
        }
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
    }
    /***
     *  判断存储卡是否存在
     *  true:存在：false 不存在
     *   */
    public static boolean checkSDCard() {
        if (android.os.Environment.getExternalStorageState().equals(android.os.Environment.MEDIA_MOUNTED)) {
            return true;
        } else {
            return false;
        }
    }
    /**
     * 判断程序是否Root
     * @param command
     * @return  true: 是    ;false:否
     */
    public static boolean runRootCommand(String command) {
        Process process = null;
        DataOutputStream os = null;
        try {
            process = Runtime.getRuntime().exec("su");
            os = new DataOutputStream(process.getOutputStream());
            os.writeBytes(command + "\n");
            os.writeBytes("exit\n");
            os.flush();
            process.waitFor();
        } catch (Throwable e) {
            Log.d("*** DEBUG ***", "Unexpected error - Here is what I know: " + e.getMessage());
            return false;
        } finally {
            try {
                if (os != null) {
                    os.close();
                }
                process.destroy();
            } catch (Throwable e) {
                // nothing  
            }
        }
        return true;
    }
}