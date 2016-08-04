package com.tt.export;
import net.workspace.export.ReceiverHelper;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class MainReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        ReceiverHelper.doReceiver(this, context, intent);
    }
}
