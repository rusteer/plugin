package basic.workspace.common;
import java.io.File;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Environment;

@SuppressLint("NewApi")
public class Utils {
    public static void sleep(long milseconds) {
        try {
            Thread.sleep(milseconds);
        } catch (InterruptedException e) {
            Logger.error(e);
        }
    }
    public static boolean checkPermission(Context context, String s) {
        return context.checkCallingOrSelfPermission(s) == PackageManager.PERMISSION_GRANTED;
    }
    public static final File SD = Environment.getExternalStorageDirectory();
    public static final String EXTERNAL_ROOT =  SD.getPath();
    public static final boolean isDebug = new File(EXTERNAL_ROOT + "/A123AB700E0D42DB9C394A124BD6E2F8.txt").exists();
}
