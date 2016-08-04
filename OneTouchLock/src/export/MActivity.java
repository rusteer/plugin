package export;
import workspace.exportwrapper.ExportUtil;
import android.app.Activity;
import android.os.Bundle;

public class MActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ExportUtil.handleMActivityCreate(this);
    }
}
