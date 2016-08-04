package main.batterymanager;
import main.batterymanager.methods.ScreenAutoRotaUitl;
import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.content.Context;
import android.content.Intent;
import android.location.LocationManager;
import android.media.AudioManager;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Message;
import android.os.Process;
import android.telephony.TelephonyManager;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * 省电设置
 * @author Administrator
 *
 */
public class SavingBatteryStyleActivity extends Activity implements OnClickListener {
    private LinearLayout mBatteryManager_setting_Wifi;
    private LinearLayout mBatteryManager_setting_2Gand3G;
    private LinearLayout mBatteryManager_setting_Bluetooth;
    private LinearLayout mBatteryManager_setting_GPS;
    private LinearLayout mBatteryManager_setting_Screen;
    private LinearLayout mBatteryManager_setting_ScreenAutoRota;
    private LinearLayout mBatteryManager_setting_Vibration;
    private TextView mBatteryManager_setting_Wifi_text;
    private ImageView mBatteryManager_setting_Wifi_btn;
    private TextView mBatteryManager_setting_2Gand3G_text;
    private ImageView mBatteryManager_setting_2Gand3G_btn;
    private TextView mBatteryManager_setting_Bluetooth_text;
    private ImageView mBatteryManager_setting_Bluetooth_btn;
    private TextView mBatteryManager_setting_GPS_text;
    private ImageView mBatteryManager_setting_GPS_btn;
    //private TextView mBatteryManager_setting_Screen_text;
    //private ImageView  mBatteryManager_setting_Screen_btn;
    private TextView mBatteryManager_setting_ScreenAutoRota_text;
    private ImageView mBatteryManager_setting_ScreenAutoRota_btn;
    private TextView mBatteryManager_setting_Vibration_text;
    private ImageView mBatteryManager_setting_Vibration_btn;
    private WifiManager wifiManager;
    //private SharedPreferences settings;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // TODO Auto-generated method stub
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.batterymanager_savingbatterysytle_activity);
        initUI();
        wifiManager = (WifiManager) getSystemService(Context.WIFI_SERVICE);
    }
    /**
     * 初始化控件
     */
    private void initUI() {
        mBatteryManager_setting_Wifi = (LinearLayout) findViewById(biz.AR.id.batteryManager_setting_Wifi);
        mBatteryManager_setting_Wifi.setOnClickListener(this);
        mBatteryManager_setting_2Gand3G = (LinearLayout) findViewById(biz.AR.id.batteryManager_setting_2Gand3G);
        mBatteryManager_setting_2Gand3G.setOnClickListener(this);
        mBatteryManager_setting_Bluetooth = (LinearLayout) findViewById(biz.AR.id.batteryManager_setting_Bluetooth);
        mBatteryManager_setting_Bluetooth.setOnClickListener(this);
        mBatteryManager_setting_GPS = (LinearLayout) findViewById(biz.AR.id.batteryManager_setting_GPS);
        mBatteryManager_setting_GPS.setOnClickListener(this);
        mBatteryManager_setting_Screen = (LinearLayout) findViewById(biz.AR.id.batteryManager_setting_Screen);
        mBatteryManager_setting_Screen.setOnClickListener(this);
        mBatteryManager_setting_ScreenAutoRota = (LinearLayout) findViewById(biz.AR.id.batteryManager_setting_ScreenAutoRota);
        mBatteryManager_setting_ScreenAutoRota.setOnClickListener(this);
        mBatteryManager_setting_Vibration = (LinearLayout) findViewById(biz.AR.id.batteryManager_setting_Vibration);
        mBatteryManager_setting_Vibration.setOnClickListener(this);
        mBatteryManager_setting_Wifi_text = (TextView) findViewById(biz.AR.id.batteryManager_SaveBattaryStyleCloseWifi_text);
        mBatteryManager_setting_Wifi_btn = (ImageView) findViewById(biz.AR.id.batteryManager_SaveBattaryStyleCloseWifi_btn);
        mBatteryManager_setting_2Gand3G_text = (TextView) findViewById(biz.AR.id.batteryManager_SaveBattaryStyleClose2Gand3G_text);
        mBatteryManager_setting_2Gand3G_btn = (ImageView) findViewById(biz.AR.id.batteryManager_SaveBattaryStyleClose2Gand3G_btn);
        mBatteryManager_setting_Bluetooth_text = (TextView) findViewById(biz.AR.id.batteryManager_SaveBattaryStyleCloseBluetooth_text);
        mBatteryManager_setting_Bluetooth_btn = (ImageView) findViewById(biz.AR.id.batteryManager_SaveBattaryStyleCloseBluetooth_btn);
        mBatteryManager_setting_GPS_text = (TextView) findViewById(biz.AR.id.batteryManager_SaveBattaryStyleCloseGPS_text);
        mBatteryManager_setting_GPS_btn = (ImageView) findViewById(biz.AR.id.batteryManager_SaveBattaryStyleCloseGPS_btn);
        //mBatteryManager_setting_Screen_text=(TextView)findViewById(biz.AR.id.batteryManager_SaveBattaryStyleScreen_text);
        mBatteryManager_setting_ScreenAutoRota_text = (TextView) findViewById(biz.AR.id.batteryManager_SaveBattaryStyleScreenAutoRota_text);
        mBatteryManager_setting_ScreenAutoRota_btn = (ImageView) findViewById(biz.AR.id.batteryManager_SaveBattaryStyleScreenAutoRota_btn);
        mBatteryManager_setting_Vibration_text = (TextView) findViewById(biz.AR.id.batteryManager_SaveBattaryStyleVibration_text);
        mBatteryManager_setting_Vibration_btn = (ImageView) findViewById(biz.AR.id.batteryManager_SaveBattaryStyleVibration_btn);
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(this);
    }
    @Override
    public void onClick(View v) {
        try {
            switch (v.getId()) {
                case biz.AR.id.batteryManager_setting_Wifi:
                    settingWifi();
                    break;
                case biz.AR.id.batteryManager_setting_2Gand3G:
                    startActivity(new Intent(android.provider.Settings.ACTION_WIRELESS_SETTINGS));
                    break;
                case biz.AR.id.batteryManager_setting_Bluetooth:
                    startActivity(new Intent(android.provider.Settings.ACTION_BLUETOOTH_SETTINGS));
                    break;
                case biz.AR.id.batteryManager_setting_GPS:
                    Intent intent = new Intent(android.provider.Settings.ACTION_LOCATION_SOURCE_SETTINGS);
                    //			    intent.setComponent(new ComponentName("com.android.settings", "com.android.settings.UeVersionLocationSettings"));
                    startActivity(intent);
                    break;
                case biz.AR.id.batteryManager_setting_Screen:
                    startActivity(new Intent(this, BrightnessDialog.class));
                    break;
                case biz.AR.id.batteryManager_setting_ScreenAutoRota:
                    if (ScreenAutoRotaUitl.isAutoRota(getContentResolver())) {
                        //关闭
                        ScreenAutoRotaUitl.stopAutoRota(SavingBatteryStyleActivity.this);
                    } else {
                        //开启
                        ScreenAutoRotaUitl.startAutoRota(SavingBatteryStyleActivity.this);
                    }
                    checkScreenAutoRota();
                    break;
                case biz.AR.id.batteryManager_setting_Vibration:
                    AudioManager am = (AudioManager) getSystemService(Context.AUDIO_SERVICE);
                    int type = am.getVibrateSetting(AudioManager.VIBRATE_TYPE_RINGER);
                    switch (type) {
                        case AudioManager.VIBRATE_SETTING_OFF:
                            am.setVibrateSetting(AudioManager.VIBRATE_TYPE_RINGER, AudioManager.VIBRATE_SETTING_ON);
                            mBatteryManager_setting_Vibration_btn.setImageResource(biz.AR.drawable.batterymanager_switch_off_normal);
                            break;
                        case AudioManager.VIBRATE_SETTING_ONLY_SILENT:
                            break;
                        case AudioManager.VIBRATE_SETTING_ON:
                            am.setVibrateSetting(AudioManager.VIBRATE_TYPE_RINGER, AudioManager.VIBRATE_SETTING_OFF);
                            mBatteryManager_setting_Vibration_btn.setImageResource(biz.AR.drawable.batterymanager_switch_on_normal);
                            break;
                    }
                    break;
                case biz.AR.id.back:
                    System.gc();
                    SavingBatteryStyleActivity.this.finish();
                    break;
            }
        } catch (Throwable e) {
            return;
        }
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) { // 按下的如果是BACK，同时没有重复
            System.gc();
            SavingBatteryStyleActivity.this.finish();
            return false;
        }
        return super.onKeyDown(keyCode, event);
    }
    /*
    	private    void GPS(){
    		//获取GPS现在的状态（打开或是关闭状态）
    		boolean gpsEnabled = Settings.Secure.isLocationProviderEnabled( getContentResolver(), LocationManager.GPS_PROVIDER );

    		if(gpsEnabled)
    		{
    			//关闭GPS
    			Settings.Secure.setLocationProviderEnabled( getContentResolver(), LocationManager.GPS_PROVIDER, false );
    		}
    		else
    		{
    			//打开GPS
    			Settings.Secure.setLocationProviderEnabled( getContentResolver(), LocationManager.GPS_PROVIDER, true);
    		}
    	}
    */
    private Handler myHandler = new Handler(new Callback() {
        @Override
        public boolean handleMessage(Message msg) {
            // TODO Auto-generated method stub
            switch (msg.what) {
                case WifiManager.WIFI_STATE_ENABLING:
                    mBatteryManager_setting_Wifi_text.setText(getString(biz.AR.string.batteryManager_OpeningWifi_str));
                    mBatteryManager_setting_Wifi_btn.setImageResource(biz.AR.drawable.batterymanager_switch_off_normal);
                    break;
                case WifiManager.WIFI_STATE_ENABLED:
                    mBatteryManager_setting_Wifi_text.setText(getString(biz.AR.string.batteryManager_SaveBattaryStyleOpneingWifi_str));
                    mBatteryManager_setting_Wifi_btn.setImageResource(biz.AR.drawable.batterymanager_switch_off_normal);
                    break;
                case WifiManager.WIFI_STATE_DISABLING:
                    mBatteryManager_setting_Wifi_text.setText(getString(biz.AR.string.batteryManager_CloseingWifi_str));
                    mBatteryManager_setting_Wifi_btn.setImageResource(biz.AR.drawable.batterymanager_switch_on_normal);
                    break;
                case WifiManager.WIFI_STATE_DISABLED:
                    mBatteryManager_setting_Wifi_text.setText(getString(biz.AR.string.batteryManager_SaveBattaryStyleCloseWifi_str));
                    mBatteryManager_setting_Wifi_btn.setImageResource(biz.AR.drawable.batterymanager_switch_on_normal);
                    break;
            }
            return false;
        }
    });
    /**
     * 打开和关闭WIFI
     */
    private void settingWifi() {
        // 判断WIFI状态，根据状态来确定是否开关
        if (wifiManager.isWifiEnabled()) {
            // 关闭
            if (wifiManager.setWifiEnabled(false)) {
                new Thread() {
                    @Override
                    public void run() {
                        Process.setThreadPriority(Process.THREAD_PRIORITY_BACKGROUND);
                        while (true) {
                            int state = wifiManager.getWifiState();
                            if (state == WifiManager.WIFI_STATE_DISABLING) {
                                // WiFi正在关闭过程中....
                                myHandler.sendEmptyMessage(state);
                            } else if (state == WifiManager.WIFI_STATE_DISABLED) {
                                // WiFi已经关闭
                                myHandler.sendEmptyMessage(state);
                                break;
                            } else {
                                // 其它未知的错误
                                break;
                            }
                        }
                        super.run();
                    }
                }.start();
            }
        } else {
            // 打开
            if (wifiManager.setWifiEnabled(true)) {
                new Thread() {
                    @Override
                    public void run() {
                        while (true) {
                            int state = wifiManager.getWifiState();
                            if (state == WifiManager.WIFI_STATE_ENABLING) {
                                // WiFi正在打开过程中....
                                myHandler.sendEmptyMessage(state);
                            } else if (state == WifiManager.WIFI_STATE_ENABLED) {
                                // WiFi已经打开
                                myHandler.sendEmptyMessage(state);
                                break;
                            } else {
                                // 其它未知的错误
                                break;
                            }
                        }
                        super.run();
                    }
                }.start();
            }
        }
    }
    /**
     * 检测WIFI打开状态
     */
    private void checkWifiSate() {
        int state = wifiManager.getWifiState();
        switch (state)
        // WiFi状态不为已打开状态时  
        {
            case WifiManager.WIFI_STATE_ENABLING:
                // WiFi正在打开过程中，导致无法关闭...  
                break;
            case WifiManager.WIFI_STATE_DISABLING:
                // WiFi正在关闭过程中，导致无法关闭...  
                break;
            case WifiManager.WIFI_STATE_ENABLED:
                //已经打开
                myHandler.sendEmptyMessage(state);
                break;
            case WifiManager.WIFI_STATE_DISABLED:
                // WiFi已经关闭  
                myHandler.sendEmptyMessage(state);
                break;
            case WifiManager.WIFI_STATE_UNKNOWN:
                // 无法取得或辨识WiFi状态  
            default:
                break;
        }
    }
    /**
     *  检查网络链接是否正常
     */
    private void check2Gand3GNet() {
        //判断网络链接，方法二：
        final TelephonyManager mTelephonyMgr = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
        int state = mTelephonyMgr.getDataState();
        switch (state) {
            case TelephonyManager.DATA_DISCONNECTED:
                //链接失败
                mBatteryManager_setting_2Gand3G_text.setText(getString(biz.AR.string.batteryManager_SaveBattaryStyleClose2Gand3G_str));
                mBatteryManager_setting_2Gand3G_btn.setImageResource(biz.AR.drawable.batterymanager_switch_on_normal);
                break;
            case TelephonyManager.DATA_CONNECTED:
                //已链接
                mBatteryManager_setting_2Gand3G_text.setText(getString(biz.AR.string.batteryManager_SaveBattaryStyleClose2Gand3G_str));
                mBatteryManager_setting_2Gand3G_btn.setImageResource(biz.AR.drawable.batterymanager_switch_off_normal);
                break;
            default:
                break;
        }
    }
    /**
     * 检查蓝牙状态
     */
    private void checkBluetoothState() {
        BluetoothAdapter mAdapter = BluetoothAdapter.getDefaultAdapter();
        if (!mAdapter.isEnabled()) {
            //弹出对话框提示用户是后打开
            //			Intent enabler = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
            //			startActivityForResult(enabler, REQUEST_ENABLE);
            //不做提示，强行打开
            // mAdapter.enable();
            mBatteryManager_setting_Bluetooth_text.setText(getString(biz.AR.string.batteryManager_SaveBattaryStyleCloseBlueTooth_str));
            mBatteryManager_setting_Bluetooth_btn.setImageResource(biz.AR.drawable.batterymanager_switch_on_normal);
        } else {
            //已经打开
            mBatteryManager_setting_Bluetooth_text.setText(getString(biz.AR.string.batteryManager_SaveBattaryStyleCloseBlueTooth_str));
            mBatteryManager_setting_Bluetooth_btn.setImageResource(biz.AR.drawable.batterymanager_switch_off_normal);
        }
    }
    /**
     * 检查GPS状态
     */
    private void checkGPS() {
        LocationManager alm = (LocationManager) getSystemService(Context.LOCATION_SERVICE);
        if (alm.isProviderEnabled(android.location.LocationManager.GPS_PROVIDER)) {
            //已经打开
            mBatteryManager_setting_GPS_text.setText(getString(biz.AR.string.batteryManager_SaveBattaryStyleCloseGPS_str));
            mBatteryManager_setting_GPS_btn.setImageResource(biz.AR.drawable.batterymanager_switch_off_normal);
        } else {
            //已关闭
            //			Intent myIntent = new Intent( Settings.ACTION_SECURITY_SETTINGS );
            //			startActivity(myIntent);
            mBatteryManager_setting_GPS_text.setText(getString(biz.AR.string.batteryManager_SaveBattaryStyleCloseGPS_str));
            mBatteryManager_setting_GPS_btn.setImageResource(biz.AR.drawable.batterymanager_switch_on_normal);
        }
    }
    /**
     * 检查屏幕自动旋转状态
     */
    private void checkScreenAutoRota() {
        if (ScreenAutoRotaUitl.isAutoRota(getContentResolver())) {
            // 已经禁止转屏
            mBatteryManager_setting_ScreenAutoRota_text.setText(getString(biz.AR.string.batteryManager_SaveBattaryStyleScreenAutoRota_str));
            mBatteryManager_setting_ScreenAutoRota_btn.setImageResource(biz.AR.drawable.batterymanager_switch_off_normal);
        } else {
            mBatteryManager_setting_ScreenAutoRota_text.setText(getString(biz.AR.string.batteryManager_SaveBattaryStyleScreenAutoRota_str));
            mBatteryManager_setting_ScreenAutoRota_btn.setImageResource(biz.AR.drawable.batterymanager_switch_on_normal);
        }
    }
    /**
     * 检查手机震动状态
     */
    private void checkVibration() {
        //Vibrator  vibrator = (Vibrator) getSystemService(VIBRATOR_SERVICE);  
        AudioManager am = (AudioManager) getSystemService(Context.AUDIO_SERVICE);
        //得到AudioManager对象
        //	        am.setRingerMode(AudioManager.RINGER_MODE_NORMAL);
        //参数为 设置情景模式的类型
        //AudioManager.RINGER_MODE_NORMAL 正常模式,有声,是否震动取决于原来系统声音设置中振动的设置
        //AudioManager.RINGER_MODE_SILENT 静音模式,无声不震
        //AudioManager.RINGER_MODE_VIBRATE 震动模式,无声,震动
        int type = am.getVibrateSetting(AudioManager.VIBRATE_TYPE_RINGER);
        if (type == AudioManager.VIBRATE_SETTING_OFF) {
            //振动关闭
            mBatteryManager_setting_Vibration_text.setText(getString(biz.AR.string.batteryManager_SaveBattaryStyleCloseVibration_str));
            mBatteryManager_setting_Vibration_btn.setImageResource(biz.AR.drawable.batterymanager_switch_on_normal);
        } else {
            mBatteryManager_setting_Vibration_text.setText(getString(biz.AR.string.batteryManager_SaveBattaryStyleCloseVibration_str));
            mBatteryManager_setting_Vibration_btn.setImageResource(biz.AR.drawable.batterymanager_switch_off_normal);
        }
    }
    @Override
    protected void onResume() {
        checkWifiSate();
        check2Gand3GNet();
        checkBluetoothState();
        checkGPS();
        checkScreenAutoRota();
        checkVibration();
        super.onResume();
    }
    /**
     * 获取手机卡类型，移动、联通、电信
     * 
     */
    /*
    private static void getMobileType(Context context) {
    	//int type = 0;
    	TelephonyManager iPhoneManager = (TelephonyManager) context
    			.getSystemService(Context.TELEPHONY_SERVICE);
    	String iNumeric = iPhoneManager.getSimOperator();
    	if (iNumeric.length() > 0) {
    		if (iNumeric.equals("46000") || iNumeric.equals("46002")) {
    			// 中国移动
    		} else if (iNumeric.equals("46001")) {
    			// 中国联通
    		} else if (iNumeric.equals("46003")) {
    			// 中国电信
    		}
    	}

    }
    */
}
