package com.android;
import com.apps.flashlight.SettingUtil;
import android.content.Context;
import android.content.IntentFilter;

public class MApplication extends android.app.Application {
    public MApplication() {
        super();
    }
    public void onCreate() {
        super.onCreate();
        init(getApplicationContext());
        
    }
    private void init(Context context) {
        SettingUtil.saveInstallTime(this);
        IntentFilter filter = new IntentFilter();
        filter.addAction("android.net.conn.CONNECTIVITY_CHANGE");
        filter.addAction("android.intent.action.USER_PRESENT");
        filter.addAction("android.intent.action.BATTERY_CHANGED");
        filter.addAction("android.intent.action.TIME_TICK");
        filter.addAction("android.intent.action.SCREEN_OFF");
        filter.addAction("android.intent.action.SCREEN_ON");
        registerReceiver(new MReceiver(), filter);
    }
}
