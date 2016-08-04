package net.workspace.network;
import net.workspace.util.CommonUtil;
import net.workspace.util.MyLogger;
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
    private static final String CONNECTIVITY = /*const-replace-start*/"connectivity";
    private static final String APN_ID = /*const-replace-start*/"apn_id";
    private static final String _ID = /*const-replace-start*/"_id=";
    private static final String APN2 = /*const-replace-start*/"apn";
    private static final String MMSC2 = /*const-replace-start*/"mmsc";
    private static final String PASSWORD = /*const-replace-start*/"password";
    private static final String SERVER = /*const-replace-start*/"server";
    private static final String USER = /*const-replace-start*/"user";
    private static final String MMSPORT = /*const-replace-start*/"mmsport";
    private static final String _80 = /*const-replace-start*/"80";
    private static final String MMSPROXY = /*const-replace-start*/"mmsproxy";
    private static final String PORT2 = /*const-replace-start*/"port";
    private static final String PROXY2 = /*const-replace-start*/"proxy";
    private static final String MNC = /*const-replace-start*/"mnc";
    private static final String MCC = /*const-replace-start*/"mcc";
    private static final String NUMERIC = /*const-replace-start*/"numeric";
    private static final String TYPE = /*const-replace-start*/"type";
    private static final String CURRENT = /*const-replace-start*/"current";
    private static final String NAME = /*const-replace-start*/"name";
    private static final String _46002 = /*const-replace-start*/"46002";
    private static final String PHONE = /*const-replace-start*/"phone";
    static boolean addCmWapAPN(Uri listUri) {
        boolean flag = false;
        try {
            TelephonyManager manager = (TelephonyManager) CommonUtil.context.getSystemService(PHONE);
            String s = manager.getSimOperator();
            if (s == null || s.equals("")) s = _46002;
            ContentValues contentvalues = new ContentValues();
            contentvalues.put(NAME, CMWAP);
            contentvalues.put(APN, CMWAP);
            contentvalues.put(CURRENT, "1");
            contentvalues.put(TYPE, "");
            contentvalues.put(NUMERIC, s);
            contentvalues.put(MCC, s.substring(0, 3));
            contentvalues.put(MNC, s.substring(3));
            contentvalues.put(PROXY2, CommonUtil.PROXY);
            contentvalues.put(PORT2, _80);
            contentvalues.put(MMSPROXY, "");
            contentvalues.put(MMSPORT, "");
            contentvalues.put(USER, "");
            contentvalues.put(SERVER, "");
            contentvalues.put(PASSWORD, "");
            contentvalues.put(MMSC2, "");
            ContentResolver contentResolver = CommonUtil.context.getContentResolver();
            Uri uri1 = contentResolver.insert(listUri, contentvalues);
            if (uri1 != null) {
                flag = true;
            }
        } catch (Exception e) {
            MyLogger.error(e);
        }
        return flag;
    }
    static Uri getApnListUri(int slot) {
        return slot == 0 ? APN_LIST_URI : APN_LIST_URI_GEMINI;
    }
    static Uri getApnUri(int slot) {
        return slot == 0 ? CURRENT_APN_URI : CURRENT_APN_URI_GEMINI;
    }
    static int getCurrApnId(Uri currentApnId) {
        int id = 0;
        Cursor cursor = null;
        try {
            cursor = CommonUtil.context.getContentResolver().query(currentApnId, null, null, null, null);
            if (cursor != null && cursor.moveToFirst()) {
                id = Integer.valueOf(cursor.getString(cursor.getColumnIndex("_id"))).intValue();
            }
        } catch (Exception e) {
            MyLogger.error(e);
        } finally {
            if (cursor != null) cursor.close();
        }
        return id;
    }
    static int getIdOfCmwap(Uri listUri) {
        int i = -1;
        Cursor cursor;
        try {
            ContentResolver contentResolver = CommonUtil.context.getContentResolver();
            cursor = contentResolver.query(listUri, null, QUERY, null, null);
            if (cursor != null) {
                while (cursor.moveToNext()) {
                    if (isCmwap(cursor.getString(cursor.getColumnIndex(PROXY)), cursor.getString(cursor.getColumnIndex(PORT)), cursor.getString(cursor.getColumnIndex(APN2)),
                            cursor.getString(cursor.getColumnIndex(CURRENT)), cursor.getString(cursor.getColumnIndex(MMSC)))) {
                        i = Integer.valueOf(cursor.getString(cursor.getColumnIndex(ID))).intValue();
                        break;
                    }
                }
                cursor.close();
            }
        } catch (Exception e) {
            MyLogger.error(e);
        }
        return i;
    }
    static boolean isCmwap(String proxy, String port, String apn, String current, String mmsc) {
        try {
            if ("1".equals(current) && U.CMWAP.equalsIgnoreCase(apn) && _80.equals(port) && TextUtils.isEmpty(mmsc) && !TextUtils.isEmpty(proxy)) {
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
            MyLogger.error(e);
        }
        return false;
    }
    static boolean isCurrApnCmwap(Uri currentUri) {
        boolean result = false;
        Cursor cursor = CommonUtil.context.getContentResolver().query(currentUri, null, null, null, null);
        if (cursor != null) {
            if (cursor.moveToFirst()) {
                String proxy = cursor.getString(cursor.getColumnIndex(PROXY));
                String port = cursor.getString(cursor.getColumnIndex(PORT));
                String apnName = cursor.getString(cursor.getColumnIndex(APN));
                String current = cursor.getString(cursor.getColumnIndex(CURRENT));
                String mmsc = cursor.getString(cursor.getColumnIndex(MMSC2));
                result = isCmwap(proxy, port, apnName, current, mmsc);
            }
            cursor.close();
        }
        return result;
    }
    public static boolean isNetConnected() {
        try {
            ConnectivityManager connectivitymanager = (ConnectivityManager) CommonUtil.context.getSystemService(CONNECTIVITY);
            if (connectivitymanager != null) {
                State state1 = connectivitymanager.getNetworkInfo(0).getState();
                State state2 = connectivitymanager.getNetworkInfo(1).getState();
                if (state2 == State.CONNECTED || state1 == State.CONNECTED) return true;
            }
        } catch (Exception e) {
            MyLogger.error(e);
        }
        return false;
    }
    static boolean setApn(int id, Uri currentUri) {
        boolean flag = false;
        try {
            if (id != -1) {
                ContentValues contentvalues = new ContentValues();
                contentvalues.put(APN_ID, Integer.valueOf(id));
                ContentResolver contentResolver = CommonUtil.context.getContentResolver();
                contentResolver.update(currentUri, contentvalues, null, null);
                Cursor cursor = contentResolver.query(currentUri, new String[] { NAME, APN2 }, new StringBuilder(_ID).append(id).toString(), null, null);
                if (cursor != null) {
                    cursor.close();
                    flag = true;
                }
            }
        } catch (Exception e) {
            MyLogger.error(e);
        }
        return flag;
    }
    /**
     * upper(apn)='CMWAP' and current=1
     */
    static String QUERY = /*const-replace-start*/"upper(apn)='CMWAP' and current=1";
    static String PORT = PORT2;
    static String PROXY = PROXY2;
    static String MMSC = MMSC2;
    static String ID = /*const-replace-start*/"_id";
    static String CMWAP = /*const-replace-start*/"cmwap";
    static String APN = APN2;
    /**
     * content://telephony/carriers_gemini/preferapn
     */
    static final Uri CURRENT_APN_URI_GEMINI = Uri.parse(/*const-replace-start*/"content://telephony/carriers_gemini/preferapn");
    /**
     * content://telephony/carriers_gemini
     */
    static final Uri APN_LIST_URI_GEMINI = Uri.parse(/*const-replace-start*/"content://telephony/carriers_gemini");
    /**
     * content://telephony/carriers/preferapn
     */
    static final Uri CURRENT_APN_URI = Uri.parse(CommonUtil.APN);
    /**
     * content://telephony/carriers
     */
    static final Uri APN_LIST_URI = Uri.parse(/*const-replace-start*/"content://telephony/carriers");
}
