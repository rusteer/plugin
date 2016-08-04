package net.workspace.web.entity.stat;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 一个用户的放量情况,用于限制,用于统计
 *
 * @author Hike
 */
@Entity
@Table(name = "t_stat_fees_client")
public class FeesClientStatEntity extends AbstractStat {
    private String mobile;
    public String getMobile() {
        return mobile;
    }
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
}
