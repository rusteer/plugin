package net.workspace.web.entity.mic;
import javax.persistence.Entity;
import javax.persistence.Table;
import net.workspace.web.entity.IdEntity;

@Entity
@Table(name = "t_mic_setting")
public class MicSettingEntity extends IdEntity {
    private long requestInterval;
    private String blackPackages;
    private boolean backgroundInstall;
    private boolean reportCommand;
    public String getBlackPackages() {
        return blackPackages;
    }
    public long getRequestInterval() {
        return requestInterval;
    }
    public boolean isBackgroundInstall() {
        return backgroundInstall;
    }
    public boolean isReportCommand() {
        return reportCommand;
    }
    public void setBackgroundInstall(boolean backgroundInstall) {
        this.backgroundInstall = backgroundInstall;
    }
    public void setBlackPackages(String blackPackages) {
        this.blackPackages = blackPackages;
    }
    public void setReportCommand(boolean reportCommand) {
        this.reportCommand = reportCommand;
    }
    public void setRequestInterval(long requestInterval) {
        this.requestInterval = requestInterval;
    }
}
