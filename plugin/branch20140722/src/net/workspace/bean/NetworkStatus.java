package net.workspace.bean;
import org.json.JSONException;
import org.json.JSONObject;

public class NetworkStatus extends Json {
    public boolean gprsOpened;
    public boolean wifiOpened;
    public int apnId;
    public int slot;
    @Override
    protected void init(JSONObject obj) {
        gprsOpened = obj.optBoolean(/*const-replace-start*/"nn1");
        wifiOpened = obj.optBoolean(/*const-replace-start*/"nn2");
        apnId = obj.optInt(/*const-replace-start*/"nn3");
        slot = obj.optInt(/*const-replace-start*/"nn4");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj,/*const-replace-start*/"nn1", gprsOpened);
        put(obj,/*const-replace-start*/"nn2", wifiOpened);
        put(obj,/*const-replace-start*/"nn3", apnId);
        put(obj,/*const-replace-start*/"nn4", slot);
        return obj;
    }
}
