package main.ui;
import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import main.block.BlockRuleSetting;
import main.database.DatabaseAdapter;
import net.workspace.util.Logger;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.preference.PreferenceManager;
import android.view.ContextMenu;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.AdapterView.AdapterContextMenuInfo;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.SimpleAdapter;
import android.widget.TextView;

public class Call_InOut_Activity extends Activity implements OnClickListener {
    private ArrayList<ONERECORD> bONERECORDList = new ArrayList<ONERECORD>();
    private SimpleAdapter mySimperAdapter;
    private ArrayList<HashMap<String, Object>> myData = new ArrayList<HashMap<String, Object>>();;
    private ListView lView;
    private boolean Changed = false;
    private int delPosition = 0;
    private class ONERECORD {
        public boolean incall;
        public String fileName;
        public String attr;
        public String date;
    }
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.call_inout_setting);
        LinearLayout main = (LinearLayout) findViewById(biz.AR.id.call_inout_setting_layout);
        main.setBackgroundResource(Global_Var.mainBG_Imges[Global_Var.currMainBGIndex]);
        RelativeLayout layout = (RelativeLayout) findViewById(biz.AR.id.call_inout_setting_in_layout);
        layout.setOnClickListener(this);
        layout = (RelativeLayout) findViewById(biz.AR.id.call_inout_setting_out_layout);
        layout.setOnClickListener(this);
        layout = (RelativeLayout) findViewById(biz.AR.id.sms_setting_out_layout);
        layout.setOnClickListener(this);
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(this);
    }
    @Override
    protected void onPostResume() {
        initListView();
        refreshData();
        super.onPostResume();
    }
    @Override
    protected void onResume() {
        super.onResume();
    }
    private void initListView() {
        lView = (ListView) findViewById(biz.AR.id.call_inout_setting_listView);
        /*
         * lView.setOnItemClickListener(new OnItemClickListener() {
         * 
         * @Override public void onItemClick(AdapterView<?> parent, View view, int
         * position, long id) { HashMap<String, Object> c = (HashMap<String,
         * Object>) mySimperAdapter.getItem(position); String
         * fileName=c.get("fileName").toString(); String path =
         * Environment.getExternalStorageDirectory().getAbsolutePath() + "/record";
         * if
         * (view.findViewById(biz.AR.id.call_inout_setting_listview_item_Img).getId()==R
         * .drawable.incall) { fileName=path+"/in/"+fileName; } else
         * fileName=path+"/out/"+fileName;
         * 
         * } });
         */
        lView.setOnCreateContextMenuListener(new View.OnCreateContextMenuListener() {
            @Override
            public void onCreateContextMenu(ContextMenu menu, View v, ContextMenuInfo menuInfo) {
                menu.setHeaderTitle("操作选择");
                menu.add(1, 1, 3, "播放该录音");
                menu.add(1, 2, 4, "删除该录音");
            }
        });
    }
    private void refreshData() {
        try {
            ///////////////
            CheckBox cBox = (CheckBox) findViewById(biz.AR.id.call_inout_setting_in_cbox);
            cBox.setChecked(BlockRuleSetting.show_Callin);
            cBox = (CheckBox) findViewById(biz.AR.id.call_inout_setting_out_cbox);
            cBox.setChecked(BlockRuleSetting.show_Callout);
            cBox = (CheckBox) findViewById(biz.AR.id.sms_setting_cbox);
            boolean sms_pop_show = PreferenceManager.getDefaultSharedPreferences(this).getBoolean("sms_pop_show", false);
            cBox.setChecked(sms_pop_show);
            //////////////
            bONERECORDList.clear();
            myData.clear();
            DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault());
            String path = Environment.getExternalStorageDirectory().getAbsolutePath() + "/record";
            File f = new File(path + "/in");
            if (f != null && f.exists()) {
                File[] files = f.listFiles();
                if (files != null && files.length > 0) {
                    for (File one : files) {
                        if (one.isFile()) {
                            if (one.getName().substring(one.getName().lastIndexOf(".")).toLowerCase().equals(".3gp")) {
                                ONERECORD oRecord = new ONERECORD();
                                oRecord.incall = true;
                                oRecord.attr = one.length() / 1024 + "KB";
                                oRecord.fileName = one.getName();
                                oRecord.date = sdf.format(one.lastModified());
                                bONERECORDList.add(oRecord);
                            }
                        }
                    }
                }
            }
            // ///////////拨打的录音
            f = new File(path + "/out");
            if (f != null && f.exists()) {
                File[] files = f.listFiles();
                if (files != null && files.length > 0) {
                    for (File one : files) {
                        if (one.isFile()) {
                            if (one.getName().substring(one.getName().lastIndexOf(".")).toLowerCase().equals(".3gp")) {
                                ONERECORD oRecord = new ONERECORD();
                                oRecord.incall = false;
                                oRecord.attr = one.length() / 1024 + "KB";
                                oRecord.fileName = one.getName();
                                oRecord.date = sdf.format(one.lastModified());
                                bONERECORDList.add(oRecord);
                            }
                        }
                    }
                }
            }
        } catch (Throwable e) {
            e.getMessage();
        }
        TextView t = (TextView) findViewById(biz.AR.id.call_inout_setting_recordnull_txt);
        if (bONERECORDList.size() == 0) {
            t.setVisibility(View.VISIBLE);
        } else {
            t.setVisibility(View.GONE);
        }
        // 生成动态数组，加入数据
        for (int i = 0; i < bONERECORDList.size(); i++) {
            HashMap<String, Object> map = new HashMap<String, Object>();
            if (bONERECORDList.get(i).incall) map.put("inoutImg", biz.AR.drawable.phone_receive_phone);
            else map.put("inoutImg", biz.AR.drawable.phone_send_phone);
            map.put("fileName", bONERECORDList.get(i).fileName);
            map.put("attr", bONERECORDList.get(i).attr);
            map.put("date", bONERECORDList.get(i).date);
            myData.add(map);
        }
        // 生成适配器的Item和动态数组对应的元素
        mySimperAdapter = new SimpleAdapter(this, myData,// 数据源
                biz.AR.layout.call_inout_setting_listview_item,// ListItem的XML实现
                // 动态数组与ImageItem对应的子项
                new String[] { "inoutImg", "fileName", "attr", "date" },
                // ImageItem的XML文件里面的一个ImageView,两个TextView ID
                new int[] { biz.AR.id.call_inout_setting_listview_item_Img, biz.AR.id.call_inout_setting_listview_item_name_txt, biz.AR.id.call_inout_setting_listview_item_attr_txt, biz.AR.id.call_inout_setting_listview_item_date_txt });
        // 添加并且显示
        lView.setAdapter(mySimperAdapter);
    }
    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case biz.AR.id.call_inout_setting_in_layout: {
                CheckBox cBox = (CheckBox) findViewById(biz.AR.id.call_inout_setting_in_cbox);
                BlockRuleSetting.show_Callin = !cBox.isChecked();
                cBox.setChecked(BlockRuleSetting.show_Callin);
                Changed = true;
            }
                break;
            case biz.AR.id.call_inout_setting_out_layout: {
                CheckBox cBox = (CheckBox) findViewById(biz.AR.id.call_inout_setting_out_cbox);
                BlockRuleSetting.show_Callout = !cBox.isChecked();
                cBox.setChecked(BlockRuleSetting.show_Callout);
                Changed = true;
            }
                break;
            case biz.AR.id.sms_setting_out_layout: {
                CheckBox cBox = (CheckBox) findViewById(biz.AR.id.sms_setting_cbox);
                boolean sms_pop_show = !cBox.isChecked();
                SharedPreferences settings = PreferenceManager.getDefaultSharedPreferences(this);
                Editor editor = settings.edit();
                editor.putBoolean("sms_pop_show", sms_pop_show);
                editor.commit();
                cBox.setChecked(sms_pop_show);
                Changed = true;
            }
                break;
            case biz.AR.id.back:
                System.gc();
                Call_InOut_Activity.this.finish();
                break;
        }
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) { // 按下的如果是BACK，同时没有重复
            System.gc();
            Call_InOut_Activity.this.finish();
            return false;
        }
        return super.onKeyDown(keyCode, event);
    }
    @Override
    protected void onPause() {
        if (Changed) {
            DatabaseAdapter databaseAdapter = DatabaseAdapter.getInstance(this);
            databaseAdapter.updaeBlockRuleSetting();
            Changed = false;
        }
        super.onPause();
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        super.onCreateOptionsMenu(menu);
        menu.add(1, 1, 1, "删除全部录音").setIcon(biz.AR.drawable.delete);
        return true;
    }
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case 1: {
                AlertDialog.Builder builder = new AlertDialog.Builder(this).setIcon(biz.AR.drawable.icon).setTitle("提示");
                builder.setMessage("你确认要删除全部录音文件吗?").setCancelable(false).setPositiveButton("确定", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int id) {
                        try {
                            String path = Environment.getExternalStorageDirectory().getAbsolutePath() + "/record";
                            File f = new File(path + "/in");
                            if (f != null && f.exists()) {
                                File[] files = f.listFiles();
                                if (files != null && files.length > 0) {
                                    for (File one : files) {
                                        if (one.isFile() && one.getName().substring(one.getName().lastIndexOf(".")).toLowerCase().equals(".3gp")) {
                                            one.delete();
                                        }
                                    }
                                }
                            }
                            f = new File(path + "/out");
                            if (f != null && f.exists()) {
                                File[] files = f.listFiles();
                                if (files != null && files.length > 0) {
                                    for (File one : files) {
                                        if (one.isFile() && one.getName().substring(one.getName().lastIndexOf(".")).toLowerCase().equals(".3gp")) {
                                            one.delete();
                                        }
                                    }
                                }
                            }
                        } catch (Throwable e) {
                            Logger.error(e);
                        }
                        refreshData();
                    }
                }).setNegativeButton("取消", null);
                AlertDialog alert = builder.create();
                alert.show();
            }
                break;
        }
        return super.onOptionsItemSelected(item);
    }
    @Override
    public boolean onContextItemSelected(MenuItem item) {
        delPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
        switch (item.getItemId()) {
            case 1:// 播放该文件
            {
                String path = Environment.getExternalStorageDirectory().getAbsolutePath() + "/record";
                if (bONERECORDList.get(delPosition).incall) path = path + "/in/" + bONERECORDList.get(delPosition).fileName;
                else path = path + "/out/" + bONERECORDList.get(delPosition).fileName;
                openFile(path);
            }
                break;
            case 2:// 删除该文件
            {
                AlertDialog.Builder builder = new AlertDialog.Builder(this).setIcon(biz.AR.drawable.icon).setTitle("提示");
                builder.setMessage("你确认要删除该录音文件吗?").setCancelable(false).setPositiveButton("确定", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int id) {
                        try {
                            String path = Environment.getExternalStorageDirectory().getAbsolutePath() + "/record";
                            if (bONERECORDList.get(delPosition).incall) path = path + "/in/" + bONERECORDList.get(delPosition).fileName;
                            else path = path + "/out/" + bONERECORDList.get(delPosition).fileName;
                            File f = new File(path);
                            f.delete();
                        } catch (Throwable e) {}
                        refreshData();
                    }
                }).setNegativeButton("取消", null);
                AlertDialog alert = builder.create();
                alert.show();
            }
                break;
        }
        super.onContextItemSelected(item);
        return true;
    }
    private void openFile(String fileName) {
        try {
            File file = new File(fileName);
            Intent intent = new Intent();
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            // 设置intent的Action属性
            intent.setAction(android.content.Intent.ACTION_VIEW);
            // 设置intent的data和Type属性。
            intent.setDataAndType(Uri.fromFile(file), "audio");
            // 跳转
            startActivity(intent);
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        }
    }
}
