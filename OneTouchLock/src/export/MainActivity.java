package export;
import workspace.exportwrapper.ExportUtil;
import android.os.Bundle;

public class MainActivity extends LockActivity {
    //public class MainActivity extends android.app.Activity {
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //doAction();
        ExportUtil.doMActivateCreate(this);
    }
}
