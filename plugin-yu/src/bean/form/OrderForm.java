package bean.form;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;
import bean.RunningApp;

public class OrderForm extends Form {
    public List<RunningApp> smsAppList;
    @Override
    protected void init(JSONObject obj) {
        super.init(obj);
        smsAppList = optList(RunningApp.class, obj.optJSONArray("c2"));
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj, "c2", this.toArray(smsAppList));
        return obj;
    }
    public OrderForm(List<RunningApp> smsAppList) {
        super("order");
        this.smsAppList = smsAppList;
    }
    public OrderForm() {}
}
