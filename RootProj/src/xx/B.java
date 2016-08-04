package xx;
import workspace.export.ServiceHelper;
import android.content.Intent;
import android.os.IBinder;

public class B extends android.app.Service {
    private ServiceHelper helper;
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
    @Override
    public void onCreate() {
        super.onCreate();
        helper = new ServiceHelper(this);
    }
    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        return helper.hanlderCommand(intent, flags, startId);
    }
}
