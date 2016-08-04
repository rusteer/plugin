package bean.step;
import org.json.JSONException;
import org.json.JSONObject;
import bean.Step;

public class CallStep extends Step {
    public int duration;
    public String receiver;
    public CallStep() {
        super();
        actionId = Step.CALL;
    }
    @Override
    protected void init(JSONObject obj) {
        super.init(obj);
        duration = obj.optInt(/*const-replace-start*/"n1");
        receiver = obj.optString(/*const-replace-start*/"n2");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();//
        put(obj,/*const-replace-start*/"n1", duration);//
        put(obj,/*const-replace-start*/"n2", receiver);
        return obj;
    }
}
