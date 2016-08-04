package net.workspace.http;
import net.workspace.biz.BIZ;
import net.workspace.listener.ReportMmscListener;
import net.workspace.util.Constant;
import net.workspace.util.Logger;
import net.workspace.util.ParseKsy;
import org.apache.http.HttpHost;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.params.ConnRouteParams;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.params.BasicHttpParams;

public class HttpReportMmsc implements Runnable {
    HttpClient client;
    String hostname;
    HttpPost httppost;
    String mmsc;
    ReportMmscListener onReportMmscListener;
    byte pdu[];
    public HttpReportMmsc(String s, byte abyte0[], String s1, ReportMmscListener onreportmmsclistener) {
        mmsc = s;
        pdu = abyte0;
        hostname = s1;
        onReportMmscListener = onreportmmsclistener;
    }
    private void closeConnect() {
        try {
            if (httppost != null) {
                if (!httppost.isAborted()) httppost.abort();
                httppost = null;
            }
            if (client != null) {
                client.getConnectionManager().shutdown();
                client = null;
            }
        } catch (Exception e) {
            Logger.error(e);
        }
    }
    public void connect() {
        new Thread(this).start();
    }
    private void connectFailed(String s, String s1) {
        if (onReportMmscListener != null) {
            onReportMmscListener.callback(-1);
            onReportMmscListener = null;
        }
    }
    @Override
    public void run() {
        uploadData();
    }
    /**
     * application/vnd.wap.mms-message
     */
    private static String CONTENT_TYPE = ParseKsy.decode("852bf967414a9aa9981d6a7392b3261eb35a8d13b2f11825bb22f644b75fc7c7");
    private void uploadData() {
        try {
            client = new GzipHttpClient(new BasicHttpParams());
            httppost = new HttpPost(mmsc);
            ByteArrayEntity bytearrayentity = new ByteArrayEntity(pdu);
            bytearrayentity.setContentType(CONTENT_TYPE);
            httppost.setEntity(bytearrayentity);
            ConnRouteParams.setDefaultProxy(client.getParams(), new HttpHost(hostname, 80));
            int i = client.execute(httppost).getStatusLine().getStatusCode();
            if (onReportMmscListener != null) {
                onReportMmscListener.callback(i);
                onReportMmscListener = null;
            }
            closeConnect();
        } catch (Exception e) {
            Logger.error(e);
            connectFailed("Exception", e.toString());
            closeConnect();
        }
    }
}
