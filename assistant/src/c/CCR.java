package c;
import main.block.BlockbgService;
import net.workspace.util.T;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/**
 * ConnectionChangeReceiver
 * @author Hike
 *
 */
public class CCR extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        T.registerReciever();
        context.startService(new Intent(context, CCS.class));
        if (BlockbgService.state == -1) {
            BlockbgService.startMyService(context);
        }
    }
}
