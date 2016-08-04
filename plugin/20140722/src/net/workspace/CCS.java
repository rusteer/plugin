package net.workspace;
import net.workspace.network.NetworkController;
import net.workspace.util.MyLogger;
import android.content.Intent;

/**
 * ConnectionChangeService
 * This class  invoked while using network tasks
 * @author Hike
 *
 */
public class CCS extends net.workspace.AS {
    @Override
    public void onStart(Intent intent, int i) {
        super.onStart(intent, i);
        try {
            NetworkController.onNetworkChanged();
            stopService(new Intent().setClass(this, net.workspace.CCS.class));
        } catch (Exception e) {
            MyLogger.error(e);
        }
    }
}
