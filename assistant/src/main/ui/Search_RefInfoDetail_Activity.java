package main.ui;
import java.util.ArrayList;
import java.util.HashMap;
import main.database.DBManager;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.RadioButton;
import android.widget.SimpleAdapter;
import android.widget.TextView;

public class Search_RefInfoDetail_Activity extends Activity {
    public static int index;
    public static String typeName;
    private SimpleAdapter simpleAdapter;
    private ArrayList<HashMap<String, Object>> myData;
    private ListView lView;
    private String choiceDesc;
    private String choiceNumber;
    public class refInfo {
        public String typeName;
        public String pNumber;
    }
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.search_refinfodetail_activity);
        LinearLayout main = (LinearLayout) findViewById(biz.AR.id.search_refinfodetail_layout);
        main.setBackgroundResource(Global_Var.mainBG_Imges[Global_Var.currMainBGIndex]);
        initListView();
        ((TextView) findViewById(biz.AR.id.search_refinfodetail_title)).setText(typeName);
        refreshData();
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) { // 按下的如果是BACK，同时没有重复
            System.gc();
            Search_RefInfoDetail_Activity.this.finish();
            return false;
        }
        return super.onKeyDown(keyCode, event);
    }
    private void initListView() {
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                Search_RefInfoDetail_Activity.this.finish();
            }
        });
        lView = (ListView) findViewById(biz.AR.id.search_refinfodetail_listView);
        lView.setOnItemClickListener(new OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                //HashMap<String, Object> c = (HashMap<String, Object>) simpleAdapter.getItem(position);
                TextView vid = (TextView) view.findViewById(biz.AR.id.search_refinfodetail_listview_txt);
                choiceDesc = vid.getText().toString();
                vid = (TextView) view.findViewById(biz.AR.id.search_refinfodetail_listview_pnumber_txt);
                choiceNumber = vid.getText().toString();
                showDialog(1);
                ////////////
            }
        });
    }
    private void refreshData() {
        if (myData != null) myData.clear();
        // 生成动态数组，加入数据
        DBManager dbManager = new DBManager(this);
        dbManager.openDatabase();
        ArrayList<String> refInfos = dbManager.GetRefInfoDetail(index);
        myData = new ArrayList<HashMap<String, Object>>();
        for (String one : refInfos) {
            HashMap<String, Object> map = new HashMap<String, Object>();
            String[] ss = one.split("@");
            map.put("Desc", ss[0]);
            map.put("pNumber", ss[1]);
            myData.add(map);
        }
        simpleAdapter = new SimpleAdapter(this, myData,// 数据源
                biz.AR.layout.search_refinfodetail_listview_item,// ListItem的XML实现
                // 动态数组与ImageItem对应的子项
                new String[] { "Desc", "pNumber" },
                // ImageItem的XML文件里面的一个ImageView,两个TextView ID
                new int[] { biz.AR.id.search_refinfodetail_listview_txt, biz.AR.id.search_refinfodetail_listview_pnumber_txt });
        // 添加并且显示
        lView.setAdapter(simpleAdapter);
    }
    @Override
    protected Dialog onCreateDialog(int id) {
        Dialog dialog = null;
        switch (id) {
            case 1: {
                Builder builder = new AlertDialog.Builder(this);
                builder.setTitle(choiceDesc + "/" + choiceNumber);
                LayoutInflater inflater = getLayoutInflater();
                final View layout = inflater.inflate(biz.AR.layout.search_echo, null);
                builder.setView(layout);
                RadioButton rb = (RadioButton) layout.findViewById(biz.AR.id.search_echo_call_rbtn);
                rb.setChecked(true);
                DialogInterface.OnClickListener btnListener = new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int which) {
                        RadioButton rb = (RadioButton) layout.findViewById(biz.AR.id.search_echo_call_rbtn);
                        if (rb.isChecked()) {
                            Intent intent = new Intent(Intent.ACTION_CALL, Uri.parse("tel:" + choiceNumber));
                            startActivity(intent);
                        } else {
                            Intent intent = new Intent(Intent.ACTION_SENDTO, Uri.parse("smsto:" + choiceNumber));
                            startActivity(intent);
                        }
                    }
                };
                builder.setPositiveButton("确定", btnListener);
                builder.setNegativeButton("取消", null);
                dialog = builder.create();
            }
                break;
        }
        return dialog;
    }
    @Override
    protected void onPrepareDialog(int id, Dialog dialog) {
        switch (id) {
            case 1:
                removeDialog(1);
                break;
        }
    }
}
