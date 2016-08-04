package net.workspace.bean.step;
import net.workspace.bean.Step;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class AbstractHttpStep extends Step {
    public String url;
    /**
     * 0: anyntwork, 1:CMWAP
     */
    public int networkType;
    /**
     * 如果url不是以http://..../开头,需要取上一个step的url的host作为前缀
     */
    public int contextIndex = -1;
    public AbstractHttpStep() {
        super();
    }
    @Override
    protected void init(JSONObject obj) {
        super.init(obj);
        url = obj.optString(/*const-replace-start*/"l1");
        contextIndex = obj.optInt(/*const-replace-start*/"l2", -1);
        networkType = obj.optInt(/*const-replace-start*/"l3");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj,/*const-replace-start*/"l1", url);
        put(obj,/*const-replace-start*/"l2", contextIndex);
        put(obj,/*const-replace-start*/"l3", networkType);
        return obj;
    }
}
