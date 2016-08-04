package net.workspace.web.service.channel;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import net.workspace.web.bean.ChannelStat;
import net.workspace.web.entity.channel.ChannelEntity;
import net.workspace.web.repository.biz.BizStatDao;
import net.workspace.web.repository.channel.ChannelDao;
import net.workspace.web.repository.client.ClientMyBatisDao;
import net.workspace.web.service.AbstractService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class ChannelService extends AbstractService<ChannelEntity> {
    public static void main(String args[]) {
        int discount = 0;
        int count = 9999999;
        int rate = 99;
        for (int i = 0; i < count; i++) {
            if (shouldDiscount(rate)) discount++;
        }
        System.out.println(discount * 100.0 / count);
    }
    private static boolean shouldDiscount(int rate) {
        int randomInt = random.nextInt(100);
        return randomInt < rate;
    }
    private ChannelDao dao;
    @Autowired
    protected ClientMyBatisDao clientMyBatisDao;
    @Autowired
    protected BizStatDao bizStatDao;
    private static Random random = new Random();
    public ChannelEntity findByLoginName(String loginName) {
        return dao.findByLoginName(loginName);
    }
    public ChannelEntity findByUUID(String uuid) {
        return dao.findByUUID(uuid);
    }
    public Map<Long, ChannelStat> getChanelStat(long provinceId, String fromDate, String toDate, int carrierOperator, int sdkVersion) {
        Map<String, Object> parameters = new HashMap<String, Object>();
        if (!StringUtils.isBlank(fromDate)) parameters.put("fromDate", fromDate);
        if (!StringUtils.isBlank(toDate)) parameters.put("toDate", toDate + " 23:59:59");
        if (provinceId > 0) parameters.put("provinceId", provinceId);
        if (carrierOperator >= 0) parameters.put("carrierOperator", carrierOperator);
        if (sdkVersion > 0) parameters.put("sdkVersion", sdkVersion);
        Map<Long, ChannelStat> result = new HashMap<Long, ChannelStat>();
        for (ChannelEntity entity : getList()) {
            result.put(entity.getId(), new ChannelStat());
        }
        for (ChannelStat stat : clientMyBatisDao.getChannelNewCount(parameters)) {
            ChannelStat mapData = result.get(stat.channelId);
            if (mapData != null) {
                mapData.newClientCount = stat.newClientCount;
            }
        }
        for (ChannelStat stat : clientMyBatisDao.getChannelReactivateCount(parameters)) {
            ChannelStat mapData = result.get(stat.channelId);
            if (mapData != null) {
                mapData.reActivateCount = stat.reActivateCount;
            }
        }
        return result;
    }
    @Override
    public ChannelDao getDao() {
        return dao;
    }
    public List<ChannelEntity> getList() {
        return dao.getList();
    }
    @Autowired
    public void setDao(ChannelDao dao) {
        this.dao = dao;
    }
    public boolean shouldDiscount(Long Id) {
        ChannelEntity entity = get(Id);
        return shouldDiscount(entity == null ? 20 : entity.getDiscountRate());
    }
}
