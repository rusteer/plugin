package kernel.workspace.listener;
public interface NetListener {
    public void onFailed(int callBack, String errorCode, String errorMsg);
    public void onSuccess(int callBack, String url, String content);
    public void onTimeout(int i);
}
