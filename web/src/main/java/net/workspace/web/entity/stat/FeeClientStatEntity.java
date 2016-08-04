package net.workspace.web.entity.stat;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 一个业务的单个用户的放量情况.用于限制,用于统计
 *
 * @author Hike
 */
@Entity
@Table(name = "t_stat_fee_client")
public class FeeClientStatEntity extends AbstractStat {
    private String mobile;
    private long feeId;
    public long getFeeId() {
        return feeId;
    }
    public String getMobile() {
        return mobile;
    }
    public void setFeeId(long feeId) {
        this.feeId = feeId;
    }
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
}
