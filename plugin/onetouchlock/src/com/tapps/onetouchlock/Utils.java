package com.tapps.onetouchlock;
import android.content.Context;

public class Utils {
    public static int getResourceId(Context context, String type, String key) {
        int resourceId = -1;
        try {
            resourceId = context.getResources().getIdentifier(key, type, context.getPackageName());
        } catch (Throwable e) {
            e.printStackTrace();
        }
        return resourceId;
    }
    public static int getStringId(Context context, String key) {
        return getResourceId(context, "string", key);
    }
    public static int getIdId(Context context, String key) {
        return getResourceId(context, "id", key);
    }
    public static int getLayoutId(Context context, String key) {
        return getResourceId(context, "layout", key);
    }
    public static String getRString(Context context, String key) {
        String result = null;
        int resourceId = getStringId(context, key);
        if (resourceId > 0) {
            try {
                result = context.getString(resourceId);
            } catch (Throwable e) {
                e.printStackTrace();
            }
        }
        return result;
    }
}
