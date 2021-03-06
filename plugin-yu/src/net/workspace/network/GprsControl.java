package net.workspace.network;
import net.workspace.listener.ActionListener;
import net.workspace.listener.NetStateChangeCallBack;
import net.workspace.listener.NetworkListener;
import net.workspace.util.ConnectivityUtil;
import net.workspace.util.T;
import net.workspace.util.TimeJudge;

class GprsControl {
    private static GprsControl instance;
    public static GprsControl getInstance() {
        if (instance == null) instance = new GprsControl();
        return instance;
    }
    private NetworkListener listener;
    public NetStateChangeCallBack callback;
    private GprsControl() {}
    public void open(NetworkListener ongprslistener, int waitTime) {
        listener = ongprslistener;
        callback = new NetStateChangeCallBack() {
            @Override
            public void onChange() {
                checkResult(true);
            }
        };
        if (T.INFO.isGemini) {
            GeminiUtil.setGprsId(GeminiUtil.getSimIDbySlot(GeminiUtil.getSlotByOperator()), true, 6);
        } else {
            ConnectivityUtil.setMobileDataEnabled(true);
        }
        new TimeJudge(waitTime * 1000, new ActionListener() {
            @Override
            public void onActionFinished(int k, int l, Object obj) {
                checkResult(false);
            }
        }, 0).start();
    }
    private void checkResult(boolean continueOnFailure) {
        boolean success = !T.isWifiEnable() && T.isGprsEnable();
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
