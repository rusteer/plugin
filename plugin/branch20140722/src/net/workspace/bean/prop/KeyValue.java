package net.workspace.bean.prop;
import net.workspace.bean.Json;
import org.json.JSONException;
import org.json.JSONObject;

public class KeyValue extends Json {
    public String key;
    public String value;
    public KeyValue() {}
    public KeyValue(String key, String value) {
        this.key = key;
        this.value = value;
    }
    @Override
    protected void init(JSONObject obj) {
        key = obj.optString(/*const-replace-start*/"g1");
        value = obj.optString(/*const-replace-start*/"g2");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj,/*const-replace-start*/"g1", key);
        put(obj,/*const-replace-start*/"g2", value);
        return obj;
    }
}
