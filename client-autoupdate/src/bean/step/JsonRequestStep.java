package bean.step;
import org.json.JSONException;
import org.json.JSONObject;
import bean.Step;

public class JsonRequestStep extends RequestStep {
    public boolean secret;
    public JsonRequestStep() {
        super();
        actionId = Step.JSON_REQUEST;
    }
    @Override
    protected void init(JSONObject obj) {
        super.init(obj);
        secret = obj.optBoolean("q1");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        obj.put("q1", secret);
        return obj;
    }
}
