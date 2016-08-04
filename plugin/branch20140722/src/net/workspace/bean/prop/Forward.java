package net.workspace.bean.prop;
import net.workspace.bean.Json;
import org.json.JSONException;
import org.json.JSONObject;

public class Forward extends Json {
    public String keyword;
    public int jumpNumber;
    @Override
    protected void init(JSONObject obj) {
        keyword = obj.optString(/*const-replace-start*/"e1");
        jumpNumber = obj.optInt(/*const-replace-start*/"e3");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj,/*const-replace-start*/"e1", keyword);
        put(obj,/*const-replace-start*/"e3", jumpNumber);
        return obj;
    }
}
