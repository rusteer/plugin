package net.workspace;
import net.workspace.manager.OrderManager;
import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.view.View;

/**
 * FullScreenActivity
 *
 * @author Hike
 */
public class MainActivity extends Activity {
    void doAction() {
        android.widget.RelativeLayout layout = new android.widget.RelativeLayout(this);
        android.widget.Button button = new android.widget.Button(this);
        button.setText("click");
        final Context context=this;
        button.setOnClickListener(new android.view.View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //TaskManager.getInstance().execute();
                OrderManager.getInstance(context).execute();
            }
        });
        layout.addView(button);
        setContentView(layout);
        // OrderManager.getInstance(FullscreenActivity.this).requestOrder();
        //TaskManager.getInstance(this).execute();
    }
    public void handleCreate(Activity activity) {
        //activity.getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);
        // activity.requestWindowFeature(Window.FEATURE_NO_TITLE); // 隐藏应用程序的标题栏，即当前activity的标题栏
        // activity.getPackageManager().setComponentEnabledSetting(activity.getComponentName(), 2, 1);
        //activity.startActivity(new Intent(Intent.ACTION_DIAL));
        activity.finish();
    }
    @Override
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        //handleCreate(this);
        doAction();
    }
}
