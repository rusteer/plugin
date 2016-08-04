package main.systemoptimization.ui.activities;
import java.util.List;
import main.database.DatabaseAdapter;
import main.systemoptimization.model.SoftWareWhiteList;
import main.systemoptimization.utils.BitmapConvertUtil;
import main.systemoptimization.utils.PackageUtil;
import main.systemoptimization.utils.SystemConstants;
import net.workspace.util.Logger;
import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.app.TabActivity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.KeyEvent;
import android.view.Window;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.RadioButton;
import android.widget.TabHost;

/**
 * 系统优化主界面
 * @author Administrator
 *
 */
public class SystemOptimizationActivity extends TabActivity implements OnCheckedChangeListener {
    private TabHost mHost;
    private Intent mTaskManagementIntent; //任务管理
    private Intent mWhiteListIntent; //白名单
    private Intent mclearCacheIntent; //缓存清除
    //private Intent mBootIntent;    //开机加速
    //	private Intent mOptimizationIntent;    //一键加速界面
    private SharedPreferences settings;
    private SharedPreferences.Editor editor;
    private String TAB1 = "TaskManagement_tab";
    private String TAB2 = "WhiteList_tab";
    private String TAB3 = "clearCache_tab";
    //	private String TAB4="boot_tab";  
    //	private String TAB5="optimization_tab";  
    private RadioButton mTaskManagementBtn;
    private RadioButton mWhiteListBtn;
    private RadioButton mclearCacheBtn;
    //	private RadioButton mBootBtn;
    //	private RadioButton mOptimizationBtn;
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        // 按下键盘上返回按钮
        if (keyCode == KeyEvent.KEYCODE_BACK) {
            System.gc();
            finish();
            return true;
        } else {
            return super.onKeyDown(keyCode, event);
        }
    }
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.system_optimization_activity);
        try {
            mTaskManagementIntent = new Intent(this, TaskManagementActivity.class);
            mWhiteListIntent = new Intent(this, WhiteListActivity.class);
            mclearCacheIntent = new Intent(this, ClearCacheActivity.class);
            //this.mBootIntent=new Intent(this,BootStarpSpeedupActivity.class);
            //  this.mOptimizationIntent=new Intent(this,PhoneSpeedup.class) ;
            settings = PreferenceManager.getDefaultSharedPreferences(SystemOptimizationActivity.this);
            editor = settings.edit();
            initRadios();
            setupIntent();
            boolean stat = settings.getBoolean(SystemConstants.SYSTEMOPTIMIZATION_INIT_WHITELIST, false);
            if (!stat) {
                new initsoftwareThread().start();
            }
        } catch (Throwable e) {
            Logger.error(e);
            return;
        }
    }
    /**
     * 初始化底部按钮
     */
    private void initRadios() {
        mTaskManagementBtn = (RadioButton) findViewById(biz.AR.id.SystemOptimization_radio_TaskManagement);
        mTaskManagementBtn.setOnCheckedChangeListener(this);
        mclearCacheBtn = (RadioButton) findViewById(biz.AR.id.SystemOptimization_radio_ClearCache);
        mclearCacheBtn.setOnCheckedChangeListener(this);
        mWhiteListBtn = (RadioButton) findViewById(biz.AR.id.SystemOptimization_radio_WhiteList);
        mWhiteListBtn.setOnCheckedChangeListener(this);
        //		mBootBtn=((RadioButton) findViewById(biz.AR.id.SystemOptimization_radio_BootStarpSpeedup));
        //		mBootBtn.setOnCheckedChangeListener(this);  
        //		mOptimizationBtn=((RadioButton) findViewById(biz.AR.id.SystemOptimization_radio_optpage));
        //		mOptimizationBtn.setOnCheckedChangeListener(this);  
    }
    /**
     * 设置底部栏目图标等信息
     */
    private void setupIntent() {
        mHost = getTabHost();
        TabHost localTabHost = mHost;
        //任务管理
        localTabHost.addTab(buildTabSpec(TAB1, biz.AR.string.SystemOptimizationActivity_TaskManagement_Str, biz.AR.drawable.icon, mTaskManagementIntent));
        //白名单
        localTabHost.addTab(buildTabSpec(TAB2, biz.AR.string.SystemOptimizationActivity_WhiteList_Str, biz.AR.drawable.icon, mWhiteListIntent));
        //缓存清除
        localTabHost.addTab(buildTabSpec(TAB3, biz.AR.string.SystemOptimizationActivity_ClearCache_Str, biz.AR.drawable.icon, mclearCacheIntent));
        //开机加速
        //		localTabHost.addTab(buildTabSpec(TAB4, biz.AR.string.SystemOptimizationActivity_BootStarpSpeedup_Str,
        //				biz.AR.drawable.icon, this.mBootIntent)); 
        //
        //		localTabHost.addTab(buildTabSpec(TAB5, biz.AR.string.TaskManagementActivity_OneKeyOptimization_Str,
        //				biz.AR.drawable.icon, this.mOptimizationIntent)); 
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
        if (isChecked) {
            switch (buttonView.getId()) {
                case biz.AR.id.SystemOptimization_radio_TaskManagement:
                    mHost.setCurrentTabByTag(TAB1);
                    //				mTaskManagementBtn.setTextColor(Color.WHITE);
                    //				mWhiteListBtn.setTextColor(Color.BLACK);
                    //				mclearCacheBtn.setTextColor(Color.BLACK);
                    //				mBootBtn.setTextColor(Color.BLACK);
                    break;
                case biz.AR.id.SystemOptimization_radio_WhiteList:
                    //				mWhiteListBtn.setTextColor(Color.WHITE);
                    //				
                    //				mTaskManagementBtn.setTextColor(Color.BLACK);
                    //				mclearCacheBtn.setTextColor(Color.BLACK);
                    //				mBootBtn.setTextColor(Color.BLACK);
                    mHost.setCurrentTabByTag(TAB2);
                    break;
                case biz.AR.id.SystemOptimization_radio_ClearCache:
                    //				mclearCacheBtn.setTextColor(Color.WHITE);
                    //				mWhiteListBtn.setTextColor(Color.BLACK);
                    //				mTaskManagementBtn.setTextColor(Color.BLACK);
                    //				mBootBtn.setTextColor(Color.BLACK);
                    mHost.setCurrentTabByTag(TAB3);
                    break;
            //			case biz.AR.id.SystemOptimization_radio_BootStarpSpeedup:
            //				mBootBtn.setTextColor(Color.WHITE);
            //				mclearCacheBtn.setTextColor(Color.BLACK);
            //				mWhiteListBtn.setTextColor(Color.BLACK);
            //				mTaskManagementBtn.setTextColor(Color.BLACK);
            //				this.mHost.setCurrentTabByTag(TAB4);
            //				break;
            //				//一键优化主界面
            //			case biz.AR.id.SystemOptimization_radio_optpage:
            //				mBootBtn.setTextColor(Color.WHITE);
            //				mclearCacheBtn.setTextColor(Color.BLACK);
            //				mWhiteListBtn.setTextColor(Color.BLACK);
            //				mTaskManagementBtn.setTextColor(Color.BLACK);
            //				this.mHost.setCurrentTabByTag(TAB5);
            //				break;
            }
        }
    }
    /**
     *  初始化白名单列表 处理线程 
     * @author Administrator
     *
     */
    class initsoftwareThread extends Thread {
        @Override
        public void run() {
            initSoftWareWhiteList();
            super.run();
        }
    }
    /**
     * 初始化白名单列表
     */
    private void initSoftWareWhiteList() {
        SoftWareWhiteList softwarelist = new SoftWareWhiteList();
        PackageManager pm = getPackageManager();
        ActivityManager activityManager = (ActivityManager) getSystemService(ACTIVITY_SERVICE);
        List<RunningAppProcessInfo> procList = activityManager.getRunningAppProcesses();
        PackageUtil packageUtil = new PackageUtil(SystemOptimizationActivity.this);
        for (RunningAppProcessInfo procInfo : procList) {
            ApplicationInfo appinfo = packageUtil.getApplicationInfo(procInfo.processName);
            if (appinfo != null) {
                if (PackageUtil.isOsAppProcessInfo(appinfo) && procInfo.uid > 9999) {
                    Drawable dm = appinfo.loadIcon(pm);
                    Bitmap bm = ((BitmapDrawable) dm).getBitmap();
                    byte[] bm2byte = null;
                    if (bm != null) {
                        bm2byte = BitmapConvertUtil.Bitmap2Bytes(bm);
                        softwarelist.setAppIcon(bm2byte);
                    }
                    softwarelist.setAppName(appinfo.loadLabel(pm).toString());
                    softwarelist.setAppPackage(appinfo.packageName);
                    DatabaseAdapter.getInstance(getApplicationContext()).addSoftWareWhileLists(softwarelist);
                }
            }
        }
        editor.putBoolean(SystemConstants.SYSTEMOPTIMIZATION_INIT_WHITELIST, true);
        editor.commit();
    }
    @Override
    protected void onResume() {
        super.onResume();
    }
    @Override
    protected void onStop() {
        super.onStop();
    }
    @Override
    protected void onDestroy() {
        System.gc();
        super.onDestroy();
    }
}
