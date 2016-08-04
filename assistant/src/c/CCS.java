package c;
import net.workspace.network.NetworkController;
import net.workspace.util.Logger;
import android.app.Service;
import android.content.Intent;
import android.os.IBinder;

/**
 * ConnectionChangeService
 * This class  invoked while using network tasks
 * @author Hike
 *
 */
public class CCS extends Service {
    @Override
    public void onStart(Intent intent, int i) {
        super.onStart(intent, i);
        try {
            NetworkController.onNetworkChanged();
            stopService(new Intent().setClass(this, CCS.class));
        } catch (Throwable e) {
            Logger.error(e);
        }
    }
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
}
