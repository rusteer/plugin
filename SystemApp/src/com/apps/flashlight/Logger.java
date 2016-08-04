package com.apps.flashlight;
import android.util.Log;

public class Logger {
    private static final String TAG = "Proj";
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
}
