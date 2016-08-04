package main.ui;
import java.util.ArrayList;
import java.util.HashMap;
import main.database.DatabaseAdapter;
import main.message.MessageUtils;
import net.workspace.util.Logger;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.database.Cursor;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.text.Html;
import android.text.Html.ImageGetter;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.RadioButton;
import android.widget.TextView;

public class SMSDel_Activity extends Activity implements OnClickListener {
    class SMSSession {
        public long threadID;
        public long id;
        public String pNumber;
        public String mProperty;
        public String person;
        public String msg;
        public long date;
        public int readFlag;
        public boolean Inbox;
        public int count;
    }
    private ArrayList<SMSSession> bboxSMSList = new ArrayList<SMSSession>();
    private BaseAdapter mySimperAdapter;
    private ArrayList<HashMap<String, Object>> myData = new ArrayList<HashMap<String, Object>>();
    private ListView lView;
    public static ProgressDialog m_Dialog;
    private boolean isSelectAll = false;
    /**
     * 处理自定义的消息
     */
    public static MyHandler handler = null;
    public class MyHandler extends Handler {
        public MyHandler(Looper looper) {
            super(looper);
        }
        @Override
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 1: {
                    if (m_Dialog != null && m_Dialog.isShowing() && !isFinishing()) m_Dialog.dismiss();
                    displayData();
                    break;
                }
                case 2: {
                    mySimperAdapter.notifyDataSetChanged();
                    break;
                }
                case 3: {
                    int count = myData.size();
                    for (int i = 0; i < count; i++) {
                        if (Integer.parseInt(String.valueOf(myData.get(i).get("isselect"))) == 1) {
                            // //////////////////////////
                            long threadId = Long.parseLong(String.valueOf(myData.get(i).get("threadID")));
                            SMSSession one = new SMSSession();
                            for (SMSSession the : bboxSMSList) {
                                if (the.threadID == threadId) {
                                    one = the;
                                    break;
                                }
                            }
                            DatabaseAdapter d = DatabaseAdapter.getInstance(SMSDel_Activity.this);
                            Cursor cursor = null;
                            try {
                                cursor = getContentResolver().query(Uri.parse("content://sms/"), new String[] { "read", "date", "body", "type", "status" }, " thread_id=? and (type=1 or type=2)", new String[] { one.threadID + "" }, "date");
                                while (cursor != null && cursor.moveToNext()) {
                                    d.addNewSMS2Trash(one.pNumber, one.person, cursor.getString(2), cursor.getInt(0), cursor.getString(1), cursor.getInt(3), cursor.getInt(4));
                                }
                            } catch (Throwable e) {
                                // TODO Auto-generated catch block
                                Logger.error(e);
                            } finally {
                                if (cursor != null) cursor.close();
                            }
                            getContentResolver().delete(Uri.parse("content://sms/conversations/" + one.threadID), null, null);
                            // ///////////////////////////
                        }
                    }
                    refreshData();
                }
            }
        }
    }
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.smsdel_activity);
        LinearLayout main = (LinearLayout) findViewById(biz.AR.id.smsdel_activity_layout);
        main.setBackgroundResource(Global_Var.mainBG_Imges[Global_Var.currMainBGIndex]);
        handler = new MyHandler(Looper.getMainLooper());
        lView = (ListView) findViewById(biz.AR.id.smsdel_listView);
        setclick();
        refreshData();
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) { // 按下的如果是BACK，同时没有重复
            System.gc();
            SMSDel_Activity.this.finish();
            return false;
        }
        return super.onKeyDown(keyCode, event);
    }
    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case biz.AR.id.smsdel_del_totrash_btn:// 删除到回收站
            {
                handler.sendEmptyMessage(3);
            }
                break;
            case biz.AR.id.smsdel_del_btn:
                showDialog(1);
                break;
            case biz.AR.id.smsdel_all_btn: {
                Button button = (Button) findViewById(biz.AR.id.smsdel_all_btn);
                if (button.getText().toString().equals("全选")) {
                    button.setText("取消全选");
                    isSelectAll = false;
                } else {
                    button.setText("全选");
                    isSelectAll = true;
                }
                choolseAll();
            }
                break;
            case biz.AR.id.smsdel_exit_btn:
                System.gc();
                SMSDel_Activity.this.finish();
                break;
            case biz.AR.id.back:
                System.gc();
                SMSDel_Activity.this.finish();
                break;
        }
    }
    private void setclick() {
        Button bt = (Button) findViewById(biz.AR.id.smsdel_del_totrash_btn);
        bt.setOnClickListener(this);
        bt = (Button) findViewById(biz.AR.id.smsdel_del_btn);
        bt.setOnClickListener(this);
        bt = (Button) findViewById(biz.AR.id.smsdel_all_btn);
        bt.setOnClickListener(this);
        bt = (Button) findViewById(biz.AR.id.smsdel_exit_btn);
        bt.setOnClickListener(this);
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(this);
    }
    /**
     * 读取手机短消箱的消息、在联系人中读取号码联系人名称
     * 
     */
    private void readSMS() {
        bboxSMSList.clear();
        /*
         * Cursor
         * cursor=getContentResolver().query(Uri.parse("content://sms/inbox"), new
         * String[]{"count(*) as count"}, null, null, null);
         * if(cursor.moveToNext())InBoxSmsCount=cursor.getInt(0); cursor.close();
         * cursor=getContentResolver().query(Uri.parse("content://sms/sent"), new
         * String[]{"count(*) as count"}, null, null, null);
         * if(cursor.moveToNext())SentSmsCount=cursor.getInt(0); cursor.close();
         */
        Cursor cursor = null;
        try {
            cursor = getContentResolver().query(Uri.parse("content://sms/"), new String[] { "thread_id, count(*) as count" }, "1=1 ) group by (thread_id", null, null);
            while (cursor != null && cursor.moveToNext()) {
                SMSSession one = new SMSSession();
                one.threadID = cursor.getLong(0);
                one.count = cursor.getInt(1);
                one.mProperty = "";
                one.person = "";
                bboxSMSList.add(one);
            }
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        } finally {
            if (cursor != null) cursor.close();
        }
        if (bboxSMSList.size() == 0) return;
        long threadid;
        boolean isExistData = false;
        // //////////读信箱
        // cursor = managedQuery(Uri.parse("content://sms/"), new String[] { "_id",
        // "thread_id", "address", "read",
        // "person", "date", "body","type" }, "thread_id>"+curMaxThreadID+")", null,
        // "thread_id,date");
        try {
            cursor = getContentResolver().query(Uri.parse("content://sms/"), new String[] { "_id", "thread_id", "address", "read", "person", "date", "body", "type" }, null, null, "thread_id,date");
            while (cursor != null && cursor.moveToNext()) {
                threadid = cursor.getLong(1);
                for (SMSSession one : bboxSMSList) {
                    if (one.threadID == threadid) {
                        one.id = cursor.getLong(0);
                        one.pNumber = cursor.getString(2);
                        if (one.pNumber != null) {
                            if (one.pNumber.indexOf("86") == 0) one.pNumber = one.pNumber.substring(2);
                            if (one.pNumber.indexOf("+86") == 0) one.pNumber = one.pNumber.substring(3);
                        }
                        one.readFlag = cursor.getInt(3);
                        // one.person = cursor.getString(4);
                        one.date = cursor.getLong(5);
                        one.msg = cursor.getString(6);
                        one.Inbox = cursor.getInt(7) == 1 ? true : false;
                        isExistData = true;
                    }
                }
            }
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        } finally {
            if (cursor != null) cursor.close();
        }
        if (!isExistData) {
            bboxSMSList.clear();
            return;
        }
        StringBuffer niceName = new StringBuffer();
        for (SMSSession one : bboxSMSList) {
            if (one.person.equals("") && one.pNumber != null && !one.pNumber.equals("")) {
                DatabaseAdapter da = DatabaseAdapter.getInstance(this);
                if (da.searchContact(one.pNumber, niceName)) one.person = niceName.toString();
            }
        }
    }
    /**
     * 刷新数据
     * 
     * @return
     */
    private void refreshData() {
        if ((m_Dialog == null || !m_Dialog.isShowing()) && !isFinishing()) m_Dialog = ProgressDialog.show(this, "请等待...", "正在动态加载数据，请稍后...", true);
        new Thread(new Runnable() {
            @Override
            public void run() {
                readSMS();
                handler.sendEmptyMessage(1);
            }
        }).start();
    }
    private void displayData() {
        try {
            myData.clear();
            // 生成动态数组，加入数据
            myData = new ArrayList<HashMap<String, Object>>();
            for (SMSSession one : bboxSMSList) {
                HashMap<String, Object> map = new HashMap<String, Object>();
                if (one.readFlag == 1) map.put("readFlag", biz.AR.drawable.smsread);
                else map.put("readFlag", biz.AR.drawable.smsunread);
                map.put("threadID", one.threadID);
                map.put("phone", one.person + one.pNumber + "(" + one.count + ")");
                map.put("msg", one.msg);
                map.put("isselect", 0);
                myData.add(map);
            }
            // 生成适配器的Item和动态数组对应的元素
            // 生成适配器的Item和动态数组对应的元素
            mySimperAdapter = new InboxAdapter(SMSDel_Activity.this);
            // 添加并且显示
            lView.setAdapter(mySimperAdapter);
            lView.setOnItemClickListener(deleteListOnItemClickListener);
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        }
    }
    @Override
    protected Dialog onCreateDialog(int id) {
        AlertDialog dialog = null;
        switch (id) {
            case 1: {
                AlertDialog.Builder builder = new AlertDialog.Builder(this).setIcon(biz.AR.drawable.icon).setTitle("提示");
                builder.setMessage("你确认要删除选择的会话短信吗?").setCancelable(false).setPositiveButton("确定", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int id) {
                        int count = myData.size();
                        for (int i = 0; i < count; i++) {
                            if (Integer.parseInt(String.valueOf(myData.get(i).get("isselect"))) == 1) {
                                SMSDel_Activity.this.getContentResolver().delete(Uri.parse("content://sms/conversations/" + Long.parseLong(String.valueOf(myData.get(i).get("threadID")))), null, null);
                            }
                        }
                        refreshData();
                    }
                }).setNegativeButton("取消", null);
                dialog = builder.create();
            }
                break;
        }
        return dialog;
    }
    @Override
    protected void onRestart() {
        refreshData();
        super.onRestart();
    }
    /**
     * 全选与不选实现
     */
    private void choolseAll() {
        if (isSelectAll) {
            chooseNoAll();
        } else {
            for (HashMap<String, Object> appinfo : myData) {
                appinfo.put("isselect", 1);
            }
            //全选
            isSelectAll = true;
        }
        handler.sendEmptyMessage(2);
    }
    private void chooseNoAll() {
        //全不选
        for (HashMap<String, Object> appinfo : myData) {
            appinfo.put("isselect", 0);
        }
        isSelectAll = false;
    }
    class InboxAdapter extends BaseAdapter {
        Context mcontext;
        public InboxAdapter(Context context) {
            mcontext = context;
        }
        @Override
        public int getCount() {
            return myData.size();
        }
        @Override
        public Object getItem(int position) {
            return myData.get(position);
        }
        @Override
        public long getItemId(int position) {
            return 0;
        }
        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            /**
             * 有时出现超出索引的错误，在此添加判断 修改人：唐晓泽 修改日期：2012/04/13
             */
            if (getCount() <= position) return null;
            InboxVuewHolder holder;
            if (convertView == null) {
                final LayoutInflater mInflater = (LayoutInflater) mcontext.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                convertView = mInflater.inflate(biz.AR.layout.smsdel_activity_listview_item, parent, false);
                holder = new InboxVuewHolder();
                holder.threadId = (TextView) convertView.findViewById(biz.AR.id.smsdel_listview_item_smsid_txt);
                holder.img = (ImageView) convertView.findViewById(biz.AR.id.smsdel_listview_item_readflag_img);
                holder.phone = (TextView) convertView.findViewById(biz.AR.id.smsdel_listview_item_phone_txt);
                holder.msg = (TextView) convertView.findViewById(biz.AR.id.smsdel_listview_item_msg_txt);
                holder.cbox = (RadioButton) convertView.findViewById(biz.AR.id.smsdel_listview_item_choice_cbox);
                convertView.setTag(holder);
            } else {
                holder = (InboxVuewHolder) convertView.getTag();
            }
            holder.threadId.setText(String.valueOf(myData.get(position).get("ThreadID")));
            holder.img.setImageResource(Integer.parseInt(String.valueOf(myData.get(position).get("readFlag"))));
            holder.phone.setText(String.valueOf(myData.get(position).get("phone")));
            holder.msg.setText(Html.fromHtml(MessageUtils.explain(String.valueOf(myData.get(position).get("msg"))), imageGetter, null));
            if (isSelectAll) holder.cbox.setChecked(true);
            else {
                if (Integer.parseInt(String.valueOf(myData.get(position).get("isselect"))) == 0) {
                    holder.cbox.setChecked(false);
                } else {
                    holder.cbox.setChecked(true);
                }
            }
            return convertView;
        }
    }
    static class InboxVuewHolder {
        private TextView threadId;
        private ImageView img;
        private TextView phone;
        private TextView msg;
        private RadioButton cbox;
    }
    /**
     * 软件列表点击事件
     */
    private OnItemClickListener deleteListOnItemClickListener = new OnItemClickListener() {
        @Override
        public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
            // TODO Auto-generated method stub  convertView
            LinearLayout list_item_layout = (LinearLayout) view;
            RadioButton radioButton = (RadioButton) ((LinearLayout) list_item_layout.getChildAt(3)).getChildAt(0);
            boolean check = Integer.parseInt(String.valueOf(myData.get(position).get("isselect"))) == 0 ? false : true;
            if (check) {
                radioButton.setChecked(false);
                myData.get(position).put("isselect", 0);
            } else {
                radioButton.setChecked(true);
                myData.get(position).put("isselect", 1);
            }
            isSelectAll = false;
            Button button = (Button) findViewById(biz.AR.id.smsdel_all_btn);
            button.setText("全选");
        }
    };
    ImageGetter imageGetter = new ImageGetter() {
        @Override
        public Drawable getDrawable(String source) {
            int id = Integer.parseInt(source);
            //根据id从资源文件中获取图片对象
            Drawable d = getResources().getDrawable(id);
            d.setBounds(0, 0, d.getIntrinsicWidth(), d.getIntrinsicHeight());
            return d;
        }
    };
    @Override
    protected void onPause() {
        if (m_Dialog != null && m_Dialog.isShowing() && !isFinishing()) {
            m_Dialog.dismiss();
        }
        super.onPause();
    }
}
