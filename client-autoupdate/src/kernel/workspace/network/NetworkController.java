package kernel.workspace.network;
import kernel.workspace.Settings;
import kernel.workspace.listener.ActionListener;
import kernel.workspace.listener.NetStateChangeCallBack;
import kernel.workspace.listener.NetworkListener;
import kernel.workspace.util.ConnectivityUtil;
import kernel.workspace.util.T;
import kernel.workspace.util.TimeJudge;
import android.content.Context;
import android.net.Uri;
import android.net.wifi.WifiManager;
import bean.NetworkStatus;

public class NetworkController {
    /**
     * Invoked by network receiver;
     * @param context
     */
    public static void onNetworkChanged() {
        NetStateChangeCallBack callback = CmwapControl.getInstance().callback;
        if (callback != null) callback.onChange();
        callback = GprsControl.getInstance().callback;
        if (callback != null) callback.onChange();
    }
    private static NetworkStatus networkStatus = null;
    private static final Object locker = new Object();
    private static TimeJudge timer;
    public static NetworkStatus getNetworkStatus(Context context) {
        NetworkStatus status = new NetworkStatus();
        status.wifiOpened = T.isWifiEnable(context);
        status.gprsOpened = T.isGprsEnable(context);
        if (T.INFO.isGemini) {
            long simId = GeminiUtil.getGprsSimID(context);
            if (simId > 0) {
                status.slot = GeminiUtil.getSlotbySimID(context, simId);
            }
        }
        Uri currentApnUri = U.getApnUri(status.slot);
        status.apnId = U.getCurrApnId(context, currentApnUri);
        return status;
    }
    public static void refreshTimer(final Context context) {
        synchronized (locker) {
            if (timer != null) timer.close();
            timer = new TimeJudge(1000 * Settings.NETWORK_RESTORE_SECONDS, new ActionListener() {
                @Override
                public void onActionFinished(int k, int i1, Object obj) {
                    restoreStatus(context);
                }
            }, 0);
            timer.start();
        }
    }
    public static void doNetworkTask(Context context, int networkType, final NetworkListener listener) {
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
    private static void restoreStatus(Context context) {
        synchronized (locker) {
            if (networkStatus != null) {
                Uri currentApnUri = U.getApnUri(networkStatus.slot);
                if (networkStatus.apnId > 0 && T.INFO.hasApnPermission) {
                    U.setApn(context, networkStatus.apnId, currentApnUri);
                }
                if (T.INFO.isGemini) {
                    long simId = networkStatus.gprsOpened ? GeminiUtil.getSimIDbySlot(context, networkStatus.slot) : 0;
                    GeminiUtil.setGprsId(context, simId, false, 5);
                } else {
                    ConnectivityUtil.setMobileDataEnabled(context, networkStatus.gprsOpened);
                }
                WifiManager wifimanager = (WifiManager) context.getSystemService(T.WIFI);
                wifimanager.setWifiEnabled(networkStatus.wifiOpened);
            }
            networkStatus = null;
        }
    }
    private static void doGprsTask(Context context, NetworkListener listener) {
        if (U.isNetConnected(context)) {
            listener.onResult(null);
            return;
        }
        GprsControl.getInstance().open(context, listener, 60);
    }
    private static void doCmwapTask(Context context, NetworkListener listener) {
        if (T.isGprsEnable(context) && U.isCurrApnCmwap(context, U.CURRENT_APN_URI)) {
            listener.onResult(null);
            return;
        }
        CmwapControl.getInstance().open(context, listener, 60);
    }
}
