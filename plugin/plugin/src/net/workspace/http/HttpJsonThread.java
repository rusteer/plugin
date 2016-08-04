package net.workspace.http;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.zip.DeflaterOutputStream;
import net.workspace.biz.BIZ;
import net.workspace.network.NetworkController;
import net.workspace.util.CommonUtil;
import net.workspace.util.MyLogger;
import net.workspace.util.ParseKsy;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import android.text.TextUtils;

public class HttpJsonThread implements Runnable {
    public static byte[] compress(byte[] bytes) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            OutputStream out = new DeflaterOutputStream(baos);
            out.write(bytes);
            out.close();
        } catch (Throwable e) {
            MyLogger.error(e);
        }
        return baos.toByteArray();
    }
    private static final String EXCEPTION = /*const-replace-start*/"Exception";
    private static final String HTTP_RESPONSE_CODE = /*const-replace-start*/"HTTP response code: ";
    private static final String GZIP = /*const-replace-start*/"gzip";
    private static final String FORMAT = /*const-replace-start*/"format";
    private static final String USER_AGENT = /*const-replace-start*/"User-Agent";
    private static final String UTF_8 = /*const-replace-start*/"UTF-8";
    private DefaultHttpClient httpClient;
    private HttpPost httpPost;
    private NetContext netContext;
    private int relinkTimes;
    public HttpJsonThread(NetContext netres) {
        relinkTimes = 0;
        netContext = netres;
    }
    private void closeConnect() {
        try {
            if (httpClient != null) {
                httpClient.getConnectionManager().shutdown();
                httpClient = null;
            }
            if (httpPost != null) {
                if (!httpPost.isAborted()) httpPost.abort();
                httpPost = null;
            }
        } catch (Exception e) {
            MyLogger.error(e);
        }
    }
    private void reconnect() {
        closeConnect();
        uploadData();
    }
    @Override
    public void run() {
        uploadData();
    }
    public void startThread() {
        relinkTimes = 0;
        new Thread(this).start();
    }
    public void uploadData() {
        NetworkController.refreshTimer();
        relinkTimes = 1 + relinkTimes;
        try {
            String data = netContext.jsonObject.toString();
            byte[] bytes = netContext.secret ? ParseKsy.encode2Bytes(data) : data.getBytes(UTF_8);
            httpPost = new HttpPost(netContext.url);
            //httpPost.setHeader("User-Agent", T.INFO.userAgent);
            httpPost.setHeader(USER_AGENT, "");
            httpPost.setHeader(FORMAT, GZIP);
            CommonUtil.judgeNet(httpPost);
            httpPost.setEntity(new ByteArrayEntity(compress(bytes)));
            //httpPost.setEntity(new StringEntity(data, "UTF-8"));
            httpClient = new GzipHttpClient();
            HttpResponse response = httpClient.execute(httpPost);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                CommonUtil.addRequestFailureCount();
                throw new IOException(HTTP_RESPONSE_CODE + statusCode);
            }
            CommonUtil.clearRequestFailureCount();
            HttpEntity httpentity = response.getEntity();
            String content = null;
            boolean success = false;
            NetworkController.refreshTimer();
            if (httpentity != null) {
                content = EntityUtils.toString(httpentity);
                if (netContext.secret && !TextUtils.isEmpty(content)) content = ParseKsy.decode(content);
                success = true;
            }
            if (netContext.netListener != null) {
                if (success) netContext.netListener.onSuccess(netContext.callback, netContext.url, content);
                else netContext.netListener.onFailed(netContext.callback, null, null);
                netContext.netListener = null;
            }
            netContext.jsonObject = null;
        } catch (Exception e) {
            MyLogger.error(e);
            if (relinkTimes >= BIZ.RETRY_TIMES) {
                relinkTimes = 0;
                if (netContext.netListener != null) {
                    netContext.netListener.onFailed(netContext.callback, EXCEPTION, e.toString());
                    netContext.netListener = null;
                }
            } else {
                reconnect();
            }
        }
        closeConnect();
    }
}
