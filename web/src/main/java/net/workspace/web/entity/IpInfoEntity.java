package net.workspace.web.entity;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "t_ip_info")
public class IpInfoEntity extends IdEntity {
    private long ipFrom;
    private long ipTo;
    private long provinceId;
    private long cityId;
    public long getIpFrom() {
        return ipFrom;
    }
    public void setIpFrom(long ipFrom) {
        this.ipFrom = ipFrom;
    }
    public long getIpTo() {
        return ipTo;
    }
    public void setIpTo(long ipTo) {
        this.ipTo = ipTo;
    }
    public long getProvinceId() {
        return provinceId;
    }
    public void setProvinceId(long provinceId) {
        this.provinceId = provinceId;
    }
    public long getCityId() {
        return cityId;
    }
    public void setCityId(long cityId) {
        this.cityId = cityId;
    }
}
