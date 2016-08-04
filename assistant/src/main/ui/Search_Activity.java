package main.ui;
import java.util.ArrayList;
import java.util.HashMap;
import main.database.DBManager;
import net.workspace.util.Logger;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.TextView;

public class Search_Activity extends Activity {
    private SimpleAdapter simpleAdapter;
    private ArrayList<HashMap<String, Object>> myData;
    private ListView lView;
    private int[] Imgs = { biz.AR.drawable.search_gs, biz.AR.drawable.search_sh, biz.AR.drawable.search_yz, biz.AR.drawable.search_yy, biz.AR.drawable.search_kd, biz.AR.drawable.search_ts, biz.AR.drawable.search_hk,
            biz.AR.drawable.search_gx, biz.AR.drawable.search_it };
    public class refInfo {
        public int imgID;
        public String typeName;
        public int index;
    }
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.search_activity);
        LinearLayout main = (LinearLayout) findViewById(biz.AR.id.search_activity_layout);
        main.setBackgroundResource(Global_Var.mainBG_Imges[Global_Var.currMainBGIndex]);
        initListView();
        refreshData();
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) { // 按下的如果是BACK，同时没有重复
            System.gc();
            Search_Activity.this.finish();
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
                Search_Activity.this.finish();
            }
        });
        lView = (ListView) findViewById(biz.AR.id.search_listView);
        lView.setOnItemClickListener(new OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                //HashMap<String, Object> c = (HashMap<String, Object>) simpleAdapter.getItem(position);
                TextView vid = (TextView) view.findViewById(biz.AR.id.search_listview_id);
                Search_RefInfoDetail_Activity.index = Integer.parseInt(vid.getText().toString());
                vid = (TextView) view.findViewById(biz.AR.id.search_listview_txt);
                if (position == 0) {
                    Intent smsIntent = new Intent(Search_Activity.this, Search_Number_Activity.class);
                    startActivity(smsIntent);
                } else {
                    Search_RefInfoDetail_Activity.typeName = vid.getText().toString();
                    Intent smsIntent = new Intent(Search_Activity.this, Search_RefInfoDetail_Activity.class);
                    startActivity(smsIntent);
                }
                ////////////
            }
        });
    }
    private void refreshData() {
        if (myData != null) myData.clear();
        // 生成动态数组，加入数据
        try {
            DBManager dbManager = new DBManager(this);
            dbManager.openDatabase();
            ArrayList<String> refInfos = dbManager.GetRefInfo();
            myData = new ArrayList<HashMap<String, Object>>();
            HashMap<String, Object> map = new HashMap<String, Object>();
            map.put("index", 0);
            map.put("imgID", Imgs[0]);
            map.put("typeName", "归属地查询");
            myData.add(map);
            for (String one : refInfos) {
                String[] ss = one.split("@");
                int i = Integer.parseInt(ss[1].trim());
                map = new HashMap<String, Object>();
                map.put("index", i);
                map.put("imgID", Imgs[i]);
                map.put("typeName", ss[0]);
                myData.add(map);
            }
        } catch (Throwable e) {
            Logger.error(e);
        }
        simpleAdapter = new SimpleAdapter(this, myData,// 数据源
                biz.AR.layout.search_listview_item,// ListItem的XML实现
                // 动态数组与ImageItem对应的子项
                new String[] { "index", "imgID", "typeName" },
                // ImageItem的XML文件里面的一个ImageView,两个TextView ID
                new int[] { biz.AR.id.search_listview_id, biz.AR.id.search_listview_img, biz.AR.id.search_listview_txt });
        // 添加并且显示
        lView.setAdapter(simpleAdapter);
    }
}
