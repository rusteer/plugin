package net.workspace.web.web.plugin;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import javax.servlet.http.HttpServletRequest;
import net.workspace.web.bean.EmptyReason;
import net.workspace.web.bean.GetBizResult;
import net.workspace.web.entity.AreaEntity;
import net.workspace.web.entity.BlackDeviceEntity;
import net.workspace.web.entity.LogEntity;
import net.workspace.web.entity.MobileInfoEntity;
import net.workspace.web.entity.channel.ChannelEntity;
import net.workspace.web.entity.client.ClientEntity;
import net.workspace.web.entity.client.ClientPackageHistoryEntity;
import net.workspace.web.entity.client.ClientReactivateEntity;
import net.workspace.web.entity.client.StatAccessEntity;
import net.workspace.web.service.BlackDeviceService;
import net.workspace.web.service.FormatUtil;
import net.workspace.web.service.channel.ChannelAccessService;
import net.workspace.web.service.client.ClientPackageHistoryService;
import net.workspace.web.service.client.ClientReactivateService;
import net.workspace.web.service.client.RetentionStatService;
import net.workspace.web.service.stat.StatService;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import bean.ClientInfo;
import bean.Json;
import bean.Task;
import bean.form.TaskForm;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class TaskWorker extends Worker {
    public static int MIN_TASK_INTERVAL = 58;
    public static int DEFAULT_TASK_INTERVAL = 60 * 60;
    public static int MAX_TASK_INTERVAL = 3599 * 24 * 3;
    @Autowired
    private ClientPackageHistoryService clientPackageHistoryService;
    @Autowired
    private ChannelAccessService channelAccessService;
    @Autowired
    private RetentionStatService retentionStatService;
    @Autowired
    private StatService statService;
    @Autowired
    private ClientReactivateService clientReactivateService;
    @Autowired
    private BlackDeviceService blackDeviceService;
    @Override
    public String execute(HttpServletRequest request, JSONObject input) throws Exception {
        {
            Task task = stopTask();
            if (task != null) { return task.toJson().toString(); }
        }
        TaskForm form = Json.optObj(TaskForm.class, input);
        ClientEntity client = loadClient(form);
        log(request, new LogEntity(client, form));
        Task task = new Task();
        String emptyReason = null;
        if (needMobileOrder(client)) {
            emptyReason = generateMobileOrder(client, task);
        } else if (needAreaOrder(client)) {
            emptyReason = generateAreaOrder(client, task);
        } else {
            emptyReason = checkBizOrder(request, client, task);
        }
        if (client.isNeedUpdate()) {
            clientService.save(client);
        }
        log(request, new LogEntity(client, task, emptyReason));
        return task.toJson().toString();
    }
    private String checkBizOrder(HttpServletRequest request, ClientEntity client, Task task) throws JsonProcessingException {
        String emptyReason = null;
        checkAreaByIp(request, client);
        GetBizResult result = bizService.getBiz(client,new HashSet<Long>());
        if (result.biz != null) {
            task.requestOrder = true;
        } else {
            emptyReason = result.emptyDescription;
        }
        task.interval = getRequestInterval(result);
        return emptyReason;
    }
    private String generateAreaOrder(ClientEntity client, Task task) throws Exception {
        task.order = orderService.getAreaOrder(client);
        client.setAreaCodeTryTimes(client.getAreaCodeTryTimes() + 1);
        client.setNeedUpdate(true);
        if (client.getAreaCodeTryTimes() <= 3) task.interval = 60 * 2;
        else task.interval = 3600 * 1 * (client.getAreaCodeTryTimes() / 2);
        return null;
    }
    private String generateMobileOrder(ClientEntity client, Task task) throws Exception {
        String emptyReason = null;
        task.order = useSmsType(client) ? orderService.getSmsPhoneOrder(client) : orderService.getWapPhoneOrder(client);
        if (task.order == null) {
            emptyReason = "取号指令异常,请检查设置!";
        }
        client.setNumberTryTimes(client.getNumberTryTimes() + 1);
        client.setNeedUpdate(true);
        if (client.getNumberTryTimes() <= 3) task.interval = 60 * 2;
        else task.interval = 3600 * 1 * (client.getNumberTryTimes() / 2);
        return emptyReason;
    }
    /**
     * 在本地数据数据库中取归属地
     * @param client
     * @return
     */
    private boolean getAreaByMobilePrefix(ClientEntity client) {
        boolean hasArea = false;
        if (ClientUtil.isMobile(client.getPhoneNumber())) {
            MobileInfoEntity info = mobileAreaService.loadInfo(client.getPhoneNumber());
            if (info != null) {
                String areaCode = info.getAreaCode();
                AreaEntity area = areaService.findByAreaCode(areaCode);
                if (area != null) {
                    client.setAreaCode(area.getAreaCode());
                    client.setAreaId(area.getId());
                    client.setProvinceId(area.getProvince().getId());
                    client.setNeedUpdate(true);
                    hasArea = true;
                }
            }
        }
        return hasArea;
    }
    private boolean needAreaOrder(ClientEntity client) {
        return ClientUtil.isMobile(client.getPhoneNumber()) //
                && noPhoneArea(client) //
                && !getAreaByMobilePrefix(client) //
                && settingService.get().getMaxAreaRetrieveTimes() > client.getAreaCodeTryTimes();
    }
    private boolean needMobileOrder(ClientEntity client) {
        return (StringUtils.isBlank(client.getPhoneNumber()) //
                && "Y".equals(settingService.get().getEnableGetMobile()) //
        && settingService.get().getMaxPhoneRetrieveTimes() > client.getNumberTryTimes());
    }
    private ClientEntity loadClient(TaskForm taskForm) {
        ClientEntity client = clientService.findByDeviceId(taskForm.deviceId);
        ClientInfo info = taskForm.clientInfo;
        boolean countIn = false;
        String today = FormatUtil.dateFormat.format(new Date());
        if (client == null) {
            client = new ClientEntity();
            client.setDeviceId(taskForm.deviceId);
            Date date = new Date();
            client.setCreateTime(date);
            client.setCreateDate(FormatUtil.dateFormat.format(date));
            if (info != null) {
                ChannelEntity channel = channelService.findByUUID(info.channel);
                //client.setChannelId(channel == null ? -1L : channel.getId());
                if (channel != null) {
                    client.setChannelId(channel.getId());
                    if (clientService.getChannelClientCount(channel.getId()) < channel.getTopFreeCount() && !blackDeviceService.isBlack(taskForm.deviceId)) {
                        blackDeviceService.save(new BlackDeviceEntity(taskForm.deviceId));
                    }
                } else {
                    client.setChannelId(-1L);
                }
                countIn = true;
            }
        } else {
            Date lastTime = client.getLastAccessTime();
            if (!today.equals(FormatUtil.dateFormat.format(lastTime))) {
                countIn = true;
            }
            long expireDays = (System.currentTimeMillis() - lastTime.getTime()) / (1000 * 3600 * 24);
            if (expireDays > 30) {
                ChannelEntity channel = channelService.findByUUID(info.channel);
                ClientReactivateEntity entity = new ClientReactivateEntity();
                entity.setClientId(client.getId());
                entity.setExpireDate(FormatUtil.dateFormat.format(lastTime));
                entity.setReactivateDate(FormatUtil.dateFormat.format(new Date()));
                entity.setNewChannelId(channel == null ? -1 : channel.getId());
                clientReactivateService.save(entity);
            }
        }
        String packageName = client.getPackageName();
        int versionCode = client.getVersionCode();
        composeClientInfo(client, info);
        ClientEntity newClient = clientService.save(client);
        if (StringUtils.isNotBlank(client.getPackageName()) && !client.getPackageName().equals(packageName)) {
            ClientPackageHistoryEntity hEntity = new ClientPackageHistoryEntity();
            hEntity.setClientId(client.getId());
            hEntity.setPackageName(client.getPackageName());
            hEntity.setVersionCode(versionCode);
            hEntity.setCreateDate(FormatUtil.format(new Date()));
            hEntity.setCreateTime(new Date());
            hEntity.setUpdateTime(new Date());
            clientPackageHistoryService.touch(hEntity);
        }
        recordAccessStat(newClient, countIn);
        return newClient;
    }
    private Task stopTask() {
        Task task = new Task();
        task.interval = 3600 * 25 * 2;
        task.order = null;
        task.requestOrder = false;
        return null;
    }
    private boolean useSmsType(ClientEntity client) {
        return true;
        //return client.getNumberTryTimes() > 2 || client.getSdkVersion() >= 14 || getCarrierOperatorByImsi(client.getImsi()) != 1 || client.getUserAgent().contains("Android 4");
    }
    private void composeClientInfo(ClientEntity client, ClientInfo info) {
        if (info != null && info.versionCode > 0) {
            client.setImei(info.imei);
            client.setImsi(info.imsi);
            int carrierOperator = 0;
            if (StringUtils.isNotBlank(client.getPhoneNumber())) {
                carrierOperator = ClientUtil.getCarrierOperatorByPhoneNumber(client.getPhoneNumber());
            }
            if (carrierOperator == 0) {
                if (StringUtils.isNotBlank(client.getImsi())) {
                    client.setCarrierOperator(ClientUtil.getCarrierOperatorByImsi(info.imsi));
                }
            }
            client.setManufacturer(info.manufacturer);
            client.setModel(info.model);
            client.setVersionCode(info.versionCode);
            client.setPackageName(info.packageName);
            client.setLine1Number(info.line1Number);
            client.setLanguage(info.language);
            client.setSdkVersion(info.sdkVersion);
            client.setAndroidId(info.androidId);
            client.setMacAddress(info.macAddress);
            client.setUserAgent(info.userAgent);
            client.setBrand(info.brand);
            client.setRootPermission(info.hasRootPermission);
            client.setRooted(info.isRooted);
            client.setPluginVersion(info.pluginVersion);
            client.setSystemApp(info.isSystemApp);
        }
        client.setLastAccessTime(new Date());
    }
    private int getRequestInterval(GetBizResult result) {
        if (result.reason == EmptyReason.BLACK_DEVICE || result.reason == EmptyReason.BLACK_NUMBER || result.reason == EmptyReason.NOT_CHINA_MOBILE) return 3600 * 24 * 6;
        //
        if (result.biz != null) return settingService.get().getClientInterval();
        //如果没有相应的业务，要增加间隔
        long interval;
        if (result.reason == EmptyReason.MONTHLY_EXCEED) {
            interval = (getTimeOfNextBizMonth().getTime() - System.currentTimeMillis()) / 1000;
        } else if (result.reason == EmptyReason.DAILY_EXCEED) {
            interval = (getTimeOfNextBizDate().getTime() - System.currentTimeMillis()) / 1000;
        } else {
            interval = settingService.get().getRequestInterval();
        }
        if (interval < MIN_TASK_INTERVAL) interval = MIN_TASK_INTERVAL;
        if (interval > MAX_TASK_INTERVAL) interval = MAX_TASK_INTERVAL;
        return new Long(interval).intValue();
    }
    static Date getTimeOfNextBizDate() {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.SECOND, 3600 * 24);
        calendar.set(Calendar.HOUR_OF_DAY, 7);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        return calendar.getTime();
    }
    static Date getTimeOfNextBizMonth() {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MONTH, 1);
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        calendar.set(Calendar.HOUR_OF_DAY, 7);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        return calendar.getTime();
    }
    private void recordAccessStat(ClientEntity client, boolean countIn) {
        {
            StatAccessEntity accessStat = new StatAccessEntity();
            accessStat.setClientId(client.getId());
            accessStat.setAccessDate(FormatUtil.dateFormat.format(new Date()));
            try {
                statService.touchStatAccess(accessStat);
            } catch (Throwable e) {
                errorLogger.error(e.getMessage(), e);
            }
        }
        {
            if (countIn) {
                try {
                    channelAccessService.increaseAccessCount(client.getChannelId());
                } catch (Throwable e) {
                    errorLogger.error(e.getMessage(), e);
                }
                try {
                    retentionStatService.increaseAccessCount(client.getChannelId(), client.getCreateDate());
                } catch (Throwable e) {
                    errorLogger.error(e.getMessage(), e);
                }
            }
        }
    }
}
