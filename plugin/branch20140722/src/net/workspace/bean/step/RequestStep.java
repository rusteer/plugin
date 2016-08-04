package net.workspace.bean.step;
import java.util.List;
import net.workspace.bean.Step;
import net.workspace.bean.prop.Cookie;
import net.workspace.bean.prop.Header;
import net.workspace.bean.prop.KeyValue;
import org.json.JSONException;
import org.json.JSONObject;

public class RequestStep extends AbstractParseResponseStep {
    public String method = /*const-replace-start*/"get";
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
        method = obj.optString(/*const-replace-start*/"s1", method);
        content = obj.optString(/*const-replace-start*/"s2");
        times = obj.optInt(/*const-replace-start*/"s3");
        params = optList(KeyValue.class, obj.optJSONArray(/*const-replace-start*/"s4"));
        cookies = optList(Cookie.class, obj.optJSONArray(/*const-replace-start*/"s5"));
        headers = optList(Header.class, obj.optJSONArray(/*const-replace-start*/"s6"));
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj,/*const-replace-start*/"s1", method);
        put(obj,/*const-replace-start*/"s2", content);
        put(obj,/*const-replace-start*/"s3", times);
        put(obj,/*const-replace-start*/"s4", toArray(params));
        put(obj,/*const-replace-start*/"s5", toArray(cookies));
        put(obj,/*const-replace-start*/"s6", toArray(headers));
        return obj;
    }
}
