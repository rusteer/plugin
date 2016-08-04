package net.workspace.web.entity.biz;
import javax.persistence.Entity;
import javax.persistence.Table;
import net.workspace.web.entity.IdEntity;

@Entity
@Table(name = "t_biz_limit")
public class BizLimitEntity extends IdEntity {
    private Long bizId;
    private String limitDate;
    private String content;
    public BizLimitEntity() {}
    public BizLimitEntity(Long id) {
        this.id = id;
    }
    public Long getBizId() {
        return bizId;
    }
    public String getContent() {
        return content;
    }
    public String getLimitDate() {
        return limitDate;
    }
    public void setBizId(Long bizId) {
        this.bizId = bizId;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public void setLimitDate(String limitDate) {
        this.limitDate = limitDate;
    }
}
