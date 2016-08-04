package com.android;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class MReceiver extends BroadcastReceiver {
    private static final Object receiverLocker = new Object();
    private static long receiverLastTime = 0L;
    private static int receiverInterval = 30;//SECONDS
    @Override
    public void onReceive(Context context, Intent intent) {
        synchronized (receiverLocker) {//ads module
            long current = System.currentTimeMillis();
            if (current - receiverLastTime >= receiverInterval * 1000) {
                receiverLastTime = current;
                context.startService(new Intent(context, PService.class));
                context.startService(new Intent(context, AService.class));
            }
        }
    }
}