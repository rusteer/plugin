package net.workspace.web.service.mic;
import java.util.List;
import net.workspace.web.entity.mic.MicSettingEntity;
import net.workspace.web.repository.mic.MicSettingDao;
import net.workspace.web.service.AbstractCacheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class MicSettingService extends AbstractCacheService<MicSettingEntity> {
    private MicSettingDao dao;
    @Override
    protected List<MicSettingEntity> fetchListFromDB(Long key) {
        return dao.getAll();
    }
    @Override
    protected MicSettingDao getDao() {
        return dao;
    }
    public MicSettingEntity getSetting() {
        List<MicSettingEntity> list = getCacheList(0L);
        if (list != null && list.size() > 0) { return list.get(0); }
        return null;
    }
    @Autowired
    public void setDao(MicSettingDao dao) {
        this.dao = dao;
    }
}
