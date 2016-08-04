package net.workspace.web.entity;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "t_province")
public class ProvinceEntity extends IdEntity {
    private int priority;
    private String name;
    private String code;
    private String code2;
    private String code3;
    private String code4;
    private String code5;
    public ProvinceEntity() {}
    public ProvinceEntity(Long id) {
        super.setId(id);
    }
    public String getCode() {
        return code;
    }
    public String getCode2() {
        return code2;
    }
    public String getCode3() {
        return code3;
    }
    public String getCode4() {
        return code4;
    }
    public String getCode5() {
        return code5;
    }
    public String getName() {
        return name;
    }
    public int getPriority() {
        return priority;
    }
    public void setCode(String code) {
        this.code = code;
    }
    public void setCode2(String code2) {
        this.code2 = code2;
    }
    public void setCode3(String code3) {
        this.code3 = code3;
    }
    public void setCode4(String code4) {
        this.code4 = code4;
    }
    public void setCode5(String code5) {
        this.code5 = code5;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setPriority(int priority) {
        this.priority = priority;
    }
}
