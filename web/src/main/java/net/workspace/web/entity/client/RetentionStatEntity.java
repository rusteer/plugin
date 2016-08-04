package net.workspace.web.entity.client;
/**
 * 用于记录留存率
 *
 * @author Hike
 */
public class RetentionStatEntity {
    private Long id;
    private Long channelId;
    private String createDate;
    private String statDate;
    private Long statCount;
    public Long getChannelId() {
        return channelId;
    }
    public String getCreateDate() {
        return createDate;
    }
    public Long getId() {
        return id;
    }
    public Long getStatCount() {
        return statCount;
    }
    public String getStatDate() {
        return statDate;
    }
    public void setChannelId(Long channelId) {
        this.channelId = channelId;
    }
    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public void setStatCount(Long statCount) {
        this.statCount = statCount;
    }
    public void setStatDate(String statDate) {
        this.statDate = statDate;
    }
}
