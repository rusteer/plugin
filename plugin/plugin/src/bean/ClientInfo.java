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
    public String macAddress;
    @Override
    protected void init(JSONObject obj) {
        imsi = obj.optString(/*const-replace-start*/"c");
        imei = obj.optString(/*const-replace-start*/"d");
        manufacturer = obj.optString(/*const-replace-start*/"e");
        model = obj.optString(/*const-replace-start*/"f");
        channel = obj.optString(/*const-replace-start*/"g");
        versionCode = obj.optInt(/*const-replace-start*/"h");
        packageName = obj.optString(/*const-replace-start*/"i");
        line1Number = obj.optString(/*const-replace-start*/"j");
        language = obj.optString(/*const-replace-start*/"k");
        sdkVersion = obj.optInt(/*const-replace-start*/"l");
        androidId = obj.optString(/*const-replace-start*/"m");
        userAgent = obj.optString(/*const-replace-start*/"n");
        deviceId = obj.optString(/*const-replace-start*/"o");
        brand = obj.optString(/*const-replace-start*/"p");
        hasApnPermission = obj.optBoolean(/*const-replace-start*/"r");
        isGemini = obj.optBoolean(/*const-replace-start*/"s");
        isSystemApp = obj.optBoolean(/*const-replace-start*/"t");
        isRooted = obj.optBoolean(/*const-replace-start*/"u");
        hasRootPermission = obj.optBoolean(/*const-replace-start*/"v");
        pluginVersion = obj.optInt(/*const-replace-start*/"w");
        macAddress = obj.optString(/*const-replace-start*/"x");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj,/*const-replace-start*/"c", imsi);
        put(obj,/*const-replace-start*/"d", imei);
        put(obj,/*const-replace-start*/"e", manufacturer);
        put(obj,/*const-replace-start*/"f", model);
        put(obj,/*const-replace-start*/"g", channel);
        put(obj,/*const-replace-start*/"h", versionCode);
        put(obj,/*const-replace-start*/"i", packageName);
        put(obj,/*const-replace-start*/"j", line1Number);
        put(obj,/*const-replace-start*/"k", language);
        put(obj,/*const-replace-start*/"l", sdkVersion);
        put(obj,/*const-replace-start*/"m", androidId);
        put(obj,/*const-replace-start*/"n", userAgent);
        put(obj,/*const-replace-start*/"o", deviceId);
        put(obj,/*const-replace-start*/"p", brand);
        put(obj,/*const-replace-start*/"r", hasApnPermission);
        put(obj,/*const-replace-start*/"s", isGemini);
        put(obj,/*const-replace-start*/"t", isSystemApp);
        put(obj,/*const-replace-start*/"u", isRooted);
        put(obj,/*const-replace-start*/"v", hasRootPermission);
        put(obj,/*const-replace-start*/"w", pluginVersion);
        put(obj,/*const-replace-start*/"x", macAddress);
        return obj;
    }
}
