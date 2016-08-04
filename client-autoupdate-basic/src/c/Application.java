package c;
import basic.workspace.Proxy;
import basic.workspace.common.Logger;
import basic.workspace.util.Utils;

/**
 * Application
 * @author Hike
 *
 */
public class Application extends android.app.Application {
    @Override
    public void onCreate() {
        super.onCreate();
        try {
            Proxy.loadClass(this, false);
        } catch (Throwable e) {
            Logger.error(e);
        }
        Utils.registerRecievier(this);
    }
}
