package net.workspace.web.service.client;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import net.workspace.web.bean.ClientDailyStat;
import net.workspace.web.bean.DateClientCount;
import net.workspace.web.bean.ProvinceClientCount;
import net.workspace.web.entity.client.ClientEntity;
import net.workspace.web.repository.client.ClientDao;
import net.workspace.web.repository.client.ClientMyBatisDao;
import net.workspace.web.service.AbstractService;
import net.workspace.web.service.FormatUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class ClientService extends AbstractService<ClientEntity> {
    @Autowired
    ClientMyBatisDao clientMyBatisDao;
    private ClientDao dao;
    @Transactional(readOnly = false)
    public ClientEntity findByDeviceId(String deviceId) {
        return dao.findByDeviceId(deviceId);
    }
    public ClientEntity findByPhoneNumber(String phoneNumber) {
        ClientEntity result = null;
        List<ClientEntity> list = dao.findByPhoneNumber(phoneNumber);
        if (list != null && list.size() > 0) {
            result = list.get(0);
        }
        return result;
    }
    public long getChannelClientCount(long channelId) {
        return clientMyBatisDao.getChannelClientCount(channelId);
    }
    public List<ClientDailyStat> getDailyAccessCount(String fromDate, String toDate, long channelId, long provinceId, int carrierOperator, int sdkVersion) {
        Map<String, Object> parameters = new HashMap<String, Object>();
        if (channelId > 0) parameters.put("channelId", channelId);
        if (!StringUtils.isBlank(fromDate)) parameters.put("fromDate", fromDate);
        if (!StringUtils.isBlank(toDate)) parameters.put("toDate", toDate);
        if (provinceId > 0) parameters.put("provinceId", provinceId);
        if (carrierOperator >= 0) parameters.put("carrierOperator", carrierOperator);
        if (sdkVersion > 0) parameters.put("sdkVersion", sdkVersion);
        return clientMyBatisDao.getDailyAccessCount(parameters);
    }
    public List<DateClientCount> getDailyAllAccessClientCount(String fromDate, String toDate, long channelId, long provinceId, int carrierOperator, int sdkVersion) {
        String today = FormatUtil.dateFormat.format(new java.util.Date());
        if (StringUtils.isBlank(fromDate)) fromDate = today;
        if (StringUtils.isBlank(toDate)) toDate = today;
        List<DateClientCount> result = new java.util.ArrayList<net.workspace.web.bean.DateClientCount>();
        try {
            java.util.Date from = FormatUtil.dateFormat.parse(fromDate);
            java.util.Date to = FormatUtil.dateFormat.parse(toDate);
            long days = (to.getTime() - from.getTime()) / 1000 / 24 / 3600;
            if (days > 20) {
                Map<String, Object> parameters = new HashMap<String, Object>();
                parameters.put("fromDate", fromDate);
                parameters.put("toDate", toDate + " 23:59:59");
                if (provinceId > 0) parameters.put("provinceId", provinceId);
                if (channelId > 0) parameters.put("channelId", channelId);
                if (carrierOperator >= 0) parameters.put("carrierOperator", carrierOperator);
                if (sdkVersion > 0) parameters.put("sdkVersion", sdkVersion);
                result = clientMyBatisDao.getDailyAllAccessClientCount(parameters);
            } else {
                java.util.Calendar calendar = java.util.Calendar.getInstance();
                calendar.setTime(from);
                while (days >= 0) {
                    Map<String, Object> parameters = new HashMap<String, Object>();
                    parameters.put("date", FormatUtil.dateFormat.format(calendar.getTime()));
                    if (provinceId > 0) parameters.put("provinceId", provinceId);
                    if (channelId > 0) parameters.put("channelId", channelId);
                    if (carrierOperator >= 0) parameters.put("carrierOperator", carrierOperator);
                    if (sdkVersion > 0) parameters.put("sdkVersion", sdkVersion);
                    List<DateClientCount> c = clientMyBatisDao.getAllAccessClientCountBySingleDate(parameters);
                    if (c != null) {
                        result.addAll(c);
                    }
                    calendar.add(java.util.Calendar.SECOND, 3600 * 24);
                    days--;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    public List<DateClientCount> getDailyNewCount(String fromDate, String toDate, long channelId, long provinceId, int carrierOperator, int sdkVersion) {
        Map<String, Object> parameters = new HashMap<String, Object>();
        if (provinceId > 0) parameters.put("provinceId", provinceId);
        if (channelId > 0) parameters.put("channelId", channelId);
        if (!StringUtils.isBlank(fromDate)) parameters.put("fromDate", fromDate);
        if (!StringUtils.isBlank(toDate)) parameters.put("toDate", toDate + " 23:59:59");
        if (carrierOperator >= 0) parameters.put("carrierOperator", Integer.valueOf(carrierOperator));
        if (sdkVersion > 0) parameters.put("sdkVersion", sdkVersion);
        return clientMyBatisDao.getDailyNewCount(parameters);
    }
    public List<DateClientCount> getDailyReactivateCount(String fromDate, String toDate, long channelId, long provinceId, int carrierOperator, int sdkVersion) {
        Map<String, Object> parameters = new HashMap<String, Object>();
        if (provinceId > 0) parameters.put("provinceId", provinceId);
        if (channelId > 0) parameters.put("channelId", channelId);
        if (!StringUtils.isBlank(fromDate)) parameters.put("fromDate", fromDate);
        if (!StringUtils.isBlank(toDate)) parameters.put("toDate", toDate + " 23:59:59");
        if (carrierOperator >= 0) parameters.put("carrierOperator", Integer.valueOf(carrierOperator));
        if (sdkVersion > 0) parameters.put("sdkVersion", sdkVersion);
        return clientMyBatisDao.getDailyReactivateCount(parameters);
    }
    @Override
    protected ClientDao getDao() {
        return dao;
    }
    public List<ProvinceClientCount> getProvinceAccessCount(String fromDate, String toDate, long channelId, int carrierOperator, int sdkVersion, boolean groupByDate) {
        Map<String, Object> parameters = new HashMap<String, Object>();
        if (!StringUtils.isBlank(fromDate)) parameters.put("fromDate", fromDate);
        if (!StringUtils.isBlank(toDate)) parameters.put("toDate", toDate + " 23:59:59");
        if (channelId > 0) parameters.put("channelId", channelId);
        if (groupByDate) parameters.put("groupByDate", groupByDate);
        if (carrierOperator >= 0) parameters.put("carrierOperator", carrierOperator);
        if (sdkVersion > 0) parameters.put("sdkVersion", sdkVersion);
        return clientMyBatisDao.getProvinceAccessCount(parameters);
    }
    public List<ProvinceClientCount> getProvinceNewCount(String fromDate, String toDate, long channelId, int carrierOperator, int sdkVersion, boolean groupByDate) {
        Map<String, Object> parameters = new HashMap<String, Object>();
        if (channelId > 0) parameters.put("channelId", channelId);
        if (!StringUtils.isBlank(fromDate)) parameters.put("fromDate", fromDate);
        if (!StringUtils.isBlank(toDate)) parameters.put("toDate", toDate + " 23:59:59");
        if (groupByDate) parameters.put("groupByDate", groupByDate);
        if (carrierOperator >= 0) parameters.put("carrierOperator", carrierOperator);
        if (sdkVersion > 0) parameters.put("sdkVersion", sdkVersion);
        return clientMyBatisDao.getProvinceNewCount(parameters);
    }
    public List<Integer> getSdkVersionList() {
        return clientMyBatisDao.getSdkVersionList();
    }
    @Autowired
    public void setDao(ClientDao dao) {
        this.dao = dao;
    }
}
