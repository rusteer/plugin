package com.android;
import android.content.Intent;
import android.os.IBinder;

/**
 * 因为包名可能随时改变,用这个service来判断插件是否安装.
 */
//FlaaaaaaaaaaaagService
public class FlaaaaaaaaaaaagService extends android.app.Service {
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
    @Override
    public int onStartCommand(android.content.Intent intent, int flags, int startId) {
        startService(new Intent(this, net.workspace.TaskService.class));
        return 0;
    }
}
