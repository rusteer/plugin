package main.privates.ui;
import java.util.ArrayList;
import java.util.HashMap;
import main.database.DatabaseAdapter;
import main.privates.PrivatePhone;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.TextView;

public class Private_PhoneDel_Activity extends Activity {
    private ArrayList<PrivatePhone> privatePhones = new ArrayList<PrivatePhone>();
    private SimpleAdapter mySimperAdapter;
    private ArrayList<HashMap<String, Object>> myData = new ArrayList<HashMap<String, Object>>();
    private ListView lView;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.private_phonedel_activity);
        lView = (ListView) findViewById(biz.AR.id.private_phonedel_listView);
        refreshData();
        setclick();
    }
    private void setclick() {
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                Private_PhoneDel_Activity.this.finish();
            }
        });
        Button button = (Button) findViewById(biz.AR.id.private_phonedel_del_btn);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showDialog(1);
            }
        });
        button = (Button) findViewById(biz.AR.id.private_phonedel_all_btn);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Button button = (Button) findViewById(biz.AR.id.private_phonedel_all_btn);
                if (button.getText().toString().equals("全选")) {
                    int count = lView.getChildCount();
                    for (int i = 0; i < count; i++) {
                        CheckBox box = (CheckBox) lView.getChildAt(i).findViewById(biz.AR.id.private_phonedel_listview_item_choice_cbox);
                        box.setChecked(true);
                    }
                    button.setText("取消全选");
                } else {
                    int count = lView.getChildCount();
                    for (int i = 0; i < count; i++) {
                        CheckBox box = (CheckBox) lView.getChildAt(i).findViewById(biz.AR.id.private_phonedel_listview_item_choice_cbox);
                        box.setChecked(false);
                    }
                    button.setText("全选");
                }
            }
        });
        button = (Button) findViewById(biz.AR.id.private_phonedel_exit_btn);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                Private_PhoneDel_Activity.this.finish();
            }
        });
    }
    private void refreshData() {
        DatabaseAdapter da = DatabaseAdapter.getInstance(this);
        privatePhones.clear();
        privatePhones = da.readPrivatePhones();
        myData.clear();
        // 生成动态数组，加入数据
        myData = new ArrayList<HashMap<String, Object>>();
        for (PrivatePhone one : privatePhones) {
            HashMap<String, Object> map = new HashMap<String, Object>();
            if (one.readFlag) map.put("readFlag", biz.AR.drawable.callread);
            else map.put("readFlag", biz.AR.drawable.callunread);
            map.put("phone_id", one.id);
            map.put("phone", one.pNumber + " " + one.mproperty);
            map.put("date", "[" + one.createDate + "]");
            myData.add(map);
        }
        // 生成适配器的Item和动态数组对应的元素
        mySimperAdapter = new SimpleAdapter(this, myData,// 数据源
                biz.AR.layout.private_phonedel_activity_listview_item,// ListItem的XML实现
                // 动态数组与ImageItem对应的子项
                new String[] { "phone_id", "readFlag", "phone", "date" },
                // ImageItem的XML文件里面的一个ImageView,两个TextView ID
                new int[] { biz.AR.id.private_phonedel_listview_item_id_txt, biz.AR.id.private_phonedel_listview_item_readflag_img, biz.AR.id.private_phonedel_listview_item_phone_txt, biz.AR.id.private_phonedel_listview_item_date_txt });
        // 添加并且显示
        lView.setAdapter(mySimperAdapter);
    }
    @Override
    protected Dialog onCreateDialog(int id) {
        AlertDialog dialog = null;
        switch (id) {
            case 1: {
                AlertDialog.Builder builder = new AlertDialog.Builder(this).setIcon(biz.AR.drawable.icon).setTitle("提示");
                builder.setMessage("你确认要删除来电记录吗?").setCancelable(false).setPositiveButton("确定", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int id) {
                        DatabaseAdapter dAdapter = DatabaseAdapter.getInstance(Private_PhoneDel_Activity.this);
                        int count = lView.getChildCount();
                        for (int i = 0; i < count; i++) {
                            TextView v = (TextView) lView.getChildAt(i).findViewById(biz.AR.id.private_phonedel_listview_item_id_txt);
                            CheckBox box = (CheckBox) lView.getChildAt(i).findViewById(biz.AR.id.private_phonedel_listview_item_choice_cbox);
                            if (box.isChecked()) {
                                dAdapter.delPrivatePhone(Integer.parseInt(v.getText().toString()));
                            }
                        }
                        refreshData();
                        mySimperAdapter.notifyDataSetChanged();
                    }
                }).setNegativeButton("取消", null);
                dialog = builder.create();
            }
                break;
            default:
                break;
        }
        return dialog;
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) { // 按下的如果是BACK，同时没有重复
            System.gc();
            Private_PhoneDel_Activity.this.finish();
            return false;
        }
        return super.onKeyDown(keyCode, event);
    }
}
