package main.ui;
import java.util.ArrayList;
import java.util.HashMap;
import main.block.IPSetting;
import main.database.DatabaseAdapter;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.TextView;

public class IPSetting_Activity extends Activity {
    private ArrayList<IPSetting> IPSettings = new ArrayList<IPSetting>();
    private SimpleAdapter mySimperAdapter;
    private ArrayList<HashMap<String, Object>> myData = new ArrayList<HashMap<String, Object>>();;
    private ListView lView;
    private TextView ipsetting_total;
    private int selectedPosition = 0;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.ipsetting);
        LinearLayout main = (LinearLayout) findViewById(biz.AR.id.ipsetting_layout);
        main.setBackgroundResource(Global_Var.mainBG_Imges[Global_Var.currMainBGIndex]);
        initListView();
        refreshData();
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) { // 按下的如果是BACK，同时没有重复
            System.gc();
            IPSetting_Activity.this.finish();
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
                IPSetting_Activity.this.finish();
            }
        });
        ipsetting_total = (TextView) findViewById(biz.AR.id.ipsetting_total);
        lView = (ListView) findViewById(biz.AR.id.ipsetting_listView);
        lView.setOnItemClickListener(new OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                final View iView = view;
                selectedPosition = position;
                AlertDialog.Builder builder = new AlertDialog.Builder(IPSetting_Activity.this);
                builder.setTitle("操作选择");
                final String[] op = new String[3];
                if (IPSettings.get(position).IsUsed) op[0] = "禁用本IP配置";
                else op[0] = "启用本IP配置";
                op[1] = "编辑";
                op[2] = "删除";
                builder.setItems(op, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int which) {
                        switch (which) {
                            case 0: {
                                CheckBox box = (CheckBox) iView.findViewById(biz.AR.id.ipsetting_listitem_cbox);
                                box.setChecked(!IPSettings.get(selectedPosition).IsUsed);
                                IPSettings.get(selectedPosition).IsUsed = box.isChecked();
                                DatabaseAdapter d = DatabaseAdapter.getInstance(IPSetting_Activity.this);
                                d.UpdateIPSetting(IPSettings.get(selectedPosition).ID, IPSettings.get(selectedPosition).IsUsed);
                                IPSettings.clear();
                                IPSettings = d.readIPSetting(false);
                            }
                                break;
                            case 1:// "编辑";
                            {
                                IPSetting_Edit_Activity.ipSetting = IPSettings.get(selectedPosition);
                                Intent i = new Intent(IPSetting_Activity.this, IPSetting_Edit_Activity.class);
                                startActivity(i);
                            }
                                break;
                            case 2:// "删除";
                            {
                                AlertDialog.Builder builder1 = new AlertDialog.Builder(IPSetting_Activity.this).setIcon(biz.AR.drawable.icon).setTitle("提示");
                                builder1.setMessage("你确认要删除该IP配置吗?").setCancelable(false).setPositiveButton("确定", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int id) {
                                        DatabaseAdapter d = DatabaseAdapter.getInstance(IPSetting_Activity.this);
                                        d.delOneIPSetting(IPSettings.get(selectedPosition).ID);
                                        refreshData();
                                    }
                                }).setNegativeButton("取消", null);
                                AlertDialog alert = builder1.create();
                                alert.show();
                            }
                                break;
                        }
                    }
                });
                builder.create();
                builder.show();
            }
            /////////////////////
        });
        findViewById(biz.AR.id.ipsetting_add).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                IPSetting_Edit_Activity.ipSetting = null;
                Intent i = new Intent(IPSetting_Activity.this, IPSetting_Edit_Activity.class);
                startActivity(i);
            }
        });
    }
    private void refreshData() {
        DatabaseAdapter da = DatabaseAdapter.getInstance(this);
        IPSettings.clear();
        IPSettings = da.readIPSetting(false);
        ipsetting_total.setText("您有" + IPSettings.size() + "条IP设置信息");
        myData.clear();
        // 生成动态数组，加入数据
        for (int i = 0; i < IPSettings.size(); i++) {
            HashMap<String, Object> map = new HashMap<String, Object>();
            map.put("niceName", IPSettings.get(i).niceName);
            map.put("IP", "IP前缀码:" + IPSettings.get(i).IPnumber);
            map.put("isused", IPSettings.get(i).IsUsed);
            myData.add(map);
        }
        // 生成适配器的Item和动态数组对应的元素
        mySimperAdapter = new SimpleAdapter(this, myData,// 数据源
                biz.AR.layout.ipsetting_listitem,// ListItem的XML实现
                // 动态数组与ImageItem对应的子项
                new String[] { "niceName", "IP", "isused" },
                // ImageItem的XML文件里面的一个ImageView,两个TextView ID
                new int[] { biz.AR.id.ipsetting_listitem_name_txt, biz.AR.id.ipsetting_listitem_IPnumber_txt, biz.AR.id.ipsetting_listitem_cbox });
        // 添加并且显示
        lView.setAdapter(mySimperAdapter);
    }
    @Override
    protected void onRestart() {
        refreshData();
        super.onRestart();
    }
}
