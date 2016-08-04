package bean.prop;
import org.json.JSONException;
import org.json.JSONObject;
import bean.Json;

public class Cookie extends Json {
    public String name;
    public String value;
    public String variable;
    @Override
    protected void init(JSONObject obj) {
        name = obj.optString("d1");
        value = obj.optString("d2");
        variable = obj.optString("d3");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj, "d1", name);
        put(obj, "d2", value);
        put(obj, "d3", variable);
        return obj;
    }
}
