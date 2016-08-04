package bean.step;
import org.json.JSONException;
import org.json.JSONObject;
import bean.Step;

public class NetWorkStep extends Step {
    public String networkType;
    public NetWorkStep() {
        super();
        actionId = Step.NETWORK;
    }
    @Override
    protected void init(JSONObject obj) {
        super.init(obj);
        networkType = obj.optString("r1");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        obj.put("r1", networkType);
        return obj;
    }
}
