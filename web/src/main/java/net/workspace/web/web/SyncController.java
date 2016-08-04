package net.workspace.web.web;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.workspace.web.entity.ProvinceEntity;
import net.workspace.web.entity.biz.BizEntity;
import net.workspace.web.entity.client.ClientEntity;
import net.workspace.web.entity.sync.AutoSyncEntity;
import net.workspace.web.entity.sync.AutoSyncLinkEntity;
import net.workspace.web.entity.sync.ManuSyncEntity;
import net.workspace.web.service.AreaService;
import net.workspace.web.service.FormatUtil;
import net.workspace.web.service.ManuSyncService;
import net.workspace.web.service.OrderService;
import net.workspace.web.service.ProvinceService;
import net.workspace.web.service.SettingService;
import net.workspace.web.service.SyncLinkService;
import net.workspace.web.service.SyncService;
import net.workspace.web.service.Util;
import net.workspace.web.service.biz.BizService;
import net.workspace.web.service.client.ClientService;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/sync")
public class SyncController extends AbstractController {
    private class SyncPair {
        private ProvinceEntity province;
        private BizEntity biz;
    }
    private static final Logger logger = LoggerFactory.getLogger("SyncLogger");
    @Autowired
    private SyncLinkService syncLinkService;
    @Autowired
    private BizService bizService;
    @Autowired
    private ProvinceService provinceService;
    @Autowired
    private AreaService areaService;
    @Autowired
    private SyncService syncService;
    @Autowired
    ClientService clientService;
    @Autowired
    SettingService settingService;
    @Autowired
    ManuSyncService orderSyncService;
    private String[] getMobileKeys() {
        //String keys = "DestUser_ID,statphone,mobile,P,phone,from";
        return settingService.get().getSyncMobileKeywords().split(",");
    }
    private String[] getPortKeys() {
        //String keys = "icpport,SendPhone,spno,Dest_Id,spnumber,spport,longnum,longcode,longphone,B,mospcode,spcode,spid,spnum,to,dest";
        return settingService.get().getSyncPortKeywords().split(",");
    }
    private String[] getLinkIdKeys() {
        //String keys = "linkid,linkId,mobpwd,LinkId";
        return settingService.get().getSyncLinkidKeywords().split(",");
    }
    private String[] getCommandKeys() {
        //String keys = "SendCode,code,MO_Msg,Msg,msg,momsg,extdata,serviceup,cmd,content,message,mocontents";
        return settingService.get().getSyncCommandKeywords().split(",");
    }
    @RequestMapping(value = "/")
    public void sync(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String msg = getFailureResult(request);
        String requstSyncPort = getParameter(request, getPortKeys());
        String requestSyncMobile = getParameter(request, getMobileKeys());
        String requestSyncCommand = getParameter(request, getCommandKeys());
        if (!StringUtils.isBlank(requstSyncPort)) {
            if (save(requstSyncPort, requestSyncCommand, requestSyncMobile)) {
                msg = getSuccessResult(request);
            }
        }
        String info = String.format("requstSyncPort=%s,requestSyncCommand=%s,requestSyncMobile=%s", requstSyncPort, requestSyncCommand, requestSyncMobile);
        output(request, response, msg, info);
    }
    @RequestMapping(value = "/mo")
    public void mo(HttpServletRequest request, HttpServletResponse response) throws Exception {
        AutoSyncLinkEntity entity = new AutoSyncLinkEntity();
        entity.setCreateTime(new Date());
        entity.setLinkId(getParameter(request, getLinkIdKeys()));
        entity.setMobile(getParameter(request, getMobileKeys()));
        entity.setCommand(getParameter(request, getCommandKeys()));
        entity.setPort(getParameter(request, getPortKeys()));
        //entity.setServiceId(getParameter(request, serviceIdKeys));
        syncLinkService.save(entity);
        String msg = getSuccessResult(request);
        output(request, response, msg, null);
    }
    @RequestMapping(value = "/mr")
    public void mr(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String linkId = getParameter(request, getLinkIdKeys());
        String msg = getFailureResult(request);
        if (!StringUtils.isBlank(linkId)) {
            AutoSyncLinkEntity syncLink = syncLinkService.findByLinkId(linkId);
            if (syncLink != null) {
                save(syncLink.getPort(), syncLink.getCommand(), syncLink.getMobile());
                msg = getSuccessResult(request);
            }
        }
        output(request, response, msg, null);
    }
    @RequestMapping(value = "/em")
    public void empty(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String msg = getSuccessResult(request);
        output(request, response, msg, null);
    }
    private String getFailureResult(HttpServletRequest request) {
        if (StringUtils.isNotBlank(request.getParameter("MO_Msg"))) return "1";
        return "ERR";
    }
    private void output(HttpServletRequest request, HttpServletResponse response, String msg, String info) throws Exception {
        logRequest(request, msg, info);
        WebUtil.write(response, msg);
    }
    private String getParameter(HttpServletRequest request, String[] keys) {
        for (String key : keys) {
            String value = request.getParameter(key);
            if (!StringUtils.isBlank(value)) return value;
        }
        return null;
    }
    private String getSuccessResult(HttpServletRequest request) {
        if (StringUtils.isNotBlank(request.getParameter("MO_Msg"))) return "0";
        if (request.getRemoteAddr().equals("222.73.34.106")) return "ok";//亿通
        return "OK";
    }
    private boolean loadBiz(SyncPair pair, String requestSyncPort, String requestSyncCommand) {
        return loadBizByPortAndCommand(pair, requestSyncPort, requestSyncCommand) || loadBizByPort(pair, requestSyncPort, requestSyncCommand)
                || loadBizByCommand(pair, requestSyncPort, requestSyncCommand);
    }
    private boolean loadBizByCommand(SyncPair pair, String requestSyncPort, String requestSyncCommand) {
        List<BizEntity> list = bizService.getListBySyncCommand(requestSyncCommand);
        if (CollectionUtils.isNotEmpty(list)) {
            if (pair.province != null) {
                if (StringUtils.isNotBlank(pair.province.getCode())) {
                    for (BizEntity biz : list) {
                        if (matchPort(requestSyncPort, pair.province, biz)) {
                            pair.biz = biz;
                            return true;
                        }
                    }
                }
                if (StringUtils.isNotBlank(pair.province.getCode2())) {
                    for (BizEntity biz : list) {
                        if (matchPort(requestSyncPort, pair.province, biz)) {
                            pair.biz = biz;
                            return true;
                        }
                    }
                }
            } else {
                for (ProvinceEntity province : provinceService.getAll()) {
                    for (BizEntity biz : list) {
                        if (matchPort(requestSyncPort, province, biz)) {
                            pair.biz = biz;
                            pair.province = province;
                            return true;
                        }
                    }
                }
            }
        }
        return false;
    }
    private boolean loadBizByPort(SyncPair pair, String requestSyncPort, String requestSyncCommand) {
        List<BizEntity> list = bizService.getListBySyncPort(requestSyncPort);
        if (CollectionUtils.isNotEmpty(list)) {
            if (pair.province != null) {
                if (StringUtils.isNotBlank(pair.province.getCode())) {
                    for (BizEntity entity : list) {
                        if (matchCommand(requestSyncCommand, pair.province, entity)) {
                            pair.biz = entity;
                            return true;
                        }
                    }
                }
                if (StringUtils.isNotBlank(pair.province.getCode2())) {
                    for (BizEntity entity : list) {
                        if (matchCommand(requestSyncCommand, pair.province, entity)) {
                            pair.biz = entity;
                            return true;
                        }
                    }
                }
            } else {
                for (ProvinceEntity pEntity : provinceService.getAll()) {
                    for (BizEntity bEntity : list) {
                        if (matchCommand(requestSyncCommand, pEntity, bEntity)) {
                            pair.biz = bEntity;
                            pair.province = pEntity;
                            return true;
                        }
                    }
                }
            }
        }
        return false;
    }
    private boolean loadBizByPortAndCommand(SyncPair pair, String requestSyncPort, String requestSyncCommand) {
        List<BizEntity> list = bizService.getListBySyncPortAndSyncCommand(requestSyncPort, requestSyncCommand);
        if (list.size() > 0) {
            for (BizEntity entity : list) {
                if (matchProvince(pair.province, entity)) {
                    pair.biz = entity;
                    break;
                }
            }
            if (pair.biz == null) pair.biz = list.get(0);
            return true;
        }
        return false;
    }
    private void logRequest(HttpServletRequest request, String response, String info) throws Exception {
        JSONObject result = new JSONObject();
        StringBuffer url = request.getRequestURL();
        String queryString = request.getQueryString();
        if (queryString != null) {
            url.append("?").append(queryString);
        }
        result.put("link", url.toString());
        JSONObject params = new JSONObject();
        Enumeration<?> names = request.getParameterNames();
        while (names.hasMoreElements()) {
            String name = (String) names.nextElement();
            params.put(name, request.getParameter(name));
        }
        result.put("params", params);
        result.put("response", response);
        result.put("info", info);
        logger.info(request.getRemoteAddr() + ":" + result.toString() + "\n");
    }
    private boolean matchCode(String syncValue, String bizValue, ProvinceEntity province) {
        boolean result = false;
        if (StringUtils.isNotBlank(bizValue)) {
            String reversedBizValue = bizValue;
            if (reversedBizValue.contains(OrderService.PROVINCE_CODE)) {
                String code = province.getCode();
                if (StringUtils.isNotBlank(code)) reversedBizValue = reversedBizValue.replaceAll(OrderService.PROVINCE_CODE, code);
            }
            if (reversedBizValue.contains(OrderService.PROVINCE_CODE2)) {
                String code = province.getCode2();
                if (StringUtils.isNotBlank(code)) reversedBizValue = reversedBizValue.replaceAll(OrderService.PROVINCE_CODE2, code);
            }
            if (reversedBizValue.contains(OrderService.CAPTIAL_CODE)) {
                String code = areaService.getCaptialCode(province.getId());
                if (StringUtils.isNotBlank(code)) reversedBizValue = reversedBizValue.replaceAll(OrderService.CAPTIAL_CODE, code);
            }
            result = syncValue.equals(reversedBizValue);
        }
        return result;
    }
    private boolean matchCommand(String requestSyncCommand, ProvinceEntity province, BizEntity biz) {
        String bizSyncCommand = StringUtils.isEmpty(biz.getSyncCommand()) ? biz.getCommand() : biz.getSyncCommand();
        return matchProvince(province, biz) && matchCode(requestSyncCommand, bizSyncCommand, province);
    }
    private boolean matchPort(String requestSyncPort, ProvinceEntity province, BizEntity biz) {
        String bizSyncPort = StringUtils.isEmpty(biz.getSyncPort()) ? biz.getPort() : biz.getSyncPort();
        return matchProvince(province, biz) && matchCode(requestSyncPort, bizSyncPort, province);
    }
    private boolean matchProvince(ProvinceEntity province, BizEntity biz) {
        boolean matchProvince = false;
        if (province != null && biz != null) {
            try {
                JSONArray provinceArray = new JSONObject(biz.getAreaRule()).optJSONArray("ap");
                if (provinceArray != null) {
                    for (int i = 0; i < provinceArray.length(); i++) {
                        long id = provinceArray.optLong(i);
                        if (id == province.getId().longValue()) {
                            matchProvince = true;
                            break;
                        }
                    }
                }
            } catch (Exception e) {
                LOGGER.error(e.getMessage(), e);
            }
        }
        return matchProvince;
    }
    private boolean save(String requstSyncPort, String requestSyncCommand, String requestSyncMobile) {
        boolean result = false;
        try {
            ClientEntity client = clientService.findByPhoneNumber(requestSyncMobile);
            //TODO
            SyncPair pair = new SyncPair();
            if (client != null) pair.province = provinceService.get(Util.getClientProvinceId(client));
            loadBiz(pair, requstSyncPort, requestSyncCommand);
            if (pair.biz != null) {
                result = true;
                if (client != null) {
                    AutoSyncEntity sync = new AutoSyncEntity();
                    sync.setCreateTime(new Date());
                    sync.setFeeId(pair.biz.getId());
                    sync.setProvinceId(Util.getClientProvinceId(client));
                    sync.setUserId(client.getId());
                    syncService.save(sync);
                } else {
                    logger.warn("Cannot find client accoring to " + requestSyncMobile + "\n");
                    long provinceId = pair.province == null ? 0 : pair.province.getId();
                    String date = FormatUtil.dateFormat.format(new Date());
                    ManuSyncEntity orderSync = orderSyncService.find(pair.biz.getId(), provinceId, date);
                    if (orderSync == null) {
                        orderSync = new ManuSyncEntity();
                        orderSync.setCreateTime(new Date());
                        orderSync.setFeeId(pair.biz.getId());
                        orderSync.setProvinceId(provinceId);
                        orderSync.setSyncDate(date);
                        orderSync.setSyncCount(0);
                    }
                    orderSync.setSyncCount(orderSync.getSyncCount() + 1);
                    orderSyncService.save(orderSync);
                }
            } else {
                logger.error("Cannot find biz accoring to " + requestSyncCommand + "->" + requstSyncPort + "\n");
            }
        } catch (Exception e) {
            logger.error("Error occurs while saving sync(" + requstSyncPort + "," + requestSyncCommand + "," + requestSyncMobile + ")", e);
        }
        return result;
    }
}
