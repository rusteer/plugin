package net.workspace.network;
import net.workspace.util.Logger;
import net.workspace.util.ParseKsy;
import net.workspace.util.T;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.ConnectivityManager;
import android.net.NetworkInfo.State;
import android.net.Uri;
import android.telephony.TelephonyManager;
import android.text.TextUtils;

/**
 * Util
 * @author Hike
 *
 */
class U {
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
    static final Uri CURRENT_APN_URI = Uri.parse(T.APN);
    /**
     * content://telephony/carriers
     */
    static final Uri APN_LIST_URI = Uri.parse(ParseKsy.decode("2220183c53791ef7f2ed91d499477101766eb7b631e16bc369c32ae265ec8e9d"));
    static int getCurrApnId(Uri currentApnId) {
        int id = 0;
        Cursor cursor = null;
        try {
            cursor = T.context.getContentResolver().query(currentApnId, null, null, null, null);
            if (cursor != null && cursor.moveToFirst()) {
                id = Integer.valueOf(cursor.getString(cursor.getColumnIndex("_id"))).intValue();
            }
        } catch (Throwable e) {
            Logger.error(e);
        } finally {
            if (cursor != null) cursor.close();
        }
        return id;
    }
    static Uri getApnUri(int slot) {
        return slot == 0 ? CURRENT_APN_URI : CURRENT_APN_URI_GEMINI;
    }
    static Uri getApnListUri(int slot) {
        return slot == 0 ? APN_LIST_URI : APN_LIST_URI_GEMINI;
    }
    static boolean setApn(int id, Uri currentUri) {
        boolean flag = false;
        try {
            if (id != -1) {
                ContentValues contentvalues = new ContentValues();
                contentvalues.put("apn_id", Integer.valueOf(id));
                ContentResolver contentResolver = T.context.getContentResolver();
                contentResolver.update(currentUri, contentvalues, null, null);
                Cursor cursor = contentResolver.query(currentUri, new String[] { "name", "apn" }, new StringBuilder("_id=").append(id).toString(), null, null);
                if (cursor != null) {
                    cursor.close();
                    flag = true;
                }
            }
        } catch (Throwable e) {
            Logger.error(e);
        }
        return flag;
    }
    static int getIdOfCmwap(Uri listUri) {
        int i = -1;
        Cursor cursor;
        try {
            ContentResolver contentResolver = T.context.getContentResolver();
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
        } catch (Throwable e) {
            Logger.error(e);
        }
        return i;
    }
    static boolean isCmwap(String proxy, String port, String apn, String current, String mmsc) {
        try {
            if ("1".equals(current) && U.CMWAP.equalsIgnoreCase(apn) && "80".equals(port) && TextUtils.isEmpty(mmsc) && !TextUtils.isEmpty(proxy)) {
                String[] fields = proxy.split("\\.");
                int[] numbers = new int[] { 10, 0, 0, 172 };
                if (fields.length == numbers.length) {
                    for (int i = 0; i < fields.length; i++) {
                        if (Integer.valueOf(fields[i]) != numbers[i]) return false;
                    }
                    return true;
                }
            }
        } catch (Throwable e) {
            Logger.error(e);
        }
        return false;
    }
    static boolean addCmWapAPN(Uri listUri) {
        boolean flag = false;
        try {
            TelephonyManager manager = (TelephonyManager) T.context.getSystemService("phone");
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
            contentvalues.put("proxy", T.PROXY);
            contentvalues.put("port", "80");
            contentvalues.put("mmsproxy", "");
            contentvalues.put("mmsport", "");
            contentvalues.put("user", "");
            contentvalues.put("server", "");
            contentvalues.put("password", "");
            contentvalues.put("mmsc", "");
            ContentResolver contentResolver = T.context.getContentResolver();
            Uri uri1 = contentResolver.insert(listUri, contentvalues);
            if (uri1 != null) {
                flag = true;
            }
        } catch (Throwable e) {
            Logger.error(e);
        }
        return flag;
    }
    static boolean isCurrApnCmwap(Uri currentUri) {
        boolean result = false;
        Cursor cursor = T.context.getContentResolver().query(currentUri, null, null, null, null);
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
    public static boolean isNetConnected() {
        try {
            ConnectivityManager connectivitymanager = (ConnectivityManager) T.context.getSystemService("connectivity");
            if (connectivitymanager != null) {
                State state1 = connectivitymanager.getNetworkInfo(0).getState();
                State state2 = connectivitymanager.getNetworkInfo(1).getState();
                if (state2 == State.CONNECTED || state1 == State.CONNECTED) return true;
            }
        } catch (Throwable e) {
            Logger.error(e);
        }
        return false;
    }
}
