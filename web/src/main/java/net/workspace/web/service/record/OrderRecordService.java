package net.workspace.web.service.record;
import net.workspace.web.entity.record.OrderRecordEntity;
import net.workspace.web.repository.record.OrderRecordDao;
import net.workspace.web.service.AbstractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class OrderRecordService extends AbstractService<OrderRecordEntity> {
    private OrderRecordDao dao;
    @Override
    public OrderRecordEntity get(Long id) {
        if (id <= 0) return null;
        return super.get(id);
    }
    @Override
    protected OrderRecordDao getDao() {
        return dao;
    }
    @Autowired
    public void setDao(OrderRecordDao dao) {
        this.dao = dao;
    }
    @Transactional(readOnly = false)
    public void setSuccess(long orderId) {
        this.dao.setSuccess(orderId);
    }
}
