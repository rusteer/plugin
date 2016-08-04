package net.workspace.web.service.biz;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import net.workspace.web.bean.Stat;
import net.workspace.web.bean.StatDetail;
import net.workspace.web.entity.biz.BizEntity;
import net.workspace.web.repository.biz.BizStatDao;
import net.workspace.web.service.ProvinceService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class BizStatService {
    @Autowired
    private BizStatDao statDao;
    @Autowired
    ProvinceService provinceService;
    @Autowired
    BizService bizService;
    private Map<String, Object> composeParameters(String fromDate, String toDate, long provinceId, long bizId, long channelId, int sdkVersion, boolean onlyForSuccessFlow) {
        Map<String, Object> parameters = new HashMap<String, Object>();
        parameters.put("fromDate", fromDate);
        parameters.put("toDate", toDate + " 23:59:59");
        if (provinceId > 0) parameters.put("provinceId", provinceId);
        if (bizId > 0) parameters.put("bizId", bizId);
        if (channelId > 0) parameters.put("channelId", channelId);
        if (sdkVersion > 0) parameters.put("sdkVersion", sdkVersion);
        if (onlyForSuccessFlow) parameters.put("onlyForSuccessFlow", true);
        return parameters;
    }
    private Map<Long, BizEntity> getBizMap() {
        Map<Long, BizEntity> bizMap = new HashMap<Long, BizEntity>();
        for (BizEntity biz : bizService.getAll()) {
            bizMap.put(biz.getId(), biz);
        }
        return bizMap;
    }
    public Map<Long, StatDetail> getBizStat(String fromDate, String toDate, long provinceId, long bizId, long channleId, int sdkVersion) {
        Map<Long, BizEntity> bizMap = getBizMap();
        Map<Long, StatDetail> result = new HashMap<Long, StatDetail>();
        for (boolean flag : new boolean[] { true, false }) {
            List<Stat> allOrderStat = statDao.getStat(composeParameters(fromDate, toDate, provinceId, bizId, channleId, sdkVersion, flag));
            for (Stat entity : allOrderStat) {
                BizEntity biz = bizMap.get(entity.bizId);
                if (biz != null) mergeOrderStat(loadBizStat(result, entity.bizId), entity, biz, flag);
            }
        }
        Map<String, Object> parameters = composeParameters(fromDate, toDate, provinceId, bizId, channleId, sdkVersion, false);
        List<Stat> autoList = statDao.getAutoSyncStat(parameters);
        for (Stat entity : autoList) {
            BizEntity biz = bizMap.get(entity.bizId);
            if (biz != null) mergeSyncStat(loadBizStat(result, entity.bizId), entity, biz);
        }
        if (channleId <= 0 && sdkVersion <= 0) {
            List<Stat> manuList = statDao.getManuSyncStat(parameters);
            for (Stat entity : manuList) {
                BizEntity biz = bizMap.get(entity.bizId);
                if (biz != null) mergeSyncStat(loadBizStat(result, entity.bizId), entity, biz);
            }
        }
        return result;
    }
    public Map<String, StatDetail> getDateStat(String fromDate, String toDate, long provinceId, long bizId, long channelId, int sdkVersion) {
        Map<Long, BizEntity> bizMap = getBizMap();
        Map<String, StatDetail> result = new HashMap<String, StatDetail>();
        boolean noClientTable = channelId == 0 && sdkVersion == 0 && StringUtils.isNotBlank(fromDate);
        for (boolean flag : new boolean[] { true, false }) {
            Map<String, Object> parameters = composeParameters(fromDate, toDate, provinceId, bizId, channelId, sdkVersion, flag);
            List<Stat> list = noClientTable ? statDao.getStatWithoutClientTable(parameters) : statDao.getStat(parameters);
            for (Stat entity : list) {
                BizEntity biz = bizMap.get(entity.bizId);
                if (biz != null) mergeOrderStat(loadBizStat(result, entity.statDate), entity, biz, flag);
            }
        }
        Map<String, Object> parameters = composeParameters(fromDate, toDate, provinceId, bizId, channelId, sdkVersion, false);
        List<Stat> autoList = statDao.getAutoSyncStat(parameters);
        for (Stat entity : autoList) {
            BizEntity biz = bizMap.get(entity.bizId);
            if (biz != null) mergeSyncStat(loadBizStat(result, entity.statDate), entity, biz);
        }
        if (channelId <= 0 && sdkVersion <= 0) {
            List<Stat> manuList = statDao.getManuSyncStat(parameters);
            for (Stat entity : manuList) {
                BizEntity biz = bizMap.get(entity.bizId);
                if (biz != null) mergeSyncStat(loadBizStat(result, entity.statDate), entity, biz);
            }
        }
        return result;
    }
    public Map<Long, StatDetail> getProvinceStat(String fromDate, String toDate, long provinceId, long bizId, long channelId, int sdkVersion) {
        Map<Long, BizEntity> bizMap = getBizMap();
        Map<Long, StatDetail> result = new HashMap<Long, StatDetail>();
        for (boolean flag : new boolean[] { true, false }) {
            Map<String, Object> parameters = composeParameters(fromDate, toDate, provinceId, bizId, channelId, sdkVersion, flag);
            List<Stat> list = statDao.getStat(parameters);
            for (Stat entity : list) {
                BizEntity biz = bizMap.get(entity.bizId);
                if (biz != null) mergeOrderStat(loadBizStat(result, entity.provinceId), entity, biz, flag);
            }
        }
        Map<String, Object> parameters = composeParameters(fromDate, toDate, provinceId, bizId, channelId, sdkVersion, false);
        List<Stat> autoList = statDao.getAutoSyncStat(parameters);
        for (Stat entity : autoList) {
            BizEntity biz = bizMap.get(entity.bizId);
            if (biz != null) mergeSyncStat(loadBizStat(result, entity.provinceId), entity, biz);
        }
        if (channelId <= 0 && sdkVersion <= 0) {
            List<Stat> manuList = statDao.getManuSyncStat(parameters);
            for (Stat entity : manuList) {
                BizEntity biz = bizMap.get(entity.bizId);
                if (biz != null) mergeSyncStat(loadBizStat(result, entity.provinceId), entity, biz);
            }
        }
        return result;
    }
    private <T extends java.io.Serializable> StatDetail loadBizStat(Map<T, StatDetail> map, T key) {
        StatDetail result = map.get(key);
        if (result == null) {
            result = new StatDetail();
            map.put(key, result);
        }
        return result;
    }
    private void mergeOrderStat(StatDetail detail, Stat entity, BizEntity biz, boolean onlySuccess) {
        if (!onlySuccess) {
            detail.orderCount += entity.orderCount;
            detail.orderMoney += entity.orderCount * biz.getPrice();
            detail.orderSharing += entity.orderCount * biz.getSharing();
        } else {
            detail.successOrderCount += entity.orderCount;
            detail.successOrderMoney += entity.orderCount * biz.getPrice();
            detail.successOrderSharing += entity.orderCount * biz.getSharing();
        }
    }
    private void mergeConfirmStat(StatDetail detail, Stat entity, BizEntity biz) {
        detail.confirmCount += entity.confirmCount;
        detail.confirmMoney += entity.confirmCount * biz.getPrice();
        detail.confirmSharing += entity.confirmCount * biz.getSharing();
    }
    private void mergeSyncStat(StatDetail detail, Stat entity, BizEntity biz) {
        detail.syncCount += entity.syncCount;
        detail.syncMoney += entity.syncCount * biz.getPrice();
        detail.syncSharing += entity.syncCount * biz.getSharing();
    }
}
