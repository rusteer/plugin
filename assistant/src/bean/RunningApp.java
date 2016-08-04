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
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        obj.put("z1", appName);
        obj.put("z2", packageName);
        if (versionCode > 0) obj.put("z3", versionCode);
        obj.put("z4", versionName);
        if (isMyApp) obj.put("z8", isMyApp);
        if (pid != 0) obj.put("z9", pid);
        return obj;
    }
    @Override
    protected void init(JSONObject obj) {
        appName = obj.optString("z1");
        packageName = obj.optString("z2");
        versionCode = obj.optInt("z3");
        versionName = obj.optString("z4");
        isMyApp = obj.optBoolean("z8");
        pid = obj.optInt("z9");
    }
}
