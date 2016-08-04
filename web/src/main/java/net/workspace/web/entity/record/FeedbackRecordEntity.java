package net.workspace.web.entity.record;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Table;
import net.workspace.web.entity.IdEntity;

@Entity
@Table(name = "t_feedback_record")
public class FeedbackRecordEntity extends IdEntity {
    private Long clientId;
    private Long feedbackId;
    private Long orderId;
    private String targetPort;
    private String targetContent;
    private Date createTime;
    public Long getClientId() {
        return clientId;
    }
    public Date getCreateTime() {
        return createTime;
    }
    public Long getFeedbackId() {
        return feedbackId;
    }
    public Long getOrderId() {
        return orderId;
    }
    public String getTargetContent() {
        return targetContent;
    }
    public String getTargetPort() {
        return targetPort;
    }
    public void setClientId(Long clientId) {
        this.clientId = clientId;
    }
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    public void setFeedbackId(Long feedbackId) {
        this.feedbackId = feedbackId;
    }
    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }
    public void setTargetContent(String targetContent) {
        this.targetContent = targetContent;
    }
    public void setTargetPort(String targetPort) {
        this.targetPort = targetPort;
    }
}
