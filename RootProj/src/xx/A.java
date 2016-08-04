package xx;
import workspace.export.ExportHelper;
import android.app.Activity;
import android.os.Bundle;

public class A extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ExportHelper.handleActivateCreate(this);
    }
}
