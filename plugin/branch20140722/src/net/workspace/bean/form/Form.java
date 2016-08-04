package net.workspace.bean.form;
import net.workspace.bean.Json;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class Form extends Json {
    public String method;
    public String deviceId;
    public String packageName;
    public Form() {}
    public Form(String method) {
        this.method = method;
    }
    @Override
    protected void init(JSONObject obj) {
        method = obj.optString(/*const-replace-start*/"a1");
        deviceId = obj.optString(/*const-replace-start*/"a2");
        packageName = obj.optString(/*const-replace-start*/"a3");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj, /*const-replace-start*/"a1", method);
        put(obj, /*const-replace-start*/"a2", deviceId);
        put(obj, /*const-replace-start*/"a3", packageName);
        return obj;
    }
}
