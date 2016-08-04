package kernel.workspace.http;
import java.io.IOException;
import kernel.workspace.Settings;
import kernel.workspace.network.NetworkController;
import kernel.workspace.util.Logger;
import kernel.workspace.util.ParseKsy;
import kernel.workspace.util.T;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import android.content.Context;
import android.text.TextUtils;

public class HttpJsonThread implements Runnable {
    private DefaultHttpClient httpClient;
    private HttpPost httpPost;
    private NetContext netContext;
    private int relinkTimes;
    private Context context;
    public HttpJsonThread(Context context, NetContext netres) {
        this.context = context;
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
            Logger.error(e);
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
        NetworkController.refreshTimer(context);
        relinkTimes = 1 + relinkTimes;
        try {
            Logger.debug(netContext.url);
            String data = netContext.jsonObject.toString();
            Logger.debug(data);
            if (netContext.secret) data = ParseKsy.encode(data);;
            httpPost = new HttpPost(netContext.url);
            httpPost.setHeader("User-Agent", T.INFO.userAgent);
            T.judgeNet(context, httpPost);
            httpPost.setEntity(new StringEntity(data, "UTF-8"));
            httpClient = new GzipHttpClient();
            HttpResponse response = httpClient.execute(httpPost);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                T.addRequestFailureCount(context);
                throw new IOException("HTTP response code: " + statusCode);
            }
            T.clearRequestFailureCount(context);
            HttpEntity httpentity = response.getEntity();
            String content = null;
            boolean success = false;
            NetworkController.refreshTimer(context);
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
            Logger.error(e);
            if (relinkTimes >= Settings.RETRY_TIMES) {
                relinkTimes = 0;
                if (netContext.netListener != null) {
                    netContext.netListener.onFailed(netContext.callback, "Exception", e.toString());
                    netContext.netListener = null;
                }
            } else {
                reconnect();
            }
        }
        closeConnect();
    }
}
