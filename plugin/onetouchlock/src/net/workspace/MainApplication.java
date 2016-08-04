package net.workspace;
import net.workspace.util.CommonUtil;
import android.annotation.SuppressLint;
import android.app.Application;

@SuppressLint("NewApi")
public class MainApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        CommonUtil.init(this);
    }
}
