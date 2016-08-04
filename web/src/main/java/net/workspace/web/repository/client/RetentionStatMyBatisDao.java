package net.workspace.web.repository.client;
import java.util.List;
import java.util.Map;
import net.workspace.web.entity.client.RetentionStatEntity;
import net.workspace.web.repository.MyBatisRepository;

@MyBatisRepository
public interface RetentionStatMyBatisDao {
    RetentionStatEntity getAccess(Map<String, Object> parameters);
    List<RetentionStatEntity> getList(Map<String, Object> params);
    void increaseAccessCount(RetentionStatEntity data);
}
