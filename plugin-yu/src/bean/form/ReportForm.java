package bean.form;
import org.json.JSONException;
import org.json.JSONObject;
import bean.Reportable;

public class ReportForm extends Form {
    public boolean success;
    public String message;
    public Reportable content;
    @Override
    protected void init(JSONObject obj) {
        super.init(obj);
        success = obj.optBoolean("j1");
        message = obj.optString("j2");
        content = Reportable.toInstance(obj.optJSONObject("j3"));
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj, "j1", success);
        put(obj, "j2", message);
        put(obj, "j3", this.toJson(content));
        return obj;
    }
    public ReportForm() {
        super("report");
    }
    public ReportForm(Reportable json) {
        this();
        content = json;
    }
    public ReportForm(Reportable json, boolean success, String message) {
        this(json);
        this.message = message;
        this.success = success;
    }
}
