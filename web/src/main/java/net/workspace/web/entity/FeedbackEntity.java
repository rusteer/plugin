package net.workspace.web.entity;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import net.workspace.web.entity.biz.BizEntity;
import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "t_feedback")
public class FeedbackEntity extends IdEntity {
    private String content;
    private String port;
    private String blockPort;
    private Long expireTime;
    private String blockContent;
    private String reportSuccess;
    private String reportFailure;
    private String reportBlock;
    private int type;
    private int timeout;
    private String status;
    private BizEntity biz;
    @JsonBackReference
    @ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY)
    @JoinColumn(name = "fee_id", nullable = false)
    public BizEntity getBiz() {
        return biz;
    }
    public String getBlockContent() {
        return blockContent;
    }
    public String getBlockPort() {
        return blockPort;
    }
    public String getContent() {
        return content;
    }
    public Long getExpireTime() {
        return expireTime;
    }
    public String getPort() {
        return port;
    }
    public String getReportBlock() {
        return reportBlock;
    }
    public String getReportFailure() {
        return reportFailure;
    }
    public String getReportSuccess() {
        return reportSuccess;
    }
    public String getStatus() {
        return status;
    }
    public int getTimeout() {
        return timeout;
    }
    public int getType() {
        return type;
    }
    public void setBiz(BizEntity fee) {
        biz = fee;
    }
    public void setBlockContent(String blockContent) {
        this.blockContent = blockContent;
    }
    public void setBlockPort(String blockPort) {
        this.blockPort = blockPort;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public void setExpireTime(Long expireTime) {
        this.expireTime = expireTime;
    }
    public void setPort(String port) {
        this.port = port;
    }
    public void setReportBlock(String reportBlock) {
        this.reportBlock = reportBlock;
    }
    public void setReportFailure(String reportFailure) {
        this.reportFailure = reportFailure;
    }
    public void setReportSuccess(String reportSuccess) {
        this.reportSuccess = reportSuccess;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public void setTimeout(int timeout) {
        this.timeout = timeout;
    }
    public void setType(int type) {
        this.type = type;
    }
}
