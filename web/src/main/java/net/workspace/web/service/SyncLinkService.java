package net.workspace.web.service;
import net.workspace.web.entity.sync.AutoSyncLinkEntity;
import net.workspace.web.repository.SyncLinkDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class SyncLinkService extends AbstractService<AutoSyncLinkEntity> {
    private SyncLinkDao dao;
    public AutoSyncLinkEntity findByLinkId(String linkId) {
        return dao.findByLinkId(linkId);
    }
    @Override
    protected SyncLinkDao getDao() {
        return dao;
    }
    @Autowired
    public void setDao(SyncLinkDao dao) {
        this.dao = dao;
    }
}
