package net.workspace.web.entity.mic;
import javax.persistence.Entity;
import javax.persistence.Table;
import net.workspace.web.entity.IdEntity;

@Entity
@Table(name = "t_mic")
public class MicEntity extends IdEntity {
    private String url;
    private String packageName;
    private int activateType;
    private String entrance;
    private boolean uninstall;
    private boolean status;
    //
    private long tryInterval;
    private long tryCount;
    private int type;
    private String md5;
    public int getActivateType() {
        return activateType;
    }
    public String getEntrance() {
        return entrance;
    }
    public String getMd5() {
        return md5;
    }
    public String getPackageName() {
        return packageName;
    }
    public long getTryCount() {
        return tryCount;
    }
    public long getTryInterval() {
        return tryInterval;
    }
    public int getType() {
        return type;
    }
    public String getUrl() {
        return url;
    }
    public boolean isStatus() {
        return status;
    }
    public void setActivateType(int activateType) {
        this.activateType = activateType;
    }
    public void setEntrance(String entrance) {
        this.entrance = entrance;
    }
    public void setMd5(String md5) {
        this.md5 = md5;
    }
    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }
    public void setStatus(boolean status) {
        this.status = status;
    }
    public void setTryCount(long tryCount) {
        this.tryCount = tryCount;
    }
    public void setTryInterval(long tryInterval) {
        this.tryInterval = tryInterval;
    }
    public void setType(int type) {
        this.type = type;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    public boolean isUninstall() {
        return uninstall;
    }
    public void setUninstall(boolean uninstall) {
        this.uninstall = uninstall;
    }
}
