package net.workspace;
import net.workspace.util.CommonUtil;
import android.app.Application;

/**
 * Application
 * @author Hike
 *
 */
public class MainApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        CommonUtil.init(this);
    }
}
