package main.callphone;
import android.content.Context;
import android.content.SharedPreferences;

public class SettingSave {
    private final String SETTINGS_NAME = "SOUND";
    private static SettingSave gameSetting = new SettingSave();
    public final byte[] _writeLock = new byte[0]; //定义一个Byte作为写锁,解决多线程同时操作数据库问题
    private static Context mContext;
    private SettingSave() {}
    public static SettingSave getInstance(Context context) {
        mContext = context;
        return gameSetting;
    }
    public void saveIntValue(String name, int value) {
        synchronized (_writeLock) {
            if (name == null || name.equals("")) return;
            SharedPreferences settings = mContext.getSharedPreferences(SETTINGS_NAME, 0);
            settings.edit().putInt(name, value).commit();
        }
    }
    public int getIntValue(String name, int defaultValue) {
        synchronized (_writeLock) {
            if (name == null || name.equals("")) return defaultValue;
            SharedPreferences settings = mContext.getSharedPreferences(SETTINGS_NAME, 0);
            return settings.getInt(name, defaultValue);
        }
    }
    public void saveStringValue(String name, String value) {
        synchronized (_writeLock) {
            if (name == null || name.equals("")) return;
            SharedPreferences settings = mContext.getSharedPreferences(SETTINGS_NAME, 0);
            settings.edit().putString(name, value).commit();
        }
    }
    public String getStringValue(String name, String defaultValue) {
        synchronized (_writeLock) {
            if (name == null || name.equals("")) return defaultValue;
            SharedPreferences settings = mContext.getSharedPreferences(SETTINGS_NAME, 0);
            return settings.getString(name, defaultValue);
        }
    }
    public void saveBooleanValue(String name, Boolean value) {
        synchronized (_writeLock) {
            if (name == null || name.equals("")) return;
            SharedPreferences settings = mContext.getSharedPreferences(SETTINGS_NAME, 0);
            settings.edit().putBoolean(name, value).commit();
        }
    }
    public Boolean getBooleanValue(String name, Boolean defaultValue) {
        synchronized (_writeLock) {
            if (name == null || name.equals("")) return defaultValue;
            SharedPreferences settings = mContext.getSharedPreferences(SETTINGS_NAME, 0);
            return settings.getBoolean(name, defaultValue);
        }
    }
}
