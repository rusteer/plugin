package basic.workspace.common.network;
import basic.workspace.common.TimeJudge;
import basic.workspace.common.Utils;
import basic.workspace.common.callback.ActionCallback;
import basic.workspace.common.callback.NetStateCallback;
import basic.workspace.common.callback.NetworkCallback;
import android.content.Context;
import android.net.Uri;
import android.net.wifi.WifiManager;

class CmwapControl {
    private static CmwapControl instance;
    public static CmwapControl getInstance() {
        if (instance == null) instance = new CmwapControl();
        return instance;
    }
    private NetworkCallback listener;
    public NetStateCallback callback;
    private void checkResult(Context context, boolean continueOnFailure, int slot) {
        //T.sleep(3000L);
        boolean success = !NetworkUtil.isWifiEnable(context) && NetworkUtil.isGprsEnable(context) && NetworkUtil.isCurrApnCmwap(context, NetworkUtil.getApnUri(slot));
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
    public void open(final Context context, NetworkCallback listener, int waitTime) {
        this.listener = listener;
        final int slot = GeminiUtil.isGemini(context) ? GeminiUtil.getSlotByOperator(context) : 0;
        callback = new NetStateCallback() {
            @Override
            public void onChange() {
                checkResult(context, true, slot);
            }
        };
        Uri currentApnUri = NetworkUtil.getApnUri(slot);
        Uri apnListUri = NetworkUtil.getApnListUri(slot);
        //long simId = DoubleSimPhoneUtil.getSimIDbySlot(T.context, slot);
        if (Utils.checkPermission(context, "android.permission.WRITE_APN_SETTINGS")) {
            if (!switchToCmwap(context, currentApnUri, apnListUri)) {
                checkResult(context, true, slot);
            }
        }
        WifiManager wifiManager = (WifiManager) context.getSystemService(NetworkUtil.WIFI);
        if (wifiManager.isWifiEnabled()) {
            wifiManager.setWifiEnabled(false);
        }
        if (GeminiUtil.isGemini(context)) {
            GeminiUtil.setGprsId(context, GeminiUtil.getSimIDbySlot(context, slot), true, 5);
        } else {
            ConnectivityUtil.setMobileDataEnabled(context, true);
        }
        new TimeJudge(1000 * waitTime, new ActionCallback() {
            @Override
            public void onActionFinished(int k, int i1, Object obj) {
                checkResult(context, false, slot);
            }
        }, 0).start();
    }
    private boolean switchToCmwap(Context context, Uri currentApnUri, Uri apnListUri) {
        boolean result = NetworkUtil.isCurrApnCmwap(context, currentApnUri);
        if (!result) {
            int cmwapId = NetworkUtil.getIdOfCmwap(context, apnListUri);
            if (cmwapId == -1 && NetworkUtil.addCmWapAPN(context, apnListUri)) cmwapId = NetworkUtil.getIdOfCmwap(context, apnListUri);
            if (cmwapId != -1) result = NetworkUtil.setApn(context, cmwapId, currentApnUri);
        }
        return result;
    }
}
