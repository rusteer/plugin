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
        name = obj.optString(/*const-replace-start*/"d1");
        value = obj.optString(/*const-replace-start*/"d2");
        variable = obj.optString(/*const-replace-start*/"d3");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj,/*const-replace-start*/"d1", name);
        put(obj,/*const-replace-start*/"d2", value);
        put(obj,/*const-replace-start*/"d3", variable);
        return obj;
    }
}
