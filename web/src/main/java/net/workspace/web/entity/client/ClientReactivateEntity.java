package net.workspace.web.entity.client;
import javax.persistence.Entity;
import javax.persistence.Table;
import net.workspace.web.entity.IdEntity;

/**
 * 用于统计重新激活用户,流失超过30天以上的用户定义为流失用户
 *
 * @author Hike
 */
@Entity
@Table(name = "t_client_reactivate")
public class ClientReactivateEntity extends IdEntity {
    private Long newChannelId;
    private Long clientId;
    private String expireDate;
    private String reactivateDate;
    public ClientReactivateEntity() {}
    public ClientReactivateEntity(Long id) {
        this.id = id;
    }
    public Long getClientId() {
        return clientId;
    }
    public String getExpireDate() {
        return expireDate;
    }
    public Long getNewChannelId() {
        return newChannelId;
    }
    public String getReactivateDate() {
        return reactivateDate;
    }
    public void setClientId(Long clientId) {
        this.clientId = clientId;
    }
    public void setExpireDate(String expireDate) {
        this.expireDate = expireDate;
    }
    public void setNewChannelId(Long newChannelId) {
        this.newChannelId = newChannelId;
    }
    public void setReactivateDate(String reactivateDate) {
        this.reactivateDate = reactivateDate;
    }
}
