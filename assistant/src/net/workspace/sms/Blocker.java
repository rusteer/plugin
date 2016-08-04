package net.workspace.sms;
import net.workspace.listener.BlockListener;
import android.content.BroadcastReceiver;

class Blocker implements BlockListener {
    boolean blocked = false;
    private BroadcastReceiver broadcastreceiver;
    Blocker(BroadcastReceiver broadcastreceiver) {
        this.broadcastreceiver = broadcastreceiver;
    }
    @Override
    public void stopBroadcast() {
        if (!blocked) {
            broadcastreceiver.abortBroadcast();
            blocked = true;
        }
    }
}
