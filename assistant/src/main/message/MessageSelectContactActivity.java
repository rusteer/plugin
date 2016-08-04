package main.message;
import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.List;
import main.block.NormalContacts;
import main.callphone.ContactManager;
import main.callphone.ConvertPinYinUtil;
import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

public class MessageSelectContactActivity extends Activity {
    private Button searchbutton;
    private EditText search;
    private Button submit;
    private Button cancel;
    private List<NormalContacts> contactList;//通讯录数据
    private List<NormalContacts> displayList;//显示的通讯录数据
    private ListView content_address_list;//通讯录列表
    private SendMessageClickListener sendMessageClickListener;
    PhoneListAdapter adapter;
    private List<String> selectContact;
    private boolean isAllSelect = false;
    private ImageView message_checkall;
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        contactList = new ArrayList<NormalContacts>();
        displayList = new ArrayList<NormalContacts>();
        selectContact = new ArrayList<String>();
        setContentView(biz.AR.layout.phone_message_contact);
        initView();
        addEvent();
    }
    @Override
    protected void onResume() {
        super.onResume();
    }
    private void initView() {
        content_address_list = (ListView) findViewById(biz.AR.id.content_address_list);
        searchbutton = (Button) findViewById(biz.AR.id.searchbutton);
        search = (EditText) findViewById(biz.AR.id.search);
        message_checkall = (ImageView) findViewById(biz.AR.id.message_checkall);
        submit = (Button) findViewById(biz.AR.id.submit);
        cancel = (Button) findViewById(biz.AR.id.cancel);
    }
    private void addEvent() {
        sendMessageClickListener = new SendMessageClickListener();
        searchbutton.setOnClickListener(sendMessageClickListener);
        message_checkall.setOnClickListener(sendMessageClickListener);
        submit.setOnClickListener(sendMessageClickListener);
        cancel.setOnClickListener(sendMessageClickListener);
        search.addTextChangedListener(new TextWatcher() {
            @Override
            public void afterTextChanged(Editable arg0) {
                // TODO Auto-generated method stub
            }
            @Override
            public void beforeTextChanged(CharSequence arg0, int arg1, int arg2, int arg3) {
                // TODO Auto-generated method stub
            }
            @Override
            public void onTextChanged(CharSequence arg0, int arg1, int arg2, int arg3) {
                search(search.getText().toString());
            }
        });
        adapter = new PhoneListAdapter();
        content_address_list.setAdapter(adapter);
        contactList = ContactManager.getInstance(this).getList();
        content_address_list.setOnItemClickListener(new OnItemClickListener() {
            //添加联络人点击事件
            @Override
            public void onItemClick(AdapterView<?> arg0, View arg1, int arg2, long arg3) {
                int item = Integer.parseInt(String.valueOf(arg1.getTag()));
                CheckBox message_checkbox = (CheckBox) arg1.findViewById(biz.AR.id.message_check);
                if (!message_checkbox.isChecked()) {
                    message_checkbox.setChecked(true);
                    addContain(displayList.get(item).getpNumber());
                } else {
                    message_checkbox.setChecked(false);
                    if (isAllSelect) {
                        isAllSelect = false;
                        message_checkall.setBackgroundResource(biz.AR.drawable.phone_no_selected);
                    }
                    removeContain(displayList.get(item).getpNumber());
                }
            }
        });
        search("");
    }
    private void setSubmitState() {
        if (selectContact.size() == 0) submit.setClickable(false);
        else submit.setClickable(true);
    }
    private void search(String str) {
        displayList.clear();
        if (str == null || str.trim().equals("")) {
            for (NormalContacts message : contactList) {
                displayList.add(message);
            }
        } else {
            str = str.toLowerCase();
            for (NormalContacts message : contactList) {
                if (message.getNiceName().toLowerCase().contains(str) || message.getpNumber().contains(str)) {
                    displayList.add(message);
                } else if (ConvertPinYinUtil.isChinese(message.getNiceName()) && ConvertPinYinUtil.getInstance().getSelling(message.getNiceName()).startsWith(str)) {
                    displayList.add(message);
                }
            }
        }
        if (adapter != null) adapter.notifyDataSetChanged();
    }
    /**
     * 将界面所有控件监听器集中到一起：1、减少内存提高性能（每new一个内部类占1～8k内存）2、方便管理
     * 
     * @author wf
     * 
     */
    class SendMessageClickListener implements OnClickListener {
        @Override
        public void onClick(View v) {
            if (v.equals(searchbutton)) {
                String searchstr = search.getText().toString();
                search(searchstr);
            } else if (v.equals(message_checkall)) {
                if (!isAllSelect) {
                    isAllSelect = true;
                    message_checkall.setBackgroundResource(biz.AR.drawable.phone_selected);
                    adapter.notifyDataSetChanged();
                    for (NormalContacts mess : displayList) {
                        addContain(mess.getpNumber());
                    }
                } else {
                    isAllSelect = false;
                    message_checkall.setBackgroundResource(biz.AR.drawable.phone_no_selected);
                    adapter.notifyDataSetChanged();
                    selectContact.clear();
                }
                setSubmitState();
            } else if (v.equals(submit)) {
                Intent intent = new Intent();
                intent.putExtra("idlist", keyToString());
                setResult(RESULT_OK, intent);
                //注销目标程序，返回第一个Activity
                System.gc();
                finish();
            } else if (v.equals(cancel)) {
                Intent intent = new Intent();
                setResult(RESULT_CANCELED, intent);
                //注销目标程序，返回第一个Activity
                System.gc();
                finish();
            }
        }
    }
    private class PhoneListAdapter extends BaseAdapter {
        @Override
        public int getCount() {
            // TODO Auto-generated method stub 
            return displayList.size();
        }
        @Override
        public Object getItem(int position) {
            // TODO Auto-generated method stub 
            return null;
        }
        @Override
        public long getItemId(int position) {
            // TODO Auto-generated method stub 
            return 0;
        }
        @Override
        public boolean isEnabled(int position) {
            // TODO Auto-generated method stub 
            return super.isEnabled(position);
        }
        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            // TODO Auto-generated method stub 
            if (convertView == null) {
                convertView = LayoutInflater.from(getApplicationContext()).inflate(biz.AR.layout.phone_select, null);
            }
            convertView.setTag(position);
            ImageView personicon = (ImageView) convertView.findViewById(biz.AR.id.personicon);
            int logo = MessageUtils.getLogo(displayList.get(position).getpNumber());
            if (displayList.get(position).getPhoto() != null) {
                ByteArrayInputStream is = new ByteArrayInputStream(displayList.get(position).getPhoto());
                Bitmap map = BitmapFactory.decodeStream(is);
                personicon.setImageBitmap(map);
            } else if (logo > 0) {
                personicon.setImageResource(logo);
            } else {
                personicon.setImageResource(biz.AR.drawable.phone_person_icon);
            }
            TextView text = (TextView) convertView.findViewById(biz.AR.id.addexam_list_item_text);
            TextView number = (TextView) convertView.findViewById(biz.AR.id.addexam_list_item_number);
            final CheckBox message_checkbox = (CheckBox) convertView.findViewById(biz.AR.id.message_check);
            final NormalContacts mess = displayList.get(position);
            if (mess != null && mess.getNiceName() != null && !mess.getNiceName().trim().equals("")) {
                text.setText(mess.getNiceName());
                number.setText(mess.getpNumber());
            } else {
                text.setText(mess.getpNumber());
                number.setVisibility(View.GONE);
            }
            if (isContain(mess.getpNumber())) message_checkbox.setChecked(true);
            else message_checkbox.setChecked(false);
            return convertView;
        }
    }
    private String keyToString() {
        String returnMsg = "";
        if (selectContact.size() == 0) return returnMsg;
        for (String str : selectContact) {
            returnMsg += str + ",";
        }
        returnMsg = returnMsg.substring(0, returnMsg.length() - 1);
        return returnMsg;
    }
    private void addContain(String key) {
        if (!selectContact.contains(key)) selectContact.add(key);
    }
    private void removeContain(String key) {
        if (selectContact.contains(key)) selectContact.remove(key);
    }
    private boolean isContain(String key) {
        if (selectContact.contains(key)) return true;
        else return false;
    }
    @Override
    protected void onDestroy() {
        contactList.clear();
        super.onDestroy();
    }
    @Override
    public void onBackPressed() {
        contactList.clear();
        System.gc();
        finish();
    }
}
