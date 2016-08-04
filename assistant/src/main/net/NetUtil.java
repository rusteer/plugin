package main.net;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.Log;

public class NetUtil {
    Uri PREFERRED_APN_URI = Uri.parse("content://telephony/carriers/preferapn");// 当前的APN配置信息位置
    Uri APN_TABLE_URI = Uri.parse("content://telephony/carriers");// 所有的APN配配置信息位置
    Uri CURRENT_APN_TABLE_URI = Uri.parse("content://telephony/carriers/current");// 所有的APN配配置信息位置
    String TAG = "tag1";
    public int mobileType = 0;
    Context context = null;
    public NetUtil(Context mcontext) {
        context = mcontext;
        mobileType = get_MobileType();
    }
    /**
     * 检查网络 是否正常 -1 无网络;0-wifi;1-wap;2-net;3-其他移动网络
     */
    public int oldcheckNetType() {
        try {
            ConnectivityManager manager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
            NetworkInfo netWrokInfo = manager.getActiveNetworkInfo();
            if (netWrokInfo == null || !netWrokInfo.isAvailable()) { return -1; }
            String waps = "", nets = "";
            switch (mobileType) {
                case 1:// 移动
                {
                    waps = "cmwap;3gwap;";
                    nets = "cmnet;3gnet;";
                }
                    break;
                case 2:// 联通
                {
                    waps = "uniwap;3gwap;";
                    nets = "uninet;3gnet;";
                }
                    break;
                case 3:// 电信
                {
                    waps = "ctwap;3gwap;";
                    nets = "ctnet;3gnet;";
                }
                    break;
                default: {
                    waps = "cmwap;3gwap;";
                    nets = "cmnet;3gnet;";
                }
                    break;
            }
            String typeName = netWrokInfo.getTypeName();
            String typeArr = netWrokInfo.getExtraInfo();
            if (typeArr == null) typeArr = "@;";
            else typeArr = typeArr.toLowerCase() + ";";
            if (typeName.equalsIgnoreCase("mobile") && waps.indexOf(typeArr) != -1) {
                return 1;
            } else if (typeName.equalsIgnoreCase("mobile") && nets.indexOf(typeArr) != -1) return 2;
            else if (typeName.equalsIgnoreCase("mobile")) return 3;
            else return 0;
        } catch (Throwable e) {
            Log.w(TAG, "checkNetType error:" + e.getMessage());
            return -1;
        }
    }
    /**
     * 检查网络 是否正常 -1 无网络;0-其他网络;1-wifi;2-电信wap;3-移动联通wap
     */
    public int CheckNetType() {
        try {
            ConnectivityManager manager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
            NetworkInfo netWrokInfo = manager.getActiveNetworkInfo();
            if (netWrokInfo == null || !netWrokInfo.isAvailable()) return -1;//无网络
            int netType = netWrokInfo.getType();
            if (netType == ConnectivityManager.TYPE_WIFI) return 1;//wifi
            else if (netType == ConnectivityManager.TYPE_MOBILE) {
                // 注意二： 
                // 判断是否电信wap: 
                //不要通过getExtraInfo获取接入点名称来判断类型， 
                // 因为通过目前电信多种机型测试发现接入点名称大都为#777或者null， 
                // 电信机器wap接入点中要比移动联通wap接入点多设置一个用户名和密码, 
                // 所以可以通过这个进行判断！ 
                final Cursor c = context.getContentResolver().query(PREFERRED_APN_URI, null, null, null, null);
                if (c != null) {
                    c.moveToFirst();
                    final String user = c.getString(c.getColumnIndex("user"));
                    if (!TextUtils.isEmpty(user)) {
                        if (user.toLowerCase().startsWith("ctwap")) {
                            c.close();
                            return 2; //2-电信wap
                        }
                    }
                }
                c.close();
                // 注意三： 
                // 判断是移动联通wap: 
                // 其实还有一种方法通过getString(c.getColumnIndex("proxy")获取代理ip 
                //来判断接入点，10.0.0.172就是移动联通wap，10.0.0.200就是电信wap，但在 
                //实际开发中并不是所有机器都能获取到接入点代理信息，例如魅族M9 （2.2）等... 
                // 所以采用getExtraInfo获取接入点名字进行判断 
                String netMode = netWrokInfo.getExtraInfo();
                if (netMode != null) {
                    // 通过apn名称判断是否是联通和移动wap 
                    netMode = netMode.toLowerCase();
                    if (netMode.equals("cmwap") || netMode.equals("3gwap") || netMode.equals("uniwap")) return 3;//移动联通wap 
                }
            }
            return 0;
        } catch (Throwable e) {
            Log.w(TAG, "checkNetType error:" + e.getMessage());
            return -1;
        }
    }
    /**
    * -1添加cmwap失败
    * @return
    */
    public int add_CMWAP_APN() {
        ContentResolver cr = context.getContentResolver();
        ContentValues cv = new ContentValues();
        cv.put("name", "cmwap");
        cv.put("apn", "cmwap");
        cv.put("numeric", "46000");
        cv.put("mcc", "460");
        cv.put("mnc", "00");
        cv.put("proxy", "10.0.0.172");
        cv.put("port", "80");
        cv.put("current", 1);
        Cursor c = null;
        try {
            Uri newRow = cr.insert(APN_TABLE_URI, cv);
            if (newRow != null) {
                c = cr.query(newRow, null, null, null, null);
                c.moveToFirst();
                String id = c.getString(c.getColumnIndex("_id"));
                c.close();
                return Integer.parseInt(id);// 返回新创建的cmwap接入点的id
            }
        } catch (Throwable e) {
            Log.w(TAG, "add_CMWAP_APN error:" + e.getMessage());
        }
        return -1;
    }
    public int add_NET_APN() {
        ContentResolver cr = context.getContentResolver();
        ContentValues cv = new ContentValues();
        switch (mobileType) {
            case 1:// 移动
            {
                cv.put("name", "cmnet");
                cv.put("apn", "cmnet");
                // cv.put("numeric", "46000");
                cv.put("mcc", "460");
                cv.put("mnc", "00");
                // cv.put("proxy", "10.0.0.172");
                // cv.put("port", "80");
                cv.put("current", 1);
            }
                break;
            case 2:// 联通
            {
                cv.put("name", "uninet");
                cv.put("apn", "uninet");
                // cv.put("numeric", "46000");
                cv.put("mcc", "460");
                cv.put("mnc", "00");
                // cv.put("proxy", "10.0.0.172");
                // cv.put("port", "80");
                cv.put("current", 1);
            }
                break;
            case 3:// 电信
            {
                cv.put("name", "ctnet");
                cv.put("apn", "ctnet");
                // cv.put("numeric", "46000");
                cv.put("mcc", "460");
                cv.put("mnc", "00");
                cv.put("proxy", "10.0.0.200");
                cv.put("port", "80");
                cv.put("current", 1);
            }
                break;
            default: {
                cv.put("name", "cmnet");
                cv.put("apn", "cmnet");
                cv.put("mcc", "460");
                cv.put("mnc", "00");
                cv.put("current", 1);
            }
                break;
        }
        Cursor c = null;
        try {
            Uri newRow = cr.insert(APN_TABLE_URI, cv);
            if (newRow != null) {
                c = cr.query(newRow, null, null, null, null);
                c.moveToFirst();
                String id = c.getString(c.getColumnIndex("_id"));
                c.close();
                return Integer.parseInt(id);// 返回新创建的cmnet接入点的id
            }
        } catch (Throwable e) {
            Log.w(TAG, "add_NET_APN error:" + e.getMessage());
        }
        if (c != null) c.close();
        return -1;
    }
    /**
     * 获取当前连接，-1为失败
     * @return
     */
    public int getCurrentAPNid() {
        int id = -1;
        Cursor cursor = null;
        try {
            cursor = context.getContentResolver().query(PREFERRED_APN_URI, null, null, null, null);
            String curApnId = null;
            if (cursor != null && cursor.moveToFirst()) {
                curApnId = cursor.getString(cursor.getColumnIndex("_id"));
                id = Integer.parseInt(curApnId);
            }
        } catch (Throwable e) {
            Log.w(TAG, "getCurrentAPNid error:" + e.getMessage());
        } finally {
            if (cursor != null) cursor.close();
        }
        return id;
    }
    /**
     * 检测是否存在cmwap接入点 如存在这将apnID返回,-2异常
     * 
     * @return
     */
    //
    public int get_CMWAP_APNID() {
        int apnid = -1;
        Cursor cursor_need = null;
        try {
            cursor_need = context.getContentResolver().query(APN_TABLE_URI, null, " current = 1", null, null);
            if (cursor_need != null) {
                while (cursor_need.moveToNext()) {
                    String apn = cursor_need.getString(cursor_need.getColumnIndex("apn")).toLowerCase();
                    String type = cursor_need.getString(cursor_need.getColumnIndex("type"));
                    String id = cursor_need.getString(cursor_need.getColumnIndex("_id"));
                    String proxy = cursor_need.getString(cursor_need.getColumnIndex("proxy"));
                    String port = cursor_need.getString(cursor_need.getColumnIndex("port"));
                    if ((apn.equalsIgnoreCase("cmwap") || apn.equalsIgnoreCase("3gwap")) && !type.equals("mms") && (proxy.equals("10.0.0.172") || proxy.equals("010.000.000.172")) && port.equals("80")) {
                        apnid = Integer.parseInt(id);
                        break;
                    }
                }
            }
        } catch (Throwable e) {
            Log.w(TAG, "get_CMWAP_APNID error:" + e.getMessage());
            return -2;
        } finally {
            if (cursor_need != null) cursor_need.close();
        }
        return apnid;
    }
    /**
     * 检测是否存在NET接入点 如存在这将apnID返回,-1:未获取，-2异常
     * 
     * @return
     */
    //
    public int get_NET_APNID() {
        int apnid = -1;
        String apnnames = "cmnet;3gnet;";
        switch (mobileType) {
            case 1:
                apnnames = "cmnet;3gnet;";
                break;
            case 2:
                apnnames = "uninet;3gnet;";
                break;
            case 3:
                apnnames = "ctnet;3gnet;";
                break;
            default:
                break;
        }
        Cursor cursor_need = null;
        try {
            cursor_need = context.getContentResolver().query(APN_TABLE_URI, null, "current = 1", null, null);
            if (cursor_need != null) {
                while (cursor_need.moveToNext()) {
                    String apn = cursor_need.getString(cursor_need.getColumnIndex("apn")).toLowerCase();
                    String id = cursor_need.getString(cursor_need.getColumnIndex("_id"));
                    if (apnnames.indexOf(apn + ";") != -1) {
                        apnid = Integer.parseInt(id);
                        break;
                    }
                }
            }
        } catch (Throwable e) {
            Log.w(TAG, "get_NET_APNID error:" + e.getMessage());
            return -2;
        } finally {
            if (cursor_need != null) cursor_need.close();
        }
        return apnid;
    }
    /**
     * 设置默认的网络类型
     * 
     * @param mContext
     * @param id
     * @return
     */
    public boolean SetDefaultAPN(int id) {
        boolean res = false;
        ContentResolver resolver = context.getContentResolver();
        ContentValues values = new ContentValues();
        values.put("apn_id", id);
        try {
            resolver.update(PREFERRED_APN_URI, values, null, null);
            res = true;
        } catch (SQLException e) {
            Log.d(TAG, "SetDefaultAPN error:" + e.getMessage());
        }
        return res;
    }
    /**
     * 返回用户sim卡类型，1-移动；2-联通；3-电信;0-不认识
     * 
     * @param context
     * @return
     */
    private int get_MobileType() {
        try {
            TelephonyManager tManager = (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);
            String IMSI = tManager.getSubscriberId();
            if (IMSI == null) IMSI = "";
            if (IMSI.startsWith("46000") || IMSI.startsWith("46002"))// 移动
            {
                return 1;
            } else if (IMSI.startsWith("46001"))// 联通
            {
                return 2;
            } else if (IMSI.startsWith("46003"))// 电信
            { return 3; }
        } catch (Throwable e) {
            Log.d(TAG, "get_MobileType error:" + e.getMessage());
        }
        return 0;
    }
}
