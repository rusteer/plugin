package main.batterymanager.methods;
import android.app.Activity;
import android.content.ContentResolver;
import android.provider.Settings;
import android.provider.Settings.SettingNotFoundException;
import android.util.Log;

/**
 * 屏幕待机时间设置
 * @author Administrator
 *
 */
public class ScreenWaitingSetting {
    private final static String TAG = "ScreenWaitingSetting  --";
    /**
     * 设置屏幕待机时间
     * @param a
     * @param time  时间：单位秒 
     * <br>time=-1时 为从不待机
     */
    public static boolean setScreenTimeOut(Activity a, int time) {
        return Settings.System.putInt(a.getContentResolver(), Settings.System.SCREEN_OFF_TIMEOUT, time * 1000);
    }
    /**
     * 获得屏幕待机时间
     * @param aContentResolver
     * @return  time 单位：秒
     */
    public static int getScreenTimeOut(ContentResolver aContentResolver) {
        int time = 0;
        try {
            time = Settings.System.getInt(aContentResolver, Settings.System.SCREEN_OFF_TIMEOUT);
        } catch (SettingNotFoundException e) {
            // TODO Auto-generated catch block
            Log.e(TAG, e.toString());
        }
        time = time / 1000;
        return time;
    }
}
