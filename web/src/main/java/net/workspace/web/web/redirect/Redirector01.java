package net.workspace.web.web.redirect;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import net.workspace.web.entity.client.ClientEntity;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Component;
import utils.base64.Base64;

@Component
public class Redirector01 extends AbstractRedirector {
    //String JJ_URL_PREFIX = "http://new2014.us:9009/gamesdk/get.jsp?";
    String JJ_URL_PREFIX = "http://203.195.213.186:9900/gamesdk/get.jsp?";
    public JSONObject execute(HttpServletRequest request, ClientEntity client, int methodId) throws Throwable {
        JSONObject obj = new JSONObject();
        String result = null;
        obj.put("requestParams", getRequestParams(request));
        //String url = this.getJJUrl (request, client);
        String url = null;
        {
            String imei = client.getImei();
            String imsi = client.getImsi();
            if (StringUtils.isNotBlank(imei) && StringUtils.isNotBlank(imsi)) {
                StringBuilder sb = new StringBuilder(JJ_URL_PREFIX);
                sb.append("imei=").append(imei).append("&").append("imsi=").append(imsi).append("&show=xml&");
                sb.append("encode=base64&");
                Map<String, String> bizParams = getBizParams(request);
                for (String key : bizParams.keySet()) {
                    String value = bizParams.get(key);
                    sb.append(key).append("=").append(value).append("&");
                }
                url = sb.toString();
            }
        }
        obj.put("redirectUrl", url);
        if (StringUtils.isNotBlank(url)) {
            String content = httpGet(url, "GB2312");
            obj.put("redirectResponse", content);
            String num = searchEnclosed(content, "<num>", "</num>");
            String sms = searchEnclosed(content, "<sms>", "</sms>");
            String resultCode = searchEnclosed(content, "<hRet>", "</hRet>");
            sms = Base64.decode(sms);
            result = "<hello>" + num + "</hello><world>" + sms + "</world><what>" + resultCode + "</what>";
            obj.put("response", result);
        }
        obj.put("result", result);
        return obj;
    }
}
