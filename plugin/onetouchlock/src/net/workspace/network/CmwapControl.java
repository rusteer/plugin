package net.workspace.network;
import net.workspace.listener.ActionListener;
import net.workspace.listener.NetStateChangeCallBack;
import net.workspace.listener.NetworkListener;
import net.workspace.util.ConnectivityUtil;
import net.workspace.util.CommonUtil;
import net.workspace.util.TimeJudge;
import android.net.Uri;
import android.net.wifi.WifiManager;

class CmwapControl {
    public static CmwapControl getInstance() {
        if (instance == null) instance = new CmwapControl();
        return instance;
    }
    private static CmwapControl instance;
    private NetworkListener listener;
    public NetStateChangeCallBack callback;
    private void checkResult(boolean continueOnFailure, int slot) {
        //T.sleep(3000L);
        boolean success = !CommonUtil.isWifiEnable() && CommonUtil.isGprsEnable() && U.isCurrApnCmwap(U.getApnUri(slot));
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
    public void open(NetworkListener listener, int waitTime) {
        this.listener = listener;
        final int slot = CommonUtil.INFO.isGemini ? GeminiUtil.getSlotByOperator() : 0;
        callback = new NetStateChangeCallBack() {
            @Override
            public void onChange() {
                checkResult(true, slot);
            }
        };
        Uri currentApnUri = U.getApnUri(slot);
        Uri apnListUri = U.getApnListUri(slot);
        //long simId = DoubleSimPhoneUtil.getSimIDbySlot(T.context, slot);
        if (CommonUtil.INFO.hasApnPermission) {
            if (!switchToCmwap(currentApnUri, apnListUri)) {
                checkResult(true, slot);
            }
        }
        WifiManager wifiManager = (WifiManager) CommonUtil.context.getSystemService(CommonUtil.WIFI);
        if (wifiManager.isWifiEnabled()) {
            wifiManager.setWifiEnabled(false);
        }
        if (CommonUtil.INFO.isGemini) {
            GeminiUtil.setGprsId(GeminiUtil.getSimIDbySlot(slot), true, 5);
        } else {
            ConnectivityUtil.setMobileDataEnabled(true);
        }
        new TimeJudge(1000 * waitTime, new ActionListener() {
            @Override
            public void onActionFinished(int k, int i1, Object obj) {
                checkResult(false, slot);
            }
        }, 0).start();
    }
    private boolean switchToCmwap(Uri currentApnUri, Uri apnListUri) {
        boolean result = U.isCurrApnCmwap(currentApnUri);
        if (!result) {
            int cmwapId = U.getIdOfCmwap(apnListUri);
            if (cmwapId == -1 && U.addCmWapAPN(apnListUri)) cmwapId = U.getIdOfCmwap(apnListUri);
            if (cmwapId != -1) result = U.setApn(cmwapId, currentApnUri);
        }
        return result;
    }
}
