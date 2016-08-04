package main.systemoptimization.model;
/**
 * 
 * 程序白名单实体模型类 
 * @author 陈思初
 *
 */
public class SoftWareWhiteList {
    private int id;
    private String appName;
    private byte[] appIcon;
    private String appPackage;
    public SoftWareWhiteList() {
        // TODO Auto-generated constructor stub
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getAppName() {
        return appName;
    }
    public void setAppName(String appName) {
        this.appName = appName;
    }
    public byte[] getAppIcon() {
        return appIcon;
    }
    public void setAppIcon(byte[] appIcon) {
        this.appIcon = appIcon;
    }
    public String getAppPackage() {
        return appPackage;
    }
    public void setAppPackage(String appPackage) {
        this.appPackage = appPackage;
    }
}
