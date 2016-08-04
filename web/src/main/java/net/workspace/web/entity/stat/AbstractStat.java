package net.workspace.web.entity.stat;
import java.util.Date;
import javax.persistence.MappedSuperclass;
import net.workspace.web.entity.IdEntity;

@MappedSuperclass
public abstract class AbstractStat extends IdEntity {
    private String statDate;
    private int dateOrderMoney;
    private String statMonth;
    private int monthOrderMoney;
    private Date lastFeeTime;
    public AbstractStat() {
        super();
    }
    public int getDateOrderMoney() {
        return dateOrderMoney;
    }
    public Date getLastFeeTime() {
        return lastFeeTime;
    }
    public int getMonthOrderMoney() {
        return monthOrderMoney;
    }
    public String getStatDate() {
        return statDate;
    }
    public String getStatMonth() {
        return statMonth;
    }
    public void setDateOrderMoney(int dateOrderMoney) {
        this.dateOrderMoney = dateOrderMoney;
    }
    public void setLastFeeTime(Date lastFeeTime) {
        this.lastFeeTime = lastFeeTime;
    }
    public void setMonthOrderMoney(int monthOrderMoney) {
        this.monthOrderMoney = monthOrderMoney;
    }
    public void setStatDate(String statDate) {
        this.statDate = statDate;
    }
    public void setStatMonth(String statMonth) {
        this.statMonth = statMonth;
    }
}