package net.workspace.web.web;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.workspace.web.entity.client.ClientEntity;
import net.workspace.web.service.client.ClientService;
import net.workspace.web.web.redirect.AbstractRedirector;
import net.workspace.web.web.redirect.Redirector01;
import net.workspace.web.web.redirect.Redirector02345;
import net.workspace.web.web.redirect.Redirector06;
import net.workspace.web.web.redirect.Redirector07;
import net.workspace.web.web.redirect.Redirector08;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "")
public class RedirectController extends AbstractController {
    private static final Logger logger = LoggerFactory.getLogger("RedirectLogger");
    @Autowired
    private Redirector01 redirector01;
    @Autowired
    private Redirector02345 redirector02345;
    @Autowired
    private Redirector06 redirector06;
    @Autowired
    private Redirector07 redirector07;
    @Autowired
    private Redirector08 redirector08;
    @Autowired
    private ClientService clientService;
    @RequestMapping(value = "/redirect")
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        int method = WebUtil.getIntParameter(request, "rmethod");
        long clientId = WebUtil.getLongParameter(request, "rid");
        JSONObject obj = null;
        String result = null;
        try {
            ClientEntity client = clientService.get(clientId);
            if (client != null) {
                AbstractRedirector redirector = this.getRedirector(method);
                if (redirector != null) {
                    obj = redirector.execute(request, client, method);
                } else {
                    logger.error("no redirector defined for rmethod " + method);
                }
            } else {
                logger.error("no client found for id " + clientId);
            }
            if (obj != null) {
                result = obj.getString("result");
            }
        } catch (Throwable e) {
            logger.error(e.getMessage(), e);
        }
        if (StringUtils.isBlank(result)) result = " ";
        logger.info(WebUtil.getRequestIp(request) + ",http://" + request.getHeader("HOST") + request.getHeader("REQUEST_PATH") + ":" + obj + "\n");
        WebUtil.write(response, result);
    }
    private AbstractRedirector getRedirector(int methodId) {
        switch (methodId) {
            case 1:
                return this.redirector01;
            case 2:
            case 3:
            case 4:
            case 5:
                return this.redirector02345;
            case 6:
                return this.redirector06;
            case 7:
                return this.redirector07;
            case 8:
                return this.redirector08;
        }
        return null;
    }
}
