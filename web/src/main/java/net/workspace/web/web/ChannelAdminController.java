package net.workspace.web.web;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.workspace.web.bean.ChannelStat;
import net.workspace.web.entity.channel.ChannelEntity;
import net.workspace.web.service.channel.ChannelService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "")
public class ChannelAdminController extends AbstractController {
    private static final String URL_PREFIX = "/channelAdmin";
    private static final String LIST_URL = URL_PREFIX + "/list";
    @Autowired
    private ChannelService service;
    @Autowired
    ChannelService channelService;
    RandomValidateCode randomCode = new RandomValidateCode();
    @RequestMapping(value = LIST_URL)
    public void list(HttpServletRequest request, HttpServletResponse response) throws Exception {
        JSONArray array = new JSONArray();
        String fromDate = request.getParameter("from");
        String toDate = request.getParameter("to");
        long provinceId = WebUtil.getLongParameter(request, "provinceId");
        int carrierOperator =  WebUtil.getIntParameter(request, "carrierOperator", -1);
        int sdkVersion =  WebUtil.getIntParameter(request, "sdkVersion");
        Map<Long, ChannelStat> map = service.getChanelStat(provinceId, fromDate, toDate, carrierOperator, sdkVersion);
        for (ChannelEntity channel : service.getList()) {
            JSONObject obj = new JSONObject(mapper.writeValueAsString(channel));
            ChannelStat stat = map.get(channel.getId());
            if (stat != null) {
                obj.put("newClientCount", stat.newClientCount);
                obj.put("reActivateCount", stat.reActivateCount);
            }
            array.put(obj);
        }
        WebUtil.zipWrite(response, array);
    }
}
