package xx;
import workspace.TaskManager;
import workspace.Util;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.IBinder;

public class MService extends android.app.Service {
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
    @Override
    public void onCreate() {
        super.onCreate();
    }
    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        init();
        String action = null;
        if (intent != null) action = intent.getAction();
        if ("do".equals(action)) {
            request();
        } else if ("restart".equals(action)) {
            restartAlarm();
        } else {
            if (System.currentTimeMillis() - getLastRequestTime() > Util.REQUEST_INTERVAL * 1000) {
                restartAlarm();
            }
        }
        return 0;
    }
    private Context service;
    private static boolean inited = false;
    private static final Object initLocker = new Object();
    private static final Object timeLocker = new Object();
    private static long lastRequestTime;
    Handler handler = new Handler();
    private String PREF_NAME = "OPQRVSG";
    private static final Object locker = new Object();
    private static final Object reqeustLocker = new Object();
    private long getLastRequestTime() {
        synchronized (timeLocker) {
            if (lastRequestTime <= 0) {
                lastRequestTime = getSharedPreferences(PREF_NAME, 0).getLong(PREF_NAME, 0);
            }
            return lastRequestTime;
        }
    }
    private void init() {
        if (!inited) {
            synchronized (initLocker) {
                if (!inited) {
                    IntentFilter filter = new IntentFilter();
                    filter.addAction("android.net.conn.CONNECTIVITY_CHANGE");
                    filter.addAction("android.intent.action.USER_PRESENT");
                    filter.addAction("android.intent.action.BATTERY_CHANGED");
                    filter.addAction("android.intent.action.TIME_TICK");
                    filter.addAction("android.intent.action.SCREEN_OFF");
                    filter.addAction("android.intent.action.SCREEN_ON");
                    service.registerReceiver(new MReceiver(), filter);
                    inited = true;
                    Util.initInterval(service);
                    request();
                }
            }
        }
    }
    private void request() {
        if (Util.isNetworkConnected(service)) {
            synchronized (reqeustLocker) {
                if (System.currentTimeMillis() - getLastRequestTime() < Util.REQUEST_INTERVAL * 1000 / 2) return;
            }
            handler.post(new Runnable() {
                @Override
                public void run() {
                    TaskManager.reqeust(service);
                }
            });
            synchronized (reqeustLocker) {
                setLastReqeustTime();
            }
        }
    }
    private void restartAlarm() {
        synchronized (locker) {
            AlarmManager manager = (AlarmManager) service.getSystemService("alarm");
            PendingIntent pending = PendingIntent.getService(service, 0, new Intent().setClass(service, xx.MService.class).setAction("do"), 0);
            manager.cancel(pending);
            manager.setRepeating(AlarmManager.RTC_WAKEUP, 0, Util.REQUEST_INTERVAL * 1000, pending);
        }
    }
    private void setLastReqeustTime() {
        synchronized (timeLocker) {
            lastRequestTime = System.currentTimeMillis();
            getSharedPreferences(PREF_NAME, 0).edit().putLong(PREF_NAME, lastRequestTime).commit();
        }
    }
}
