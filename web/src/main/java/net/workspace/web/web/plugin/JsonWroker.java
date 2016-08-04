package net.workspace.web.web.plugin;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import net.workspace.web.entity.AreaEntity;
import net.workspace.web.entity.LogEntity;
import net.workspace.web.entity.MobileInfoEntity;
import net.workspace.web.entity.client.ClientEntity;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Component;
import bean.Json;
import bean.form.JsonForm;
import bean.prop.KeyValue;

@Component
public class JsonWroker extends Worker {
    @Override
    public String execute(HttpServletRequest request, JSONObject input) throws Exception {
        JsonForm form = Json.optObj(JsonForm.class, input);
        ClientEntity client = clientService.findByDeviceId(form.deviceId);
        checkAreaByIp(request, client);
        if (client != null) {
            List<KeyValue> params = form.params;
            Map<String, String> paramsMap = new HashMap<String, String>();
            for (KeyValue kv : params) {
                paramsMap.put(kv.key, kv.value);
            }
            String method = paramsMap.get("method");
            if ("a".equals(method)) {//取归属地
                String info = paramsMap.get("info");
                String areaCode = getAreaCode(info);
                if (StringUtils.isNotBlank(areaCode)) {
                    log(request, new LogEntity(client, form, method));
                    AreaEntity area = areaService.findByAreaCode(areaCode);
                    if (area != null) {
                        client.setAreaCode(areaCode);
                        client.setAreaId(area.getId());
                        client.setProvinceId(area.getProvince().getId());
                        MobileInfoEntity mobileInfo = mobileAreaService.loadInfo(client.getPhoneNumber());
                        if (mobileInfo == null) {
                            mobileInfo = new MobileInfoEntity();
                            mobileInfo.setAreaCode(area.getAreaCode());
                            mobileInfo.setMobileNumber(StringUtils.left(client.getPhoneNumber(), 7));
                            mobileAreaService.save(mobileInfo);
                        }
                    } else {
                        errorLogger.error("handleJson:NoAreaCodeException,cannot find area accoring to " + areaCode + " info:" + info);
                    }
                    clientService.save(client);
                } else {
                    errorLogger.error("handleJson:InvalidInfoError,  info:" + info);
                }
            } else {
                errorLogger.error("handleJson:NoMethodDefineError, method is:" + method);
            }
        } else {
            errorLogger.error("handleJson:NoClientFoundError, input is:" + input);
        }
        return null;
    }
    private String getAreaCode(String info) {
        try {
            JSONObject obj = new JSONObject(info);
            if (obj.has("AreaCode")) return obj.optString("AreaCode");
            if (obj.has("result")) {
                JSONObject result = obj.optJSONObject("result");
                if (result != null) { return result.optString("area"); }
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }
}
