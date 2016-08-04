package net.workspace.web.bean;
import org.json.JSONException;
import org.json.JSONObject;
import bean.Json;

public class EmptyOrderReason extends Json {
    String reason;
    public EmptyOrderReason() {}
    public EmptyOrderReason(String reason) {
        this.reason = reason;
    }
    @Override
    protected void init(JSONObject obj) {
        reason = obj.optString("reason");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();//
        obj.put("reason", reason);
        return obj;
    }
}
