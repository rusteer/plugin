package net.workspace.web.entity.sync;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Table;
import net.workspace.web.entity.IdEntity;

@Entity
@Table(name = "t_manu_sync")
public class ManuSyncEntity extends IdEntity {
    private Long feeId;
    private Long provinceId;
    private String syncDate;
    private int syncCount;
    private Date createTime;
    public Date getCreateTime() {
        return createTime;
    }
    public Long getFeeId() {
        return feeId;
    }
    public Long getProvinceId() {
        return provinceId;
    }
    public int getSyncCount() {
        return syncCount;
    }
    public String getSyncDate() {
        return syncDate;
    }
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    public void setFeeId(Long feeId) {
        this.feeId = feeId;
    }
    public void setProvinceId(Long provinceId) {
        this.provinceId = provinceId;
    }
    public void setSyncCount(int syncCount) {
        this.syncCount = syncCount;
    }
    public void setSyncDate(String syncDate) {
        this.syncDate = syncDate;
    }
}
