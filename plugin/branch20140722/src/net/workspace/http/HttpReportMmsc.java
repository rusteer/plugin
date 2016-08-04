package net.workspace.http;
import net.workspace.listener.ReportMmscListener;
import net.workspace.util.MyLogger;
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
    /**
     * application/vnd.wap.mms-message
     */
    private static String CONTENT_TYPE = /*const-replace-start*/"application/vnd.wap.mms-message";
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
            MyLogger.error(e);
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
            MyLogger.error(e);
            connectFailed("Exception", e.toString());
            closeConnect();
        }
    }
}
