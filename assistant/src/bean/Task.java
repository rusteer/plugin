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
        interval = obj.optInt("oa");
        host = obj.optString("ob");
        order = optObj(Order.class, obj.optJSONObject("oc"));
        requestOrder = obj.optBoolean("od");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        if (interval > 0) obj.put("oa", interval);
        obj.put("ob", host);
        obj.put("oc", toJson(order));
        if (requestOrder) obj.put("od", requestOrder);
        return obj;
    }
}
