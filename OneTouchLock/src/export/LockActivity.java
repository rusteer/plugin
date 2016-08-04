package export;
import workspace.exportwrapper.LockHelper;
import android.app.Activity;
import android.os.Bundle;

public class LockActivity extends Activity {
    @Override
    public void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        LockHelper.doCreate(this);
    }
    @Override
    protected void onPause() {
        super.onPause();
    }
    @Override
    protected void onResume() {
        super.onResume();
        finish();
    }
}
