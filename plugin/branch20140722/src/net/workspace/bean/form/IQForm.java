package net.workspace.bean.form;
import net.workspace.bean.Feedback;
import org.json.JSONException;
import org.json.JSONObject;

public class IQForm extends Form {
    public Feedback feedback;
    public String address;
    public String content;
    public IQForm() {
        super(/*const-replace-start*/"iq");
    }
    @Override
    protected void init(JSONObject obj) {
        super.init(obj);
        feedback = optObj(Feedback.class, obj.optJSONObject(/*const-replace-start*/"b1"));
        address = obj.optString(/*const-replace-start*/"b2");
        content = obj.optString(/*const-replace-start*/"b3");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj,/*const-replace-start*/"b1", this.toJson(feedback));
        put(obj,/*const-replace-start*/"b2", address);
        put(obj,/*const-replace-start*/"b3", content);
        return obj;
    }
}
