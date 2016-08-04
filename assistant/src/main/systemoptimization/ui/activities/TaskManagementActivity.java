package main.systemoptimization.ui.activities;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import main.database.DatabaseAdapter;
import main.systemoptimization.model.BasicProgramUtil;
import main.systemoptimization.model.SoftWareWhiteList;
import main.systemoptimization.utils.BitmapConvertUtil;
import main.systemoptimization.utils.CMDExecute;
import main.systemoptimization.utils.ListViewDialog;
import main.systemoptimization.utils.PackageUtil;
import main.systemoptimization.utils.SystemConstants;
import main.utils.Api;
import main.utils.RootUtil;
import net.workspace.util.Logger;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.ActivityManager.MemoryInfo;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Message;
import android.text.format.Formatter;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

/**
 * 任务管理
 * 
 * @author Administrator
 * 
 */
public class TaskManagementActivity extends Activity {
    /**
     * 进程信息集合
     */
    private List<BasicProgramUtil> Programlist = null;
    private PackageUtil packageUtil;
    private TextView mTaskRuningNumberMessage; // 运行程序数量信息提示控件
    private TextView mTaskRuningSizeMessage; // 运行程序占内存大小信息提示控件
    private ListView mTaskList;
    private TextView mTask_sortCpu;// 按cpu排序
    private TextView mTask_sortMenory;// 按占内存大小排序
    private TextView mOneKeyOptimizationBtn;// 一键优化控件
    // private ImageView mTask_itemlist_icons;//标识是系统程序还是用户程序
    private final int KEYWORD = 102;
    private final String TAG = "TaskManagementActivity";
    /**
     * 更新列表界面
     */
    private final int REFRESHLIST = 1;
    /**
     * 带数据更新列表界面
     */
    private final int LASTREFRESHLIST = 2;
    /**
     * 弹出框选择的程序包名
     */
    private String selectedOptPackName = "";
    /**
     * 弹出框选择的选项标识
     */
    private int selectedlistOption;
    private String choseListOption = "";
    /**
     * 列表排序方式 true:cup false:memory 默认：内存排序
     */
    private boolean sortCPU_tag = false;
    /**
     * 进程列表适配器
     */
    appProcessesAdapter processesAdapter;
    ProgressDialog systemDialog;
    private boolean cancel_refresh = false;
    private boolean cancel_task = false;
    private long mKillMemory = 0;
    /**
     * 存储瞬时各程序使用cup情况<br>
     * key:pid value:占用率
     */
    Map<Integer, Integer> RunCpuMap = new HashMap<Integer, Integer>();;
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
        setContentView(biz.AR.layout.system_taskmanager_activity);
        initData();
    }
    private void initData() {
        new AsyncTask<Void, Void, Void>() {
            @Override
            protected Void doInBackground(Void... arg0) {
                try {
                    packageUtil = new PackageUtil(TaskManagementActivity.this);
                    Programlist = new ArrayList<BasicProgramUtil>();
                } catch (Throwable e) {
                    Logger.error(e);
                }
                return null;
            }
            @Override
            protected void onPostExecute(Void result) {
                mTaskRuningNumberMessage = (TextView) findViewById(biz.AR.id.task_number_msg);
                mTaskRuningSizeMessage = (TextView) findViewById(biz.AR.id.task__size_msg);
                mTaskList = (ListView) findViewById(biz.AR.id.task_list);
                mTask_sortCpu = (TextView) findViewById(biz.AR.id.system_task_soft_cpu);
                mTask_sortCpu.setOnClickListener(sort_cpuOnClickListener);
                mTask_sortMenory = (TextView) findViewById(biz.AR.id.system_task_soft_memory);
                mTask_sortMenory.setOnClickListener(sort_MenoryOnClickListener);
                mOneKeyOptimizationBtn = (TextView) findViewById(biz.AR.id.system_task_OneKeyOptimization);
                mOneKeyOptimizationBtn.setOnClickListener(mOneKeyOptimizationBtnOnClickListener);
                mTaskList.setOnItemClickListener(TaskListOnItemClickListener);
                processesAdapter = new appProcessesAdapter(TaskManagementActivity.this, Programlist, biz.AR.layout.system_optimization_list_view_item);
                mTaskList.setAdapter(processesAdapter);
                mTask_sortMenory.setBackgroundResource(biz.AR.drawable.software_btn_option_bg1);
                mTask_sortMenory.setTextColor(getResources().getColor(biz.AR.color.txt_label_blue));
                ImageView back = (ImageView) findViewById(biz.AR.id.back);
                back.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        System.gc();
                        TaskManagementActivity.this.finish();
                    }
                });
                cancel_refresh = false;
                if ((systemDialog == null || !systemDialog.isShowing()) && !isFinishing()) {
                    systemDialog = ProgressDialog.show(TaskManagementActivity.this, "", getString(biz.AR.string.system_lodingDialog_Str));
                    systemDialog.setCancelable(true);
                    systemDialog.setOnCancelListener(new OnCancelListener() {
                        @Override
                        public void onCancel(DialogInterface arg0) {
                            cancel_refresh = true;
                        }
                    });
                }
                RefreshProList(1);
            }
        }.execute();
    }
    /**
     * 消息处理
     */
    private Handler myHandler = new Handler(new Callback() {
        @Override
        public boolean handleMessage(Message msg) {
            switch (msg.what) {
                case REFRESHLIST:
                    refreshListItems();
                    upateMsg();
                    break;
                case LASTREFRESHLIST:
                    BasicProgramUtil bu = (BasicProgramUtil) msg.obj;
                    if (bu != null) {
                        /**
                         * 修改原因:此处有时报空指针 修改时间：2012/04/13 修改人：唐晓泽 修改内容：添加try...catch语句
                         * */
                        try {
                            Programlist.add(bu);
                            refreshListItems();
                            upateMsg();
                        } catch (Throwable e) {}
                    }
                    break;
                case 3:
                    refreshListItems();
                    upateMsg();
                    String m1 = Formatter.formatShortFileSize(getApplicationContext(), getAvailMemory()).trim();
                    String m2 = Formatter.formatShortFileSize(getApplicationContext(), mKillMemory).trim();
                    int val = Integer.parseInt(m1.substring(0, m1.length() - 2).trim()) - Integer.parseInt(m2.substring(0, m2.length() - 2).trim());
                    if (val < 1) {
                        Toast.makeText(TaskManagementActivity.this, "没有可优化的资源", 1).show();
                    } else {
                        Toast.makeText(TaskManagementActivity.this, "为您的系统增加" + val + "MB可用内存空间", 1).show();
                    }
                    break;
            }
            return false;
        }
    });
    /**
     * 更新消息栏
     */
    private void upateMsg() {
        if (Programlist != null) {
            mTaskRuningNumberMessage.setText(Programlist.size() + "");
            String m1 = Formatter.formatFileSize(getApplicationContext(), getAvailMemory());
            mTaskRuningSizeMessage.setText(m1 + "");
        }
    }
    private void RefreshProList(final int type) {
        new Thread(new Runnable() {
            @Override
            public void run() {
                if (Programlist != null) {
                    Programlist.clear();
                }
                getRunningAppProcesses();
                if (sortCPU_tag) {
                    sortCpu();
                } else {
                    sortMenory();
                }
                if (type == 1) {
                    myHandler.sendEmptyMessage(REFRESHLIST);
                } else {
                    myHandler.sendEmptyMessage(3);
                }
            }
        }).start();
    }
    /**
     * 更新列表
     */
    private void refreshListItems() {
        if (sortCPU_tag) {
            mTask_sortCpu.setBackgroundResource(biz.AR.drawable.software_btn_option_bg1);
            mTask_sortMenory.setBackgroundResource(biz.AR.drawable.software_btn_option_right_bg2);
            mTask_sortCpu.setTextColor(getResources().getColor(biz.AR.color.txt_label_blue));
            mTask_sortMenory.setTextColor(getResources().getColor(biz.AR.color.txt_label_black));
        } else {
            mTask_sortCpu.setBackgroundResource(biz.AR.drawable.software_btn_option_left_bg2);
            mTask_sortMenory.setBackgroundResource(biz.AR.drawable.software_btn_option_bg1);
            mTask_sortCpu.setTextColor(getResources().getColor(biz.AR.color.txt_label_black));
            mTask_sortMenory.setTextColor(getResources().getColor(biz.AR.color.txt_label_blue));
        }
        processesAdapter.notifyDataSetChanged();
        if (systemDialog != null && systemDialog.isShowing() && !isFinishing()) systemDialog.dismiss();// 关闭进度条
    }
    /**
     * 获得运行程序进程集合
     * 
     * @return
     */
    private void getRunningAppProcesses() {
        getProcessRunningCPU();
        ActivityManager activityManager = (ActivityManager) getSystemService(ACTIVITY_SERVICE);
        List<RunningAppProcessInfo> procList = activityManager.getRunningAppProcesses();
        for (RunningAppProcessInfo one : procList) {
            if (cancel_refresh) break;
            // 如果是本应用的信息，直接忽略 //系统进程不处理
            if (one.uid < 10000 || one.processName.equalsIgnoreCase(getPackageName())) continue;
            BasicProgramUtil basicProgramUtil = buildProgramUtilSimpleInfo(one.pid, one.uid, one.processName);
            if (basicProgramUtil != null) {
                Programlist.add(basicProgramUtil);
            }
        }
        Message msg = new Message();
        msg.what = REFRESHLIST;
        myHandler.sendMessage(msg);
    }
    /**
     * 获取某程序详细运行信息
     * 
     * @param procId
     * @param procNameString
     * @return
     */
    public BasicProgramUtil buildProgramUtilSimpleInfo(int procId, int uid, String procNameString) {
        if (procNameString != null && !procNameString.equals("")) {
            BasicProgramUtil programUtil = new BasicProgramUtil();
            programUtil.setProcessName(procNameString);
            programUtil.setPid(procId);
            programUtil.setUid(uid);
            try {
                // 根据进程名，获取应用程序的ApplicationInfo对象
                ApplicationInfo tempAppInfo = packageUtil.getApplicationInfo(procNameString);
                // 判断应用程序是否加入白名单
                boolean isadd = DatabaseAdapter.getInstance(TaskManagementActivity.this).quryIsAddWhitelist(tempAppInfo.packageName);
                if (isadd) return null;
                PackageManager packageManager = getPackageManager();
                if (tempAppInfo != null) {
                    // 为进程加载图标和程序名称
                    try {
                        programUtil.setIcon(tempAppInfo.loadIcon(packageManager));
                    } catch (Throwable e) {
                        programUtil.setIcon(getResources().getDrawable(biz.AR.drawable.system_icon_default));
                    }
                    programUtil.setProgramName(tempAppInfo.loadLabel(packageManager).toString());
                    programUtil.setProgramPackageName(tempAppInfo.packageName);
                    boolean isos = PackageUtil.isOsAppProcessInfo(tempAppInfo);
                    if (isos) {
                        programUtil.setOsProgram(true);
                    }
                    String menory = "0";
                    ActivityManager am = (ActivityManager) getSystemService(ACTIVITY_SERVICE);
                    android.os.Debug.MemoryInfo[] memoryInfoArray = am.getProcessMemoryInfo(new int[] { procId });
                    android.os.Debug.MemoryInfo pidMemoryInfo = memoryInfoArray[0];
                    long m_v = pidMemoryInfo.getTotalPrivateDirty();
                    if (menory != null && !menory.equals("")) {
                        menory = Formatter.formatFileSize(getApplicationContext(), m_v);
                        menory = menory.substring(0, menory.length() - 2);
                        programUtil.setMenory(menory);
                    }
                    String cpu = String.valueOf(RunCpuMap.get(procId)).trim();
                    programUtil.setCpu(cpu);
                    return programUtil;
                }
            } catch (Throwable e) {
                return null;
            }
        }
        return null;
    }
    /**
     * 进程适配器
     * 
     * @author Administrator
     * 
     */
    class appProcessesAdapter extends BaseAdapter {
        Context mcontext;
        private int mResource;
        List<BasicProgramUtil> list;
        public appProcessesAdapter(Context context, List<BasicProgramUtil> list, int resource) {
            mcontext = context;
            mResource = resource;
            this.list = list;
        }
        @Override
        public int getCount() {
            return list.size();
        }
        @Override
        public Object getItem(int position) {
            return list.get(position);
        }
        @Override
        public long getItemId(int position) {
            return 0;
        }
        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            /**
             * 有时出现超出索引的错误，在此添加判断 修改人：唐晓泽 修改日期：2012/04/13
             */
            if (getCount() <= position) return null;
            VuewHolder holder;
            if (convertView == null) {
                final LayoutInflater mInflater = (LayoutInflater) mcontext.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                convertView = mInflater.inflate(mResource, parent, false);
                holder = new VuewHolder();
                holder.appIcon = (ImageView) convertView.findViewById(biz.AR.id.task_itemlist_icon);
                holder.appName = (TextView) convertView.findViewById(biz.AR.id.task_itemlist_appName);
                holder.appMenory = (TextView) convertView.findViewById(biz.AR.id.task_itemlist_appMemory);
                holder.appCpu = (TextView) convertView.findViewById(biz.AR.id.task_itemlist_appCpu);
                holder.mSystem_itemlist_icon_kill = (TextView) convertView.findViewById(biz.AR.id.system_itemlist_icon_kill);
                convertView.setTag(holder);
            } else {
                holder = (VuewHolder) convertView.getTag();
            }
            BasicProgramUtil bp = list.get(position);
            holder.appIcon.setImageDrawable(bp.getIcon());
            holder.appName.setText(bp.getProgramName());
            holder.appMenory.setText(getResources().getString(biz.AR.string.taskManagement_memory_str) + bp.getMenory() + "MB");
            String v_cpu = bp.getCpu();
            Log.d("debug", "cpu=====" + v_cpu);
            if (v_cpu == null || v_cpu.equals("")) {
                v_cpu = "0";
            }
            holder.appCpu.setText(getResources().getString(biz.AR.string.taskManagement_cpu_str) + v_cpu + "%");
            holder.mSystem_itemlist_icon_kill.setId(position);
            holder.mSystem_itemlist_icon_kill.setOnClickListener(iamgeIconKillOnClickListener);
            return convertView;
        }
    }
    static class VuewHolder {
        private ImageView appIcon;
        private TextView appName;
        private TextView appMenory;
        private TextView appCpu;
        private TextView mSystem_itemlist_icon_kill;
    }
    /**
     * 任务管理列表点击监听事件
     */
    private AdapterView.OnItemClickListener TaskListOnItemClickListener = new OnItemClickListener() {
        @Override
        public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
            if (Programlist.size() > 0) {
                BasicProgramUtil softprogram = Programlist.get(position);
                selectedOptPackName = softprogram.getProcessName();
                selectedlistOption = position;
                choseListOption = softprogram.getProgramPackageName();
                ArrayList<String> TaskListDilogarray = new ArrayList<String>();
                // 结束程序
                TaskListDilogarray.add(getString(biz.AR.string.softwareManager_endProgram_Str));
                if (softprogram.isAddWhite()) {
                    // 如果是白名单程序，则有移除白名单操作
                    TaskListDilogarray.add(getString(biz.AR.string.WhiteList_removeWhiteList_Str));
                } else {
                    // 如果不是白名单程序，则有加入白名单操作
                    TaskListDilogarray.add(getString(biz.AR.string.WhiteList_addWhiteList_Str));
                }
                // 卸载程序
                TaskListDilogarray.add(getString(biz.AR.string.softwareManager_uninstall_Str));
                Intent intent = new Intent(TaskManagementActivity.this, ListViewDialog.class);
                intent.putExtra(SystemConstants.EXTRAS_COMPONENTS_ICON, biz.AR.drawable.system_ic_clew_title);// 设置icon
                intent.putExtra(SystemConstants.EXTRAS_COMPONENTS_TITLE, getString(biz.AR.string.softwareManager_speeddoing_str));// 标题：快捷操作
                intent.putStringArrayListExtra(SystemConstants.EXTRAS_COMPONENTS_ARRAYLIST, TaskListDilogarray);// 设置列表数据
                TaskManagementActivity.this.startActivityForResult(intent, KEYWORD);
            }
        }
    };
    /**
     * 弹出框选择点击后事件处理
     */
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        // 如果是列表弹出框返回的话
        if (requestCode == KEYWORD) {
            if (resultCode == RESULT_OK) {
                int position = data.getExtras().getInt(SystemConstants.EXTRAS_COMPONENTS_ONITEMCLICK_POSITION);
                Log.i(TAG, "" + position + "   " + selectedOptPackName);
                switch (position) {
                // 结束进程
                    case 0:
                        if (!selectedOptPackName.equals(getPackageName())) {
                            closeProgram(selectedOptPackName);
                            // Programlist.remove(selectedlistOption);
                            for (Iterator<BasicProgramUtil> it = Programlist.iterator(); it.hasNext();) {
                                BasicProgramUtil b = it.next();
                                if (b.getProgramPackageName().equals(choseListOption)) {
                                    it.remove();
                                }
                            }
                            processesAdapter.notifyDataSetChanged();
                            upateMsg();
                        }
                        break;
                    case 1:
                        // 加入白名单或移除白名单
                        BasicProgramUtil softProgram = Programlist.get(selectedlistOption);
                        if (softProgram.isAddWhite()) {
                            if (UninstallWiteList(softProgram.getProgramPackageName())) {
                                softProgram.setAddWhite(false);
                                Toast.makeText(getApplicationContext(), "移除成功", Toast.LENGTH_SHORT).show();
                            }
                        } else {
                            if (addWiteList(softProgram)) {
                                softProgram.setAddWhite(true);
                                Toast.makeText(getApplicationContext(), "加入成功", Toast.LENGTH_SHORT).show();
                            }
                        }
                        processesAdapter.notifyDataSetChanged();
                        break;
                    case 2:
                        // 卸载程序
                        if (!selectedOptPackName.equals(getPackageName())) {
                            UninstallProgram(selectedOptPackName);
                            // Programlist.remove(selectedlistOption);
                            for (Iterator<BasicProgramUtil> it = Programlist.iterator(); it.hasNext();) {
                                BasicProgramUtil b = it.next();
                                if (b.getProgramPackageName().equals(choseListOption)) {
                                    it.remove();
                                }
                            }
                            processesAdapter.notifyDataSetChanged();
                        }
                        break;
                    default:
                        break;
                }
            }
        }
    }
    /**
     * 结束按钮点击事件
     */
    private View.OnClickListener iamgeIconKillOnClickListener = new OnClickListener() {
        @Override
        public void onClick(View v) {
            int opt = v.getId();
            selectedOptPackName = Programlist.get(opt).getProcessName();
            closeProgram(selectedOptPackName);
            mKillMemory = getAvailMemory();
            Programlist.remove(opt);
            for (Iterator<BasicProgramUtil> it = Programlist.iterator(); it.hasNext();) {
                BasicProgramUtil b = it.next();
                if (b.getProcessName().equals(selectedOptPackName)) {
                    it.remove();
                }
            }
            // Toast.makeText(getApplicationContext(), ""+Programlist.size(),
            // Toast.LENGTH_SHORT).show();
            processesAdapter.notifyDataSetChanged();
            upateMsg();
        }
    };
    /**
     * cup排序按钮点击事件
     */
    private View.OnClickListener sort_cpuOnClickListener = new OnClickListener() {
        @Override
        public void onClick(View v) {
            sortCpu();
            sortCPU_tag = true;
            refreshListItems();
        }
    };
    /**
     * 内存排序按钮点击事件
     */
    private View.OnClickListener sort_MenoryOnClickListener = new OnClickListener() {
        @Override
        public void onClick(View v) {
            sortMenory();
            sortCPU_tag = false;
            refreshListItems();
        }
    };
    /**
     * 一键优化监听事件
     */
    private View.OnClickListener mOneKeyOptimizationBtnOnClickListener = new OnClickListener() {
        @Override
        public void onClick(View v) {
            try {
                new TaskAsyncTask().execute();
            } catch (Throwable e) {
                Logger.error(e);
            }
        }
    };
    @Override
    protected void onDestroy() {
        Programlist = null;
        packageUtil = null;
        if (systemDialog != null && systemDialog.isShowing() && !isFinishing()) systemDialog.dismiss();
        System.gc();
        super.onDestroy();
    }
    @Override
    protected void onResume() {
        super.onResume();
    }
    /**
     * 结束程序
     */
    private void closeProgram(String pkgName) {
        ActivityManager am = (ActivityManager) getSystemService(Context.ACTIVITY_SERVICE);
        int v_os = android.os.Build.VERSION.SDK_INT;
        if (v_os > 7) {
            try {
                am.killBackgroundProcesses(pkgName);
            } catch (Throwable e) {
                Log.w(TAG, e.toString());
                return;
            }
        } else {
            am.restartPackage(pkgName);
        }
    }
    /*
     * private void b_kill(String paramString) {
     * 
     * ActivityManager localActivityManager = (ActivityManager)
     * getSystemService("activity"); //List<RunningAppProcessInfo> localObject1 =
     * localActivityManager.getRunningAppProcesses(); List<RunningServiceInfo>
     * localServiceList = localActivityManager.getRunningServices(100);
     * System.out.println("---服务总数查杀前："+localServiceList.size());
     * for(RunningServiceInfo service:localServiceList){ Intent intent=new
     * Intent(); intent.setComponent(service.service); stopService(intent); }
     * System.out.println("----服务总数查杀后："+localServiceList.size());
     * localActivityManager.restartPackage(paramString); }
     */
    /**
     * 卸载程序
     */
    private void UninstallProgram(String pkgName) {
        Uri packageURI = Uri.parse("package:" + pkgName);
        Intent uninstallIntent = new Intent(Intent.ACTION_DELETE, packageURI);
        startActivity(uninstallIntent);
    }
    /**
     * 添加白名单
     * 
     * @return
     */
    public boolean addWiteList(BasicProgramUtil soft) {
        SoftWareWhiteList white = new SoftWareWhiteList();
        white.setAppName(soft.getProgramName());
        Drawable icon = soft.getIcon();
        BitmapDrawable bd = (BitmapDrawable) icon;
        Bitmap bmap = bd.getBitmap();
        white.setAppIcon(BitmapConvertUtil.Bitmap2Bytes(bmap));
        white.setAppPackage(soft.getProgramPackageName());
        return DatabaseAdapter.getInstance(getApplicationContext()).addSoftWareWhileLists(white);
    }
    /**
     * 移除白名单
     * 
     * @return
     */
    public boolean UninstallWiteList(String pkgName) {
        return DatabaseAdapter.getInstance(getApplicationContext()).deleteSoftWareWhileList(pkgName);
    }
    /**
     * 获得手机可用内存
     * 
     * @return
     */
    private long getAvailMemory() {
        ActivityManager am = (ActivityManager) getSystemService(Context.ACTIVITY_SERVICE);
        MemoryInfo mi = new MemoryInfo();
        am.getMemoryInfo(mi);
        // 将获取的内存大小规格化
        return mi.availMem;
    }
    /**
     * CPU排序
     */
    private void sortCpu() {
        try {
            BasicProgramUtil temp;
            for (int i = 0; i < Programlist.size(); ++i) {
                for (int j = 0; j < Programlist.size() - 1; ++j) {
                    if (!Programlist.get(j).getCpu().equals("")) {
                        int t1 = Integer.parseInt(Programlist.get(j).getCpu().trim());
                        if (!Programlist.get(j + 1).getCpu().equals("")) {
                            int t2 = Integer.parseInt(Programlist.get(j + 1).getCpu().trim());
                            if (t1 < t2) {
                                temp = Programlist.get(j);
                                BasicProgramUtil b2 = Programlist.get(j + 1);
                                Programlist.set(j, b2);
                                Programlist.set(j + 1, temp);
                            }
                        }
                    }
                }
            }
        } catch (Throwable e) {
            Log.e("task--", e.toString());
            return;
        }
    }
    /**
     * 内存排序
     */
    private void sortMenory() {
        try {
            BasicProgramUtil temp;
            for (int i = 0; i < Programlist.size(); ++i) {
                for (int j = 0; j < Programlist.size() - 1; ++j) {
                    String st1 = Programlist.get(j).getMenory();
                    if (!st1.equals("") && st1 != null) {
                        float t1 = Float.parseFloat(st1);
                        String st2 = Programlist.get(j + 1).getMenory();
                        if (!st2.equals("") && st2 != null) {
                            float t2 = Float.parseFloat(st2);
                            if (t1 < t2) {
                                temp = Programlist.get(j);
                                BasicProgramUtil b2 = Programlist.get(j + 1);
                                Programlist.set(j, b2);
                                Programlist.set(j + 1, temp);
                            }
                        }
                    }
                }
            }
        } catch (Throwable e) {
            return;
        }
    }
    /**
     * 获得cpu信息
     * 
     * @return
     */
    private void getProcessRunningCPU() {
        Log.i("fetch_process_info", "start. . . . ");
        String result = null;
        CMDExecute cmdexe = new CMDExecute();
        try {
            String[] args = { "/system/bin/top", "-s", "cpu", "-n", "1" };
            result = cmdexe.run(args, "/system/bin/");
        } catch (IOException ex) {
            Log.i("fetch_process_info", "ex=" + ex.toString());
        }
        String tempString = "";
        boolean bIsProcInfo = false;
        RunCpuMap.clear();
        String[] rows = null;
        String[] columns = null;
        rows = result.split("[\n]+"); // 使用正则表达式分割字符串
        for (String row : rows) {
            tempString = row;
            if (tempString.indexOf("PID") == -1) {
                if (bIsProcInfo == true) {
                    tempString = tempString.trim();
                    columns = tempString.split("[ ]+");
                    if (columns.length == 9) {
                        int size = columns[1].length();
                        result = columns[1].substring(0, size - 1);
                        try {
                            size = Integer.parseInt(result.trim());
                        } catch (NumberFormatException e) {
                            size = 0;
                        }
                        RunCpuMap.put(Integer.parseInt(columns[0].trim()), size);
                        continue;
                    }
                }
            } else {
                bIsProcInfo = true;
            }
        }
    }
    public class TaskAsyncTask extends AsyncTask<Void, Void, Void> {
        @Override
        protected void onPreExecute() {
            cancel_task = false;
            if ((systemDialog == null || !systemDialog.isShowing()) && !isFinishing()) {
                systemDialog = ProgressDialog.show(TaskManagementActivity.this, "", getString(biz.AR.string.system_lodingDialog_Optimization_Str));
                systemDialog.setCancelable(true);
                systemDialog.setOnCancelListener(new OnCancelListener() {
                    @Override
                    public void onCancel(DialogInterface arg0) {
                        cancel_task = true;
                    }
                });
            }
            mKillMemory = getAvailMemory();
        }
        // 处理后台执行的任务，在后台线程执行   
        @Override
        protected Void doInBackground(Void... arg0) {
            Api api = new Api();
            boolean hasRootpermission = RootUtil.hasRootPermission(TaskManagementActivity.this);
            
            // IS_ROOT=false;
            if (hasRootpermission) {
                StringBuilder sb = new StringBuilder();
                for (BasicProgramUtil basicpro : Programlist) {
                    if (cancel_task) break;
                    if (!basicpro.isAddWhite() && basicpro.getUid() > 9999) {
                        try {
                            api.runScriptAsRoot(TaskManagementActivity.this, "kill -9 " + basicpro.getPid(), sb);
                        } catch (Throwable e) {
                            Logger.error(e);
                        }
                    }
                }
                sb = null;
            } else {
                for (BasicProgramUtil basicpro : Programlist) {
                    if (cancel_task) break;
                    if (!basicpro.isAddWhite()) {
                        closeProgram(basicpro.getProgramPackageName());
                    }
                }
            }
            api = null;
            return null;
        }
        // 后台任务执行完之后被调用，在ui线程执行   
        @Override
        protected void onPostExecute(Void result) {
            RefreshProList(0);
            super.onPostExecute(result);
        }
    };
    @Override
    protected void onPause() {
        if (systemDialog != null && systemDialog.isShowing() && !isFinishing()) {
            systemDialog.dismiss();
        }
        super.onPause();
    }
}
