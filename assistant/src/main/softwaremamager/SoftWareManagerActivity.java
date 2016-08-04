package main.softwaremamager;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import main.softwaremamager.methods.SoftWareManagerUtile;
import main.softwaremamager.methods.SoftWareMoveContentListElement;
import main.systemoptimization.utils.PackageUtil;
import net.workspace.util.Logger;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.graphics.drawable.Drawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.RadioButton;
import android.widget.TextView;

/**
 * 软件管理界面
 * @author Administrator
 *
 */
public class SoftWareManagerActivity extends Activity {
    private TextView softwareManager_software_sdtips;//sd卡容量提示
    private TextView softwareManager_software_phonetips;//手机容量提示
    private LinearLayout softwareManager_software_sdlayout;//SD卡软件展示
    private LinearLayout softwareManager_software_phonelayout;//手机软件展示
    private RadioButton mSoftWarePhoneBtn;//手机软件展示
    private RadioButton mSoftWareSDBtn;//SD卡软件展示
    private ListView mSoftWarePhoneList; //手机软件展示列表
    private ListView mSoftWareSDList; //SD卡软件展示列表
    private mySoftListAdapter mSoftWarePhoneListAdapter;
    private mySoftListAdapter mSoftWareSDListAdapter;
    private ProgressDialog systemDialog;
    private boolean cancel_task = false;
    private Map<String, List<SoftWareMoveContentListElement>> softMap;
    private String phoneRom = "";
    private String sdRom = "";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.softwaremanager_activity);
    }
    /**
     * 初始化UI各个控件
     */
    private void initUI() {
        softwareManager_software_sdtips = (TextView) findViewById(biz.AR.id.softwareManager_software_sdtips);
        softwareManager_software_phonetips = (TextView) findViewById(biz.AR.id.softwareManager_software_phonetips);
        softwareManager_software_sdlayout = (LinearLayout) findViewById(biz.AR.id.softwareManager_software_sdlayout);
        softwareManager_software_phonelayout = (LinearLayout) findViewById(biz.AR.id.softwareManager_software_phonelayout);
        mSoftWarePhoneBtn = (RadioButton) findViewById(biz.AR.id.softwareManager_phone_Btn);
        mSoftWarePhoneBtn.setOnClickListener(new ClickEnvent());
        mSoftWareSDBtn = (RadioButton) findViewById(biz.AR.id.softwareManager_SD_Btn);
        mSoftWareSDBtn.setOnClickListener(new ClickEnvent());
        mSoftWarePhoneList = (ListView) findViewById(biz.AR.id.softwareManager_software_phonelist);
        mSoftWareSDList = (ListView) findViewById(biz.AR.id.softwareManager_software_SDlist);
        //首先进入界面时设置软件搬家界面为不显示
        softwareManager_software_phonelayout.setVisibility(View.VISIBLE);
        softwareManager_software_sdlayout.setVisibility(View.GONE);
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                SoftWareManagerActivity.this.finish();
            }
        });
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) { // 按下的如果是BACK，同时没有重复
            System.gc();
            SoftWareManagerActivity.this.finish();
            return false;
        }
        return super.onKeyDown(keyCode, event);
    }
    /**
     * 刷新软件列表
     */
    private void refreshSoftWareList() {
        softwareManager_software_phonetips.setText(phoneRom);
        softwareManager_software_sdtips.setText(sdRom);
        mSoftWarePhoneListAdapter = new mySoftListAdapter(SoftWareManagerActivity.this);
        mSoftWareSDListAdapter = new mySoftListAdapter(SoftWareManagerActivity.this);
        //初始化SD卡移动到手机的软件列表界面
        List<SoftWareMoveContentListElement> moveToPhoneSoftMap = softMap.get("INSTALLDIRTO_PHONE");
        if (moveToPhoneSoftMap.size() > 0) {
            mSoftWarePhoneListAdapter.addList(moveToPhoneSoftMap);
        }
        //初始化手机移动到SD卡的软件列表界面
        List<SoftWareMoveContentListElement> moveToSDsoftMap = softMap.get("INSTALLDIRTO_SD");
        if (moveToSDsoftMap.size() > 0) {
            mSoftWareSDListAdapter.addList(moveToSDsoftMap);
        }
        mSoftWarePhoneList.setAdapter(mSoftWarePhoneListAdapter);
        mSoftWarePhoneList.invalidate();
        mSoftWarePhoneListAdapter.notifyDataSetChanged();
        //手机内存软件
        mSoftWareSDList.setAdapter(mSoftWareSDListAdapter);
        mSoftWareSDList.invalidate();
        mSoftWareSDListAdapter.notifyDataSetChanged();
    }
    public class TaskAsyncTask extends AsyncTask<Void, Void, Void> {
        @Override
        protected void onPreExecute() {
            cancel_task = false;
            if ((systemDialog == null || !systemDialog.isShowing()) && !isFinishing()) {
                systemDialog = ProgressDialog.show(SoftWareManagerActivity.this, "", getString(biz.AR.string.system_lodingDialog_Str));
                systemDialog.setCancelable(true);
                systemDialog.setOnCancelListener(new OnCancelListener() {
                    @Override
                    public void onCancel(DialogInterface arg0) {
                        cancel_task = true;
                    }
                });
            }
        }
        // 处理后台执行的任务，在后台线程执行   
        @Override
        protected Void doInBackground(Void... arg0) {
            try {
                softMap = getPhoneInstalledSoftWareInfo();
                SoftWareManagerUtile swu = new SoftWareManagerUtile();
                phoneRom = swu.getPhoneUseROMStr();
                sdRom = swu.getSDUseROMStr();
            } catch (Throwable e) {
                Logger.error(e);
            }
            return null;
        }
        // 后台任务执行完之后被调用，在ui线程执行   
        @Override
        protected void onPostExecute(Void result) {
            refreshSoftWareList();
            if (systemDialog != null && systemDialog.isShowing() && !isFinishing()) systemDialog.dismiss();
            super.onPostExecute(result);
        }
    };
    class ClickEnvent implements OnClickListener {
        /**
         * ui控件点击事件
         */
        @Override
        public void onClick(View v) {
            switch (v.getId()) {
                case biz.AR.id.softwareManager_phone_Btn:
                    mSoftWarePhoneBtn.setTextColor(getResources().getColor(biz.AR.color.txt_label_blue));
                    mSoftWareSDBtn.setTextColor(getResources().getColor(biz.AR.color.txt_label_black));
                    softwareManager_software_phonelayout.setVisibility(View.VISIBLE);
                    softwareManager_software_sdlayout.setVisibility(View.GONE);
                    break;
                //点击SD卡TAB标签按钮
                case biz.AR.id.softwareManager_SD_Btn:
                    mSoftWarePhoneBtn.setTextColor(getResources().getColor(biz.AR.color.txt_label_black));
                    mSoftWareSDBtn.setTextColor(getResources().getColor(biz.AR.color.txt_label_blue));
                    softwareManager_software_phonelayout.setVisibility(View.GONE);
                    softwareManager_software_sdlayout.setVisibility(View.VISIBLE);
                    break;
            }
        }
    }
    /**
     * 获得手机可以卸载的安装程序所有的软件信息
     * 
     * @return
     */
    public Map<String, List<SoftWareMoveContentListElement>> getPhoneInstalledSoftWareInfo() {
        Map<String, List<SoftWareMoveContentListElement>> softMap = new HashMap<String, List<SoftWareMoveContentListElement>>();
        List<SoftWareMoveContentListElement> SoftWareListPhone = new ArrayList<SoftWareMoveContentListElement>();
        List<SoftWareMoveContentListElement> SoftWareListSD = new ArrayList<SoftWareMoveContentListElement>();
        List<PackageInfo> packageInfoList = getPackageManager().getInstalledPackages(0);
        for (PackageInfo info : packageInfoList) {
            if (cancel_task) break;
            SoftWareMoveContentListElement wareinfo = new SoftWareMoveContentListElement();
            if (!info.packageName.equals(getApplicationInfo().packageName)) { //不是当前应用
                wareinfo.setAppPackage(info.packageName);
                wareinfo.setAppVersion(info.versionName);
                ApplicationInfo app = info.applicationInfo;
                if (!PackageUtil.isOsAppProcessInfo(app)) {
                    String appName = app.loadLabel(getPackageManager()).toString();// 获得程序名称
                    Drawable icon = app.loadIcon(getPackageManager());// 获得程序icon
                    String dir = app.publicSourceDir;
                    // 获得软件大小
                    int size = Integer.valueOf((int) new File(dir).length());
                    wareinfo.setAppVolume(PackageUtil.formatFileSize(size));
                    wareinfo.setAppName(appName);
                    wareinfo.setAppIcon(icon);
                    int isdir = PackageUtil.isSoftInstllSDorPhone(app);
                    if (isdir == 0) {
                        // 安装在手机内存
                        SoftWareListPhone.add(wareinfo);
                    } else {
                        SoftWareListSD.add(wareinfo);
                    }
                }
            }
        }
        softMap.put("INSTALLDIRTO_PHONE", SoftWareListPhone);
        softMap.put("INSTALLDIRTO_SD", SoftWareListSD);
        return softMap;
    }
    /**
     * 软件列表适配器
     * @author Administrator
     *
     */
    class mySoftListAdapter extends BaseAdapter {
        private Context context;
        private ArrayList<SoftWareMoveContentListElement> listElement;
        private LayoutInflater inflater;
        public mySoftListAdapter(Context context) {
            this.context = context;
            inflater = (LayoutInflater) context.getSystemService("layout_inflater");
            listElement = new ArrayList<SoftWareMoveContentListElement>();
        }
        @Override
        public int getCount() {
            return listElement.size();
        }
        @Override
        public Object getItem(int position) {
            return listElement.get(position);
        }
        @Override
        public long getItemId(int position) {
            return position;
        }
        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            return listElement.get(position).getViewForListElement(inflater, context, convertView);
        }
        public void addList(List<SoftWareMoveContentListElement> elements) {
            listElement.addAll(elements);
        }
    }
    @Override
    protected void onDestroy() {
        super.onDestroy();
    }
    @Override
    protected void onResume() {
        initUI();
        new TaskAsyncTask().execute();
        super.onResume();
    }
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
    }
    @Override
    protected void onPause() {
        if (systemDialog != null && systemDialog.isShowing() && !isFinishing()) {
            systemDialog.dismiss();
        }
        super.onPause();
    }
}
