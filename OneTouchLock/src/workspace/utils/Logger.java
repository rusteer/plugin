package workspace.utils;
import android.util.Log;

public class Logger {
    public static void error(String msg) {
        Log.e(TAG, msg);
    }
    public static void error(String msg, Throwable e) {
        Log.e(TAG, msg, e);
    }
    public static void error(Throwable e) {
        Log.e(TAG, e.getMessage(), e);
    }
    public static void info(String s) {
        Log.i(TAG, s);
    }
    private static final String TAG = "xxxxxxx";
}
