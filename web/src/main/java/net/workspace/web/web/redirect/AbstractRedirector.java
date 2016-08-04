package net.workspace.web.web.redirect;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import net.workspace.web.entity.biz.BizEntity;
import net.workspace.web.entity.biz.BizStatusEntity;
import net.workspace.web.entity.client.ClientEntity;
import net.workspace.web.service.FormatUtil;
import net.workspace.web.service.biz.BizService;
import net.workspace.web.service.biz.BizStatusService;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class AbstractRedirector {
    @Autowired
    private BizService bizService;
    @Autowired
    private BizStatusService bizStatusService;

    public abstract JSONObject execute(HttpServletRequest request, ClientEntity client,int methodId)throws Throwable;
    protected String httpGet(String url, String encode) throws Throwable {
        StringBuilder sb = new StringBuilder();
        InputStream is = null;
        HttpClient httpclient = new DefaultHttpClient();
        HttpGet httpgets = new HttpGet(url);
        Throwable error = null;
        try {
            HttpEntity entity = httpclient.execute(httpgets).getEntity();
            if (entity != null) {
                is = entity.getContent();
                BufferedReader reader = new BufferedReader(new InputStreamReader(is, encode));
                String line;
                while ((line = reader.readLine()) != null) {
                    sb.append(line).append("\n");
                }
            }
        } catch (IOException e) {
            error = e;
        } finally {
            httpgets.abort();
            try {
                if (is != null) is.close();
            } catch (IOException e) {
                error = e;
            }
        }
        if (error != null) throw error;
        return sb.toString();
    }
    protected String postXml(String url, String body, String charsetName) throws Throwable {
        StringBuilder sb = new StringBuilder();
        OutputStreamWriter out = null;
        Throwable error = null;
        try {
            URLConnection con = new URL(url).openConnection();
            con.setDoOutput(true);
            con.setRequestProperty("Pragma:", "no-cache");
            con.setRequestProperty("Cache-Control", "no-cache");
            con.setRequestProperty("Content-Type", "text/xml");
            out = new OutputStreamWriter(con.getOutputStream());
            out.write(new String(body.getBytes("UTF-8")));
            out.flush();
            BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), charsetName));
            String line;
            for (line = br.readLine(); line != null; line = br.readLine()) {
                sb.append(line).append("\n");
            }
        } catch (Exception e) {
            error = e;
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e) {
                    error = e;
                }
            }
        }
        if (error != null) throw error;
        return sb.toString();
    }
    protected String searchEnclosed(String target, String left, String right) {
        return searchEnclosed(target, left, right, 0);
    }
    protected String searchEnclosed(String target, String left, String right, int matcherIndex) {
        if (!StringUtils.isEmpty(target) && !StringUtils.isEmpty(left) && !StringUtils.isEmpty(right)) {
            int index = 0;
            int leftPlace = 0;
            int rightPlace = 0;
            int fromPlace = 0;
            while (leftPlace >= 0 && rightPlace >= 0) {
                leftPlace = target.indexOf(left, fromPlace);
                if (leftPlace >= 0) {
                    fromPlace = leftPlace + left.length() + 1;
                    rightPlace = target.indexOf(right, fromPlace);
                    if (rightPlace > 0 && (matcherIndex == -1 || matcherIndex == index++)) {//
                        return target.substring(leftPlace + left.length(), rightPlace);
                    }
                    fromPlace = rightPlace + right.length() + 1;
                }
            }
        }
        return null;
    }
    
    protected String getCharsetName(int methodId) {
        switch (methodId) {
            case 3://JJ
                return "GBK";
        }
        return "UTF-8";
    }
    protected String getRemoteAddr(HttpServletRequest request) {
        return request.getHeader("X-Real-IP");
    }
    protected JSONObject getRequestParams(HttpServletRequest request) throws JSONException {
        JSONObject obj = new JSONObject();
        Enumeration en = request.getParameterNames();
        while (en.hasMoreElements()) {
            String key = (String) en.nextElement();
            String value = request.getParameter(key);
            obj.put(key, value);
        }
        return obj;
    }
    
    protected String getBizCode(HttpServletRequest request) {
        for (String key : new String[] { "consumecode", "sid" }) {
            String value = request.getParameter(key);
            if (StringUtils.isNotEmpty(value)) return value;
        }
        return null;
    }
    protected Map<String, String> getBizParams(HttpServletRequest request) {
        Map<String, String> map = new HashMap<String, String>();
        Enumeration en = request.getParameterNames();
        while (en.hasMoreElements()) {
            String key = (String) en.nextElement();
            if ("rid".equals(key) || "rmethod".equals(key)) continue;
            String value = request.getParameter(key);
            map.put(key, value);
        }
        return map;
    }
    
    protected void recordStatus(HttpServletRequest request, String code) {
        String bizCode = getBizCode(request);
        BizEntity biz = bizService.getByBizCode(bizCode);
        if (biz != null) {
            BizStatusEntity status = new BizStatusEntity();
            status.setBizId(biz.getId());
            status.setStatusCode(code);
            status.setStatDate(FormatUtil.dateFormat.format(new Date()));
            bizStatusService.increase(status);
        }
    }
}
