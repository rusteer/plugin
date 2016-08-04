package net.workspace.web.entity.sync;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Table;
import net.workspace.web.entity.IdEntity;

@Entity
@Table(name = "t_auto_sync_link")
public class AutoSyncLinkEntity extends IdEntity {
    private String linkId;
    private String mobile;
    private String port;
    private String command;
    private String serviceId;
    private Date createTime;
    public String getCommand() {
        return command;
    }
    public Date getCreateTime() {
        return createTime;
    }
    public String getLinkId() {
        return linkId;
    }
    public String getMobile() {
        return mobile;
    }
    public String getPort() {
        return port;
    }
    public String getServiceId() {
        return serviceId;
    }
    public void setCommand(String command) {
        this.command = command;
    }
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    public void setLinkId(String linkId) {
        this.linkId = linkId;
    }
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    public void setPort(String port) {
        this.port = port;
    }
    public void setServiceId(String serviceId) {
        this.serviceId = serviceId;
    }
}
