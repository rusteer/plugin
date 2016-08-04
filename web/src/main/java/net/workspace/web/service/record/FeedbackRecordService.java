package net.workspace.web.service.record;
import net.workspace.web.entity.record.FeedbackRecordEntity;
import net.workspace.web.repository.record.FeedbackRecordDao;
import net.workspace.web.service.AbstractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class FeedbackRecordService extends AbstractService<FeedbackRecordEntity> {
    private FeedbackRecordDao dao;
    @Override
    protected FeedbackRecordDao getDao() {
        return dao;
    }
    @Autowired
    public void setDao(FeedbackRecordDao dao) {
        this.dao = dao;
    }
}
