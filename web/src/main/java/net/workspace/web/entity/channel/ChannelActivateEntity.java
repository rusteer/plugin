package net.workspace.web.entity.channel;
/**
 * 用于计算渠道激活数,是扣过量的
 *
 * @author Hike
 */
public class ChannelActivateEntity {
    private Long id;
    private Long channelId;
    private String statDate;
    //扣量之后用户数
    private Long activateCount;
    //所有用户数
    private Long AllActivateCount;
    public Long getActivateCount() {
        return activateCount;
    }
    public Long getAllActivateCount() {
        return AllActivateCount;
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
    public void setActivateCount(Long activateCount) {
        this.activateCount = activateCount;
    }
    public void setAllActivateCount(Long allActivateCount) {
        AllActivateCount = allActivateCount;
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
