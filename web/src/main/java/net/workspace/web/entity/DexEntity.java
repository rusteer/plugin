package net.workspace.web.entity;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Table;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.validator.constraints.NotBlank;
import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "t_dex")
public class DexEntity extends IdEntity {
    final static String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
    final static String TIME_ZONE = "GMT+08:00";
    private String status;
    private Date createTime;
    private Date updateTime;
    private long dexLength;
    private String downloadUrl;
    private int version;
    @JsonFormat(pattern = DATE_FORMAT, timezone = TIME_ZONE)
    public Date getCreateTime() {
        return createTime;
    }
    public long getDexLength() {
        return dexLength;
    }
    public String getDownloadUrl() {
        return downloadUrl;
    }
    @NotBlank
    public String getStatus() {
        return status;
    }
    @JsonFormat(pattern = DATE_FORMAT, timezone = TIME_ZONE)
    public Date getUpdateTime() {
        return updateTime;
    }
    public int getVersion() {
        return version;
    }
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    public void setDexLength(long dexLength) {
        this.dexLength = dexLength;
    }
    public void setDownloadUrl(String downloadUrl) {
        this.downloadUrl = downloadUrl;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
    public void setVersion(int version) {
        this.version = version;
    }
    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
