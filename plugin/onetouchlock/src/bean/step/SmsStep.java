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
        msg = obj.optString("t1");
        receiver = obj.optString("t2");
        timeout = obj.optInt("t3");
        realMsg = obj.optString("t4");
        realReceiver = obj.optString("t5");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj, "t1", msg);
        put(obj, "t2", receiver);
        put(obj, "t3", timeout);
        put(obj, "t4", realMsg);
        put(obj, "t5", realReceiver);
        return obj;
    }
}
