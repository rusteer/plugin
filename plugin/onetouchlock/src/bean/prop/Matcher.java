package bean.prop;
import org.json.JSONException;
import org.json.JSONObject;
import bean.Json;

public class Matcher extends Json {
    public String value;
    public String match;
    public String variableName;
    public String regexValidate;
    @Override
    protected void init(JSONObject obj) {
        value = obj.optString("h1");
        match = obj.optString("h2");
        variableName = obj.optString("h3");
        regexValidate = obj.optString("h4");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj, "h1", value);
        put(obj, "h2", match);
        put(obj, "h3", variableName);
        put(obj, "h4", regexValidate);
        return obj;
    }
}
