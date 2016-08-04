package main.batterymanager;
import main.batterymanager.methods.VerticalSeekBar;
import net.workspace.util.Logger;
import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Message;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

public class BatteryInfoActivity extends Activity {
    private TextView mBatteryState; //电池状态
    private TextView mBatteryCallTime;//通话时间
    private TextView mBatteryOnNetTime;//上网时间
    private TextView mBatteryWaitingTime;//待机时间
    //private TextView  mBatteryVoltage;//电压 
    private LinearLayout mUseBattarySort_layout; //耗电排行
    private TextView mBatteryElectricQuantityRed;//剩余电量 ,警告电量
    private TextView mBatteryElectricQuantityGreen;//剩余电量 ,电量充足
    private FrameLayout mBatteryProgress_layout_color_red; //红色警告布局
    private FrameLayout mBatteryProgress_layout_color_green; //正常绿色布局
    private VerticalSeekBar mVerticalSeekBarRed;
    private VerticalSeekBar mVerticalSeekBarGreen;
    private LinearLayout mBatteryManager_setting_screen_layout;
    private LinearLayout mBatteryManager_setting_bgData;
    //private TextView mBatteryManager_setting_bgData_text;
    private String TAG = "BatteryInfoActivity";
    /**
     * 设置电池基本信息
     */
    private final static int SETBATTERYINFO = 1;
    /**
     * 电量
     */
    private final static String electrical_quantity = "electrical_quantity";
    /**
     * 电量警告值
     */
    private final static int electrical_quantity_warningVal = 25;
    /**
     * 电池状态
     */
    private final static String battery_State = "battery_State";
    /**
     * 通话时间计算单位
     */
    private final static double CALLTIME_UNIT = 2.8;//1.4原始
    /**
     * 上网时间计算单位
     */
    private final static double ONNETTIME = 3.96;//2.66
    /**
     * 待机时间计算单位s
     */
    private final static double WAITINGTIME = 1.7;//1
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // TODO Auto-generated method stub
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.batterymanager_batteryinfo_activity);
        mBatteryState = (TextView) findViewById(biz.AR.id.batteryManager_battaryState);
        mBatteryCallTime = (TextView) findViewById(biz.AR.id.batteryManager_callTime);
        mBatteryOnNetTime = (TextView) findViewById(biz.AR.id.batteryManager_onNetTime);
        mBatteryWaitingTime = (TextView) findViewById(biz.AR.id.batteryManager_waitingTime);
        //mBatteryVoltage=(TextView) findViewById(biz.AR.id.batteryManager_voltage) ;
        mUseBattarySort_layout = (LinearLayout) findViewById(biz.AR.id.batteryManager_useBattarySort_layout);
        mUseBattarySort_layout.setOnClickListener(mUseBattarySort_layoutOnClickListener);
        mBatteryElectricQuantityRed = (TextView) findViewById(biz.AR.id.batterymansger_electric_quantity_color_red);
        mBatteryElectricQuantityGreen = (TextView) findViewById(biz.AR.id.batterymansger_electric_quantity_color_green);
        mBatteryProgress_layout_color_red = (FrameLayout) findViewById(biz.AR.id.batterymanager_batteryinfo_progress_layout_color_red);
        mBatteryProgress_layout_color_green = (FrameLayout) findViewById(biz.AR.id.batterymanager_batteryinfo_progress_layout_color_green);
        mVerticalSeekBarRed = (VerticalSeekBar) findViewById(biz.AR.id.batterymanager_batteryinfo_progress_color_red);
        mVerticalSeekBarGreen = (VerticalSeekBar) findViewById(biz.AR.id.batterymanager_batteryinfo_progress_color_green);
        mBatteryManager_setting_bgData = (LinearLayout) findViewById(biz.AR.id.batteryManager_bgData_layout);
        mBatteryManager_setting_bgData.setOnClickListener(mBatteryManager_setting_bgDataOnClickListener);
        //mBatteryManager_setting_bgData_text=(TextView)findViewById(biz.AR.id.battery_closebgdata_text);
        mBatteryManager_setting_screen_layout = (LinearLayout) findViewById(biz.AR.id.batteryManager_setting_Screen_layout);
        mBatteryManager_setting_screen_layout.setOnClickListener(mBatteryManager_setting_screen_layoutOnClickListener);
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                BatteryInfoActivity.this.finish();
            }
        });
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) { // 按下的如果是BACK，同时没有重复
            System.gc();
            BatteryInfoActivity.this.finish();
            return false;
        }
        return super.onKeyDown(keyCode, event);
    }
    /**
     * 消息处理
     */
    private Handler myHandler = new Handler(new Callback() {
        @Override
        public boolean handleMessage(Message msg) {
            switch (msg.what) {
                case SETBATTERYINFO:
                    Bundle bundle = msg.getData();
                    int level = bundle.getInt(electrical_quantity);//
                    int state = bundle.getInt(battery_State);
                    //		    switch (state) {
                    //	        case BatteryManager.BATTERY_PLUGGED_AC:
                    //	        	mBatteryState.setText("放电状态");
                    //	          break;
                    //	        case BatteryManager.BATTERY_PLUGGED_USB:
                    //	        	mBatteryState.setText("USB充电中");
                    //	          break;
                    //	        }
                    if (state == BatteryManager.BATTERY_PLUGGED_USB) {
                        mBatteryState.setText("USB充电中");
                    } else {
                        mBatteryState.setText("放电状态");
                    }
                    int call = (int) Math.floor(Math.abs(level * CALLTIME_UNIT));
                    mBatteryCallTime.setText(getHrTime(call));
                    int onNet = (int) Math.floor(Math.abs(level * ONNETTIME));
                    mBatteryOnNetTime.setText(getHrTime(onNet));
                    int waiting = (int) Math.floor(Math.abs(level * WAITINGTIME));
                    mBatteryWaitingTime.setText(getDayTime(waiting));
                    if (level < electrical_quantity_warningVal) {
                        mBatteryProgress_layout_color_red.setVisibility(View.VISIBLE);
                        mBatteryProgress_layout_color_green.setVisibility(View.GONE);
                        mBatteryElectricQuantityRed.setText(level + "%");
                        mVerticalSeekBarRed.setProgress(getLeverToProgress(level));
                    } else {
                        mBatteryProgress_layout_color_red.setVisibility(View.GONE);
                        mBatteryProgress_layout_color_green.setVisibility(View.VISIBLE);
                        mBatteryElectricQuantityGreen.setText(level + "%");
                        mVerticalSeekBarGreen.setProgress(getLeverToProgress(level));
                    }
                    break;
                default:
                    break;
            }
            return false;
        }
    });
    private int getLeverToProgress(int level) {
        return level * 4 / 5 + 20;
    }
    /**
     * 计算小时
     * @param mm
     * @return
     */
    private String getHrTime(int mm) {
        String timestr = "";
        if (mm > 60) {
            timestr = mm / 60 + "小时" + mm % 60 + "分钟";
        } else {
            timestr = mm + "分钟";
        }
        return timestr;
    }
    /**
     * 计算天数
     * @param hour
     * @return
     */
    private String getDayTime(int hour) {
        String day = "";
        if (hour > 24) {
            day = hour / 24 + "天" + hour % 24 + "小时";
        } else {
            day = hour + "天";
        }
        return day;
    }
    //排行点击
    private OnClickListener mUseBattarySort_layoutOnClickListener = new OnClickListener() {
        @Override
        public void onClick(View v) {
            // TODO Auto-generated method stub
            //ACTION_SYNC_SETTINGS  :帐号同步设置
            //ACTION_WIRELESS_SETTINGS  网络设置
            //			startActivity(new Intent("com.android.settings.fuelgauge.PowerUsageSummary"));
            //		    fuelgauge.PowerUsageSummary;
            //启动电量排行情况
            try {
                Intent intent = new Intent();
                intent.setComponent(new ComponentName("com.android.settings", "com.android.settings.fuelgauge.PowerUsageSummary"));
                startActivity(intent);
            } catch (Throwable e) {
                Logger.error(e);
            }
        }
    };
    /**
     * 背景数据点击事件
     */
    private OnClickListener mBatteryManager_setting_bgDataOnClickListener = new OnClickListener() {
        @Override
        public void onClick(View v) {
            // TODO Auto-generated method stub
            try {
                startActivity(new Intent(android.provider.Settings.ACTION_SYNC_SETTINGS));
            } catch (Throwable e) {
                Logger.error(e);
            }
        }
    };
    /**
     * 屏幕设置点击事件
     */
    private OnClickListener mBatteryManager_setting_screen_layoutOnClickListener = new OnClickListener() {
        @Override
        public void onClick(View v) {
            // TODO Auto-generated method stub
            startActivity(new Intent(BatteryInfoActivity.this, BrightnessDialog.class));
        }
    };
    @Override
    protected void onResume() {
        // TODO Auto-generated method stub
        IntentFilter filter = new IntentFilter();
        filter.addAction(Intent.ACTION_BATTERY_CHANGED);
        registerReceiver(mBroadcastReceiver, filter);
        super.onResume();
    }
    @Override
    protected void onPause() {
        // TODO Auto-generated method stub
        super.onPause();
        unregisterReceiver(mBroadcastReceiver);
    }
    /**
     * 获得电池信息
     */
    private BroadcastReceiver mBroadcastReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if (action.equals(Intent.ACTION_BATTERY_CHANGED)) {
                int status = intent.getIntExtra("status", 0);
                int health = intent.getIntExtra("health", 0);
                boolean present = intent.getBooleanExtra("present", false);
                int level = intent.getIntExtra("level", 0);
                int scale = intent.getIntExtra("scale", 0);
                int icon_small = intent.getIntExtra("icon-small", 0);
                int plugged = intent.getIntExtra("plugged", 0);
                int voltage = intent.getIntExtra("voltage", 0);
                int temperature = intent.getIntExtra("temperature", 0);
                String technology = intent.getStringExtra("technology");
                Message msg = new Message();
                Bundle bundle = new Bundle();
                bundle.putInt(battery_State, plugged);
                bundle.putInt(electrical_quantity, level);
                String statusString = "";
                //电池状态.充电
                switch (status) {
                    case BatteryManager.BATTERY_STATUS_UNKNOWN:
                        statusString = "unknown";
                        break;
                    case BatteryManager.BATTERY_STATUS_CHARGING:
                        statusString = "charging";
                        break;
                    case BatteryManager.BATTERY_STATUS_DISCHARGING:
                        statusString = "discharging";
                        break;
                    case BatteryManager.BATTERY_STATUS_NOT_CHARGING:
                        statusString = "not charging";
                        break;
                    case BatteryManager.BATTERY_STATUS_FULL:
                        statusString = "full";
                        break;
                }
                String healthString = "";
                switch (health) {
                    case BatteryManager.BATTERY_HEALTH_UNKNOWN:
                        healthString = "unknown";
                        break;
                    case BatteryManager.BATTERY_HEALTH_GOOD:
                        healthString = "good";
                        break;
                    case BatteryManager.BATTERY_HEALTH_OVERHEAT:
                        healthString = "overheat";
                        break;
                    case BatteryManager.BATTERY_HEALTH_DEAD:
                        healthString = "dead";
                        break;
                    case BatteryManager.BATTERY_HEALTH_OVER_VOLTAGE:
                        healthString = "voltage";
                        break;
                    case BatteryManager.BATTERY_HEALTH_UNSPECIFIED_FAILURE:
                        healthString = "unspecified failure";
                        break;
                }
                String acString = "";
                switch (plugged) {
                    case BatteryManager.BATTERY_PLUGGED_AC:
                        acString = "plugged ac";
                        break;
                    case BatteryManager.BATTERY_PLUGGED_USB:
                        acString = "plugged usb";
                        break;
                }
                Log.v(TAG, "status  " + statusString);
                Log.v(TAG, "health  " + healthString);
                Log.v(TAG, "present  " + String.valueOf(present));
                Log.v(TAG, "level  " + String.valueOf(level));
                Log.v(TAG, "scale  " + String.valueOf(scale));
                Log.v(TAG, "icon_small  " + String.valueOf(icon_small));
                Log.v(TAG, "plugged  " + acString);
                Log.v(TAG, "voltage  " + String.valueOf(voltage));
                Log.v(TAG, "temperature  " + String.valueOf(temperature));
                Log.v(TAG, "technology  " + technology);
                msg.setData(bundle);
                msg.what = SETBATTERYINFO;
                myHandler.sendMessage(msg);
            }
        }
    };
}
