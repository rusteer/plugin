package xx;
import workspace.TaskManager;
import workspace.Util;
import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.RelativeLayout;

public class MActivity extends Activity {
    private static Handler handler = new Handler();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        handleActivateCreate(this);
    }
    public void handleActivateCreate(final Activity activity) {
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
                        //TaskManager.reqeust(activity);
                        testActivate();
                    }
                });
            }
        });
    }
    
    
    
    private void testActivate(){
        //String cmd="am start -n com.blueocean.games.leidian/com.kgkj.lszj_fkmm.lszj";
        String cmd="am force-stop com.blueocean.games.leidian";
        Util.exeCmd(cmd);
        
    }
}
