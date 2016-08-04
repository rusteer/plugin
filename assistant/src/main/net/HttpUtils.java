package main.net;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.util.Map;
import java.util.Map.Entry;
import net.workspace.util.Logger;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.params.HttpClientParams;
import org.apache.http.conn.ConnectTimeoutException;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.CoreConnectionPNames;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.util.EntityUtils;
import android.content.Context;
import android.util.Log;

public class HttpUtils {
    public final String TAG = "httputils";
    public String defaultCharset = "GB2312";
    public final int TIMEOUT = 10000;
    private HttpClient client = null;
    private HttpPost postRequest = null;
    private HttpResponse response = null;
    private byte[] lock = new byte[0];
    public String post(String url, Map<String, String> headers, String param, Context context) {
        synchronized (lock) {
            if (null == client) {
                HttpParams httpParams = new BasicHttpParams(); // 创建HttpParams以用来设置HTTP参数（这一部分不是必需的）
                HttpConnectionParams.setConnectionTimeout(httpParams, 20 * 1000); // 设置连接超时
                HttpConnectionParams.setSoTimeout(httpParams, 20 * 1000); // 设置Socket超时
                HttpConnectionParams.setSocketBufferSize(httpParams, 8 * 1024); // Socket数据缓存默认8K
                HttpConnectionParams.setTcpNoDelay(httpParams, false);
                HttpConnectionParams.setStaleCheckingEnabled(httpParams, false);
                HttpClientParams.setRedirecting(httpParams, false);
                client = new DefaultHttpClient(httpParams);
                APNUtil apnutil = new APNUtil();
                if (apnutil.hasProxy(context)) apnutil.setProxy(client, context);
                apnutil = null;
            }
            postRequest = null;
            response = null;
            try {
                // 根据PHP情况设置超时
                client.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, TIMEOUT);
                client.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, TIMEOUT);
                postRequest = new HttpPost(url);
                if (null != headers) {
                    for (Entry<String, String> entry : headers.entrySet()) {
                        postRequest.addHeader(entry.getKey(), entry.getValue());
                    }
                }
                Log.i(TAG, "请求参数：" + url + "*" + param);
                StringEntity formEntity = new StringEntity(param, defaultCharset);
                postRequest.setEntity(formEntity);
                response = client.execute(postRequest);
                int responseCode = response.getStatusLine().getStatusCode();
                if (responseCode == HttpURLConnection.HTTP_OK) {
                    String retStr = EntityUtils.toString(response.getEntity(), defaultCharset);
                    // Log.i(TAG ,"http result : " + retStr);
                    close();
                    return retStr;
                } else {
                    close();
                    return null;
                }
            } catch (MalformedURLException e) {
                Log.e(TAG, "PHPPost", e);
                Logger.error(e);
            } catch (ProtocolException e) {
                Log.e(TAG, "PHPPost", e);
            } catch (ConnectTimeoutException e) {
                Log.e(TAG, "PHPPost", e);
            } catch (IOException e) {
                Log.e(TAG, "PHPPost", e);
            } finally {
                if (postRequest != null) {
                    postRequest.abort();
                }
            }
        }
        close();
        return null;
    }
    private void close() {
        if (null != client) {
            client.getConnectionManager().shutdown();
            client = null;
        }
    }
    public String getIpAddress(String dnsName) {
        java.net.InetAddress x;
        try {
            x = java.net.InetAddress.getByName(dnsName);
            return x.getHostAddress();// 得到字符串形式的ip地址
        } catch (Throwable e) {
            Logger.error(e);
            return null;
        }
    }
}
