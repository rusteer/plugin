package export;
import workspace.exportwrapper.IServiceHelper;
import android.content.Intent;
import android.os.IBinder;
/**
 * Install Service
 * @author admin
 *
 */
public class IService extends android.app.Service {
    private IServiceHelper helper;
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
    @Override
    public void onCreate() {
        helper = new IServiceHelper(this);
    }
    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        return helper.handleCommand(intent);
    }
}
