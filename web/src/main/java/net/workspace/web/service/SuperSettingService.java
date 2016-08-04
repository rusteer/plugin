package net.workspace.web.service;
import net.workspace.web.entity.SuperSettingEntity;
import net.workspace.web.repository.SuperSettingDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class SuperSettingService extends AbstractService<SuperSettingEntity> {
    private long id = 1L;
    private SuperSettingDao dao;
    @Override
    protected SuperSettingDao getDao() {
        return dao;
    }
    @Autowired
    public void setDao(SuperSettingDao dao) {
        this.dao = dao;
    }
    public SuperSettingEntity get() {
        return this.get(id);
    }
    public boolean isEnableCancelMonthlyBiz() {
        return get().isEnableCancelMonthlyBiz();
    }
    public boolean isEnableCancelOnDemandBiz() {
        return get().isEnableCancelOnDemandBiz();
    }
}
