package net.workspace.web.entity.client;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Table;
import net.workspace.web.entity.IdEntity;

@Entity
@Table(name = "t_client_package_history")
public class ClientPackageHistoryEntity extends IdEntity {
    private Long clientId;
    private String packageName;
    private Integer versionCode;
    private String createDate;
    private Date createTime;
    private Date updateTime;
    private String updateHistory;
    public Long getClientId() {
        return clientId;
    }
    public String getCreateDate() {
        return createDate;
    }
    public Date getCreateTime() {
        return createTime;
    }
    public String getPackageName() {
        return packageName;
    }
    public String getUpdateHistory() {
        return updateHistory;
    }
    public Date getUpdateTime() {
        return updateTime;
    }
    public Integer getVersionCode() {
        return versionCode;
    }
    public void setClientId(Long clientId) {
        this.clientId = clientId;
    }
    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }
    public void setUpdateHistory(String updateHistory) {
        this.updateHistory = updateHistory;
    }
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
    public void setVersionCode(Integer versionCode) {
        this.versionCode = versionCode;
    }
}
