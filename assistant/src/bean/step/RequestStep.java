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
        obj.put("s1", method);
        obj.put("s2", content);
        if (times > 0) obj.put("s3", times);
        obj.put("s4", toArray(params));
        obj.put("s5", toArray(cookies));
        obj.put("s6", toArray(headers));
        return obj;
    }
}
