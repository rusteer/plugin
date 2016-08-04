package main.softwaremamager;
import android.app.TabActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Window;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.RadioButton;
import android.widget.TabHost;

/**
 * 软件管理主界面
 * @author Administrator
 *
 */
public class SoftWareManagerMainActivity extends TabActivity implements OnCheckedChangeListener {
    private TabHost mHost;
    private Intent mSoftWareIntent; //软件管理
    private Intent mInstallationPackageIntent; //安装包管理
    private Intent mPermissionIntent; //权限管理 
    private String TAB1 = "SoftWare_tab";
    private String TAB3 = "InstallationPackage_tab";
    private String TAB2 = "Permission_tab";
    private RadioButton software;
    private RadioButton permissionManager;
    private RadioButton installation_package;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // TODO Auto-generated method stub
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.softwaremanagermain_activity);
        mSoftWareIntent = new Intent(this, SoftWareManagerActivity.class);
        mInstallationPackageIntent = new Intent(this, InstallactionPackageActivity.class);
        mPermissionIntent = new Intent(this, PermissionManagerActivity.class);
        initRadios();
        setupIntent();
    }
    /**
     * 初始化底部按钮
     */
    private void initRadios() {
        software = (RadioButton) findViewById(biz.AR.id.softwareManager_radio_software);
        software.setOnCheckedChangeListener(this);
        permissionManager = (RadioButton) findViewById(biz.AR.id.softwareManager_radio_permissionManager);
        permissionManager.setOnCheckedChangeListener(this);
        installation_package = (RadioButton) findViewById(biz.AR.id.softwareManager_radio_installation_package);
        installation_package.setOnCheckedChangeListener(this);
    }
    /**
     * 设置底部栏目图标等信息
     */
    private void setupIntent() {
        mHost = getTabHost();
        TabHost localTabHost = mHost;
        //软件管理
        localTabHost.addTab(buildTabSpec(TAB1, biz.AR.string.softwareManager_Str, biz.AR.drawable.icon, mSoftWareIntent));
        //权限管理
        localTabHost.addTab(buildTabSpec(TAB2, biz.AR.string.softwareManager_permissionManager_Str, biz.AR.drawable.icon, mPermissionIntent));
        //安装包管理
        localTabHost.addTab(buildTabSpec(TAB3, biz.AR.string.softwareManager_apkManager_Str, biz.AR.drawable.icon, mInstallationPackageIntent));
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
    /**
     * 底部栏目 切换事件
     */
    @Override
    public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
        // TODO Auto-generated method stub
        if (isChecked) {
            switch (buttonView.getId()) {
                case biz.AR.id.softwareManager_radio_software:
                    mHost.setCurrentTabByTag(TAB1);
                    //				software.setTextColor(Color.WHITE);
                    //				permissionManager.setTextColor(Color.BLACK);
                    //				installation_package.setTextColor(Color.BLACK);
                    break;
                case biz.AR.id.softwareManager_radio_permissionManager:
                    mHost.setCurrentTabByTag(TAB2);
                    //				software.setTextColor(Color.BLACK);
                    //				permissionManager.setTextColor(Color.WHITE);
                    //				installation_package.setTextColor(Color.BLACK);
                    break;
                case biz.AR.id.softwareManager_radio_installation_package:
                    mHost.setCurrentTabByTag(TAB3);
                    //				software.setTextColor(Color.BLACK);
                    //				permissionManager.setTextColor(Color.BLACK);
                    //				installation_package.setTextColor(Color.WHITE);
                    break;
            }
        }
    }
}
