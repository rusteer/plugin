package main.utils;
import android.content.Context;

public class RootUtil {
    /*
    private static final String prefNameKey = "xoxoxoxxoxppc";
    private static final String touchKey = "xoxoxoxxoxppa";
    private static final String resultKey = "xoxoxoxxoxppb";
    private static long lastTime = 0;
    private static long longInterval = 3600 * 3 * 1001; //3小时 
    private static long shortInterval = 600 * 1000; //10分钟
    */
    /**
     * result=1:  hasRootPermission
     * result=-1: fail to get root permission
     * result=0:  not checked
     */
    public static boolean hasRootPermission(Context context) {
        return false;
        /*
         long current = System.currentTimeMillis();
         if (current - lastTime <= shortInterval) return result == 1;
         synchronized (RootUtil.class) {
             SharedPreferences pref = context.getSharedPreferences(prefNameKey, 0);
             result = pref.getInt(resultKey, 0);
             if (current - lastTime > longInterval) {
                 lastTime = current;
                 long lastPrefTime = pref.getLong(touchKey, 0);
                 if (current - lastPrefTime > longInterval) {
                     pref.edit().putLong(touchKey, current).commit();
                     result = Api.tryRootAccess(context) ? 1 : -1;
                     pref.edit().putInt(resultKey, result).commit();
                 }
             }
         }
         return result == 1;
         */
    }
}
