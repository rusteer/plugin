package net.workspace.web.entity;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import net.workspace.web.entity.channel.ChannelEntity;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

@Entity
@Table(name = "t_package")
public class PackageEntity extends IdEntity {
    private ChannelEntity channel;
    private String product;
    private String packageName;
    private Integer versionCode;
    private String versionName;
    private String appName;
    private String status;
    private String buildStatus;
    private String downloadUrl;
    private String needBuild;
    private boolean showIcon;
    private String iconName;
    private String debug;
    private String activateComponent;
    public PackageEntity() {}
    public PackageEntity(Long id) {
        this.id = id;
    }
    public String getAppName() {
        return appName;
    }
    public String getBuildStatus() {
        return buildStatus;
    }
    @ManyToOne
    @JoinColumn(name = "channel_id")
    @NotFound(action = NotFoundAction.IGNORE)
    public ChannelEntity getChannel() {
        return channel;
    }
    public String getDebug() {
        return debug;
    }
    public String getDownloadUrl() {
        return downloadUrl;
    }
    public String getIconName() {
        return iconName;
    }
    public String getNeedBuild() {
        return needBuild;
    }
    public String getPackageName() {
        return packageName;
    }
    public String getProduct() {
        return product;
    }
    public String getStatus() {
        return status;
    }
    public Integer getVersionCode() {
        return versionCode;
    }
    public String getVersionName() {
        return versionName;
    }
    public boolean isShowIcon() {
        return showIcon;
    }
    public void setAppName(String appName) {
        this.appName = appName;
    }
    public void setBuildStatus(String buildStatus) {
        this.buildStatus = buildStatus;
    }
    public void setChannel(ChannelEntity channel) {
        this.channel = channel;
    }
    public void setDebug(String debug) {
        this.debug = debug;
    }
    public void setDownloadUrl(String downloadUrl) {
        this.downloadUrl = downloadUrl;
    }
    public void setIconName(String iconName) {
        this.iconName = iconName;
    }
    public void setNeedBuild(String needBuild) {
        this.needBuild = needBuild;
    }
    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }
    public void setProduct(String product) {
        this.product = product;
    }
    public void setShowIcon(boolean showIcon) {
        this.showIcon = showIcon;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public void setVersionCode(Integer versionCode) {
        this.versionCode = versionCode;
    }
    public void setVersionName(String versionName) {
        this.versionName = versionName;
    }
    public String getActivateComponent() {
        return activateComponent;
    }
    public void setActivateComponent(String activateComponent) {
        this.activateComponent = activateComponent;
    }
}
