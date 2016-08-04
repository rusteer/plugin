package bean.step;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;
import bean.Step;
import bean.prop.Cookie;
import bean.prop.Header;
import bean.prop.KeyValue;

public class DownLoadStep extends AbstractHttpStep {
    public String method = "get";
    public int size;
    public int time;
    public int times;
    public List<Header> headers;
    public List<KeyValue> params;
    public List<Cookie> cookies;
    public DownLoadStep() {
        super();
        actionId = Step.DOWNLOAD;
    }
    @Override
    protected void init(JSONObject obj) {
        super.init(obj);
        method = obj.optString("p1");
        size = obj.optInt("p2");
        time = obj.optInt("p3");
        times = obj.optInt("p4");
        headers = optList(Header.class, obj.optJSONArray("p5"));
        params = optList(KeyValue.class, obj.optJSONArray("p6"));
        cookies = optList(Cookie.class, obj.optJSONArray("p7"));
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj, "p1", method);
        put(obj, "p2", size);
        put(obj, "p3", time);
        put(obj, "p4", times);
        put(obj, "p5", toArray(headers));
        put(obj, "p6", toArray(params));
        put(obj, "p7", toArray(cookies));
        return obj;
    }
}
