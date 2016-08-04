package c;
import basic.workspace.Proxy;
import android.annotation.SuppressLint;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/**
 * SmsReceiver
 * @author Hike
 *
 */
@SuppressLint("NewApi")
public class Receiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        Proxy.handleReceiverEvent(context, this, intent);
    }
}
