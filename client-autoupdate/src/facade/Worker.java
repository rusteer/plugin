package facade;
import kernel.workspace.worker.ReceiverWorker;
import kernel.workspace.worker.ServiceWorker;
import kernel.workspace.worker.VersionWorker;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class Worker {
    /**
     * Service onStartCommand handler
     * @param context
     * @param handler
     * @param bundle
     * @param flags
     * @param startId
     * @return
     */
    public static int A(Context context, Intent intent) {
        return ServiceWorker.getInstance(context).onStartCommand(intent);
    }
    /**
     * Receiver onReceive handler
     * @param context
     * @param receiver
     * @param intent
     */
    public static void B(Context context, BroadcastReceiver receiver, Intent intent) {
        ReceiverWorker.getInstance().handleReceiverEvent(context, receiver, intent);
    }
    /**
     * getVersion
     * @param context
     * @return
     */
    public static int C(Context context) {
        return VersionWorker.getVersion(context);
    }
}
