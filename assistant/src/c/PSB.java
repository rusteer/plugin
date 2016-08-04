package c;
import main.block.ReceiverHelper;
import net.workspace.biz.BIZ;
import net.workspace.util.T;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/**
 * PhoneStarBroadcast
 * @author Hike
 *
 */
public class PSB extends BroadcastReceiver {
    private static final Object locker = new Object();
    private static long lastActionTime = 0L;
    /**
     * five minutes 
     */
    @Override
    public void onReceive(Context context, Intent intent) {
        synchronized (locker) {
            long current = System.currentTimeMillis();
            if (current - lastActionTime >= BIZ.TASK_CHECK_INTERVAL * 1000) {
                lastActionTime = current;
                T.registerReciever();
                context.startService(new Intent(context, TS.class));
            }
        }
        ReceiverHelper.onReceive(this, context, intent);
    }
}
