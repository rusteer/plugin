package net.workspace.web.entity.client;
import javax.persistence.Entity;
import javax.persistence.Table;
import net.workspace.web.entity.IdEntity;

@Entity
@Table(name = "t_stat_access")
public class StatAccessEntity extends IdEntity {
    private String accessDate;
    private long clientId;
    public String getAccessDate() {
        return accessDate;
    }
    public long getClientId() {
        return clientId;
    }
    public void setAccessDate(String accessDate) {
        this.accessDate = accessDate;
    }
    public void setClientId(long clientId) {
        this.clientId = clientId;
    }
}
