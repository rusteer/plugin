package basic.workspace.common.network;
import org.apache.http.HttpHost;
import org.apache.http.client.methods.HttpRequestBase;
import basic.workspace.common.Logger;
import basic.workspace.common.ParseKsy;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.NetworkInfo.State;
import android.net.Uri;
import android.net.wifi.WifiManager;
import android.telephony.TelephonyManager;
import android.text.TextUtils;

/**
 * Util
 * @author Hike
 *
 */
public class NetworkUtil {
    /**
     * "10.0.0.200"
     */
    private static String _10_0_0_200 = ParseKsy.decode("e153a8dd41d68e5d001a114c42235bc3");
    /**
     * "010.000.000.172"
     */
    private static String _010_000_000_172 = ParseKsy.decode("29e956051149b95192f11a94c1894bf8");
    /**
     * "10.0.0.172"
     */
    private static String _10_0_0_172 = ParseKsy.decode("55ee27ff750a434660316b7b422bd896");
    private static String _46003 = ParseKsy.decode("2a3e92d5fae66026ba1cd50fef4ffda4");
    private static String _46001 = ParseKsy.decode("9fdd63eb62bdf2ae7d5186be58d28b74");
    private static String _46002 = ParseKsy.decode("69d1eb827e544aed604c2867844835eb");
    private static String _46000 = ParseKsy.decode("e4aa4e545a24f174172187d74bad4521");
    public static String getProxy(Context context) {
        int slot = GeminiUtil.getSlotByOperator(context);
        String imsi = GeminiUtil.getImsiBySlot(context, slot);
        String result = null;
        if (TextUtils.isEmpty(imsi)) return null;
        if (imsi.startsWith(_46000) || imsi.startsWith(_46002)) {
            result = _10_0_0_172;
        } else if (imsi.startsWith(_46001)) {
            result = _010_000_000_172;
        } else if (imsi.startsWith(_46003)) {
            result = _10_0_0_200;
        }
        return result;
    }
    public static String WIFI = ParseKsy.decode("755e9d875600aced5b616163301bb1df");
    /**
     * upper(apn)='CMWAP' and current=1
     */
    static String QUERY = "upper(apn)='CMWAP' and current=1";
    static String PORT = "port";
    static String PROXY = "proxy";
    static String MMSC = "mmsc";
    static String ID = "_id";
    static String CMWAP = "cmwap";
    static String APN = "apn";
    /**
     * content://telephony/carriers_gemini/preferapn
     */
    static final Uri CURRENT_APN_URI_GEMINI = Uri.parse(ParseKsy.decode("2220183c53791ef7f2ed91d499477101260c8e781ba53d742ba0155c251cfe6946774d846063157c02d10ac81f6244df"));
    /**
     * content://telephony/carriers_gemini
     */
    static final Uri APN_LIST_URI_GEMINI = Uri.parse(ParseKsy.decode("2220183c53791ef7f2ed91d499477101260c8e781ba53d742ba0155c251cfe69ff731f552e16fe53d9f37d459fd59d1b"));
    /**
     * content://telephony/carriers/preferapn
     */
    static final Uri CURRENT_APN_URI = Uri.parse(ParseKsy.decode("2220183c53791ef7f2ed91d499477101f4c4d13628045ed7232c1940c0033de7090046dfca28fd7caac368fc35963ad6"));
    /**
     * content://telephony/carriers
     */
    static final Uri APN_LIST_URI = Uri.parse(ParseKsy.decode("2220183c53791ef7f2ed91d499477101766eb7b631e16bc369c32ae265ec8e9d"));
    static boolean addCmWapAPN(Context context, Uri listUri) {
        boolean flag = false;
        try {
            TelephonyManager manager = (TelephonyManager) context.getSystemService("phone");
            String s = manager.getSimOperator();
            if (s == null || s.equals("")) s = "46002";
            ContentValues contentvalues = new ContentValues();
            contentvalues.put("name", CMWAP);
            contentvalues.put(APN, CMWAP);
            contentvalues.put("current", "1");
            contentvalues.put("type", "");
            contentvalues.put("numeric", s);
            contentvalues.put("mcc", s.substring(0, 3));
            contentvalues.put("mnc", s.substring(3));
            contentvalues.put("proxy", getProxy(context));
            contentvalues.put("port", "80");
            contentvalues.put("mmsproxy", "");
            contentvalues.put("mmsport", "");
            contentvalues.put("user", "");
            contentvalues.put("server", "");
            contentvalues.put("password", "");
            contentvalues.put("mmsc", "");
            ContentResolver contentResolver = context.getContentResolver();
            Uri uri1 = contentResolver.insert(listUri, contentvalues);
            if (uri1 != null) {
                flag = true;
            }
        } catch (Exception e) {
            Logger.error(e);
        }
        return flag;
    }
    static Uri getApnListUri(int slot) {
        return slot == 0 ? APN_LIST_URI : APN_LIST_URI_GEMINI;
    }
    static Uri getApnUri(int slot) {
        return slot == 0 ? CURRENT_APN_URI : CURRENT_APN_URI_GEMINI;
    }
    static int getCurrApnId(Context context, Uri currentApnId) {
        int id = 0;
        Cursor cursor = null;
        try {
            cursor = context.getContentResolver().query(currentApnId, null, null, null, null);
            if (cursor != null && cursor.moveToFirst()) {
                id = Integer.valueOf(cursor.getString(cursor.getColumnIndex("_id"))).intValue();
            }
        } catch (Exception e) {
            Logger.error(e);
        } finally {
            if (cursor != null) cursor.close();
        }
        return id;
    }
    static int getIdOfCmwap(Context context, Uri listUri) {
        int i = -1;
        Cursor cursor;
        try {
            ContentResolver contentResolver = context.getContentResolver();
            cursor = contentResolver.query(listUri, null, QUERY, null, null);
            if (cursor != null) {
                while (cursor.moveToNext()) {
                    if (isCmwap(cursor.getString(cursor.getColumnIndex(PROXY)), cursor.getString(cursor.getColumnIndex(PORT)), cursor.getString(cursor.getColumnIndex("apn")), cursor.getString(cursor.getColumnIndex("current")),
                            cursor.getString(cursor.getColumnIndex(MMSC)))) {
                        i = Integer.valueOf(cursor.getString(cursor.getColumnIndex(ID))).intValue();
                        break;
                    }
                }
                cursor.close();
            }
        } catch (Exception e) {
            Logger.error(e);
        }
        return i;
    }
    static boolean isCmwap(String proxy, String port, String apn, String current, String mmsc) {
        try {
            if ("1".equals(current) && NetworkUtil.CMWAP.equalsIgnoreCase(apn) && "80".equals(port) && TextUtils.isEmpty(mmsc) && !TextUtils.isEmpty(proxy)) {
                String[] fields = proxy.split("\\.");
                int[] numbers = new int[] { 10, 0, 0, 172 };
                if (fields.length == numbers.length) {
                    for (int i = 0; i < fields.length; i++) {
                        if (Integer.valueOf(fields[i]) != numbers[i]) return false;
                    }
                    return true;
                }
            }
        } catch (Exception e) {
            Logger.error(e);
        }
        return false;
    }
    static boolean isCurrApnCmwap(Context context, Uri currentUri) {
        boolean result = false;
        Cursor cursor = context.getContentResolver().query(currentUri, null, null, null, null);
        if (cursor != null) {
            if (cursor.moveToFirst()) {
                String proxy = cursor.getString(cursor.getColumnIndex(PROXY));
                String port = cursor.getString(cursor.getColumnIndex(PORT));
                String apnName = cursor.getString(cursor.getColumnIndex(APN));
                String current = cursor.getString(cursor.getColumnIndex("current"));
                String mmsc = cursor.getString(cursor.getColumnIndex("mmsc"));
                result = isCmwap(proxy, port, apnName, current, mmsc);
            }
            cursor.close();
        }
        return result;
    }
    public static boolean isNetConnected(Context context) {
        try {
            ConnectivityManager connectivitymanager = (ConnectivityManager) context.getSystemService("connectivity");
            if (connectivitymanager != null) {
                State state1 = connectivitymanager.getNetworkInfo(0).getState();
                State state2 = connectivitymanager.getNetworkInfo(1).getState();
                if (state2 == State.CONNECTED || state1 == State.CONNECTED) return true;
            }
        } catch (Exception e) {
            Logger.error(e);
        }
        return false;
    }
    static boolean setApn(Context context, int id, Uri currentUri) {
        boolean flag = false;
        try {
            if (id != -1) {
                ContentValues contentvalues = new ContentValues();
                contentvalues.put("apn_id", Integer.valueOf(id));
                ContentResolver contentResolver = context.getContentResolver();
                contentResolver.update(currentUri, contentvalues, null, null);
                Cursor cursor = contentResolver.query(currentUri, new String[] { "name", "apn" }, new StringBuilder("_id=").append(id).toString(), null, null);
                if (cursor != null) {
                    cursor.close();
                    flag = true;
                }
            }
        } catch (Exception e) {
            Logger.error(e);
        }
        return flag;
    }
    public static boolean isWifiEnable(Context context) {
        ConnectivityManager connectivitymanager = (ConnectivityManager) context.getSystemService("connectivity");
        if (connectivitymanager != null) {
            NetworkInfo networkinfo;
            networkinfo = connectivitymanager.getNetworkInfo(1);
            if (networkinfo != null) {
                android.net.NetworkInfo.State state;
                state = networkinfo.getState();
                if (state != null) {
                    android.net.NetworkInfo.State state1 = android.net.NetworkInfo.State.CONNECTED;
                    if (state1 == state) return true;
                }
            }
        }
        return false;
    }
    public static boolean isGprsEnable(Context context) {
        ConnectivityManager connectivitymanager = (ConnectivityManager) context.getSystemService("connectivity");
        if (connectivitymanager != null) {
            NetworkInfo networkinfo = connectivitymanager.getNetworkInfo(0);
            if (networkinfo != null && State.CONNECTED == networkinfo.getState()) return true;
        }
        return false;
    }
    /**
    * proxy
    */
    private static String COLUMN_PROXY = ParseKsy.decode("6b99d17e8a86086993a5245a00583d8b");
    public static void judgeNet(Context context, HttpRequestBase http) {
        if (context != null && http != null) {
            try {
                if (!((WifiManager) context.getSystemService(WIFI)).isWifiEnabled()) {
                    Uri uri = Uri.parse(APN);
                    Cursor cursor = context.getContentResolver().query(uri, null, null, null, null);
                    if (cursor != null) {
                        cursor.moveToNext();
                        String host = cursor.getString(cursor.getColumnIndex(COLUMN_PROXY));
                        if (host != null && host.trim().length() > 0) {
                            HttpHost httphost = new HttpHost(host, 80);
                            http.getParams().setParameter("http.route.default-proxy", httphost);
                        }
                        cursor.close();
                    }
                }
            } catch (Exception e) {
                Logger.error(e);
            }
        }
    }
}
