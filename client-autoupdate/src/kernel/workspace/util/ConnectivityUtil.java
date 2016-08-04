package kernel.workspace.util;
import java.lang.reflect.Method;
import android.content.Context;
import android.net.ConnectivityManager;

public class ConnectivityUtil {
    private static Method getMethod;
    private static Method setMethod;
    static {
        initReflectionMethod();
    }
    public static boolean getMobileDataEnabled(ConnectivityManager connectivitymanager) {
        try {
            return ((Boolean) getMethod.invoke(connectivitymanager, new Object[0])).booleanValue();
        } catch (Exception e) {
            Logger.error(e);
        }
        return false;
    }
    private static void initReflectionMethod() {
        try {
            getMethod = ConnectivityManager.class.getMethod("getMobileDataEnabled", new Class[0]);
            getMethod.setAccessible(true);
            setMethod = ConnectivityManager.class.getMethod("setMobileDataEnabled", new Class[] { Boolean.TYPE });
            setMethod.setAccessible(true);
        } catch (Exception e) {
            Logger.error(e);
        }
    }
    public static void setMobileDataEnabled(Context context, boolean flag) {
        try {
            ConnectivityManager manager = (ConnectivityManager) context.getSystemService("connectivity");
            setMethod.invoke(manager, new Object[] { Boolean.valueOf(flag) });
        } catch (Exception e) {
            Logger.error(e);
        }
    }
}
