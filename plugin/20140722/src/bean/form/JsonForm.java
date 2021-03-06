package bean.form;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;
import bean.prop.KeyValue;

public class JsonForm extends Form {
    public List<KeyValue> params;
    public JsonForm() {
        super(/*const-replace-start*/"json");
    }
    @Override
    protected void init(JSONObject obj) {
        super.init(obj);
        params = optList(KeyValue.class, obj.optJSONArray(/*const-replace-start*/"gg1"));
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj,/*const-replace-start*/"gg1", this.toArray(params));
        return obj;
    }
}
