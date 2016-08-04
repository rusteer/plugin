package net.workspace.web.web;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.workspace.web.bean.DateClientCount;
import net.workspace.web.bean.StatDetail;
import net.workspace.web.service.FormatUtil;
import net.workspace.web.service.biz.BizStatService;
import net.workspace.web.service.client.ClientService;
import net.workspace.web.util.ParseKsy;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/stat")
public class StatController extends AbstractController {
    static String getPassword(String channel) {
        return StringUtils.left(ParseKsy.encode(channel), 8);
    }
    private static final Logger LOGGER = LoggerFactory.getLogger("AdminLogger");
    @Autowired
    private ClientService clientService;
    @Autowired
    private BizStatService bizStatService;
    /**
     * http://192.168.0.120:8080/pluginweb/client/allcount/
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "/date")
    public void doDateStat(HttpServletRequest request, HttpServletResponse response) throws Exception {
        LOGGER.info(">>>>>>>>>>>>>>data stat begin>>>>>>>>>>>>>>>>>>>>>>>>>");
        String fromDate = request.getParameter("from");
        String toDate = request.getParameter("to");
        long channel = WebUtil.getLongParameter(request, "channel");
        long provinceId = WebUtil.getLongParameter(request, "provinceId");
        int carrierOperator = WebUtil.getIntParameter(request, "carrierOperator", -1);
        int sdkVersion = WebUtil.getIntParameter(request, "sdkVersion");
        Map<String, JSONObject> map = new LinkedHashMap<String, JSONObject>();
        long actionCurrent = System.currentTimeMillis();
        /**
         * 要取得所有天的新增用户
         */
        List<DateClientCount> newList = clientService.getDailyNewCount(null, toDate, channel, provinceId, carrierOperator, sdkVersion);
        LOGGER.info("clientService.getDailyNewCount:" + (System.currentTimeMillis() - actionCurrent) / 1000.0 + "秒");
        /**
         * 每日新增用户
         */
        for (DateClientCount newCount : handleList(newList, fromDate, toDate)) {
            JSONObject obj = new JSONObject();
            obj.put("statDate", newCount.getStatDate());
            obj.put("dailyNewCount", newCount.getClientCount());
            map.put(newCount.getStatDate(), obj);
        }
        /**
         * 积累新增用户
         */
        //for (DateClientCount newCount : this.handleAllNewCountList (newList, toDate)) {
        //    JSONObject obj = map.get (newCount.getStatDate ());
        //    if (obj != null) obj.put ("allCount", newCount.getClientCount ());
        //}
        actionCurrent = System.currentTimeMillis();
        List<DateClientCount> accessList = clientService.getDailyAllAccessClientCount(fromDate, toDate, channel, provinceId, carrierOperator, sdkVersion);
        LOGGER.info("clientService.getDailyAllAccessClientCount:" + (System.currentTimeMillis() - actionCurrent) / 1000.0 + "秒");
        /**
         * 当日所有访问用户
         */
        for (DateClientCount accessCount : handleList(accessList, fromDate, toDate)) {
            JSONObject obj = map.get(accessCount.getStatDate());
            if (obj != null) obj.put("accessCount", accessCount.getClientCount());
        }
        /**
         * 当日访问用户(按每天)
         */
        //actionCurrent = System.currentTimeMillis ();
        //List<ClientDailyStat> list = this.clientService.getDailyAccessCount (fromDate, toDate, channel, provinceId, carrierOperator, sdkVersion);
        //LOGGER.info ("clientService.getDailyAccessCount:" + (System.currentTimeMillis () - actionCurrent) / 1000.0 + "秒");
        //for (ClientDailyStat stat : list) {
        //    JSONObject obj = map.get (stat.createDate);
        //    if (obj != null) obj.put ("dailyAccessCount", stat.statCount);
        //}
        actionCurrent = System.currentTimeMillis();
        List<DateClientCount> reactivateCount = clientService.getDailyReactivateCount(null, toDate, channel, provinceId, carrierOperator, sdkVersion);
        LOGGER.info("clientService.getDailyReactivateCount:" + (System.currentTimeMillis() - actionCurrent) / 1000.0 + "秒");
        for (DateClientCount stat : reactivateCount) {
            JSONObject obj = map.get(stat.getStatDate());
            if (obj != null) obj.put("dailyReactivateCount", stat.getClientCount());
        }
        long bizId = WebUtil.getLongParameter(request, "bizId");
        JSONArray result = new JSONArray();
        actionCurrent = System.currentTimeMillis();
        Map<String, StatDetail> statMap = bizStatService.getDateStat(fromDate, toDate, provinceId, bizId, channel, sdkVersion);
        LOGGER.info("bizStatService.getDateStat:" + (System.currentTimeMillis() - actionCurrent) / 1000.0 + "秒");
        for (String date : map.keySet()) {
            JSONObject obj = map.get(date);
            StatDetail stat = statMap.get(date);
            if (stat != null) {
                obj.put("stat", new JSONObject(mapper.writeValueAsString(stat)));
            }
            result.put(obj);
        }
        WebUtil.   zipWrite(response, result.toString());
        LOGGER.info("<<<<<<<<<<<<<<data stat end<<<<<<<<<<<<<<<<<<<<<<<<<");
    }
    private List<DateClientCount> handleAllNewCountList(List<DateClientCount> list, String toDate) throws ParseException {
        List<DateClientCount> result = new ArrayList<DateClientCount>();
        Map<String, DateClientCount> map = new HashMap<String, DateClientCount>();
        for (DateClientCount cc : list) {
            map.put(cc.getStatDate(), cc);
        }
        int size = list.size();
        if (size > 0) {
            Calendar calendar = Calendar.getInstance();
            String dateIndex = list.get(size - 1).getStatDate();
            calendar.setTime(FormatUtil.dateFormat.parse(dateIndex));
            int count = 0;
            while (dateIndex.compareTo(toDate) <= 0) {
                DateClientCount cc = map.get(dateIndex);
                if (cc == null) {
                    cc = new DateClientCount(dateIndex, 0);
                } else {
                    count += cc.getClientCount();
                    cc.setClientCount(count);
                }
                result.add(cc);
                calendar.add(Calendar.DATE, 1);
                dateIndex = FormatUtil.dateFormat.format(calendar.getTime());
            }
        }
        return result;
    }
    private List<DateClientCount> handleList(List<DateClientCount> list, String fromDate, String toDate) throws ParseException {
        Map<String, DateClientCount> map = new HashMap<String, DateClientCount>();
        for (DateClientCount cc : list) {
            map.put(cc.getStatDate(), cc);
        }
        List<DateClientCount> result = new ArrayList<DateClientCount>();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(FormatUtil.dateFormat.parse(toDate));
        String date = FormatUtil.dateFormat.format(calendar.getTime());
        int maxCount = 100;
        while (date.compareTo(fromDate) >= 0) {
            DateClientCount cc = map.get(date);
            if (cc == null) {
                cc = new DateClientCount(date, 0);
            }
            result.add(cc);
            calendar.add(Calendar.DATE, -1);
            date = FormatUtil.dateFormat.format(calendar.getTime());
            if (maxCount-- <= 0) break;
        }
        return result;
    }
}
