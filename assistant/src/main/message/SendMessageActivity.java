package main.message;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import main.block.NormalContacts;
import main.callphone.ContactManager;
import main.callphone.SettingSave;
import main.ui.SMSSession_Activity;
import net.workspace.util.Logger;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.ContentValues;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.telephony.SmsManager;
import android.text.Editable;
import android.text.Html;
import android.text.Html.ImageGetter;
import android.text.TextWatcher;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnFocusChangeListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;

public class SendMessageActivity extends Activity {
    private TextView call_names;// 顶部联系人显示
    private Button sendmessage;// 发送按钮
    private ImageView select_number;// 选择联系人
    private EditText call_numbers;// 联系人电话号码显示
    private EditText call_text;// 发送短信内容
    private TextView smssession_msglen_txt;
    private LinearLayout content_linear;
    private LinearLayout time_linear;
    private LinearLayout content_layout;
    private TextView content;
    private TextView time;
    private RelativeLayout select_buttom;
    private final int GET_RESULT = 1010;
    private SendMessageClickListener sendMessageClickListener;
    private Map<String, NormalContacts> contactmap;
    private List<String> selectContact;
    private List<String> sendContact;
    private String preNumber;
    private String preContext;
    private SimpleDateFormat dateFormat2 = new SimpleDateFormat("HH:mm:ss");// 通话记录时间显示格式
    /** Called when the activity is first created. */
    private String currentMsg = "";
    MutiSmsSendResult smsSendResult;
    private String SENDACTION_FLAG = "sendMessageActivity";
    private List<SendingMessage> waittingMessage;
    private int currentSendIndex = 0;
    private ImageView select_expression;//选择表情
    private GridView gridView; // 网格，显示表情
    private boolean displayGrid = false;
    private int mode = 0;//多点触控监控
    private float oldDistance;
    private float newDistance;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Intent intent = getIntent();
        if (intent != null) {
            try {
                if (intent.getData() != null) {// 当通过系统调用跳到该页面时
                    preNumber = intent.getData().getSchemeSpecificPart().replace(" ", "");
                }
                if ((preNumber == null || preNumber.equals("")) && intent.getExtras() != null) {// 当程序内部跳到该页面时
                    preNumber = intent.getExtras().getString("mobile");
                }
                if (intent.getExtras() != null) {
                    preContext = intent.getExtras().getString("sms_body");
                    if (preContext == null || preContext.trim().equals("")) {
                        preContext = intent.getExtras().getString(Intent.EXTRA_TEXT);
                    }
                }
            } catch (Throwable e) {
                Log.e("SendMessageActivity", "启动时没有传入电话号码");
            }
        }
        setContentView(biz.AR.layout.phone_sendmessage);
        selectContact = new ArrayList<String>();
        sendContact = new ArrayList<String>();
        waittingMessage = new ArrayList<SendingMessage>();
        initView();
        addEvent();
        initContactData();
        IntentFilter intentFilter = new IntentFilter(SENDACTION_FLAG);
        smsSendResult = new MutiSmsSendResult();
        registerReceiver(smsSendResult, intentFilter);
    }
    @Override
    protected void onResume() {
        super.onResume();
    }
    private void initView() {
        call_names = (TextView) findViewById(biz.AR.id.call_names);
        sendmessage = (Button) findViewById(biz.AR.id.sendmessage);
        select_number = (ImageView) findViewById(biz.AR.id.select_number);
        call_numbers = (EditText) findViewById(biz.AR.id.call_numbers);
        call_text = (EditText) findViewById(biz.AR.id.call_text);
        content_linear = (LinearLayout) findViewById(biz.AR.id.content_linear);
        setBackgroundResource(content_linear, getMybg(getMyTextbg()));
        content_linear.setVisibility(View.GONE);
        content_layout = (LinearLayout) findViewById(biz.AR.id.content_linear);
        time_linear = (LinearLayout) findViewById(biz.AR.id.time_linear);
        setBackgroundResource(time_linear, getMybg(getMyTextbg()));
        time_linear.setVisibility(View.GONE);
        content = (TextView) findViewById(biz.AR.id.content);
        content.setTextSize(SettingSave.getInstance(SendMessageActivity.this).getIntValue("sms_session_textsize", 16));
        setRightColor(content, getMyTextColor());
        time = (TextView) findViewById(biz.AR.id.time);
        smssession_msglen_txt = (TextView) findViewById(biz.AR.id.smssession_msglen_txt);
        select_buttom = (RelativeLayout) findViewById(biz.AR.id.select_buttom);
        select_expression = (ImageView) findViewById(biz.AR.id.select_expression);
        gridView = (GridView) findViewById(biz.AR.id.myGrid);
        gridView.setAdapter(new ImageAdapter(SendMessageActivity.this));
        displayGrid = false;
    }
    private void setBackgroundResource(View view, int resource) {
        int top = view.getPaddingTop();
        int right = view.getPaddingRight();
        int left = view.getPaddingLeft();
        int bottom = view.getPaddingBottom();
        view.setBackgroundResource(resource);
        view.setPadding(left, top, right, bottom);
    }
    private void addEvent() {
        ImageView backbt = (ImageView) findViewById(biz.AR.id.phone_sendsms_back);
        sendMessageClickListener = new SendMessageClickListener();
        backbt.setOnClickListener(sendMessageClickListener);
        sendmessage.setOnClickListener(sendMessageClickListener);
        select_number.setOnClickListener(sendMessageClickListener);
        call_numbers.setOnFocusChangeListener(new OnFocusChangeListener() {
            @Override
            public void onFocusChange(View arg0, boolean arg1) {
                if (!arg1) {
                    String inputcontent = call_numbers.getText().toString();
                    String[] phonestr = inputcontent.split(",");
                    String name;
                    String tempphone;
                    for (String phone : phonestr) {
                        if (phone != null && !phone.trim().equals("")) {
                            if (phone.indexOf("<") == -1) {
                                if (!check(phone)) {
                                    alert(getResources().getString(biz.AR.string.phone_not_exist_receiver) + phone, getResources().getString(biz.AR.string.phone_change_receiver));
                                }
                            } else {
                                int first = phone.indexOf("<");
                                int last = phone.indexOf(">");
                                if (first != -1 && last != -1 && last > first) {
                                    tempphone = phone.substring(first + 1, last);
                                    name = phone.substring(0, first);
                                    if (!contactmap.containsKey(tempphone) || !contactmap.get(tempphone).getNiceName().equals(name)) {
                                        alert(getResources().getString(biz.AR.string.phone_not_exist_receiver) + phone, getResources().getString(biz.AR.string.phone_change_receiver));
                                    }
                                    if (!check(tempphone)) {
                                        alert(getResources().getString(biz.AR.string.phone_not_exist_receiver) + phone, getResources().getString(biz.AR.string.phone_change_receiver));
                                    }
                                }
                            }
                        }
                    }
                }
            }
        });
        call_text.addTextChangedListener(new TextWatcher() {
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
                if (call_text.getText().toString() == null && call_text.getText().toString().trim().length() == 0) {
                    smssession_msglen_txt.setText("");
                } else {
                    int length = MessageUtils.FilterHtml(Html.toHtml(call_text.getText())).length();
                    if (length <= 70) {
                        smssession_msglen_txt.setText(length + "/" + "70");
                    } else {
                        int time = length / 70 + 1;
                        smssession_msglen_txt.setText(length + "/" + time);
                    }
                }
            }
        });
        select_expression.setOnClickListener(sendMessageClickListener);
        gridView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> arg0, View arg1, int arg2, long arg3) {
                //					ToastManager.cancelToast();
                int gid = MessageUtils.expression_Q_buttons[(int) arg3];
                call_text.append(Html.fromHtml("<img src='" + gid + "'/>", imageGetter, null));
            }
        });
        content_layout.setOnTouchListener(new OnTouchListener() {
            @Override
            public boolean onTouch(View view, MotionEvent event) {
                try {
                    switch (event.getAction()) {
                        case MotionEvent.ACTION_UP:
                        case MotionEvent.ACTION_POINTER_UP:
                        case MotionEvent.ACTION_POINTER_2_UP:
                            mode = 0;
                            break;
                        case MotionEvent.ACTION_POINTER_DOWN:
                        case MotionEvent.ACTION_POINTER_2_DOWN:
                            oldDistance = (float) Math.sqrt((event.getX(0) - event.getX(1)) * (event.getX(0) - event.getX(1)) + (event.getY(0) - event.getY(1)) * (event.getY(0) - event.getY(1)));
                            newDistance = (float) Math.sqrt((event.getX(0) - event.getX(1)) * (event.getX(0) - event.getX(1)) + (event.getY(0) - event.getY(1)) * (event.getY(0) - event.getY(1)));
                            mode = 1;
                        case MotionEvent.ACTION_MOVE:
                            if (mode == 1) {
                                newDistance = (float) Math.sqrt((event.getX(0) - event.getX(1)) * (event.getX(0) - event.getX(1)) + (event.getY(0) - event.getY(1)) * (event.getY(0) - event.getY(1)));
                                if (newDistance - oldDistance > 10f) {
                                    oldDistance = newDistance;
                                    int txtsize = SettingSave.getInstance(SendMessageActivity.this).getIntValue("sms_session_textsize", 16);
                                    if (txtsize < 22) SettingSave.getInstance(SendMessageActivity.this).saveIntValue("sms_session_textsize", txtsize + 1);
                                    content.setTextSize(SettingSave.getInstance(SendMessageActivity.this).getIntValue("sms_session_textsize", 16));
                                } else if (oldDistance - newDistance > 10f) {
                                    oldDistance = newDistance;
                                    int txtsize = SettingSave.getInstance(SendMessageActivity.this).getIntValue("sms_session_textsize", 16);
                                    if (txtsize > 10) SettingSave.getInstance(SendMessageActivity.this).saveIntValue("sms_session_textsize", txtsize - 1);
                                    content.setTextSize(SettingSave.getInstance(SendMessageActivity.this).getIntValue("sms_session_textsize", 16));
                                }
                            }
                            break;
                    }
                } catch (Throwable e) {
                    // TODO Auto-generated catch block
                    Logger.error(e);
                }
                return true;
            }
        });
    }
    private void sendMessage(String number, String content) {
        SmsManager smsManager = SmsManager.getDefault();
        Intent intent = new Intent(SENDACTION_FLAG);
        PendingIntent sendPi = PendingIntent.getBroadcast(this, 0, intent, 0);
        // 如果字数超过70,需拆分成多条短信发送
        if (content.length() > 70) {
            ArrayList<String> msgs = smsManager.divideMessage(content);
            ArrayList<PendingIntent> intentlist = new ArrayList<PendingIntent>();
            intentlist.add(sendPi);
            for (int i = 1, n = msgs.size(); i < n; i++) {
                intentlist.add(null);
            }
            smsManager.sendMultipartTextMessage(number, null, msgs, intentlist, null);
        } else {
            smsManager.sendTextMessage(number, null, content, sendPi, null);
        }
    }
    private void displayContact() {
        if (selectContact == null || selectContact.size() == 0) return;
        String title = "";
        String name = "";
        for (String id : selectContact) {
            if (contactmap.containsKey(id)) {
                title += contactmap.get(id).getNiceName() + ",";
                name += contactmap.get(id).getNiceName() + "<" + contactmap.get(id).getpNumber() + ">,";
            } else {
                title += id + ",";
                name += id + ",";
            }
        }
        if (!title.equals("")) {
            title = title.substring(0, title.length() - 1);
        }
        if (!name.equals("")) {
            name = name.substring(0, name.length() - 1);
        }
        call_names.setText(title);
        call_numbers.setText(name);
    }
    private void alert(String title, String message) {
        Builder dia = new AlertDialog.Builder(SendMessageActivity.this);
        if (title != null && !title.equals("")) {
            dia.setTitle(title);
        }
        if (message != null && !message.equals("")) {
            dia.setMessage(message);
        }
        dia.setPositiveButton(getResources().getString(biz.AR.string.phone_submit), new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialoginterface, int i) {
                // 这里设置点击后执行
            }
        }).show();
    }
    /**
     * requestCode 请求代码 resultCode 结果代码 date 活动间交互附加的数据信息
     */
    private List<SendingMessage> getPhoneList(String inputcontent) {
        List<SendingMessage> phonelist = new ArrayList<SendingMessage>();
        String[] phonestr = inputcontent.split(",");
        for (String phone : phonestr) {
            if (phone != null && !phone.trim().equals("")) {
                if (phone.indexOf("<") == -1) {
                    if (check(phone)) {
                        SendingMessage sm = new SendingMessage("", phone);
                        phonelist.add(sm);
                    } else {
                        alert(getResources().getString(biz.AR.string.phone_not_exist_receiver) + phone, getResources().getString(biz.AR.string.phone_change_receiver));
                        return null;
                    }
                } else {
                    int first = phone.indexOf("<");
                    int last = phone.indexOf(">");
                    if (first != -1 && last != -1 && last > first) {
                        phone = phone.substring(first + 1, last);
                        if (check(phone)) {
                            SendingMessage sm = new SendingMessage(contactmap.get(phone).getNiceName(), phone);
                            phonelist.add(sm);
                        } else {
                            alert(getResources().getString(biz.AR.string.phone_not_exist_receiver) + phone, getResources().getString(biz.AR.string.phone_change_receiver));
                        }
                    }
                }
            }
        }
        return phonelist;
    }
    public boolean check(String needCheck) {
        String regex = "^((\\+86)|(86))?\\d{3}-?\\d{8}|\\d{4}-?\\d{8}|\\d*$";
        if (needCheck.matches(regex)) { return true; }
        return false;
    }
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == GET_RESULT) {
            if (resultCode == RESULT_OK) {
                if (data != null) {
                    String addID = String.valueOf(data.getExtras().get("idlist"));
                    String[] addids = addID.split(",");
                    for (String str : addids) {
                        if (str != null && !str.trim().equals("") && !selectContact.contains(str)) {
                            selectContact.add(str);
                        }
                    }
                    displayContact();
                }
            } else if (resultCode == RESULT_CANCELED) {}
        }
        super.onActivityResult(requestCode, resultCode, data);
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
            if (v.equals(sendmessage)) {
                String inputcontent = call_numbers.getText().toString();
                if (inputcontent == null || inputcontent.equals("")) {
                    alert(getResources().getString(biz.AR.string.phone_receiver_not_null), getResources().getString(biz.AR.string.phone_input_receiver));
                    return;
                }
                waittingMessage = getPhoneList(inputcontent);
                if (waittingMessage == null || waittingMessage.size() == 0) return;
                final String contentMsg = MessageUtils.FilterHtml(Html.toHtml(call_text.getText()));
                if (contentMsg == null || contentMsg.equals("")) {
                    alert(getResources().getString(biz.AR.string.phone_content_not_null), getResources().getString(biz.AR.string.phone_input_content));
                    return;
                }
                if (sendmessage.getText().toString().equals("发送") && waittingMessage.size() == 1) {
                    SMSSession_Activity.smsSession.pNumber = waittingMessage.get(0).mobile;
                    SMSSession_Activity.smsSession.niceName = waittingMessage.get(0).name;
                    SMSSession_Activity.smsSession.mproperty = "";
                    SMSSession_Activity.smsSession.type = 3;
                    SMSSession_Activity.smsSession.actionType = 1;
                    SMSSession_Activity.smsSession.msg = contentMsg;
                    Intent smsIntent = new Intent(SendMessageActivity.this, SMSSession_Activity.class);
                    startActivity(smsIntent);
                    System.gc();
                    finish();
                    return;
                } else {
                    sendContact.clear();
                    sendmessage.setText("发送中...");
                    select_buttom.setVisibility(View.GONE);
                    call_text.setEnabled(false);
                    currentMsg = contentMsg;
                    currentSendIndex = 0;
                    sendMessage(waittingMessage.get(currentSendIndex).mobile, contentMsg);
                }
            } else if (v.equals(select_number)) {
                Intent intent = new Intent();
                intent.setClass(SendMessageActivity.this, MessageSelectContactActivity.class);
                startActivityForResult(intent, GET_RESULT);
            } else if (v.equals(select_expression)) {
                if (displayGrid) {
                    displayGrid = false;
                    gridView.setVisibility(View.GONE);
                } else {
                    displayGrid = true;
                    gridView.setVisibility(View.VISIBLE);
                }
            } else if (v.getId() == biz.AR.id.phone_sendsms_back) {
                System.gc();
                finish();
            }
        }
    }
    private void initContactData() {
        List<NormalContacts> contactListTemp = ContactManager.getInstance(this).getList();
        contactmap = new HashMap<String, NormalContacts>();
        for (NormalContacts one : contactListTemp) {
            contactmap.put(one.pNumber, one);
        }
        if (preContext != null && !preContext.equals("")) {
            call_text.setText(preContext);
        }
        if (preNumber != null && !preNumber.equals("")) {
            if (preNumber.indexOf("+86") == 0) preNumber = preNumber.substring(3);
            selectContact.add(preNumber);
            displayContact();
            call_numbers.clearFocus();
            call_text.requestFocus();
            call_text.setFocusableInTouchMode(true);
        }
    }
    @Override
    protected void onDestroy() {
        try {
            contactmap.clear();
            waittingMessage.clear();
            ContactManager.getInstance(this).clear();
            unregisterReceiver(smsSendResult);
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        }
        super.onDestroy();
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) {
            if (!displayGrid) {
                // 按下的如果是BACK，同时没有重复
                System.gc();
                finish();
                return false;
            } else {
                displayGrid = false;
                gridView.setVisibility(View.GONE);
                return false;
            }
        }
        return super.onKeyDown(keyCode, event);
    }
    public class MutiSmsSendResult extends BroadcastReceiver {
        @Override
        public void onReceive(Context context, Intent intent) {
            if (sendContact.contains(waittingMessage.get(currentSendIndex).mobile)) return;
            else sendContact.add(waittingMessage.get(currentSendIndex).mobile);
            String tips = "";
            if (currentSendIndex == 0) {
                content.setText(Html.fromHtml(MessageUtils.explain(currentMsg), imageGetter, null));
                content_linear.setVisibility(View.VISIBLE);
                time_linear.setVisibility(View.VISIBLE);
            }
            if (waittingMessage.get(currentSendIndex).name.equals("")) {
                tips = waittingMessage.get(currentSendIndex).mobile;
            } else {
                tips = waittingMessage.get(currentSendIndex).name;
            }
            if (getResultCode() == Activity.RESULT_OK) {
                waittingMessage.get(currentSendIndex).sendResult = 1;
                ContentValues cv = new ContentValues();
                cv.put("address", waittingMessage.get(currentSendIndex).mobile);
                cv.put("read", 1);
                cv.put("type", 2);
                cv.put("status", 0);
                cv.put("date", System.currentTimeMillis() + "");
                cv.put("body", currentMsg);
                getContentResolver().insert(Uri.parse("content://sms"), cv);
                tips += "   发送成功!   ";
                String currenttime = dateFormat2.format(new Date());
                tips += currenttime;
            } else {
                waittingMessage.get(currentSendIndex).sendResult = 2;
                tips += "   发送失败!";
            }
            currentSendIndex++;
            if (!time.getText().toString().equals("")) {
                tips = "\n" + tips;
            }
            time.setText(time.getText() + tips);
            if (waittingMessage.size() > currentSendIndex) {
                sendMessage(waittingMessage.get(currentSendIndex).mobile, currentMsg);
            } else {
                currentSendIndex = 0;
                selectContact.clear();
                for (int i = 0, n = waittingMessage.size(); i < n; i++) {
                    if (waittingMessage.get(i).sendResult == 2) {
                        selectContact.add(waittingMessage.get(i).mobile);
                    }
                }
                waittingMessage.clear();
                if (selectContact.size() > 0) {
                    sendmessage.setText("重发");
                    displayContact();
                } else {
                    call_text.setText("");
                    // call_numbers.setText("");
                    sendmessage.setText("发送");
                    // call_names.setText("");
                    // call_text.setEnabled(true);
                    // call_numbers.setEnabled(true);
                    // select_number.setEnabled(true);
                }
            }
        }
    }
    class SendingMessage {
        public SendingMessage() {}
        public SendingMessage(String name, String mobile) {
            this.mobile = mobile;
            this.name = name;
        }
        public int sendResult = 0;
        public String mobile;
        public String name;
    }
    public class ImageAdapter extends BaseAdapter {
        public ImageAdapter(Context c) {
            mContext = c;
        }
        @Override
        public int getCount() {
            return MessageUtils.expression_Q_buttons.length;
        }
        @Override
        public Object getItem(int position) {
            return position;
        }
        @Override
        public long getItemId(int position) {
            return position;
        }
        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            ImageView imageView = null;
            if (convertView == null) {
                imageView = new ImageView(mContext);
                imageView.setAdjustViewBounds(true);
                imageView.setScaleType(ImageView.ScaleType.CENTER_CROP);
                imageView.setPadding(1, 1, 1, 1);
            } else {
                imageView = (ImageView) convertView;
            }
            imageView.setImageResource(MessageUtils.expression_Q_buttons[position]);
            return imageView;
        }
        private Context mContext;
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
    private int getMyTextColor() {
        return SettingSave.getInstance(SendMessageActivity.this).getIntValue("sms_session_my_textcolor", 0);
    }
    private int getMyTextbg() {
        return SettingSave.getInstance(SendMessageActivity.this).getIntValue("sms_session_my_textbg", 3);
    }
    private int getMybg(int type) {
        switch (type) {
            case 0:
                return biz.AR.drawable.sms_bg_type1_out;
            case 1:
                return biz.AR.drawable.sms_bg_type2_out;
            case 2:
                return biz.AR.drawable.sms_bg_type3_out;
            case 3:
                return biz.AR.drawable.sms_bg_type4_out;
            case 4:
                return biz.AR.drawable.sms_bg_type5_out;
            case 5:
                return biz.AR.drawable.sms_bg_type6_out;
        }
        return biz.AR.drawable.sms_bg_type4_out;
    }
    private void setRightColor(TextView view, int color) {
        //初始化三种颜色值
        int redcolor = color / (256 * 256);
        int greecolor = (color - redcolor * 256 * 256) / 256;
        int bluecolor = color - redcolor * 256 * 256 - greecolor * 256;
        view.setTextColor(Color.rgb(redcolor, greecolor, bluecolor));
    }
}