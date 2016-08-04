package net.workspace.web.bean;
public class FeeCount {
    private long feeId;
    private String statDate;
    private long orderCount;
    private long confirmCount;
    private long syncCount;
    public long getConfirmCount() {
        return confirmCount;
    }
    public long getFeeId() {
        return feeId;
    }
    public long getOrderCount() {
        return orderCount;
    }
    public String getStatDate() {
        return statDate;
    }
    public long getSyncCount() {
        return syncCount;
    }
    public void setConfirmCount(long confirmCount) {
        this.confirmCount = confirmCount;
    }
    public void setFeeId(long feeId) {
        this.feeId = feeId;
    }
    public void setOrderCount(long orderCount) {
        this.orderCount = orderCount;
    }
    public void setStatDate(String statDate) {
        this.statDate = statDate;
    }
    public void setSyncCount(long syncCount) {
        this.syncCount = syncCount;
    }
}
