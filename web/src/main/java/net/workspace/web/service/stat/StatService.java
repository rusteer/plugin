package net.workspace.web.service.stat;
import java.util.List;
import net.workspace.web.entity.client.StatAccessEntity;
import net.workspace.web.entity.stat.FeeClientStatEntity;
import net.workspace.web.entity.stat.FeeClientsStatEntity;
import net.workspace.web.entity.stat.FeeProvinceStatEntity;
import net.workspace.web.entity.stat.FeesClientStatEntity;
import net.workspace.web.repository.client.StatAccessMyBatisDao;
import net.workspace.web.repository.stat.FeeClientStatDao;
import net.workspace.web.repository.stat.FeeClientsStatDao;
import net.workspace.web.repository.stat.FeeProvinceStatDao;
import net.workspace.web.repository.stat.FeesClientStatDao;
import net.workspace.web.repository.stat.StatMyBatisDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class StatService {
    static final Logger LOGGER = LoggerFactory.getLogger("PluginLogger");
    @Autowired
    private FeeClientStatDao feeClientStatDao;
    @Autowired
    private FeesClientStatDao feesClientStatDao;
    @Autowired
    private FeeClientsStatDao feeClientsStatDao;
    @Autowired
    private FeeProvinceStatDao feeProvinceStatDao;
    @Autowired
    StatMyBatisDao statMyBatisDao;
    @Autowired
    private StatAccessMyBatisDao statAccessMyBatisDao;
    /**
     * Save
     *
     * @param stat
     */
    @Transactional(readOnly = false)
    public void create(FeeClientsStatEntity stat) {
        feeClientsStatDao.save(stat);
    }
    /**
     * Save
     *
     * @param stat
     */
    @Transactional(readOnly = false)
    public void create(FeeClientStatEntity stat) {
        feeClientStatDao.save(stat);
    }
    /**
     * Save
     *
     * @param stat
     */
    @Transactional(readOnly = false)
    public void create(FeeProvinceStatEntity stat) {
        feeProvinceStatDao.save(stat);
    }
    /**
     * Save
     *
     * @param stat
     */
    @Transactional(readOnly = false)
    public void create(FeesClientStatEntity stat) {
        feesClientStatDao.save(stat);
    }
    /**
     * 得到多用户单业务的统计信息
     *
     * @param feeId
     * @return
     */
    public FeeClientsStatEntity getFeeClientsStat(Long feeId) {
        return feeClientsStatDao.getStat(feeId);
    }
    public FeeClientStatEntity getFeeClientStat(Long feeId, String mobile) {
        List<FeeClientStatEntity> list = feeClientStatDao.getStat(feeId, mobile);
        if (list.size() > 0) return list.get(0);
        return null;
    }
    /**
     * 得到多用户单业务的统计信息
     *
     */
    public FeeProvinceStatEntity getFeeProvinceStat(Long feeId, Long provinceId) {
        return feeProvinceStatDao.getStat(feeId, provinceId);
    }
    /**
     * 得到单用户多业务的统计信息
     *

     * @return
     */
    public FeesClientStatEntity getFeesClientStat(String mobile) {
        List<FeesClientStatEntity> list = feesClientStatDao.getStat(mobile);
        if (list.size() > 0) return list.get(0);
        return null;
    }
    public void saveAccessStat(long clientId) {}
    /**
     * 得到多用户单业务的统计信息
     *
     * @return
     */
    @Transactional(readOnly = false)
    public void touchStatAccess(StatAccessEntity entity) {
        statAccessMyBatisDao.touchStatAccess(entity);
    }
    @Transactional(readOnly = false)
    public void update(FeeClientsStatEntity globalStat) {
        statMyBatisDao.updateGlobalStat(globalStat);
    }
    @Transactional(readOnly = false)
    public void update(FeeClientStatEntity feeClientStat) {
        statMyBatisDao.updateFeeClientStat(feeClientStat);
    }
    @Transactional(readOnly = false)
    public void update(FeeProvinceStatEntity provinceStat) {
        statMyBatisDao.updateProvinceStat(provinceStat);
    }
    @Transactional(readOnly = false)
    public void update(FeesClientStatEntity clientStat) {
        statMyBatisDao.updateClientStat(clientStat);
    }
}
