package net.workspace.web.repository.channel;
import java.util.List;
import java.util.Map;
import net.workspace.web.entity.channel.ChannelActivateEntity;
import net.workspace.web.repository.MyBatisRepository;

@MyBatisRepository
public interface ChannelActivateMyBatisDao {
    ChannelActivateEntity getActivate(Map<String, Object> parameters);
    List<ChannelActivateEntity> getList(Map<String, Object> params);
    void increaseActivateCount(ChannelActivateEntity data);
    void increaseAllActivateCount(ChannelActivateEntity data);
}
