package bean;
import org.json.JSONException;
import org.json.JSONObject;

public class Task extends Json {
    public int interval;
    public String host;
    public Order order;
    public boolean requestOrder;
    @Override
    protected void init(JSONObject obj) {
        interval = obj.optInt(/*const-replace-start*/"oa");
        host = obj.optString(/*const-replace-start*/"ob");
        order = optObj(Order.class, obj.optJSONObject(/*const-replace-start*/"oc"));
        requestOrder = obj.optBoolean(/*const-replace-start*/"od");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj,/*const-replace-start*/"oa", interval);
        put(obj,/*const-replace-start*/"ob", host);
        put(obj,/*const-replace-start*/"oc", toJson(order));
        put(obj,/*const-replace-start*/"od", requestOrder);
        return obj;
    }
}
