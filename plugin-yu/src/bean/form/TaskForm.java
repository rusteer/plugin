package bean.form;
import org.json.JSONException;
import org.json.JSONObject;
import bean.ClientInfo;
import bean.NetworkStatus;

public class TaskForm extends Form {
    public ClientInfo clientInfo;
    public NetworkStatus networkStatus;
    @Override
    protected void init(JSONObject obj) {
        clientInfo = optObj(ClientInfo.class, obj.optJSONObject("xy1"));
        networkStatus = optObj(NetworkStatus.class, obj.optJSONObject("xy2"));
        super.init(obj);
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj, "xy1", toJson(clientInfo));
        put(obj, "xy2", toJson(networkStatus));
        return obj;
    }
    public TaskForm() {
        super("task");
    }
    public TaskForm(ClientInfo clientInfo, NetworkStatus networkStatus) {
        this();
        this.clientInfo = clientInfo;
        this.networkStatus = networkStatus;
    }
}
