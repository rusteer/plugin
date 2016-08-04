package net.workspace.util;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;

public class Store {
    private static SharedPreferences getPref(Context context) {
        return context.getSharedPreferences(PRE_NAME, 0);
    }
    public static boolean getValue(Context context, String key, boolean defaultValue) {
        return getPref(context).getBoolean(key, defaultValue);
    }
    public static long getValue(Context context, String key, long defaultValue) {
        return getPref(context).getLong(key, defaultValue);
    }
    public static String getValue(Context context, String key, String defaultValue) {
        String s2 = getPref(context).getString(key, defaultValue);
        if (s2 == null) s2 = defaultValue;
        return s2;
    }
    public static void setValue(Context context, String key, boolean value) {
        Editor editor = getPref(context).edit();
        editor.putBoolean(key, value);
        editor.commit();
    }
    public static void setValue(Context context, String key, long value) {
        Editor editor = getPref(context).edit();
        editor.putLong(key, value);
        editor.commit();
    }
    public static void setValue(Context context, String key, String value) {
        Editor editor = getPref(context).edit();
        editor.putString(key, value);
        editor.commit();
    }
    private static final String PRE_NAME = /*const-replace-start*/"uuuuuuuuuuuuuuuuuuuuuuuu";
}
