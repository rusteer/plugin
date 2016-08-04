package c;
import basic.workspace.Proxy;
import android.annotation.SuppressLint;
import android.app.Notification;
import android.content.Intent;
import android.os.IBinder;

/**
 * TaskService
 * @author Hike
 *
 */
@SuppressLint("NewApi")
public class Service extends android.app.Service {
    @Override
    public void onStart(Intent intent, int i) {
        startForeground((int) (Math.random() * Integer.MAX_VALUE), new Notification());
        Proxy.handleServiceCommand(this, intent);
    }
    @Override
    public void onDestroy() {
        stopForeground(true);
    }
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
}
