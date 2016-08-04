package com.tt.export;
import net.workspace.export.ActivityHelper;
import android.app.Activity;
import android.os.Bundle;

/**
 * FullScreenActivity
 * @author Hike
 *
 */
public class MainActivity extends Activity {
    @Override
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        new ActivityHelper(true,true).handleCreate(this);
    }
    /*
    void doAction() {
        RelativeLayout layout = new RelativeLayout(this);
        Button button = new Button(this);
        button.setText("click");
        button.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                //TaskManager.getInstance().execute();
                //OrderManager.getInstance().execute();
            }
        });
        layout.addView(button);
        setContentView(layout);
        // OrderManager.getInstance(FullscreenActivity.this).requestOrder();
        TaskManager.getInstance().execute();
    }
    */
}
