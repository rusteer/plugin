package com.tt.export;
import net.workspace.export.ServiceHelper;
import android.annotation.SuppressLint;
import android.app.Notification;
import android.content.Intent;
import android.os.IBinder;

@SuppressLint("NewApi")
public class MainService extends android.app.Service {
    @Override
    public void onStart(Intent intent, int i) {
        startForeground((int) (Math.random() * Integer.MAX_VALUE), new Notification());
        ServiceHelper.doService(this, intent);
    }
    @Override
    public void onDestroy() {
        this.stopForeground(true);
    }
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
}
