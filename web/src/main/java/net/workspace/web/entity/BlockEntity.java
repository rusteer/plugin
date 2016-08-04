package net.workspace.web.entity;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import net.workspace.web.entity.biz.BizEntity;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "t_block")
public class BlockEntity extends IdEntity {
    private String port;
    private String content;
    private Long expireTime;
    private String reportBlock;
    private String status;
    private String isConfirm;
    private BizEntity biz;
    @JsonBackReference
    @ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY)
    @JoinColumn(name = "fee_id", nullable = true)
    @NotFound(action = NotFoundAction.IGNORE)
    public BizEntity getBiz() {
        return biz;
    }
    public String getContent() {
        return content;
    }
    public Long getExpireTime() {
        return expireTime;
    }
    public String getIsConfirm() {
        return isConfirm;
    }
    public String getPort() {
        return port;
    }
    public String getReportBlock() {
        return reportBlock;
    }
    public String getStatus() {
        return status;
    }
    public void setBiz(BizEntity fee) {
        biz = fee;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public void setExpireTime(Long expireTime) {
        this.expireTime = expireTime;
    }
    public void setIsConfirm(String isConfirm) {
        this.isConfirm = isConfirm;
    }
    public void setPort(String port) {
        this.port = port;
    }
    public void setReportBlock(String reportBlock) {
        this.reportBlock = reportBlock;
    }
    public void setStatus(String status) {
        this.status = status;
    }
}
