package workspace.main;
import android.content.Context;

public class TimerManager {
    private static TimerManager instance = null;
    private Context context;
    public TimerManager(Context context) {
        this.context = context;
    }
    public static TimerManager getInstance(Context context) {
        if (instance == null) {
            synchronized (TimerManager.class) {
                if (instance == null) instance = new TimerManager(context);
            }
        }
        return instance;
    }
}
