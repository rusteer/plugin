package net.workspace.web.service.mic;
import java.util.List;
import net.workspace.web.entity.mic.MicEntity;
import net.workspace.web.repository.mic.MicDao;
import net.workspace.web.service.AbstractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class MicService extends AbstractService<MicEntity> {
    private MicDao dao;
    public List<MicEntity> getAllEnabled() {
        return dao.getAllEnabled();
    }
    public List<MicEntity> getAllEnabledByType(int type) {
        return dao.getAllEnabledByType(type);
    }
    public MicEntity getByPackageName(String packageName) {
        return dao.getByPackageName(packageName);
    }
    @Override
    protected MicDao getDao() {
        return dao;
    }
    @Autowired
    public void setDao(MicDao dao) {
        this.dao = dao;
    }
}
