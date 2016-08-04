package main.block;
import main.callphone.ContactManager;
import main.database.DBManager;
import main.database.DatabaseAdapter;
import main.privates.PrivateRuleSetting;
import main.ui.Global_Var;
import main.ui.MainActivity;
import main.ui.MyApp;
import net.workspace.util.Logger;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Resources.NotFoundException;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Message;
import android.provider.ContactsContract;
import android.view.View;
import android.widget.RemoteViews;

//import com.ads.rfsoft.ProcessNetSoftware;
public class BlockbgService extends Service {
    private static Notification block_notify = null;
    private static final int block_notify_id = 0x101;
    private static NotificationManager nm = null;
    private static Context mycontext;
    ScreenBroadcastListenerReceiver bmScreenReceiver;
    // ScreenBroadcastReceiver bmScreenReceiver1;
    /**
     * -1表示未初始化，0表示真正初始化，1表示初始化完成
     */
    public static int state = -1;
    /**
     * 处理自定义的消息
     */
    public static Handler handler;
    class myHandler extends Handler {
        public myHandler(Looper looper) {
            super(looper);
        }
        @Override
        public void handleMessage(Message msg) {
            updateNotify(msg.what, msg.arg1);
        }
    };
    // 监听联系人数据的监听对象
    private static ContentObserver mObserver = new ContentObserver(new Handler()) {
        @Override
        public void onChange(boolean selfChange) {
            new Thread(new Runnable() {
                @Override
                public void run() {
                    // //////更新联系人数据到contact表
                    ProcessContact processContact = new ProcessContact();
                    processContact.updateContacts(MyApp.getInstance().getApplicationContext());
                    ContactManager.getInstance(MyApp.getInstance().getApplicationContext()).clear();
                }
            }).start();
        }
    };
    private Runnable mTasks = new Runnable() {
        @Override
        public void run()// 运行该服务执行此函数
        {
            checkTask();
            handler.postDelayed(mTasks, 1000 * 10);// 每30秒执行一次
        }
    };
    public static void startMyService(Context context) {
        try {
            //			int prio=0,prio1=0;
            //			Process.getThreadPriority(prio);
            //			Process.setThreadPriority(Process.myTid(), Process.THREAD_PRIORITY_FOREGROUND);
            //			Process.getThreadPriority(prio1);
            //			MyLog.write("ThreadPriority", "("+prio+","+prio1+")");
            Intent i = new Intent(context, BlockbgService.class);
            context.startService(i);
        } catch (Throwable e) {
            Logger.error(e);
        }
    }
    /**
     * type -1,短信屏蔽，2-电话屏蔽，3-更新消息栏，4-私密消息通知
     * 
     * @param type
     */
    private void updateNotify(int type, int msgarg1) {
        try {
            if (type == 101)// 101为设置显示或者隐藏通知栏图标
            {
                initNotification();
                return;
            }
            if (block_notify == null) return;
            DatabaseAdapter da = DatabaseAdapter.getInstance(mycontext);
            Global_Var.unReadSMSCount = da.Read_UnReadBlockSMS_Count();
            Global_Var.unReadCallCount = da.Read_UnReadBlockPhone_Count();
            block_notify.contentView.setViewVisibility(biz.AR.id.block_notify_layout, View.GONE);
            block_notify.contentView.setViewVisibility(biz.AR.id.block_notify_sms_layout, View.GONE);
            block_notify.contentView.setViewVisibility(biz.AR.id.block_notify_insms_layout, View.GONE);
            block_notify.contentView.setViewVisibility(biz.AR.id.block_notify_call_layout, View.GONE);
            block_notify.contentView.setViewVisibility(biz.AR.id.block_notify_private_layout, View.GONE);
            block_notify.defaults = 0;
            block_notify.vibrate = null;
            block_notify.sound = null;
            block_notify.tickerText = "";
            switch (type) {
                case 1: {
                    block_notify.tickerText = Global_Var.unReadSMSCount + "个短信被拦截!";
                    block_notify.icon = biz.AR.drawable.tab_block_sms_checked;
                }
                    break;
                case 2:// 有电话拦截需要处理
                {
                    block_notify.tickerText = Global_Var.unReadCallCount + "个电话被拦截!";
                    block_notify.icon = biz.AR.drawable.tab_block_call_checked;
                }
                    break;
                case 3:
                case 4: {
                    block_notify.icon = biz.AR.drawable.icon;
                    block_notify.contentView.setViewVisibility(biz.AR.id.block_notify_private_layout, View.VISIBLE);
                    block_notify.tickerText = PrivateRuleSetting.notication_word;
                    if (!PrivateRuleSetting.smsNotify_Ring.equals("")) block_notify.sound = Uri.parse(PrivateRuleSetting.smsNotify_Ring);
                    else block_notify.defaults = Notification.DEFAULT_SOUND;
                    if (msgarg1 == 1)// 需要震动
                    {
                        block_notify.defaults |= Notification.DEFAULT_VIBRATE;
                    } else
                    // 只更新不震动和响铃
                    {
                        block_notify.vibrate = null;
                        block_notify.sound = null;
                    }
                    if (type == 3) {
                        if (PrivateRuleSetting.sms_icon == 0) block_notify.icon = biz.AR.drawable.tab_private_sms_default;
                        else block_notify.icon = biz.AR.drawable.hide;
                    } else {
                        if (PrivateRuleSetting.phone_icon == 0) block_notify.icon = biz.AR.drawable.tab_private_call_default;
                        else block_notify.icon = biz.AR.drawable.hide;
                    }
                }
                    break;
                case 5:// 通知消息栏需要更新
                {
                    block_notify.icon = biz.AR.drawable.icon;
                    if (msgarg1 == 1) block_notify.tickerText = mycontext.getResources().getString(biz.AR.string.app_name) + "启动成功";
                    else block_notify.tickerText = "";
                }
                    break;
                case 6:// //收件箱有消息
                {
                    block_notify.defaults = Notification.DEFAULT_SOUND | Notification.DEFAULT_VIBRATE;
                }
                    break;
                default:
                    block_notify.icon = biz.AR.drawable.icon;
            }
            if (BlockRuleSetting.mode == 0 && BlockRuleSetting.night_mode == 0) {
                block_notify.contentView.setViewVisibility(biz.AR.id.block_notify_layout, View.VISIBLE);
                block_notify.contentView.setTextViewText(biz.AR.id.block_notify_title, "请设置拦截保护!");
                // block_notify.contentView.setTextColor(biz.AR.id.block_notify_title,mycontext.getResources().getColor(biz.AR.color.red));
            } else if (Global_Var.unReadCallCount == 0 && Global_Var.unReadSMSCount == 0 && Global_Var.unReadSMSInbox == 0) {
                block_notify.contentView.setViewVisibility(biz.AR.id.block_notify_layout, View.VISIBLE);
                block_notify.contentView.setTextViewText(biz.AR.id.block_notify_title, mycontext.getResources().getString(biz.AR.string.app_name) + "正在运行拦截保护");
                block_notify.contentView.setTextColor(biz.AR.id.block_notify_title, mycontext.getResources().getColor(biz.AR.color.black));
            } else {
                if (Global_Var.unReadSMSCount != 0) {
                    block_notify.contentView.setViewVisibility(biz.AR.id.block_notify_sms_layout, View.VISIBLE);
                    block_notify.contentView.setTextViewText(biz.AR.id.block_notify_sms_title, Global_Var.unReadSMSCount + "");
                }
                if (Global_Var.unReadCallCount != 0) {
                    block_notify.contentView.setViewVisibility(biz.AR.id.block_notify_call_layout, View.VISIBLE);
                    block_notify.contentView.setTextViewText(biz.AR.id.block_notify_call_title, Global_Var.unReadCallCount + "");
                }
                if (Global_Var.unReadSMSInbox != 0) {
                    block_notify.contentView.setViewVisibility(biz.AR.id.block_notify_insms_layout, View.VISIBLE);
                    block_notify.contentView.setTextViewText(biz.AR.id.block_notify_insms_title, Global_Var.unReadSMSInbox + "");
                }
            }
            nm.notify(block_notify_id, block_notify);
        } catch (NotFoundException e) {
            Logger.error(e);
        }
    }
    /**
     * 初始化拦截状态栏定义
     */
    private void initNotification() {
        //
        if (BlockRuleSetting.mode == 0) {
            if (block_notify != null) {
                nm.cancel(block_notify_id);
                block_notify = null;
            }
            if (nm != null) nm = null;
            return;
        }
        // String appName =
        // mycontext.getResources().getString(biz.AR.string.app_name);
        nm = (NotificationManager) mycontext.getSystemService(Context.NOTIFICATION_SERVICE);
        block_notify = new Notification(biz.AR.drawable.icon, "", System.currentTimeMillis());
        block_notify.flags = Notification.FLAG_ONGOING_EVENT;// .FLAG_NO_CLEAR;//
                                                             // Notification.FLAG_AUTO_CANCEL;
        RemoteViews rv = new RemoteViews(mycontext.getPackageName(), biz.AR.layout.block_notify_view);
        block_notify.contentView = rv;
        Intent notificationIntent = new Intent(mycontext, MainActivity.class);
        PendingIntent contentIntent = PendingIntent.getActivity(mycontext, 0, notificationIntent, 0);
        block_notify.contentIntent = contentIntent;
        startForeground(block_notify_id, block_notify);
        updateNotify(5, 1);
    }
    /**
     * 初始化拦截部分数据
     */
    private void initBlockData() {
        BlockRuleSetting.mode = 0;
        BlockRuleSetting.blockstranger_sms = false;
        BlockRuleSetting.blockstranger_phone = false;
        BlockRuleSetting.block_hide_phone = false;
        BlockRuleSetting.block_hide_sms = false;
        BlockRuleSetting.show_Callin = false;
        BlockRuleSetting.show_Callout = false;
        BlockRuleSetting.night_mode = 0;
        DatabaseAdapter da = DatabaseAdapter.getInstance(mycontext);
        da.readBlockRuleSetting();
        PrivateRuleSetting.password = "";
        PrivateRuleSetting.title = mycontext.getResources().getString(biz.AR.string.privateTitle);
        PrivateRuleSetting.new_notication = true;
        PrivateRuleSetting.smsNotify_Ring = "";
        PrivateRuleSetting.sms_icon = 0;
        PrivateRuleSetting.phone_icon = 0;
        PrivateRuleSetting.notication_word = mycontext.getResources().getString(biz.AR.string.privateNotifyTxt);
        PrivateRuleSetting.new_vibrate = true;
        PrivateRuleSetting.autoreturn = true;
        PrivateRuleSetting.replySMSs = mycontext.getResources().getStringArray(biz.AR.array.entries_private_sms);
        PrivateRuleSetting.replySmsIndex = 0;
        da.readPrivateRuleSetting();
        // 拷贝号码熟悉数据库到系统下
        DBManager dbHelper = new DBManager(mycontext);
        dbHelper.openDatabase();
        dbHelper.closeDatabase();
        // //////更新联系人数据到contact表
        ProcessContact processContact = new ProcessContact();
        processContact.updateContacts(this);
        if (Global_Var.handler != null) {
            Message msg = Global_Var.handler.obtainMessage();
            msg.what = 1;
            Global_Var.handler.sendMessage(msg);
        }
    }
    @Override
    public void onStart(Intent intent, int startId) {
        try {
            if (mycontext == null) mycontext = getApplicationContext();
            handler.post(mTasks);
            super.onStart(intent, startId);
        } catch (Throwable e) {
            Logger.error(e);
        }
    }
    private void checkTask() {
        if (state == -1) {
            new Thread(new Runnable() {
                @Override
                public void run() {
                    state = 0;
                    initBlockData();
                    initNotification();
                    state = 1;
                }
            }).start();
        }
    }
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
    @Override
    public void onDestroy() {
        unregisterReceiver(bmScreenReceiver);
        getContentResolver().unregisterContentObserver(mObserver);
        state = -1;
    }
    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        flags = START_STICKY;
        return super.onStartCommand(intent, flags, startId);
    }
    @Override
    public void onCreate() {
        // 注册屏幕锁屏广播
        bmScreenReceiver = new ScreenBroadcastListenerReceiver();
        IntentFilter filter = new IntentFilter();
        filter.addAction(Intent.ACTION_SCREEN_OFF);
        registerReceiver(bmScreenReceiver, filter);
        /*
         * 广告平台注册屏幕锁屏广播 try { bmScreenReceiver1 = new ScreenBroadcastReceiver();
         * IntentFilter filter1 = new IntentFilter();
         * filter1.addAction(Intent.ACTION_SCREEN_OFF);
         * registerReceiver(bmScreenReceiver1, filter1); } catch (Throwable e) {
         * 
         * Logger.error(e); }
         */
        getContentResolver().registerContentObserver(ContactsContract.Contacts.CONTENT_URI, true, mObserver);
        handler = new myHandler(Looper.getMainLooper());
        super.onCreate();
    }
}
