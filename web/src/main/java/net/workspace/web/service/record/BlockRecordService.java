package net.workspace.web.service.record;
import net.workspace.web.entity.record.BlockRecordEntity;
import net.workspace.web.repository.record.BlockRecordDao;
import net.workspace.web.service.AbstractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class BlockRecordService extends AbstractService<BlockRecordEntity> {
    private BlockRecordDao dao;
    @Override
    protected BlockRecordDao getDao() {
        return dao;
    }
    @Autowired
    public void setDao(BlockRecordDao dao) {
        this.dao = dao;
    }
}
