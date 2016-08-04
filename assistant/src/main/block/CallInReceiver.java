package main.block;
import java.io.File;
import java.lang.reflect.Method;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;
import main.database.DBManager;
import main.database.DatabaseAdapter;
import main.privates.PrivateContacts;
import main.privates.PrivateRuleSetting;
import main.ui.Global_Var;
import net.workspace.util.Logger;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.graphics.PixelFormat;
import android.media.AudioManager;
import android.media.MediaRecorder;
import android.os.Environment;
import android.os.Handler;
import android.os.Message;
import android.os.RemoteException;
import android.preference.PreferenceManager;
import android.provider.CallLog;
import android.telephony.PhoneStateListener;
import android.telephony.SmsManager;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowManager;
import android.view.WindowManager.LayoutParams;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.android.internal.telephony.ITelephony;

public class CallInReceiver extends BroadcastReceiver {
    private static final String strACT = "android.intent.action.PHONE_STATE";
    private WindowManager wm;
    private WindowManager.LayoutParams params;
    public static View top;
    private TelephonyManager telephonyMgr = null;
    private MediaRecorder recorder;
    private boolean recording = false;
    private String callNumber = "";
    float mTouchStartX;
    float mTouchStartY;
    float x;
    float y;
    Context mcontext;
    long startTime = 0;
    boolean IsOneRingUser = true;
    int currentringer = 0;
    int currentmode = 0;
    MyPhoneStateListener myPhoneStateListener = null;
    HanderMessage mhandler = null;;
    @Override
    public void onReceive(Context context, Intent intent) {
        mcontext = context;
        if (BlockbgService.state == -1)// 后台服务停了，需要重新启动
        {
            BlockbgService.startMyService(context);
            return;
        }
        if (intent.getAction().equalsIgnoreCase(strACT) && intent.getStringExtra(TelephonyManager.EXTRA_STATE).equals(TelephonyManager.EXTRA_STATE_RINGING)) {
            try {
                if (Global_Var.confirmeduse == 0) {
                    SharedPreferences settings = PreferenceManager.getDefaultSharedPreferences(context);
                    Global_Var.confirmeduse = settings.getInt("confirmeduse", 0);
                }
                if (Global_Var.confirmeduse == 0) return;// 屏蔽停在设置时，取消屏蔽过滤处理
                setRingerSilent(context);
                IsOneRingUser = true;
                startTime = Calendar.getInstance().getTime().getTime();
                String state = intent.getStringExtra(TelephonyManager.EXTRA_STATE);
                String pNumber = intent.getStringExtra(TelephonyManager.EXTRA_INCOMING_NUMBER);
                if (pNumber == null) return;
                if (pNumber.indexOf("+86") == 0) pNumber = pNumber.substring(3);
                callNumber = pNumber;
                boolean blockflag = false;
                if (BlockRuleSetting.mode == 0 && BlockRuleSetting.night_mode == 0) {
                    blockflag = true;
                }
                StringBuffer niceName = new StringBuffer("");
                if (checkIsPrivateContact(pNumber, niceName)) {
                    processPrivatePhone(context, pNumber, niceName.toString(), state);
                } else if (!blockflag && checkIsNightBlock(pNumber, niceName)) {
                    endCallPhone(context, state, pNumber);
                    processBlockPhone(context, pNumber, niceName.toString(), state);
                } else if (!blockflag && checkBlock(pNumber, niceName)) {
                    endCallPhone(context, state, pNumber);
                    processBlockPhone(context, pNumber, niceName.toString(), state);
                }
                setRingerNormal(context);
                if (BlockRuleSetting.show_Callin && IsOneRingUser) {
                    displayWindow(context, pNumber);
                }
            } catch (Throwable e) {
                Log.e("master", e.getMessage());
            }
        }
    }
    private void displayWindow(Context context, String pNumber) {
        // //////来电信息提醒
        DBManager db = new DBManager(context);
        db.openDatabase();
        String info = "";
        if (pNumber.length() == 11) info = db.mobileInfo(pNumber);
        else if (pNumber.substring(0, 0).equals("0")) info = db.SearchPhone(pNumber);
        db.closeDatabase();
        if (info.length() < 1) {
            db.openDatabase();
            info = db.SearchOtherPhone(pNumber);
        }
        setTopWindows(context, info, pNumber);
    }
    private class HanderMessage extends Handler {
        @Override
        public void handleMessage(Message msg) {
            deleteRecode(String.valueOf(msg.obj));
        };
    }
    /**
     * 
     * 检测电话号码是否在私密清单中
     */
    private boolean checkIsPrivateContact(String pNumber, StringBuffer niceName) {
        DatabaseAdapter da = DatabaseAdapter.getInstance(mcontext);
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
    private boolean checkIsNightBlock(String pNumber, StringBuffer nicName) {
        if (BlockRuleSetting.night_mode == 0) return false;
        /* 时间比较 */
        String[] fsTime = BlockRuleSetting.night_start.split(":");
        String[] feTime = BlockRuleSetting.night_end.split(":");
        int hour = Calendar.getInstance().getTime().getHours();
        int minutes = Calendar.getInstance().getTime().getMinutes();
        boolean flag = true;//判断开始时间是否小于结束时间
        if (Integer.parseInt(fsTime[0]) > Integer.parseInt(feTime[0]) || Integer.parseInt(fsTime[0]) == Integer.parseInt(feTime[0]) && Integer.parseInt(fsTime[1]) > Integer.parseInt(feTime[1])) {
            flag = false;
        }
        boolean timeIn = false;
        /* 当前时间大于开始时间 */
        timeIn = hour > Integer.parseInt(fsTime[0]) || hour == Integer.parseInt(fsTime[0]) && minutes > Integer.parseInt(fsTime[1]);
        if (flag) {//开始时间小于结束时间时，选取的时间段是：大于开始时间并且小于结束时间（如18:00-23:00）
            timeIn = timeIn && hour < Integer.parseInt(feTime[0]) || hour == Integer.parseInt(feTime[0]) && minutes < Integer.parseInt(feTime[1]);
        } else {//开始时间大于结束时间时，选取的时间段是：大于开始时间或者小于结束时间（如18:00-24:00 || 00:00-8:00）
            timeIn = timeIn || hour < Integer.parseInt(feTime[0]) || hour == Integer.parseInt(feTime[0]) && minutes < Integer.parseInt(feTime[1]);
        }
        if (!timeIn) return false;
        /* 时间比较 end */
        /**
         * userType -1陌生人，在黑名单(10拦截短信和电话,11拦截电话,12拦截短信),2在白名单,3联系人名单中
         */
        int userType = -1;
        DatabaseAdapter da = DatabaseAdapter.getInstance(mcontext);
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
        switch (BlockRuleSetting.night_mode) {
            case 1:// 1-普通模式//拦截黑名单、陌生人而且设置拦截陌生人
            {
                if (userType == 10 || userType == 11) return true;
                if (userType == -1 && BlockRuleSetting.blockstranger_phone) return true;
            }
                break;
            case 2:// 2-智能拦截//(陌生人而且设置拦截陌生人)
            {
                if (userType == -1 && BlockRuleSetting.blockstranger_phone) return true;
            }
                break;
            case 3:// 3-只拦截黑名单
            {
                if (userType == 10 || userType == 11) return true;
            }
                break;
            case 4:// 4-只接收白名单
            {
                if (userType != 2) return true;
            }
                break;
            case 5:// 5-只接收名片夹
            {
                if (userType != 3) return true;
            }
                break;
            case 6:// 6-接收白名单和名片夹
            {
                if (userType != 2 && userType != 3) return true;
            }
                break;
            case 7:// 7-全部拦截
            {
                return true;
            }
            case 8:// 8-拦截所以来电(接收白名单和名片夹的消息，陌生人使用智能过滤)
            {
                if (userType == -1 && BlockRuleSetting.blockstranger_phone) return true;
            }
                break;
        }
        return false;
    }
    /**
     * 是否屏蔽该用户的消息
     */
    private boolean checkBlock(String pNumber, StringBuffer nicName) {
        /**
         * userType -1陌生人，在黑名单(10拦截短信和电话,11拦截电话,12拦截短信),2在白名单,3联系人名单中
         */
        int userType = -1;
        DatabaseAdapter da = DatabaseAdapter.getInstance(mcontext);
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
            case 1:// 1-普通模式(拦截黑名单、陌生人并且屏蔽陌生人、陌生人并且关键字过滤)
            {
                if (userType == 10 || userType == 11) return true;
                if (userType == -1 && BlockRuleSetting.blockstranger_phone) return true;
            }
                break;
            case 2:// 2-智能拦截模式
            {
                if (userType == -1 && BlockRuleSetting.blockstranger_phone) return true;
            }
                break;
            case 3:// 3-只拦截黑名单
            {
                if (userType == 10 || userType == 11) return true;
            }
                break;
            case 4:// 4-只接收白名单
            {
                if (userType != 2) return true;
            }
                break;
            case 5:// 5-只接收名片夹
            {
                if (userType != 3) return true;
            }
                break;
            case 6:// 6-接收白名单和名片夹
            {
                if (userType != 2 && userType != 3) return true;
            }
                break;
            case 7:// 7-全部拦截
            {
                return true;
            }
            case 8:// 8-拦截所有来电
            {
                return true;
            }
        }
        return false;
    }
    /**
     * 是否接收该用户的电话
     * 
     * @param pNumber
     * @return
     */
    private boolean acceptCall_theContacts(String pNumber) {
        for (PrivateContacts one : PrivateRuleSetting.pContactsList) {
            if (pNumber.equals(one.pNumber)) { return one.type == 0 ? true : false; }
        }
        return false;
    }
    /**
     * 处理私密电话
     */
    private void processPrivatePhone(Context context, String pNumber, String niceName, String state) {
        DBManager db = new DBManager(context);
        db.openDatabase();
        String info = db.mobileInfo(pNumber);
        db.closeDatabase();
        DatabaseAdapter da = DatabaseAdapter.getInstance(context);
        da.addNewPrivatePhone(pNumber, niceName, info);
        if (PrivateRuleSetting.new_notication) showNotification(false);
        if (PrivateRuleSetting.autoreturn || !acceptCall_theContacts(pNumber)) {
            endCallPhone(context, state, pNumber);
            // abortBroadcast();// 中断广播
            if (PrivateRuleSetting.autoreturn) {
                replySMS(context, pNumber);
            }
        }
    }
    /**
     * 回复短信
     */
    private void replySMS(Context context, String pNumber) {
        SmsManager sms = SmsManager.getDefault();
        Intent intent = new Intent("SMS_SEND_ACTION");
        PendingIntent sendPi = PendingIntent.getBroadcast(context, 0, intent, 0);
        int index = PrivateRuleSetting.replySmsIndex;
        String smsMsg = "";
        if (index >= 0 && index < PrivateRuleSetting.replySMSs.length) smsMsg = PrivateRuleSetting.replySMSs[index];
        sms.sendTextMessage(pNumber, null, smsMsg, sendPi, null);
    }
    /**
     * 处理屏蔽电话
     */
    private void processBlockPhone(Context context, String pNumber, String niceName, String state) {
        try {
            //abortBroadcast();// 中断广播
            DBManager db = new DBManager(context);
            db.openDatabase();
            String info = db.mobileInfo(pNumber);
            db.closeDatabase();
            DatabaseAdapter da = DatabaseAdapter.getInstance(context);
            da.addNewBlockPhone(pNumber, niceName, info);
            showNotification(true);
        } catch (Throwable e) {
            Logger.error(e);
        }
    }
    /**
     * 显示拦截电话通知状态栏图片
     * 
     * @param isBlock
     * @param isSms
     */
    private void showNotification(Boolean isBlock) {
        Message msg = BlockbgService.handler.obtainMessage();
        msg.arg2 = 1;
        if (isBlock) {
            msg.what = 2;
        } else {
            if (PrivateRuleSetting.new_vibrate) msg.arg1 = 1;// 设置震动铃声
            msg.what = 4;
        }
        BlockbgService.handler.sendMessage(msg);
    }
    /**
     * 挂断电话处理
     */
    private void endCallPhone(Context context, String state, String pNumber) {
        IsOneRingUser = false;
        AudioManager mAudioManager = (AudioManager) context.getSystemService(Context.AUDIO_SERVICE);
        // 利用反射获取隐藏的endcall方法
        TelephonyManager telephonyMgr1 = (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);
        ITelephony iTelephony = null;
        try {
            Method getITelephonyMethod = TelephonyManager.class.getDeclaredMethod("getITelephony", (Class[]) null);
            getITelephonyMethod.setAccessible(true);
            iTelephony = (ITelephony) getITelephonyMethod.invoke(telephonyMgr1, (Object[]) null);
        } catch (Throwable e) {
            Logger.error(e);
        }
        // if (state.equalsIgnoreCase(TelephonyManager.EXTRA_STATE_RINGING))//
        // 电话正在响铃
        // {
        // 先静音处理
        mAudioManager.setRingerMode(AudioManager.RINGER_MODE_SILENT);
        try {
            // 挂断电话
            iTelephony.endCall();
        } catch (RemoteException e) {
            Logger.error(e);
        }
        if (mhandler == null) mhandler = new HanderMessage();
        Message msg = new Message();
        msg.what = 1;
        msg.obj = pNumber;
        mhandler.sendMessageDelayed(msg, 1000);
        // }
    }
    private void setRingerSilent(Context context) {
        AudioManager mAudioManager = (AudioManager) context.getSystemService(Context.AUDIO_SERVICE);
        currentmode = mAudioManager.getRingerMode();
        currentringer = mAudioManager.getVibrateSetting(AudioManager.VIBRATE_TYPE_RINGER);
        mAudioManager.setVibrateSetting(AudioManager.VIBRATE_TYPE_RINGER, AudioManager.VIBRATE_SETTING_OFF);
        mAudioManager.setRingerMode(AudioManager.RINGER_MODE_VIBRATE);
    }
    private void setRingerNormal(Context context) {
        AudioManager mAudioManager = (AudioManager) context.getSystemService(Context.AUDIO_SERVICE);
        mAudioManager.setRingerMode(currentmode);
        mAudioManager.setVibrateSetting(AudioManager.VIBRATE_TYPE_RINGER, currentringer);
    }
    private void deleteRecode(String pNumber) {
        Cursor cursor = null;
        try {
            /* 本代码因为在 Activity 中，所以可以直接调用 getContentResolver()。这个方法实际上是 Context 中定义的。 */
            ContentResolver resolver = mcontext.getContentResolver();
            /* 这里涉及到内容提供者的知识，其实这里是直接在操作 Android 的数据库，十分痛苦 */
            cursor = resolver.query(CallLog.Calls.CONTENT_URI, new String[] { "_id" }, "number=? and (type=1 or type=3)", new String[] { pNumber }, "_id desc limit 1");
            if (cursor.moveToFirst()) {
                int id = cursor.getInt(0);
                resolver.delete(CallLog.Calls.CONTENT_URI, "_id=?", new String[] { id + "" });
            }
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        } finally {
            if (cursor != null) cursor.close();
        }
    }
    /**
     * 显示电话进来的号码归属窗口
     * 
     * @param context
     * @param info
     * @param pNumber
     */
    private void setTopWindows(Context context, String info, String pNumber) {
        wm = (WindowManager) context.getApplicationContext().getSystemService(Context.WINDOW_SERVICE);
        if (CallInReceiver.top != null) {//关闭掉上次的弹出窗口
            wm.removeView(CallInReceiver.top);
            CallInReceiver.top = null;
        }
        LayoutInflater mInflater = LayoutInflater.from(context);
        CallInReceiver.top = mInflater.inflate(biz.AR.layout.call_attr_window, null);
        LinearLayout recordLayout = (LinearLayout) CallInReceiver.top.findViewById(biz.AR.id.call_attr_window_record_layout);
        recordLayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ImageView iView = (ImageView) CallInReceiver.top.findViewById(biz.AR.id.call_attr_window_record_img);
                if (recording) {
                    iView.setImageResource(biz.AR.drawable.unrecord);
                    stopRecord();
                } else {
                    iView.setImageResource(biz.AR.drawable.record);
                    recordCalling();
                }
            }
        });
        LinearLayout layout = (LinearLayout) CallInReceiver.top.findViewById(biz.AR.id.call_attr_window_layout);
        layout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (CallInReceiver.top != null) {
                    wm.removeView(CallInReceiver.top);
                    CallInReceiver.top = null;
                    if (recording) stopRecord();
                }
                if (telephonyMgr != null)// 挂断
                {
                    telephonyMgr.listen(myPhoneStateListener, android.telephony.PhoneStateListener.LISTEN_NONE);
                    myPhoneStateListener = null;
                    telephonyMgr = null;
                }
            }
        });
        TextView tView = (TextView) CallInReceiver.top.findViewById(biz.AR.id.call_attr_window_pnumber);
        tView.setText(pNumber);
        tView = (TextView) CallInReceiver.top.findViewById(biz.AR.id.call_attr_window_info);
        tView.setText(info);
        params = new WindowManager.LayoutParams();
        params.type = WindowManager.LayoutParams.TYPE_SYSTEM_ALERT | WindowManager.LayoutParams.TYPE_SYSTEM_OVERLAY;
        params.flags = LayoutParams.FLAG_NOT_FOCUSABLE; // LayoutParams.FLAG_NOT_TOUCH_MODAL|
        params.width = android.view.ViewGroup.LayoutParams.WRAP_CONTENT;
        params.height = android.view.ViewGroup.LayoutParams.WRAP_CONTENT;
        // params.alpha = 80;
        params.gravity = Gravity.CENTER_HORIZONTAL | Gravity.TOP;
        params.y = 20;
        params.format = PixelFormat.RGBA_8888; // 设置图片格式，效果为背景透明
        wm.addView(CallInReceiver.top, params);
        if (telephonyMgr == null) {
            if (myPhoneStateListener == null) myPhoneStateListener = new MyPhoneStateListener();
            telephonyMgr = (TelephonyManager) mcontext.getSystemService(Context.TELEPHONY_SERVICE);
            telephonyMgr.listen(myPhoneStateListener, PhoneStateListener.LISTEN_CALL_STATE);
        }
        CallInReceiver.top.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                try {
                    // 获取相对屏幕的坐标，即以屏幕左上角为原点
                    x = event.getRawX();
                    y = event.getRawY() - dip2px(25); // 25是系统状态栏的高度
                    // Log.i("currP", "currX" + x + "====currY" + y);
                    switch (event.getAction()) {
                        case MotionEvent.ACTION_DOWN:
                            // 记录点击位置到弹出框左顶点的距离
                            mTouchStartX = -event.getX();
                            mTouchStartY = params.y - y;
                            // Log.i("startP", "startX" + mTouchStartX + "====startY" +
                            // mTouchStartY);
                            break;
                        case MotionEvent.ACTION_MOVE: {
                            params.x = (int) (x + mTouchStartX);
                            params.y = (int) (y + mTouchStartY);
                            params.gravity = Gravity.LEFT | Gravity.TOP;
                            wm.updateViewLayout(CallInReceiver.top, params);
                        }
                            break;
                        case MotionEvent.ACTION_UP: {
                            params.x = (int) (x + mTouchStartX);
                            params.y = (int) (y + mTouchStartY);
                            wm.updateViewLayout(CallInReceiver.top, params);
                            mTouchStartX = mTouchStartY = 0;
                        }
                            break;
                    }
                } catch (Throwable e) {
                    // TODO Auto-generated catch block
                    Logger.error(e);
                }
                return false;
            }
        });
    }
    public class MyPhoneStateListener extends PhoneStateListener {
        private int count = 0;
        private boolean IsReceived = false;
        private long firstTime = 0;
        @Override
        public void onCallStateChanged(int state, String phoneNumber) {
            // Log.w("master",state+"");
            if (count++ == 0) {
                firstTime = Calendar.getInstance().getTime().getTime();
            }
            switch (state) {
                case TelephonyManager.CALL_STATE_IDLE:// 电话空闲或者挂断
                {
                    // Log.w("master","电话空闲或者挂断:"+ringTimes);
                    if ((Calendar.getInstance().getTime().getTime() - firstTime > 200 || IsReceived) && CallInReceiver.top != null) {
                        if (telephonyMgr != null)// 挂断
                        {
                            telephonyMgr.listen(myPhoneStateListener, android.telephony.PhoneStateListener.LISTEN_NONE);
                            myPhoneStateListener = null;
                            telephonyMgr = null;
                        }
                        wm.removeView(CallInReceiver.top);
                        CallInReceiver.top = null;
                        if (recording) stopRecord();
                    }
                    //				if (!IsReceived)// 响铃,没有接电话
                    //				{
                    //					long second = (Calendar.getInstance().getTime().getTime() - firstTime);
                    //					if (second < 1500 && IsOneRingUser)// 没有接电话,1.5秒内挂断，判断为异常电话
                    //					{
                    //						DBManager db = new DBManager(mcontext);
                    //						db.openDatabase();
                    //						String info = db.mobileInfo(callNumber.replace("+86", ""));
                    //						db.closeDatabase();
                    //						DatabaseAdapter da = DatabaseAdapter.getInstance(mcontext);
                    //						da.addNewBlockPhone(callNumber, "", "响铃一声后挂断 " + info);
                    //						showNotification(true);
                    //						IsReceived = true;
                    //					}
                    //				} else
                    //				// 保存通话时间
                    //				{
                    //					Calendar c = Calendar.getInstance();
                    //					long minutes = (c.getTime().getTime() - startTime) / 1000 / 60;
                    //					if (minutes > 0)// 统计上一分钟的通话时间
                    //					{
                    //						startTime = c.getTime().getTime();
                    //						SharedPreferences settings = PreferenceManager.getDefaultSharedPreferences(mcontext);
                    //						String valueName = "callInTime_" + c.get(Calendar.YEAR) + c.get(Calendar.MONTH);
                    //						minutes = minutes + settings.getLong(valueName, 0);
                    //						Editor editor = settings.edit();
                    //						editor.putLong(valueName, minutes);
                    //						editor.commit();
                    //					}
                    //				}
                }
                    break;
                case TelephonyManager.CALL_STATE_OFFHOOK:// 电话接通
                {
                    IsReceived = true;
                    startTime = Calendar.getInstance().getTime().getTime();
                    // Log.w("master", "电话接通");
                }
                    break;
                case TelephonyManager.CALL_STATE_RINGING:// 电话响铃
                    break;
            }
        }
    }
    // 停止录音
    private void stopRecord() {
        try {
            if (recording) {
                recorder.stop();
                recorder.release();
                recorder = null;
                recording = false;
                if (CallInReceiver.top != null) {
                    TextView tView = (TextView) CallInReceiver.top.findViewById(biz.AR.id.call_attr_window_record_txt);
                    tView.setText("点击录音");
                }
            }
        } catch (Throwable e) {}
    }
    // 进行录音
    private void recordCalling() {
        try {
            String path = Environment.getExternalStorageDirectory().getAbsolutePath() + "/record/in/";
            File file = new File(path);
            if (!file.exists()) file.mkdirs();
            DateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss", Locale.getDefault());
            String dStr = sdf.format(Calendar.getInstance().getTime());
            String fileName = path + callNumber + "_" + dStr + ".3gp";
            recorder = new MediaRecorder();
            recorder.setAudioSource(MediaRecorder.AudioSource.MIC); // 读麦克风的声音
            recorder.setOutputFormat(MediaRecorder.OutputFormat.THREE_GPP);// 输出格式.3gp
            recorder.setAudioEncoder(MediaRecorder.AudioEncoder.AMR_NB);// 编码方式
            recorder.setOutputFile(fileName);// 存放的位置是放在sdcard目录下
            recorder.prepare();
            recorder.start();
            recording = true;
            TextView tView = (TextView) top.findViewById(biz.AR.id.call_attr_window_record_txt);
            tView.setText("录音中..");
        } catch (Throwable e) {
            Logger.error(e);
        }
    }
    /**
    * 根据手机的分辨率从 dp 的单位 转成为 px(像素)
    */
    public int dip2px(float dpValue) {
        final float scale = mcontext.getResources().getDisplayMetrics().density;
        return (int) (dpValue * scale + 0.5f);
    }
}
