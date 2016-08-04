package net.workspace.bean.step;
import net.workspace.bean.Step;
import org.json.JSONException;
import org.json.JSONObject;

public class EndStep extends Step {
    public EndStep() {
        super();
        actionId = Step.END;
    }
    @Override
    protected void init(JSONObject obj) {
        super.init(obj);
    }
    @Override
    public JSONObject toJson() throws JSONException {
        return super.toJson();
    }
}