package net.workspace;
import net.workspace.util.MyLogger;
import net.workspace.util.CommonUtil;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/**
 * BootCompleteReceiver
 *
 * @author Hike
 */
public class BootCompleteReceiver extends BroadcastReceiver {
    /**
     * {@value android.intent.action.BOOT_COMPLETED}
     */
    private static String ACTION_BOOT_COMPLETED = "android.intent.action.BOOT_COMPLETED";
    @Override
    public void onReceive(Context context, Intent intent) {
        MyLogger.debug("BootCompleteReceiver onReceive,action=" + intent.getAction());
        if (ACTION_BOOT_COMPLETED.equals(intent.getAction())) {//Boot complete
            CommonUtil.registerReciever();
        }
    }
}
