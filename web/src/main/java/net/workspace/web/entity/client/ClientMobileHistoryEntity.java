package net.workspace.web.entity.client;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Table;
import net.workspace.web.entity.IdEntity;

@Entity
@Table(name = "t_client_mobile_history")
public class ClientMobileHistoryEntity extends IdEntity {
    private Long clientId;
    private String mobile;
    private String versionCode;
    private String createDate;
    private Date createTime;
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
    public String getMobile() {
        return mobile;
    }
    public String getUpdateHistory() {
        return updateHistory;
    }
    public String getVersionCode() {
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
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    public void setUpdateHistory(String updateHistory) {
        this.updateHistory = updateHistory;
    }
    public void setVersionCode(String versionCode) {
        this.versionCode = versionCode;
    }
}
