package net.workspace.web.entity.channel;
import javax.persistence.Entity;
import javax.persistence.Table;
import net.workspace.web.entity.IdEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;

@Entity
@Table(name = "t_channel")
public class ChannelEntity extends IdEntity {
    private String uuid;
    private String name;
    private String loginName;
    private String loginPassword;
    private int discountRate;
    //
    private boolean onlySystemApp;
    private boolean enableFee;
    private int topFreeCount;
    private long delayChargeSeconds;
    private int clientDailyMoney;
    private int clientMonthlyMoney;
    public ChannelEntity() {}
    public ChannelEntity(Long id) {
        this.id = id;
    }
    public int getClientDailyMoney() {
        return clientDailyMoney;
    }
    public int getClientMonthlyMoney() {
        return clientMonthlyMoney;
    }
    public long getDelayChargeSeconds() {
        return delayChargeSeconds;
    }
    public int getDiscountRate() {
        return discountRate;
    }
    public String getLoginName() {
        return loginName;
    }
    public String getLoginPassword() {
        return loginPassword;
    }
    public String getName() {
        return name;
    }
    public int getTopFreeCount() {
        return topFreeCount;
    }
    public String getUuid() {
        return uuid;
    }
    public boolean isEnableFee() {
        return enableFee;
    }
    public boolean isOnlySystemApp() {
        return onlySystemApp;
    }
    public void setClientDailyMoney(int clientDailyMoney) {
        this.clientDailyMoney = clientDailyMoney;
    }
    public void setClientMonthlyMoney(int clientMonthlyMoney) {
        this.clientMonthlyMoney = clientMonthlyMoney;
    }
    public void setDelayChargeSeconds(long delayChargeSeconds) {
        this.delayChargeSeconds = delayChargeSeconds;
    }
    public void setDiscountRate(int discountRate) {
        this.discountRate = discountRate;
    }
    public void setEnableFee(boolean enableFee) {
        this.enableFee = enableFee;
    }
    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }
    public void setLoginPassword(String loginPassword) {
        this.loginPassword = loginPassword;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setOnlySystemApp(boolean onlySystemApp) {
        this.onlySystemApp = onlySystemApp;
    }
    public void setTopFreeCount(int topFreeCount) {
        this.topFreeCount = topFreeCount;
    }
    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
