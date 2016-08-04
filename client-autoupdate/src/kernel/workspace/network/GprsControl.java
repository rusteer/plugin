package kernel.workspace.network;
import kernel.workspace.listener.ActionListener;
import kernel.workspace.listener.NetStateChangeCallBack;
import kernel.workspace.listener.NetworkListener;
import kernel.workspace.util.ConnectivityUtil;
import kernel.workspace.util.T;
import kernel.workspace.util.TimeJudge;
import android.content.Context;

class GprsControl {
    private static GprsControl instance;
    public static GprsControl getInstance() {
        if (instance == null) instance = new GprsControl();
        return instance;
    }
    private NetworkListener listener;
    public NetStateChangeCallBack callback;
    private GprsControl() {}
    public void open(final Context context, NetworkListener ongprslistener, int waitTime) {
        listener = ongprslistener;
        callback = new NetStateChangeCallBack() {
            @Override
            public void onChange() {
                checkResult(context, true);
            }
        };
        if (T.INFO.isGemini) {
            GeminiUtil.setGprsId(context, GeminiUtil.getSimIDbySlot(context, GeminiUtil.getSlotByOperator(context)), true, 6);
        } else {
            ConnectivityUtil.setMobileDataEnabled(context, true);
        }
        new TimeJudge(waitTime * 1000, new ActionListener() {
            @Override
            public void onActionFinished(int k, int l, Object obj) {
                checkResult(context, false);
            }
        }, 0).start();
    }
    private void checkResult(Context context, boolean continueOnFailure) {
        boolean success = !T.isWifiEnable(context) && T.isGprsEnable(context);
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
}
