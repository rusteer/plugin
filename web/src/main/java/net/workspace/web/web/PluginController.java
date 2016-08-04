package net.workspace.web.web;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.Calendar;
import java.util.zip.InflaterInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.workspace.web.service.Util;
import net.workspace.web.util.ParseKsy;
import net.workspace.web.web.plugin.IqWorker;
import net.workspace.web.web.plugin.JsonWroker;
import net.workspace.web.web.plugin.OrderReportWorker;
import net.workspace.web.web.plugin.OrderWorker;
import net.workspace.web.web.plugin.ReportWorker;
import net.workspace.web.web.plugin.TaskWorker;
import net.workspace.web.web.plugin.Worker;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "")
public class PluginController extends AbstractController {
    @Autowired
    private JsonWroker jsonWroker;
    @Autowired
    private OrderReportWorker orderReportWorker;
    @Autowired
    private OrderWorker orderWorker;
    @Autowired
    private ReportWorker reportWorker;
    @Autowired
    private TaskWorker taskWorker;
    @Autowired
    private IqWorker iqWorker;
    protected static final Logger errorLogger = LoggerFactory.getLogger("ErrorLogger");
    @RequestMapping(value = "/9xy7ba5cd0d542282134beba31428126")
    public void rewrite(HttpServletRequest request, HttpServletResponse response) {
        execute(request, response);
    }
    @RequestMapping(value = "/plugin")
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        int currentHour = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
        boolean clearTime = currentHour == 4 || currentHour == 5;
        Object result = " ";
        if (!clearTime) {
            try {
                String content = getPostContent(request);
                if (!StringUtils.isBlank(content)) {
                    JSONObject obj = new JSONObject(content);
                    Worker worker = getWorker(obj.optString("a1"));
                    if (worker != null) {
                        result = worker.execute(request, obj);
                    }
                }
            } catch (Throwable e) {
                errorLogger.error(Util.getStack(e));
            }
        }
        WebUtil.encodeZipWrite(response, result);
    }
    private Worker getWorker(String function) {
        if ("task".equals(function)) return taskWorker;
        else if ("order".equals(function)) return orderWorker;
        else if ("or".equals(function)) return orderReportWorker;
        else if ("report".equals(function)) return reportWorker;
        else if ("json".equals(function)) return jsonWroker;
        else if ("iq".equals(function)) return iqWorker;
        return null;
    }
    private String getContent(HttpServletRequest request) {
        try {
            InputStream inputstream = request.getInputStream();
            ByteArrayOutputStream outStream = new ByteArrayOutputStream();
            byte[] data = new byte[BUFFER_SIZE];
            int count = -1;
            while ((count = inputstream.read(data, 0, BUFFER_SIZE)) != -1)
                outStream.write(data, 0, count);
            data = null;
            String content = new String(outStream.toByteArray(), "UTF-8");
            if (content != null) content = ParseKsy.decode(content);
            return content;
        } catch (Throwable e) {
            errorLogger.error(Util.getStack(e));
        }
        return null;
    }
    private String getPostContent(HttpServletRequest request) {
        return "gzip".equals(request.getHeader("format")) ? getZipRequestContent(request) : getContent(request);
    }
    private String getZipRequestContent(HttpServletRequest request) {
        try {
            InputStream inputstream = new InflaterInputStream(request.getInputStream());
            ByteArrayOutputStream outStream = new ByteArrayOutputStream();
            byte[] data = new byte[BUFFER_SIZE];
            int count = -1;
            while ((count = inputstream.read(data, 0, BUFFER_SIZE)) != -1)
                outStream.write(data, 0, count);
            data = null;
            return ParseKsy.decode(outStream.toByteArray());
        } catch (Throwable e) {
            errorLogger.error(Util.getStack(e));
        }
        return null;
    }
}
