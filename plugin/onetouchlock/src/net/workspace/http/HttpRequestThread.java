package net.workspace.http;
import java.io.IOException;
import java.net.URI;
import java.net.URLEncoder;
import java.util.HashMap;
import net.workspace.biz.BIZ;
import net.workspace.network.NetworkController;
import net.workspace.util.MyLogger;
import net.workspace.util.CommonUtil;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.ProtocolException;
import org.apache.http.client.CookieStore;
import org.apache.http.client.RedirectHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;
import android.text.TextUtils;
import bean.prop.Header;
import bean.prop.KeyValue;

public class HttpRequestThread implements Runnable {
    private static CookieStore cookieStore = null;
    private HttpGet get;
    private DefaultHttpClient httpClient;
    private boolean isRedirect;
    private NetContext netContext;
    private HttpPost post;
    private int relinkTimes;
    private String url;
    public HttpRequestThread(NetContext netres) {
        relinkTimes = 0;
        netContext = netres;
        url = netres.url;
        isRedirect = false;
        if (netres.variables == null) netres.variables = new HashMap<String, String>();
    }
    private void closeConnect() {
        try {
            if (get != null) {
                if (!get.isAborted()) get.abort();
                get = null;
            }
            if (post != null) {
                if (!post.isAborted()) post.abort();
                post = null;
            }
            if (httpClient != null) {
                httpClient.getConnectionManager().shutdown();
                httpClient = null;
            }
        } catch (Exception e) {
            MyLogger.error(e);
        }
    }
    private HttpResponse executeGet() throws Exception {
        String requestUrl = url;
        if (netContext.requestStep.params != null && !isRedirect) {
            StringBuilder query = new StringBuilder();
            query.append(url);
            query.append("?");
            for (KeyValue kv : netContext.requestStep.params) {
                query.append(kv.key);
                query.append("=");
                query.append(URLEncoder.encode(CommonUtil.getRuntimeValue(netContext.variables, kv.value), "UTF-8"));
                query.append("&");
            }
            query.deleteCharAt(-1 + query.length());
            requestUrl = query.toString();
        }
        MyLogger.debug(requestUrl);
        HttpGet httpget = new HttpGet(requestUrl);
        get = httpget;
        CommonUtil.judgeNet(get);
        boolean hasAgent = false;
        if (netContext.requestStep.headers != null && netContext.requestStep.headers.size() > 0) {
            for (Header header : netContext.requestStep.headers) {
                get.setHeader(header.name, CommonUtil.getRuntimeValue(netContext.variables, header.value));
                if ("USER-AGENT".equalsIgnoreCase(header.name)) {
                    hasAgent = true;
                }
            }
        } else {
            if (!TextUtils.isEmpty(CommonUtil.INFO.userAgent)) {
                get.setHeader("User-Agent", CommonUtil.INFO.userAgent);
                hasAgent = true;
            }
            get.setHeader("Content-Type", "text/html");
            get.setHeader("Accept-Charset", "iso-8859-1, utf-8; q=0.7, *; q=0.7");
            get.setHeader("Accept-Language", "zh-cn, zh;q=1.0,en;q=0.5");
        }
        if (!hasAgent && !TextUtils.isEmpty(CommonUtil.INFO.userAgent)) {
            get.setHeader("User-Agent", CommonUtil.INFO.userAgent);
        }
        return httpClient.execute(get);
    }
    private HttpResponse executePost() throws Exception {
        post = new HttpPost(url);
        CommonUtil.judgeNet(post);
        boolean hasAgent = false;
        if (netContext.requestStep.headers == null || netContext.requestStep.headers.size() <= 0) {
            hasAgent = true;
            if (!TextUtils.isEmpty(CommonUtil.INFO.userAgent)) post.setHeader("User-Agent", CommonUtil.INFO.userAgent);
            post.setHeader("Content-Type", "text/html");
            post.setHeader("Accept-Charset", "iso-8859-1, utf-8; q=0.7, *; q=0.7");
            post.setHeader("Accept-Language", "zh-cn, zh;q=1.0,en;q=0.5");
        } else {
            for (Header header : netContext.requestStep.headers) {
                post.setHeader(header.name, CommonUtil.getRuntimeValue(netContext.variables, header.value));
                if ("USER-AGENT".equalsIgnoreCase(header.name)) hasAgent = true;
            }
        }
        if (!hasAgent && !TextUtils.isEmpty(CommonUtil.INFO.userAgent)) post.setHeader("User-Agent", CommonUtil.INFO.userAgent);
        String content = CommonUtil.getRuntimeValue(netContext.variables, netContext.requestStep.content);
        if (netContext.requestStep.params != null) {
            StringBuilder sb = new StringBuilder();
            for (KeyValue param : netContext.requestStep.params) {
                sb.append(param.key);
                sb.append("=");
                sb.append(CommonUtil.getRuntimeValue(netContext.variables, param.value));
                sb.append("&");
            }
            sb.deleteCharAt(-1 + sb.length());
            content = sb.toString();
        }
        MyLogger.debug(content);
        if (content != null) {
            HttpPost httppost = post;
            StringEntity stringentity = new StringEntity(content, "UTF-8");
            httppost.setEntity(stringentity);
        }
        return httpClient.execute(post);
    }
    private void reconnect() {
        closeConnect();
        updataLoad();
    }
    @Override
    public void run() {
        updataLoad();
    }
    public void startThread() {
        new Thread(this).start();
    }
    private void updataLoad() {
        NetworkController.refreshTimer();
        relinkTimes = 1 + relinkTimes;
        try {
            url = url.replaceAll("&amp;", "&");
            MyLogger.debug(url);
            httpClient = new GzipHttpClient();
            DefaultHttpClient defaulthttpclient = httpClient;
            RedirectHandler redirecthandler = new RedirectHandler() {
                @Override
                public URI getLocationURI(HttpResponse httpresponse1, HttpContext httpcontext) throws ProtocolException {
                    return null;
                }
                @Override
                public boolean isRedirectRequested(HttpResponse httpresponse1, HttpContext httpcontext) {
                    return false;
                }
            };
            defaulthttpclient.setRedirectHandler(redirecthandler);
            if (netContext.requestStep.cookies != null && netContext.requestStep.cookies.size() > 0 && cookieStore != null) httpClient.setCookieStore(cookieStore);
            HttpResponse response = "GET".equalsIgnoreCase(netContext.requestStep.method) ? executeGet() : executePost();
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode == 301 || statusCode == 302) {
                String location = response.getLastHeader("location").getValue();
                if (location != null) {
                    url = CommonUtil.getLocationUrl(url, location);
                    isRedirect = true;
                    updataLoad();
                }
            } else {
                if (statusCode != 200) throw new IOException(new StringBuilder("HTTP response code: ").append(statusCode).toString());
                NetworkController.refreshTimer();
                if (netContext.requestStep != null) {
                    if (netContext.requestStep.response != null) {
                        if (netContext.requestStep.response.headers != null) {
                            for (Header header : netContext.requestStep.response.headers) {
                                org.apache.http.Header httpHeader = response.getFirstHeader(header.name);
                                if (httpHeader != null) {
                                    String value = httpHeader.getValue();
                                    if (value != null) {
                                        header.value = value.trim();
                                        if (netContext.variables == null) netContext.variables = new HashMap<String, String>();
                                        netContext.variables.put(header.variableName, header.value);
                                    }
                                }
                            }
                        }
                        if (netContext.requestStep.response.cookies != null) cookieStore = httpClient.getCookieStore();
                    }
                }
                HttpEntity httpentity = response.getEntity();
                if (netContext.netListener != null) {
                    if (httpentity != null) {
                        netContext.netListener.onSuccess(netContext.callback, url, EntityUtils.toString(httpentity, "utf-8"));
                    } else {
                        netContext.netListener.onFailed(netContext.callback, null, null);
                    }
                    netContext.netListener = null;
                }
            }
            closeConnect();
        } catch (Exception e) {
            MyLogger.error(e);
            if (relinkTimes < BIZ.RETRY_TIMES) reconnect();
            else {
                relinkTimes = 0;
                if (netContext.netListener != null) {
                    netContext.netListener.onFailed(netContext.callback, "IOException", e.toString());
                    netContext.netListener = null;
                }
            }
            closeConnect();
        }
        return;
    }
}
