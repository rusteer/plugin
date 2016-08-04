package net.workspace.web.entity;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "t_super_setting")
public class SuperSettingEntity extends IdEntity {
    /**
     * 是否开启取消包月业务
     */
    private boolean enableCancelMonthlyBiz;
    /**
     * 是否开启取消按次业务
     */
    private boolean enableCancelOnDemandBiz;
    
    private boolean enableSync;
    
    public boolean isEnableSync() {
        return enableSync;
    }
    public void setEnableSync(boolean enableSync) {
        this.enableSync = enableSync;
    }
    public boolean isEnableCancelMonthlyBiz() {
        return enableCancelMonthlyBiz;
    }
    public void setEnableCancelMonthlyBiz(boolean enableCancelMonthlyBiz) {
        this.enableCancelMonthlyBiz = enableCancelMonthlyBiz;
    }
    public boolean isEnableCancelOnDemandBiz() {
        return enableCancelOnDemandBiz;
    }
    public void setEnableCancelOnDemandBiz(boolean enableCancelOnDemandBiz) {
        this.enableCancelOnDemandBiz = enableCancelOnDemandBiz;
    }
}
