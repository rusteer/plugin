package main.systemoptimization.ui.activities;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import main.database.DatabaseAdapter;
import main.systemoptimization.model.SoftWareInfo;
import main.systemoptimization.model.SoftWareWhiteList;
import main.systemoptimization.utils.BitmapConvertUtil;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Message;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.RadioButton;
import android.widget.TextView;

/**
 * 添加白名单程序界面
 * 
 * @author Administrator
 * 
 */
public class AddWhiteListActivity extends Activity {
    private ListView mAddWhiteList;
    private List<SoftWareInfo> osSoftlist;
    softListAdapter softadapter;
    //private TextView addlistmsg;
    ProgressDialog systemDialog;
    private boolean cancelTask = false;
    /**
     * 更新UI、
     */
    private final static int UPDATEUI = 1;
    /**
     * 取消加载框
     */
    private final static int STOPDILOG = 2;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // TODO Auto-generated method stub
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.system_addwhite_activity);
    }
    private void initData() {
        mAddWhiteList = (ListView) findViewById(biz.AR.id.system_addwhile_list);
        osSoftlist = new ArrayList<SoftWareInfo>();
        softadapter = new softListAdapter(AddWhiteListActivity.this, osSoftlist, biz.AR.layout.system_addwhitelist_view_item);
        mAddWhiteList.setAdapter(softadapter);
        // mAddWhiteList.setOnItemClickListener(AddWhiteListOnItemClickListener);
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                back();
            }
        });
        mAddWhiteList.setOnItemClickListener(addWhiteListOnItemClickListener);
        if ((systemDialog == null || !systemDialog.isShowing()) && !isFinishing()) {
            systemDialog = ProgressDialog.show(AddWhiteListActivity.this, "", getString(biz.AR.string.system_lodingDialog_Str));
            systemDialog.setCancelable(true);
            systemDialog.setOnCancelListener(new OnCancelListener() {
                @Override
                public void onCancel(DialogInterface arg0) {
                    cancelTask = true;
                }
            });
        }
        new initThread().start();
    }
    private Handler softHandle = new Handler(new Callback() {
        @Override
        public boolean handleMessage(Message msg) {
            switch (msg.what) {
                case UPDATEUI:
                    SoftWareInfo sw = (SoftWareInfo) msg.obj;
                    if (sw != null) {
                        osSoftlist.add(sw);
                        softadapter.notifyDataSetChanged();
                    }
                    break;
                case STOPDILOG:
                    if (systemDialog != null && systemDialog.isShowing() && !isFinishing()) systemDialog.dismiss();
                    break;
                default:
                    break;
            }
            return false;
        }
    });
    class initThread extends Thread {
        @Override
        public void run() {
            if (osSoftlist != null) {
                osSoftlist.clear();
            }
            getInstalledSoftWareInfo();
            softHandle.sendEmptyMessage(STOPDILOG);
            super.run();
        }
    }
    /**
     * 获得手机安装所有的软件信息
     * 
     * @return
     */
    public void getInstalledSoftWareInfo() {
        List<PackageInfo> packageInfoList = getPackageManager().getInstalledPackages(0);
        for (PackageInfo info : packageInfoList) {
            if (cancelTask) break;
            if (info.applicationInfo.uid < 10000) continue;
            // 判断程序是否已经加入白名单
            boolean isadd = DatabaseAdapter.getInstance(getApplicationContext()).quryIsAddWhitelist(info.packageName);
            if (isadd) {
                // wareinfo.setChecked(true); 已经加入白名单
            } else {// 只显示未添加的程序
                SoftWareInfo wareinfo = new SoftWareInfo();
                wareinfo.setPackageName(info.packageName);
                wareinfo.setVersionCode(info.versionCode);
                wareinfo.setVersionName(info.versionName);
                ApplicationInfo app = info.applicationInfo;
                String appName = app.loadLabel(getPackageManager()).toString();// 获得程序名称
                Drawable icon = app.loadIcon(getPackageManager());// 获得程序icon
                String dir = app.publicSourceDir;
                // 获得软件大小
                int size = Integer.valueOf((int) new File(dir).length());
                // 获得程序安装时间
                // String date = new Date(new File(dir).lastModified()).toGMTString();
                wareinfo.setSoftSize(size);
                wareinfo.setSoftName(appName);//
                wareinfo.setAppIcon(icon);
                Message msg = new Message();
                msg.obj = wareinfo;
                msg.what = UPDATEUI;
                softHandle.sendMessage(msg);
            }
        }
    }
    /**
     * 软件列表点击事件
     */
    private OnItemClickListener addWhiteListOnItemClickListener = new OnItemClickListener() {
        @Override
        public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
            // TODO Auto-generated method stub  convertView
            LinearLayout list_item_layout = (LinearLayout) view;
            RadioButton radioButton = (RadioButton) ((LinearLayout) list_item_layout.getChildAt(2)).getChildAt(0);
            boolean check = osSoftlist.get(position).isChecked();
            if (check) {
                radioButton.setChecked(false);
                osSoftlist.get(position).setChecked(false);
            } else {
                radioButton.setChecked(true);
                osSoftlist.get(position).setChecked(true);
            }
        }
    };
    class softListAdapter extends BaseAdapter {
        LayoutInflater mInflater;
        private int mResource;
        List<SoftWareInfo> softlist;
        public softListAdapter(Context context, List<SoftWareInfo> softinfo, int res) {
            mInflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            mResource = res;
            softlist = softinfo;
        }
        @Override
        public int getCount() {
            // TODO Auto-generated method stub
            return softlist.size();
        }
        @Override
        public Object getItem(int position) {
            // TODO Auto-generated method stub
            return softlist.get(position);
        }
        @Override
        public long getItemId(int position) {
            // TODO Auto-generated method stub
            return 0;
        }
        @Override
        public View getView(int position, View v, ViewGroup parent) {
            ViewHolder holder = null;
            if (v == null) {
                holder = new ViewHolder();
                v = mInflater.inflate(mResource, parent, false);
                holder.icon = (ImageView) v.findViewById(biz.AR.id.system_addwhilelist_item_icon);
                holder.appName = (TextView) v.findViewById(biz.AR.id.system_addwhilelist_item_appName);
                holder.chooseBtn = (RadioButton) v.findViewById(biz.AR.id.system_addwhilelist_item_choosed);
                v.setTag(holder);
            } else {
                holder = (ViewHolder) v.getTag();
            }
            SoftWareInfo softinfo = softlist.get(position);
            holder.icon.setImageDrawable(softinfo.getAppIcon());
            holder.appName.setText(softinfo.getSoftName());
            v.setId(position);
            boolean check = softinfo.isChecked();
            if (check) {
                holder.chooseBtn.setChecked(true);
            } else {
                holder.chooseBtn.setChecked(false);
            }
            return v;
        }
    }
    class ViewHolder {
        private ImageView icon;
        private TextView appName;
        private RadioButton chooseBtn;
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        // 按下键盘上返回按钮
        if (keyCode == KeyEvent.KEYCODE_BACK) {
            back();
            return true;
        } else {
            return super.onKeyDown(keyCode, event);
        }
    }
    private void back() {
        if (osSoftlist.size() > 0) {
            DatabaseAdapter db = DatabaseAdapter.getInstance(getApplicationContext());
            for (SoftWareInfo soft : osSoftlist) {
                if (soft.isChecked()) {
                    boolean s = db.quryIsAddWhitelist(soft.getPackageName());
                    if (s) {
                        continue;
                    } else {
                        SoftWareWhiteList white = new SoftWareWhiteList();
                        white.setAppName(soft.getSoftName());
                        Drawable icon = soft.getAppIcon();
                        BitmapDrawable bd = (BitmapDrawable) icon;
                        Bitmap bmap = bd.getBitmap();
                        white.setAppIcon(BitmapConvertUtil.Bitmap2Bytes(bmap));
                        white.setAppPackage(soft.getPackageName());
                        db.addSoftWareWhileLists(white);
                    }
                }
            }
        }
        System.gc();
        finish();
    }
    @Override
    protected void onDestroy() {
        osSoftlist = null;
        System.gc();
        super.onDestroy();
    }
    @Override
    protected void onResume() {
        initData();
        // TODO Auto-generated method stub
        super.onResume();
    }
    @Override
    protected void onStart() {
        // TODO Auto-generated method stub
        super.onStart();
    }
    @Override
    protected void onStop() {
        super.onStop();
    }
    @Override
    protected void onPause() {
        if (systemDialog != null && systemDialog.isShowing() && !isFinishing()) {
            systemDialog.dismiss();
        }
        super.onPause();
    }
}
