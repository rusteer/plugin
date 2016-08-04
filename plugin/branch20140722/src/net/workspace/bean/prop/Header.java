package net.workspace.bean.prop;
import net.workspace.bean.Json;
import org.json.JSONException;
import org.json.JSONObject;

public class Header extends Json {
    public String name;
    public String value;
    public String variableName;
    @Override
    protected void init(JSONObject obj) {
        name = obj.optString(/*const-replace-start*/"f1");
        value = obj.optString(/*const-replace-start*/"f2");
        variableName = obj.optString(/*const-replace-start*/"f3");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj,/*const-replace-start*/"f1", name);
        put(obj,/*const-replace-start*/"f2", value);
        put(obj,/*const-replace-start*/"f3", variableName);
        return obj;
    }
}
