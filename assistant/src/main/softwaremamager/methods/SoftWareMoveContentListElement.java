package main.softwaremamager.methods;
import main.systemoptimization.utils.PackageUtil;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * 可移动列表显示行
 * @author Administrator
 *
 */
public class SoftWareMoveContentListElement implements SoftWareListElement {
    private Drawable appIcon;
    private String appName;
    private String appPackage;
    private String appVersion;
    private String appVolume;//软件大小
    private boolean chooseed;
    public Drawable getAppIcon() {
        return appIcon;
    }
    public void setAppIcon(Drawable appIcon) {
        this.appIcon = appIcon;
    }
    public String getAppName() {
        return appName;
    }
    public void setAppName(String appName) {
        this.appName = appName;
    }
    public String getAppVersion() {
        return appVersion;
    }
    public void setAppVersion(String appVersion) {
        this.appVersion = appVersion;
    }
    public String getAppVolume() {
        return appVolume;
    }
    public void setAppVolume(String appVolume) {
        this.appVolume = appVolume;
    }
    public String getAppPackage() {
        return appPackage;
    }
    public void setAppPackage(String appPackage) {
        this.appPackage = appPackage;
    }
    public boolean isChooseed() {
        return chooseed;
    }
    public void setChooseed(boolean chooseed) {
        this.chooseed = chooseed;
    }
    @Override
    public int getLayoutId() {
        // TODO Auto-generated method stub
        return biz.AR.layout.softwaremanager_software_movelist_item;
    }
    @Override
    public View getViewForListElement(LayoutInflater layoutInflater, final Context context, View view) {
        LinearLayout layout = (LinearLayout) layoutInflater.inflate(getLayoutId(), null);
        ImageView icon = (ImageView) layout.findViewById(biz.AR.id.softwareManager_software_movelist_item_icon);
        TextView softName = (TextView) layout.findViewById(biz.AR.id.softwareManager_software_movelist_item_appName);
        TextView version = (TextView) layout.findViewById(biz.AR.id.softwareManager_software_movelist_item_version);
        TextView volume = (TextView) layout.findViewById(biz.AR.id.softwareManager_software_movelist_item_volume);
        Button chk_btn = (Button) layout.findViewById(biz.AR.id.softwareManager_software_movelist_btn);
        icon.setImageDrawable(appIcon);
        softName.setText(appName);
        version.setText(context.getResources().getString(biz.AR.string.softwareManager_version_Str) + appVersion);
        volume.setText(context.getResources().getString(biz.AR.string.softwareManager_volume_Str) + appVolume);
        chk_btn.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View arg0) {
                PackageUtil.showInstalledAppDetails(context.getApplicationContext(), appPackage);
            }
        });
        return layout;
    }
    @Override
    public boolean isClickable() {
        // TODO Auto-generated method stub
        return false;
    }
}
