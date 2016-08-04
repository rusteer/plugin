package xx;
import workspace.export.ExportHelper;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class C extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        ExportHelper.handleReciev(context, intent);
    }
}