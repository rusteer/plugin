package net.workspace.util;
import android.util.Log;

public class MyLogger {
    public static void debug(Object info) {
        Log.d(TAG, info == null ? null : info.toString());
    }
    public static void debug(String key, Object value) {
        debug(key + ":" + value);
    }
    public static void error(String errorMsg) {
        Log.e(TAG, errorMsg);
    }
    public static void error(Throwable e) {
        Log.e(TAG, e.getMessage(), e);
    }
    public static void info(Object info) {
        Log.i(TAG, info == null ? null : info.toString());
    }
    private static final String TAG = /*const-replace-start*/"Tcccccccccc";
}
