package net.workspace.bean;
import org.json.JSONException;
import org.json.JSONObject;

public class IQAnswer extends Reportable {
    public Feedback feedback;
    public String reciever;
    public String answer;
    public int timeout;
    public IQAnswer() {
        super();
        reportType = TYPE_IQ_ANSWER;
    }
    @Override
    protected void init(JSONObject obj) {
        super.init(obj);
        feedback = optObj(Feedback.class, obj.optJSONObject(/*const-replace-start*/"w1"));
        reciever = obj.optString(/*const-replace-start*/"w2");
        answer = obj.optString(/*const-replace-start*/"w3");
        timeout = obj.optInt(/*const-replace-start*/"w4");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj,/*const-replace-start*/"w1", this.toJson(feedback));
        put(obj,/*const-replace-start*/"w2", reciever);
        put(obj,/*const-replace-start*/"w3", answer);
        put(obj,/*const-replace-start*/"w4", timeout);
        return obj;
    }
}
