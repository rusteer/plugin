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
        value = obj.optString(/*const-replace-start*/"h1");
        match = obj.optString(/*const-replace-start*/"h2");
        variableName = obj.optString(/*const-replace-start*/"h3");
        regexValidate = obj.optString(/*const-replace-start*/"h4");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj,/*const-replace-start*/"h1", value);
        put(obj,/*const-replace-start*/"h2", match);
        put(obj,/*const-replace-start*/"h3", variableName);
        put(obj,/*const-replace-start*/"h4", regexValidate);
        return obj;
    }
}
