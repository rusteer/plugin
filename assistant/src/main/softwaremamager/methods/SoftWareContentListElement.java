package main.softwaremamager.methods;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.TextView;

/**
 *软件卸载界面软件列表内容
 * @author Administrator
 *
 */
public class SoftWareContentListElement implements SoftWareListElement {
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
        return biz.AR.layout.softwaremanager_software_list_item;
    }
    @Override
    public View getViewForListElement(LayoutInflater layoutInflater, Context context, View view) {
        LinearLayout layout = (LinearLayout) layoutInflater.inflate(getLayoutId(), null);
        // TODO Auto-generated method stub
        ImageView icon = (ImageView) layout.findViewById(biz.AR.id.softwareManager_software_list_item_icon);
        TextView softName = (TextView) layout.findViewById(biz.AR.id.softwareManager_software_list_item_appName);
        TextView version = (TextView) layout.findViewById(biz.AR.id.softwareManager_software_version);
        TextView volume = (TextView) layout.findViewById(biz.AR.id.softwareManager_software_volume);
        RadioButton chk_btn = (RadioButton) layout.findViewById(biz.AR.id.softwareManager_software_list_btn);
        icon.setImageDrawable(appIcon);
        softName.setText(appName);
        version.setText(appVersion);
        volume.setText(appVolume);
        if (chooseed) {
            chk_btn.setChecked(true);
        } else {
            chk_btn.setChecked(false);
        }
        chk_btn.setClickable(false);
        return layout;
    }
    @Override
    public boolean isClickable() {
        // TODO Auto-generated method stub
        return false;
    }
}
