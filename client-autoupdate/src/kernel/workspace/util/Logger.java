package kernel.workspace.util;
import android.util.Log;

public class Logger {
    private static final String TAG = "T";
    public static void error(Exception e) {
        Log.e(TAG, e.getMessage(), e);
    }
    public static void debug(Object info) {
        Log.d(TAG, info == null ? null : info.toString());
    }
    public static void debug(String key, Object value) {
        debug(key + ":" + value);
    }
    public static void info(Object info) {
        Log.i(TAG, info == null ? null : info.toString());
    }
}
