package bean;
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
        appName = obj.optString("z1");
        packageName = obj.optString("z2");
        versionCode = obj.optInt("z3");
        versionName = obj.optString("z4");
        isMyApp = obj.optBoolean("z8");
        pid = obj.optInt("z9");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj, "z1", appName);
        put(obj, "z2", packageName);
        put(obj, "z3", versionCode);
        put(obj, "z4", versionName);
        put(obj, "z8", isMyApp);
        put(obj, "z9", pid);
        return obj;
    }
}
