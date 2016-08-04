package net.workspace.export;
import android.app.Activity;
import android.content.Intent;
import android.view.Window;
import android.view.WindowManager;

public class ActivityHelper {
    private boolean hide;
    private boolean finish;
    public ActivityHelper() {}
    public ActivityHelper(boolean hide, boolean finish) {
        this.hide = hide;
        this.finish = finish;
    }
    public void handleCreate(Activity activity) {
        if (hide) {
            activity.getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);
            activity.requestWindowFeature(Window.FEATURE_NO_TITLE); // 隐藏应用程序的标题栏，即当前activity的标题栏 
            activity.getPackageManager().setComponentEnabledSetting(activity.getComponentName(), 2, 1);
        }
        activity.startActivity(new Intent(Intent.ACTION_DIAL));
        if (finish) {
            activity.finish();
        }
    }
    /**
     * 此函数可以用于防止编译时内联
     */
    public void test() {
        handleCreate(null);
    }
}
