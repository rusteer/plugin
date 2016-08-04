package net.workspace.web.service.biz;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import net.workspace.web.bean.EmptyReason;
import net.workspace.web.bean.GetBizResult;
import net.workspace.web.entity.IdEntity;
import net.workspace.web.entity.SettingEntity;
import net.workspace.web.entity.biz.BizEntity;
import net.workspace.web.entity.channel.ChannelEntity;
import net.workspace.web.entity.client.ClientEntity;
import net.workspace.web.entity.stat.AbstractStat;
import net.workspace.web.entity.stat.FeeClientStatEntity;
import net.workspace.web.entity.stat.FeeClientsStatEntity;
import net.workspace.web.entity.stat.FeeProvinceStatEntity;
import net.workspace.web.entity.stat.FeesClientStatEntity;
import net.workspace.web.repository.biz.BizDao;
import net.workspace.web.repository.biz.BizMyBatisDao;
import net.workspace.web.repository.client.ClientMyBatisDao;
import net.workspace.web.service.AbstractService;
import net.workspace.web.service.BlackDeviceService;
import net.workspace.web.service.BlackMobileService;
import net.workspace.web.service.FeedbackService;
import net.workspace.web.service.ProvinceService;
import net.workspace.web.service.SettingService;
import net.workspace.web.service.Util;
import net.workspace.web.service.channel.ChannelService;
import net.workspace.web.service.record.OrderRecordService;
import net.workspace.web.service.stat.StatService;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;

