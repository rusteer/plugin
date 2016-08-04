package net.workspace;
import net.workspace.util.MyLogger;
import net.workspace.util.T;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/**
 * ConnectionChangeReceiver
 *
 * @author Hike
 */
public class ConnectionChangeReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        MyLogger.debug("ConnectionChangeReceiver onReceive,action=" + intent.getAction());
        T.registerReciever();
        context.startService(new Intent(context, net.workspace.CommonService.class).setAction(net.workspace.CommonService.ACTION_NETWORK_CHANGE));
    }
}
