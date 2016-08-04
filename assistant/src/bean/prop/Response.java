package bean.prop;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;
import bean.Json;

public class Response extends Json {
    /**
     * Whether to upload body
     */
    public String body;
    public boolean reportBody;
    public List<Matcher> matchers;
    public List<Cookie> cookies;
    public List<Header> headers;
    public List<Forward> forwards;
    @Override
    protected void init(JSONObject obj) {
        body = obj.optString("i1");
        reportBody = obj.optBoolean("i2");
        matchers = optList(Matcher.class, obj.optJSONArray("i3"));
        cookies = optList(Cookie.class, obj.optJSONArray("i4"));
        headers = optList(Header.class, obj.optJSONArray("i5"));
        forwards = optList(Forward.class, obj.optJSONArray("i6"));
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        if (reportBody) {
            obj.put("i1", body);
            obj.put("i2", reportBody);
        }
        obj.put("i3", toArray(matchers));
        obj.put("i4", toArray(cookies));
        obj.put("i5", toArray(headers));
        obj.put("i6", toArray(forwards));
        return obj;
    }
}
