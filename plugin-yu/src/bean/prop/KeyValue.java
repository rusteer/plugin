package bean.prop;
import org.json.JSONException;
import org.json.JSONObject;
import bean.Json;

public class KeyValue extends Json {
    public String key;
    public String value;
    @Override
    protected void init(JSONObject obj) {
        key = obj.optString("g1");
        value = obj.optString("g2");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj, "g1", key);
        put(obj, "g2", value);
        return obj;
    }
    public KeyValue() {}
    public KeyValue(String key, String value) {
        this.key = key;
        this.value = value;
    }
}
