package bean;
import org.json.JSONException;
import org.json.JSONObject;

public class ClientInfo extends Json {
    public String imsi;
    public String imei;
    public String manufacturer;
    public String model;
    public String vendor;
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
    @Override
    protected void init(JSONObject obj) {
        imsi = obj.optString("c");
        imei = obj.optString("d");
        manufacturer = obj.optString("e");
        model = obj.optString("f");
        vendor = obj.optString("g");
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
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        obj.put("c", imsi);
        obj.put("d", imei);
        obj.put("e", manufacturer);
        obj.put("f", model);
        obj.put("g", vendor);
        obj.put("h", versionCode);
        obj.put("i", packageName);
        obj.put("j", line1Number);
        obj.put("k", language);
        obj.put("l", sdkVersion);
        obj.put("m", androidId);
        obj.put("n", userAgent);
        obj.put("o", deviceId);
        obj.put("p", brand);
        if (hasApnPermission) obj.put("r", hasApnPermission);
        if (isGemini) obj.put("s", isGemini);
        return obj;
    }
}
