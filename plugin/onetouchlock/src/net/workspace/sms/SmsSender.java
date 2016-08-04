package net.workspace.sms;
import net.workspace.listener.ActionListener;
import net.workspace.listener.SendSmsListener;
import net.workspace.network.GeminiUtil;
import net.workspace.util.CmdUtil;
import net.workspace.util.MyLogger;
import net.workspace.util.CommonUtil;
import net.workspace.util.TimeJudge;
import android.annotation.SuppressLint;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.telephony.SmsManager;
import android.text.TextUtils;

@SuppressLint("NewApi")
public class SmsSender {
    public static void sendSms(SendSmsListener listener, String address, String text, int timeout) {
        new SmsSender(listener).sendSms(address, text, timeout);
    }
    private static final String DELIVERED_SMS_ACTION = "fuckApktool";
    private static final String SEND_SMS_ACTION = "fuckJad";
    private SendSmsListener listener;
    private int sendSmsTimeout;
    private String destPhone;
    private boolean isRoot;
    private String message;
    private BroadcastReceiver receiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            switch (getResultCode()) {
                case -1:
                    success();
                    break;
                default:
                    failure("接收方接收短信失败");
            }
            context.unregisterReceiver(this);
        }
    };
    private BroadcastReceiver sendMessage = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            switch (getResultCode()) {
                case -1:
                    if (!isRoot || sendSmsTimeout == 0) {
                        success();
                    }
                    break; /* Loop/switch isn't completed */
                default:
                    failure("短信发送失败,resultCode=" + getResultCode());
                    break;
            }
            context.unregisterReceiver(this);
        }
    };
    public SmsSender(SendSmsListener listener) {
        try {
            this.listener = listener;
            isRoot = CmdUtil.isRoot();
            Context context = CommonUtil.context;
            context.registerReceiver(sendMessage, new IntentFilter(SEND_SMS_ACTION));
            context.registerReceiver(receiver, new IntentFilter(DELIVERED_SMS_ACTION));
        } catch (Exception e) {
            MyLogger.error(e);
            if (listener != null) {
                listener.onSendSmsFailed(null, null, "注册短信发送监听失败" + e.getMessage());
            }
        }
    }
    private void failure(String errorMsg) {
        if (listener != null) {
            listener.onSendSmsFailed(destPhone, message, errorMsg);
            listener = null;
        }
    }
    private void send(String destAddr, String text) {
        MyLogger.debug(destAddr, text);
        if (TextUtils.isEmpty(destAddr) || TextUtils.isEmpty(text)) {
            failure("发送号码或内容为空");
            return;
        }
        destPhone = destAddr;
        message = text;
        try {
            Context context = CommonUtil.context;
            PendingIntent sentIntent = PendingIntent.getBroadcast(context, 0, new Intent(SEND_SMS_ACTION), 0);
            PendingIntent deliveryIntent = PendingIntent.getBroadcast(context, 0, new Intent(DELIVERED_SMS_ACTION), 0);
            if (CommonUtil.INFO.isGemini) {
                GeminiUtil.sendSms(destAddr, text, sentIntent, deliveryIntent);
            } else {
                sendNormal(sentIntent, deliveryIntent);
            }
        } catch (Exception e) {
            MyLogger.error(e);
            failure("短信发送失败异常:" + CommonUtil.toString(e));
        }
    }
    private void sendNormal(PendingIntent sentIntent, PendingIntent deliveryIntent) {
        try {
            SmsManager manager = SmsManager.getDefault();
            if (message.length() <= 70) {
                manager.sendTextMessage(destPhone, null, message, sentIntent, deliveryIntent);
            } else {
                for (String child : manager.divideMessage(message)) {
                    manager.sendTextMessage(destPhone, null, child, sentIntent, deliveryIntent);
                }
            }
            if (isRoot && sendSmsTimeout > 0) new TimeJudge(1000 * sendSmsTimeout, new ActionListener() {
                @Override
                public void onActionFinished(int i, int j, Object obj) {
                    failure("接收方超时");
                }
            }, 0).start();
        } catch (Exception e) {
            MyLogger.error(e);
            failure("短信发送失败异常:" + CommonUtil.toString(e));
        }
    }
    public void sendSms(String number, String msg, int sendSmsTimeout) {
        this.sendSmsTimeout = sendSmsTimeout;
        send(number, msg);
    }
    private void success() {
        if (listener != null) {
            listener.onSendSmsSuccess(destPhone, message);
            listener = null;
        }
    }
}
