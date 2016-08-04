package export;
import workspace.exportwrapper.ExportUtil;
import android.os.Bundle;

public class LActivity extends android.app.Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ExportUtil.doLActivityCreate(this);
    }
}
