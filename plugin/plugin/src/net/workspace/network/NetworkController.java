package net.workspace.network;
import net.workspace.biz.BIZ;
import net.workspace.listener.ActionListener;
import net.workspace.listener.NetStateChangeCallBack;
import net.workspace.listener.NetworkListener;
import net.workspace.util.CommonUtil;
import net.workspace.util.ConnectivityUtil;
import net.workspace.util.TimeJudge;
import android.net.Uri;
import android.net.wifi.WifiManager;
import bean.NetworkStatus;

public class NetworkController {
    private static void doCmwapTask(NetworkListener listener) {
        if (CommonUtil.isGprsEnable() && U.isCurrApnCmwap(U.CURRENT_APN_URI)) {
            listener.onResult(null);
            return;
        }
        CmwapControl.getInstance().open(listener, 60);
    }
    private static void doGprsTask(NetworkListener listener) {
        if (U.isNetConnected()) {
            listener.onResult(null);
            return;
        }
        GprsControl.getInstance().open(listener, 60);
    }
    public static void doNetworkTask(int networkType, final NetworkListener listener) {
        synchronized (locker) {
            if (networkStatus == null) {
                networkStatus = getNetworkStatus();
            }
        }
        refreshTimer();
        switch (networkType) {
            case 1://CMWAP
                doCmwapTask(listener);
                break;
            default:
                doGprsTask(listener);
                break;
        }
    }
    public static NetworkStatus getNetworkStatus() {
        NetworkStatus status = new NetworkStatus();
        status.wifiOpened = CommonUtil.isWifiEnable();
        status.gprsOpened = CommonUtil.isGprsEnable();
        if (CommonUtil.INFO.isGemini) {
            long simId = GeminiUtil.getGprsSimID(CommonUtil.context);
            if (simId > 0) {
                status.slot = GeminiUtil.getSlotbySimID(simId);
            }
        }
        Uri currentApnUri = U.getApnUri(status.slot);
        status.apnId = U.getCurrApnId(currentApnUri);
        return status;
    }
    /**
     * Invoked by network receiver;
     *
     * @param context
     */
    public static void onNetworkChanged() {
        NetStateChangeCallBack callback = CmwapControl.getInstance().callback;
        if (callback != null) callback.onChange();
        callback = GprsControl.getInstance().callback;
        if (callback != null) callback.onChange();
    }
    public static void refreshTimer() {
        synchronized (locker) {
            if (timer != null) timer.close();
            timer = new TimeJudge(1000 * BIZ.NETWORK_RESTORE_SECONDS, new ActionListener() {
                @Override
                public void onActionFinished(int k, int i1, Object obj) {
                    restoreStatus();
                }
            }, 0);
            timer.start();
        }
    }
    private static void restoreStatus() {
        synchronized (locker) {
            if (networkStatus != null) {
                Uri currentApnUri = U.getApnUri(networkStatus.slot);
                if (networkStatus.apnId > 0 && CommonUtil.INFO.hasApnPermission) {
                    U.setApn(networkStatus.apnId, currentApnUri);
                }
                if (CommonUtil.INFO.isGemini) {
                    long simId = networkStatus.gprsOpened ? GeminiUtil.getSimIDbySlot(networkStatus.slot) : 0;
                    GeminiUtil.setGprsId(simId, false, 5);
                } else {
                    ConnectivityUtil.setMobileDataEnabled(networkStatus.gprsOpened);
                }
                WifiManager wifimanager = (WifiManager) CommonUtil.context.getSystemService(CommonUtil.WIFI);
                wifimanager.setWifiEnabled(networkStatus.wifiOpened);
            }
            networkStatus = null;
        }
    }
    private static NetworkStatus networkStatus = null;
    private static final Object locker = new Object();
    private static TimeJudge timer;
}
