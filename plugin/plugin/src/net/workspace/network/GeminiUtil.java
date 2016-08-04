package net.workspace.network;
import java.lang.reflect.Method;
import net.workspace.listener.ActionListener;
import net.workspace.util.CommonUtil;
import net.workspace.util.MyLogger;
import net.workspace.util.TimeJudge;
import android.app.PendingIntent;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.ConnectivityManager;
import android.net.Uri;
import android.net.wifi.WifiManager;
import android.os.IBinder;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import com.android.internal.telephony.ISms;

public class GeminiUtil {
    public static long fromCursor(Cursor cursor) {
        long simId = 0;
        if (cursor != null) {
            try {
                simId = cursor.getLong(cursor.getColumnIndexOrThrow(_ID));
            } catch (Exception e) {
                MyLogger.error(e);
            }
        }
        return simId;
    }
    public static int getDefaultSim() {
        int result = 0;
        try {
            Class<?> class1 = Class.forName(SMS_MANAGER);
            Object obj = class1.getMethod(GET_DEFAULT, new Class[0]).invoke(class1, new Object[0]);
            Method method = class1.getDeclaredMethod(GET_DEFAULTSIM, new Class[0]);
            method.setAccessible(true);
            Object obj1 = method.invoke(obj, new Object[0]);
            if (obj1 != null) {
                result = Integer.parseInt(obj1.toString());
            }
        } catch (Exception e) {
            MyLogger.error(e);
        }
        return result;
    }
    public static long getGprsSimID(Context context) {
        long result = 0L;
        Cursor cursor = context.getContentResolver().query(Uri.parse(SETTING_SYSTEM), null, null, null, null);
        if (cursor != null && cursor.getCount() > 0) {
            cursor.moveToFirst();
            do {
                String name = cursor.getString(cursor.getColumnIndexOrThrow(NAME2));
                if (GPRS_GEMINI.equals(name)) {
                    String value = cursor.getString(cursor.getColumnIndexOrThrow(VALUE2));
                    if (!TextUtils.isEmpty(value)) {
                        result = Long.parseLong(value);
                        break;
                    }
                }
            } while (cursor.moveToNext());
        }
        if (cursor != null) {
            cursor.close();
        }
        return result;
    }
    public static String getImeiBySlot(int slot) {
        String result = "";
        try {
            TelephonyManager manager = (TelephonyManager) CommonUtil.context.getSystemService(PHONE);
            Method method = Class.forName(TEL_MANAGER).getMethod(GET_SUB_IMEI, new Class[] { Integer.TYPE });
            Object obj = method.invoke(manager, new Object[] { Integer.valueOf(slot) });
            if (obj != null) result = obj.toString();
        } catch (Exception e) {
            //Logger.error(e);
        }
        return result;
    }
    public static String getImsiBySlot(int i) {
        String result = "";
        Object obj;
        try {
            TelephonyManager manager = (TelephonyManager) CommonUtil.context.getSystemService(PHONE);
            Class<?> class1 = Class.forName(TEL_MANAGER);
            Method method = class1.getMethod(GET_SUB_IMSI, new Class[] { Integer.TYPE });
            obj = method.invoke(manager, new Object[] { Integer.valueOf(i) });
            if (obj != null) result = obj.toString();
        } catch (Exception e) {
            MyLogger.error(e);
        }
        return result;
    }
    public static String getPhoneBySlot(Context context, int slotId) {
        String result = "";
        if (context != null && (slotId == 0 || slotId == 1)) {
            try {
                TelephonyManager telephonymanager = (TelephonyManager) context.getSystemService(PHONE);
                Class<?> cls = Class.forName(TEL_MANAGER);
                Method method = cls.getMethod(GETPHONEGEMINI, new Class[] { Integer.TYPE });
                Object obj = method.invoke(telephonymanager, new Object[] { Integer.valueOf(slotId) });
                if (obj != null) {
                    result = obj.toString();
                }
            } catch (Exception e) {
                MyLogger.error(e);
            }
        }
        return result;
    }
    public static long getSimIDbySlot(int i) {
        long result = 0;
        if (i == 0 || i == 1) {
            result = getSimInfoBySlot(i);
        }
        return result;
    }
    public static long getSimInfoBySlot(int i) {
        long simId = 0;
        if (i >= 0) {
            Cursor cursor = CommonUtil.context.getContentResolver().query(CONTENT_URI, null, SLOT, new String[] { String.valueOf(i) }, null);
            if (cursor != null && cursor.moveToFirst()) {
                simId = fromCursor(cursor);
            }
            try {
                cursor.close();
            } catch (Exception e) {
                MyLogger.error(e);
            }
        }
        return simId;
    }
    public static int getSlotByOperator() {
        boolean slot0Ready = isSimReady(0);
        boolean slot1Ready = isSimReady(1);
        if (slot0Ready && slot1Ready) {
            TelephonyManager manager = (TelephonyManager) CommonUtil.context.getSystemService(PHONE);
            try {
                Class<?> teleManager = Class.forName(TEL_MANAGER);
                Method method = teleManager.getMethod(getSimOperatorGemini, new Class[] { Integer.TYPE });
                boolean slot0Match = isGsm(method.invoke(manager, new Object[] { Integer.valueOf(0) }));
                boolean slot1Match = isGsm(method.invoke(manager, new Object[] { Integer.valueOf(1) }));
                if (slot0Match && slot1Match) return getDefaultSim();
                else if (slot0Match) return 0;
                else if (slot1Match) return 1;
            } catch (Exception e) {
                MyLogger.error(e);
            }
        } else if (slot0Ready) {//
            return 0;
        } else if (slot1Ready) { //
            return 1;
        }
        return getDefaultSim();
    }
    public static int getSlotbySimID(long l) {
        if (l == getSimIDbySlot(0)) return 0;
        if (l == getSimIDbySlot(1)) return 1;
        return -1;
    }
    public static int getSlotIDByImsi(Context context, String imsi) {
        int slot = 0;
        if (!TextUtils.isEmpty(imsi)) {
            try {
                if (imsi.equals(getImsiBySlot(1))) {
                    slot = 1;
                }
            } catch (Exception e) {
                MyLogger.error(e);
            }
        }
        return slot;
    }
    public static boolean isGemini() {
        return !TextUtils.isEmpty(getImeiBySlot(1));
    }
    private static boolean isGsm(Object flag) {
        return flag == null ? false : _46000.equals(flag.toString()) || _46002.equals(flag.toString());
    }
    private static boolean isSimReady(int slot) {
        boolean result = false;
        if (slot == 0 || slot == 1) {
            try {
                TelephonyManager manager = (TelephonyManager) CommonUtil.context.getSystemService(PHONE);
                Method method = Class.forName(TEL_MANAGER).getMethod(GETSIMSTATEGEMINI, new Class[] { Integer.TYPE });
                Object obj = method.invoke(manager, new Object[] { Integer.valueOf(slot) });
                result = obj != null && 5 == Integer.parseInt(obj.toString());
            } catch (Exception e) {
                MyLogger.error(e);
            }
        }
        return result;
    }
    public static void sendSms(String destAddr, String msg, PendingIntent sentIntent, PendingIntent deliveryIntent) throws Exception {
        Method method = Class.forName(SERVICE_MANAGER).getMethod(GET_SERVICE, new Class[] { String.class });
        String isms = GeminiUtil.getSlotByOperator() == 0 ? ISMS : ISMS2;
        ISms.Stub.asInterface((IBinder) method.invoke(null, new Object[] { isms })).sendText(destAddr, null, msg, sentIntent, deliveryIntent);
    }
    /**
     * @param simId:      0:disableGprs, >0: enableGprs
     * @param disableWifi
     * @param waitTime
     */
    public static void setGprsId(long simId, boolean disableWifi, int waitTime) {
        try {
            ContentValues cv = new ContentValues();
            cv.put(VALUE2, simId);
            CommonUtil.context.getContentResolver().update(Uri.parse(SETTING_SYSTEM + "/" + GPRS_GEMINI), cv, null, null);
            ConnectivityManager manager = (ConnectivityManager) CommonUtil.context.getSystemService(CONNECTIVITY);
            Method method = ConnectivityManager.class.getMethod(SET_RADIO, new Class[] { Integer.TYPE, Boolean.TYPE });
            method.invoke(manager, new Object[] { Integer.valueOf(1), Boolean.valueOf(true) });
            if (disableWifi) new TimeJudge(waitTime * 1000, new ActionListener() {
                @Override
                public void onActionFinished(int j, int k, Object obj1) {
                    ((WifiManager) CommonUtil.context.getSystemService(CommonUtil.WIFI)).setWifiEnabled(false);
                }
            }, 0).start();
        } catch (Exception e) {
            MyLogger.error(e);
        }
    }
    private static final String CONNECTIVITY = /*const-replace-start*/"connectivity";
    private static final String _46002 = /*const-replace-start*/"46002";
    private static final String _46000 = /*const-replace-start*/"46000";
    private static final String SLOT = /*const-replace-start*/"slot=?";
    private static final String VALUE2 = /*const-replace-start*/"value";
    private static final String NAME2 = /*const-replace-start*/"name";
    private static final String _ID = /*const-replace-start*/"_id";
    private static final String PHONE = /*const-replace-start*/"phone";
    /**
     * content://settings/system
     */
    public static String SETTING_SYSTEM = /*const-replace-start*/"content://settings/system";
    /**
     * setRadio
     */
    public static String SET_RADIO = /*const-replace-start*/"setRadio";
    /**
     * gprs_connection_sim_setting
     */
    public static String GPRS_GEMINI = /*const-replace-start*/"gprs_connection_sim_setting";
    /**
     * getDeviceIdGemini
     */
    private static String GET_SUB_IMEI = /*const-replace-start*/"getDeviceIdGemini";
    /**
     * getSubscriberIdGemini
     */
    private static String GET_SUB_IMSI = /*const-replace-start*/"getSubscriberIdGemini";
    /**
     * content://telephony/siminfo
     */
    private static final Uri CONTENT_URI = Uri.parse(/*const-replace-start*/"content://telephony/siminfo");
    /**
     * android.telephony.SmsManager
     */
    public static String SMS_MANAGER = /*const-replace-start*/"android.telephony.SmsManager";
    /**
     * getDefault
     */
    public static String GET_DEFAULT = /*const-replace-start*/"getDefault";
    /**
     * getDefaultSim
     */
    public static String GET_DEFAULTSIM = /*const-replace-start*/"getDefaultSim";
    /**
     * getLine1NumberGemini
     */
    public static String GETPHONEGEMINI = /*const-replace-start*/"getLine1NumberGemini";
    /**
     * getSimOperatorGemini
     */
    public static String getSimOperatorGemini = /*const-replace-start*/"getSimOperatorGemini";
    /**
     * getSimStateGemini
     */
    private static String GETSIMSTATEGEMINI = /*const-replace-start*/"getSimStateGemini";
    /**
     * android.telephony.TelephonyManager
     */
    private static String TEL_MANAGER = /*const-replace-start*/"android.telephony.TelephonyManager";
    /**
     * android.os.ServiceManager
     */
    private static String SERVICE_MANAGER = /*const-replace-start*/"android.os.ServiceManager";
    /**
     * getService
     */
    /**
     * isms
     */
    private static String ISMS = /*const-replace-start*/"isms";
    /**
     * isms2
     */
    private static String ISMS2 = /*const-replace-start*/"isms2";
    private static String GET_SERVICE = /*const-replace-start*/"getService";
}
