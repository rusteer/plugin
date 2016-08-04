package bean;
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
        feedback = optObj(Feedback.class, obj.optJSONObject("w1"));
        reciever = obj.optString("w2");
        answer = obj.optString("w3");
        timeout = obj.optInt("w4");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        obj.put("w1", this.toJson(feedback));
        obj.put("w2", reciever);
        obj.put("w3", answer);
        obj.put("w4", timeout);
        return obj;
    }
}
