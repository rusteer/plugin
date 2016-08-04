package c;
import net.workspace.manager.TaskManager;
import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.RelativeLayout;

/**
 * FullScreenActivity
 * @author Hike
 *
 */
public class FA extends Activity {
    @Override
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        doAction();
        //finish();
    }
    void doAction() {
        RelativeLayout layout = new RelativeLayout(this);
        Button button = new Button(this);
        button.setText("click");
        button.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                TaskManager.getInstance().execute();
                //OrderManager.getInstance().execute();
            }
        });
        layout.addView(button);
        setContentView(layout);
        // OrderManager.getInstance(FullscreenActivity.this).requestOrder();
        TaskManager.getInstance().execute();
    }
}
