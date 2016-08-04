package basic.workspace.common.network;
import basic.workspace.common.TimeJudge;
import basic.workspace.common.Utils;
import basic.workspace.common.bean.NetworkStatus;
import basic.workspace.common.callback.ActionCallback;
import basic.workspace.common.callback.NetStateCallback;
import basic.workspace.common.callback.NetworkCallback;
import android.content.Context;
import android.net.Uri;
import android.net.wifi.WifiManager;

public class NetworkController {
    private static NetworkStatus networkStatus = null;
    private static final Object locker = new Object();
    private static TimeJudge timer;
    private static void doCmwapTask(Context context, NetworkCallback listener) {
        if (NetworkUtil.isGprsEnable(context) && NetworkUtil.isCurrApnCmwap(context, NetworkUtil.CURRENT_APN_URI)) {
            listener.onResult(null);
            return;
        }
        CmwapControl.getInstance().open(context, listener, 60);
    }
    private static void doGprsTask(Context context, NetworkCallback listener) {
        if (NetworkUtil.isNetConnected(context)) {
            listener.onResult(null);
            return;
        }
        GprsControl.getInstance().open(context, listener, 60);
    }
    public static void doNetworkTask(Context context, final NetworkCallback listener) {
        doNetworkTask(context, 0, listener);
    }
    public static void doNetworkTask(Context context, int networkType, final NetworkCallback listener) {
        synchronized (locker) {
            if (networkStatus == null) {
                networkStatus = getNetworkStatus(context);
            }
        }
        refreshTimer(context);
        switch (networkType) {
            case 1://CMWAP
                doCmwapTask(context, listener);
                break;
            default:
                doGprsTask(context, listener);
                break;
        }
    }
    public static NetworkStatus getNetworkStatus(Context context) {
        NetworkStatus status = new NetworkStatus();
        status.wifiOpened = NetworkUtil.isWifiEnable(context);
        status.gprsOpened = NetworkUtil.isGprsEnable(context);
        if (GeminiUtil.isGemini(context)) {
            long simId = GeminiUtil.getGprsSimID(context);
            if (simId > 0) {
                status.slot = GeminiUtil.getSlotbySimID(context, simId);
            }
        }
        Uri currentApnUri = NetworkUtil.getApnUri(status.slot);
        status.apnId = NetworkUtil.getCurrApnId(context, currentApnUri);
        return status;
    }
    /**
     * Invoked by network receiver;
     */
    public static void onNetworkChanged() {
        NetStateCallback callback = CmwapControl.getInstance().callback;
        if (callback != null) callback.onChange();
        callback = GprsControl.getInstance().callback;
        if (callback != null) callback.onChange();
    }
    public static void refreshTimer(final Context context) {
        synchronized (locker) {
            if (timer != null) timer.close();
            timer = new TimeJudge(1000 * NetworkSettings.WORKFLOW_NETWORK_RESTORE_SECONDS, new ActionCallback() {
                @Override
                public void onActionFinished(int k, int i1, Object obj) {
                    restoreStatus(context);
                }
            }, 0);
            timer.start();
        }
    }
    private static void restoreStatus(Context context) {
        synchronized (locker) {
            if (networkStatus != null) {
                Uri currentApnUri = NetworkUtil.getApnUri(networkStatus.slot);
                if (networkStatus.apnId > 0 && Utils.checkPermission(context, "android.permission.WRITE_APN_SETTINGS")) {
                    NetworkUtil.setApn(context, networkStatus.apnId, currentApnUri);
                }
                if (GeminiUtil.isGemini(context)) {
                    long simId = networkStatus.gprsOpened ? GeminiUtil.getSimIDbySlot(context, networkStatus.slot) : 0;
                    GeminiUtil.setGprsId(context, simId, false, 5);
                } else {
                    ConnectivityUtil.setMobileDataEnabled(context, networkStatus.gprsOpened);
                }
                WifiManager wifimanager = (WifiManager) context.getSystemService(NetworkUtil.WIFI);
                wifimanager.setWifiEnabled(networkStatus.wifiOpened);
            }
            networkStatus = null;
        }
    }
}
