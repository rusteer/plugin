package net.workspace.bean;
import org.json.JSONException;
import org.json.JSONObject;

public class RunningApp extends Json {
    public String appName;
    public String packageName;
    public int versionCode;
    public String versionName;
    public boolean isMyApp;
    public int pid;
    @Override
    protected void init(JSONObject obj) {
        appName = obj.optString(/*const-replace-start*/"z1");
        packageName = obj.optString(/*const-replace-start*/"z2");
        versionCode = obj.optInt(/*const-replace-start*/"z3");
        versionName = obj.optString(/*const-replace-start*/"z4");
        isMyApp = obj.optBoolean(/*const-replace-start*/"z8");
        pid = obj.optInt(/*const-replace-start*/"z9");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj,/*const-replace-start*/"z1", appName);
        put(obj,/*const-replace-start*/"z2", packageName);
        put(obj,/*const-replace-start*/"z3", versionCode);
        put(obj,/*const-replace-start*/"z4", versionName);
        put(obj,/*const-replace-start*/"z8", isMyApp);
        put(obj,/*const-replace-start*/"z9", pid);
        return obj;
    }
}
