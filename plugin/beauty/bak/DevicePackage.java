package bean.v2;
import org.json.JSONException;
import org.json.JSONObject;
import bean.Json;

public class DevicePackage extends Json {
    public String channel;
    public int apkVersionCode;
    public String apkPackageName;
    public int bizVersion;
    @Override
    protected void init(JSONObject obj) {
        channel = obj.optString("a");
        apkVersionCode = obj.optInt("b");
        apkPackageName = obj.optString("c");
        bizVersion = obj.optInt("d");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj, "a", channel);
        put(obj, "b", apkVersionCode);
        put(obj, "c", apkPackageName);
        put(obj, "d", bizVersion);
        return obj;
    }
}
