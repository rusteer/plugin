package main.softwaremamager;
import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Stack;
import main.softwaremamager.methods.MimeTypeMap;
import main.softwaremamager.methods.SoftWareMethod;
import main.softwaremamager.model.AppInfoData;
import main.systemoptimization.utils.PackageUtil;
import net.workspace.util.Logger;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Message;
import android.preference.PreferenceManager;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
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
import android.widget.Toast;

/**
 * 安装包管理
 * @author Administrator
 *
 */
public class InstallactionPackageActivity extends Activity implements OnClickListener {
    private TextView mInstallactionpackageMsg; //统计软件数量控件
    private ListView mInstallactionpackageList;
    private TextView mPackageManager_DeleteSoftBtn; //删除按钮
    private TextView mPackageManager_installSoftBtn; //安装按钮
    private TextView mPackageManager_chooseAllSoftBtn; //全选按钮
    private TextView mSdMsg; //统计软件数量控件
    //private  String sdPhth="";
    softListAdapter applistAdapter;
    /**
     * list 集合数据
     */
    List<AppInfoData> appinfoArray;
    ProgressDialog systemDialog;
    private boolean cancel_task = false;
    /**
     * 安装包路径集合
     */
    ArrayList<String> pathList = new ArrayList<String>();
    /**
     * 标记全选与不选
     */
    private boolean choose_tag = false;
    /**
     * 有软件列表更新
     */
    private final int UPDATESOFTLIST = 0;
    private final int CHOOSED = 1;
    private final int INITSOFTLIST = 2;
    private final int DELETEING = 4;
    private final String TAG = "InstallactionPackageActivity";
    private SharedPreferences settings;
    //设置选项参数
    private boolean isIndexHidden = false;
    private boolean isIndexSystem = false;
    private final HashSet<String> blackList = new HashSet<String>();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // TODO Auto-generated method stub
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.softwaremanager_installactionpackage_activity);
    }
    private void initData() {
        appinfoArray = new ArrayList<AppInfoData>();
        settings = PreferenceManager.getDefaultSharedPreferences(this);
        mInstallactionpackageMsg = (TextView) findViewById(biz.AR.id.softwaremanager_installactionpackage_list_msg);
        mInstallactionpackageList = (ListView) findViewById(biz.AR.id.softwaremanager_installactionpackage_list);
        mInstallactionpackageList.setOnItemClickListener(mInstallactionpackageListOnItemClickListener);
        applistAdapter = new softListAdapter(getApplicationContext(), appinfoArray, biz.AR.layout.softwaremanager_installactionpackage_list_item);
        mInstallactionpackageList.setAdapter(applistAdapter);
        mSdMsg = (TextView) findViewById(biz.AR.id.softwaremanager_sd_msg);
        mPackageManager_DeleteSoftBtn = (TextView) findViewById(biz.AR.id.softwaremanager_installactionpackage_deleteSoft);
        mPackageManager_DeleteSoftBtn.setOnClickListener(this);
        mPackageManager_installSoftBtn = (TextView) findViewById(biz.AR.id.softwaremanager_installactionpackage_installSoft);
        mPackageManager_installSoftBtn.setOnClickListener(this);
        mPackageManager_chooseAllSoftBtn = (TextView) findViewById(biz.AR.id.softwaremanager_installactionpackage_chooseAll);
        mPackageManager_chooseAllSoftBtn.setOnClickListener(this);
        if (PackageUtil.checkSDCard()) {
            cancel_task = false;
            if ((systemDialog == null || !systemDialog.isShowing()) && !isFinishing()) {
                systemDialog = ProgressDialog.show(InstallactionPackageActivity.this, "", getString(biz.AR.string.system_lodingDialog_Str));
                systemDialog.setCancelable(true);
                systemDialog.setOnCancelListener(new OnCancelListener() {
                    @Override
                    public void onCancel(DialogInterface arg0) {
                        cancel_task = true;
                    }
                });
            }
            //sdPhth=Environment.getExternalStorageDirectory().getAbsolutePath();
            getBlacklist();
            new TaskAsyncTask().execute();
            mSdMsg.setVisibility(View.GONE);
        } else {
            mSdMsg.setText("没有发现存储卡设备");
            mSdMsg.setVisibility(View.VISIBLE);
            Toast.makeText(getApplicationContext(), "没有发现存储卡设备", Toast.LENGTH_SHORT).show();
        }
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(this);
    }
    private Handler myhandle = new Handler(new Callback() {
        @Override
        public boolean handleMessage(Message msg) {
            // TODO Auto-generated method stub
            switch (msg.what) {
                case UPDATESOFTLIST:
                    applistAdapter.notifyDataSetChanged();
                    break;
                case INITSOFTLIST:
                    String path = (String) msg.obj;
                    AppInfoData appinfo = SoftWareMethod.getApkFileInfo(getApplicationContext(), path);
                    if (appinfo != null) {
                        appinfo.setAppInstallPath(path);
                        appinfoArray.add(appinfo);
                        applistAdapter.notifyDataSetChanged();
                    }
                    mInstallactionpackageMsg.setText(appinfoArray.size() + "");
                    break;
                case CHOOSED:
                    if (choose_tag) {
                        mPackageManager_chooseAllSoftBtn.setText(getString(biz.AR.string.softwareManager_software_NOchooseAll_Str));
                    } else {
                        mPackageManager_chooseAllSoftBtn.setText(getString(biz.AR.string.softwareManager_software_chooseAll_Str));
                    }
                    break;
                case DELETEING:
                    if (systemDialog != null && systemDialog.isShowing() && !isFinishing()) systemDialog.dismiss();
                    break;
            }
            return false;
        }
    });
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) { // 按下的如果是BACK，同时没有重复
            System.gc();
            InstallactionPackageActivity.this.finish();
            return false;
        }
        return super.onKeyDown(keyCode, event);
    }
    /**
     * 按钮点击事件
     * @param v
     */
    @Override
    public void onClick(View v) {
        // TODO Auto-generated method stub
        switch (v.getId()) {
            case biz.AR.id.softwaremanager_installactionpackage_deleteSoft:
                //删除软件包			
                int d_v = 0;
                for (AppInfoData app : appinfoArray) {
                    if (app.isCheck()) d_v += 1;
                }
                if (d_v == 0) {
                    MsgAlertDialog("请选择要删除的程序！");
                } else {
                    new AlertDialog.Builder(InstallactionPackageActivity.this).setMessage("删除选中的" + d_v + "个软件包?").setPositiveButton(getString(biz.AR.string.system_submit_str), new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                            // TODO Auto-generated method stub
                            // 删除文件
                            cancel_task = false;
                            if ((systemDialog == null || !systemDialog.isShowing()) && !isFinishing()) {
                                systemDialog = ProgressDialog.show(InstallactionPackageActivity.this, "", "正在删除...");
                                systemDialog.setCancelable(true);
                                systemDialog.setOnCancelListener(new OnCancelListener() {
                                    @Override
                                    public void onCancel(DialogInterface arg0) {
                                        cancel_task = true;
                                    }
                                });
                            }
                            deleteSoft();
                        }
                    }).setNegativeButton(getString(biz.AR.string.system_cancel_str), new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                            // TODO Auto-generated method stub
                        }
                    }).create().show();
                }
                break;
            case biz.AR.id.softwaremanager_installactionpackage_installSoft:
                //安装文件
                installSoft();
                break;
            case biz.AR.id.softwaremanager_installactionpackage_chooseAll:
                //全选
                choolseAll();
                break;
            case biz.AR.id.back:
                System.gc();
                InstallactionPackageActivity.this.finish();
                break;
            default:
                break;
        }
    }
    private void MsgAlertDialog(String msg) {
        new AlertDialog.Builder(InstallactionPackageActivity.this).setMessage(msg).setPositiveButton(getString(biz.AR.string.system_submit_str), new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                // TODO Auto-generated method stub
            }
        }).create().show();
    }
    /**
     * 软件列表点击事件
     */
    private OnItemClickListener mInstallactionpackageListOnItemClickListener = new OnItemClickListener() {
        @Override
        public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
            // TODO Auto-generated method stub  convertView
            LinearLayout list_item_layout = (LinearLayout) view;
            RadioButton radioButton = (RadioButton) ((LinearLayout) list_item_layout.getChildAt(2)).getChildAt(0);
            boolean check = appinfoArray.get(position).isCheck();
            if (check) {
                radioButton.setChecked(false);
                appinfoArray.get(position).setCheck(false);
            } else {
                radioButton.setChecked(true);
                appinfoArray.get(position).setCheck(true);
            }
            choose_tag = false;
            myhandle.sendEmptyMessage(CHOOSED);
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
                holder.icon = (ImageView) convertView.findViewById(biz.AR.id.softwaremanager_installactionpackage_item_icon);
                holder.appName = (TextView) convertView.findViewById(biz.AR.id.softwaremanager_installactionpackage_item_appName);
                holder.version = (TextView) convertView.findViewById(biz.AR.id.softwaremanager_installactionpackage_version);
                holder.volume = (TextView) convertView.findViewById(biz.AR.id.softwaremanager_installactionpackage_volume);
                holder.chk_btn = (RadioButton) convertView.findViewById(biz.AR.id.softwaremanager_installactionpackage_item_btn);
                convertView.setTag(holder);
            } else {
                holder = (ViewHolder) convertView.getTag();
            }
            holder.chk_btn.setId(position);
            holder.chk_btn.setClickable(false);
            holder.icon.setImageDrawable(softinfo.getAppicon());
            holder.appName.setText(softinfo.getAppname());
            holder.version.setText(getResources().getString(biz.AR.string.softwareManager_version_Str) + softinfo.getAppVersion());
            //	
            holder.volume.setText(getResources().getString(biz.AR.string.softwareManager_volume_Str) + softinfo.getAppDirSize());
            boolean check = softinfo.isCheck();
            if (check) {
                holder.chk_btn.setChecked(true);
            } else {
                holder.chk_btn.setChecked(false);
            }
            return convertView;
        }
    }
    static class ViewHolder {
        ImageView icon;
        TextView appName;
        TextView version;
        TextView volume;
        RadioButton chk_btn;
    }
    @Override
    protected void onResume() {
        // TODO Auto-generated method stub
        initData();
        super.onResume();
    }
    /**
     * 全选与不选实现
     */
    private void choolseAll() {
        if (choose_tag) {
            chooseNoAll();
        } else {
            for (AppInfoData appinfo : appinfoArray) {
                appinfo.setCheck(true);
            }
            //全选
            choose_tag = true;
        }
        myhandle.sendEmptyMessage(UPDATESOFTLIST);
        myhandle.sendEmptyMessage(CHOOSED);
    }
    private void chooseNoAll() {
        //全不选
        for (AppInfoData appinfo : appinfoArray) {
            appinfo.setCheck(false);
        }
        choose_tag = false;
    }
    /**
     * 删除安装文件
     */
    private void deleteSoft() {
        try {
            for (int i = 0; i < appinfoArray.size(); i++) {
                if (cancel_task) break;
                AppInfoData appinfo = appinfoArray.get(i);
                if (appinfo.isCheck()) {
                    String filePath = appinfo.getAppInstallPath();
                    File f = new File(filePath);
                    f.delete();
                    appinfoArray.remove(i);
                    i--;
                }
            }
        } catch (Throwable e) {
            Log.e(TAG, e.toString());
        }
        appinfoArray.clear();
        applistAdapter.notifyDataSetChanged();
        new TaskAsyncTask().execute();
    }
    /**
     * 安装程序
     */
    private void installSoft() {
        for (AppInfoData appinfo : appinfoArray) {
            if (appinfo.isCheck()) {
                String filePath = appinfo.getAppInstallPath();
                //创建URI
                Uri uri = Uri.fromFile(new File(filePath));
                //创建Intent意图
                Intent intent = new Intent(Intent.ACTION_VIEW);
                //设置Uri和类型
                intent.setDataAndType(uri, "application/vnd.android.package-archive");
                //执行意图进行安装
                startActivity(intent);
            }
        }
        chooseNoAll();
        myhandle.sendEmptyMessage(UPDATESOFTLIST);
    }
    public void FileCheck(String pathName) throws Exception {
        // 创建一个File对象
        File file = new File(pathName);
        try {
            // 判断文件是否存在
            if (file.exists()) {
                // 返回file下一级的所有目录和文件
                File[] listFile = file.listFiles();
                // 判断是否还有文件或者文件目录
                if (null == listFile || listFile.length == 0) {}
                for (File element : listFile) {
                    // 如果是目录
                    if (element.isDirectory()) {
                        // 得到每一个目录的路径和目录名
                        String pathname = element.getAbsolutePath();
                        String temname = element.getName();
                        if (!temname.substring(0, 1).equals(".")) {
                            // 进行递归调用
                            FileCheck(pathname);
                        }
                    }
                    // 如果是文件
                    if (element.isFile()) {
                        // 得到文件名
                        String filename = element.getName();
                        String filePaht = element.getAbsolutePath();
                        // 判断是否相等
                        if (filename.endsWith(".apk")) {
                            file.getName();
                            pathList.add(filePaht);
                        }
                    }
                }
            }
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
            return;
        }
    }
    public class TaskAsyncTask extends AsyncTask<Void, Void, Void> {
        @Override
        protected void onPreExecute() {}
        // 处理后台执行的任务，在后台线程执行   
        @Override
        protected Void doInBackground(Void... arg0) {
            try {
                if (!Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED)) { return null; }
                isIndexHidden = settings.getBoolean("Prefs.Activity.Key.Hidden", false);
                isIndexSystem = settings.getBoolean("Prefs.Activity.Key.System", false);
                // 准备初始栈
                Stack<String> stack = new Stack<String>();
                stack.push(Environment.getExternalStorageDirectory().getPath());
                // 开始文件遍历
                while (!stack.isEmpty() && !cancel_task) {
                    String parent = stack.pop();
                    File path = new File(parent);
                    File[] files = path.listFiles();
                    if (null == files) continue;
                    for (File f : files) {
                        if (cancel_task) break;
                        if (f.isDirectory()) {
                            if (isQualifiedDirectory(f)) stack.push(f.getPath());
                        } else {
                            if (isQualifiedFile(f)) if (extendFileNameCompare(f.getName(), "apk")) {
                                Message msg = new Message();
                                msg.what = INITSOFTLIST;
                                msg.obj = f.getPath();
                                myhandle.sendMessage(msg);
                            }
                        }
                    }
                }
            } catch (Throwable e) {
                // TODO Auto-generated catch block
                Logger.error(e);
            }
            return null;
        }
        // 后台任务执行完之后被调用，在ui线程执行   
        @Override
        protected void onPostExecute(Void result) {
            if (systemDialog != null && systemDialog.isShowing() && !isFinishing()) systemDialog.dismiss();
            super.onPostExecute(result);
        }
    };
    /**
     * 判断一个文件夹是否应该压入待索引栈。
     * @param file	指向文件夹的文件对象
     * @return 是否应该压栈
     */
    private boolean isQualifiedDirectory(File file) {
        if (file.getName().equals(".") || file.getName().equals("..")) return false;
        if (!isIndexHidden && file.isHidden()) return false;
        if (!isIndexSystem && blackList.contains(file.getPath().toLowerCase())) return false;
        if (new File(file.getPath(), ".nomedia").exists()) return false;
        return true;
    }
    /**
     * 判断一个文件是否应该进行索引。
     * @param file	指向文件的文件对象
     * @return 是否应该索引
     */
    private boolean isQualifiedFile(File file) {
        if (!isIndexHidden && file.isHidden()) return false;
        if (mimeType(file.getName()).equals("*.*")) return false;
        return true;
    }
    /**
     * 准备系统黑名单列表。
     */
    private void getBlacklist() {
        try {
            String root = Environment.getExternalStorageDirectory().getPath();
            blackList.add(root + "/lost.dir");
            //blackList.add(root + "/android");
            blackList.add(root + "/brut.googlemaps");
            blackList.add(root + "/navione");
            blackList.add(root + "/picstore");
            //忽略导航地图文件
            //高德
            if (new File(root, "autonavidata46").exists()) blackList.add(root + "/autonavidata46");
            if (new File(root, "autonavidata50").exists()) blackList.add(root + "/autonavidata50");
            //凯立德
            if (new File(root, "NaviOne").exists()) blackList.add(root + "/NaviOne");
            //百度地图
            if (new File(root, "BaiduMap").exists()) blackList.add(root + "/BaiduMap");
            //老虎地图
            if (new File(root, "tigermap").exists()) blackList.add(root + "/tigermap");
            //图吧地图
            if (new File(root, "mapbar").exists()) blackList.add(root + "/mapbar");
            //soso地图
            if (new File(root, "SOSOMap").exists()) blackList.add(root + "/SOSOMap");
            //途语地图
            if (new File(root, "navito").exists()) blackList.add(root + "/navito");
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        }
    }
    public boolean extendFileNameCompare(String name, String ExtendName) {
        String str = name.toLowerCase();
        str = str.substring(name.lastIndexOf('.') + 1, str.length());
        if (str.compareTo(ExtendName) == 0) { return true; }
        return false;
    }
    /**
     * 获取给定文件名的 MIME 类型
     * @param filename	源文件名
     * @return 源文件名的 MIME 类型
     */
    public String mimeType(String filename) {
        String ext = extension(filename);
        MimeTypeMap mimeTypeMap = new MimeTypeMap();
        mimeTypeMap.setTypeMap();
        String mime = mimeTypeMap.getMimeTypeFromExtension(ext);
        mimeTypeMap = null;
        return mime == null ? "*.*" : mime;
    }
    /**
     * 获取给定文件名的扩展名部分
     * @param filename	源文件名
     * @return 源文件名的扩展名部分(不含小数点)
     */
    public String extension(String filename) {
        int start = filename.lastIndexOf("/");
        int stop = filename.lastIndexOf(".");
        if (stop < start || stop >= filename.length() - 1) return "";
        else return filename.substring(stop + 1, filename.length());
    }
    @Override
    protected void onPause() {
        if (systemDialog != null && systemDialog.isShowing() && !isFinishing()) {
            systemDialog.dismiss();
        }
        super.onPause();
    }
}
