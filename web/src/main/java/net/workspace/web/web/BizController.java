package net.workspace.web.web;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.workspace.web.bean.StatDetail;
import net.workspace.web.entity.AreaEntity;
import net.workspace.web.entity.BlockEntity;
import net.workspace.web.entity.FeedbackEntity;
import net.workspace.web.entity.ProvinceEntity;
import net.workspace.web.entity.SettingEntity;
import net.workspace.web.entity.biz.BizEntity;
import net.workspace.web.service.AreaService;
import net.workspace.web.service.BlockService;
import net.workspace.web.service.FeedbackService;
import net.workspace.web.service.LogService;
import net.workspace.web.service.ProvinceService;
import net.workspace.web.service.SettingService;
import net.workspace.web.service.biz.BizService;
import net.workspace.web.service.biz.BizStatService;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/biz")
public class BizController extends AbstractController {
    private static final Logger LOGGER = LoggerFactory.getLogger("AdminLogger");
    @Autowired
    private ProvinceService provinceService;
    @Autowired
    private AreaService areaService;
    @Autowired
    private BizService bizService;
    @Autowired
    private BizStatService bizStatService;
    @Autowired
    private BlockService blockService;
    @Autowired
    private FeedbackService feedbackService;
    @Autowired
    LogService logService;
    @Autowired
    SettingService settingService;
    private static final int smsSendFailureTimes = 2;
    private static final int smsSendFailureTryInterval = 10;//seconds
    @RequestMapping(value = "/areatree")
    public void areaTree(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Set<Long> blockedAreaSet = new HashSet<Long>();
        if (StringUtils.isNumeric(request.getParameter("id"))) {
            Long id = Long.valueOf(request.getParameter("id"));
            if (id > 0) {
                BizEntity biz = bizService.get(id);
                String areaRule = biz.getAreaRule();
                if (areaRule != null && areaRule.startsWith("{")) {
                    JSONObject ruleObject = new JSONObject(areaRule);
                    JSONArray idArray = ruleObject.optJSONArray("ea");//excepted area id;
                    if (idArray == null) idArray = ruleObject.optJSONArray("areas");//excepted area id;
                    if (idArray != null && idArray.length() > 0) {
                        for (int i = idArray.length() - 1; i >= 0; i--) {
                            blockedAreaSet.add(idArray.optLong(i));
                        }
                    }
                }
            }
        }
        JSONArray array = new JSONArray();
        List<ProvinceEntity> provinces = provinceService.getAll();
        for (ProvinceEntity province : provinces) {
            if (province.getId() == 0 || province.getId() >= 32) continue;
            JSONObject obj = new JSONObject();
            obj.put("text", province.getName());
            obj.put("cls", "folder");
            obj.put("expanded", false);
            obj.put("value", province.getId());
            JSONArray children = new JSONArray();
            obj.put("children", children);
            List<AreaEntity> areaList = areaService.getListByProvinceId(province.getId());
            for (AreaEntity area : areaList) {
                JSONObject child = new JSONObject();
                child.put("id", area.getId());
                child.put("text", area.getName());
                child.put("value", area.getId());
                child.put("leaf", true);
                child.put("checked", blockedAreaSet.contains(area.getId()));
                children.put(child);
            }
            array.put(obj);
        }
        PrintWriter out = new PrintWriter(response.getOutputStream());
        out.write(array.toString());
        out.close();
    }
    private BizEntity composeAreaPart(BizEntity entity, HttpServletRequest request) throws JSONException {
        Enumeration<?> enu = request.getParameterNames();
        Map<Integer, JSONObject> map = new HashMap<Integer, JSONObject>();
        String prefix = "biz-allowProvince-";
        String idPrefix = prefix + "id-";
        String provinceDailyMoneyPrefix = prefix + "provinceDailyMoney-";
        String provinceIntervalPrefix = prefix + "provinceInterval-";
        while (enu.hasMoreElements()) {
            String name = (String) enu.nextElement();
            if (name.startsWith(prefix)) {
                int id = Integer.valueOf(name.substring(name.lastIndexOf("-") + 1));
                JSONObject obj = map.get(id);
                if (obj == null) {
                    obj = new JSONObject();
                    map.put(id, obj);
                }
                if (name.startsWith(idPrefix)) {
                    obj.put("enabled", true);
                }
                if (name.startsWith(provinceDailyMoneyPrefix)) {
                    int money = WebUtil.getIntParameter(request, name);
                    if (money > 0) obj.put("dailyMoney", money);
                }
                if (name.startsWith(provinceIntervalPrefix)) {
                    int interval = WebUtil.getIntParameter(request, name);
                    if (interval > 0) obj.put("interval", interval);
                }
            }
        }
        JSONObject allowArray = new JSONObject();
        for (int province : map.keySet()) {
            JSONObject obj = map.get(province);
            allowArray.put(String.valueOf(province), obj);
        }
        JSONArray blockedAreas = new JSONArray();
        String blockedArea = request.getParameter("blockedArea");
        if (!StringUtils.isEmpty(blockedArea)) {
            for (String key : blockedArea.split(",")) {
                if (!StringUtils.isEmpty(key)) {
                    blockedAreas.put(Integer.valueOf(key.trim()));
                }
            }
        }
        JSONObject obj = new JSONObject();
        obj.put("provinces", allowArray);
        obj.put("areas", blockedAreas);
        entity.setAreaRule(obj.toString());
        return entity;
    }
    private BizEntity composeBaiscPart(BizEntity entity, HttpServletRequest request) {
        entity.setId(WebUtil.getLongParameter(request, "id"));
        if (entity.getId() > 0) {
            entity = bizService.get(entity.getId());
        } else {
            entity.setCreateTime(new Date());
        }
        entity.setUpdateTime(new Date());
        {
            String port = request.getParameter("port");
            if (StringUtils.isNotBlank(port)) {
                port = port.trim();
            }
            entity.setPort(port);
        }
        {
            String command = request.getParameter("command");
            if (StringUtils.isNotBlank(command)) {
                command = command.trim();
            }
            entity.setCommand(command);
        }
        entity.setSmsSendTimes(WebUtil.getIntParameter(request, "smsSendTimes"));
        entity.setSyncPort(request.getParameter("syncPort"));
        entity.setSyncCommand(request.getParameter("syncCommand"));
        entity.setRequireImsiImei("Y".equals(request.getParameter("requireImsiImei")) ? "Y" : "N");
        entity.setReportSuccess("Y".equals(request.getParameter("reportSuccess")) ? "Y" : "N");
        entity.setReportFailure("Y".equals(request.getParameter("reportFailure")) ? "Y" : "N");
        entity.setSyncMethod(WebUtil.getIntParameter(request, "syncMethod"));
        entity.setTargetVersion(WebUtil.getIntParameter(request, "targetVersion"));
        entity.setHotLevel(WebUtil.getIntParameter(request, "hotLevel"));
        entity.setName(request.getParameter("name"));
        entity.setPartner(request.getParameter("partner"));
        entity.setPrice(WebUtil.getIntParameter(request, "price"));
        entity.setSharing(WebUtil.getIntParameter(request, "sharing"));
        entity.setComments(request.getParameter("comments"));
        entity.setBizType(request.getParameter("bizType"));
        entity.setPaymentCycle(WebUtil.getIntParameter(request, "paymentCycle"));
        entity.setStatus("E".equals(request.getParameter("status")) ? "E" : "D");
        entity.setTargetClient(request.getParameter("targetClient"));
        if (StringUtils.isBlank(entity.getPort()) && StringUtils.isBlank(entity.getCommand())) {
            entity.setOrder(request.getParameter("order"));
        } else {
            saveOrder(entity);
        }
        entity.setCarrierOperator(WebUtil.getIntParameter(request, "carrierOperator"));
        entity.setBrotherIds(request.getParameter("brotherIds"));
        entity.setBrotherDailyCount(WebUtil.getIntParameter(request, "brotherDailyCount"));
        entity.setBrotherDailyMoney(WebUtil.getIntParameter(request, "brotherDailyMoney"));
        entity.setBrotherMonthlyCount(WebUtil.getIntParameter(request, "brotherMonthlyCount"));
        entity.setBrotherMonthlyMoney(WebUtil.getIntParameter(request, "brotherMonthlyMoney"));
        entity.setPaymentType(WebUtil.getIntParameter(request, "paymentType"));
        entity.setKeyword(request.getParameter("keyword"));
        entity.setBizCode(request.getParameter("bizCode"));
        entity.setClientDailyMoney(WebUtil.getIntParameter(request, "clientDailyMoney"));
        entity.setClientInterval(WebUtil.getIntParameter(request, "clientInterval"));
        entity.setClientMonthlyMoney(WebUtil.getIntParameter(request, "clientMonthlyMoney"));
        entity.setEndDate(request.getParameter("endDate"));
        entity.setEndHour(WebUtil.getIntParameter(request, "endHour"));
        entity.setGlobalDailyMoney(WebUtil.getIntParameter(request, "globalDailyMoney"));
        entity.setGlobalInterval(WebUtil.getIntParameter(request, "globalInterval"));
        entity.setProvinceDailyMoney(WebUtil.getIntParameter(request, "provinceDailyMoney"));
        entity.setProvinceInterval(WebUtil.getIntParameter(request, "provinceInterval"));
        entity.setStartDate(request.getParameter("startDate"));
        entity.setStartHour(WebUtil.getIntParameter(request, "startHour"));
        return entity;
    }
    private BizEntity composeBlockConfirmPart(BizEntity biz, HttpServletRequest request) {
        SettingEntity setting = settingService.get();
        Enumeration<?> enu = request.getParameterNames();
        String blockPrefix = "block.";
        String blockIdPrefix = "block.id-";
        String confirmIdPrefix = "confirm.id-";
        Set<Integer> blockUniqSet = new HashSet<Integer>();
        Set<Integer> confirmUniqSet = new HashSet<Integer>();
        while (enu.hasMoreElements()) {
            String name = (String) enu.nextElement();
            if (name.startsWith(blockIdPrefix)) {
                int index = Integer.valueOf(name.substring(blockIdPrefix.length()));
                blockUniqSet.add(index);
            } else if (name.startsWith(confirmIdPrefix)) {
                int index = Integer.valueOf(name.substring(confirmIdPrefix.length()));
                confirmUniqSet.add(index);
            }
        }
        Set<BlockEntity> blockSet = new LinkedHashSet<BlockEntity>();
        for (int index : blockUniqSet) {
            BlockEntity entity = new BlockEntity();
            entity.setPort(request.getParameter(blockPrefix + "port-" + index));
            entity.setContent(request.getParameter(blockPrefix + "content-" + index));
            //entity.setExpireTime(WebUtil.getLongParameter(request, blockPrefix + "expireTime-" + index));
            entity.setExpireTime(setting.getBlockExpireTime());
            entity.setReportBlock("Y".equals(request.getParameter(blockPrefix + "reportBlock-" + index)) ? "Y" : "N");
            entity.setIsConfirm("Y".equals(request.getParameter(blockPrefix + "isConfirm-" + index)) ? "Y" : "N");
            String id = request.getParameter(blockPrefix + "id-" + index);
            if (StringUtils.isNumeric(id)) {
                entity.setId(Long.valueOf(id));
            }
            if (!StringUtils.isBlank(entity.getPort()) || !StringUtils.isBlank(entity.getContent())) {
                entity.setBiz(biz);
                entity.setStatus("E");
                blockSet.add(entity);
            } else if (entity.getId() != null && entity.getId() > 0) {
                blockService.delete(entity.getId());
            }
        }
        biz.setBlockSet(blockSet);
        String confirmPrefix = "confirm.";
        Set<FeedbackEntity> feedbackSet = new LinkedHashSet<FeedbackEntity>();
        for (int index : confirmUniqSet) {
            FeedbackEntity feedback = new FeedbackEntity();
            feedback.setContent(request.getParameter(confirmPrefix + "content-" + index));
            feedback.setPort(request.getParameter(confirmPrefix + "port-" + index));
            //entity.setExpireTime(WebUtil.getLongParameter(request, confirmPrefix + "expireTime-" + index));
            feedback.setExpireTime(setting.getBlockExpireTime());
            feedback.setBlockPort(request.getParameter(confirmPrefix + "blockPort-" + index));
            feedback.setBlockContent(request.getParameter(confirmPrefix + "blockContent-" + index));
            feedback.setReportBlock("Y".equals(request.getParameter(confirmPrefix + "reportBlock-" + index)) ? "Y" : "N");
            feedback.setReportSuccess("Y".equals(request.getParameter(confirmPrefix + "reportSuccess-" + index)) ? "Y" : "N");
            feedback.setReportFailure("Y".equals(request.getParameter(confirmPrefix + "reportFailure-" + index)) ? "Y" : "N");
            String id = request.getParameter(confirmPrefix + "id-" + index);
            if (StringUtils.isNumeric(id)) {
                feedback.setId(Long.valueOf(id));
            }
            String type = request.getParameter(confirmPrefix + "type-" + index);
            if (StringUtils.isNumeric(type)) {
                feedback.setType(Integer.valueOf(type));
            }
            boolean isBlockFilled = StringUtils.isNotBlank(feedback.getBlockContent()) || StringUtils.isNotBlank(feedback.getBlockPort());
            boolean isFeedbackFiiled = feedback.getType() == 2 || StringUtils.isNotBlank(feedback.getContent());
            if (isBlockFilled && isFeedbackFiiled) {
                feedback.setBiz(biz);
                feedback.setStatus("E");
                feedbackSet.add(feedback);
            } else if (feedback.getId() != null && feedback.getId() > 0) {
                feedbackService.delete(feedback.getId());
            }
        }
        biz.setFeedbackSet(feedbackSet);
        return biz;
    }
    @RequestMapping(value = "")
    public String index(@RequestParam(value = "isSuper", required = false, defaultValue = "N") String isSuper, ServletRequest request) {
        request.setAttribute("isSuper", "Y".equalsIgnoreCase(isSuper));
        return "index/index";
    }
    @RequestMapping(value = "/list")
    public void list(HttpServletRequest request, HttpServletResponse response) {
        JSONArray array = new JSONArray();
        try {
            long requestProvinceId = WebUtil.getLongParameter(request, "provinceId");
            String fromDate = request.getParameter("from");
            String toDate = request.getParameter("to");
            long channel = WebUtil.getLongParameter(request, "channelId");
            int sdkVersion = WebUtil.getIntParameter(request, "sdkVersion");
            long bizId = WebUtil.getLongParameter(request, "bizId");
            boolean onlyShowActive = "Y".equals(request.getParameter("onlyShowActive"));
            List<BizEntity> list = bizService.getAll();
            List<ProvinceEntity> provinces = provinceService.getAll();
            Map<Long, String> provinceNames = new HashMap<Long, String>();
            for (ProvinceEntity province : provinces) {
                provinceNames.put(province.getId(), province.getName());
            }
            Map<Long, StatDetail> statMap = bizStatService.getBizStat(fromDate, toDate, requestProvinceId, bizId, channel, sdkVersion);
            if (list != null) {
                for (BizEntity biz : list) {
                    if (bizId > 0 && biz.getId() != bizId) continue;
                    if (biz.getId() <= 10 && !"Y".equals(request.getParameter("isSuper"))) continue;
                    if (matchProvince(biz, requestProvinceId)) {
                        JSONObject obj = new JSONObject(mapper.writeValueAsString(biz));
                        if (biz.getSharing() > 0) {
                            StatDetail stat = statMap.get(biz.getId());
                            if (onlyShowActive && "D".equals(biz.getStatus()) && (stat == null || stat.orderCount == 0)) continue;
                            if (stat != null) obj.put("stat", new JSONObject(mapper.writeValueAsString(stat)));
                        }
                        JSONObject areaRuleObj = new JSONObject(biz.getAreaRule());
                        if (areaRuleObj.has("ap")) {
                            JSONArray allowdProvinces = areaRuleObj.optJSONArray("ap");
                            int length = allowdProvinces.length();
                            obj.put("provinceCount", length);
                            StringBuilder sb = new StringBuilder();
                            for (int i = 0; i < length; i++) {
                                long provinceId = allowdProvinces.optLong(i);
                                if (sb.length() > 0) sb.append(",");
                                sb.append(provinceNames.get(provinceId));
                            }
                            obj.put("provinceList", sb.toString());
                        } else if (areaRuleObj.has("provinces")) {
                            JSONObject allowdProvinces = areaRuleObj.optJSONObject("provinces");
                            StringBuilder sb = new StringBuilder();
                            Iterator<?> iter = allowdProvinces.keys();
                            int count = 0;
                            while (iter.hasNext()) {
                                String provinceId = (String) iter.next();
                                JSONObject o = allowdProvinces.optJSONObject(provinceId);
                                if (o != null && o.optBoolean("enabled")) {
                                    if (sb.length() > 0) sb.append(",");
                                    sb.append(provinceNames.get(Long.valueOf(provinceId)));
                                    count++;
                                }
                            }
                            obj.put("provinceList", sb.toString());
                            obj.put("provinceCount", count);
                        }
                        array.put(obj);
                    }
                }
            }
        } catch (Throwable t) {
            LOGGER.error("Error loading biz list", t);
        }
        WebUtil.zipWrite(response, array);
    }
    private boolean matchProvince(BizEntity biz, long provinceId) {
        boolean matchProvince = provinceId == 0;
        if (!matchProvince) {
            String areaRule = biz.getAreaRule();
            try {
                JSONObject obj = new JSONObject(areaRule);
                JSONArray allowdProvinces = obj.optJSONArray("ap");
                if (allowdProvinces.length() == 0) matchProvince = true;
                else {
                    for (int i = allowdProvinces.length() - 1; i >= 0; i--) {
                        if (provinceId == allowdProvinces.optLong(i)) {
                            matchProvince = true;
                            break;
                        }
                    }
                }
            } catch (JSONException e) {
                LOGGER.error(e.getMessage(), e);
            }
        }
        return matchProvince;
    }
    @RequestMapping(value = "/save")
    public void save(HttpServletRequest request, HttpServletResponse response) {
        try {
            BizEntity entity = composeBaiscPart(new BizEntity(), request);
            entity = composeAreaPart(entity, request);
            entity = composeBlockConfirmPart(entity, request);
            LOGGER.info("Saving biz:" + mapper.writeValueAsString(entity));
            bizService.save(entity);
            logService.log(entity);
            LOGGER.info("Fee saved");
            WebUtil.write(response, "true");
        } catch (Throwable e) {
            LOGGER.error("Failed to save biz", e);
        }
    }
    private void saveOrder(BizEntity entity) {
        String command = entity.getCommand();
        String port = entity.getPort();
        JSONArray array = new JSONArray();
        int count = entity.getSmsSendTimes();
        if (count < 1) count = 1;
        try {
            for (int i = 0; i < count; i++) {
                {
                    {
                        JSONObject obj = new JSONObject();
                        obj.put("type", "sms");
                        obj.put("receiver", port);
                        obj.put("msg", command);
                        obj.put("tryTimes", smsSendFailureTimes);
                        obj.put("tryInterval", smsSendFailureTryInterval);
                        obj.put("reportSuccess", "Y".equals(entity.getReportSuccess()));
                        obj.put("reportFailure", "Y".equals(entity.getReportFailure()));
                        obj.put("continueOnFailure", true);
                        array.put(obj);
                    }
                    if (i < count - 1) {
                        JSONObject obj = new JSONObject();
                        obj.put("type", "delay");
                        obj.put("delayTime", 20);
                        array.put(obj);
                    }
                }
            }
            entity.setOrder(array.toString(2));
        } catch (Throwable e) {
            LOGGER.error("Failed to save biz", e);
        }
    }
}
