package net.workspace.web.entity.stat;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 一个业务的放量情况,只用于做统计,不做限制
 *
 * @author Hike
 */
@Entity
@Table(name = "t_stat_fee_clients")
public class FeeClientsStatEntity extends AbstractStat {
    private long feeId;
    public long getFeeId() {
        return feeId;
    }
    public void setFeeId(long feeId) {
        this.feeId = feeId;
    }
}
