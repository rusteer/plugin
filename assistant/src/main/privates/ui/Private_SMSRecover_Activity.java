package main.privates.ui;
import java.util.ArrayList;
import java.util.HashMap;
import main.database.DatabaseAdapter;
import main.message.MessageUtils;
import main.privates.PrivateSMS;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.ContentValues;
import android.content.DialogInterface;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.TextView;

public class Private_SMSRecover_Activity extends Activity {
    private ArrayList<PrivateSMS> privateSMSs;
    private SimpleAdapter mySimperAdapter;
    private ArrayList<HashMap<String, Object>> myData;
    private ListView lView;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.private_smsrecover_activity);
        lView = (ListView) findViewById(biz.AR.id.private_smsrecover_listView);
        refreshData();
        setclick();
    }
    private void setclick() {
        Button button = (Button) findViewById(biz.AR.id.private_smsrecover_recover_btn);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showDialog(1);
            }
        });
        button = (Button) findViewById(biz.AR.id.private_smsrecover_all_btn);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Button button = (Button) findViewById(biz.AR.id.private_smsrecover_all_btn);
                if (button.getText().toString().equals("全选")) {
                    int count = lView.getChildCount();
                    for (int i = 0; i < count; i++) {
                        CheckBox box = (CheckBox) lView.getChildAt(i).findViewById(biz.AR.id.private_smsrecover_listview_item_choice_cbox);
                        box.setChecked(true);
                    }
                    button.setText("取消全选");
                } else {
                    int count = lView.getChildCount();
                    for (int i = 0; i < count; i++) {
                        CheckBox box = (CheckBox) lView.getChildAt(i).findViewById(biz.AR.id.private_smsrecover_listview_item_choice_cbox);
                        box.setChecked(false);
                    }
                    button.setText("全选");
                }
            }
        });
        button = (Button) findViewById(biz.AR.id.private_smsrecover_exit_btn);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    System.gc();
                    Private_SMSRecover_Activity.this.finish();
                } catch (Throwable e) {}
            }
        });
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    System.gc();
                    Private_SMSRecover_Activity.this.finish();
                } catch (Throwable e) {}
            }
        });
    }
    private void refreshData() {
        DatabaseAdapter da = DatabaseAdapter.getInstance(this);
        if (privateSMSs != null) privateSMSs.clear();
        privateSMSs = da.readPrivateSMSs();
        if (myData != null) myData.clear();
        // 生成动态数组，加入数据
        myData = new ArrayList<HashMap<String, Object>>();
        for (int i = 0; i < privateSMSs.size(); i++) {
            HashMap<String, Object> map = new HashMap<String, Object>();
            if (privateSMSs.get(i).read) map.put("readFlag", biz.AR.drawable.smsread);
            else map.put("readFlag", biz.AR.drawable.smsunread);
            map.put("sms_id", privateSMSs.get(i).id);
            map.put("phone", privateSMSs.get(i).address + " " + privateSMSs.get(i).mproperty);
            map.put("msg", "[" + MessageUtils.getDateFormat(privateSMSs.get(i).cDate) + "]" + privateSMSs.get(i).body);
            myData.add(map);
        }
        // 生成适配器的Item和动态数组对应的元素
        mySimperAdapter = new SimpleAdapter(this, myData,// 数据源
                biz.AR.layout.private_smsrecover_activity_listview_item,// ListItem的XML实现
                // 动态数组与ImageItem对应的子项
                new String[] { "sms_id", "readFlag", "phone", "msg" },
                // ImageItem的XML文件里面的一个ImageView,两个TextView ID
                new int[] { biz.AR.id.private_smsrecover_listview_item_smsid_txt, biz.AR.id.private_smsrecover_listview_item_readflag_img, biz.AR.id.private_smsrecover_listview_item_phone_txt,
                        biz.AR.id.private_smsrecover_listview_item_msg_txt });
        // 添加并且显示
        lView.setAdapter(mySimperAdapter);
    }
    @Override
    protected Dialog onCreateDialog(int id) {
        AlertDialog dialog = null;
        switch (id) {
            case 1: {
                AlertDialog.Builder builder = new AlertDialog.Builder(this).setIcon(biz.AR.drawable.icon).setTitle("提示");
                builder.setMessage("你确认要恢复该短信到手机收件箱吗?").setCancelable(false).setPositiveButton("确定", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int id) {
                        DatabaseAdapter dAdapter = DatabaseAdapter.getInstance(Private_SMSRecover_Activity.this);
                        int count = lView.getChildCount();
                        for (int i = 0; i < count; i++) {
                            TextView v = (TextView) lView.getChildAt(i).findViewById(biz.AR.id.private_smsrecover_listview_item_smsid_txt);
                            CheckBox box = (CheckBox) lView.getChildAt(i).findViewById(biz.AR.id.private_smsrecover_listview_item_choice_cbox);
                            if (box.isChecked()) {
                                ////////////恢复短信到手机信箱
                                ContentValues cv = new ContentValues();
                                PrivateSMS one = privateSMSs.get(i);
                                cv.put("address", one.address);
                                cv.put("read", one.read ? 1 : 0);
                                cv.put("type", one.type ? 1 : 2);
                                cv.put("status", one.status);
                                cv.put("date", one.cDate);
                                cv.put("body", one.body);
                                getContentResolver().insert(Uri.parse("content://sms"), cv);
                                ////////////////
                                dAdapter.delPrivateSMS(Integer.parseInt(v.getText().toString()));
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
}
