package net.workspace.bean.step;
import net.workspace.bean.Step;
import org.json.JSONException;
import org.json.JSONObject;

public class DelayStep extends Step {
    public int delayTime;
    public DelayStep() {
        super();
        actionId = Step.DELAY;
    }
    @Override
    protected void init(JSONObject obj) {
        super.init(obj);
        delayTime = obj.optInt(/*const-replace-start*/"o1");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj,/*const-replace-start*/"o1", delayTime);
        return obj;
    }
}
