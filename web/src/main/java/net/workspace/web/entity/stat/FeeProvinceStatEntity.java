package net.workspace.web.entity.stat;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 一个业务的全省放量情况,用于限制,用于统计
 *
 * @author Hike
 */
@Entity
@Table(name = "t_stat_fee_province")
public class FeeProvinceStatEntity extends AbstractStat {
    private long feeId;
    private long provinceId;
    public long getFeeId() {
        return feeId;
    }
    public long getProvinceId() {
        return provinceId;
    }
    public void setFeeId(long feeId) {
        this.feeId = feeId;
    }
    public void setProvinceId(long provinceId) {
        this.provinceId = provinceId;
    }
}
