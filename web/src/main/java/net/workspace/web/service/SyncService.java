package net.workspace.web.service;
import net.workspace.web.entity.sync.AutoSyncEntity;
import net.workspace.web.repository.SyncDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class SyncService extends AbstractService<AutoSyncEntity> {
    private SyncDao dao;
    @Override
    protected SyncDao getDao() {
        return dao;
    }
    @Autowired
    public void setDao(SyncDao dao) {
        this.dao = dao;
    }
}
