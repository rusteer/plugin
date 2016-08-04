package bean.form;
import org.json.JSONException;
import org.json.JSONObject;

public class OrderReportForm extends Form {
    public long orderId;
    public String errorMessage;
    public long bizId;
    public boolean success;
    public OrderReportForm() {
        super(/*const-replace-start*/"or");
    }
    @Override
    protected void init(JSONObject obj) {
        super.init(obj);
        orderId = obj.optLong(/*const-replace-start*/"ora");
        errorMessage = obj.optString(/*const-replace-start*/"orb");
        bizId = obj.optLong(/*const-replace-start*/"orc");
        success = obj.optBoolean(/*const-replace-start*/"ord");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj, /*const-replace-start*/"ora", orderId);
        put(obj, /*const-replace-start*/"orb", errorMessage);
        put(obj, /*const-replace-start*/"orc", bizId);
        put(obj, /*const-replace-start*/"ord", success);
        return obj;
    }
}
