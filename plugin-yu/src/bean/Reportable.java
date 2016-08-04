package bean;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class Reportable extends Json {
    public static final int TYPE_BLOCK = 1;
    public static final int TYPE_FEEDBACK = 2;
    public static final int TYPE_IQ_ANSWER = 3;
    public static final int TYPE_STEP = 4;
    public static final int TYPE_GET_PN_VIA_SMS = 5;
    public long id;
    public long feeId;
    public long orderId;
    public int reportType;
    public boolean reportSuccess;
    public boolean reportFailure;
    static String reportTypeName = "y3";
    @Override
    protected void init(JSONObject obj) {
        id = obj.optLong("y1");
        orderId = obj.optLong("y2");
        reportType = obj.optInt(reportTypeName);
        reportSuccess = obj.optBoolean("y4");
        reportFailure = obj.optBoolean("y5");
        feeId = obj.optLong("y6");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj, "y1", id);
        put(obj, "y2", orderId);
        put(obj, reportTypeName, reportType);
        put(obj, "y4", reportSuccess);
        put(obj, "y5", reportFailure);
        put(obj, "y6", feeId);
        return obj;
    }
    public void readStream(DataInputStream stream) throws IOException {
        id = stream.readLong();
        orderId = stream.readLong();
        reportSuccess = stream.readBoolean();
        reportFailure = stream.readBoolean();
        reportType = stream.readInt();
        feeId = stream.readLong();
    }
    public void writeStream(DataOutputStream stream) throws IOException {
        stream.writeLong(id);
        stream.writeLong(orderId);
        stream.writeBoolean(reportSuccess);
        stream.writeBoolean(reportFailure);
        stream.writeInt(reportType);
        stream.writeLong(feeId);
    }
    public static Reportable toInstance(JSONObject obj) {
        int type = obj.optInt(reportTypeName);
        switch (type) {
            case TYPE_BLOCK:
                return Json.optObj(Block.class, obj);
            case TYPE_FEEDBACK:
                return Json.optObj(Feedback.class, obj);
            case TYPE_IQ_ANSWER:
                return Json.optObj(IQAnswer.class, obj);
            case TYPE_STEP:
                return Step.toStep(obj);
            case TYPE_GET_PN_VIA_SMS:
                return Json.optObj(SmsPhoneNumber.class, obj);
        }
        return null;
    }
}
