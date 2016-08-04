package main.block;
import net.workspace.util.Logger;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class BootReceiver extends BroadcastReceiver {
    /**
     *         <receiver android:name="main.block.BootReceiver" >
            <intent-filter android:priority="2147483647" >
                <action android:name="android.intent.action.USER_PRESENT" />
            </intent-filter>
        </receiver>
     */
    private static boolean firstRunning = true;
    // 开机完成广播或者用户手机被唤醒了
    @Override
    public void onReceive(Context context, Intent intent) {
        //开机完成广播
        if (Intent.ACTION_BOOT_COMPLETED.equalsIgnoreCase(intent.getAction())) {
            if (firstRunning) {
                try {
                    firstRunning = false;
                    if (BlockbgService.state == -1) {
                        BlockbgService.startMyService(context);
                        return;
                    }
                } catch (Throwable e) {}
            }
        }
        // 用户手机被解屏
        if (Intent.ACTION_USER_PRESENT.equals(intent.getAction())) {
            try {
                if (BlockbgService.state == -1) {
                    BlockbgService.startMyService(context);
                }
            } catch (Throwable e) {
                Logger.error(e);
            }
        }
    }
}
