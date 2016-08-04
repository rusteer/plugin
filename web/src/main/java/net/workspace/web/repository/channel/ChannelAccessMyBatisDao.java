package net.workspace.web.repository.channel;
import java.util.List;
import java.util.Map;
import net.workspace.web.entity.channel.ChannelAccessEntity;
import net.workspace.web.repository.MyBatisRepository;

@MyBatisRepository
public interface ChannelAccessMyBatisDao {
    ChannelAccessEntity getAccess(Map<String, Object> parameters);
    List<ChannelAccessEntity> getList(Map<String, Object> params);
    void increaseAccessCount(ChannelAccessEntity data);
}
