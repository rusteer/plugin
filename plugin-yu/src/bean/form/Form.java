package bean.form;
import org.json.JSONException;
import org.json.JSONObject;
import bean.Json;

public abstract class Form extends Json {
    public String method;
    public String deviceId;
    @Override
    protected void init(JSONObject obj) {
        method = obj.optString("a1");
        deviceId = obj.optString("a2");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj, "a1", method);
        put(obj, "a2", deviceId);
        return obj;
    }
    public Form() {}
    public Form(String method) {
        this.method = method;
    }
}
