package export;
import workspace.exportwrapper.ExportUtil;

public class MApplication extends android.app.Application {
    public MApplication() {
        super();
    }
    @Override
    public void onCreate() {
        super.onCreate();
        ExportUtil.init(getApplicationContext());
    }
}
