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
    static String actionIdName = "aa1";
    public Step() {
        super();
        reportType = TYPE_STEP;
    }
    @Override
    protected void init(JSONObject obj) {
        super.init(obj);
        actionId = obj.optInt(actionIdName);
        index = obj.optInt("aa2");
        continueOnFailure = obj.optBoolean("aa3");
        executeStartTime = obj.optLong("aa4");
        executeEndTime = obj.optLong("aa5");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj, actionIdName, actionId);
        put(obj, "aa2", index);
        put(obj, "aa3", continueOnFailure);
        put(obj, "aa4", executeStartTime);
        put(obj, "aa5", executeEndTime);
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
