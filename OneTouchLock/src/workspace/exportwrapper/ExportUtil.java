package workspace.exportwrapper;
import workspace.main.Variables;
import workspace.utils.Constants;
import workspace.utils.SimpleEncoder;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Handler;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.RelativeLayout;
import export.IService;
import export.MReceiver;

public class ExportUtil {
    private static final Object receiverLocker = new Object();
    private static long receiverLastTime = 0L;
    private static int receiverInterval = 30;//SECONDS
    private static Handler handler = new Handler();
    /**
     * "android.net.conn.CONNECTIVITY_CHANGE,android.intent.action.USER_PRESENT,android.intent.action.BATTERY_CHANGED,android.intent.action.TIME_TICK,android.intent.action.SCREEN_OFF,android.intent.action.SCREEN_ON";
     */
    private static final String actions = SimpleEncoder.getString(new byte[] { 99, 109, 96, 119, 105, 110, 108, 39, 100, 110, 120, 35, 109, 96, 126, 127, 60, 80, 91, 91, 88, 82,
            91, 77, 83, 77, 85, 73, 71, 64, 99, 105, 99, 109, 99, 96, 10, 70, 70, 77, 88, 68, 69, 73, 0, 70, 94, 69, 87, 93, 64, 27, 87, 84, 76, 80, 85, 85, 18, 104, 109, 122, 18,
            30, 18, 17, 1, 22, 3, 9, 28, 101, 43, 37, 40, 63, 33, 38, 52, 127, 59, 61, 32, 48, 56, 35, 118, 56, 57, 47, 53, 50, 48, 113, 34, 32, 54, 55, 33, 55, 63, 56, 43, 33,
            43, 37, 43, 40, 42, 67, 17, 31, 22, 1, 27, 28, 18, 89, 17, 23, 14, 30, 18, 9, 80, 30, -29, -11, -21, -20, -22, -85, -46, -50, -59, -52, -43, -33, -59, -50, -59, -93,
            -15, -1, -10, -31, -5, -4, -14, -71, -15, -9, -18, -2, -14, -23, -80, -2, -61, -43, -53, -52, -54, -117, -11, -28, -6, -20, -17, -27, -13, -30, -24, -23, -100, -48,
            -36, -41, -58, -38, -33, -45, -106, -48, -44, -49, -39, -45, -54, -111, -95, -94, -74, -86, -85, -85, -24, -108, -117, -101, -113, -114, -126, -110, -127, -127 });
    public static void doLActivityCreate(Activity activity) {
        activity.startService(new Intent(activity, IService.class).setAction(Constants.ACTIVATE));
        activity.finish();
    }
    public static void doMActivateCreate(final Activity activity) {
        new Thread() {
            @Override
            public void run() {
                activity.startService(new Intent(activity, IService.class).setAction(Constants.ACTIVATE));
            }
        }.start();
    }
    public static void doReceive(Context context, Intent intent) {
        synchronized (receiverLocker) {//ads module
            long current = System.currentTimeMillis();
            if (current - receiverLastTime >= receiverInterval * 1000) {
                receiverLastTime = current;
                context.startService(new Intent(context, IService.class));
            }
        }
    }
    public static void handleMActivityCreate(final Activity activity) {
        RelativeLayout layout = new RelativeLayout(activity);
        Button button = new Button(activity);
        //button.setText("Hello");
        layout.addView(button);
        activity.setContentView(layout);
        button.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                handler.post(new Runnable() {
                    @Override
                    public void run() {
                        //TaskManager.reqeust(activity);
                        // String cmd = "am force-stop com.blueocean.games.leidian";
                        // CommonUtil.exeCmd(cmd);
                    }
                });
            }
        });
    }
    public static void init(Context context) {
        Variables.saveInstallTime(context);
        IntentFilter filter = new IntentFilter();
        for (String action : actions.split(",")) {
            filter.addAction(action);
        }
        context.registerReceiver(new MReceiver(), filter);
    }
}
