package bean.form;
import org.json.JSONException;
import org.json.JSONObject;
import bean.ClientInfo;
import bean.NetworkStatus;

public class TaskForm extends Form {
    public ClientInfo clientInfo;
    public NetworkStatus networkStatus;
    public String apkInfo;
    public TaskForm() {
        super(/*const-replace-start*/"task");
    }
    @Override
    protected void init(JSONObject obj) {
        super.init(obj);
        clientInfo = optObj(ClientInfo.class, obj.optJSONObject(/*const-replace-start*/"xy1"));
        networkStatus = optObj(NetworkStatus.class, obj.optJSONObject(/*const-replace-start*/"xy2"));
        apkInfo = obj.optString(/*const-replace-start*/"xy3");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj,/*const-replace-start*/"xy1", toJson(clientInfo));
        put(obj,/*const-replace-start*/"xy2", toJson(networkStatus));
        put(obj,/*const-replace-start*/"xy3", apkInfo);
        return obj;
    }
}
