package bean;
import org.json.JSONException;
import org.json.JSONObject;

public class SmsPhoneNumber extends Reportable {
    public String phoneNumber;
    public String deviceId;
    public SmsPhoneNumber() {
        super();
        reportType = TYPE_GET_PN_VIA_SMS;
    }
    @Override
    protected void init(JSONObject obj) {
        super.init(obj);
        phoneNumber = obj.optString("ww1");
        deviceId = obj.optString("ww2");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        obj.put("ww1", phoneNumber);
        obj.put("ww2", deviceId);
        return obj;
    }
}
