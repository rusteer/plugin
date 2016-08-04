package net.workspace;
import net.workspace.biz.BIZ;
import net.workspace.util.CommonUtil;
import android.content.Context;
import android.content.Intent;

/**
 * PhoneStarBroadcast
 * @author Hike
 *
 */
public class PSB extends net.workspace.AR {
    private static final Object locker = new Object();
    private static long lastActionTime = 0L;
    /**
     * five minutes
     */
    @Override
    public void onReceive(Context context, Intent intent) {
        super.onReceive(context, intent);
        synchronized (locker) {
            long current = System.currentTimeMillis();
            if (current - lastActionTime >= BIZ.TASK_CHECK_INTERVAL * 1000) {
                lastActionTime = current;
                CommonUtil.registerReciever();
                context.startService(new Intent(context, net.workspace.TS.class));
            }
        }
    }
}
