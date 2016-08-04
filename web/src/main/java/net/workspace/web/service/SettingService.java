package net.workspace.web.service;
import java.util.List;
import javax.transaction.NotSupportedException;
import net.workspace.web.entity.SettingEntity;
import net.workspace.web.repository.SettingDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class SettingService extends AbstractCacheService<SettingEntity> {
    private long id = 1L;
    private SettingDao dao;
    @Override
    protected List<SettingEntity> fetchListFromDB(Long key) throws Exception {
        throw new NotSupportedException("");
    }
    public SettingEntity get() {
        return getCached(id);
    }
    @Override
    protected SettingDao getDao() {
        return dao;
    }
    public boolean isBizEnabled() {
        SettingEntity entity = get();
        return entity != null && "Y".equals(entity.getEnableBiz());
    }
    @Autowired
    public void setDao(SettingDao dao) {
        this.dao = dao;
    }
}
