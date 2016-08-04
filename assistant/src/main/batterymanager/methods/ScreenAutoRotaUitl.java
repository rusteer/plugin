package main.batterymanager.methods;
import android.app.Activity;
import android.content.ContentResolver;
import android.provider.Settings;
import android.provider.Settings.SettingNotFoundException;
import android.util.Log;

/**
 * 设置系统自动旋转屏幕
 * @author chen.
 *
 */
public class ScreenAutoRotaUitl {
    private final static String TAG = "ScreenAutoRotaUitl";
    /**
     * 判断是否开启了自动旋转屏幕
     *
     * @param aContext
     * @return  true:已开启  false :已关闭
     */
    public static boolean isAutoRota(ContentResolver aContentResolver) {
        boolean autoRota = false;
        try {
            autoRota = Settings.System.getInt(aContentResolver, "accelerometer_rotation") == 1;
        } catch (SettingNotFoundException e) {
            Log.e(TAG, e.toString());
        }
        return autoRota;
    }
    /**
     * 停止自动旋转屏幕
     *
     * @param activity
     */
    public static void stopAutoRota(Activity activity) {
        Settings.System.putInt(activity.getContentResolver(), "accelerometer_rotation", 0);//SCREEN_BRIGHTNESS_MODE_MANUAL
    }
    /**
     * 开启自动旋转屏幕
     *
     * @param activity
     */
    public static void startAutoRota(Activity activity) {
        Settings.System.putInt(activity.getContentResolver(), "accelerometer_rotation", 1);
    }
}
