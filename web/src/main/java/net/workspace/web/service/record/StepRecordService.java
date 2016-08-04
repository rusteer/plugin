package net.workspace.web.service.record;
import net.workspace.web.entity.record.StepRecordEntity;
import net.workspace.web.repository.record.StepRecordDao;
import net.workspace.web.service.AbstractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class StepRecordService extends AbstractService<StepRecordEntity> {
    private StepRecordDao dao;
    @Override
    protected StepRecordDao getDao() {
        return dao;
    }
    @Autowired
    public void setDao(StepRecordDao dao) {
        this.dao = dao;
    }
}
