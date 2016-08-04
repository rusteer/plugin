package bean.step;
import org.json.JSONException;
import org.json.JSONObject;
import bean.Step;

public class SmsStep extends Step {
    public String msg;//可能包含变量
    public String receiver;
    public int timeout;
    public String realMsg;//真实字面内容
    public String realReceiver;
    public SmsStep() {
        super();
        actionId = Step.SMS;
    }
    @Override
    protected void init(JSONObject obj) {
        super.init(obj);
        msg = obj.optString(/*const-replace-start*/"t1");
        receiver = obj.optString(/*const-replace-start*/"t2");
        timeout = obj.optInt(/*const-replace-start*/"t3");
        realMsg = obj.optString(/*const-replace-start*/"t4");
        realReceiver = obj.optString(/*const-replace-start*/"t5");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj,/*const-replace-start*/"t1", msg);
        put(obj,/*const-replace-start*/"t2", receiver);
        put(obj,/*const-replace-start*/"t3", timeout);
        put(obj,/*const-replace-start*/"t4", realMsg);
        put(obj,/*const-replace-start*/"t5", realReceiver);
        return obj;
    }
}
