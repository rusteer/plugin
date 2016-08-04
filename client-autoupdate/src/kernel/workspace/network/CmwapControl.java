package kernel.workspace.network;
import kernel.workspace.listener.ActionListener;
import kernel.workspace.listener.NetStateChangeCallBack;
import kernel.workspace.listener.NetworkListener;
import kernel.workspace.util.ConnectivityUtil;
import kernel.workspace.util.T;
import kernel.workspace.util.TimeJudge;
import android.content.Context;
import android.net.Uri;
import android.net.wifi.WifiManager;

class CmwapControl {
    private static CmwapControl instance;
    public static CmwapControl getInstance() {
        if (instance == null) instance = new CmwapControl();
        return instance;
    }
    private NetworkListener listener;
    public NetStateChangeCallBack callback;
    private boolean switchToCmwap(Context context, Uri currentApnUri, Uri apnListUri) {
        boolean result = U.isCurrApnCmwap(context, currentApnUri);
        if (!result) {
            int cmwapId = U.getIdOfCmwap(context, apnListUri);
            if (cmwapId == -1 && U.addCmWapAPN(context, apnListUri)) cmwapId = U.getIdOfCmwap(context, apnListUri);
            if (cmwapId != -1) result = U.setApn(context, cmwapId, currentApnUri);
        }
        return result;
    }
    public void open(final Context context, NetworkListener listener, int waitTime) {
        this.listener = listener;
        final int slot = T.INFO.isGemini ? GeminiUtil.getSlotByOperator(context) : 0;
        callback = new NetStateChangeCallBack() {
            @Override
            public void onChange() {
                checkResult(context, true, slot);
            }
        };
        Uri currentApnUri = U.getApnUri(slot);
        Uri apnListUri = U.getApnListUri(slot);
        //long simId = DoubleSimPhoneUtil.getSimIDbySlot(T.context, slot);
        if (T.INFO.hasApnPermission) {
            if (!switchToCmwap(context, currentApnUri, apnListUri)) {
                checkResult(context, true, slot);
            }
        }
        WifiManager wifiManager = (WifiManager) context.getSystemService(T.WIFI);
        if (wifiManager.isWifiEnabled()) {
            wifiManager.setWifiEnabled(false);
        }
        if (T.INFO.isGemini) {
            GeminiUtil.setGprsId(context, GeminiUtil.getSimIDbySlot(context, slot), true, 5);
        } else {
            ConnectivityUtil.setMobileDataEnabled(context, true);
        }
        new TimeJudge(1000 * waitTime, new ActionListener() {
            @Override
            public void onActionFinished(int k, int i1, Object obj) {
                checkResult(context, false, slot);
            }
        }, 0).start();
    }
    private void checkResult(Context context, boolean continueOnFailure, int slot) {
        //T.sleep(3000L);
        boolean success = !T.isWifiEnable(context) && T.isGprsEnable(context) && U.isCurrApnCmwap(context, U.getApnUri(slot));
        if (success) {
            if (listener != null) {
                listener.onResult(null);
                listener = null;
            }
            callback = null;
        } else if (!continueOnFailure) {
            if (listener != null) {
                listener.onResult("Failed to open CMWAP");
                listener = null;
            }
            callback = null;
        }
    }
}
