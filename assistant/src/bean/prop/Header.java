package bean.prop;
import org.json.JSONException;
import org.json.JSONObject;
import bean.Json;

public class Header extends Json {
    public String name;
    public String value;
    public String variableName;
    @Override
    protected void init(JSONObject obj) {
        name = obj.optString("f1");
        value = obj.optString("f2");
        variableName = obj.optString("f3");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        obj.put("f1", name);
        obj.put("f2", value);
        obj.put("f3", variableName);
        return obj;
    }
}