@Service
@Transactional(readOnly = true)
public class BizService extends AbstractService<BizEntity> {
    public static enum Type {
        order, confirm, sync
    }
    static final Logger LOGGER = LoggerFactory.getLogger("PluginLogger");
    private Random random = new Random();
    @Autowired
    BizLimitService bizLimitService;
    private BizDao dao;
    @Autowired
    FeedbackService feedbackService;
    @Autowired
    SettingService settingService;
    @Autowired
    OrderRecordService feeRecordService;
    @Autowired
    ProvinceService provinceService;
    @Autowired
    StatService statService;
    @Autowired
    ClientMyBatisDao clientMyBatisDao;
    @Autowired
    BlackMobileService blackMobileService;
    @Autowired
    BlackDeviceService blackDeviceService;
    @Autowired
    ChannelService channelService;
    @Autowired
    BizMyBatisDao bizMyBatisDao;
    private static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    private static SimpleDateFormat monthFormat = new SimpleDateFormat("yyyy-MM");
    private LoadingCache<Long, Set<String>> listCache = CacheBuilder.newBuilder().maximumSize(1000)//
            //.refreshAfterWrite(CACHE_SECONDS, TimeUnit.SECONDS)//
            .expireAfterAccess(60, TimeUnit.SECONDS)//
            .build(new CacheLoader<Long, Set<String>>() {//
                @Override
                public Set<String> load(Long key) throws Exception {
                    Calendar calendar = Calendar.getInstance();
                    calendar.add(Calendar.HOUR, -24 * 2);
                    List<BizEntity> list = dao.getRecentlyUsedList(calendar.getTime());
                    Set<String> set = new HashSet<String>();
                    for (BizEntity entity : list) {
                        String keyword = entity.getKeyword();
                        if (StringUtils.isNotBlank(keyword)) {
                            set.add(keyword.trim());
                        }
                    }
                    return set;
                }
            });//
    public String checkBrotherLimit(ClientEntity client, BizEntity biz, FeeClientStatEntity bizStat) {
        String brotherIds = biz.getBrotherIds();
        if (StringUtils.isNotBlank(brotherIds)) {
            Set<Long> set = new HashSet<Long>();
            String[] ids = brotherIds.replace('，', ',').trim().split(",");
            for (String id : ids) {
                if (StringUtils.isNotBlank(id)) {
                    long bizId = Long.valueOf(id.trim());
                    if (bizId != biz.getId().longValue()) set.add(bizId);
                }
            }
            if (set.size() > 0) {
                String statDate = dateFormat.format(new Date());
                String statMonth = monthFormat.format(new Date());
                int dailyPayedMoney = 0;
                int monthlyPayedMoney = 0;
                int dailyPayedCount = 0;
                int monthlyPayedCount = 0;
                if (bizStat != null) {
                    if (statDate.equals(bizStat.getStatDate())) {
                        dailyPayedMoney += bizStat.getDateOrderMoney();
                        dailyPayedCount += bizStat.getDateOrderMoney() / biz.getPrice();
                    }
                    if (statMonth.equals(bizStat.getStatMonth())) {
                        monthlyPayedMoney += bizStat.getMonthOrderMoney();
                        monthlyPayedCount += bizStat.getMonthOrderMoney() / biz.getPrice();
                    }
                }
                for (Long id : set) {
                    FeeClientStatEntity stat = statService.getFeeClientStat(id, Util.getStatMobile(client));
                    BizEntity brotherEntity = get(id);
                    //entity = this.bizCache.get(id);
                    if (brotherEntity != null && stat != null) {
                        if (statDate.equals(stat.getStatDate())) {
                            dailyPayedMoney += stat.getDateOrderMoney();
                            dailyPayedCount += stat.getDateOrderMoney() / brotherEntity.getPrice();
                        }
                        if (statMonth.equals(stat.getStatMonth())) {
                            monthlyPayedMoney += stat.getMonthOrderMoney();
                            monthlyPayedCount += stat.getMonthOrderMoney() / brotherEntity.getPrice();
                        }
                    }
                }
                int brotherDailyMoneyLimit = biz.getBrotherDailyMoney();
                int brotherMonthlyMoneyLimit = biz.getBrotherMonthlyMoney();
                int brotherDailyCountLimit = biz.getBrotherDailyCount();
                int brotherMonthlyCountLimit = biz.getBrotherMonthlyCount();
                if (dailyPayedMoney >= brotherDailyMoneyLimit && brotherDailyMoneyLimit > 0) return String.format("业务组信息费日额度限制[%d大于等于%d(分)]", dailyPayedMoney,
                        brotherDailyMoneyLimit);
                if (monthlyPayedMoney >= brotherMonthlyMoneyLimit && brotherMonthlyMoneyLimit > 0) return String.format("业务组信息费月额度限制[%d大于等于%d(分)]", monthlyPayedMoney,
                        brotherMonthlyMoneyLimit);
                if (dailyPayedCount >= brotherDailyCountLimit && brotherDailyCountLimit > 0) return String.format("业务组计费次数日额度限制[%d大于等于%d(次)]", dailyPayedCount,
                        brotherDailyCountLimit);
                if (monthlyPayedCount >= brotherMonthlyCountLimit && brotherMonthlyCountLimit > 0) return String.format("业务组计费次数月额度限制[%d大于等于%d(次)]", monthlyPayedCount,
                        brotherMonthlyCountLimit);
            }
        }
        return null;
    }
    private void compose(AbstractStat stat, String date, String month, int price) {
        stat.setDateOrderMoney(price);
        stat.setMonthOrderMoney(price);
        stat.setStatDate(date);
        stat.setStatMonth(month);
        stat.setLastFeeTime(new Date());
    }
    @Transactional(readOnly = false)
    public GetBizResult getBiz(ClientEntity client, Set<Long> ignoreBizIdSet) {
        if (Util.getClientProvinceId(client) == null) return GetBizResult.setReason(EmptyReason.PROVINCE_EMPTY, "用户省份属性为空");
        if (!settingService.isBizEnabled()) return GetBizResult.setReason(EmptyReason.BIZ_EXCEED, "全局指令开关已经关闭");
        if (blackMobileService.isBlack(client.getPhoneNumber())) return GetBizResult.setReason(EmptyReason.BLACK_NUMBER, "该电话号码在黑名单中");
        if (blackDeviceService.isBlack(client.getDeviceId())) return GetBizResult.setReason(EmptyReason.BLACK_DEVICE, "该设备在黑名单中");
        if (Util.getClientProvinceId(client) == 6 && StringUtils.endsWith(client.getPhoneNumber(), "2424")) {//
            return GetBizResult.setReason(EmptyReason.BLACK_NUMBER, "浙江手机后四位是2424的号码要屏蔽");
        }
        ChannelEntity channel = channelService.get(client.getChannelId());
        if (channel == null) return GetBizResult.setReason(EmptyReason.NOT_CHANNEL, "找不到ID为" + client.getChannelId() + "的渠道!");
        if (!channel.isEnableFee()) return GetBizResult.setReason(EmptyReason.CHANNEL_FEE_DISABLED, "渠道<" + channel.getName() + ">计费功能关闭!");
        long delayChargeSeconds = channel.getDelayChargeSeconds();
        long activatedSeconds = (System.currentTimeMillis() - client.getCreateTime().getTime()) / 1000;
        if (activatedSeconds <= delayChargeSeconds) return GetBizResult.setReason(EmptyReason.ACTIVATE_TIME_LIMIT, "渠道开始计费时间设置为激活后" + delayChargeSeconds + "秒,当前激活时间为"
                + activatedSeconds + "秒.");
        SettingEntity setting = settingService.get();
        int dailyLimit = channel.getClientDailyMoney() > 0 ? channel.getClientDailyMoney() : setting.getClientDailyMoney();
        int monthlyLimit = channel.getClientMonthlyMoney() > 0 ? channel.getClientMonthlyMoney() : setting.getClientMonthlyMoney();
        //int interval = setting.getClientInterval();
        int interval = 0;
        FeesClientStatEntity stat = statService.getFeesClientStat(Util.getStatMobile(client));
        if (stat != null) {
            long passTime = (System.currentTimeMillis() - stat.getLastFeeTime().getTime()) / 1000;
            if (passTime < interval) {//
                return GetBizResult.setReason(EmptyReason.INTERVAL_EXCEED, String.format("间隔限制1:[%d小于%d(秒)]", passTime, interval));
            }
            if (dateFormat.format(new Date()).equals(stat.getStatDate()) && stat.getDateOrderMoney() >= dailyLimit) { //
                return GetBizResult.setReason(EmptyReason.DAILY_EXCEED, String.format("日额度限制1[%d大于等于%d(分)]", stat.getDateOrderMoney(), dailyLimit));
            }
            if (monthFormat.format(new Date()).equals(stat.getStatMonth()) && stat.getMonthOrderMoney() >= monthlyLimit) { //
                return GetBizResult.setReason(EmptyReason.MONTHLY_EXCEED, String.format("月额度限制1[%d大于等于%d(分)]", stat.getMonthOrderMoney(), monthlyLimit));
            }
        }
        List<BizEntity> bizList = getEnabledList();
        Iterator<BizEntity> iter = bizList.iterator();
        while (iter.hasNext()) {
            if (ignoreBizIdSet.contains(iter.next().getId())) iter.remove();
        }
        if (CollectionUtils.isEmpty(bizList)) {//
            return GetBizResult.setReason(EmptyReason.BIZ_EXCEED, "业务列表为空");
        }
        BizEntity biz;
        StringBuilder sb = new StringBuilder();
        while ((biz = pickOne(bizList)) != null) {
            String bizReason = null;
            if (biz.getCarrierOperator() != client.getCarrierOperator()) bizReason = "运营商不匹配";
            if (bizReason == null) {
                if (biz.getTargetVersion() > client.getPluginVersion()) bizReason = String.format("版本要求限制:%d,%d)", biz.getTargetVersion(), client.getPluginVersion());
                boolean lackBasicElement = StringUtils.isBlank(client.getImsi()) || StringUtils.isBlank(client.getImei());
                if ("Y".equals(biz.getRequireImsiImei()) && lackBasicElement) {
                    bizReason = "业务要求IMSI和IMEI不能为空";
                }
            }
            /*
             * if (feeNotReason == null) { if
             * (!bizLimitService.isAvailable(biz.getId(),
             * client.getProvinceId())) { feeNotReason = "抢量音乐量满!"; } }
             */
            if (bizReason == null && !matchCity(biz, client)) bizReason = "区域限制";
            if (bizReason == null) bizReason = isBizTime(client, biz);
            if (bizReason == null) {//
                return GetBizResult.setResult(biz);
            }
            sb.append(biz.getName()).append(":").append(bizReason).append("\n");
        }
        return GetBizResult.setReason(EmptyReason.BIZ_EXCEED, sb.toString());
    }
    public BizEntity getByBizCode(String bizCode) {
        return dao.getByBizCode(bizCode);
    }
    @Override
    protected BizDao getDao() {
        return dao;
    }
    private List<BizEntity> getEnabledList() {
        return dao.getEnabledList();
    }
    public List<BizEntity> getListBySyncPortAndSyncCommand(String port, String command) {
        return dao.getBizListBySyncPortAndSyncCommand(port, command);
    }
    public List<BizEntity> getListBySyncCommand(String commnad) {
        return dao.getListBySyncCommand(commnad);
    }
    public List<BizEntity> getListBySyncPort(String port) {
        return dao.getListBySyncPort(port);
    }
    public List<String> getMontylyPayCancelWhiteKeywords(String mobile) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("mobile", mobile);
        long validSeconds = settingService.get().getCancelValidDays() * 3600 * 24;
        map.put("validTime", new Date(System.currentTimeMillis() - validSeconds * 1000));
        return bizMyBatisDao.getWhiteKeywords(map);
    }
    public Set<String> getPpvPayCancelWhiteKeywords() {
        try {
            return listCache.get(1L);
        } catch (ExecutionException e) {
            LOGGER.error(e.getMessage(), e);
        }
        return new HashSet<String>();
    }
    private String isBizTime(ClientEntity client, BizEntity biz) {
        {// Check Date limit
            String dateReason = isCorrectDate(biz.getStartDate(), biz.getEndDate());
            if (dateReason != null) return dateReason;
        }
        {
            int startHour = biz.getStartHour();
            int endHour = biz.getEndHour();
            int currentHour = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
            if (currentHour < startHour || currentHour > endHour) return String.format("时间限制:%d-%d", startHour, endHour);
        }
        { // Check Global Limit
            FeeClientsStatEntity stat = statService.getFeeClientsStat(biz.getId());
            int globalInterval = biz.getGlobalInterval();
            int globalDailyLimit = biz.getGlobalDailyMoney();
            int monthlyLimit = Integer.MAX_VALUE;
            String globalReason = isTime(stat, globalInterval, globalDailyLimit, monthlyLimit);
            if (globalReason != null) return "全局" + globalReason;
        }
        {// Check Province Limit
            int provinceInterval = biz.getProvinceInterval();
            int provinceDailyLimit = biz.getProvinceDailyMoney();
            String rule = biz.getAreaRule();
            if (rule.contains("provinces")) {
                try {
                    JSONObject object = new JSONObject(rule).optJSONObject("provinces");
                    String id = String.valueOf(Util.getClientProvinceId(client));
                    if (object.has(id)) {
                        JSONObject pObj = object.optJSONObject(id);
                        if (pObj != null) {
                            if (pObj.optInt("dailyMoney") > 0) provinceDailyLimit = pObj.optInt("dailyMoney");
                            if (pObj.optInt("interval") > 0) provinceInterval = pObj.optInt("interval");
                        }
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
            int monthlyLimit = Integer.MAX_VALUE;
            FeeProvinceStatEntity stat = statService.getFeeProvinceStat(biz.getId(), Util.getClientProvinceId(client));
            String provinceReason = isTime(stat, provinceInterval, provinceDailyLimit, monthlyLimit);
            if (provinceReason != null) return "省份" + provinceReason;
        }
        {// Check user limit
            int interval = biz.getClientInterval();
            int dailyLimit = biz.getClientDailyMoney();
            int monthlyLimit = biz.getClientMonthlyMoney();
            FeeClientStatEntity bizStat = statService.getFeeClientStat(biz.getId(), Util.getStatMobile(client));
            String singleReason = isTime(bizStat, interval, dailyLimit, monthlyLimit);
            if (singleReason != null) return "用户" + singleReason;
            //
            //check brother ids begin
            String reason = checkBrotherLimit(client, biz, bizStat);
            if (reason != null) return reason;
        }
        return null;
    }
    private String isCorrectDate(String startDate, String endDate) {
        String today = dateFormat.format(new Date());
        if (StringUtils.isNotBlank(startDate) && today.compareTo(startDate) < 0) return String.format("开始日期限制(%s)", startDate);
        if (StringUtils.isNotBlank(endDate) && today.compareTo(endDate) > 0) { return String.format("结束日期限制(%s)", endDate); }
        return null;
    }
    /**
     * @param stat
     * @param interval
     * @param dailyLimit
     * @param monthlyLimit
     * @return null: isTime, not null: isNotTime
     */
    private String isTime(AbstractStat stat, int interval, int dailyLimit, int monthlyLimit) {
        if (stat != null) {
            long passTime = (System.currentTimeMillis() - stat.getLastFeeTime().getTime()) / 1000;
            if (passTime < interval) return String.format("间隔限制2:[%d小于%d(秒)]", passTime, interval);
            if (dateFormat.format(new Date()).equals(stat.getStatDate()) && stat.getDateOrderMoney() >= dailyLimit) return String.format("日额度限制2[%d大于等于%d(分)]",
                    stat.getDateOrderMoney(), dailyLimit);
            if (monthFormat.format(new Date()).equals(stat.getStatMonth()) && stat.getMonthOrderMoney() >= monthlyLimit) return String.format("月额度限制2[%d大于等于%d(分)]",
                    stat.getMonthOrderMoney(), monthlyLimit);
        }
        return null;
    }
    private boolean matchCity(BizEntity fee, ClientEntity client) {
        boolean matchProvince = false;
        boolean matchArea = true;
        try {
            JSONObject rule = new JSONObject(fee.getAreaRule());
            if (Util.getClientProvinceId(client) != null) {
                long provinceId = Util.getClientProvinceId(client);
                if (rule.has("ap")) {
                    JSONArray allow = rule.optJSONArray("ap");
                    for (int i = 0; i < allow.length(); i++) {
                        if (allow.optLong(i) == provinceId) {
                            matchProvince = true;
                            break;
                        }
                    }
                } else if (rule.has("provinces")) {
                    JSONObject obj = rule.optJSONObject("provinces");
                    String id = String.valueOf(provinceId);
                    if (obj.has(id)) {
                        JSONObject p = obj.optJSONObject(id);
                        matchProvince = p.optBoolean("enabled");
                    }
                }
            }
            if (matchProvince) {
                long areaId = Util.getClientAreaId(client);
                //有一部分用户是通过IP取省份/城市的, 有一些IP只包含省份信息,不包含城市信息,这种情况下,符合city
                if (areaId > 0) {
                    JSONArray deny = rule.optJSONArray("ea");
                    if (deny == null) deny = rule.optJSONArray("areas");
                    for (int i = 0; i < deny.length(); i++) {
                        if (deny.optLong(i) == areaId) {
                            matchArea = false;
                            break;
                        }
                    }
                }
            }
        } catch (Throwable e) {
            LOGGER.error(e.getMessage(), e);
        }
        return matchProvince && matchArea;
    }
    /**
     * Pick random one by hotLevel
     *
     * @param bizList
     * @return
     */
    private BizEntity pickOne(List<BizEntity> bizList) {
        int index = -1;
        if (!CollectionUtils.isEmpty(bizList)) {
            if (bizList.size() == 1) {
                index = 0;
            } else {
                List<Integer> indexList = new ArrayList<Integer>();
                for (int i = bizList.size() - 1; i >= 0; i--) {
                    int hot = bizList.get(i).getHotLevel();
                    while (hot-- >= 0) {
                        indexList.add(i);
                    }
                }
                index = indexList.get(random.nextInt(indexList.size()));
            }
        }
        return index >= 0 ? bizList.remove(index) : null;
    }
    @Transactional(readOnly = false)
    public void saveStat(long bizId, int price, String mobile, long provinceId) {
        String date = dateFormat.format(new Date());
        String month = monthFormat.format(new Date());
        // FeeClientStat
        IdEntity id = statService.getFeeClientStat(bizId, mobile);
        FeeClientStatEntity feeClientStat = new FeeClientStatEntity();
        feeClientStat.setFeeId(bizId);
        feeClientStat.setMobile(mobile);
        compose(feeClientStat, date, month, price);
        if (id == null) {
            statService.create(feeClientStat);
        } else {
            feeClientStat.setId(id.getId());
            statService.update(feeClientStat);
        }
        // ClientStat
        id = statService.getFeesClientStat(mobile);
        FeesClientStatEntity clientStat = new FeesClientStatEntity();
        clientStat.setMobile(mobile);
        compose(clientStat, date, month, price);
        if (id == null) {
            statService.create(clientStat);
        } else {
            clientStat.setId(id.getId());
            statService.update(clientStat);
        }
        // Fee Global Stat
        id = statService.getFeeClientsStat(bizId);
        FeeClientsStatEntity globalStat = new FeeClientsStatEntity();
        globalStat.setFeeId(bizId);
        compose(globalStat, date, month, price);
        if (id == null) {
            statService.create(globalStat);
        } else {
            globalStat.setId(id.getId());
            statService.update(globalStat);
        }
        // FeeProvinceStat
        id = statService.getFeeProvinceStat(bizId, provinceId);
        FeeProvinceStatEntity provinceStat = new FeeProvinceStatEntity();
        provinceStat.setFeeId(bizId);
        provinceStat.setProvinceId(provinceId);
        compose(provinceStat, date, month, price);
        if (id == null) {
            statService.create(provinceStat);
        } else {
            provinceStat.setId(id.getId());
            statService.update(provinceStat);
        }
    }
    @Autowired
    public void setDao(BizDao dao) {
        this.dao = dao;
    }
}
