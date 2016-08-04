package net.workspace.web.service;
import java.util.List;
import net.workspace.web.entity.BlockEntity;
import net.workspace.web.repository.BlockDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class BlockService extends AbstractService<BlockEntity> {
    private BlockDao dao;
    @Override
    protected BlockDao getDao() {
        return dao;
    }
    public List<BlockEntity> getListByFeeId(Long id) {
        // TODO Auto-generated method stub
        return getAll();
    }
    @Override
    @Transactional(readOnly = false)
    public BlockEntity save(BlockEntity entity) {
        if (!"Y".equals(entity.getReportBlock())) {
            entity.setReportBlock("N");
        }
        return super.save(entity);
    }
    @Autowired
    public void setDao(BlockDao dao) {
        this.dao = dao;
    }
}
