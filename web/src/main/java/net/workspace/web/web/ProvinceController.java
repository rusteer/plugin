package net.workspace.web.web;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.workspace.web.bean.ProvinceClientCount;
import net.workspace.web.bean.StatDetail;
import net.workspace.web.entity.ProvinceEntity;
import net.workspace.web.entity.biz.BizEntity;
import net.workspace.web.service.LogService;
import net.workspace.web.service.ProvinceService;
import net.workspace.web.service.biz.BizService;
import net.workspace.web.service.biz.BizStatService;
import net.workspace.web.service.client.ClientService;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = "/province")
public class ProvinceController extends AbstractController {
    static long countryId = 32;
    private static final Logger LOGGER = LoggerFactory.getLogger("AdminLogger");
    private Gson gson = new Gson();
    @Autowired
    LogService logService;
    @Autowired
    private BizStatService bizStatService;
    @Autowired
    private ProvinceService provinceService;
    @Autowired
    private ClientService clientService;
    @Autowired
    private BizService bizService;
    private List<Long> getAllowedProvinces(BizEntity biz) throws Exception {
        List<Long> list = new ArrayList<Long>();
        String rule = biz.getAreaRule();
        if (StringUtils.isNotBlank(rule)) {
            JSONObject ruleObj = new JSONObject(rule);
            if (ruleObj.has("ap")) {
                JSONArray allowdProvince = ruleObj.optJSONArray("ap");
                if (allowdProvince != null) {
                    for (int i = 0; i < allowdProvince.length(); i++) {
                        list.add(allowdProvince.optLong(i));
                    }
                }
            } else if (ruleObj.has("provinces")) {
                JSONObject allowdProvinces = ruleObj.optJSONObject("provinces");
                Iterator<?> keys = allowdProvinces.keys();
                while (keys.hasNext()) {
                    String id = (String) keys.next();
                    JSONObject obj = allowdProvinces.optJSONObject(id);
                    if (obj.optBoolean("enabled")) {
                        list.add(Long.valueOf(id));
                    }
                }
            }
        }
        return list;
    }
    @RequestMapping(value = "/list")
    public void list(HttpServletRequest request, HttpServletResponse response) throws Exception {
        long channelId = WebUtil.getLongParameter(request, "channel");
        String fromDate = request.getParameter("from");
        String toDate = request.getParameter("to");
        int carrierOperator = WebUtil.getIntParameter(request, "carrierOperator");
        int sdkVersion = WebUtil.getIntParameter(request, "sdkVersion");
        List<ProvinceClientCount> newUserList = clientService.getProvinceNewCount(fromDate, toDate, channelId, carrierOperator, sdkVersion, false);
        List<ProvinceClientCount> accessUserList = clientService.getProvinceAccessCount(fromDate, toDate, channelId, carrierOperator, sdkVersion, false);
        Map<String, Set<Long>> bizIdSet = new HashMap<String, Set<Long>>();
        List<ProvinceEntity> list = new ArrayList<ProvinceEntity>();
        list.addAll(provinceService.getAll());
        ProvinceEntity unknowProvince = new ProvinceEntity();
        unknowProvince.setId(0L);
        unknowProvince.setPriority(12);
        unknowProvince.setName("未知");
        list.add(unknowProvince);
        Map<Long, JSONObject> provinceMap = new LinkedHashMap<Long, JSONObject>();
        for (ProvinceEntity province : list) {
            provinceMap.put(province.getId(), new JSONObject(gson.toJson(province)));
        }
        for (ProvinceClientCount count : newUserList) {
            JSONObject obj = provinceMap.get(count.getProvinceId());
            if (obj != null) {
                obj.put("newCount", count.getClientCount());
            }
        }
        for (ProvinceClientCount count : accessUserList) {
            JSONObject obj = provinceMap.get(count.getProvinceId());
            if (obj != null) {
                obj.put("accessCount", count.getClientCount());
            }
        }
        for (BizEntity biz : bizService.getAll()) {
            if ("E".equals(biz.getStatus()) && biz.getClientDailyMoney() > 0 && biz.getClientMonthlyMoney() > 0 && biz.getProvinceDailyMoney() > 0) {
                for (long provinceId : getAllowedProvinces(biz)) {
                    JSONObject provinceObj = provinceMap.get(provinceId);
                    if (provinceObj != null) {
                        {
                            //All type count begin
                            String allCountKey = "bizTypeAllCount";
                            provinceObj.put(allCountKey, provinceObj.optInt(allCountKey) + 1);
                            String bizListKey = "bizList";
                            String bizListResult = provinceObj.optString(bizListKey);
                            if (bizListResult == null) bizListResult = "";
                            if (bizListResult.length() > 0) bizListResult += ",";
                            bizListResult += biz.getName();
                            provinceObj.put(bizListKey, bizListResult);
                            Set<Long> set = bizIdSet.get(allCountKey);
                            if (set == null) {
                                set = new HashSet<Long>();
                                bizIdSet.put(allCountKey, set);
                            }
                            set.add(biz.getId());
                        }
                        {
                            //Type Count begin
                            String key = "bizType" + biz.getBizType() + "Count";
                            provinceObj.put(key, provinceObj.optInt(key) + 1);
                            Set<Long> set = bizIdSet.get(key);
                            if (set == null) {
                                set = new HashSet<Long>();
                                bizIdSet.put(key, set);
                            }
                            set.add(biz.getId());
                        }
                    }
                }
            }
        }
        long bizId = WebUtil.getLongParameter(request, "bizId");
        long provinceId = WebUtil.getLongParameter(request, "provinceId");
        JSONArray result = new JSONArray();
        Map<Long, StatDetail> map = bizStatService.getProvinceStat(fromDate, toDate, provinceId, bizId, channelId, sdkVersion);
        for (Long id : provinceMap.keySet()) {
            JSONObject provinceObj = provinceMap.get(id);
            StatDetail stat = map.get(id);
            if (stat != null) {
                provinceObj.put("stat", new JSONObject(mapper.writeValueAsString(stat)));
            }
            result.put(provinceObj);
        }
        JSONObject countryObj = provinceMap.get(countryId);
        countryObj.put("priority", 0);
        WebUtil.  zipWrite(response, result.toString());
    }
    @RequestMapping(value = "/save")
    public void save(HttpServletRequest request, HttpServletResponse response) {
        try {
            long provinceId = WebUtil.getLongParameter(request, "id");
            ProvinceEntity province = provinceService.get(provinceId);
            province.setName(request.getParameter("name"));
            province.setPriority(WebUtil.getIntParameter(request, "priority"));
            province.setCode(request.getParameter("code"));
            province.setCode2(request.getParameter("code2"));
            province.setCode3(request.getParameter("code3"));
            province.setCode4(request.getParameter("code4"));
            province.setCode5(request.getParameter("code5"));
            provinceService.save(province);
            logService.log(province);
            WebUtil.   write(response, "true");
        } catch (Throwable e) {
            LOGGER.error("Error while saving province config", e);
        }
    }
    @RequestMapping(value = "/simple-list")
    public void simpleList(HttpServletRequest request, HttpServletResponse response) throws Exception {
        JSONArray result = new JSONArray();
        for (ProvinceEntity province : provinceService.getAll()) {
            result.put(new JSONObject(mapper.writeValueAsString(province)));
        }
        WebUtil.   zipWrite(response, result.toString());
    }
}
