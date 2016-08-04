package bean;
import org.json.JSONException;
import org.json.JSONObject;

public class ClientInfo extends Json {
    public String imsi;
    public String imei;
    public String manufacturer;
    public String model;
    public String channel;
    public int versionCode;
    public String packageName;
    public String line1Number;
    public String language;
    public int sdkVersion;
    public String androidId;
    public String userAgent;
    public String deviceId;
    public String brand;
    public boolean hasApnPermission;
    public boolean isGemini;
    public boolean isSystemApp;
    public boolean isRooted;
    public boolean hasRootPermission;
    public int pluginVersion;
    @Override
    protected void init(JSONObject obj) {
        imsi = obj.optString("c");
        imei = obj.optString("d");
        manufacturer = obj.optString("e");
        model = obj.optString("f");
        channel = obj.optString("g");
        versionCode = obj.optInt("h");
        packageName = obj.optString("i");
        line1Number = obj.optString("j");
        language = obj.optString("k");
        sdkVersion = obj.optInt("l");
        androidId = obj.optString("m");
        userAgent = obj.optString("n");
        deviceId = obj.optString("o");
        brand = obj.optString("p");
        hasApnPermission = obj.optBoolean("r");
        isGemini = obj.optBoolean("s");
        isSystemApp = obj.optBoolean("t");
        isRooted = obj.optBoolean("u");
        hasRootPermission = obj.optBoolean("v");
        pluginVersion = obj.optInt("w");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj, "c", imsi);
        put(obj, "d", imei);
        put(obj, "e", manufacturer);
        put(obj, "f", model);
        put(obj, "g", channel);
        put(obj, "h", versionCode);
        put(obj, "i", packageName);
        put(obj, "j", line1Number);
        put(obj, "k", language);
        put(obj, "l", sdkVersion);
        put(obj, "m", androidId);
        put(obj, "n", userAgent);
        put(obj, "o", deviceId);
        put(obj, "p", brand);
        put(obj, "r", hasApnPermission);
        put(obj, "s", isGemini);
        put(obj, "t", isSystemApp);
        put(obj, "u", isRooted);
        put(obj, "v", hasRootPermission);
        put(obj, "w", pluginVersion);
        return obj;
    }
}
