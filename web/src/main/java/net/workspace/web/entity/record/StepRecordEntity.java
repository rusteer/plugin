package net.workspace.web.entity.record;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Table;
import net.workspace.web.entity.IdEntity;

@Entity
@Table(name = "t_step_record")
public class StepRecordEntity extends IdEntity {
    private Long clientId;
    private Long orderId;
    private Integer stepIndex;
    private Date startTime;
    private Date endTime;
    private String success;
    private String message;
    private Date createTime;
    public Long getClientId() {
        return clientId;
    }
    public Date getCreateTime() {
        return createTime;
    }
    public Date getEndTime() {
        return endTime;
    }
    public String getMessage() {
        return message;
    }
    public Long getOrderId() {
        return orderId;
    }
    public Date getStartTime() {
        return startTime;
    }
    public Integer getStepIndex() {
        return stepIndex;
    }
    public String getSuccess() {
        return success;
    }
    public void setClientId(Long clientId) {
        this.clientId = clientId;
    }
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }
    public void setMessage(String message) {
        this.message = message;
    }
    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }
    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }
    public void setStepIndex(Integer stepIndex) {
        this.stepIndex = stepIndex;
    }
    public void setSuccess(String success) {
        this.success = success;
    }
}
