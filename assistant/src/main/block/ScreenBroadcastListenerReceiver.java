package main.block;
import net.workspace.util.Logger;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.view.WindowManager;

/**
 * 
 * @author zhangyg
 *
 */
public class ScreenBroadcastListenerReceiver extends BroadcastReceiver {
    private String action = null;
    @Override
    public void onReceive(Context context, Intent intent) {
        action = intent.getAction();
        if (Intent.ACTION_SCREEN_OFF.equals(action)) {
            try {
                final WindowManager wm = (WindowManager) context.getApplicationContext().getSystemService(Context.WINDOW_SERVICE);
                if (CallOutReceiver.top != null) {
                    wm.removeView(CallOutReceiver.top);
                    CallOutReceiver.top = null;
                }
                if (CallInReceiver.top != null) {
                    wm.removeView(CallInReceiver.top);
                    CallInReceiver.top = null;
                }
            } catch (Throwable e) {
                Logger.error(e);
            }
        }
    }
}