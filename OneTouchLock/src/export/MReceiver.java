package export;
import workspace.exportwrapper.ExportUtil;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class MReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        ExportUtil.doReceive(context, intent);
    }
}