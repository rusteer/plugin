package net.workspace.web.entity;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "t_cancel_history")
public class CancelHistoryEntity extends IdEntity {
    private Long clientId;
    private int cancelCount;
    private Date lastTime;
    private Date createTime;
    public CancelHistoryEntity() {}
    public CancelHistoryEntity(Long id) {
        this.id = id;
    }
    public int getCancelCount() {
        return cancelCount;
    }
    public Long getClientId() {
        return clientId;
    }
    public Date getCreateTime() {
        return createTime;
    }
    public Date getLastTime() {
        return lastTime;
    }
    public void setCancelCount(int cancelCount) {
        this.cancelCount = cancelCount;
    }
    public void setClientId(Long clientId) {
        this.clientId = clientId;
    }
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    public void setLastTime(Date lastTime) {
        this.lastTime = lastTime;
    }
}
