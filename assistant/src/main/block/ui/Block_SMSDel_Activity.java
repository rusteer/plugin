package main.block.ui;
import java.util.ArrayList;
import java.util.HashMap;
import main.block.BlockSMS;
import main.database.DatabaseAdapter;
import main.message.MessageUtils;
import main.ui.Global_Var;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.TextView;

public class Block_SMSDel_Activity extends Activity implements OnClickListener {
    private ArrayList<BlockSMS> blockSMSs;
    private SimpleAdapter mySimperAdapter;
    private ArrayList<HashMap<String, Object>> myData;
    private ListView lView;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.block_smsdel_activity);
        LinearLayout main = (LinearLayout) findViewById(biz.AR.id.block_smsdel_layout);
        main.setBackgroundResource(Global_Var.mainBG_Imges[Global_Var.currMainBGIndex]);
        lView = (ListView) findViewById(biz.AR.id.block_smsdel_listView);
        refreshData();
        setclick();
    }
    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case biz.AR.id.block_smsdel_del_totrash_btn: {
                DatabaseAdapter dAdapter = DatabaseAdapter.getInstance(Block_SMSDel_Activity.this);
                int count = lView.getChildCount();
                for (int i = 0; i < count; i++) {
                    TextView vv = (TextView) lView.getChildAt(i).findViewById(biz.AR.id.block_smsdel_listview_item_smsid_txt);
                    CheckBox box = (CheckBox) lView.getChildAt(i).findViewById(biz.AR.id.block_smsdel_listview_item_choice_cbox);
                    if (box.isChecked()) {
                        dAdapter.moveBlockSMS_toTrash(Integer.parseInt(vv.getText().toString()));
                    }
                }
                refreshData();
                mySimperAdapter.notifyDataSetChanged();
            }
                break;
            case biz.AR.id.block_smsdel_del_btn:
                showDialog(1);
                break;
            case biz.AR.id.block_smsdel_all_btn: {
                Button button = (Button) findViewById(biz.AR.id.block_smsdel_all_btn);
                if (button.getText().toString().equals("全选")) {
                    int count = lView.getChildCount();
                    for (int i = 0; i < count; i++) {
                        CheckBox box = (CheckBox) lView.getChildAt(i).findViewById(biz.AR.id.block_smsdel_listview_item_choice_cbox);
                        box.setChecked(true);
                    }
                    button.setText("取消全选");
                } else {
                    int count = lView.getChildCount();
                    for (int i = 0; i < count; i++) {
                        CheckBox box = (CheckBox) lView.getChildAt(i).findViewById(biz.AR.id.block_smsdel_listview_item_choice_cbox);
                        box.setChecked(false);
                    }
                    button.setText("全选");
                }
            }
                break;
            case biz.AR.id.block_smsdel_exit_btn:
                System.gc();
                Block_SMSDel_Activity.this.finish();
                break;
            case biz.AR.id.back:
                System.gc();
                Block_SMSDel_Activity.this.finish();
                break;
        }
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) { // 按下的如果是BACK，同时没有重复
            System.gc();
            Block_SMSDel_Activity.this.finish();
            return false;
        }
        return super.onKeyDown(keyCode, event);
    }
    private void setclick() {
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(this);
        Button bt = (Button) findViewById(biz.AR.id.block_smsdel_del_totrash_btn);
        bt.setOnClickListener(this);
        bt = (Button) findViewById(biz.AR.id.block_smsdel_del_btn);
        bt.setOnClickListener(this);
        bt = (Button) findViewById(biz.AR.id.block_smsdel_all_btn);
        bt.setOnClickListener(this);
        bt = (Button) findViewById(biz.AR.id.block_smsdel_exit_btn);
        bt.setOnClickListener(this);
    }
    private void refreshData() {
        DatabaseAdapter da = DatabaseAdapter.getInstance(this);
        if (blockSMSs != null) blockSMSs.clear();
        blockSMSs = da.readBlockSMSs();
        if (myData != null) myData.clear();
        // 生成动态数组，加入数据
        myData = new ArrayList<HashMap<String, Object>>();
        for (int i = 0; i < blockSMSs.size(); i++) {
            HashMap<String, Object> map = new HashMap<String, Object>();
            if (blockSMSs.get(i).read) map.put("readFlag", biz.AR.drawable.smsread);
            else map.put("readFlag", biz.AR.drawable.smsunread);
            map.put("sms_id", blockSMSs.get(i).id);
            map.put("phone", blockSMSs.get(i).address + " " + blockSMSs.get(i).mproperty);
            map.put("msg", "[" + MessageUtils.getDateFormat(blockSMSs.get(i).cDate) + "]" + blockSMSs.get(i).body);
            myData.add(map);
        }
        // 生成适配器的Item和动态数组对应的元素
        mySimperAdapter = new SimpleAdapter(this, myData,// 数据源
                biz.AR.layout.block_smsdel_activity_listview_item,// ListItem的XML实现
                // 动态数组与ImageItem对应的子项
                new String[] { "sms_id", "readFlag", "phone", "msg" },
                // ImageItem的XML文件里面的一个ImageView,两个TextView ID
                new int[] { biz.AR.id.block_smsdel_listview_item_smsid_txt, biz.AR.id.block_smsdel_listview_item_readflag_img, biz.AR.id.block_smsdel_listview_item_phone_txt, biz.AR.id.block_smsdel_listview_item_msg_txt });
        // 添加并且显示
        lView.setAdapter(mySimperAdapter);
    }
    @Override
    protected Dialog onCreateDialog(int id) {
        AlertDialog dialog = null;
        switch (id) {
            case 1: {
                AlertDialog.Builder builder = new AlertDialog.Builder(this).setIcon(biz.AR.drawable.icon).setTitle("提示");
                builder.setMessage("你确认要删除选择的短信吗?").setCancelable(false).setPositiveButton("确定", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int id) {
                        DatabaseAdapter dAdapter = DatabaseAdapter.getInstance(Block_SMSDel_Activity.this);
                        int count = lView.getChildCount();
                        for (int i = 0; i < count; i++) {
                            TextView v = (TextView) lView.getChildAt(i).findViewById(biz.AR.id.block_smsdel_listview_item_smsid_txt);
                            CheckBox box = (CheckBox) lView.getChildAt(i).findViewById(biz.AR.id.block_smsdel_listview_item_choice_cbox);
                            if (box.isChecked()) {
                                dAdapter.delBlockSMS(Integer.parseInt(v.getText().toString()));
                            }
                        }
                        refreshData();
                        mySimperAdapter.notifyDataSetChanged();
                    }
                }).setNegativeButton("取消", null);
                dialog = builder.create();
            }
                break;
        }
        return dialog;
    }
}
