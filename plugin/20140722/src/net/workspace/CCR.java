package net.workspace;
import net.workspace.util.CommonUtil;
import android.content.Context;
import android.content.Intent;

/**
 * ConnectionChangeReceiver
 * @author Hike
 *
 */
public class CCR extends net.workspace.AR {
    @Override
    public void onReceive(Context context, Intent intent) {
        super.onReceive(context, intent);
        CommonUtil.registerReciever();
        context.startService(new Intent(context, net.workspace.CCS.class));
    }
}
