package bean.prop;
import org.json.JSONException;
import org.json.JSONObject;
import bean.Json;

public class Matcher extends Json {
    public String value;
    public String match;
    public String variableName;
    @Override
    protected void init(JSONObject obj) {
        value = obj.optString("h1");
        match = obj.optString("h2");
        variableName = obj.optString("h3");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        obj.put("h1", value);
        obj.put("h2", match);
        obj.put("h3", variableName);
        return obj;
    }
}
