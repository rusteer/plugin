package net.workspace.web.entity.sync;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Table;
import net.workspace.web.entity.IdEntity;

@Entity
@Table(name = "t_auto_sync")
public class AutoSyncEntity extends IdEntity {
    private Long feeId;
    private Long provinceId;
    private Long userId;
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
    public Long getUserId() {
        return userId;
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
    public void setUserId(Long userId) {
        this.userId = userId;
    }
}
