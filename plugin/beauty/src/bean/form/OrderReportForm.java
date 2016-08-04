package bean.form;
import org.json.JSONException;
import org.json.JSONObject;

public class OrderReportForm extends Form {
    public long orderId;
    public String errorMessage;
    public long bizId;
    public boolean success;
    public OrderReportForm() {
        super("or");
    }
    @Override
    protected void init(JSONObject obj) {
        super.init(obj);
        this.orderId = obj.optLong("ora");
        this.errorMessage = obj.optString("orb");
        this.bizId = obj.optLong("orc");
        this.success = obj.optBoolean("ord");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj, "ora", orderId);
        put(obj, "orb", errorMessage);
        put(obj, "orc", bizId);
        put(obj, "ord", success);
        return obj;
    }
}
