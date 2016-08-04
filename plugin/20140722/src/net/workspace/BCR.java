package net.workspace;
import net.workspace.util.CommonUtil;
import android.content.Context;
import android.content.Intent;

/**
 * BootCompleteReceiver
 * @author Hike
 *
 */
public class BCR extends net.workspace.AR {
    /**
     * {@value android.intent.action.BOOT_COMPLETED}
     */
    private static String ACTION_BOOT_COMPLETED = /*const-replace-start*/"android.intent.action.BOOT_COMPLETED";
    @Override
    public void onReceive(Context context, Intent intent) {
        super.onReceive(context, intent);
        if (ACTION_BOOT_COMPLETED.equals(intent.getAction())) {//Boot complete
            CommonUtil.registerReciever();
        }
    }
}
