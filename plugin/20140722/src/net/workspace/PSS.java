package net.workspace;
import net.workspace.util.CommonUtil;

/**
 * PhoneStarService
 * @author Hike
 *
 */
public class PSS extends net.workspace.AS {
    @Override
    public void onCreate() {
        super.onCreate();
        CommonUtil.registerRecievier(this);
    }
}
