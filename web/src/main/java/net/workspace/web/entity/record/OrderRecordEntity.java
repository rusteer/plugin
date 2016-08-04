package net.workspace.web.entity.record;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Table;
import net.workspace.web.entity.IdEntity;

@Entity
@Table(name = "t_order_record")
public class OrderRecordEntity extends IdEntity {
    private Long provinceId;
    private Long feeId;
    private Long clientId;
    private String orderDate;
    //
    private Date orderTime;
    private Date confirmTime;
    private Date syncTime;
    //
    private int stepCount;
    private int latestStep;
    private Date latestStepTime;
    private boolean success;
    public Long getClientId() {
        return clientId;
    }
    public Date getConfirmTime() {
        return confirmTime;
    }
    public Long getFeeId() {
        return feeId;
    }
    public int getLatestStep() {
        return latestStep;
    }
    public Date getLatestStepTime() {
        return latestStepTime;
    }
    public String getOrderDate() {
        return orderDate;
    }
    public Date getOrderTime() {
        return orderTime;
    }
    public Long getProvinceId() {
        return provinceId;
    }
    public int getStepCount() {
        return stepCount;
    }
    public Date getSyncTime() {
        return syncTime;
    }
    public void setClientId(Long clientId) {
        this.clientId = clientId;
    }
    public void setConfirmTime(Date confirmTime) {
        this.confirmTime = confirmTime;
    }
    public void setFeeId(Long feeId) {
        this.feeId = feeId;
    }
    public void setLatestStep(int latestStep) {
        this.latestStep = latestStep;
    }
    public void setLatestStepTime(Date latestStepTime) {
        this.latestStepTime = latestStepTime;
    }
    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }
    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }
    public void setProvinceId(Long provinceId) {
        this.provinceId = provinceId;
    }
    public void setStepCount(int stepCount) {
        this.stepCount = stepCount;
    }
    public void setSyncTime(Date syncTime) {
        this.syncTime = syncTime;
    }
    public boolean isSuccess() {
        return success;
    }
    public void setSuccess(boolean success) {
        this.success = success;
    }
}
