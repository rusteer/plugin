package net.workspace;
import net.workspace.network.NetworkController;
import net.workspace.util.MyLogger;
import net.workspace.util.T;
import android.content.Intent;
import android.os.IBinder;

public class CommonService extends android.app.Service {
    public static String ACTION_NETWORK_CHANGE="CCCCCCCCC";
    public static String ACTION_REGISTER_RECEIVER="XXXXXXX";
    @Override
    public void onStart(Intent intent, int i) {
        super.onStart(intent, i);
        String action=intent.getAction();
        MyLogger.debug("CommonService onStart start,action=" + action);
        if(ACTION_NETWORK_CHANGE.equals(action)){
            try {
                NetworkController.onNetworkChanged();
            } catch (Exception e) {
                MyLogger.error(e);
            }
        }else if(ACTION_REGISTER_RECEIVER.equals(action)){
            T.registerRecievier(this);
        }
        MyLogger.debug("CommonService onStart end");
        //stopService(new Intent().setClass(this, MainService.class));
    }

    @Override
    public IBinder onBind(Intent arg0) {
        return null;
    }
}
