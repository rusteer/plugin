package net.workspace.web.entity;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "t_area")
public class AreaEntity extends IdEntity {
    private ProvinceEntity province;
    private String areaCode;
    private String name;
    private String isCaptial;
    public AreaEntity() {}
    public AreaEntity(Long id) {
        super.setId(id);
    }
    public String getAreaCode() {
        return areaCode;
    }
    public String getIsCaptial() {
        return isCaptial;
    }
    public String getName() {
        return name;
    }
    @ManyToOne
    @JoinColumn(name = "province_id")
    public ProvinceEntity getProvince() {
        return province;
    }
    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }
    public void setIsCaptial(String isCaptial) {
        this.isCaptial = isCaptial;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setProvince(ProvinceEntity province) {
        this.province = province;
    }
}
