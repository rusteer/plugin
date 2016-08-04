package main.systemoptimization.ui.activities;
import java.io.File;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import main.systemoptimization.model.SoftWareInfo;
import main.systemoptimization.utils.PackageUtil;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.pm.ApplicationInfo;
import android.content.pm.IPackageDataObserver;
import android.content.pm.IPackageStatsObserver;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageStats;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.Message;
import android.os.RemoteException;
import android.os.StatFs;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

/**
 * 清除缓存界面
 * @author Administrator
 *
 */
public class ClearCacheActivity extends Activity {
    private TextView mCacheNumberMsg;//缓存数量
    private TextView mCacheSizeMsg;// 缓存大小
    private ListView mcacheList;//缓存列表
    private TextView mOneKeyClear;//一键清理
    private TextView mNoCacheData;//无缓存提示
    private List<SoftWareInfo> cacheListArray = new ArrayList<SoftWareInfo>();//缓存数据
    private cacheSoftListAdapter cacheAdapter;
    /**
     * 更新缓存列表
     */
    private final static int UPDATE_CACHE_LIST = 1;
    /**
     * 缓存大小
     */
    long cacheSize = 0;
    ProgressDialog systemDialog;
    private boolean cancelTask = false;
    long tatalCacheSize = 0;
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
        setContentView(biz.AR.layout.system_clear_cache_activity);
    }
    private void initData() {
        mCacheNumberMsg = (TextView) findViewById(biz.AR.id.system_clear_cache_numberMsg);
        mCacheSizeMsg = (TextView) findViewById(biz.AR.id.system_clear_cache_sizeMsg);
        mcacheList = (ListView) findViewById(biz.AR.id.system_clear_cache_list);
        mOneKeyClear = (TextView) findViewById(biz.AR.id.system_ClearCache_onekeyClear);
        mOneKeyClear.setOnClickListener(OneKeyClearOnClickListener);
        cacheAdapter = new cacheSoftListAdapter(this, cacheListArray, biz.AR.layout.system_clear_cache_item);
        mcacheList.setAdapter(cacheAdapter);
        mNoCacheData = (TextView) findViewById(biz.AR.id.system_clear_cache_noCacheData);
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                ClearCacheActivity.this.finish();
            }
        });
        initCacheUI();
        cacheListArray.clear();
        tatalCacheSize = 0;
        cacheSize = 0;
        updateTitleMsg();
        cancelTask = false;
        if ((systemDialog == null || !systemDialog.isShowing()) && !isFinishing()) {
            systemDialog = ProgressDialog.show(ClearCacheActivity.this, "", getString(biz.AR.string.system_lodingDialog_clearCahe_Str));
            systemDialog.setCancelable(true);
            systemDialog.setOnCancelListener(new OnCancelListener() {
                @Override
                public void onCancel(DialogInterface arg0) {
                    cancelTask = true;
                }
            });
        }
        new initCacheThread().start();
    }
    //初始化UI
    private void initCacheUI() {
        if (cacheListArray.size() > 0) {
            cacheAdapter.notifyDataSetChanged();
            mNoCacheData.setVisibility(View.GONE);
        } else {
            mNoCacheData.setVisibility(View.VISIBLE);
        }
        updateTitleMsg();
    }
    /**
     * 更新标题信息：缓存数量
     */
    private void updateTitleMsg() {
        mCacheNumberMsg.setText("" + cacheListArray.size());
        String cachesize = PackageUtil.formatFileSize(tatalCacheSize);
        mCacheSizeMsg.setText(cachesize);
    }
    private Handler mHandler = new Handler() {
        @Override
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case UPDATE_CACHE_LIST:
                    //更新UI
                    SoftWareInfo sf = (SoftWareInfo) msg.obj;
                    if (sf != null) {
                        cacheListArray.add(sf);
                        initCacheUI();
                    }
                    break;
            }
        }
    };
    /**
     * 结束按钮点击事件
     */
    private View.OnClickListener ClearCacheOnItemClickListener = new OnClickListener() {
        @Override
        public void onClick(View v) {
            int position = v.getId();
            if (cacheListArray.size() > 0) {
                String packageName = cacheListArray.get(position).getPackageName();
                PackageUtil.showInstalledAppDetails(getApplicationContext(), packageName);
            }
        }
    };
    /**
     * 一键清理监听事件
     */
    private OnClickListener OneKeyClearOnClickListener = new OnClickListener() {
        @Override
        public void onClick(View v) {
            if (cacheListArray.size() > 0) {
                if ((systemDialog == null || !systemDialog.isShowing()) && !isFinishing()) {
                    systemDialog = ProgressDialog.show(ClearCacheActivity.this, "", getString(biz.AR.string.system_lodingDialog_clearCahe_Str));
                    systemDialog.setCancelable(true);
                }
                OneKeyRemoveSoftcache();
                cacheListArray.clear();
                cacheAdapter.notifyDataSetChanged();
                cacheSize = 0;
                tatalCacheSize = 0;
                initCacheUI();
                if (systemDialog != null && systemDialog.isShowing() && !isFinishing()) systemDialog.dismiss();
            }
        }
    };
    /**
     * 获得缓存数据
     * @author Administrator
     *
     */
    class initCacheThread extends Thread {
        @Override
        public void run() {
            if (cacheListArray != null) {
                cacheListArray.clear();
            }
            List<PackageInfo> packageInfoList = getPackageManager().getInstalledPackages(0);
            for (PackageInfo info : packageInfoList) {
                if (cancelTask) break;
                String appPackageName = info.packageName;
                ApplicationInfo app = info.applicationInfo;
                PackageManager pm = getPackageManager();
                try {
                    Method getPackageSizeInfo = pm.getClass().getMethod("getPackageSizeInfo", String.class, IPackageStatsObserver.class);
                    getPackageSizeInfo.invoke(pm, appPackageName, new PkgSizeObserver(app));
                } catch (Throwable e) {
                    Log.e("clear error", e.toString());
                }
            }
            if (systemDialog != null && systemDialog.isShowing() && !isFinishing()) systemDialog.dismiss();
            super.run();
        }
    }
    /**
     * 一键清理
     */
    public void OneKeyRemoveSoftcache() {
        PackageManager pm = getPackageManager();
        try {
            Class[] arrayOfClass = new Class[2];
            Class localClass2 = Long.TYPE;
            arrayOfClass[0] = localClass2;
            arrayOfClass[1] = IPackageDataObserver.class;
            Method localMethod = pm.getClass().getMethod("freeStorageAndNotify", arrayOfClass);
            Long localLong = Long.valueOf(getEnvironmentSize() - 1L);
            Object[] arrayOfObject = new Object[2];
            arrayOfObject[0] = localLong;
            localMethod.invoke(pm, localLong, new IPackageDataObserver.Stub() {
                @Override
                public void onRemoveCompleted(String packageName, boolean succeeded) throws RemoteException {}
            });
        } catch (Throwable e) {}
    }
    private static long getEnvironmentSize() {
        File localFile = Environment.getDataDirectory();
        long l1;
        if (localFile == null) l1 = 0L;
        while (true) {
            String str = localFile.getPath();
            StatFs localStatFs = new StatFs(str);
            long l2 = localStatFs.getBlockSize();
            l1 = localStatFs.getBlockCount() * l2;
            return l1;
        }
    }
    class PkgdataObserver extends IPackageDataObserver.Stub {
        @Override
        public void onRemoveCompleted(String packageName, boolean succeeded) throws RemoteException {
            mHandler.sendEmptyMessage(2);
            if (succeeded) {
                mHandler.sendEmptyMessage(2);
            } 
        }
    }
    class PkgSizeObserver extends IPackageStatsObserver.Stub {
        ApplicationInfo info;
        public PkgSizeObserver(ApplicationInfo info) {
            this.info = info;
        }
        @Override
        public void onGetStatsCompleted(PackageStats pStats, boolean succeeded) {
            //缓存大小
            long cacheSize = pStats.cacheSize;
            tatalCacheSize += cacheSize;
            if (cacheSize > 0) {
                SoftWareInfo cache = new SoftWareInfo();
                String cacheSizeStr = PackageUtil.formatFileSize(cacheSize);
                String appName = info.loadLabel(getPackageManager()).toString();//获得程序名称
                Drawable icon = info.loadIcon(getPackageManager());//获得程序icon
                cache.setAppIcon(icon);
                cache.setSoftName(appName);
                cache.setCacheSzieVal(cacheSize);
                cache.setPackageName(info.packageName);
                cache.setCacheSize(cacheSizeStr);
                Message msg = new Message();
                msg.what = UPDATE_CACHE_LIST;
                msg.obj = cache;
                mHandler.sendMessage(msg);
            }
            //			updateTag=false;
        }
    }
    /**
     *缓存清理 
     */
    public boolean ClearCache(String appPackageName) {
        Context appAcontext = PackageUtil.getAppContext(getApplicationContext(), appPackageName);
        appAcontext.getCacheDir().getPath();
        return appAcontext.getCacheDir().delete();
    }
    /**
     * 缓存列表适配器类
     * @author Administrator
     *
     */
    class cacheSoftListAdapter extends BaseAdapter {
        LayoutInflater mInflater;
        private int mResource;
        List<SoftWareInfo> softlist;
        public cacheSoftListAdapter(Context context, List<SoftWareInfo> softinfo, int res) {
            mInflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            mResource = res;
            softlist = softinfo;
        }
        @Override
        public int getCount() {
            return softlist.size();
        }
        @Override
        public Object getItem(int position) {
            return softlist.get(position);
        }
        @Override
        public long getItemId(int position) {
            return 0;
        }
        @Override
        public View getView(int position, View v, ViewGroup parent) {
            try {
                myViewHoder hoder = null;
                if (v == null) {
                    hoder = new myViewHoder();
                    v = mInflater.inflate(mResource, parent, false);
                    hoder.icon = (ImageView) v.findViewById(biz.AR.id.system_clear_cache_item_icon);
                    hoder.appName = (TextView) v.findViewById(biz.AR.id.system_clear_cache_item_appName);
                    hoder.chooseBtn = (TextView) v.findViewById(biz.AR.id.system_clear_cache_item_icon_kill);
                    hoder.cacheText = (TextView) v.findViewById(biz.AR.id.system_clear_cache_item_cacheSize);
                    v.setTag(hoder);
                } else {
                    hoder = (myViewHoder) v.getTag();
                }
                final SoftWareInfo softinfo = softlist.get(position);
                hoder.icon.setImageDrawable(softinfo.getAppIcon());
                hoder.appName.setText(softinfo.getSoftName());
                hoder.cacheText.setText(softinfo.getCacheSize());
                hoder.chooseBtn.setId(position);
                hoder.chooseBtn.setOnClickListener(ClearCacheOnItemClickListener);
            } catch (Throwable e) {
                Log.e("error", e.toString());
                return v;
            }
            return v;
        }
    }
    static class myViewHoder {
        private ImageView icon;
        TextView appName;
        TextView chooseBtn;
        TextView cacheText;
    }
    @Override
    protected void onDestroy() {
        cacheListArray.clear();
        tatalCacheSize = 0;
        cacheSize = 0;
        super.onDestroy();
    }
    @Override
    protected void onResume() {
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
