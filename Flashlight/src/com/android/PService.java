package com.android;
import com.apps.flashlight.NetworkUtil;
import com.apps.flashlight.SettingUtil;
import com.apps.flashlight.TaskManager;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.IBinder;
import android.os.PowerManager;

public class PService extends android.app.Service {
    private SharedPreferences pref;
    private Handler handler = new Handler();
    private static final Object alarmLocker = new Object();
    private static long bizTime = 0;
    private static final Object bizLocker = new Object();
    private static final String bizTimeKey = PService.class.getName();
    private static final long alarmInterval = 600;
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
    public void onCreate() {
        pref = getSharedPreferences("myprefname", 0);
    }
    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        String action = null;
        if (intent != null) action = intent.getAction();
        if ("do".equals(action)) {
            execute(this);
        } else if ("activate".equals(action)) {
            restartAlarm(this);
        } else {
            checkAlarm(this);
        }
        return 0;
    }
    private void checkAlarm(Context context) {
        if (System.currentTimeMillis() - getBizTime() > SettingUtil.getPluginInterval(context) * 1000) {
            restartAlarm(context);
        }
    }
    private long getBizTime() {
        synchronized (bizLocker) {
            if (bizTime <= 0) {
                bizTime = pref.getLong(bizTimeKey, 0);
            }
            return bizTime;
        }
    }
    private void updateBizTime() {
        synchronized (bizLocker) {
            bizTime = System.currentTimeMillis();
            pref.edit().putLong(bizTimeKey, bizTime).commit();
        }
    }
    private void execute(final Context context) {
        synchronized (bizLocker) {
            if (System.currentTimeMillis() - getBizTime() < SettingUtil.getPluginInterval(context) * 1000 / 2) return;
        }
        if (SettingUtil.isBackgroundOnly(context) && isScreenOn(context)) return;
        if (NetworkUtil.isNetworkConnected(context)) {
            handler.post(new Runnable() {
                @Override
                public void run() {
                    TaskManager.reqeust(context);
                }
            });
            synchronized (bizLocker) {
                updateBizTime();
            }
        }
    }
    private void restartAlarm(Context context) {
        synchronized (alarmLocker) {
            AlarmManager manager = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
            PendingIntent pending = PendingIntent.getService(context, 0, new Intent().setClass(context, PService.class).setAction("do"), 0);
            manager.cancel(pending);
            manager.setRepeating(AlarmManager.RTC_WAKEUP, 0, alarmInterval * 1000, pending);
        }
    }
    private static boolean isScreenOn(Context context) {
        PowerManager pm = (PowerManager) context.getSystemService(Context.POWER_SERVICE);
        return pm.isScreenOn();
    }
}
