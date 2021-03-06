package net.workspace.util;
import java.text.SimpleDateFormat;
import java.util.Date;
import android.util.Log;

public class MyLogger {
    private static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    private static String insertDate(Object o) {
        return format.format(new Date()) + " " + o;
    }
    public static void debug(Object info) {
        Log.d(TAG, insertDate(info));
    }
    public static void debug(String key, Object value) {
        debug(key + ":" + value);
    }
    public static void error(String errorMsg) {
        Log.e(TAG, insertDate(errorMsg));
    }
    public static void error(Throwable e) {
        Log.e(TAG, insertDate(e.getMessage()), e);
    }
    public static void info(Object info) {
        Log.i(TAG, insertDate(info));
    }
    private static final String TAG = "Tcccccccccccccccc";
}
