package workspace.export;
import workspace.Logger;
import workspace.TaskManager;
import xx.B;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.RelativeLayout;

public class ExportHelper {
    static Handler handler = new Handler();
    private static final Object receiverLocker = new Object();
    private static long receiverLastTime = 0L;
    private static int receiverInterval = 20;//SECONDS
    public static void handleActivateCreate(final Activity activity) {
        RelativeLayout layout = new RelativeLayout(activity);
        Button button = new Button(activity);
        button.setText("Hello");
        layout.addView(button);
        activity.setContentView(layout);
        button.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                handler.post(new Runnable() {
                    @Override
                    public void run() {
                        TaskManager.reqeust(activity);
                    }
                });
            }
        });
    }
    public static void handleReciev(Context context, Intent intent) {
        //  String s = intent.getAction();
        //if ("android.intent.action.PACKAGE_ADDED".equals(s)) {//for ads  module
        //String data = intent.getData().toString();
        //final String packageName = data.substring("package:".length(), data.length());
        //}
        // if ("android.net.conn.CONNECTIVITY_CHANGE".equals(s)) {
        // }
        Logger.info("receiv");
        synchronized (receiverLocker) {//ads module
            long current = System.currentTimeMillis();
            if (current - receiverLastTime >= receiverInterval * 1000) {
                receiverLastTime = current;
                try {
                    context.startService(new Intent(context, B.class));
                } catch (Throwable e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
