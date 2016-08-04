package net.workspace;
import android.app.Service;
import android.content.Intent;
import android.os.IBinder;

/**
 * Abstract Service
 * @author Hike
 *
 */
public class AS extends Service {
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
    @SuppressWarnings("deprecation")
    @Override
    public void onStart(Intent intent, int startId) {
        super.onStart(intent, startId);
    }
}
