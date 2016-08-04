package main.block;
import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;
import main.database.DBManager;
import main.database.DatabaseAdapter;
import net.workspace.util.Logger;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.graphics.PixelFormat;
import android.media.MediaRecorder;
import android.os.Environment;
import android.preference.PreferenceManager;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowManager;
import android.view.WindowManager.LayoutParams;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

public class CallOutReceiver extends BroadcastReceiver {
    private static final String strACT = "android.intent.action.NEW_OUTGOING_CALL";
    private TelephonyManager telephonyMgr = null;
    private MediaRecorder recorder;
    private boolean recording = false;
    public static View top;
    private WindowManager wm;
    private String callNumber = "";
    private WindowManager.LayoutParams params;
    private String IPNumber = "";
    float mTouchStartX;
    float mTouchStartY;
    float x;
    float y;
    long startTime = 0;
    Context mContext;
    MyPhoneStateListener myPhoneStateListener = null;
    @Override
    public void onReceive(Context context, Intent intent) {
        mContext = context;
        if (BlockbgService.state == -1)// 后台服务停了，需要重新启动
        {
            BlockbgService.startMyService(context);
            return;
        }
        if (intent.getAction().equalsIgnoreCase(strACT)) {
            try {
                //if (BlockRuleSetting.mode == 0 && BlockRuleSetting.night_mode ==0)return;// 屏蔽停在设置时，取消屏蔽过滤处理
                IPNumber = "";
                startTime = Calendar.getInstance().getTime().getTime();
                String pNumber = getResultData();
                if (pNumber == null) return;
                if (pNumber.indexOf("+86") == 0) pNumber = pNumber.substring(3);
                display(pNumber);
                if (IPNumber.length() > pNumber.length()) setResultData(IPNumber);
            } catch (Throwable e) {
                //Log.e("master", e.getMessage());
            }
        }
    }
    String info = "";
    private void display(String pNumber) {
        if (BlockbgService.state == -1) BlockbgService.startMyService(mContext);
        callNumber = pNumber;
        DBManager db = new DBManager(mContext);
        db.openDatabase();
        if (pNumber.substring(0, 1).equals("0")) info = db.SearchPhone(pNumber);
        else if (pNumber.length() == 11) info = db.mobileInfo(pNumber);
        db.closeDatabase();
        if (info.length() < 1) {
            db.openDatabase();
            info = db.SearchOtherPhone(pNumber);
        }
        IPNumber = pNumber = CheckIP(pNumber, info);
        PhoneStateListener();
    }
    /**
     * IP电话检测
     * 
     * @param context
     * @param info
     * @param pNumber
     */
    String CheckIP(String number, String info) {
        String[] infos = info.split(" ");
        if (infos.length == 2) infos[1] = infos[0];// 城市和省份相同的直辖市
        boolean isUsed = true;
        DatabaseAdapter da = DatabaseAdapter.getInstance(mContext);
        for (IPSetting one : da.readIPSetting(true)) {
            if (number.indexOf(one.IPnumber) == 0) continue;
            isUsed = true;
            switch (one.AreaType) {
                case 0:// 全部地区
                {
                    if (one.IncludeNumber.indexOf(number) != -1) // 在强制使用号码中
                    break;
                    if (one.Outnumber.indexOf(number) != -1)// 在排除号码中
                    {
                        isUsed = false;
                        break;
                    }
                }
                    break;
                case 1:// 下面地区
                {
                    if (one.IncludeNumber.indexOf(number) != -1) // 在强制使用号码中
                    break;
                    if (one.Outnumber.indexOf(number) != -1)// 在排除号码中
                    {
                        isUsed = false;
                        break;
                    }
                    if (infos.length == 1) // 区域为空
                    isUsed = false;
                    else if (one.Area.indexOf(infos[0]) == -1 && one.Area.indexOf(infos[1]) == -1) /* 不在本区 */
                    {
                        isUsed = false;
                    }
                }
                    break;
                case 2:// 不在下面区
                {
                    if (one.IncludeNumber.indexOf(number) != -1) // 在强制使用号码中
                    break;
                    if (one.Outnumber.indexOf(number) != -1)// 在排除号码中
                    {
                        isUsed = false;
                        break;
                    }
                    if (infos.length == 1) // 区域消息为空
                    break;
                    if (one.Area.indexOf(infos[0]) != -1 || one.Area.indexOf(infos[1]) != -1) /* 在本区 */
                    {
                        isUsed = false;
                    }
                }
                    break;
            }
            // //////////////////////////////////////////本市不使用IP
            String city = one.LocalCity.replace("市", "");
            if (one.localcity_nouse)// 本市不使用IP
            {
                if (one.IncludeNumber.indexOf(number) == -1)// 不在强制使用号码中
                {
                    if (number.indexOf("1") == 0 && number.length() == 11 && infos.length > 1 && city.length() > 1 && infos[1].indexOf(city) == 0)
                    // 本市手机号码
                    {
                        isUsed = false;
                    } else if (number.indexOf("0") != 0 && number.indexOf("1") != 0)
                    // 本市座机
                    {
                        isUsed = false;
                    }
                }
            }
            // /////////////////////////////////
            if (!isUsed) continue;// 被排除
            /* 时间比较,在时间之外，停在IP电话 */
            String[] times = one.Times.split(";");
            String[] fsTime = times[0].split(":");
            String[] feTime = times[1].split(":");
            int hour = Calendar.getInstance().getTime().getHours();
            int minutes = Calendar.getInstance().getTime().getMinutes();
            boolean timeIn = false;
            /* 当前时间大于开始时间 */
            timeIn = hour > Integer.parseInt(fsTime[0]) || hour == Integer.parseInt(fsTime[0]) && minutes > Integer.parseInt(fsTime[1]);
            /* 当前时间小于结束时间 */
            timeIn = timeIn || hour < Integer.parseInt(feTime[0]) || hour == Integer.parseInt(feTime[0]) && minutes < Integer.parseInt(feTime[1]);
            if (!timeIn) isUsed = false;
            /* 时间比较 end */
            if (!isUsed) continue;// 被排除
            // 排除天日
            int day = 7 - Calendar.getInstance().get(Calendar.DAY_OF_WEEK);
            String[] days = one.Days.split(";");
            if (day <= days.length && !days[day].equals("1")) isUsed = false;
            if (isUsed)// 找到可以用的IP
            {
                if (number.length() == 11 && number.subSequence(0, 1).equals("1") && one.AddZero) number = "0" + number; // 手机号码+0
                number = one.IPnumber + number;
                return number;
            }
        }
        return number;
    }
    private void PhoneStateListener() {
        if (telephonyMgr == null) {
            if (myPhoneStateListener == null) myPhoneStateListener = new MyPhoneStateListener();
            telephonyMgr = (TelephonyManager) mContext.getSystemService(Context.TELEPHONY_SERVICE);
            telephonyMgr.listen(myPhoneStateListener, PhoneStateListener.LISTEN_CALL_STATE);
        }
    }
    private void setTopWindows(String info, String pNumber) {
        wm = (WindowManager) mContext.getApplicationContext().getSystemService(Context.WINDOW_SERVICE);
        if (CallOutReceiver.top != null) {//关闭掉上次的弹出窗口
            wm.removeView(CallOutReceiver.top);
            CallOutReceiver.top = null;
        }
        LayoutInflater mInflater = LayoutInflater.from(mContext);
        CallOutReceiver.top = mInflater.inflate(biz.AR.layout.call_attr_window, null);
        LinearLayout recordLayout = (LinearLayout) CallOutReceiver.top.findViewById(biz.AR.id.call_attr_window_record_layout);
        LinearLayout layout = (LinearLayout) CallOutReceiver.top.findViewById(biz.AR.id.call_attr_window_layout);
        recordLayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ImageView iView = (ImageView) CallOutReceiver.top.findViewById(biz.AR.id.call_attr_window_record_img);
                if (recording) {
                    iView.setImageResource(biz.AR.drawable.unrecord);
                    stopRecord();
                } else {
                    iView.setImageResource(biz.AR.drawable.record);
                    recordCalling();
                }
            }
        });
        layout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (CallOutReceiver.top != null) {
                    wm.removeView(CallOutReceiver.top);
                    CallOutReceiver.top = null;
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
        TextView tView = (TextView) CallOutReceiver.top.findViewById(biz.AR.id.call_attr_window_pnumber);
        tView.setText(pNumber);
        tView = (TextView) CallOutReceiver.top.findViewById(biz.AR.id.call_attr_window_info);
        tView.setText(info);
        tView = (TextView) CallOutReceiver.top.findViewById(biz.AR.id.call_attr_window_record_txt);
        tView.setText("点击录音");
        params = new WindowManager.LayoutParams();
        params.type = WindowManager.LayoutParams.TYPE_SYSTEM_ALERT | WindowManager.LayoutParams.TYPE_SYSTEM_OVERLAY;
        params.flags = LayoutParams.FLAG_NOT_FOCUSABLE | LayoutParams.FLAG_NOT_TOUCH_MODAL;
        params.width = android.view.ViewGroup.LayoutParams.WRAP_CONTENT;
        params.height = android.view.ViewGroup.LayoutParams.WRAP_CONTENT;
        // params.alpha = 80;
        params.y = 20;
        params.gravity = Gravity.CENTER_HORIZONTAL | Gravity.TOP;
        params.format = PixelFormat.RGBA_8888; // 设置图片格式，效果为背景透明
        wm.addView(CallOutReceiver.top, params);
        CallOutReceiver.top.setOnTouchListener(new View.OnTouchListener() {
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
                        case MotionEvent.ACTION_MOVE: {
                            params.x = (int) (x + mTouchStartX);
                            params.y = (int) (y + mTouchStartY);
                            params.gravity = Gravity.LEFT | Gravity.TOP;
                            wm.updateViewLayout(CallOutReceiver.top, params);
                        }
                            break;
                        case MotionEvent.ACTION_UP: {
                            params.x = (int) (x + mTouchStartX);
                            params.y = (int) (y + mTouchStartY);
                            wm.updateViewLayout(CallOutReceiver.top, params);
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
        @Override
        public void onCallStateChanged(int state, String phoneNumber) {
            switch (state) {
                case TelephonyManager.CALL_STATE_IDLE:// 电话空闲或者挂断
                {
                    if (CallOutReceiver.top != null && count > 0) {
                        wm.removeView(CallOutReceiver.top);
                        CallOutReceiver.top = null;
                        if (recording) stopRecord();
                    }
                    if (count > 0) {
                        Calendar c = Calendar.getInstance();
                        long minutes = (c.getTime().getTime() - startTime) / 1000 / 60;
                        if (minutes > 0) {
                            SharedPreferences settings = PreferenceManager.getDefaultSharedPreferences(mContext);
                            String valueName = "callOutTime_" + c.get(Calendar.YEAR) + c.get(Calendar.MONTH);
                            minutes = minutes + settings.getLong(valueName, 0);
                            Editor editor = settings.edit();
                            editor.putLong(valueName, minutes);
                            editor.commit();
                        }
                        if (telephonyMgr != null)// 挂断
                        {
                            telephonyMgr.listen(myPhoneStateListener, android.telephony.PhoneStateListener.LISTEN_NONE);
                            myPhoneStateListener = null;
                            telephonyMgr = null;
                        }
                    }
                }
                    break;
                case TelephonyManager.CALL_STATE_OFFHOOK:// 电话接通
                {
                    //三星等手机有时候打电话是接收不到】
                    //（TelephonyManager.CALL_STATE_OFFHOOK:// 电话接通）命令的，故不打开录音界面
                    if (BlockRuleSetting.show_Callout && IPNumber.indexOf("#") != 0 && IPNumber.indexOf("*") != 0) {
                        setTopWindows(info, IPNumber);
                    }
                    count++;
                    startTime = Calendar.getInstance().getTime().getTime();
                }
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
                if (CallOutReceiver.top != null) {
                    TextView tView = (TextView) CallOutReceiver.top.findViewById(biz.AR.id.call_attr_window_record_txt);
                    tView.setText("点击录音");
                }
            }
        } catch (Throwable e) {}
    }
    // 进行录音
    private void recordCalling() {
        try {
            String path = Environment.getExternalStorageDirectory().getAbsolutePath() + "/record/out/";
            File file = new File(path);
            if (!file.exists()) file.mkdirs();
            DateFormat sdf = new SimpleDateFormat("yyMdHms", Locale.getDefault());
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
            TextView tView = (TextView) CallOutReceiver.top.findViewById(biz.AR.id.call_attr_window_record_txt);
            tView.setText("录音中..");
        } catch (Throwable e) {
            Logger.error(e);
        }
    }
    /**
    * 根据手机的分辨率从 dp 的单位 转成为 px(像素)
    */
    public int dip2px(float dpValue) {
        final float scale = mContext.getResources().getDisplayMetrics().density;
        return (int) (dpValue * scale + 0.5f);
    }
}
