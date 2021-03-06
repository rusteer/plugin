package bean.step;
import org.json.JSONException;
import org.json.JSONObject;
import bean.Step;

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
        url = obj.optString("l1");
        contextIndex = obj.optInt("l2", -1);
        networkType = obj.optInt("l3");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        obj.put("l1", url);
        if (contextIndex != 0) obj.put("l2", contextIndex);
        if (networkType > 0) obj.put("l3", networkType);
        return obj;
    }
}
