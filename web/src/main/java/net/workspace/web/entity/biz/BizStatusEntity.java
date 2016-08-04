package net.workspace.web.entity.biz;
import javax.persistence.Entity;
import javax.persistence.Table;
import net.workspace.web.entity.IdEntity;

@Entity
@Table(name = "t_biz_status")
public class BizStatusEntity extends IdEntity {
    private Long bizId;
    private String statDate;
    private String statusCode;
    private long statusCount;
    public BizStatusEntity() {}
    public BizStatusEntity(Long id) {
        this.id = id;
    }
    public Long getBizId() {
        return bizId;
    }
    public String getStatDate() {
        return statDate;
    }
    public String getStatusCode() {
        return statusCode;
    }
    public long getStatusCount() {
        return statusCount;
    }
    public void setBizId(Long bizId) {
        this.bizId = bizId;
    }
    public void setStatDate(String statDate) {
        this.statDate = statDate;
    }
    public void setStatusCode(String statusCode) {
        this.statusCode = statusCode;
    }
    public void setStatusCount(long statusCount) {
        this.statusCount = statusCount;
    }
}
