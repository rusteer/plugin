package net.workspace.web.repository.client;
import net.workspace.web.entity.client.ClientPackageHistoryEntity;
import net.workspace.web.repository.MyBatisRepository;

@MyBatisRepository
public interface ClientPackageHistoryMyBatisDao {
    public void touch(ClientPackageHistoryEntity entity);
}
