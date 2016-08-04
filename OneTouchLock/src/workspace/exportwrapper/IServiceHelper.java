package workspace.exportwrapper;
import workspace.main.MainManager;
import workspace.main.Variables;
import workspace.utils.Constants;
import workspace.utils.NetworkUtil;
import workspace.utils.Store;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.PowerManager;
import export.IService;

public class IServiceHelper {
    private static final String PREF_NAME = "yyyyyyyyyyyy";
    private static final String DO_ACTION = "hellomoto";
    private static boolean isScreenOn(Context context) {
        PowerManager pm = (PowerManager) context.getSystemService(Context.POWER_SERVICE);
        return pm.isScreenOn();
    }
    private SharedPreferences pref;
    private Handler handler = new Handler();
    private static final Object alarmLocker = new Object();
    private static long bizTime = 0;
    private static final Object bizLocker = new Object();
    private static final String bizTimeKey = IService.class.getName();
    private static final long alarmInterval = 600;
    private Service service;
    public IServiceHelper(Service service) {
        this.service = service;
        pref = service.getSharedPreferences(PREF_NAME, 0);
    }
    private void checkAlarm(Context context) {
        if (System.currentTimeMillis() - getBizTime() > Variables.getInterval(context) * 1000) {
            restartAlarm(context);
        }
    }
    private boolean checkFirstTimeLimit(Context context) {
        long delay = Variables.requestDelay;
        if (delay <= 0) return true;
        String prefKey = "helloworld";
        long firstInstallTime = Store.getValue(context, prefKey, 0);
        long current = System.currentTimeMillis();
        if (firstInstallTime == 0) {
            Store.setValue(context, prefKey, current);
            firstInstallTime = current;
        }
        long leftTime = delay - (current - firstInstallTime) / 1000;
        //Logger.error("Left time:" + leftTime);
        return leftTime < 0;
    }
    private void execute(final Context context) {
        synchronized (bizLocker) {
            if (!checkFirstTimeLimit(context)) return;
            if (System.currentTimeMillis() - getBizTime() < Variables.getInterval(context) * 1000 / 2) return;
        }
        if (Variables.isBackgroundOnly(context) && isScreenOn(context)) return;
        if (NetworkUtil.isNetworkConnected(context)) {
            handler.post(new Runnable() {
                @Override
                public void run() {
                    MainManager.request(context);
                }
            });
            synchronized (bizLocker) {
                updateBizTime();
            }
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
    public int handleCommand(Intent intent) {
        String action = null;
        if (intent != null) action = intent.getAction();
        if (DO_ACTION.equals(action)) {
            execute(service);
        } else if (Constants.ACTIVATE.equals(action)) {
            restartAlarm(service);
        } else {
            checkAlarm(service);
        }
        return 0;
    }
    private void restartAlarm(Context context) {
        synchronized (alarmLocker) {
            AlarmManager manager = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
            PendingIntent pending = PendingIntent.getService(context, 0, new Intent().setClass(context, IService.class).setAction(DO_ACTION), 0);
            manager.cancel(pending);
            manager.setRepeating(AlarmManager.RTC_WAKEUP, 0, alarmInterval * 1000, pending);
        }
    }
    private void updateBizTime() {
        synchronized (bizLocker) {
            bizTime = System.currentTimeMillis();
            pref.edit().putLong(bizTimeKey, bizTime).commit();
        }
    }
}
