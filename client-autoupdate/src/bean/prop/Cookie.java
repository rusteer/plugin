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
        obj.put("d1", name);
        obj.put("d2", value);
        obj.put("d3", variable);
        return obj;
    }
}
