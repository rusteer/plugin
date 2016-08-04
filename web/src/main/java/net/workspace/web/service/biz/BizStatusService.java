package net.workspace.web.service.biz;
import net.workspace.web.entity.biz.BizStatusEntity;
import net.workspace.web.repository.biz.BizStatusDao;
import net.workspace.web.repository.biz.BizStatusMyBatisDao;
import net.workspace.web.service.AbstractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class BizStatusService extends AbstractService<BizStatusEntity> {
    private BizStatusDao dao;
    @Autowired
    private BizStatusMyBatisDao myBatisDao;
    @Override
    protected BizStatusDao getDao() {
        return dao;
    }
    @Transactional(readOnly = false)
    public void increase(BizStatusEntity data) {
        myBatisDao.increase(data);
    }
    @Autowired
    public void setDao(BizStatusDao dao) {
        this.dao = dao;
    }
}
