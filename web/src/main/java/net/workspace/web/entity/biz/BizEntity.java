package net.workspace.web.entity.biz;
import java.util.Set;
//ALTER TABLE `plugin`.`t_biz` ADD COLUMN `payment_type` INT NULL  AFTER `require_imsi_imei` , ADD COLUMN `keyword` VARCHAR(145) NULL  AFTER `payment_type` ;
//ALTER TABLE `plugin`.`t_biz` CHANGE COLUMN `payment_type` `payment_type` INT(11) NOT NULL DEFAULT 1  ;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import net.workspace.web.entity.BlockEntity;
import net.workspace.web.entity.FeedbackEntity;
import net.workspace.web.entity.IdEntity;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

@Entity
@Table(name = "t_biz")
public class BizEntity extends IdEntity {
    private String name;
    private String partner;
    private String port;
    private String command;
    //用来做同步用
    private String syncPort;
    private String syncCommand;
    private int carrierOperator;
    private String order; //In Json Value;
    private String bizType;
    private String reportSuccess;
    private String reportFailure;
    private int price;
    private int sharing;
    private String areaRule;
    private String comments;
    private String status;
    private String requireImsiImei;
    private String targetClient;
    private int paymentType;
    private String keyword;
    private int syncMethod;//1:自动,2:手动
    private int targetVersion;
    private int hotLevel;
    private int paymentCycle;//1:周结,2:月结
    private String brotherIds;
    private int brotherDailyMoney;
    private int brotherMonthlyMoney;
    private int brotherDailyCount;
    private int brotherMonthlyCount;
    private int clientDailyMoney;
    private int clientMonthlyMoney;
    private int clientInterval;
    private int globalDailyMoney;
    private int globalInterval;
    private int provinceDailyMoney;
    private int provinceInterval;
    private String startDate;
    private String endDate;
    private int startHour;
    private int endHour;
    private int smsSendTimes;
    private String bizCode;
    private java.util.Date createTime;
    private java.util.Date updateTime;
    private Set<BlockEntity> blockSet;
    private Set<FeedbackEntity> feedbackSet;
    public String getAreaRule() {
        return areaRule;
    }
    public String getBizCode() {
        return bizCode;
    }
    public String getBizType() {
        return bizType;
    }
    @OneToMany(mappedBy = "biz", cascade = { CascadeType.ALL })
    @NotFound(action = NotFoundAction.IGNORE)
    public Set<BlockEntity> getBlockSet() {
        return blockSet;
    }
    public int getBrotherDailyCount() {
        return brotherDailyCount;
    }
    public int getBrotherDailyMoney() {
        return brotherDailyMoney;
    }
    public String getBrotherIds() {
        return brotherIds;
    }
    public int getBrotherMonthlyCount() {
        return brotherMonthlyCount;
    }
    public int getBrotherMonthlyMoney() {
        return brotherMonthlyMoney;
    }
    public int getClientDailyMoney() {
        return clientDailyMoney;
    }
    public int getClientInterval() {
        return clientInterval;
    }
    public int getClientMonthlyMoney() {
        return clientMonthlyMoney;
    }
    public String getCommand() {
        return command;
    }
    public String getComments() {
        return comments;
    }
    public java.util.Date getCreateTime() {
        return createTime;
    }
    public String getEndDate() {
        return endDate;
    }
    public int getEndHour() {
        return endHour;
    }
    @OneToMany(mappedBy = "biz", cascade = { CascadeType.ALL })
    @NotFound(action = NotFoundAction.IGNORE)
    public Set<FeedbackEntity> getFeedbackSet() {
        return feedbackSet;
    }
    public int getGlobalDailyMoney() {
        return globalDailyMoney;
    }
    public int getGlobalInterval() {
        return globalInterval;
    }
    public int getHotLevel() {
        return hotLevel;
    }
    public String getKeyword() {
        return keyword;
    }
    public String getName() {
        return name;
    }
    @Column(name = "fee_order")
    public String getOrder() {
        return order;
    }
    public String getPartner() {
        return partner;
    }
    public int getPaymentCycle() {
        return paymentCycle;
    }
    public int getPaymentType() {
        return paymentType;
    }
    public String getPort() {
        return port;
    }
    public int getPrice() {
        return price;
    }
    public int getProvinceDailyMoney() {
        return provinceDailyMoney;
    }
    public int getProvinceInterval() {
        return provinceInterval;
    }
    public String getReportFailure() {
        return reportFailure;
    }
    public String getReportSuccess() {
        return reportSuccess;
    }
    public String getRequireImsiImei() {
        return requireImsiImei;
    }
    public int getSharing() {
        return sharing;
    }
    public String getStartDate() {
        return startDate;
    }
    public int getStartHour() {
        return startHour;
    }
    public String getStatus() {
        return status;
    }
    public int getSyncMethod() {
        return syncMethod;
    }
    public String getTargetClient() {
        return targetClient;
    }
    public int getTargetVersion() {
        return targetVersion;
    }
    public java.util.Date getUpdateTime() {
        return updateTime;
    }
    public void setAreaRule(String areaRule) {
        this.areaRule = areaRule;
    }
    public void setBizCode(String bizCode) {
        this.bizCode = bizCode;
    }
    public void setBizType(String bizType) {
        this.bizType = bizType;
    }
    public void setBlockSet(Set<BlockEntity> blockSet) {
        this.blockSet = blockSet;
    }
    public void setBrotherDailyCount(int brotherDailyCount) {
        this.brotherDailyCount = brotherDailyCount;
    }
    public void setBrotherDailyMoney(int brotherDailyMoney) {
        this.brotherDailyMoney = brotherDailyMoney;
    }
    public void setBrotherIds(String brotherIds) {
        this.brotherIds = brotherIds;
    }
    public void setBrotherMonthlyCount(int brotherMonthlyCount) {
        this.brotherMonthlyCount = brotherMonthlyCount;
    }
    public void setBrotherMonthlyMoney(int brotherMonthlyMoney) {
        this.brotherMonthlyMoney = brotherMonthlyMoney;
    }
    public void setClientDailyMoney(int clientDailyMoney) {
        this.clientDailyMoney = clientDailyMoney;
    }
    public void setClientInterval(int clientInterval) {
        this.clientInterval = clientInterval;
    }
    public void setClientMonthlyMoney(int clientMonthlyMoney) {
        this.clientMonthlyMoney = clientMonthlyMoney;
    }
    public void setCommand(String command) {
        this.command = command;
    }
    public void setComments(String comments) {
        this.comments = comments;
    }
    public void setCreateTime(java.util.Date createTime) {
        this.createTime = createTime;
    }
    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }
    public void setEndHour(int endHour) {
        this.endHour = endHour;
    }
    public void setFeedbackSet(Set<FeedbackEntity> feedbackSet) {
        this.feedbackSet = feedbackSet;
    }
    public void setGlobalDailyMoney(int globalDailyMoney) {
        this.globalDailyMoney = globalDailyMoney;
    }
    public void setGlobalInterval(int globalInterval) {
        this.globalInterval = globalInterval;
    }
    public void setHotLevel(int hotLevel) {
        this.hotLevel = hotLevel;
    }
    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setOrder(String order) {
        this.order = order;
    }
    public void setPartner(String partner) {
        this.partner = partner;
    }
    public void setPaymentCycle(int paymentCycle) {
        this.paymentCycle = paymentCycle;
    }
    public void setPaymentType(int paymentType) {
        this.paymentType = paymentType;
    }
    public void setPort(String port) {
        this.port = port;
    }
    public void setPrice(int price) {
        this.price = price;
    }
    public void setProvinceDailyMoney(int provinceDailyMoney) {
        this.provinceDailyMoney = provinceDailyMoney;
    }
    public void setProvinceInterval(int provinceInterval) {
        this.provinceInterval = provinceInterval;
    }
    public void setReportFailure(String reportFailure) {
        this.reportFailure = reportFailure;
    }
    public void setReportSuccess(String reportSuccess) {
        this.reportSuccess = reportSuccess;
    }
    public void setRequireImsiImei(String requireImsiImei) {
        this.requireImsiImei = requireImsiImei;
    }
    public void setSharing(int sharing) {
        this.sharing = sharing;
    }
    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }
    public void setStartHour(int startHour) {
        this.startHour = startHour;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public void setSyncMethod(int syncMethod) {
        this.syncMethod = syncMethod;
    }
    public void setTargetClient(String targetClient) {
        this.targetClient = targetClient;
    }
    public void setTargetVersion(int targetVersion) {
        this.targetVersion = targetVersion;
    }
    public void setUpdateTime(java.util.Date updateTime) {
        this.updateTime = updateTime;
    }
    public String getSyncCommand() {
        return syncCommand;
    }
    public void setSyncCommand(String syncCommand) {
        this.syncCommand = syncCommand;
    }
    public String getSyncPort() {
        return syncPort;
    }
    public void setSyncPort(String syncPort) {
        this.syncPort = syncPort;
    }
    public int getCarrierOperator() {
        return carrierOperator;
    }
    public void setCarrierOperator(int carrierOperator) {
        this.carrierOperator = carrierOperator;
    }
    public int getSmsSendTimes() {
        return smsSendTimes;
    }
    public void setSmsSendTimes(int smsSendTimes) {
        this.smsSendTimes = smsSendTimes;
    }
}
