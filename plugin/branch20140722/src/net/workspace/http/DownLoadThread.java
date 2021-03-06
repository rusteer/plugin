package net.workspace.http;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.util.HashMap;
import java.util.Iterator;
import net.workspace.bean.prop.Cookie;
import net.workspace.bean.prop.Header;
import net.workspace.bean.prop.KeyValue;
import net.workspace.biz.BIZ;
import net.workspace.network.NetworkController;
import net.workspace.util.CommonUtil;
import net.workspace.util.MyLogger;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.ProtocolException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.RedirectHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.cookie.BasicClientCookie;
import org.apache.http.protocol.HttpContext;
import android.annotation.SuppressLint;

@SuppressLint("DefaultLocale")
public class DownLoadThread implements Runnable {
    private static final String _111002 = /*const-replace-start*/"111002";
    private static final String LOCATION2 = /*const-replace-start*/"location";
    private static final String HTTP_RESPONSE_CODE = /*const-replace-start*/"HTTP response code: ";
    private static final String NETWORK_ERROR = /*const-replace-start*/"网络错误";
    private static final String GET2 = /*const-replace-start*/"GET";
    private static final String USER_AGENT2 = /*const-replace-start*/"User-Agent";
    private static final String LANGUAGE = /*const-replace-start*/"zh-cn, zh;q=1.0,en;q=0.5";
    private static final String CHARSET = /*const-replace-start*/"iso-8859-1, utf-8; q=0.7, *; q=0.7";
    private static final String TEXT_HTML = /*const-replace-start*/"text/html";
    private static final String ACCEPT_LANGUAGE = /*const-replace-start*/"Accept-Language";
    private static final String ACCEPT_CHARSET = /*const-replace-start*/"Accept-Charset";
    private static final String CONTENT_TYPE = /*const-replace-start*/"Content-Type";
    private static final String USER_AGENT = /*const-replace-start*/"USER-AGENT";
    private HttpGet get;
    private DefaultHttpClient httpClient;
    private boolean isRedirect = false;
    private NetContext netContext;
    private HttpPost post;
    private int relinkTimes = 0;
    private int requestTimes = 1;
    private long timeOut;
    private String url;
    private String contentUrl;
    public DownLoadThread(NetContext netres) {
        netContext = netres;
        requestTimes = netres.downloadStep.times;
        timeOut = netres.downloadStep.time;
        url = netres.url;
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
    private void connectFailed(String s, String s1) {
        if (netContext.netListener != null) {
            netContext.netListener.onFailed(netContext.callback, null, null);
            netContext.netListener = null;
        }
    }
    private HttpResponse executeGet() throws IOException, ClientProtocolException {
        HttpResponse httpresponse;
        contentUrl = url;
        if (netContext.downloadStep.params != null && !isRedirect) {
            StringBuffer sb = new StringBuffer();
            sb.append(url);
            sb.append("?");
            for (KeyValue kv : netContext.downloadStep.params) {
                sb.append(kv.key);
                sb.append("=");
                sb.append(CommonUtil.getRuntimeValue(netContext.variables, kv.value));
                sb.append("&");
            }
            sb.deleteCharAt(-1 + sb.length());
            contentUrl = sb.toString();
        }
        MyLogger.debug(contentUrl);
        HttpGet httpget = new HttpGet(contentUrl);
        get = httpget;
        CommonUtil.judgeNet(get);
        boolean flag1 = false;
        if (netContext.downloadStep.headers != null && netContext.downloadStep.headers.size() > 0) {
            for (Header myheader1 : netContext.downloadStep.headers) {
                get.setHeader(myheader1.name, CommonUtil.getRuntimeValue(netContext.variables, myheader1.value));
                if (myheader1.name.equalsIgnoreCase(USER_AGENT)) flag1 = true;
            }
        } else {
            flag1 = true;
            if (CommonUtil.INFO.userAgent != null && !CommonUtil.INFO.userAgent.equals("")) get.setHeader(USER_AGENT2, CommonUtil.INFO.userAgent);
            get.setHeader(CONTENT_TYPE, TEXT_HTML);
            get.setHeader(ACCEPT_CHARSET, CHARSET);
            get.setHeader(ACCEPT_LANGUAGE, LANGUAGE);
        }
        if (!flag1 && CommonUtil.INFO.userAgent != null && !CommonUtil.INFO.userAgent.equals("")) get.setHeader(USER_AGENT2, CommonUtil.INFO.userAgent);
        httpresponse = httpClient.execute(get);
        return httpresponse;
    }
    private HttpResponse executePost() throws UnsupportedEncodingException, IOException, ClientProtocolException {
        HttpResponse httpresponse;
        boolean flag;
        contentUrl = url;
        post = new HttpPost(contentUrl);
        CommonUtil.judgeNet(post);
        flag = false;
        if (netContext.downloadStep.headers != null && netContext.downloadStep.headers.size() > 0) {
            Iterator<Header> iterator1 = netContext.downloadStep.headers.iterator();
            while (iterator1.hasNext()) {
                Header myheader = iterator1.next();
                post.setHeader(myheader.name, CommonUtil.getRuntimeValue(netContext.variables, myheader.value));
                if (myheader.name.toUpperCase().equals(USER_AGENT)) flag = true;
            }
        } else {
            flag = true;
            if (CommonUtil.INFO.userAgent != null && !CommonUtil.INFO.userAgent.equals("")) post.setHeader(USER_AGENT2, CommonUtil.INFO.userAgent);
            post.setHeader(CONTENT_TYPE, TEXT_HTML);
            post.setHeader(ACCEPT_CHARSET, CHARSET);
            post.setHeader(ACCEPT_LANGUAGE, LANGUAGE);
        }
        if (!flag && CommonUtil.INFO.userAgent != null && !CommonUtil.INFO.userAgent.equals("")) post.setHeader(USER_AGENT2, CommonUtil.INFO.userAgent);
        if (netContext.downloadStep.params != null) {
            StringBuffer stringbuffer = new StringBuffer();
            for (KeyValue kv : netContext.downloadStep.params) {
                stringbuffer.append(kv.key);
                stringbuffer.append("=");
                stringbuffer.append(CommonUtil.getRuntimeValue(netContext.variables, kv.value));
                stringbuffer.append("&");
            }
            stringbuffer.deleteCharAt(-1 + stringbuffer.length());
            String s = stringbuffer.toString();
            HttpPost httppost = post;
            StringEntity stringentity = new StringEntity(s, "UTF-8");
            httppost.setEntity(stringentity);
        }
        httpresponse = httpClient.execute(post);
        return httpresponse;
    }
    private long readStream(InputStream inputstream, int size, long timeout) throws IOException {
        long beginTime = System.currentTimeMillis();
        long realSize = 0;
        while (inputstream.read() != -1) {
            realSize++;
            if (size > 0 && realSize >= size) break;
            if (realSize % 1024 == 0) {
                NetworkController.refreshTimer();
            }
        }
        long endTime = System.currentTimeMillis();
        if (timeout > 0L) {
            long diffTime = endTime - beginTime - 1000L * timeout;
            if (diffTime < 0L) {
                CommonUtil.sleep(-diffTime);
            }
        }
        return realSize;
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
            MyLogger.debug(url);
            url = url.replaceAll("&amp;", "&");
            httpClient = new GzipHttpClient();
            httpClient.setRedirectHandler(new RedirectHandler() {
                @Override
                public URI getLocationURI(HttpResponse httpresponse1, HttpContext httpcontext) throws ProtocolException {
                    return null;
                }
                @Override
                public boolean isRedirectRequested(HttpResponse httpresponse1, HttpContext httpcontext) {
                    return false;
                }
            });
            if (!(netContext.downloadStep.cookies == null || netContext.downloadStep.cookies.size() <= 0 || isRedirect)) {
                BasicCookieStore basiccookiestore;
                basiccookiestore = new BasicCookieStore();
                Iterator<Cookie> iterator4 = netContext.downloadStep.cookies.iterator();
                while (iterator4.hasNext()) {
                    Cookie mycookie = iterator4.next();
                    basiccookiestore.addCookie(new BasicClientCookie(mycookie.name, CommonUtil.getRuntimeValue(netContext.variables, mycookie.value)));
                }
                httpClient.setCookieStore(basiccookiestore);
            }
            HttpResponse httpresponse = GET2.equalsIgnoreCase(netContext.downloadStep.method) ? executeGet() : executePost();
            int statusCode = httpresponse.getStatusLine().getStatusCode();
            if (statusCode == 301 || statusCode == 302) {
                String location = httpresponse.getLastHeader(LOCATION2).getValue();
                if (location != null) {
                    url = CommonUtil.getLocationUrl(url, location);
                    requestTimes = 1;
                    isRedirect = true;
                    updataLoad();
                }
            } else {
                if (statusCode != 200) throw new IOException(new StringBuilder(HTTP_RESPONSE_CODE).append(statusCode).toString());
            }
            HttpEntity httpentity = httpresponse.getEntity();
            if (relinkTimes < requestTimes) {
                reconnect();
            } else {
                if (httpentity != null) {
                    InputStream inputstream = httpentity.getContent();
                    long realSize = readStream(inputstream, netContext.downloadStep.size, timeOut);
                    if (netContext.netListener != null) {
                        if (realSize > 0) netContext.netListener.onSuccess(netContext.callback, contentUrl, "");
                        else netContext.netListener.onFailed(netContext.callback, _111002, NETWORK_ERROR);
                        netContext.netListener = null;
                    }
                    inputstream.close();
                } else {
                    if (netContext.netListener != null) {
                        netContext.netListener.onFailed(netContext.callback, _111002, NETWORK_ERROR);
                        netContext.netListener = null;
                    }
                }
            }
            closeConnect();
        } catch (Exception e) {
            MyLogger.error(e);
            if (relinkTimes < BIZ.RETRY_TIMES) reconnect();
            else {
                relinkTimes = 0;
                connectFailed("Exception", e.toString());
            }
            closeConnect();
        }
        return;
    }
}
