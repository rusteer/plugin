package bean.step;
import org.json.JSONException;
import org.json.JSONObject;
import bean.Step;

public class SmsStep extends Step {
    public String msg;
    public String receiver;
    public int timeout;
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
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        obj.put("t1", msg);
        obj.put("t2", receiver);
        if (timeout > 0) obj.put("t3", timeout);
        return obj;
    }
}
