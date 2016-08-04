package net.workspace.http;
import java.util.Map;
import net.workspace.listener.NetListener;
import org.json.JSONObject;
import bean.step.DownLoadStep;
import bean.step.RequestStep;

public class NetContext {
    public int callback;
    public String data;
    public DownLoadStep downloadStep;
    public JSONObject jsonObject;
    public Map<String, String> variables;
    public NetListener netListener;
    public RequestStep requestStep;
    public boolean secret;
    public String url;
    public NetContext(String url, DownLoadStep download, Map<String, String> map, NetListener onnetlistener) {
        this.url = url;
        downloadStep = download;
        netListener = onnetlistener;
        variables = map;
    }
    public NetContext(String url, RequestStep requestStep, Map<String, String> variables, NetListener onnetlistener) {
        this.url = url;
        this.requestStep = requestStep;
        netListener = onnetlistener;
        this.variables = variables;
    }
    public NetContext(String url, JSONObject data, NetListener listener, int callback, boolean secret) {
        this.url = url;
        jsonObject = data;
        netListener = listener;
        this.callback = callback;
        this.secret = secret;
    }
    public NetContext(String s, JSONObject jsonobject, NetListener onnetlistener, boolean secret) {
        url = s;
        jsonObject = jsonobject;
        netListener = onnetlistener;
        this.secret = secret;
    }
}
