package bean.prop;
import org.json.JSONException;
import org.json.JSONObject;
import bean.Json;

public class Forward extends Json {
    public String keyword;
    public int jumpNumber;
    @Override
    protected void init(JSONObject obj) {
        keyword = obj.optString("e1");
        jumpNumber = obj.optInt("e3");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj, "e1", keyword);
        put(obj, "e3", jumpNumber);
        return obj;
    }
}
