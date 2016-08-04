package main.batterymanager;
import main.batterymanager.methods.BrightnessAdjust;
import main.batterymanager.methods.ScreenWaitingSetting;
import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.ImageView;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import android.widget.TextView;

/**
 * 屏幕亮度调节对话框
 * @author Administrator
 *
 */
public class BrightnessDialog extends Activity {
    private ImageView mAutoAdjuestScreenBtn;
    private SeekBar mSeekbar_scree;
    private SeekBar mSeekbar_CloseScreeTime;
    private TextView mSubmitBtn;
    private TextView mCancleBtn;
    boolean AdjustState = false;
    private int sceenProgress = 0;
    private int timeout = 0;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // TODO Auto-generated method stub
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.batterymanager_brightnessactivity_dialog);
        mAutoAdjuestScreenBtn = (ImageView) findViewById(biz.AR.id.batteryManager_ScreenAutoAdjust_btn);
        mAutoAdjuestScreenBtn.setOnClickListener(mAutoAdjuestScreenBtnOnClickListener);
        mSeekbar_scree = (SeekBar) findViewById(biz.AR.id.batterymanager_seekbar_scree);
        mSeekbar_scree.setOnSeekBarChangeListener(mSeekbar_screeOnSeekBarChangeListener);
        mSeekbar_CloseScreeTime = (SeekBar) findViewById(biz.AR.id.batterymanager_seekbar_CloseScreeTime);
        mSeekbar_CloseScreeTime.setMax(100);
        mSeekbar_CloseScreeTime.setOnSeekBarChangeListener(mSeekbar_CloseScreeTimeOnSeekBarChangeListener);
        mSubmitBtn = (TextView) findViewById(biz.AR.id.batteryManager_screen_submit);
        mSubmitBtn.setOnClickListener(mSubmitBtnOnClickListener);
        mCancleBtn = (TextView) findViewById(biz.AR.id.batteryManager_screen_cancel);
        mCancleBtn.setOnClickListener(mCancleBtnOnClickListener);
        checkAutoSetting();
        timeout = ScreenWaitingSetting.getScreenTimeOut(getContentResolver());
        switch (timeout) {
            case 10:
                mSeekbar_CloseScreeTime.setProgress(0);
                break;
            case 30:
                mSeekbar_CloseScreeTime.setProgress(25);
                break;
            case 60:
                mSeekbar_CloseScreeTime.setProgress(50);
                break;
            case 300:
                mSeekbar_CloseScreeTime.setProgress(75);
                break;
            case 600:
                mSeekbar_CloseScreeTime.setProgress(99);
                break;
            default:
                mSeekbar_CloseScreeTime.setProgress(0);
                break;
        }
    }
    private View.OnClickListener mSubmitBtnOnClickListener = new OnClickListener() {
        @Override
        public void onClick(View v) {
            // TODO Auto-generated method stub
            if (AdjustState) {
                BrightnessAdjust.startAutoBrightness(BrightnessDialog.this);
            } else {
                BrightnessAdjust.stopAutoBrightness(BrightnessDialog.this);
            }
            BrightnessAdjust.saveBrightness(getContentResolver(), sceenProgress);
            ScreenWaitingSetting.setScreenTimeOut(BrightnessDialog.this, timeout);
            System.gc();
            finish();
        }
    };
    private View.OnClickListener mCancleBtnOnClickListener = new OnClickListener() {
        @Override
        public void onClick(View v) {
            System.gc();
            finish();
        }
    };
    /**
     * 切换自动调节
     */
    private View.OnClickListener mAutoAdjuestScreenBtnOnClickListener = new OnClickListener() {
        @Override
        public void onClick(View v) {
            // TODO Auto-generated method stub
            AdjustState = !AdjustState;
            if (AdjustState) {
                mAutoAdjuestScreenBtn.setImageResource(biz.AR.drawable.batterymanager_switch_off_normal);
            } else {
                mAutoAdjuestScreenBtn.setImageResource(biz.AR.drawable.batterymanager_switch_on_normal);
            }
        }
    };
    /**
     * 调节屏幕亮度
     */
    private SeekBar.OnSeekBarChangeListener mSeekbar_screeOnSeekBarChangeListener = new OnSeekBarChangeListener() {
        @Override
        public void onStopTrackingTouch(SeekBar seekBar) {
            // TODO Auto-generated method stub
        }
        @Override
        public void onStartTrackingTouch(SeekBar seekBar) {
            // TODO Auto-generated method stub
            AdjustState = false;
            //BrightnessAdjust.stopAutoBrightness(BrightnessDialog.this);
            mAutoAdjuestScreenBtn.setImageResource(biz.AR.drawable.batterymanager_switch_on_normal);
        }
        @Override
        public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
            // TODO Auto-generated method stub
            BrightnessAdjust.setBrightness(BrightnessDialog.this, progress);
            if (progress < 30) {
                progress = 30;
            }
            mSeekbar_scree.setProgress(progress);
            sceenProgress = progress;
        }
    };
    /**
     * 调节屏幕开启时间
     */
    private SeekBar.OnSeekBarChangeListener mSeekbar_CloseScreeTimeOnSeekBarChangeListener = new OnSeekBarChangeListener() {
        @Override
        public void onStopTrackingTouch(SeekBar seekBar) {
            // TODO Auto-generated method stub
        }
        @Override
        public void onStartTrackingTouch(SeekBar seekBar) {
            // TODO Auto-generated method stub
        }
        @Override
        public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
            // TODO Auto-generated method stub
            if (progress > 0 && progress < 15) {
                mSeekbar_CloseScreeTime.setProgress(0);
                timeout = 10;
            } else if (progress > 15 && progress < 35) {
                mSeekbar_CloseScreeTime.setProgress(25);
                timeout = 30;
            } else if (progress > 35 && progress < 65) {
                mSeekbar_CloseScreeTime.setProgress(50);
                timeout = 60;
            } else if (progress > 65 && progress < 85) {
                mSeekbar_CloseScreeTime.setProgress(75);
                timeout = 300;
            } else if (progress > 85 && progress < 100) {
                mSeekbar_CloseScreeTime.setProgress(99);
                timeout = 600;
            }
        }
    };
    private void checkAutoSetting() {
        AdjustState = BrightnessAdjust.isAutoBrightness(getContentResolver());
        if (AdjustState) {
            mAutoAdjuestScreenBtn.setImageResource(biz.AR.drawable.batterymanager_switch_off_normal);
        } else {
            mAutoAdjuestScreenBtn.setImageResource(biz.AR.drawable.batterymanager_switch_on_normal);
            sceenProgress = BrightnessAdjust.getScreenBrightness(BrightnessDialog.this);
            mSeekbar_scree.setProgress(sceenProgress);
        }
    }
    @Override
    protected void onDestroy() {
        // TODO Auto-generated method stub
        super.onDestroy();
    }
    @Override
    protected void onResume() {
        // TODO Auto-generated method stub
        super.onResume();
    }
}
