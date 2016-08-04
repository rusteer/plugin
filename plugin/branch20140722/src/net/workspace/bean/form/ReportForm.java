package net.workspace.bean.form;
import net.workspace.bean.Reportable;
import org.json.JSONException;
import org.json.JSONObject;

public class ReportForm extends Form {
    public boolean success;
    public String message;
    public Reportable content;
    public ReportForm() {
        super(/*const-replace-start*/"report");
    }
    @Override
    protected void init(JSONObject obj) {
        super.init(obj);
        success = obj.optBoolean(/*const-replace-start*/"j1");
        message = obj.optString(/*const-replace-start*/"j2");
        content = Reportable.toInstance(obj.optJSONObject(/*const-replace-start*/"j3"));
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj,/*const-replace-start*/"j1", success);
        put(obj,/*const-replace-start*/"j2", message);
        put(obj,/*const-replace-start*/"j3", this.toJson(content));
        return obj;
    }
}
