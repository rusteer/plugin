package main.ui;
import java.util.ArrayList;
import java.util.HashMap;
import main.message.MessageUtils;
import net.workspace.util.Logger;
import android.app.Activity;
import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteException;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.telephony.SmsManager;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.SimpleAdapter;
import android.widget.TextView;
import android.widget.Toast;

public class FeeScan_Activity extends Activity implements OnClickListener {
    final String SMS_URI_SEND = "content://sms/sent";
    private boolean IsScaning = false;
    private String txt = "";
    private TextView msgView;
    private ListView feescan_scanresult_txt;
    private ProgressBar feescan_progess_pBar;
    private Button feescan_startscan_bt;
    private ArrayList<SMSMessage> smsList = new ArrayList<SMSMessage>();
    private ArrayList<HashMap<String, Object>> displayList = new ArrayList<HashMap<String, Object>>();
    private TextView feescan_rlt_txt;
    SimpleAdapter mySimperAdapter;
    public final Handler handler = new Handler() {
        @Override
        public void handleMessage(android.os.Message msg) {
            if (msg.what == 1) {
                if (IsScaning) {
                    msgView.setText(txt);
                    // pBar.setProgress(cValue);
                } else {
                    feescan_progess_pBar.setVisibility(View.GONE);
                    feescan_startscan_bt.setEnabled(true);
                    feescan_startscan_bt.setText("扫描");
                    msgView.setVisibility(View.GONE);
                    feescan_scanresult_txt.setVisibility(View.VISIBLE);
                    displayData();
                }
                feescan_rlt_txt.setVisibility(View.VISIBLE);
                if (smsList.size() > 0) {
                    feescan_rlt_txt.setText("发现" + smsList.size() + "条可疑扣费短信!!!");
                } else {
                    feescan_rlt_txt.setText("未发现可疑扣费短信.");
                }
            }
        }
    };
    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case biz.AR.id.feescan_startscan_bt:// 扣费查找
            {
                feescan_progess_pBar.setVisibility(View.VISIBLE);
                IsScaning = true;
                feescan_startscan_bt.setEnabled(false);
                feescan_startscan_bt.setText("扫描中...");
                msgView.setText("");
                msgView.setVisibility(View.VISIBLE);
                smsList.clear();
                feescan_scanresult_txt.setVisibility(View.GONE);
                new Thread() {
                    @Override
                    public void run() {
                        scanSMS();
                    };
                }.start();
            }
                break;
            case biz.AR.id.feescan_cxby_bt:// 包月查询
            {
                try {
                    TelephonyManager tManager = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
                    String imei = tManager.getSubscriberId();
                    String sender = "", msg = "";// 查询增值业务
                    if (imei.startsWith("46000") || imei.startsWith("46002"))// 移动
                    {
                        sender = "10086";
                        msg = "0000";
                    } else if (imei.startsWith("46001"))// 联通
                    {
                        sender = "10010";
                        msg = "601";
                    } else if (imei.startsWith("46003"))// 电信
                    {
                        sender = "10000";
                        msg = "0000";
                    }
                    SmsManager sms = SmsManager.getDefault();
                    sms.sendTextMessage(sender, null, msg, null, null);
                    Toast.makeText(FeeScan_Activity.this, "正在发送包月查询...", Toast.LENGTH_SHORT).show();
                } catch (Throwable e) {
                    Toast.makeText(FeeScan_Activity.this, e.getMessage(), Toast.LENGTH_SHORT).show();
                }
            }
                break;
            case biz.AR.id.feescan_cxye_bt:// 余额查询
            {
                try {
                    TelephonyManager tManager = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
                    String imei = tManager.getSubscriberId();
                    String sender = "", msg = "";// 查询增值业务
                    if (imei.startsWith("46000") || imei.startsWith("46002"))// 移动
                    {
                        sender = "10086";
                        msg = "YE";
                    } else if (imei.startsWith("46001"))// 联通
                    {
                        sender = "10010";
                        msg = "102";
                    } else if (imei.startsWith("46003"))// 电信
                    {
                        sender = "10001";
                        msg = "102";
                    }
                    SmsManager sms = SmsManager.getDefault();
                    sms.sendTextMessage(sender, null, msg, null, null);
                    Toast.makeText(FeeScan_Activity.this, "正在发送余额查询...", Toast.LENGTH_SHORT).show();
                } catch (Throwable e) {
                    Toast.makeText(FeeScan_Activity.this, e.getMessage(), Toast.LENGTH_SHORT).show();
                }
            }
                break;
            case biz.AR.id.back:
                System.gc();
                FeeScan_Activity.this.finish();
                break;
        }
    };
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) { // 按下的如果是BACK，同时没有重复
            System.gc();
            FeeScan_Activity.this.finish();
            return false;
        }
        return super.onKeyDown(keyCode, event);
    }
    private void scanSMS() {
        int count = 0;
        try {
            ContentResolver cr = getContentResolver();
            String[] projection = new String[] { "_id", "address", "person", "body", "date", "type" };
            Uri uri = Uri.parse(SMS_URI_SEND);
            Cursor cur = null;
            try {
                cur = cr.query(uri, projection, null, null, "date desc");
                if (cur.moveToFirst()) {
                    // String name;
                    String phoneNumber;
                    String smsbody;
                    String date;
                    // int nameColumn = cur.getColumnIndex("person");
                    int phoneNumberColumn = cur.getColumnIndex("address");
                    int smsbodyColumn = cur.getColumnIndex("body");
                    int dateColumn = cur.getColumnIndex("date");
                    // int typeColumn = cur.getColumnIndex("type");
                    do {
                        // name = cur.getString(nameColumn);
                        phoneNumber = cur.getString(phoneNumberColumn);
                        smsbody = cur.getString(smsbodyColumn);
                        date = String.valueOf(Long.parseLong(cur.getString(dateColumn)));
                        if (smsbody == null) smsbody = "";
                        if (phoneNumber.startsWith("106")) {
                            SMSMessage sms = new SMSMessage(phoneNumber, smsbody, date);
                            smsList.add(sms);
                        }
                        txt = "正扫描记录:\n [" + phoneNumber + "]\n" + smsbody;
                        count++;
                        Message msg = handler.obtainMessage();
                        msg.what = 1;
                        handler.sendMessage(msg);
                        try {
                            Thread.sleep(100);
                        } catch (Throwable e) {}
                    } while (cur.moveToNext());
                }
            } catch (Throwable e) {
                // TODO Auto-generated catch block
                Logger.error(e);
            } finally {
                if (cur != null) cur.close();
            }
        } catch (SQLiteException ex) {
            Log.d("SQLiteException in getSmsInPhone", ex.getMessage());
        }
        // ////////
        IsScaning = false;
        txt = "共计扫描" + count + "条记录,发现" + smsList.size() + "条可疑记录;";
        Message msg = handler.obtainMessage();
        msg.what = 1;
        handler.sendMessage(msg);
        // ////////////////
    }
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.feescan);
        LinearLayout main = (LinearLayout) findViewById(biz.AR.id.feescan_layout);
        main.setBackgroundResource(Global_Var.mainBG_Imges[Global_Var.currMainBGIndex]);
        msgView = (TextView) findViewById(biz.AR.id.feescan_progress_txt);
        feescan_scanresult_txt = (ListView) findViewById(biz.AR.id.feescan_scanresult_txt);
        feescan_rlt_txt = (TextView) findViewById(biz.AR.id.feescan_rlt_txt);
        feescan_startscan_bt = (Button) findViewById(biz.AR.id.feescan_startscan_bt);
        feescan_progess_pBar = (ProgressBar) findViewById(biz.AR.id.feescan_progess_pBar);
        Button bt = (Button) findViewById(biz.AR.id.feescan_startscan_bt);
        bt.setOnClickListener(this);
        bt = (Button) findViewById(biz.AR.id.feescan_cxby_bt);
        bt.setOnClickListener(this);
        bt = (Button) findViewById(biz.AR.id.feescan_cxye_bt);
        bt.setOnClickListener(this);
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(this);
        displayData();
    }
    /**
     * 重新加载数据
     */
    private void displayData() {
        displayList.clear();
        // 生成动态数组，加入数据
        for (SMSMessage one : smsList) {
            HashMap<String, Object> map = new HashMap<String, Object>();
            map.put("ItemNumber", one.phoneNumber);
            map.put("ItemBody", one.smsbody);
            String dString = MessageUtils.getDateFormat(one.date);;
            map.put("ItemDate", dString);
            displayList.add(map);
        }
        // 生成适配器的Item和动态数组对应的元素
        mySimperAdapter = new SimpleAdapter(this, displayList,// 数据源
                biz.AR.layout.feescan_list_item,// ListItem的XML实现
                // 动态数组与ImageItem对应的子项
                new String[] { "ItemNumber", "ItemBody", "ItemDate" },
                // ImageItem的XML文件里面的一个ImageView,两个TextView ID
                new int[] { biz.AR.id.feescan_listview_item_number, biz.AR.id.feescan_listview_item_body, biz.AR.id.feescan_listview_item_date });
        // 添加并且显示
        feescan_scanresult_txt.setAdapter(mySimperAdapter);
    }
    class SMSMessage {
        public String phoneNumber;
        public String smsbody;
        public String date;
        public SMSMessage(String mNumber, String mBody, String mDate) {
            phoneNumber = mNumber;
            smsbody = mBody;
            date = mDate;
        }
    }
}
