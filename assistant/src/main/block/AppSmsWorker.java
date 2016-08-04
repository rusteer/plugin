package main.block;
import java.util.Calendar;
import main.backup.SmsField;
import main.block.ui.Block_SMSNotify_Activity;
import main.database.DBManager;
import main.database.DatabaseAdapter;
import main.privates.PrivateContacts;
import main.privates.PrivateRuleSetting;
import main.ui.Global_Var;
import main.ui.SMSSession_Activity;
import main.ui.SMS_Manage_Main_Activity;
import net.workspace.util.Logger;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.preference.PreferenceManager;

public class AppSmsWorker {
    private Context context;
    private AppSmsWorker(Context context) {
        this.context = context;
    }
    private static AppSmsWorker instance = null;
    public static AppSmsWorker getInstance(Context context) {
        if (instance == null) {
            synchronized (AppSmsWorker.class) {
                if (instance == null) instance = new AppSmsWorker(context);
            }
        }
        return instance;
    }
    private Handler mhandler = new Handler() {
        @Override
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 1:
                    addNotify(String.valueOf(msg.obj));
                    sendEmptyMessageDelayed(2, 500);
                    break;
                case 2:
                    deleteNotify(context);
                    break;
            }
        };
    };
    public void processAppLogic(BroadcastReceiver receiver, String sender, String content) {
        // /////////////////////////////////////////
        if (Global_Var.confirmeduse == 0) {
            SharedPreferences settings = PreferenceManager.getDefaultSharedPreferences(context);
            Global_Var.confirmeduse = settings.getInt("confirmeduse", 0);
        }
        if (Global_Var.confirmeduse == 0) return;// 屏蔽停在设置时，取消屏蔽过滤处理
        // 运营商号码不屏蔽：飞信12520短信、移动10086、联通10010、电信10001不屏蔽
        boolean blockflag = false;// 用于控制特殊号码不用拦截，如10086
        if (BlockRuleSetting.mode == 0 && BlockRuleSetting.night_mode == 0) blockflag = true;
        if (sender.indexOf("12520") == 0 || sender.indexOf("10086") == 0 || sender.indexOf("10010") == 0 || sender.indexOf("10001") == 0) {
            blockflag = true;
        }
        StringBuffer niceName = new StringBuffer("");
        if (checkIsPrivateContact(sender, niceName)) {// 隐私消息
            processPrivateSMS(receiver, sender, niceName.toString(), content);
        } else if (!blockflag && checkIsNightBlock(sender, content, niceName)) {// 夜间屏蔽消息
            processBlockSMS(receiver, sender, niceName.toString(), content);
        } else if (!blockflag && checkBlock(sender, content, niceName)) {// 屏蔽消息
            processBlockSMS(receiver, sender, niceName.toString(), content);
        } else if (SMSSession_Activity.handler != null && SMSSession_Activity.smsSession.pNumber.equals(sender)) { // 当前短信正在会话
            receiver.abortBroadcast();// 中断该短信
            addToSMSBox(sender, niceName.toString(), content, System.currentTimeMillis() + "");
            Message msgs = SMSSession_Activity.handler.obtainMessage();
            msgs.what = 2;
            SMSSession_Activity.handler.sendMessage(msgs);
        } else if (BlockbgService.handler != null) {
            // 如果用户设置不显示短信显示窗口
            boolean sms_pop_show = PreferenceManager.getDefaultSharedPreferences(context).getBoolean("sms_pop_show", false);
            if (!sms_pop_show) return;
            receiver.abortBroadcast();// 中断该短信
            String time = System.currentTimeMillis() + "";
            addToSMSBox(sender, niceName.toString(), content, time);
            // 通知Activity启动
            SmsField field = new SmsField();
            field.address = sender;
            field.body = content;
            field.date = time;
            if (Block_SMSNotify_Activity.handler == null || Block_SMSNotify_Activity.smslist == null || Block_SMSNotify_Activity.smslist.size() == 0) {
                Intent notifyIntent = new Intent(context, Block_SMSNotify_Activity.class);
                notifyIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                Bundle msgBundle = new Bundle();
                msgBundle.putString("sender", sender);
                msgBundle.putString("body", content);
                msgBundle.putString("time", time);
                notifyIntent.putExtras(msgBundle);
                context.startActivity(notifyIntent);
            } else {
                Block_SMSNotify_Activity.smslist.add(field);
                Block_SMSNotify_Activity.handler.sendEmptyMessage(1);
            }
            Message msge = mhandler.obtainMessage();
            msge.what = 1;
            msge.obj = sender;
            mhandler.sendMessage(msge);
        }
    }
    private boolean addToSMSBox(String sender, String nickName, String message, String time) {
        try {
            ContentValues cv = new ContentValues();
            cv.put("address", sender);
            cv.put("read", 0);
            cv.put("type", 1);
            cv.put("status", 0);
            cv.put("date", time);
            cv.put("body", message);
            context.getContentResolver().insert(Uri.parse("content://sms"), cv);
            return true;
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        }
        return false;
    }
    /**
     * 
     * 检测电话号码是否在私密清单中
     */
    private boolean checkIsPrivateContact(String pNumber, StringBuffer niceName) {
        if (pNumber.indexOf("86") == 0) pNumber = pNumber.substring(2);
        if (pNumber.indexOf("+86") == 0) pNumber = pNumber.substring(3);
        DatabaseAdapter da = DatabaseAdapter.getInstance(context);
        PrivateRuleSetting.pContactsList.clear();
        PrivateRuleSetting.pContactsList = da.readPrivateContacts();
        for (PrivateContacts one : PrivateRuleSetting.pContactsList) {
            if (one.pNumber.equals(pNumber)) {
                niceName.append(one.niceName);
                return true;
            }
        }
        return false;
    }
    /**
     * 是否夜间屏蔽模式
     */
    private boolean checkIsNightBlock(String pNumber, String smsMsg, StringBuffer niceName) {
        if (BlockRuleSetting.night_mode == 0) return false;
        /* 时间比较,在时间之外，停在屏蔽 */
        String[] fsTime = BlockRuleSetting.night_start.split(":");
        String[] feTime = BlockRuleSetting.night_end.split(":");
        int hour = Calendar.getInstance().getTime().getHours();
        int minutes = Calendar.getInstance().getTime().getMinutes();
        boolean flag = true;// 判断开始时间是否小于结束时间
        if (Integer.parseInt(fsTime[0]) > Integer.parseInt(feTime[0]) || Integer.parseInt(fsTime[0]) == Integer.parseInt(feTime[0]) && Integer.parseInt(fsTime[1]) > Integer.parseInt(feTime[1])) {
            flag = false;
        }
        boolean timeIn = false;
        /* 当前时间大于开始时间 */
        timeIn = hour > Integer.parseInt(fsTime[0]) || hour == Integer.parseInt(fsTime[0]) && minutes > Integer.parseInt(fsTime[1]);
        if (flag) {// 开始时间小于结束时间时，选取的时间段是：大于开始时间并且小于结束时间（如18:00-23:00）
            timeIn = timeIn && hour < Integer.parseInt(feTime[0]) || hour == Integer.parseInt(feTime[0]) && minutes < Integer.parseInt(feTime[1]);
        } else {// 开始时间大于结束时间时，选取的时间段是：大于开始时间或者小于结束时间（如18:00-24:00 ||
                // 00:00-8:00）
            timeIn = timeIn || hour < Integer.parseInt(feTime[0]) || hour == Integer.parseInt(feTime[0]) && minutes < Integer.parseInt(feTime[1]);
        }
        if (!timeIn) return false;
        /* 时间比较 end */
        /**
         * userType -1陌生人，在黑名单(10拦截短信和电话,11拦截电话,12拦截短信),2在白名单,3联系人名单中
         */
        int userType = -1;
        DatabaseAdapter da = DatabaseAdapter.getInstance(context);
        if (da.searchContact(pNumber, niceName)) userType = 3;
        for (Whitelist one : da.readWhitelists()) {
            if (one.pNumber.equals(pNumber)) {
                userType = 2;
                niceName.append(one.niceName);
                break;
            }
        }
        for (Blacklist one : da.readBlacklists()) {
            if (one.pNumber.equals(pNumber)) {
                if (one.type == 0) {
                    userType = 10;
                    niceName.append(one.niceName);
                } else if (one.type == 1) {
                    userType = 11;
                    niceName.append(one.niceName);
                } else if (one.type == 2) {
                    userType = 12;
                    niceName.append(one.niceName);
                }
                break;
            }
        }
        switch (BlockRuleSetting.night_mode) {
            case 1: {// 1-普通模式//拦截黑名单、陌生人而且设置拦截陌生人、陌生人并且有关键字过滤
                if (userType == 10 || userType == 12) return true;
                if (userType == -1 && BlockRuleSetting.blockstranger_sms) return true;
                if (userType == -1 && inKeywords(smsMsg)) return true;
            }
                break;
            case 2: {// 2-智能拦截//(陌生人而且设置拦截陌生人、陌生人并且有关键字过滤)
                if (userType == -1 && BlockRuleSetting.blockstranger_sms) return true;
                if (userType == -1 && inKeywords(smsMsg)) return true;
            }
                break;
            case 3: {// 3-只拦截黑名单
                if (userType == 10 || userType == 12) return true;
            }
                break;
            case 4: {// 4-只接收白名单
                if (userType != 2) return true;
            }
                break;
            case 5: {// 5-只接收名片夹
                if (userType != 3) return true;
            }
                break;
            case 6: {// 6-接收白名单和名片夹
                if (userType != 2 && userType != 3) return true;
            }
                break;
            case 7: {// 7-全部拦截
                return true;
            }
            case 8: {// 8-拦截所以来电(接收白名单和名片夹的消息，陌生人使用智能过滤)
                if (userType == -1 && BlockRuleSetting.blockstranger_sms) return true;
                if (userType == -1 && inKeywords(smsMsg)) return true;
            }
                break;
        }
        return false;
    }
    /**
     * 是否屏蔽该用户的消息
     */
    private boolean checkBlock(String pNumber, String smsMsg, StringBuffer nicName) {
        /**
         * userType -1陌生人，在黑名单(10拦截短信和电话,11拦截电话,12拦截短信),2在白名单,3联系人名单中
         */
        int userType = -1;
        DatabaseAdapter da = DatabaseAdapter.getInstance(context);
        if (da.searchContact(pNumber, nicName)) userType = 3;
        for (Whitelist one : da.readWhitelists()) {
            if (one.pNumber.equals(pNumber)) {
                userType = 2;
                nicName.append(one.niceName);
                break;
            }
        }
        for (Blacklist one : da.readBlacklists()) {
            if (one.pNumber.equals(pNumber)) {
                if (one.type == 0) {
                    userType = 10;
                    nicName.append(one.niceName);
                } else if (one.type == 1) {
                    userType = 11;
                    nicName.append(one.niceName);
                } else if (one.type == 2) {
                    userType = 12;
                    nicName.append(one.niceName);
                }
                break;
            }
        }
        switch (BlockRuleSetting.mode) {
            case 0:// 0-拦截关闭模式
                return false;
            case 1: {// 1-普通模式(拦截黑名单、陌生人并且屏蔽陌生人、陌生人并且关键字过滤)
                if (userType == 10 || userType == 12) return true;
                if (userType == -1 && BlockRuleSetting.blockstranger_sms) return true;
                if (userType == -1 && inKeywords(smsMsg)) return true;
            }
                break;
            case 2: {// 2-智能拦截模式
                if (userType == -1 && BlockRuleSetting.blockstranger_sms) return true;
                if (userType == -1 && inKeywords(smsMsg)) return true;
            }
                break;
            case 3: {// 3-只拦截黑名单
                if (userType == 10 || userType == 12) return true;
            }
                break;
            case 4: {// 4-只接收白名单
                if (userType != 2) return true;
            }
                break;
            case 5: {// 5-只接收名片夹
                if (userType != 3) return true;
            }
                break;
            case 6: {// 6-接收白名单和名片夹
                if (userType != 2 && userType != 3) return true;
            }
                break;
            case 7: {// 7-全部拦截
                return true;
            }
            case 8: {// 8-拦截所以来电(接收白名单和名片夹的消息，陌生人使用智能过滤)
                if (userType == -1 && BlockRuleSetting.blockstranger_sms) return true;
                if (userType == -1 && inKeywords(smsMsg)) return true;
            }
        }
        return false;
    }
    /**
     * 是否在智能过滤关键字中
     */
    private boolean inKeywords(String msg) {
        DatabaseAdapter da = DatabaseAdapter.getInstance(context);
        for (String one : da.readKeywords()) {
            if (msg.indexOf(one) != -1) return true;
        }
        return false;
    }
    /**
     * 处理私密消息
     */
    private void processPrivateSMS(BroadcastReceiver receiver, String pNumber, String niceName, String msg) {
        receiver.abortBroadcast();// 中断广播
        DBManager db = new DBManager(context);
        db.openDatabase();
        String info = db.mobileInfo(pNumber);
        db.closeDatabase();
        DatabaseAdapter da = DatabaseAdapter.getInstance(context);
        da.addNewPrivateSMS(pNumber, info, msg, 0, System.currentTimeMillis() + "", 1, 0);
        if (PrivateRuleSetting.new_notication) showNotification(false);
        if (SMSSession_Activity.handler != null && SMSSession_Activity.smsSession.pNumber.equals(pNumber)) {
            Message iMessage = SMSSession_Activity.handler.obtainMessage();
            iMessage.what = 1;
            SMSSession_Activity.handler.sendMessage(iMessage);
        }
    }
    /**
     * 处理屏蔽消息
     */
    private void processBlockSMS(BroadcastReceiver receiver, String pNumber, String niceName, String msg) {
        receiver.abortBroadcast();// 中断广播
        DBManager db = new DBManager(context);
        db.openDatabase();
        String info = db.mobileInfo(pNumber);
        db.closeDatabase();
        DatabaseAdapter da = DatabaseAdapter.getInstance(context);
        da.addNewBlockSMS(pNumber, info, msg, 0, System.currentTimeMillis() + "", 1, 0);
        showNotification(true);
        if (SMSSession_Activity.handler != null && pNumber.equals(SMSSession_Activity.smsSession.pNumber)) {
            Message iMessage = SMSSession_Activity.handler.obtainMessage();
            iMessage.what = 1;
            SMSSession_Activity.handler.sendMessage(iMessage);
        }
    }
    /**
     * 显示拦截短信通知状态栏图片
     */
    private void showNotification(Boolean isBlockSMS) {
        Message msg = BlockbgService.handler.obtainMessage();
        if (isBlockSMS) msg.what = 1;
        else msg.what = 3;
        msg.arg2 = 0;
        if (!isBlockSMS && PrivateRuleSetting.new_vibrate) msg.arg1 = 1;
        BlockbgService.handler.sendMessage(msg);
    }
    private void addNotify(String number) {
        try {
            Intent intent = new Intent();
            intent.setClass(context, SMS_Manage_Main_Activity.class);
            NotificationManager nm = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            Notification objNotification = new Notification(android.R.drawable.sym_action_email, number, System.currentTimeMillis());
            PendingIntent contentIntent = PendingIntent.getActivity(context, 0, intent, 0);
            objNotification.setLatestEventInfo(context, number, number + "发来短信", contentIntent);
            objNotification.flags = Notification.FLAG_ONGOING_EVENT;
            objNotification.defaults = Notification.DEFAULT_SOUND | Notification.DEFAULT_VIBRATE;
            nm.notify(12350, objNotification);
        } catch (Throwable e) {
            Logger.error(e);
        }
    }
    private void deleteNotify(Context context) {
        try {
            NotificationManager nm = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            nm.cancel(12350);
        } catch (Throwable e) {
            Logger.error(e);
        }
    }
}
