package main.batterymanager;
import android.app.TabActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Window;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.RadioButton;
import android.widget.TabHost;

/**
 * 电池管理界面
 * @author chensichu
 *
 */
public class BatteryManagerMainActivity extends TabActivity implements OnCheckedChangeListener {
    private TabHost mHost;
    private Intent mBatteryInfoIntent; //
    private Intent mSavinBatteryStyleIntent; //
    private String TAB1 = "batterinfo";
    private String TAB2 = "savingbattery";
    private RadioButton battaryinfo;
    private RadioButton savingBatteryStyle;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // TODO Auto-generated method stub
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.batttrymanagermain_activity);
        mBatteryInfoIntent = new Intent(this, BatteryInfoActivity.class);
        mSavinBatteryStyleIntent = new Intent(this, SavingBatteryStyleActivity.class);
        initRadios();
        setupIntent();
    }
    /**
     * 初始化底部按钮
     */
    private void initRadios() {
        battaryinfo = (RadioButton) findViewById(biz.AR.id.batteryManager_radio_battaryinfo);
        battaryinfo.setOnCheckedChangeListener(this);
        savingBatteryStyle = (RadioButton) findViewById(biz.AR.id.batteryManager_radio_savingBatteryStyle);
        savingBatteryStyle.setOnCheckedChangeListener(this);
    }
    /**
     * 设置底部栏目图标等信息
     */
    private void setupIntent() {
        mHost = getTabHost();
        TabHost localTabHost = mHost;
        //电池信息
        localTabHost.addTab(buildTabSpec(TAB1, biz.AR.string.batteryManager_battaryinfo_str, biz.AR.drawable.icon, mBatteryInfoIntent));
        //省电模式
        localTabHost.addTab(buildTabSpec(TAB2, biz.AR.string.batteryManager_saveBattaryStyle_str, biz.AR.drawable.icon, mSavinBatteryStyleIntent));
    }
    /**
     * 设置底部栏目点击后指向的Activity
     * @param tag 标签，用来区分各个Tab
     * @param resLabel Tab显示的字符
     * @param resIcon  Tab显示的图片
     * @param content  所指向的activity
     * @return  TabHost.TabSpec
     */
    private TabHost.TabSpec buildTabSpec(String tag, int resLabel, int resIcon, final Intent content) {
        return mHost.newTabSpec(tag).setIndicator(getString(resLabel), getResources().getDrawable(resIcon)).setContent(content);
    }
    @Override
    public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
        // TODO Auto-generated method stub
        if (isChecked) {
            switch (buttonView.getId()) {
                case biz.AR.id.batteryManager_radio_battaryinfo:
                    mHost.setCurrentTabByTag(TAB1);
                    //				battaryinfo.setTextColor(Color.WHITE);
                    //				savingBatteryStyle.setTextColor(Color.BLACK);
                    break;
                case biz.AR.id.batteryManager_radio_savingBatteryStyle:
                    mHost.setCurrentTabByTag(TAB2);
                    //				battaryinfo.setTextColor(Color.BLACK);
                    //				savingBatteryStyle.setTextColor(Color.WHITE);
                    break;
            }
        }
    }
    @Override
    protected void onResume() {
        // TODO Auto-generated method stub
        super.onResume();
    }
}
