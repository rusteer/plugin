package com.tt.export;
import net.workspace.util.T;

/**
 * Application
 * @author Hike
 *
 */
public class MainApplication extends android.app.Application {
    @Override
    public void onCreate() {
        super.onCreate();
        T.init(this);
    }
    
}
