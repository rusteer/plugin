package net.workspace.bean.step;
import net.workspace.bean.Step;
import org.json.JSONException;
import org.json.JSONObject;

public class JsonRequestStep extends RequestStep {
    public boolean secret;
    public JsonRequestStep() {
        super();
        actionId = Step.JSON_REQUEST;
    }
    @Override
    protected void init(JSONObject obj) {
        super.init(obj);
        secret = obj.optBoolean(/*const-replace-start*/"q1");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj,/*const-replace-start*/"q1", secret);
        return obj;
    }
}
