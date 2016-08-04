package net.workspace.web.web;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.workspace.web.service.LogService;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;

@Controller
@RequestMapping(value = "/log")
public class LogController extends AbstractController {
    private Gson gson = new GsonBuilder().setPrettyPrinting().create();
    @Autowired
    LogService logService;
    @RequestMapping(value = "")
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        long provinceId = WebUtil.getLongParameter(request, "provinceId");
        String phoneNumber = request.getParameter("phoneNumber");
        long bizId = WebUtil.getLongParameter(request, "bizId");
        String deviceId = request.getParameter("deviceId");
        long clientId = WebUtil.getLongParameter(request, "clientId");
        long channelId = WebUtil.getLongParameter(request, "channelId");
        String areaCode = request.getParameter("areaCode");
        long orderId = WebUtil.getLongParameter(request, "orderId");
        String from = request.getParameter("fromDate").replace('T', ' ');
        String to = request.getParameter("toDate").replace('T', ' ');
        String type = request.getParameter("type");
        JSONObject obj = new JSONObject();
        if (!StringUtils.isBlank(type)) obj.put("type", type);
        if (channelId > 0) obj.put("channel", channelId);
        if (provinceId > 0) obj.put("provinceId", provinceId);
        if (!StringUtils.isBlank(phoneNumber)) obj.put("phoneNumber", phoneNumber);
        if (bizId > 0) obj.put("bizId", bizId);
        if (!StringUtils.isBlank(deviceId)) obj.put("deviceId", deviceId);
        if (clientId > 0) obj.put("clientId", clientId);
        if (!StringUtils.isBlank(areaCode)) obj.put("areaCode", areaCode);
        if (orderId > 0) obj.put("orderId", orderId);
        if (!StringUtils.isBlank(from)) {
            JSONObject great = new JSONObject();
            great.put("$gt", from);
            obj.put("createTime", great);
        }
        if (!StringUtils.isBlank(to)) {
            JSONObject less = obj.optJSONObject("createTime");
            if (less == null) {
                less = new JSONObject();
                obj.put("createTime", less);
            }
            less.put("$lte", to);
        }
        int pageSize = WebUtil.getIntParameter(request, "pageSize");
        if (pageSize < 0 || pageSize > 200) pageSize = 200;
        int startPage = WebUtil.getIntParameter(request, "startPage");
        int skipNumber = startPage * pageSize;
        String query = obj.toString();
        JSONArray array = logService.find(query, skipNumber, pageSize);
        for (int i = 0; i < array.length(); i++) {
            JSONObject jObj = array.getJSONObject(i);
            JSONObject content = jObj.optJSONObject("content");
            if (content != null) {
                String formBody = null;
                JSONObject subContent = content.optJSONObject("content");
                if (subContent != null) {
                    JSONObject jResponse = subContent.optJSONObject("response");
                    if (jResponse != null) {
                        formBody = jResponse.getString("body");
                        if (formBody != null) {
                            jResponse.remove("body");
                        }
                    }
                    jObj.put("formBody", formBody);
                }
                jObj.put("content", gson.toJson(gson.fromJson(content.toString(), JsonElement.class)));
            }
        }
        WebUtil.zipWrite(response, array);
    }
}
