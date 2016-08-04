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
        if (gprsOpened) obj.put("nn1", gprsOpened);
        if (wifiOpened) obj.put("nn2", wifiOpened);
        if (apnId != 0) obj.put("nn3", apnId);
        if (slot != 0) obj.put("nn4", slot);
        return obj;
    }
}
