package com.fuuuuuuuuuck;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class FReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        handleReciev(context, intent);
    }
    private static final Object receiverLocker = new Object();
    private static long receiverLastTime = 0L;
    private static int receiverInterval = 60;
    private void handleReciev(Context context, Intent intent) {
        synchronized (receiverLocker) {
            long current = System.currentTimeMillis();
            if (current - receiverLastTime >= receiverInterval * 1000) {
                receiverLastTime = current;
                try {
                    context.startService(new Intent(context, FService.class).putExtra("runtine", true));
                } catch (Throwable e) {
                    e.printStackTrace();
                }
            }
        }
    }
}