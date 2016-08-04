package main.backup.ui;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import main.backup.SMSBackup;
import main.backup.SmsField;
import main.block.NormalContacts;
import main.callphone.ContactManager;
import main.message.MessageUtils;
import net.workspace.util.Logger;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
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
import android.widget.ListView;
import android.widget.RadioButton;
import android.widget.TextView;

public class SMS_Recover_Activity extends Activity {
    private ImageView sms_selsctall;
    private Button backup_text;
    private ListView lView;
    private static ProgressDialog m_Dialog;
    private boolean isAllSelect = false;
    ArrayList<SmsField> smslist;
    private BaseAdapter mySimperAdapter;
    private Map<String, NormalContacts> contactMap;//通讯录数据
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.sms_recover_activity);
        initview();
        refreshData();
    }
    private void initview() {
        ClickListener mClickListener = new ClickListener();
        sms_selsctall = (ImageView) findViewById(biz.AR.id.sms_selsctall);
        sms_selsctall.setOnClickListener(mClickListener);
        TextView sms_selectall_text = (TextView) findViewById(biz.AR.id.sms_selectall_text);
        sms_selectall_text.setOnClickListener(mClickListener);
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(mClickListener);
        backup_text = (Button) findViewById(biz.AR.id.backup_text);
        backup_text.setOnClickListener(mClickListener);
        lView = (ListView) findViewById(biz.AR.id.sms_listView);
        lView.setOnItemClickListener(new OnItemClickListener() {
            //添加联络人点击事件
            @Override
            public void onItemClick(AdapterView<?> arg0, View arg1, int arg2, long arg3) {
                int item = Integer.parseInt(String.valueOf(arg1.getId()));
                RadioButton message_checkbox = (RadioButton) arg1.findViewById(biz.AR.id.sms_listview_item_choice_cbox);
                if (!message_checkbox.isChecked()) {
                    message_checkbox.setChecked(true);
                    smslist.get(item).setSelect(true);
                    backup_text.setEnabled(true);
                    backup_text.setTextColor(getResources().getColor(biz.AR.color.black));
                } else {
                    message_checkbox.setChecked(false);
                    smslist.get(item).setSelect(false);
                    if (isAllSelect) {
                        isAllSelect = false;
                        sms_selsctall.setBackgroundResource(biz.AR.drawable.phone_no_selected);
                    }
                    canBackup();
                }
            }
        });
        smslist = new ArrayList<SmsField>();
        mySimperAdapter = new InboxAdapter(SMS_Recover_Activity.this);
        // 添加并且显示
        lView.setAdapter(mySimperAdapter);
    }
    private void refreshData() {
        new TaskAsyncTask().execute();
    }
    public class TaskAsyncTask extends AsyncTask<Void, Void, Void> {
        @Override
        protected void onPreExecute() {
            if ((m_Dialog == null || !m_Dialog.isShowing()) && !isFinishing()) m_Dialog = ProgressDialog.show(SMS_Recover_Activity.this, "请等待...", "正在动态加载数据，请稍后...", true);
        }
        // 处理后台执行的任务，在后台线程执行
        @Override
        protected Void doInBackground(Void... arg0) {
            Cursor cur = null;
            try {
                //初始化联系人
                contactMap = new HashMap<String, NormalContacts>();
                List<NormalContacts> contactList = ContactManager.getInstance(SMS_Recover_Activity.this).getList();
                for (NormalContacts contact : contactList) {
                    contactMap.put(contact.pNumber.trim(), contact);
                }
                contactList.clear();
                //初始化短信信息
                smslist.clear();
                SMSBackup backup = new SMSBackup();
                smslist = backup.getSMSList();
            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                if (cur != null) cur.close();
            }
            return null;
        }
        // 后台任务执行完之后被调用，在ui线程执行
        @Override
        protected void onPostExecute(Void result) {
            mySimperAdapter.notifyDataSetChanged();
            backup_text.setEnabled(false);
            if (m_Dialog != null && m_Dialog.isShowing() && !isFinishing()) m_Dialog.dismiss();
            super.onPostExecute(result);
        }
    };
    public class BackUpAsyncTask extends AsyncTask<Void, Void, Void> {
        @Override
        protected void onPreExecute() {
            backup_text.setEnabled(false);
            if ((m_Dialog == null || !m_Dialog.isShowing()) && !isFinishing()) m_Dialog = ProgressDialog.show(SMS_Recover_Activity.this, "请等待...", "正在恢复数据中，请稍等...", true);
        }
        // 处理后台执行的任务，在后台线程执行
        @Override
        protected Void doInBackground(Void... arg0) {
            try {
                for (SmsField smsField : smslist) {
                    if (smsField.isSelect()) {
                        Cursor cursor = null;
                        try {
                            cursor = getContentResolver().query(Uri.parse("content://sms"), new String[] { "date" }, "date=?", new String[] { smsField.date }, null);
                            if (!cursor.moveToFirst()) {// 没有该条短信
                                ContentValues values = new ContentValues();
                                values.put("address", smsField.address);
                                values.put("date", smsField.date);
                                values.put("read", smsField.read);
                                values.put("status", smsField.status);
                                values.put("type", smsField.type);
                                values.put("body", smsField.body);
                                getContentResolver().insert(Uri.parse("content://sms"), values);
                            }
                        } catch (Throwable e) {
                            // TODO Auto-generated catch block
                            Logger.error(e);
                        } finally {
                            if (cursor != null) cursor.close();
                        }
                    }
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            return null;
        }
        // 后台任务执行完之后被调用，在ui线程执行
        @Override
        protected void onPostExecute(Void result) {
            mySimperAdapter.notifyDataSetChanged();
            backup_text.setEnabled(true);
            if (m_Dialog != null && m_Dialog.isShowing() && !isFinishing()) m_Dialog.dismiss();
            super.onPostExecute(result);
        }
    };
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) { // 按下的如果是BACK，同时没有重复
            Intent intent = new Intent();
            setResult(RESULT_OK, intent);
            System.gc();
            SMS_Recover_Activity.this.finish();
            return false;
        }
        return super.onKeyDown(keyCode, event);
    }
    @Override
    protected void onPause() {
        if (m_Dialog != null && m_Dialog.isShowing() && !isFinishing()) {
            m_Dialog.dismiss();
        }
        super.onPause();
    }
    /**
    * 将界面所有控件监听器集中到一起：1、减少内存提高性能（每new一个内部类占1～8k内存）2、方便管理
    * 
    * @author wf
    * 
    */
    class ClickListener implements OnClickListener {
        @Override
        public void onClick(View v) {
            switch (v.getId()) {
                case biz.AR.id.sms_selsctall:// 选择全部
                {
                    setSelect();
                }
                    break;
                case biz.AR.id.sms_selectall_text:// 选择全部
                {
                    setSelect();
                }
                    break;
                case biz.AR.id.back://返回键
                {
                    Intent intent = new Intent();
                    setResult(RESULT_OK, intent);
                    System.gc();
                    finish();
                }
                    break;
                case biz.AR.id.backup_text://开始备份
                {
                    new BackUpAsyncTask().execute();
                }
                    break;
            }
        }
    }
    private void setSelect() {
        if (isAllSelect) {
            isAllSelect = false;
            sms_selsctall.setBackgroundResource(biz.AR.drawable.phone_no_selected);
            for (SmsField sms : smslist) {
                sms.setSelect(false);
            }
            backup_text.setEnabled(false);
            backup_text.setTextColor(getResources().getColor(biz.AR.color.txt_status_gray));
        } else {
            isAllSelect = true;
            sms_selsctall.setBackgroundResource(biz.AR.drawable.phone_selected);
            for (SmsField sms : smslist) {
                sms.setSelect(true);
            }
            if (smslist.size() > 0) {
                backup_text.setTextColor(getResources().getColor(biz.AR.color.black));
                backup_text.setEnabled(true);
            } else {
                backup_text.setTextColor(getResources().getColor(biz.AR.color.txt_status_gray));
                backup_text.setEnabled(false);
            }
        }
        mySimperAdapter.notifyDataSetChanged();
    }
    class InboxAdapter extends BaseAdapter {
        Context mcontext;
        public InboxAdapter(Context context) {
            mcontext = context;
        }
        @Override
        public int getCount() {
            return smslist.size();
        }
        @Override
        public Object getItem(int position) {
            return smslist.get(position);
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
            try {
                InboxVuewHolder holder;
                if (convertView == null) {
                    final LayoutInflater mInflater = (LayoutInflater) mcontext.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                    convertView = mInflater.inflate(biz.AR.layout.sms_backup_item, parent, false);
                    holder = new InboxVuewHolder();
                    holder.img = (ImageView) convertView.findViewById(biz.AR.id.sms_listview_item_readflag_img);
                    holder.phone = (TextView) convertView.findViewById(biz.AR.id.sms_listview_item_phone_txt);
                    holder.msg = (TextView) convertView.findViewById(biz.AR.id.sms_listview_item_msg_txt);
                    holder.cbox = (RadioButton) convertView.findViewById(biz.AR.id.sms_listview_item_choice_cbox);
                    convertView.setTag(holder);
                    convertView.setId(position);
                } else {
                    holder = (InboxVuewHolder) convertView.getTag();
                }
                holder.img.setImageResource(getImageRes(smslist.get(position).read));
                String address = smslist.get(position).address.trim();
                holder.phone.setText(address);
                if (address.length() > 0 && contactMap.containsKey(address)) {
                    String name = contactMap.get(address).niceName;
                    if (name != null && name.length() > 0) {
                        holder.phone.setText(name + "(" + address + ")");
                    }
                }
                holder.msg.setText(Html.fromHtml(MessageUtils.explain(smslist.get(position).body), imageGetter, null));
                if (isAllSelect) holder.cbox.setChecked(true);
                else {
                    if (smslist.get(position).isSelect()) {
                        holder.cbox.setChecked(true);
                    } else {
                        holder.cbox.setChecked(false);
                    }
                }
            } catch (Throwable e) {
                // TODO Auto-generated catch block
                Logger.error(e);
            }
            return convertView;
        }
        private int getImageRes(String readFlag) {
            try {
                int read = Integer.parseInt(readFlag);
                if (read == 1) return biz.AR.drawable.smsread;
                else return biz.AR.drawable.smsunread;
            } catch (NumberFormatException e) {
                // TODO Auto-generated catch block
                Logger.error(e);
            }
            return biz.AR.drawable.smsunread;
        }
    }
    static class InboxVuewHolder {
        private ImageView img;
        private TextView phone;
        private TextView msg;
        private RadioButton cbox;
    }
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
    private void canBackup() {
        boolean can = false;
        for (SmsField sms : smslist) {
            if (sms.isSelect()) {
                can = true;
                break;
            }
        }
        if (can) {
            backup_text.setEnabled(true);
            backup_text.setTextColor(getResources().getColor(biz.AR.color.black));
        } else {
            backup_text.setEnabled(false);
            backup_text.setTextColor(getResources().getColor(biz.AR.color.txt_status_gray));
        }
    }
}
