package net.workspace.web.repository.client;
import net.workspace.web.repository.MyBatisRepository;

@MyBatisRepository
public interface StatAccessMyBatisDao {
    void touchStatAccess(net.workspace.web.entity.client.StatAccessEntity entity);
}
