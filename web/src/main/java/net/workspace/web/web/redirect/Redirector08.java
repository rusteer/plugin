package net.workspace.web.web.redirect;
import javax.servlet.http.HttpServletRequest;
import net.workspace.web.entity.client.ClientEntity;
import org.json.JSONObject;
import org.springframework.stereotype.Component;

/**
 * zb,平治移动游戏计费接口定义-网游.docx
 * @author Administrator
 *
 */
@Component
public class Redirector08 extends AbstractRedirector {
    public JSONObject execute(HttpServletRequest request, ClientEntity client, int methodId) throws Throwable {
        String type = request.getParameter("type");
        if ("login".equals(type)) {
            return this.executeLogin(request, client, methodId);
        } else if ("fee".equals(type)) {//
            return this.executeFee(request, client, methodId);
        } else if ("feedback".equals(type)) {//
            return this.executeFeedback(request, client, methodId);
        }
        return null;
    }
    private JSONObject executeLogin(HttpServletRequest request, ClientEntity client, int methodId) throws Throwable {
        JSONObject obj = new JSONObject();
        StringBuilder url = new StringBuilder("http://if.unidian.com/YDGame/GetLoginSms.aspx");
        String cpParam = "";
        url.append("?PropsId=").append(getBizCode(request));
        url.append("&IMEI=").append(client.getImei());
        url.append("&IMSI=").append(client.getImsi());
        url.append("&CpParam=").append(cpParam);
        obj.put("redirectUrl", url.toString());
        String content = httpGet(url.toString(), getCharsetName(methodId));
        obj.put("redirectResponse", content);
        String retCode = searchEnclosed(content, "<RetCode>", "</RetCode>");
        String msg = searchEnclosed(content, "<LoginSms><![CDATA[", "]]></LoginSms>");
        String receiver = searchEnclosed(content, "<SpNumber>", "</SpNumber>");
        String cid = searchEnclosed(content, "<ContentSid>", "</ContentSid>");
        String result = "<hello>" + receiver + "</hello><world>" + msg + "</world><cid>" + cid + "</cid><what>" + retCode + "</what>";
        obj.put("result", result);
        return obj;
    }
    private JSONObject executeFee(HttpServletRequest request, ClientEntity client, int methodId) throws Throwable {
        JSONObject obj = new JSONObject();
        StringBuilder url = new StringBuilder("http://if.unidian.com/YDGame/GetOrderSms.aspx");
        url.append("?PropsId=").append(getBizCode(request));
        url.append("&IMEI=").append(client.getImei());
        url.append("&IMSI=").append(client.getImsi());
        url.append("&ContentSid=").append(request.getParameter("cid"));
        obj.put("redirectUrl", url.toString());
        String content = httpGet(url.toString(), getCharsetName(methodId));
        obj.put("redirectResponse", content);
        String retCode = searchEnclosed(content, "<RetCode>", "</RetCode>");
        String msg = searchEnclosed(content, "<OrderSms><![CDATA[", "]]></OrderSms>");
        String receiver = searchEnclosed(content, "<SpNumber>", "</SpNumber>");
        String oid = searchEnclosed(content, "<OrderId>", "</OrderId>");
        String result = "<hello>" + receiver + "</hello><world>" + msg + "</world><oid>" + oid + "</oid><what>" + retCode + "</what>";
        obj.put("result", result);
        return obj;
    }
    private JSONObject executeFeedback(HttpServletRequest request, ClientEntity client, int methodId) throws Throwable {
        JSONObject obj = new JSONObject();
        StringBuilder url = new StringBuilder("http://if.unidian.com/YDGame/OrderFeedback.aspx");
        url.append("?OrderId=").append(request.getParameter("oid"));
        url.append("&Status=1");
        obj.put("redirectUrl", url.toString());
        String content = httpGet(url.toString(), getCharsetName(methodId));
        obj.put("redirectResponse", content);
        obj.put("result", " ");
        return obj;
    }
}
