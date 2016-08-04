package net.workspace.web.web;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.workspace.web.entity.sync.ManuSyncEntity;
import net.workspace.web.service.FormatUtil;
import net.workspace.web.service.LogService;
import net.workspace.web.service.ManuSyncService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = "/ordersync")
public class OrderSyncController extends AbstractController {
    private static final Logger LOGGER = LoggerFactory.getLogger("AdminLogger");
    @Autowired
    LogService logService;
    @Autowired
    private ManuSyncService service;
    /**
     * http://192.168.0.120:8080/pluginweb/client/allcount/
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "/allcount")
    public void getAllCount(HttpServletRequest request, HttpServletResponse response) {
        try {
            long provinceId = WebUtil.getLongParameter(request, "provinceId");
            long feeId = WebUtil.getLongParameter(request, "bizId");
            String fromDate = request.getParameter("from");
            String toDate = request.getParameter("to");
            List<ManuSyncEntity> list = service.getList(feeId, provinceId, fromDate, toDate);
            Map<String, ManuSyncEntity> map = new HashMap<String, ManuSyncEntity>();
            for (ManuSyncEntity cc : list) {
                map.put(cc.getSyncDate(), cc);
            }
            List<ManuSyncEntity> result = new ArrayList<ManuSyncEntity>();
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(FormatUtil.dateFormat.parse(toDate));
            String date = FormatUtil.dateFormat.format(calendar.getTime());
            int maxCount = 100;
            while (date.compareTo(fromDate) >= 0) {
                ManuSyncEntity cc = map.get(date);
                if (cc == null) {
                    cc = new ManuSyncEntity();
                    cc.setFeeId(feeId);
                    cc.setProvinceId(provinceId);
                    cc.setSyncCount(0);
                    cc.setSyncDate(date);
                }
                result.add(cc);
                calendar.add(Calendar.DATE, -1);
                date = FormatUtil.dateFormat.format(calendar.getTime());
                if (maxCount-- <= 0) break;
            }
            WebUtil.   zipWrite(response, new Gson().toJson(result));
        } catch (Throwable t) {
            LOGGER.error("Error loading ordersync list", t);
        }
    }
    @RequestMapping(value = "/save")
    public void save(HttpServletRequest request, HttpServletResponse response) {
        try {
            long feeId = WebUtil.getLongParameter(request, "bizId");
            long provinceId = WebUtil.getLongParameter(request, "provinceId");
            String syncDate = request.getParameter("syncDate");
            int syncCount = WebUtil.getIntParameter(request, "syncCount");
            ManuSyncEntity entity = service.find(feeId, provinceId, syncDate);
            if (entity == null) {
                entity = new ManuSyncEntity();
                entity.setCreateTime(new Date());
                entity.setFeeId(feeId);
                entity.setProvinceId(provinceId);
                entity.setSyncDate(syncDate);
            }
            entity.setSyncCount(syncCount);
            service.save(entity);
            logService.log(entity);
            WebUtil.    zipWrite(response, "true");
        } catch (Throwable t) {
            LOGGER.error("Error saving ordersync list", t);
        }
    }
}
