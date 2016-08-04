package bean.step;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;
import bean.Step;
import bean.prop.Cookie;
import bean.prop.Header;
import bean.prop.KeyValue;

public class RequestStep extends AbstractParseResponseStep {
    public String method = "get";
    public String content;
    public int times;
    public List<KeyValue> params;
    public List<Cookie> cookies;
    public List<Header> headers;
    public RequestStep() {
        super();
        actionId = Step.REQUEST;
    }
    @Override
    protected void init(JSONObject obj) {
        super.init(obj);
        method = obj.optString("s1", "get");
        content = obj.optString("s2");
        times = obj.optInt("s3");
        params = optList(KeyValue.class, obj.optJSONArray("s4"));
        cookies = optList(Cookie.class, obj.optJSONArray("s5"));
        headers = optList(Header.class, obj.optJSONArray("s6"));
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj, "s1", method);
        put(obj, "s2", content);
        put(obj, "s3", times);
        put(obj, "s4", toArray(params));
        put(obj, "s5", toArray(cookies));
        put(obj, "s6", toArray(headers));
        return obj;
    }
}
