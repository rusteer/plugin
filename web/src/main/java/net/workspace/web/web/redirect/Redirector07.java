package net.workspace.web.web.redirect;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import net.workspace.web.entity.client.ClientEntity;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Component;
import utils.base64.Base64;

@Component
public class Redirector07 extends AbstractRedirector {
    //JJ,jjandroid网游sdk平台代收流程-20141118.doc
    public JSONObject execute(HttpServletRequest request, ClientEntity client, int methodId) throws Throwable {
        JSONObject obj = new JSONObject();
        Map<String, String> bizParams = getBizParams(request);
        String result = null;
        StringBuilder sb = new StringBuilder("http://203.195.213.186:9900/cp/ob?1=1");
        for (String key : bizParams.keySet()) {
            sb.append("&").append(key).append("=").append(bizParams.get(key));
        }
        String url = sb.toString();
        obj.put("requestParams", getRequestParams(request));
        obj.put("redirectUrl", url);
        String content = httpGet(url.toString(), "UTF-8");
        obj.put("redirectResponse", content);
        if (StringUtils.isNotBlank(content)) {
            String resultCode = searchEnclosed(content, "<infoCode>", "</infoCode>");
            String sms = "";
            if ("0".equals(resultCode)) {
                sms = Base64.decode(searchEnclosed(content, "<smsInfo>", "</smsInfo>"));
            }
            result = "<world>" + sms + "</world><what>" + resultCode + "</what>";
            recordStatus(request, resultCode);
        }
        obj.put("result", result);
        return obj;
    }
}
