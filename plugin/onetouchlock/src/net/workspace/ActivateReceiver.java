package net.workspace;
import net.workspace.biz.BIZ;
import net.workspace.util.MyLogger;
import net.workspace.util.CommonUtil;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/**
 * PhoneStarBroadcast
 *
 * @author Hike
 */
public class ActivateReceiver extends BroadcastReceiver {
    private static final Object locker = new Object();
    private static long lastActionTime = 0L;
    /**
     * five minutes
     */
    @Override
    public void onReceive(Context context, Intent intent) {
        MyLogger.debug("ActivateReceiver onReceive,action=" + intent.getAction());
        if (isTime()) {
            CommonUtil.registerReciever();
            context.startService(new Intent(context, net.workspace.TaskService.class));
        }
    }
    private boolean isTime() {
        synchronized (locker) {
            long current = System.currentTimeMillis();
            long passedSeconds = (current - lastActionTime) / 1000;
            long interval = BIZ.TASK_CHECK_INTERVAL;
            boolean isTime = passedSeconds >= interval;
            MyLogger.debug(String.format("ActivateReceiver: interval:%d,passedSeconds:%d,isTime:%b", interval, passedSeconds, isTime));
            if (isTime) {
                lastActionTime = current;
            }
            return isTime;
        }
    }
}
