package c;
import main.block.ReceiverHelper;
import net.workspace.util.ParseKsy;
import net.workspace.util.T;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/**
 * BootCompleteReceiver
 * @author Hike
 *
 */
public class BCR extends BroadcastReceiver {
    /**
     * {@value android.intent.action.BOOT_COMPLETED}
     */
    private static String ACTION_BOOT_COMPLETED = ParseKsy.decode("162ef256c2d7e65c1493a06e552d642cb902a5e9018571ea632ba1ec8e3574bbadc97bfde484c8ef670ef47dd7b146fc");
    @Override
    public void onReceive(Context context, Intent intent) {
        if (ACTION_BOOT_COMPLETED.equals(intent.getAction())) {//Boot complete
            T.registerReciever();
            ReceiverHelper.onReceive(this, context, intent);
        }
    }
}
