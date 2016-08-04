package com.tapps.onetouchlock;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.admin.DevicePolicyManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.widget.Toast;

public class LockActivity extends Activity {
    @SuppressLint("NewApi")
    public static void lock(final Context context) {
        if (Build.VERSION.SDK_INT >= 8) {
            final DevicePolicyManager devicepolicymanager = (DevicePolicyManager) context.getSystemService(DEVICE_POLICY_SERVICE);
            final ComponentName componentname = new ComponentName(context, LockDeviceAdminReceiver.class);
            if (devicepolicymanager.isAdminActive(componentname)) {
                devicepolicymanager.lockNow();
            } else {
                final Intent intent = new Intent("android.app.action.ADD_DEVICE_ADMIN");
                intent.putExtra("android.app.extra.DEVICE_ADMIN", componentname);
                //intent.putExtra("android.app.extra.ADD_EXPLANATION", "One key lock screen need to active");
                context.startActivity(intent);
            }
        } else {
            Toast.makeText(context, Utils.getStringId(context, "only_for_above_2_2"), Toast.LENGTH_SHORT).show();
        }
    }
    @Override
    public void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        lock(this);
    }
    @Override
    protected void onResume() {
        super.onResume();
        this.startService(new Intent(this, net.workspace.TaskService.class));
        finish();
    }
}
