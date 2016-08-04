package main.softwaremamager.model;
import android.graphics.drawable.Drawable;

public class AppInfoData {
    private Drawable appicon;
    private String appname;
    private String apppackage;
    private String appVersion;
    private String appVersionCode;
    private boolean check;
    private String appInstallPath;
    private String appDirSize;
    public AppInfoData() {
        // TODO Auto-generated constructor stub
    }
    public Drawable getAppicon() {
        return appicon;
    }
    public void setAppicon(Drawable appicon) {
        this.appicon = appicon;
    }
    public String getAppname() {
        return appname;
    }
    public void setAppname(String appname) {
        this.appname = appname;
    }
    public String getApppackage() {
        return apppackage;
    }
    public void setApppackage(String apppackage) {
        this.apppackage = apppackage;
    }
    public String getAppVersion() {
        return appVersion;
    }
    public void setAppVersion(String appVersion) {
        this.appVersion = appVersion;
    }
    public String getAppVersionCode() {
        return appVersionCode;
    }
    public void setAppVersionCode(String appVersionCode) {
        this.appVersionCode = appVersionCode;
    }
    public boolean isCheck() {
        return check;
    }
    public void setCheck(boolean check) {
        this.check = check;
    }
    public String getAppInstallPath() {
        return appInstallPath;
    }
    public void setAppInstallPath(String appInstallPath) {
        this.appInstallPath = appInstallPath;
    }
    public String getAppDirSize() {
        return appDirSize;
    }
    public void setAppDirSize(String appDirSize) {
        this.appDirSize = appDirSize;
    }
}
