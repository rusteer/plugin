package bean.form;
import org.json.JSONException;
import org.json.JSONObject;
import bean.Feedback;

public class IQForm extends Form {
    public Feedback feedback;
    public String address;
    public String content;
    public IQForm() {}
    @Override
    protected void init(JSONObject obj) {
        super.init(obj);
        feedback = optObj(Feedback.class, obj.optJSONObject("b1"));
        address = obj.optString("b2");
        content = obj.optString("b3");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj, "b1", this.toJson(feedback));
        put(obj, "b2", address);
        put(obj, "b3", content);
        return obj;
    }
    public IQForm(Feedback feedback, String address, String content) {
        super("iq");
        this.feedback = feedback;
        this.address = address;
        this.content = content;
    }
}
