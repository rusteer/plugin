package main.ui;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import main.apps.AppMainActivity;
import main.block.BlockbgService;
import main.block.ui.Block_Main_Activity;
import main.callphone.CallPhoneActivity;
import main.database.DatabaseAdapter;
import main.privates.PrivateRuleSetting;
import main.privates.ui.Private_First_Login_Activity;
import main.privates.ui.Private_Login_Activity;
import main.softwaremamager.methods.SoftWareManagerUtile;
import main.systemoptimization.utils.PackageUtil;
import main.utils.Api;
import main.utils.RootUtil;
import main.utils.SharedPreferencesSave;
import net.workspace.util.Logger;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.ActivityManager.MemoryInfo;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.preference.PreferenceManager;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;

//import com.ads.utils.FeedBackDialog;
public class MainActivity extends Activity {
    private int[] privateIconIDs = { biz.AR.drawable.main_item_private, biz.AR.drawable.private_icon1, biz.AR.drawable.private_icon2, biz.AR.drawable.private_icon3, biz.AR.drawable.private_icon4 };
    public ProgressDialog m_Dialog = null;
    public boolean first = true;
    private boolean isFinished = false;
    private ClockView clock;
    private Button main_one_key;
    private Button stop_one_key_btn;
    private LinearLayout memory_layout;
    private LinearLayout clearing_memory_layout;
    private SeekBar clear_memory_seekbar;
    private TextView clear_memory_text;
    private ImageView main_alarm_image;
    private TextView main_alarm_text;
    private int cpuDegree = 0;
    private int memoryDegree = 0;
    private final int CPU_MESSAGE = 11;
    private final int MEMORY_MESSAGE = 12;
    private final int CLEAR_MEMORY_MESSAGE = 13;
    private boolean runThread = true;
    private MemoryThread memoryThread;
    private CpuThread cpuThread;
    private boolean runClear = true;
    private long totalMemory;
    private boolean isOutOfMemory = true;
    SoftWareManagerUtile swu = new SoftWareManagerUtile();
    HanderMessage handler;
    public class MainActivity_Hander extends Handler {
        @Override
        public void handleMessage(android.os.Message msg) {
            if (msg.what == 1) {
                if (m_Dialog != null && !isFinished) m_Dialog.dismiss();
                Global_Var.handler = null;
                if (!isFinished) onDisplayStart();
            }
        };
    }
    private class HanderMessage extends Handler {
        @Override
        public void handleMessage(android.os.Message msg) {
            if (msg.what == CPU_MESSAGE) {
                clock.setCpuDegrees(cpuDegree);
            } else if (msg.what == MEMORY_MESSAGE) {
                if (memoryDegree > 60 && !isOutOfMemory) {
                    isOutOfMemory = true;
                    main_alarm_text.setText("手机运行速度慢");
                    main_alarm_text.setTextColor(getResources().getColor(biz.AR.color.main_yellow));
                    main_alarm_image.setImageResource(biz.AR.drawable.mian_title_warnning);
                } else if (memoryDegree < 60 && isOutOfMemory) {
                    isOutOfMemory = false;
                    main_alarm_text.setText("没有最快，只有更快");
                    main_alarm_text.setTextColor(getResources().getColor(biz.AR.color.main_blue));
                    main_alarm_image.setImageResource(biz.AR.drawable.mian_title_warnning1);
                }
                clock.setMemoryDegrees(memoryDegree);
            } else if (msg.what == CLEAR_MEMORY_MESSAGE) {
                clear_memory_seekbar.setProgress(msg.arg2 * 100 / msg.arg1);
                clear_memory_text.setText("正在清理进程：" + String.valueOf(msg.obj));
            }
        };
    }
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        switch (resultCode) {
            case 2:// 用户没有同意使用
            {
                isFinished = true;
                System.gc();
                finish();
            }
        }
    }
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // ///////////////判断是否已经许可同意
        try {
            if (Global_Var.confirmeduse == 0) {
                SharedPreferences settings = PreferenceManager.getDefaultSharedPreferences(this);
                Global_Var.confirmeduse = settings.getInt("confirmeduse", 0);
            }
            if (Global_Var.confirmeduse == 0)// 第一次运行，需要显示协议许可画面
            {
                Intent intent = new Intent(MainActivity.this, RegisterActivity.class);
                startActivityForResult(intent, 0);
            }
            //保存用户使用次数
            int app_usetimes = SharedPreferencesSave.getInstance(this).getIntValue("app_usetimes", 0) + 1;
            SharedPreferencesSave.getInstance(this).saveIntValue("app_usetimes", app_usetimes);
        } catch (Throwable e) {}
        // /////////////
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.main);
        handler = new HanderMessage();
        clock = (ClockView) findViewById(biz.AR.id.clock);
        main_alarm_image = (ImageView) findViewById(biz.AR.id.main_alarm_image);
        main_alarm_text = (TextView) findViewById(biz.AR.id.main_alarm_text);
        main_one_key = (Button) findViewById(biz.AR.id.main_one_key_btn);
        main_one_key.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View arg0) {
                clear_memory_seekbar.setProgress(0);
                clear_memory_text.setText("数据初始化中...");
                memory_layout.setVisibility(View.GONE);
                clearing_memory_layout.setVisibility(View.VISIBLE);
                runClear = true;
                new TaskAsyncTask().execute();
            }
        });
        stop_one_key_btn = (Button) findViewById(biz.AR.id.stop_one_key_btn);
        stop_one_key_btn.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View arg0) {
                runClear = false;
            }
        });
        memory_layout = (LinearLayout) findViewById(biz.AR.id.memory_layout);
        memory_layout.setVisibility(View.VISIBLE);
        clearing_memory_layout = (LinearLayout) findViewById(biz.AR.id.clearing_memory_layout);
        clearing_memory_layout.setVisibility(View.GONE);
        clear_memory_seekbar = (SeekBar) findViewById(biz.AR.id.clear_memory_seekbar);
        clear_memory_text = (TextView) findViewById(biz.AR.id.clear_memory_text);
        TextView tView = (TextView) findViewById(biz.AR.id.main_title_txt);
        if (tView != null) {
            tView.setText(getResources().getString(biz.AR.string.app_name));
        }
        Global_Var.handler = new MainActivity_Hander();
        try {
            //启动拦截进程
            if (BlockbgService.state == -1) {
                BlockbgService.startMyService(this);
                if ((m_Dialog == null || !m_Dialog.isShowing()) && !isFinishing()) m_Dialog = ProgressDialog.show(this, "请等待...", "正在动态加载数据，请稍后...", true);
            } else onDisplayStart();
        } catch (Throwable e) {
            Logger.error(e);
        }
        DisplayMetrics dm = new DisplayMetrics();
        getWindowManager().getDefaultDisplay().getMetrics(dm);
        Global_Var.displaySize = dm.widthPixels + "*" + dm.heightPixels;
    }
    public void onDisplayStart() {
        MainOnClickListener mainOnClickListener = new MainOnClickListener();
        LinearLayout image = (LinearLayout) findViewById(biz.AR.id.sms_manage_img);
        image.setOnClickListener(mainOnClickListener);
        image = (LinearLayout) findViewById(biz.AR.id.block_sms_img);
        image.setOnClickListener(mainOnClickListener);
        image = (LinearLayout) findViewById(biz.AR.id.block_phone_img);
        image.setOnClickListener(mainOnClickListener);
        image = (LinearLayout) findViewById(biz.AR.id.private_manage_img);
        image.setOnClickListener(mainOnClickListener);
        image = (LinearLayout) findViewById(biz.AR.id.inout_img);
        image.setOnClickListener(mainOnClickListener);
        image = (LinearLayout) findViewById(biz.AR.id.number_search_img);
        image.setOnClickListener(mainOnClickListener);
        image = (LinearLayout) findViewById(biz.AR.id.ip_set_img);
        image.setOnClickListener(mainOnClickListener);
        image = (LinearLayout) findViewById(biz.AR.id.fee_scan_img);
        image.setOnClickListener(mainOnClickListener);
        image = (LinearLayout) findViewById(biz.AR.id.system_manager_img);
        image.setOnClickListener(mainOnClickListener);
        ImageView imageview = (ImageView) findViewById(biz.AR.id.private_room_img);
        imageview.setImageResource(privateIconIDs[PrivateRuleSetting.iconIndex]);
        TextView tv = (TextView) findViewById(biz.AR.id.private_title_text);
        if (PrivateRuleSetting.title.length() > 0) tv.setText(PrivateRuleSetting.title);
        tv = (TextView) findViewById(biz.AR.id.sms_manage_text);
        Cursor cursor = null;
        try {
            cursor = getContentResolver().query(Uri.parse("content://sms/"), new String[] { "count(*) as count" }, "read=0", null, null);
            if (cursor != null && cursor.moveToFirst()) {
                Global_Var.unReadSMSInbox = cursor.getInt(0);
                if (Global_Var.unReadSMSInbox > 0) {
                    tv.setText(Global_Var.unReadSMSInbox + "");
                    tv.setBackgroundResource(biz.AR.drawable.count_bg);
                } else {
                    tv.setText("");
                    tv.setBackgroundResource(0);
                }
            }
        } catch (Throwable e) {
            Logger.error(e);
        } finally {
            if (cursor != null) cursor.close();
        }
        tv = (TextView) findViewById(biz.AR.id.block_sms_text);
        try {
            DatabaseAdapter da = DatabaseAdapter.getInstance(MainActivity.this);
            Global_Var.unReadSMSCount = da.Read_UnReadBlockSMS_Count();
            Global_Var.unReadCallCount = da.Read_UnReadBlockPhone_Count();
        } catch (Throwable e) {
            Logger.error(e);
        }
        if (Global_Var.unReadSMSCount == 0) {
            tv.setText("");
            tv.setBackgroundResource(0);
        } else {
            tv.setText(Global_Var.unReadSMSCount + "");
            tv.setBackgroundResource(biz.AR.drawable.count_bg);
        }
        tv = (TextView) findViewById(biz.AR.id.block_phone_text);
        if (Global_Var.unReadCallCount == 0) {
            tv.setText("");
            tv.setBackgroundResource(0);
        } else {
            tv.setText(Global_Var.unReadCallCount + "");
            tv.setBackgroundResource(biz.AR.drawable.count_bg);
        }
        super.onStart();
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        super.onCreateOptionsMenu(menu);
        //menu.add(1, 1, 1, "意见反馈").setIcon(biz.AR.drawable.menu_suggestion);
        //menu.add(1, 2, 2, "用户协议").setIcon(biz.AR.drawable.menu_update);
        //menu.add(1, 3, 3, "加快捷键").setIcon(biz.AR.drawable.icon2);
        return true;
    }
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case 1:// 反馈
            {
                //new FeedBackDialog(this).show();
            }
                break;
            // 更新
            case 2: {
                Intent intent = new Intent(MainActivity.this, RegisterReadActivity.class);
                MainActivity.this.startActivity(intent);
            }
                break;
            case 3: {
                Intent shortcut = new Intent("com.android.launcher.action.INSTALL_SHORTCUT");
                // 设置属性
                shortcut.putExtra(Intent.EXTRA_SHORTCUT_NAME, "打电话");
                shortcut.putExtra(Intent.EXTRA_SHORTCUT_ICON_RESOURCE, Intent.ShortcutIconResource.fromContext(this, biz.AR.drawable.icon2));
                // 是否允许重复创建
                shortcut.putExtra("duplicate", false);
                // shortcut.setClass(this,SMS_Manage_Main_Activity.class);
                Intent intent = new Intent();
                intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                //intent.addFlags(Intent.FLAG_ACTIVITY_LAUNCHED_FROM_HISTORY);
                // intent.addCategory(Intent.CATEGORY_LAUNCHER);
                intent.setClass(this, CallPhoneActivity.class);
                //用于当程序卸载时同时删除该快捷方式
                intent.setAction("android.intent.action.MAIN");
                intent.addCategory("android.intent.category.LAUNCHER");
                // 设置启动程序
                shortcut.putExtra(Intent.EXTRA_SHORTCUT_INTENT, intent);
                this.sendBroadcast(shortcut);
            }
                break;
            default:
                return super.onOptionsItemSelected(item);
        }
        return true;
    }
    @Override
    protected void onResume() {
        runThread = true;
        if (memoryThread == null) {
            memoryThread = new MemoryThread();
            memoryThread.start();
        }
        if (cpuThread == null) {
            cpuThread = new CpuThread();
            cpuThread.start();
        }
        super.onResume();
    }
    @Override
    protected void onStop() {
        runThread = false;
        super.onStop();
    }
    @Override
    protected void onRestart() {
        onDisplayStart();
        super.onRestart();
    }
    @Override
    protected void onStart() {
        super.onStart();
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        return super.onKeyDown(keyCode, event);
    }
    private class CpuThread extends Thread {
        @Override
        public void run() {
            while (runThread) {
                try {
                    getCpuUsage();
                    handler.sendEmptyMessage(CPU_MESSAGE);
                    sleep(1000);
                } catch (Throwable e) {
                    Logger.error(e);
                }
            }
            cpuThread = null;
            super.run();
        }
    }
    private class MemoryThread extends Thread {
        @Override
        public void run() {
            long availMemory;
            getTotalMemory();
            while (runThread) {
                try {
                    if (totalMemory == 0l) {
                        getTotalMemory();
                    } else {
                        availMemory = getAvailMemory();
                        memoryDegree = (int) (100 - availMemory * 100 / totalMemory);
                        handler.sendEmptyMessage(MEMORY_MESSAGE);
                    }
                    sleep(1000);
                } catch (Throwable e) {
                    Logger.error(e);
                }
            }
            memoryThread = null;
            super.run();
        }
    }
    private void getCpuUsage() {
        try {
            String Result;
            Process p = Runtime.getRuntime().exec("top -n 1");
            BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));
            while ((Result = br.readLine()) != null) {
                if (Result.trim().length() < 1) {
                    continue;
                } else {
                    String[] CPUusr = Result.split("%");
                    String[] CPUusage = CPUusr[0].split("User");
                    String[] SYSusage = CPUusr[1].split("System");
                    cpuDegree = Integer.parseInt(CPUusage[1].trim()) + Integer.parseInt(SYSusage[1].trim());
                    break;
                }
            }
        } catch (Throwable e) {
            Logger.error(e);
        }
    }
    private long getAvailMemory() {
        try {
            ActivityManager am = (ActivityManager) getSystemService(Context.ACTIVITY_SERVICE);
            MemoryInfo mi = new MemoryInfo();
            am.getMemoryInfo(mi);
            // 将获取的内存大小规格化
            return mi.availMem;
        } catch (Throwable e) {
            Logger.error(e);
        }
        return 0;
    }
    /**
     * 获得系统总内存
     * 
     * @return
     */
    private void getTotalMemory() {
        String str1 = "/proc/meminfo";// 系统内存信息文件
        String str2;
        String[] arrayOfString;
        try {
            FileReader localFileReader = new FileReader(str1);
            BufferedReader localBufferedReader = new BufferedReader(localFileReader, 8192);
            str2 = localBufferedReader.readLine();// 读取meminfo第一行，系统总内存大小
            arrayOfString = str2.split("\\s+");
            for (String num : arrayOfString) {
                Log.i(str2, num + "\t");
            }
            totalMemory = Integer.valueOf(arrayOfString[1]).intValue() * 1024;// 获得系统总内存，单位是KB，乘以1024转换为Byte
            localBufferedReader.close();
        } catch (Throwable e) {}
    }
    public class TaskAsyncTask extends AsyncTask<Void, Void, Void> {
        @Override
        protected void onPreExecute() {}
        // 处理后台执行的任务，在后台线程执行
        @Override
        protected Void doInBackground(Void... arg0) {
            try {
                ActivityManager activityManager = (ActivityManager) getSystemService(ACTIVITY_SERVICE);
                List<RunningAppProcessInfo> procList = activityManager.getRunningAppProcesses();
                PackageUtil packageUtil = new PackageUtil(MainActivity.this);
                PackageManager packageManager = getPackageManager();
                List<ProgramMessage> programlist = new ArrayList<ProgramMessage>();
                for (RunningAppProcessInfo one : procList) {
                    // 如果是本应用的信息，直接忽略 //系统进程不处理
                    if (one.uid < 10000 || one.processName.equalsIgnoreCase( getPackageName())) continue;
                    // 根据进程名，获取应用程序的ApplicationInfo对象
                    ApplicationInfo tempAppInfo = packageUtil.getApplicationInfo(one.processName);
                    // 判断应用程序是否加入白名单
                    if (tempAppInfo == null) continue;
                    boolean isadd = DatabaseAdapter.getInstance(MainActivity.this).quryIsAddWhitelist(tempAppInfo.packageName);
                    if (isadd) continue;
                    ProgramMessage programMessage = new ProgramMessage();
                    programMessage.pid = one.pid;
                    programMessage.programPackageName = tempAppInfo.packageName;
                    programMessage.processName = tempAppInfo.loadLabel(packageManager).toString();
                    programlist.add(programMessage);
                }
                boolean hasRootPermission = RootUtil.hasRootPermission(MainActivity.this);
                //IS_ROOT=false;
                if (hasRootPermission) {
                    StringBuilder sb = new StringBuilder();
                    for (int i = 0, n = programlist.size(); i < n; i++) {
                        if (!runClear) return null;
                        ProgramMessage pm = programlist.get(i);
                        if (pm.programPackageName.equalsIgnoreCase("com.android.launcher2")) continue;
                        try {
                            Message mess = new Message();
                            mess.what = CLEAR_MEMORY_MESSAGE;
                            mess.arg1 = n;
                            mess.arg2 = i;
                            mess.obj = pm.processName;
                            handler.sendMessage(mess);
                            Api api = new Api();
                            api.runScriptAsRoot(MainActivity.this, "kill -9 " + pm.pid, sb);
                            api = null;
                        } catch (Throwable e) {
                            Logger.error(e);
                        }
                    }
                    sb = null;
                } else {
                    for (int i = 0, n = programlist.size(); i < n; i++) {
                        if (!runClear) return null;
                        ProgramMessage pm = programlist.get(i);
                        try {
                            Message mess = new Message();
                            mess.what = CLEAR_MEMORY_MESSAGE;
                            mess.arg1 = n;
                            mess.arg2 = i;
                            mess.obj = pm.processName;
                            handler.sendMessage(mess);
                            closeProgram(pm.programPackageName);
                        } catch (Throwable e) {
                            Logger.error(e);
                        }
                    }
                }
            } catch (Throwable e) {
                Logger.error(e);
            }
            return null;
        }
        // 后台任务执行完之后被调用，在ui线程执行
        @Override
        protected void onPostExecute(Void result) {
            main_alarm_text.setText("加速完成");
            main_alarm_text.setTextColor(getResources().getColor(biz.AR.color.main_blue));
            main_alarm_image.setImageResource(biz.AR.drawable.mian_title_warnning1);
            memory_layout.setVisibility(View.VISIBLE);
            clearing_memory_layout.setVisibility(View.GONE);
            super.onPostExecute(result);
        }
    };
    private void closeProgram(String pkgName) {
        ActivityManager am = (ActivityManager) getSystemService(Context.ACTIVITY_SERVICE);
        int v_os = android.os.Build.VERSION.SDK_INT;
        try {
            if (v_os > 7) {
                am.killBackgroundProcesses(pkgName);
            } else {
                am.restartPackage(pkgName);
            }
        } catch (Throwable e) {
            Logger.error(e);
        }
    }
    private class ProgramMessage {
        public int pid;
        public String programPackageName;
        public String processName;
    }
    @Override
    protected void onDestroy() {
        System.gc();
        super.onDestroy();
    }
    private class MainOnClickListener implements OnClickListener {
        @Override
        public void onClick(View v) {
            switch (v.getId()) {
                case biz.AR.id.sms_manage_img: {
                    Intent intent = new Intent(MainActivity.this, SMS_Manage_Main_Activity.class);
                    startActivity(intent);
                }
                    break;
                case biz.AR.id.block_sms_img: {
                    Block_Main_Activity.tabIndex = 0;
                    Intent intent = new Intent(MainActivity.this, Block_Main_Activity.class);
                    startActivity(intent);
                }
                    break;
                case biz.AR.id.block_phone_img: {
                    Block_Main_Activity.tabIndex = 1;
                    Intent intent = new Intent(MainActivity.this, Block_Main_Activity.class);
                    startActivity(intent);
                }
                    break;
                case biz.AR.id.private_manage_img: {
                    Intent intent;
                    if (PrivateRuleSetting.password.equals("")) intent = new Intent(MainActivity.this, Private_First_Login_Activity.class);
                    else intent = new Intent(MainActivity.this, Private_Login_Activity.class);
                    startActivity(intent);
                }
                    break;
                case biz.AR.id.inout_img: {
                    Intent intent = new Intent(MainActivity.this, Call_InOut_Activity.class);
                    startActivity(intent);
                }
                    break;
                case biz.AR.id.number_search_img: {
                    Intent intent = new Intent(MainActivity.this, Search_Activity.class);
                    startActivity(intent);
                }
                    break;
                case biz.AR.id.ip_set_img: {
                    Intent intent = new Intent(MainActivity.this, IPSetting_Activity.class);
                    startActivity(intent);
                }
                    break;
                case biz.AR.id.fee_scan_img: {
                    Intent intent = new Intent(MainActivity.this, FeeScan_Activity.class);
                    startActivity(intent);
                }
                    break;
                case biz.AR.id.system_manager_img: {
                    Intent intent = new Intent(MainActivity.this, AppMainActivity.class);
                    startActivity(intent);
                }
                    break;
                default:
                    break;
            }
        }
    }
    @Override
    protected void onPause() {
        if (m_Dialog != null && m_Dialog.isShowing() && !isFinishing()) {
            m_Dialog.dismiss();
        }
        super.onPause();
    }
}
