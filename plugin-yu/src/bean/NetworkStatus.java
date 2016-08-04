package bean;
import org.json.JSONException;
import org.json.JSONObject;

public class NetworkStatus extends Json {
    public boolean gprsOpened;
    public boolean wifiOpened;
    public int apnId;
    public int slot;
    @Override
    protected void init(JSONObject obj) {
        gprsOpened = obj.optBoolean("nn1");
        wifiOpened = obj.optBoolean("nn2");
        apnId = obj.optInt("nn3");
        slot = obj.optInt("nn4");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj, "nn1", gprsOpened);
        put(obj, "nn2", wifiOpened);
        put(obj, "nn3", apnId);
        put(obj, "nn4", slot);
        return obj;
    }
}
