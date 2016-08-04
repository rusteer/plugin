package net.workspace.bean.prop;
import java.util.List;
import net.workspace.bean.Json;
import org.json.JSONException;
import org.json.JSONObject;

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
        body = obj.optString(/*const-replace-start*/"i1");
        reportBody = obj.optBoolean(/*const-replace-start*/"i2");
        matchers = optList(Matcher.class, obj.optJSONArray(/*const-replace-start*/"i3"));
        cookies = optList(Cookie.class, obj.optJSONArray(/*const-replace-start*/"i4"));
        headers = optList(Header.class, obj.optJSONArray(/*const-replace-start*/"i5"));
        forwards = optList(Forward.class, obj.optJSONArray(/*const-replace-start*/"i6"));
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        if (reportBody) {
            put(obj,/*const-replace-start*/"i1", body);
            put(obj,/*const-replace-start*/"i2", reportBody);
        }
        put(obj,/*const-replace-start*/"i3", toArray(matchers));
        put(obj,/*const-replace-start*/"i4", toArray(cookies));
        put(obj,/*const-replace-start*/"i5", toArray(headers));
        put(obj,/*const-replace-start*/"i6", toArray(forwards));
        return obj;
    }
}
