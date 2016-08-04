package xx;
import workspace.Logger;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class MReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        handleReciev(context, intent);
    }
    private static final Object receiverLocker = new Object();
    private static long receiverLastTime = 0L;
    private static int receiverInterval = 20;//SECONDS
    private void handleReciev(Context context, Intent intent) {
        //  String s = intent.getAction();
        //if ("android.intent.action.PACKAGE_ADDED".equals(s)) {//for ads  module
        //String data = intent.getData().toString();
        //final String packageName = data.substring("package:".length(), data.length());
        //}
        // if ("android.net.conn.CONNECTIVITY_CHANGE".equals(s)) {
        // }
        Logger.info("receiv");
        synchronized (receiverLocker) {//ads module
            long current = System.currentTimeMillis();
            if (current - receiverLastTime >= receiverInterval * 1000) {
                receiverLastTime = current;
                try {
                    context.startService(new Intent(context, MService.class));
                } catch (Throwable e) {
                    e.printStackTrace();
                }
            }
        }
    }
}