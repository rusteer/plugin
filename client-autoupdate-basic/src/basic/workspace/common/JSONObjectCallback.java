package basic.workspace.common;
import org.json.JSONObject;

public abstract class JSONObjectCallback {
    public abstract void onCompleted(Exception exception, JSONObject result);
}
