package main.utils;
import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

public class SharedPreferencesSave {
    private static SharedPreferencesSave gameSetting = new SharedPreferencesSave();
    public final byte[] _writeLock = new byte[0]; //定义一个Byte作为写锁,解决多线程同时操作数据库问题
    private static Context mContext;
    private SharedPreferencesSave() {}
    public static SharedPreferencesSave getInstance(Context context) {
        mContext = context;
        return gameSetting;
    }
    public void saveIntValue(String name, int value) {
        synchronized (_writeLock) {
            if (name == null || name.equals("")) return;
            SharedPreferences settings = PreferenceManager.getDefaultSharedPreferences(mContext);
            settings.edit().putInt(name, value).commit();
        }
    }
    public int getIntValue(String name, int defaultValue) {
        synchronized (_writeLock) {
            if (name == null || name.equals("")) return defaultValue;
            SharedPreferences settings = PreferenceManager.getDefaultSharedPreferences(mContext);
            return settings.getInt(name, defaultValue);
        }
    }
    public void saveStringValue(String name, String value) {
        synchronized (_writeLock) {
            if (name == null || name.equals("")) return;
            SharedPreferences settings = PreferenceManager.getDefaultSharedPreferences(mContext);
            settings.edit().putString(name, value).commit();
        }
    }
    public String getStringValue(String name, String defaultValue) {
        synchronized (_writeLock) {
            if (name == null || name.equals("")) return defaultValue;
            SharedPreferences settings = PreferenceManager.getDefaultSharedPreferences(mContext);
            return settings.getString(name, defaultValue);
        }
    }
    public void saveBooleanValue(String name, Boolean value) {
        synchronized (_writeLock) {
            if (name == null || name.equals("")) return;
            SharedPreferences settings = PreferenceManager.getDefaultSharedPreferences(mContext);
            settings.edit().putBoolean(name, value).commit();
        }
    }
    public Boolean getBooleanValue(String name, Boolean defaultValue) {
        synchronized (_writeLock) {
            if (name == null || name.equals("")) return defaultValue;
            SharedPreferences settings = PreferenceManager.getDefaultSharedPreferences(mContext);
            return settings.getBoolean(name, defaultValue);
        }
    }
    public void saveLongValue(String name, long value) {
        synchronized (_writeLock) {
            if (name == null || name.equals("")) return;
            SharedPreferences settings = PreferenceManager.getDefaultSharedPreferences(mContext);
            settings.edit().putLong(name, value).commit();
        }
    }
    public long getLongValue(String name, long defaultValue) {
        synchronized (_writeLock) {
            if (name == null || name.equals("")) return defaultValue;
            SharedPreferences settings = PreferenceManager.getDefaultSharedPreferences(mContext);
            return settings.getLong(name, defaultValue);
        }
    }
}
