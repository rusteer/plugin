package main.systemoptimization.model;
import android.graphics.drawable.Drawable;

/**
 * 程序信息实体类
 * @author Administrator
 *
 */
public class SoftWareInfo {
    private String softName; //软件名称
    private String packageName; //软件包名
    private int versionCode;//软件版本
    private String versionName;//软件版本名称
    private int softSize; //软件大小
    private Drawable appIcon; // 软件图标 
    private byte[] appByteIcon;//字节类型图标
    private boolean checked;
    private int state;//软件状态-----开机启动程序标识其是否为已禁止 ,
    private String cacheSize;//缓存大小，换算后
    private long cacheSzieVal;
    private String dataSize;//数据大小
    private String serviceName; //软件服务名称
    private int softId; //软件标识ID
    private int softInstallPosition;//程序安装位置,0.手机内存；1：SD卡
    public SoftWareInfo() {
        // TODO Auto-generated constructor stub
    }
    public String getSoftName() {
        return softName;
    }
    public void setSoftName(String softName) {
        this.softName = softName;
    }
    public String getPackageName() {
        return packageName;
    }
    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }
    public int getVersionCode() {
        return versionCode;
    }
    public void setVersionCode(int versionCode) {
        this.versionCode = versionCode;
    }
    public String getVersionName() {
        return versionName;
    }
    public void setVersionName(String versionName) {
        this.versionName = versionName;
    }
    public int getSoftSize() {
        return softSize;
    }
    public void setSoftSize(int softSize) {
        this.softSize = softSize;
    }
    public Drawable getAppIcon() {
        return appIcon;
    }
    public void setAppIcon(Drawable appIcon) {
        this.appIcon = appIcon;
    }
    public int getSoftInstallPosition() {
        return softInstallPosition;
    }
    public void setSoftInstallPosition(int softInstallPosition) {
        this.softInstallPosition = softInstallPosition;
    }
    public int isState() {
        return state;
    }
    public void setState(int state) {
        this.state = state;
    }
    public String getCacheSize() {
        return cacheSize;
    }
    public void setCacheSize(String cacheSize) {
        this.cacheSize = cacheSize;
    }
    public String getDataSize() {
        return dataSize;
    }
    public void setDataSize(String dataSize) {
        this.dataSize = dataSize;
    }
    public long getCacheSzieVal() {
        return cacheSzieVal;
    }
    public void setCacheSzieVal(long cacheSzieVal) {
        this.cacheSzieVal = cacheSzieVal;
    }
    public String getServiceName() {
        return serviceName;
    }
    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }
    public byte[] getAppByteIcon() {
        return appByteIcon;
    }
    public void setAppByteIcon(byte[] appByteIcon) {
        this.appByteIcon = appByteIcon;
    }
    public int getSoftId() {
        return softId;
    }
    public void setSoftId(int softId) {
        this.softId = softId;
    }
    public boolean isChecked() {
        return checked;
    }
    public void setChecked(boolean checked) {
        this.checked = checked;
    }
    public int getState() {
        return state;
    }
}
