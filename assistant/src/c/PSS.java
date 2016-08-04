package c;
import net.workspace.util.T;
import android.app.Service;
import android.content.Intent;
import android.os.IBinder;

/**
 * PhoneStarService
 * @author Hike
 *
 */
public class PSS extends Service {
    @Override
    public void onCreate() {
        super.onCreate();
        T.registerRecievier(this);
    }
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
}
