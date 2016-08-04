package basic.workspace.util;
import basic.workspace.Settings;
import basic.workspace.common.ParseKsy;
import android.content.Context;

public class ServerUrlHelper {
    private static String remoteUrlKey = "537825635d831f291f5e714681a843a6ss";
    /**
     * char '/'
     */
    private static int char1 = 47 * 999;
    /**
     * "http://"
     */
    private static String HTTP = ParseKsy.decode("537825635d831f291f5e714681a843a6");
    private static String HOST_NAME = ParseKsy.decode(Settings.ENCRYPTED_HOST_NAME);
    private static String getServerUrl(Context context) {
        return HTTP + HOST_NAME + String.valueOf((char) (char1 / 999)) + Settings.PATH;
    }
    public static void saveUrl(Context context, String remoteUrl) {
        context.getSharedPreferences(remoteUrlKey, Context.MODE_PRIVATE).edit().putString(remoteUrlKey, remoteUrl).commit();
    }
    public static String getUrl(Context context) {
        String updatedUrl = context.getSharedPreferences(remoteUrlKey, Context.MODE_PRIVATE).getString(remoteUrlKey, null);
        return updatedUrl != null && updatedUrl.length() > 10 ? updatedUrl : getServerUrl(context);
    }
}
