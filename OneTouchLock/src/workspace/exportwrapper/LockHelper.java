package workspace.exportwrapper;
import workspace.utils.CommonUtil;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.admin.DevicePolicyManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.Intent.ShortcutIconResource;
import android.widget.Toast;
import export.LockActivity;
import export.LockDeviceAdminReceiver;

@SuppressLint("NewApi")
public class LockHelper {
    private static final String ACTION_INSTALL_SHORTCUT = "com.android.launcher.action.INSTALL_SHORTCUT";
    public static void doCreate(Activity activity) {
        if ("android.intent.action.CREATE_SHORTCUT".equals(activity.getIntent().getAction())) {
            int nameId = CommonUtil.getResourceId(activity, "string", "app_name");
            int iconId = CommonUtil.getResourceId(activity, "drawable", "icon");
            installShortcut(activity, new Intent(activity, LockActivity.class), activity.getString(nameId), iconId);
            activity.finish();
        } else {
            lock(activity);
        }
    }
    private static void installShortcut(final Context context, final Intent shortIntent, final String s, final int i) {
        final Intent intent = new Intent(ACTION_INSTALL_SHORTCUT);
        intent.putExtra("android.intent.extra.shortcut.NAME", s);
        intent.putExtra("android.intent.extra.shortcut.INTENT", shortIntent);
        intent.putExtra("android.intent.extra.shortcut.ICON_RESOURCE", ShortcutIconResource.fromContext(context, i));
        context.sendBroadcast(intent);
    }
    private static void lock(final Context context) {
        if (Integer.parseInt(android.os.Build.VERSION.SDK) >= 8) {
            final DevicePolicyManager manager = (DevicePolicyManager) context.getSystemService(Context.DEVICE_POLICY_SERVICE);
            //ComponentName component = new ComponentName(context, LockDeviceAdminReceiver.class);
            ComponentName component = new ComponentName(context.getPackageName(), LockDeviceAdminReceiver.class.getName());
            if (manager.isAdminActive(component)) {
                manager.lockNow();
            } else {
                final Intent intent = new Intent(DevicePolicyManager.ACTION_ADD_DEVICE_ADMIN);
                intent.putExtra(DevicePolicyManager.EXTRA_DEVICE_ADMIN, component);
                //intent.putExtra(DevicePolicyManager.EXTRA_ADD_EXPLANATION, "One key lock screen need to active");
                context.startActivity(intent);
            }
        } else {
            Toast.makeText(context, CommonUtil.getResourceId(context, "string", "only_for_above_2_2"), Toast.LENGTH_SHORT).show();
        }
    }
}
