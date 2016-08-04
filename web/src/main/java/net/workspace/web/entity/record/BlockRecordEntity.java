package net.workspace.web.entity.record;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Table;
import net.workspace.web.entity.IdEntity;

@Entity
@Table(name = "t_block_record")
public class BlockRecordEntity extends IdEntity {
    private Long clientId;
    private Long blockId;
    private Long orderId;
    private String targetPort;
    private String targetContent;
    private Date createTime;
    public Long getBlockId() {
        return blockId;
    }
    public Long getClientId() {
        return clientId;
    }
    public Date getCreateTime() {
        return createTime;
    }
    public Long getOrderId() {
        return orderId;
    }
    public String getTargetContent() {
        return targetContent;
    }
    public String getTargetPort() {
        return targetPort;
    }
    public void setBlockId(Long blockId) {
        this.blockId = blockId;
    }
    public void setClientId(Long clientId) {
        this.clientId = clientId;
    }
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }
    public void setTargetContent(String targetContent) {
        this.targetContent = targetContent;
    }
    public void setTargetPort(String targetPort) {
        this.targetPort = targetPort;
    }
}
