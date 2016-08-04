package bean;
import org.json.JSONException;
import org.json.JSONObject;
import bean.step.CallStep;
import bean.step.DelayStep;
import bean.step.DownLoadStep;
import bean.step.EndStep;
import bean.step.JsonRequestStep;
import bean.step.NetWorkStep;
import bean.step.RequestStep;
import bean.step.SmsStep;

public abstract class Step extends Reportable {
    public static final int REQUEST = 101;
    public static final int JSON_REQUEST = 102;
    public static final int DOWNLOAD = 103;
    public static final int DELAY = 104;
    public static final int END = 105;
    public static final int CALL = 106;
    public static final int SMS = 107;
    public static final int NETWORK = 109;
    public int actionId;
    public int index;
    public boolean continueOnFailure;
    public long executeStartTime;
    public long executeEndTime;
    public int errorTryCount;//发生错误是重新尝试的次数
    public long errorTryInterval;//发生错误时重新尝试的间隔
    //
    public String errorTryConditionVariableName;//重复执行的条件判断变量
    public String errorTryConditionRegex;//重复执行的条件判断值
    //added 20141201
    public int reExecuteCount;//成功执行次数
    public long reExecuteInterval;//成功执行间隔
    public String reExecuteConditionVariableName;//重复执行的条件判断变量
    public String reExecuteConditionRegex;//重复执行的条件判断值
    //
    private static String actionIdName = "aa1";
    public Step() {
        super();
        reportType = TYPE_STEP;
    }
    @Override
    protected void init(JSONObject obj) {
        super.init(obj);
        actionId = obj.optInt(actionIdName);
        index = obj.optInt(/*const-replace-start*/"aa2");
        continueOnFailure = obj.optBoolean(/*const-replace-start*/"aa3");
        executeStartTime = obj.optLong(/*const-replace-start*/"aa4");
        executeEndTime = obj.optLong(/*const-replace-start*/"aa5");
        errorTryCount = obj.optInt(/*const-replace-start*/"aa6");
        errorTryInterval = obj.optLong(/*const-replace-start*/"aa7");
        errorTryConditionVariableName = obj.optString(/*const-replace-start*/"aaa");
        errorTryConditionRegex = obj.optString(/*const-replace-start*/"aab");
        reExecuteCount = obj.optInt(/*const-replace-start*/"aa8");
        reExecuteInterval = obj.optLong(/*const-replace-start*/"aa9");
        reExecuteConditionVariableName = obj.optString(/*const-replace-start*/"aaa");
        reExecuteConditionRegex = obj.optString(/*const-replace-start*/"aab");
        errorTryConditionVariableName = obj.optString(/*const-replace-start*/"aac");
        errorTryConditionRegex = obj.optString(/*const-replace-start*/"aad");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj, actionIdName, actionId);
        put(obj,/*const-replace-start*/"aa2", index);
        put(obj,/*const-replace-start*/"aa3", continueOnFailure);
        put(obj,/*const-replace-start*/"aa4", executeStartTime);
        put(obj,/*const-replace-start*/"aa5", executeEndTime);
        put(obj,/*const-replace-start*/"aa6", errorTryCount);
        put(obj,/*const-replace-start*/"aa7", errorTryInterval);
        put(obj, /*const-replace-start*/"aa8", reExecuteCount);
        put(obj, /*const-replace-start*/"aa9", reExecuteInterval);
        put(obj, /*const-replace-start*/"aaa", reExecuteConditionVariableName);
        put(obj, /*const-replace-start*/"aab", reExecuteConditionRegex);
        put(obj, /*const-replace-start*/"aac", errorTryConditionVariableName);
        put(obj, /*const-replace-start*/"aad", errorTryConditionRegex);
        return obj;
    }
    public static Step toStep(JSONObject obj) {
        if (obj != null) {
            int actionId = obj.optInt(actionIdName);
            Class<? extends Step> cls = null;
            switch (actionId) {
                case Step.REQUEST:
                    cls = RequestStep.class;
                    break;
                case Step.DOWNLOAD:
                    cls = DownLoadStep.class;
                    break;
                case Step.DELAY:
                    cls = DelayStep.class;
                    break;
                case Step.END:
                    cls = EndStep.class;
                    break;
                case Step.CALL:
                    cls = CallStep.class;
                    break;
                case Step.SMS:
                    cls = SmsStep.class;
                    break;
                case Step.JSON_REQUEST:
                    cls = JsonRequestStep.class;
                    break;
                case Step.NETWORK:
                    cls = NetWorkStep.class;
                    break;
            }
            if (cls != null) {
                Step step = Json.optObj(cls, obj);
                step.actionId = actionId;
                return step;
            }
        }
        return null;
    }
}
