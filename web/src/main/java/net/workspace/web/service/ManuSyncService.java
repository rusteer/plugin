package net.workspace.web.service;
import java.util.List;
import net.workspace.web.entity.sync.ManuSyncEntity;
import net.workspace.web.repository.ManuSyncDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class ManuSyncService extends AbstractService<ManuSyncEntity> {
    private ManuSyncDao dao;
    public ManuSyncEntity find(Long feeId, Long provinceId, String syncDate) {
        return dao.find(feeId, provinceId, syncDate);
    }
    @Override
    protected ManuSyncDao getDao() {
        return dao;
    }
    public List<ManuSyncEntity> getList(long feeId, long provinceId, String fromDate, String endDate) {
        return provinceId == 0 ? dao.findByFeeId(feeId, fromDate, endDate) : dao.findByFeeAndProvince(feeId, provinceId, fromDate, endDate);
    }
    @Autowired
    public void setDao(ManuSyncDao dao) {
        this.dao = dao;
    }
}
