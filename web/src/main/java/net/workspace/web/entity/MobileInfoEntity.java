package net.workspace.web.entity;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "t_mobile_info")
public class MobileInfoEntity extends IdEntity {
    private String mobileNumber;
    private String areaCode;
    public MobileInfoEntity() {}
    public MobileInfoEntity(Long id) {
        this.id = id;
    }
    public String getAreaCode() {
        return areaCode;
    }
    public String getMobileNumber() {
        return mobileNumber;
    }
    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }
    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }
}
