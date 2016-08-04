package main.softwaremamager;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import main.softwaremamager.model.AppInfoData;
import main.systemoptimization.utils.BitmapConvertUtil;
import main.systemoptimization.utils.PackageUtil;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.Intent;
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
import android.widget.ListView;
import android.widget.TextView;

/**
 * 权限管理
 * @author Administrator
 *
 */
public class PermissionManagerActivity extends Activity {
    private TextView mPermissionmanagerTatalCount;
    private ListView mPermissionList;
    private softListAdapter adapter;
    private List<AppInfoData> softinfo;
    ProgressDialog systemDialog;
    private boolean cancel_task = false;
    private final int UPDATELIST = 0;
    /**
     * 软件权限信息包名
     */
    public final String PERMISSION_PACKAGENAME = "permission_packageName";
    /**
     * 软件权限信息icon
     */
    public final String PERMISSION_APPICON = "permission_appicon";
    /**
     * 软件权限信息软件名称
     */
    public final String PERMISSION_APPNAME = "permission_appname";
    /**
     * 软件权限信息软件版本
     */
    public final String PERMISSION_APPVERSION = "permission_appversion";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // TODO Auto-generated method stub
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.softwaremanager_permissionmanager_activity);
    }
    private void initData() {
        softinfo = new ArrayList<AppInfoData>();
        mPermissionList = (ListView) findViewById(biz.AR.id.softwaremanager_permissionmanager_list);
        mPermissionList.setOnItemClickListener(mPermissionListOnItemClickListener);
        mPermissionmanagerTatalCount = (TextView) findViewById(biz.AR.id.softwaremanager_permissionmanager_list_msg);
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                PermissionManagerActivity.this.finish();
            }
        });
        cancel_task = false;
        if ((systemDialog == null || !systemDialog.isShowing()) && !isFinishing()) {
            systemDialog = ProgressDialog.show(this, "", getString(biz.AR.string.system_lodingDialog_Str));
            systemDialog.setCancelable(true);
            systemDialog.setOnCancelListener(new OnCancelListener() {
                @Override
                public void onCancel(DialogInterface arg0) {
                    cancel_task = true;
                }
            });
        }
        new lodingSoftListThread().start();
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) { // 按下的如果是BACK，同时没有重复
            System.gc();
            PermissionManagerActivity.this.finish();
            return false;
        }
        return super.onKeyDown(keyCode, event);
    }
    private Handler myHandler = new Handler(new Callback() {
        @Override
        public boolean handleMessage(Message msg) {
            // TODO Auto-generated method stub
            switch (msg.what) {
                case UPDATELIST:
                    reflshListUI();
                    if (systemDialog != null && systemDialog.isShowing() && !isFinishing()) systemDialog.dismiss();
                    break;
            }
            return false;
        }
    });
    private void reflshListUI() {
        adapter = new softListAdapter(getApplicationContext(), softinfo, biz.AR.layout.softwaremanager_permissionmanager_list_item);
        mPermissionList.setAdapter(adapter);
        mPermissionmanagerTatalCount.setText(softinfo.size() + "");
    }
    class lodingSoftListThread extends Thread {
        @Override
        public void run() {
            // TODO Auto-generated method stub
            softinfo = getInstalledSoftWareInfo();
            myHandler.sendEmptyMessage(UPDATELIST);
            super.run();
        }
    }
    /**
     * 获得手机安装程序所有的软件信息
     * @return
     */
    public List<AppInfoData> getInstalledSoftWareInfo() {
        List<AppInfoData> softInfos = new ArrayList<AppInfoData>();
        List<PackageInfo> packageInfoList = getPackageManager().getInstalledPackages(0);
        for (PackageInfo info : packageInfoList) {
            if (cancel_task) break;
            AppInfoData wareinfo = new AppInfoData();
            wareinfo.setApppackage(info.packageName);
            wareinfo.setAppVersionCode(info.versionCode + "");
            wareinfo.setAppVersion(info.versionName);
            ApplicationInfo app = info.applicationInfo;
            if (!PackageUtil.isOsAppProcessInfo(app)) {
                String appName = app.loadLabel(getPackageManager()).toString();//获得程序名称
                Drawable icon = app.loadIcon(getPackageManager());//获得程序icon
                String dir = app.publicSourceDir;
                //获得软件大小 
                int size = Integer.valueOf((int) new File(dir).length());
                //获得程序安装时间
                //				String date = new Date(new File(dir).lastModified()).toGMTString();  
                wareinfo.setAppDirSize(PackageUtil.formatFileSize(size));
                wareinfo.setAppname(appName);//
                wareinfo.setAppicon(icon);
                softInfos.add(wareinfo);
            }
        }
        return softInfos;
    }
    /**
     * 列表点击事件监听
     */
    private OnItemClickListener mPermissionListOnItemClickListener = new OnItemClickListener() {
        @Override
        public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
            // TODO Auto-generated method stub
            Intent intent = new Intent(PermissionManagerActivity.this, PermissionInfoActivity.class);
            AppInfoData appdata = softinfo.get(position);
            String softPackName = appdata.getApppackage();
            intent.putExtra(PERMISSION_PACKAGENAME, softPackName);
            Drawable icon = appdata.getAppicon();
            BitmapDrawable bd = (BitmapDrawable) icon;
            Bitmap bmap = bd.getBitmap();
            byte[] appIcon = BitmapConvertUtil.Bitmap2Bytes(bmap);
            intent.putExtra(PERMISSION_APPICON, appIcon);
            intent.putExtra(PERMISSION_APPNAME, appdata.getAppname());
            intent.putExtra(PERMISSION_APPVERSION, appdata.getAppVersion());
            PermissionManagerActivity.this.startActivity(intent);
        }
    };
    /**
     * 程序列表适配器 
     * @author Administrator
     *
     */
    class softListAdapter extends BaseAdapter {
        LayoutInflater mInflater;
        private int mResource;
        List<AppInfoData> softlist;
        public softListAdapter(Context context, List<AppInfoData> softinfo, int res) {
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
        public View getView(int position, View convertView, ViewGroup parent) {
            AppInfoData softinfo = softlist.get(position);
            ViewHolder holder;
            if (convertView == null) {
                convertView = mInflater.inflate(mResource, parent, false);
                holder = new ViewHolder();
                holder.icon = (ImageView) convertView.findViewById(biz.AR.id.softwaremanager_permissionmanager_item_icon);
                holder.appName = (TextView) convertView.findViewById(biz.AR.id.softwaremanager_permissionmanager_item_appName);
                holder.version = (TextView) convertView.findViewById(biz.AR.id.softwaremanager_permissionmanager_version);
                holder.volume = (TextView) convertView.findViewById(biz.AR.id.softwaremanager_permissionmanager_volume);
                holder.chk_btn = (ImageView) convertView.findViewById(biz.AR.id.softwaremanager_permissionmanager_item_btn);
                convertView.setTag(holder);
            } else {
                holder = (ViewHolder) convertView.getTag();
            }
            holder.chk_btn.setId(position);
            holder.icon.setImageDrawable(softinfo.getAppicon());
            holder.appName.setText(softinfo.getAppname());
            holder.version.setText(getResources().getString(biz.AR.string.softwareManager_version_Str) + softinfo.getAppVersion());
            holder.volume.setText(getResources().getString(biz.AR.string.softwareManager_volume_Str) + softinfo.getAppDirSize());
            convertView.setId(position);
            return convertView;
        }
    }
    static class ViewHolder {
        ImageView icon;
        TextView appName;
        TextView version;
        TextView volume;
        ImageView chk_btn;
    }
    @Override
    protected void onResume() {
        // TODO Auto-generated method stub
        initData();
        super.onResume();
    }
    @Override
    protected void onPause() {
        if (systemDialog != null && systemDialog.isShowing() && !isFinishing()) {
            systemDialog.dismiss();
        }
        super.onPause();
    }
}
