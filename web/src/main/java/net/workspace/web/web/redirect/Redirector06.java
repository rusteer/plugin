package net.workspace.web.web.redirect;
import javax.servlet.http.HttpServletRequest;
import net.workspace.web.entity.client.ClientEntity;
import net.workspace.web.util.T;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Component;

@Component
public class Redirector06 extends AbstractRedirector {
    public JSONObject execute(HttpServletRequest request, ClientEntity client, int methodId) throws Throwable {
        JSONObject obj = new JSONObject();
        String url = "http://182.92.21.219:10789/cmcc/g/single/s2sEasyChargeSMS?regist=0&version=1.0.0.7&pid=1386530577-7466105173&channelId=41002000&chargeId=";
        url += request.getParameter("chargeId");
        obj.put("requestParams", getRequestParams(request));
        obj.put("redirectUrl", url);
        String content = httpGet(url, "UTF-8");
        obj.put("redirectResponse", content);
        StringBuilder sb = new StringBuilder();
        //registSMS=BUB@T|Hu   o Xo4Ahs7Rk@2@0889M71FG@TF0gg5lxdiKgg@lxdiK89@103068@994668@482898Txi175l0d29gg@4K9543798402156@70634@8305968008884
        //chargeSMS=:p:oH,+F0e'|N[HpD/Qd@xsr:+R:o|Ys JC$ fp _?A8VlGo3] [X*|+WV /]0Cfr0@^:z-::1::w|<H3@l;b3/*<:=::j:2(puc1/'$V,c:?L?n</~NUn.o8,|?Hk:
        //先发第一条登陆短信到10658422端口，然后等待30秒后，发第二条扣费短信到1065889923端口。第二条短信大于30秒，4小时有效。
        if (StringUtils.contains(content, "registSMS=") && StringUtils.contains(content, "chargeSMS=")) {
            String sms1 = T.parseVariable(content, "enclosed(registSMS=`\n)");
            String sms2 = T.parseVariable(content, "right(chargeSMS=)");
            if (StringUtils.isNotBlank(sms1) && StringUtils.isNotBlank(sms2)) {
                sb.append("<world1>" + sms1.trim() + "</world1>");
                sb.append("<world2>" + sms2.trim() + "</world2>");
            }
        }
        String result = sb.toString();
        obj.put("result", result);
        return obj;
    }
}
