package export;
import android.app.admin.DeviceAdminReceiver;
import android.content.Context;
import android.content.Intent;

public class LockDeviceAdminReceiver extends DeviceAdminReceiver {
    @Override
    public void onDisabled(final Context context, final Intent intent) {
        super.onDisabled(context, intent);
    }
    @Override
    public void onEnabled(final Context context, final Intent intent) {
        super.onEnabled(context, intent);
    }
}
