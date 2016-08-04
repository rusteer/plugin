package net.workspace.web.service.client;
import net.workspace.web.entity.client.ClientPackageHistoryEntity;
import net.workspace.web.repository.client.ClientPackageHistoryMyBatisDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class ClientPackageHistoryService {
    @Autowired
    ClientPackageHistoryMyBatisDao dao;
    @Transactional(readOnly = false)
    public void touch(ClientPackageHistoryEntity entity) {
        dao.touch(entity);
    }
}
