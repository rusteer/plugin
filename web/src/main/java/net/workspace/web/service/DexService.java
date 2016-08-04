package net.workspace.web.service;
import java.util.List;
import net.workspace.web.entity.DexEntity;
import net.workspace.web.repository.DexDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class DexService extends AbstractCacheService<DexEntity> {
    private DexDao dao;
    @Override
    protected List<DexEntity> fetchListFromDB(Long key) {
        return dao.getLastVersion();
    }
    @Override
    public DexDao getDao() {
        return dao;
    }
    public DexEntity getLastVersion() {
        List<DexEntity> list = dao.getLastVersion();
        if (list != null && list.size() > 0) { return list.get(0); }
        return null;
    }
    @Autowired
    public void setDao(DexDao dao) {
        this.dao = dao;
    }
}
