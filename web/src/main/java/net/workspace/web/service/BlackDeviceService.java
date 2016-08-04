package net.workspace.web.service;
import net.workspace.web.entity.BlackDeviceEntity;
import net.workspace.web.repository.BlackDeviceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

@Component
@Transactional(readOnly = true)
public class BlackDeviceService extends AbstractService<BlackDeviceEntity> {
    private BlackDeviceDao dao;
    @Override
    protected BlackDeviceDao getDao() {
        return dao;
    }
    public boolean isBlack(String deviceId) {
        return !CollectionUtils.isEmpty(dao.getBlack(deviceId));
    }
    @Autowired
    public void setDao(BlackDeviceDao dao) {
        this.dao = dao;
    }
}
