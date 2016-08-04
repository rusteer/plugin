package net.workspace.web.entity;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "t_black_device")
public class BlackDeviceEntity {
    protected String deviceId;
    public BlackDeviceEntity() {}
    public BlackDeviceEntity(String deviceId) {
        this.deviceId = deviceId;
    }
    @Id
    public String getDeviceId() {
        return deviceId;
    }
    public void setDeviceId(String deviceId) {
        this.deviceId = deviceId;
    }
}
