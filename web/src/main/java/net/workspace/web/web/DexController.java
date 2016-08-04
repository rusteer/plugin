package net.workspace.web.web;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.workspace.web.entity.DexEntity;
import net.workspace.web.service.DexService;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@Scope("request")
@RequestMapping(value = "")
public class DexController extends AbstractController {
    @Autowired
    DexService service;
    private static final Logger logger = LoggerFactory.getLogger("DexLogger");
    @RequestMapping(value = "/dex/update")
    public void handleClientRequest(HttpServletRequest request, HttpServletResponse response) {
        logAccessReqeust(request);
        String result = null;
        try {
            JSONObject requestobj = null;
            String encodedData = request.getParameter("p");
            String decodedData = null;
            if (StringUtils.isNotBlank(encodedData)) {
                decodedData = Base64Util.decodeString(encodedData);
                logger.info("request:" + decodedData);
                requestobj = new JSONObject(decodedData);
            }
            JSONObject obj = new JSONObject();
            if (requestobj != null) {
                int version = requestobj.optInt("v");
                if (version > -1) {
                    DexEntity dex = service.getLastVersion();
                    if (dex != null && dex.getVersion() > version) {
                        obj.put("L", dex.getDexLength());
                        obj.put("U", dex.getDownloadUrl());
                        result = Base64Util.encodeString(obj.toString());
                    }
                }
            }
            logger.info("response:" + obj.toString());
        } catch (Throwable e) {
            logger.error(e.getMessage(), e);
        }
        if (result == null) result = "";
        WebUtil.write(request, response, result);
    }
    public void logAccessReqeust(HttpServletRequest request) {
        StringBuilder sb = new StringBuilder();
        sb.append(request.getRequestURL().toString()).append("?");
        for (Object key : request.getParameterMap().keySet()) {
            sb.append(key).append("=").append(request.getParameter((String) key)).append("&");
        }
        logger.info(sb.toString());
    }
    @RequestMapping(value = "/6de7ba5c10d542fa5")
    public void rewrite(HttpServletRequest request, HttpServletResponse response) {
        handleClientRequest(request, response);
    }
}
