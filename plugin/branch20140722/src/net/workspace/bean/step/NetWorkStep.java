package net.workspace.bean.step;
import net.workspace.bean.Step;
import org.json.JSONException;
import org.json.JSONObject;

public class NetWorkStep extends Step {
    public String networkType;
    public NetWorkStep() {
        super();
        actionId = Step.NETWORK;
    }
    @Override
    protected void init(JSONObject obj) {
        super.init(obj);
        networkType = obj.optString(/*const-replace-start*/"r1");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj,/*const-replace-start*/"r1", networkType);
        return obj;
    }
}
