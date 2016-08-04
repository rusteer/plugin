package main.systemoptimization.ui.activities;
import java.io.DataOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import main.systemoptimization.methods.ContentListElement;
import main.systemoptimization.methods.ListElement;
import main.systemoptimization.methods.SectionListElement;
import main.systemoptimization.utils.PackageUtil;
import net.workspace.util.Logger;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.Bundle;
import android.os.Handler;
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
import android.widget.TextView;

/**
 * 开机加速
 * @author Administrator
 *
 */
public class BootStarpSpeedupActivity extends Activity {
    private TextView mTitleMsg1; //显示有开机启动多少程序
    private TextView mTitleMsg2;//显示禁止了多少程序
    private ListView mBootStarpSpeedupList; //显示列表
    private LinearLayout mNoRootLayout; //root提示
    private LinearLayout mMsgLayout; //root提示
    mBootStarpSpeedupAdapter bootadapter;
    ProgressDialog systemDialog;
    //应用程序包名
    private final static String AppPackage = "com.ranfeng.androidbodyguard";
    /**
     * 启动项
     */
    private final static String BOOTSOFTNUMBER = "BOOTSOFTNUMBER";
    /**
     * 禁止启动项
     */
    private final static String DISABLEBOOTSOFTNUMBER = "DISABLEBOOTSOFTNUMBER";
    /**
     * 判断禁止启动项
     */
    private final static int SHOWDISABLEBOOTSOFTNUMBER = 1;
    /**
     * 判断禁止启动项
     */
    private final static int UPDATEUI = 0;
    /**
     * 判断禁
     */
    private final static int rooted = 3;
    /**
     * rot
     */
    private final static int root = 4;
    /**
     *手机是否ROOT
     */
    private boolean isRoot = false;
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
        // TODO Auto-generated method stub
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.system_bootstarpspeedup_activity);
        mTitleMsg1 = (TextView) findViewById(biz.AR.id.system_BootStarpSpeedup_Msg1);
        mTitleMsg2 = (TextView) findViewById(biz.AR.id.system_BootStarpSpeedup_Msg2);
        mBootStarpSpeedupList = (ListView) findViewById(biz.AR.id.system_BootStarpSpeedup_list);
        mBootStarpSpeedupList.setClickable(false);
        mNoRootLayout = (LinearLayout) findViewById(biz.AR.id.BootStarpSpeedup_noRootmsg_layout);
        mMsgLayout = (LinearLayout) findViewById(biz.AR.id.BootStarpSpeedup_msg_layout);
        if ((systemDialog == null || !systemDialog.isShowing()) && !isFinishing()) {
            systemDialog = ProgressDialog.show(BootStarpSpeedupActivity.this, "", getString(biz.AR.string.system_lodingDialog_Str));
            systemDialog.setCancelable(true);
        }
        mBootStarpSpeedupList.setOnItemClickListener(mbootListOnItemClickListener);
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                BootStarpSpeedupActivity.this.finish();
            }
        });
        new initBootListThread().start();
    }
    class checkThread extends Thread {
        @Override
        public void run() {
            // TODO Auto-generated method stub
            isRoot = PackageUtil.runRootCommand("ls");
            if (isRoot) {
                handler.sendEmptyMessage(rooted);
            } else {
                handler.sendEmptyMessage(root);
            }
            //			handler.sendEmptyMessage(SHOWDISABLEBOOTSOFTNUMBER);
            super.run();
        }
    }
    private Handler handler = new Handler() {
        @Override
        public void handleMessage(Message message) {
            switch (message.what) {
                case UPDATEUI:
                    //刷新UI，显示数据，并关闭进度条
                    mBootStarpSpeedupList.setAdapter(bootadapter);
                    mBootStarpSpeedupList.invalidate();
                    bootadapter.notifyDataSetChanged();
                    Bundle bundle = message.getData();
                    int n1 = bundle.getInt(BOOTSOFTNUMBER);
                    int n2 = bundle.getInt(DISABLEBOOTSOFTNUMBER);
                    mTitleMsg1.setText("" + n1);
                    mTitleMsg2.setText("" + n2);
                    if (systemDialog != null && systemDialog.isShowing() && !isFinishing()) systemDialog.dismiss();
                    break;
                case SHOWDISABLEBOOTSOFTNUMBER:
                    //				initBootListUI();
                    new initBootListThread().start();
                    break;
                case rooted:
                    mMsgLayout.setVisibility(View.GONE);
                    mNoRootLayout.setVisibility(View.GONE);
                    break;
                case root:
                    mMsgLayout.setVisibility(View.GONE);
                    mNoRootLayout.setVisibility(View.VISIBLE);
                    break;
            }
            super.handleMessage(message);
        }
    };
    /**
     * 加载列表UI
     */
    public void initBootListUI() {
        new Thread() {
            @Override
            public void run() {
                try {
                    bootadapter = new mBootStarpSpeedupAdapter(BootStarpSpeedupActivity.this);
                    Map<String, ArrayList<ListElement>> map = fetch_installed_apps();
                    ArrayList<ListElement> boot = map.get(BOOTSOFTNUMBER);
                    if (boot.size() > 0) {
                        bootadapter.addSectionHeaderItem("开机启动项：");
                        bootadapter.addList(boot);
                    }
                    ArrayList<ListElement> disboot = map.get(DISABLEBOOTSOFTNUMBER);
                    if (disboot.size() > 0) {
                        bootadapter.addSectionHeaderItem("开机禁止启动项：");
                        bootadapter.addList(disboot);
                    }
                    Message msg = new Message();
                    Bundle bundle = new Bundle();
                    bundle.putInt(BOOTSOFTNUMBER, boot.size());
                    bundle.putInt(DISABLEBOOTSOFTNUMBER, disboot.size());
                    msg.setData(bundle);
                    msg.what = UPDATEUI;
                    handler.sendMessage(msg);
                } catch (Throwable e) {
                    Logger.error(e);
                } finally {}
            }
        }.start();
    }
    class initBootListThread extends Thread {
        @Override
        public void run() {
            try {
                isRoot = PackageUtil.runRootCommand("ls");
                if (isRoot) {
                    handler.sendEmptyMessage(rooted);
                } else {
                    handler.sendEmptyMessage(root);
                }
                bootadapter = new mBootStarpSpeedupAdapter(BootStarpSpeedupActivity.this);
                Map<String, ArrayList<ListElement>> map = fetch_installed_apps();
                ArrayList<ListElement> boot = map.get(BOOTSOFTNUMBER);
                if (boot.size() > 0) {
                    bootadapter.addSectionHeaderItem("开机启动项：");
                    bootadapter.addList(boot);
                }
                ArrayList<ListElement> disboot = map.get(DISABLEBOOTSOFTNUMBER);
                if (disboot.size() > 0) {
                    bootadapter.addSectionHeaderItem("开机禁止启动项：");
                    bootadapter.addList(disboot);
                }
                Message msg = new Message();
                Bundle bundle = new Bundle();
                bundle.putInt(BOOTSOFTNUMBER, boot.size());
                bundle.putInt(DISABLEBOOTSOFTNUMBER, disboot.size());
                msg.setData(bundle);
                msg.what = UPDATEUI;
                handler.sendMessage(msg);
            } catch (Throwable e) {
                Logger.error(e);
            } finally {}
            super.run();
        }
    }
    /**
     * 获得开机启动软件列表
     * @return
     */
    public Map<String, ArrayList<ListElement>> fetch_installed_apps() {
        Map<String, ArrayList<ListElement>> softMap = new HashMap<String, ArrayList<ListElement>>();
        ArrayList<ListElement> elements = new ArrayList<ListElement>();
        ArrayList<ListElement> diselements = new ArrayList<ListElement>();
        PackageManager packageManager = getPackageManager();
        Intent intent = new Intent(Intent.ACTION_BOOT_COMPLETED, null);//开机启动的intent
        //Intent intent = new Intent("android.provider.Telephony.SMS_RECEIVED",null);//开机启动的intent
        List<ResolveInfo> appsList = packageManager.queryBroadcastReceivers(intent, 0);//搜索开机启动的intent的BroadcastReceivers
        List<ResolveInfo> allappsList = packageManager.queryBroadcastReceivers(intent, PackageManager.GET_DISABLED_COMPONENTS);//搜索开机启动的intent的BroadcastReceivers
        for (int i = 0; i < appsList.size(); i++) {
            ResolveInfo app = appsList.get(i);
            if ((app.activityInfo.applicationInfo.flags & ApplicationInfo.FLAG_SYSTEM) <= 0 && !app.activityInfo.packageName.equals(AppPackage)) {
                ContentListElement element = new ContentListElement();
                element.setId(i);
                element.setImage(app.loadIcon(packageManager));
                element.setAppName(app.loadLabel(packageManager).toString());
                element.setServiceName(app.activityInfo.name);
                element.setPackageName(app.activityInfo.packageName);
                element.setState("1");
                elements.add(element);
            } else {
                continue;
            }
        }
        int dd = elements.size();
        //		ArrayList<ListElement> elements2= element; 
        softMap.put(BOOTSOFTNUMBER, elements);
        //获得手机的启动所有项（包含被禁止的）
        for (int j = 0; j < allappsList.size(); j++) {
            ResolveInfo allapp = allappsList.get(j);
            if ((allapp.activityInfo.applicationInfo.flags & ApplicationInfo.FLAG_SYSTEM) <= 0 && !allapp.activityInfo.packageName.equals(AppPackage)) {
                ContentListElement diselement = new ContentListElement();
                diselement.setId(j);
                diselement.setImage(allapp.loadIcon(packageManager));
                diselement.setAppName(allapp.loadLabel(packageManager).toString());
                diselement.setServiceName(allapp.activityInfo.name);
                diselement.setPackageName(allapp.activityInfo.packageName);
                diselement.setState("0");
                diselements.add(diselement);
            } else {
                continue;
            }
        }
        //获得禁止的启动项
        for (int m = 0; m < diselements.size(); m++) {
            for (int n = 0; n < elements.size(); n++) {
                ContentListElement c1 = (ContentListElement) diselements.get(m);
                ContentListElement c2 = (ContentListElement) elements.get(n);
                if (c1.getServiceName().equals(c2.getServiceName())) {
                    diselements.remove(m);
                }
            }
        }
        softMap.put(DISABLEBOOTSOFTNUMBER, diselements);
        return softMap;
    }
    /** 关闭开机启动项管理      */
    public void closeAutoStartApp(final String serName) {
        new Thread() {
            @Override
            public void run() {
                Process process = null;
                DataOutputStream os = null;
                try {
                    String scmd = "pm disable " + serName + "";
                    process = Runtime.getRuntime().exec(scmd); //su
                    os = new DataOutputStream(process.getOutputStream());
                    os.flush();
                    os.close();
                    Thread.sleep(100);
                    process.waitFor();
                    process.destroy();
                    initBootListUI();
                } catch (Throwable e) {} finally {
                    if (systemDialog != null && systemDialog.isShowing() && !isFinishing()) systemDialog.dismiss();
                }
            }
        }.start();
    }
    /** 恢复开机启动项管理   */
    public void startAutoStartApp(final String serName) {
        new Thread() {
            @Override
            public void run() {
                Process process = null;
                DataOutputStream os = null;
                try {
                    String scmd = "pm enable " + serName + "";
                    process = Runtime.getRuntime().exec(scmd);
                    os = new DataOutputStream(process.getOutputStream());
                    //					command = "CLASSPATH=/system/framework/pm.jar \n"; 
                    //					os.writeBytes(command);
                    //					os.flush();
                    //					// command="/system/bin/app_process /system/bin com.android.commands.pm.Pm disable "+appPackageName+" \n"; 
                    //					command= "pm enable "+appPackageName+" \n"; 
                    //					System.out.print(command);
                    //					os.writeBytes(command);
                    os.writeBytes("exit\n");
                    //					//progressDialog.dismiss();
                    os.flush();
                    os.close();
                    Thread.sleep(100);
                    process.waitFor();
                    process.destroy();
                    initBootListUI();
                } catch (Throwable e) {
                    Logger.error(e);
                } finally {
                    if (systemDialog != null && systemDialog.isShowing() && !isFinishing()) systemDialog.dismiss();
                }
            }
        }.start();
    }
    /**
     *  启动程序列表适配器
     * @author Administrator
     *
     */
    class mBootStarpSpeedupAdapter extends BaseAdapter {
        private Context context;
        protected ArrayList<ListElement> resultList;
        private LayoutInflater layoutInflater;
        public mBootStarpSpeedupAdapter(Context context) {
            super();
            this.context = context;
            layoutInflater = (LayoutInflater) context.getSystemService("layout_inflater");
            resultList = new ArrayList<ListElement>();
        }
        @Override
        public int getCount() {
            // TODO Auto-generated method stub
            return resultList.size();
        }
        @Override
        public Object getItem(int position) {
            // TODO Auto-generated method stub
            return resultList.get(position);
        }
        @Override
        public long getItemId(int position) {
            // TODO Auto-generated method stub
            return position;
        }
        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            // TODO Auto-generated method stub
            return resultList.get(position).getViewForListElement(layoutInflater, context, convertView);
        }
        public void addList(List<ListElement> elements) {
            resultList.addAll(elements);
        }
        @Override
        public boolean isEnabled(int position) {
            return resultList.get(position).isClickable();
        }
        public void addSectionHeaderItem(String text) {
            SectionListElement element = new SectionListElement();
            element.setText(text);
            resultList.add(element);
        }
    }
    /**
     * 列表点击事件
     */
    private OnItemClickListener mbootListOnItemClickListener = new OnItemClickListener() {
        @Override
        public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
            // TODO Auto-generated method stub
           // System.out.println("点击的是" + position);
            if (bootadapter.getCount() > 0) {
                ContentListElement listElement = (ContentListElement) bootadapter.getItem(position);
                if (listElement.getState().equals("1")) {
                    //可以禁止‘
                    if ((systemDialog == null || !systemDialog.isShowing()) && !isFinishing()) {
                        systemDialog = ProgressDialog.show(BootStarpSpeedupActivity.this, "", "正在禁止...");
                        systemDialog.setCancelable(true);
                    }
                    //					PackageManager pm=getPackageManager();
                    //					ComponentName cn=new ComponentName(listElement.getPackageName(),listElement.getServiceName());
                    //					pm.setComponentEnabledSetting(cn,  PackageManager.COMPONENT_ENABLED_STATE_ENABLED, 0);
                    closeAutoStartApp(listElement.getServiceName());
                } else {
                    if ((systemDialog == null || !systemDialog.isShowing()) && !isFinishing()) {
                        systemDialog = ProgressDialog.show(BootStarpSpeedupActivity.this, "", "正在启动...");
                        systemDialog.setCancelable(true);
                    }
                    startAutoStartApp(listElement.getServiceName());
                }
            }
            //closeAutoStartApp
        }
    };
    @Override
    protected void onDestroy() {
        // TODO Auto-generated method stub
        bootadapter = null;
        System.gc();
        super.onDestroy();
    }
    @Override
    protected void onResume() {
        // TODO Auto-generated method stub
        //		new initBootListThread().start();
        super.onResume();
    }
    @Override
    protected void onStart() {
        // TODO Auto-generated method stub
        super.onStart();
    }
    @Override
    protected void onPause() {
        if (systemDialog != null && systemDialog.isShowing() && !isFinishing()) {
            systemDialog.dismiss();
        }
        super.onPause();
    }
}
