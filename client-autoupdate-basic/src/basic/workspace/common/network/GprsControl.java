package basic.workspace.common.network;
import basic.workspace.common.TimeJudge;
import basic.workspace.common.callback.ActionCallback;
import basic.workspace.common.callback.NetStateCallback;
import basic.workspace.common.callback.NetworkCallback;
import android.content.Context;

class GprsControl {
    private static GprsControl instance;
    public static GprsControl getInstance() {
        if (instance == null) instance = new GprsControl();
        return instance;
    }
    private NetworkCallback listener;
    public NetStateCallback callback;
    private GprsControl() {}
    private void checkResult(Context context, boolean continueOnFailure) {
        boolean success = !NetworkUtil.isWifiEnable(context) && NetworkUtil.isGprsEnable(context);
        if (success) {
            if (listener != null) {
                listener.onResult(null);
                listener = null;
            }
            callback = null;
        } else if (!continueOnFailure) {
            if (listener != null) {
                listener.onResult("Fail to open GPRS");
                listener = null;
            }
            callback = null;
        }
    }
    public void open(final Context context, NetworkCallback ongprslistener, int waitTime) {
        listener = ongprslistener;
        callback = new NetStateCallback() {
            @Override
            public void onChange() {
                checkResult(context, true);
            }
        };
        if (GeminiUtil.isGemini(context)) {
            GeminiUtil.setGprsId(context, GeminiUtil.getSimIDbySlot(context, GeminiUtil.getSlotByOperator(context)), true, 6);
        } else {
            ConnectivityUtil.setMobileDataEnabled(context, true);
        }
        new TimeJudge(waitTime * 1000, new ActionCallback() {
            @Override
            public void onActionFinished(int k, int l, Object obj) {
                checkResult(context, false);
            }
        }, 0).start();
    }
}
