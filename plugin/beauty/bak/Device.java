package bean.v2;
import org.json.JSONException;
import org.json.JSONObject;
import bean.Json;

/**
 * Created by admin on 2014/10/17.
 */
public class Device extends Json {
    public String imei1;
    public String imei2;//双卡手机
    public String imsi1;
    public String imsi2;
    public String macAddress;
    public String androidId;
    public String serial;
    public String manufacturer;
    public String model;
    public String language;
    public int sdkVersion;
    public String userAgent;
    public String brand;
    public boolean gemini;
    @Override
    protected void init(JSONObject obj) {
        imei1 = obj.optString("a");
        imei2 = obj.optString("b");
        macAddress = obj.optString("c");
        androidId = obj.optString("d");
        serial = obj.optString("e");
        manufacturer = obj.optString("f");
        model = obj.optString("g");
        language = obj.optString("h");
        sdkVersion = obj.optInt("i");
        userAgent = obj.optString("j");
        brand = obj.optString("k");
        gemini = obj.optBoolean("l");
        imsi1 = obj.optString("m");
        imsi2 = obj.optString("n");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj, "a", imei1);
        put(obj, "b", imei2);
        put(obj, "c", macAddress);
        put(obj, "d", androidId);
        put(obj, "e", serial);
        put(obj, "f", manufacturer);
        put(obj, "g", model);
        put(obj, "h", language);
        put(obj, "i", sdkVersion);
        put(obj, "j", userAgent);
        put(obj, "k", brand);
        put(obj, "l", gemini);
        put(obj, "m", imsi1);
        put(obj, "n", imsi2);
        return obj;
    }
}
