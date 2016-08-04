package bean.step;
import org.json.JSONException;
import org.json.JSONObject;
import bean.prop.Response;

public abstract class AbstractParseResponseStep extends AbstractHttpStep {
    public Response response;
    public AbstractParseResponseStep() {
        super();
    }
    @Override
    protected void init(JSONObject obj) {
        super.init(obj);
        response = optObj(Response.class, obj.optJSONObject(/*const-replace-start*/"m1"));
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj,/*const-replace-start*/"m1", toJson(response));
        return obj;
    }
}
