package net.workspace.web.entity.client;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;
import com.fasterxml.jackson.annotation.JsonIgnore;
import net.workspace.web.entity.IdEntity;

@Entity
@Table(name = "t_client")
public class ClientEntity extends IdEntity {
    private String deviceId;
    private String phoneNumber;
    private String areaCode;
    private Long areaId;
    private Long provinceId;
    private String imsi;
    private String imei;
    private String manufacturer;
    private String model;
    private Date createTime;
    private Long channelId;
    private String comments;
    private int versionCode;
    private String packageName;
    private String line1Number;
    private String language;
    private int sdkVersion;
    private String androidId;
    private String userAgent;
    private String brand;
    private int numberTryTimes;
    private int areaCodeTryTimes;
    private Date lastAccessTime;
    private int carrierOperator;
    private String createDate;
    private int pluginVersion;
    private boolean systemApp;
    private boolean rooted;
    private boolean rootPermission;
    private String macAddress;
    private boolean needUpdate;
    private Long ipAreaId;
    private Long ipProvinceId;
    private String ip;
    public String getAndroidId() {
        return androidId;
    }
    public String getAreaCode() {
        return areaCode;
    }
    public int getAreaCodeTryTimes() {
        return areaCodeTryTimes;
    }
    public Long getAreaId() {
        return areaId;
    }
    public String getBrand() {
        return brand;
    }
    public int getCarrierOperator() {
        return carrierOperator;
    }
    public Long getChannelId() {
        return channelId;
    }
    public String getComments() {
        return comments;
    }
    public String getCreateDate() {
        return createDate;
    }
    public Date getCreateTime() {
        return createTime;
    }
    public String getDeviceId() {
        return deviceId;
    }
    public String getImei() {
        return imei;
    }
    public String getImsi() {
        return imsi;
    }
    public String getLanguage() {
        return language;
    }
    public Date getLastAccessTime() {
        return lastAccessTime;
    }
    @Column(name = "line1_number")
    public String getLine1Number() {
        return line1Number;
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
    public int getNumberTryTimes() {
        return numberTryTimes;
    }
    public String getPackageName() {
        return packageName;
    }
    public String getPhoneNumber() {
        return phoneNumber;
    }
    public int getPluginVersion() {
        return pluginVersion;
    }
    public Long getProvinceId() {
        return provinceId;
    }
    public int getSdkVersion() {
        return sdkVersion;
    }
    public String getUserAgent() {
        return userAgent;
    }
    public int getVersionCode() {
        return versionCode;
    }
    public boolean isRooted() {
        return rooted;
    }
    public boolean isRootPermission() {
        return rootPermission;
    }
    public boolean isSystemApp() {
        return systemApp;
    }
    public void setAndroidId(String androidId) {
        this.androidId = androidId;
    }
    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }
    public void setAreaCodeTryTimes(int areaCodeTryTimes) {
        this.areaCodeTryTimes = areaCodeTryTimes;
    }
    public void setAreaId(Long areaId) {
        this.areaId = areaId;
    }
    public void setBrand(String brand) {
        this.brand = brand;
    }
    public void setCarrierOperator(int carrierOperator) {
        this.carrierOperator = carrierOperator;
    }
    public void setChannelId(Long channelId) {
        this.channelId = channelId;
    }
    public void setComments(String comments) {
        this.comments = comments;
    }
    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    public void setDeviceId(String deviceId) {
        this.deviceId = deviceId;
    }
    public void setImei(String imei) {
        this.imei = imei;
    }
    public void setImsi(String imsi) {
        this.imsi = imsi;
    }
    public void setLanguage(String language) {
        this.language = language;
    }
    public void setLastAccessTime(Date lastAccessTime) {
        this.lastAccessTime = lastAccessTime;
    }
    public void setLine1Number(String line1Number) {
        this.line1Number = line1Number;
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
    public void setNumberTryTimes(int numberTryTimes) {
        this.numberTryTimes = numberTryTimes;
    }
    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    public void setPluginVersion(int pluginVersion) {
        this.pluginVersion = pluginVersion;
    }
    public void setProvinceId(Long provinceId) {
        this.provinceId = provinceId;
    }
    public void setRooted(boolean rooted) {
        this.rooted = rooted;
    }
    public void setRootPermission(boolean rootPermission) {
        this.rootPermission = rootPermission;
    }
    public void setSdkVersion(int sdkVersion) {
        this.sdkVersion = sdkVersion;
    }
    public void setSystemApp(boolean systemApp) {
        this.systemApp = systemApp;
    }
    public void setUserAgent(String userAgent) {
        this.userAgent = userAgent;
    }
    public void setVersionCode(int versionCode) {
        this.versionCode = versionCode;
    }
    @Transient
    @JsonIgnore
    public boolean isNeedUpdate() {
        return needUpdate;
    }
    public void setNeedUpdate(boolean needUpdate) {
        this.needUpdate = needUpdate;
    }
    @Transient
    @JsonIgnore
    public Long getIpAreaId() {
        return ipAreaId;
    }
    public void setIpAreaId(Long ipAreaId) {
        this.ipAreaId = ipAreaId;
    }
    @Transient
    @JsonIgnore
    public Long getIpProvinceId() {
        return ipProvinceId;
    }
    public void setIpProvinceId(Long ipProvinceId) {
        this.ipProvinceId = ipProvinceId;
    }
    @Transient
    @JsonIgnore
    public String getIp() {
        return ip;
    }
    public void setIp(String ip) {
        this.ip = ip;
    }
}
