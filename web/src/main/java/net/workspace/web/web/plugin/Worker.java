package net.workspace.web.web.plugin;
import javax.servlet.http.HttpServletRequest;
import net.workspace.web.entity.AreaEntity;
import net.workspace.web.entity.IpInfoEntity;
import net.workspace.web.entity.LogEntity;
import net.workspace.web.entity.client.ClientEntity;
import net.workspace.web.service.AreaService;
import net.workspace.web.service.IpInfoService;
import net.workspace.web.service.LogService;
import net.workspace.web.service.MobileInfoService;
import net.workspace.web.service.OrderService;
import net.workspace.web.service.SettingService;
import net.workspace.web.service.biz.BizService;
import net.workspace.web.service.channel.ChannelService;
import net.workspace.web.service.client.ClientService;
import net.workspace.web.service.record.OrderRecordService;
import net.workspace.web.web.WebUtil;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class Worker {
    protected static final Logger clientLogger = LoggerFactory.getLogger("PluginLogger");
    protected static final Logger errorLogger = LoggerFactory.getLogger("ErrorLogger");
    @Autowired
    OrderService orderService;
    @Autowired
    ClientService clientService;
    @Autowired
    OrderRecordService orderRecordService;
    @Autowired
    AreaService areaService;
    @Autowired
    BizService bizService;
    @Autowired
    LogService logService;
    @Autowired
    SettingService settingService;
    @Autowired
    ChannelService channelService;
    @Autowired
    MobileInfoService mobileAreaService;
    @Autowired
    private IpInfoService ipRangeService;
    protected void log(HttpServletRequest request, LogEntity entity) {
        clientLogger.info(WebUtil.getRequestIp(request) + ",http://" + request.getHeader("HOST") + request.getHeader("REQUEST_PATH") + ":" + entity.toString() + "\n");
        //clientLogger.info(getRemoteAddr(request) + request.getHeader("URI") + ":" + entity.toString() + "\n");
        logService.log(entity);
    }
    protected boolean noPhoneArea(ClientEntity client) {
        return client.getProvinceId() == null || client.getProvinceId() == 0;
    }
    protected void checkAreaByIp(HttpServletRequest request, ClientEntity client) {
        if (client == null) {
            errorLogger.error("Worker.checkAreaByIp:client is null");
            return;
        }
        if (noPhoneArea(client) && "Y".equals(settingService.get().getEnableNoPhonePay())) {
            String ip = WebUtil.getRequestIp(request);
            IpInfoEntity info = this.ipRangeService.getAreaCode(ip);
            if (info != null) {
                client.setIpProvinceId(info.getProvinceId());
                client.setIpAreaId(info.getCityId());
                client.setIp(ip);
            } else {
                errorLogger.warn("no-ip-range-set: " + ip);
            }
        }
    }
    public abstract String execute(HttpServletRequest request, JSONObject input) throws Exception;
}
