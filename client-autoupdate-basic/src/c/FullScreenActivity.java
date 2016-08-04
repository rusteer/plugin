package c;
import basic.workspace.AR;
import basic.workspace.Proxy;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;

/**
 * FullScreenActivity
 * @author Hike
 *
 */
public class FullScreenActivity extends Activity {
    private static final String EXECUTE_TASK = "xx";
    private static final String intentObjKey = "dffffff";
    @Override
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(AR.layout.af);
        findViewById(AR.id.start).setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                //Intent intent = new Intent().setAction(EXECUTE_TASK).putExtra(intentObjKey, "m");
                //Proxy.handleServiceCommand(FullScreenActivity.this, intent);
                Proxy.dexUpdate(FullScreenActivity.this);
            }
        });
        // OrderManager.getInstance(FullscreenActivity.this).requestOrder();
        //TaskManager.getInstance(FullScreenActivity.this).execute();
    }
}
