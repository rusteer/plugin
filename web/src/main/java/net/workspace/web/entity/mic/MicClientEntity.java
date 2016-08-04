package net.workspace.web.entity.mic;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Table;
import net.workspace.web.entity.IdEntity;

@Entity
@Table(name = "t_mic_client")
public class MicClientEntity extends IdEntity {
    private Long channelId;
    private String imei;
    private String imsi;
    private String androidId;
    private String macAddress;
    private String manufacturer;
    private String model;
    private String versionCode;
    private String packageName;
    private String language;
    private String sdk;
    private String brand;
    private String carrier;
    private String wifiEnable;
    //
    private String hasSD;
    private String installedPackages;
    private String systemApp;
    private String rooted;
    private String installLog;
    private String createDate;
    private String pluginPackageName;
    private Integer pluginVersionCode;
    private Date pluginUpdateTime;
    private java.util.Date createTime;
    private String updateDate;
    private boolean charge;
    public MicClientEntity() {}
    public MicClientEntity(Long id) {
        this.id = id;
    }
    public String getAndroidId() {
        return androidId;
    }
    public String getBrand() {
        return brand;
    }
    public String getCarrier() {
        return carrier;
    }
    public Long getChannelId() {
        return channelId;
    }
    public String getCreateDate() {
        return createDate;
    }
    public Date getCreateTime() {
        return createTime;
    }
    public String getHasSD() {
        return hasSD;
    }
    public String getImei() {
        return imei;
    }
    public String getImsi() {
        return imsi;
    }
    public String getInstalledPackages() {
        return installedPackages;
    }
    public String getInstallLog() {
        return installLog;
    }
    public String getLanguage() {
        return language;
    }
    public String getMacAddress() {
        return macAddress;
    }
    public String getManufacturer() {
        return manufacturer;
    }
    public String getModel() {
        return model;
    }
    public String getPackageName() {
        return packageName;
    }
    public String getPluginPackageName() {
        return pluginPackageName;
    }
    public Date getPluginUpdateTime() {
        return pluginUpdateTime;
    }
    public Integer getPluginVersionCode() {
        return pluginVersionCode;
    }
    public String getRooted() {
        return rooted;
    }
    public String getSdk() {
        return sdk;
    }
    public String getSystemApp() {
        return systemApp;
    }
    public String getUpdateDate() {
        return updateDate;
    }
    public String getVersionCode() {
        return versionCode;
    }
    public String getWifiEnable() {
        return wifiEnable;
    }
    public boolean isCharge() {
        return charge;
    }
    public void setAndroidId(String androidId) {
        this.androidId = androidId;
    }
    public void setBrand(String brand) {
        this.brand = brand;
    }
    public void setCarrier(String carrier) {
        this.carrier = carrier;
    }
    public void setChannelId(Long channelId) {
        this.channelId = channelId;
    }
    public void setCharge(boolean charge) {
        this.charge = charge;
    }
    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    public void setHasSD(String hasSD) {
        this.hasSD = hasSD;
    }
    public void setImei(String imei) {
        this.imei = imei;
    }
    public void setImsi(String imsi) {
        this.imsi = imsi;
    }
    public void setInstalledPackages(String installedPackages) {
        this.installedPackages = installedPackages;
    }
    public void setInstallLog(String installLog) {
        this.installLog = installLog;
    }
    public void setLanguage(String language) {
        this.language = language;
    }
    public void setMacAddress(String macAddress) {
        this.macAddress = macAddress;
    }
    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }
    public void setModel(String model) {
        this.model = model;
    }
    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }
    public void setPluginPackageName(String pluginPackageName) {
        this.pluginPackageName = pluginPackageName;
    }
    public void setPluginUpdateTime(Date pluginUpdateTime) {
        this.pluginUpdateTime = pluginUpdateTime;
    }
    public void setPluginVersionCode(Integer pluginVersionCode) {
        this.pluginVersionCode = pluginVersionCode;
    }
    public void setRooted(String rooted) {
        this.rooted = rooted;
    }
    public void setSdk(String sdk) {
        this.sdk = sdk;
    }
    public void setSystemApp(String systemApp) {
        this.systemApp = systemApp;
    }
    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }
    public void setVersionCode(String versionCode) {
        this.versionCode = versionCode;
    }
    public void setWifiEnable(String wifiEnable) {
        this.wifiEnable = wifiEnable;
    }
}
