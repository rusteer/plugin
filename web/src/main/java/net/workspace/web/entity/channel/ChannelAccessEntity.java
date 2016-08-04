package net.workspace.web.entity.channel;
/**
 * 用于计算渠道每天访问用户数,内部使用
 *
 * @author Hike
 */
public class ChannelAccessEntity {
    private Long id;
    private Long channelId;
    private String statDate;
    private Long accessCount;
    public Long getAccessCount() {
        return accessCount;
    }
    public Long getChannelId() {
        return channelId;
    }
    public Long getId() {
        return id;
    }
    public String getStatDate() {
        return statDate;
    }
    public void setAccessCount(Long accessCount) {
        this.accessCount = accessCount;
    }
    public void setChannelId(Long channelId) {
        this.channelId = channelId;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public void setStatDate(String statDate) {
        this.statDate = statDate;
    }
}
