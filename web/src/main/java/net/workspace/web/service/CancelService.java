package net.workspace.web.service;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import net.workspace.web.entity.CancelHistoryEntity;
import net.workspace.web.entity.SettingEntity;
import net.workspace.web.entity.client.ClientEntity;
import net.workspace.web.repository.CancelHistoryDao;
import net.workspace.web.repository.CancelHistoryMyBatisDao;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class CancelService extends AbstractService<CancelHistoryEntity> {
    class DaysRange {
        int from;
        int to;
    }
    static final Logger LOGGER = LoggerFactory.getLogger("IQLogger");
    @Autowired
    SettingService settingService;
    @Autowired
    CancelHistoryMyBatisDao myBatisDao;
    private CancelHistoryDao dao;
    public CancelHistoryEntity getByClientId(Long clientId) {
        return dao.getByClientId(clientId);
    }
    @Override
    protected CancelHistoryDao getDao() {
        return dao;
    }
    public boolean isCancelTime(ClientEntity client) {
        SettingEntity setting = settingService.get();
        Date clientCreateTime = client.getCreateTime();
        long createdDays = (System.currentTimeMillis() - clientCreateTime.getTime()) / 1000 / 3600 / 24;
        String daysRange = setting.getDaysRange();
        List<DaysRange> ranges = new ArrayList<DaysRange>();
        if (daysRange != null) {
            for (String part : daysRange.split(",")) {
                if (StringUtils.isNotBlank(part) && part.contains("-")) {
                    String[] fields = part.split("-");
                    if (fields.length == 2) {
                        DaysRange range = new DaysRange();
                        range.from = Integer.valueOf(fields[0].trim());
                        range.to = Integer.valueOf(fields[1].trim());
                        ranges.add(range);
                    }
                }
            }
        }
        int cancelInterval = setting.getCancelInterval();
        boolean matchDays = false;
        for (DaysRange range : ranges) {
            if (createdDays >= range.from && createdDays <= range.to) {
                matchDays = true;
                break;
            }
        }
        if (matchDays) {
            CancelHistoryEntity history = dao.getByClientId(client.getId());
            return history == null || (System.currentTimeMillis() - history.getLastTime().getTime()) / 1000 / 3600 / 24 >= cancelInterval;
        }
        return false;
    }
    @Autowired
    public void setDao(CancelHistoryDao dao) {
        this.dao = dao;
    }
    @Transactional(readOnly = false)
    public void updateCancelHistory(Long clientId) {
        try {
            CancelHistoryEntity history = new CancelHistoryEntity();
            history.setClientId(clientId);
            history.setCreateTime(new Date());
            history.setLastTime(new Date());
            myBatisDao.updateHisotry(history);
        } catch (Throwable e) {
            LOGGER.error(e.getMessage(), e);
        }
    }
}
