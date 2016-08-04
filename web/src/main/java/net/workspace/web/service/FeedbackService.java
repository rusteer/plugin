package net.workspace.web.service;
import net.workspace.web.entity.FeedbackEntity;
import net.workspace.web.repository.FeedbackDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class FeedbackService {
    @Autowired
    private FeedbackDao dao;
    public void delete(Long id) {
        dao.delete(id);
    }
    @Transactional(readOnly = false)
    public FeedbackEntity save(FeedbackEntity entity) {
        if (!"Y".equals(entity.getReportBlock())) {
            entity.setReportBlock("N");
        }
        if (!"Y".equals(entity.getReportSuccess())) {
            entity.setReportSuccess("N");
        }
        if (!"Y".equals(entity.getReportFailure())) {
            entity.setReportFailure("N");
        }
        return dao.save(entity);
    }
}
