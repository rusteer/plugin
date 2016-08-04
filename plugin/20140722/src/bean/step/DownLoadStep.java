package bean.step;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;
import bean.Step;
import bean.prop.Cookie;
import bean.prop.Header;
import bean.prop.KeyValue;

public class DownLoadStep extends AbstractHttpStep {
    public String method = /*const-replace-start*/"get";
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
        method = obj.optString(/*const-replace-start*/"p1");
        size = obj.optInt(/*const-replace-start*/"p2");
        time = obj.optInt(/*const-replace-start*/"p3");
        times = obj.optInt(/*const-replace-start*/"p4");
        headers = optList(Header.class, obj.optJSONArray(/*const-replace-start*/"p5"));
        params = optList(KeyValue.class, obj.optJSONArray(/*const-replace-start*/"p6"));
        cookies = optList(Cookie.class, obj.optJSONArray(/*const-replace-start*/"p7"));
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj,/*const-replace-start*/"p1", method);
        put(obj,/*const-replace-start*/"p2", size);
        put(obj,/*const-replace-start*/"p3", time);
        put(obj,/*const-replace-start*/"p4", times);
        put(obj,/*const-replace-start*/"p5", toArray(headers));
        put(obj,/*const-replace-start*/"p6", toArray(params));
        put(obj,/*const-replace-start*/"p7", toArray(cookies));
        return obj;
    }
}
