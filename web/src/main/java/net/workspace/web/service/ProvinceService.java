package net.workspace.web.service;
import java.util.List;
import net.workspace.web.entity.ProvinceEntity;
import net.workspace.web.repository.ProvinceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class ProvinceService extends AbstractCacheService<ProvinceEntity> {
    private ProvinceDao dao;
    @Override
    protected List<ProvinceEntity> fetchListFromDB(Long key) {
        if (key == 0) return dao.getAll();
        return null;
    }
    @Override
    public List<ProvinceEntity> getAll() {
        return getCacheList(0L);
    }
    public ProvinceEntity getByCode(String code) {
        return dao.getByCode(code);
    }
    @Override
    protected ProvinceDao getDao() {
        return dao;
    }
    @Autowired
    public void setDao(ProvinceDao dao) {
        this.dao = dao;
    }
}
