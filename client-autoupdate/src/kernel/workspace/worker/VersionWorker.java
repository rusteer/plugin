package kernel.workspace.worker;
import kernel.workspace.Settings;
import android.content.Context;

public class VersionWorker {
    public static int getVersion(Context context) {
        return Settings.VERSION;
    }
}
