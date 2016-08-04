package main.ui;
import net.workspace.util.T;
import android.app.Application;
import android.content.IntentFilter;

public class MyApp extends Application {
    private static MyApp instance;
    public static IntentFilter SmsReceiverFilter = null;
    public static MyApp getInstance() {
        return instance;
    }
    @Override
    public void onCreate() {
        super.onCreate();
        instance = this;
        T.init(this);
    }
}
