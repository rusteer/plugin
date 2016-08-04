package main.callphone;
import java.io.ByteArrayInputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import main.block.NormalContacts;
import main.message.MessageUtils;
import main.message.SendMessageActivity;
import net.workspace.util.Logger;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.ContentResolver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.Matrix;
import android.media.AudioManager;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Parcelable;
import android.provider.BaseColumns;
import android.provider.CallLog;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.telephony.PhoneNumberUtils;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.TranslateAnimation;
import android.view.inputmethod.InputMethodManager;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

public class CallPhoneActivity extends Activity {
    // ViewPager是google SDk中自带的一个附加包的一个类，可以用来实现屏幕间的切换。
    // android-support-v4.jar
    private ViewPager mPager;//页卡内容
    private List<View> listViews; // Tab页面列表
    private ImageView cursor;// 动画图片
    private Button call_phone, address_book, phone_record;// 拨打电话,通讯录,通话记录
    private int offset = 0;// 动画图片偏移量
    private int currIndex = 0;// 当前页卡编号
    private int bmpW;// 动画图片宽度
    /** Called when the activity is first created. */
    /*
     * call_phone中对象
     */
    private EditText call_number;//电话号码显示区
    private TextView phone_name;//查询到的第一个人名称
    private TextView phone_number;//查询到的第一个人电话
    private ImageView phone_more;//查看其它查询到的记录
    private ImageView personicon;//用户图像
    private LinearLayout list_content3;//查询到的其它记录显示区
    private LinearLayout jianpan;//键盘控制区
    private Button call_1;//按键1
    private Button call_2;//按键2
    private Button call_3;//按键3
    private Button call_4;//按键4
    private Button call_5;//按键5
    private Button call_6;//按键6
    private Button call_7;//按键7
    private Button call_8;//按键8
    private Button call_9;//按键9
    private Button call_0;//按键0
    private Button call_star;//按键*
    private Button call_jin;//按键#
    private ImageView number_voice;//静音
    private ImageView call;//打电话键
    private ImageView number_cancel;//取消键
    private CallOnClickListener callOnClickListener;
    private ListView content_address_list;//通讯录列表
    private ListView content_record_list;//通话历史记录列表
    private List<NormalContacts> contactList;//通讯录数据
    private Map<String, NormalContacts> contactMap;//通讯录数据
    private List<NormalContacts> contactDisplayList;//通讯录显示数据
    private List<ContactRecordInfo> recordList;//通话历史记录数据
    private ListView search_record_list;//匹配联系人
    private List<NormalContacts> searchlist;//匹配联系人信息
    SearchListAdapter searchListAdapter;
    RecordListAdapter recordadapter;
    PhoneListAdapter adapter;
    private SimpleDateFormat dateFormat1 = new SimpleDateFormat("MM月dd日");//通话记录时间显示格式
    private SimpleDateFormat dateFormat2 = new SimpleDateFormat("HH时mm分");//通话记录时间显示格式
    String preNumber;//预拨打号码
    private boolean isCloseVoice = false;
    private boolean listContent3Visible = false;//用于判断查询匹配到的更多的记录是否显示
    private int currentTab = 0;//当前显示的tab页，包括通话记录、通讯录、通话历史记录
    private boolean isExisted = true;//当前Activity是否已经被销毁
    private final byte[] _writeLockRecord = new byte[0]; // 定义一个Byte作为写锁,解决多线程同时操作数据库问题
    private final int MINIUTE = 60000;
    private final int HOUR = 3600000;
    private final int DAY = 86400000;
    private EditText phone_search_address;//通讯录查询区
    private SoundManager soundManager;
    private final int CALL_PHONE_RESULT = 1102;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Intent intent = getIntent();
        if (intent != null) {
            try {
                preNumber = PhoneNumberUtils.getNumberFromIntent(intent, this);
            } catch (Throwable e) {
                Log.e("CallPhoneActivity", "启动时没有传入电话号码");
            }
        }
        setContentView(biz.AR.layout.phone_call_phone_mian);
        setVolumeControlStream(AudioManager.STREAM_MUSIC);
        contactList = new ArrayList<NormalContacts>();
        contactMap = new HashMap<String, NormalContacts>();
        recordList = new ArrayList<ContactRecordInfo>();
        searchlist = new ArrayList<NormalContacts>();
        contactDisplayList = new ArrayList<NormalContacts>();
        soundManager = new SoundManager();
        soundManager.init(this);
        initView();
        addEvent();
        initContactData();//初始化联络人信息
    }
    @Override
    protected void onResume() {
        isExisted = true;
        synchronized (_writeLockRecord) {
            recordList.clear();
            if (recordadapter != null) recordadapter.notifyDataSetChanged();
        }
        initRecordData();//初始化通话记录信息
        search(call_number.getText().toString());
        super.onResume();
    }
    @Override
    protected void onDestroy() {
        isExisted = false;//当前Activity是否已经被销毁
        ContactManager.getInstance(this).clear();
        soundManager.clear();
        mPager = null;//页卡内容
        listViews.clear(); // Tab页面列表
        cursor = null;// 动画图片
        call_phone = null;
        address_book = null;
        phone_record = null;// 拨打电话,通讯录,通话记录
        offset = 0;// 动画图片偏移量
        currIndex = 0;// 当前页卡编号
        bmpW = 0;// 动画图片宽度
        /** Called when the activity is first created. */
        /*
         * call_phone中对象
         */
        call_number = null;//电话号码显示区
        phone_name = null;//查询到的第一个人名称
        phone_number = null;//查询到的第一个人电话
        phone_more = null;//查看其它查询到的记录
        personicon = null;//用户图像
        list_content3 = null;//查询到的其它记录显示区
        jianpan = null;//键盘控制区
        call_1 = null;//按键1
        call_2 = null;//按键2
        call_3 = null;//按键3
        call_4 = null;//按键4
        call_5 = null;//按键5
        call_6 = null;//按键6
        call_7 = null;//按键7
        call_8 = null;//按键8
        call_9 = null;//按键9
        call_0 = null;//按键0
        call_star = null;//按键*
        call_jin = null;//按键#
        call = null;//打电话键
        number_cancel = null;//取消键
        callOnClickListener = null;
        content_address_list = null;//通讯录列表
        content_record_list = null;//通话历史记录列表
        contactList.clear();//通讯录数据
        recordList.clear();//通话历史记录数据
        search_record_list = null;//匹配联系人
        searchlist.clear();//匹配联系人信息
        searchListAdapter = null;
        recordadapter = null;
        adapter = null;
        preNumber = "";//预拨打号码
        super.onStop();
    }
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == CALL_PHONE_RESULT) {
            call_number.setText("");
        }
        super.onActivityResult(requestCode, resultCode, data);
    }
    /**
     * 初始化动画
     */
    private void InitImageView() {
        cursor = (ImageView) findViewById(biz.AR.id.cursor);
        bmpW = BitmapFactory.decodeResource(getResources(), biz.AR.drawable.phone_click).getWidth();// 获取图片宽度
        DisplayMetrics dm = new DisplayMetrics();
        getWindowManager().getDefaultDisplay().getMetrics(dm);
        int screenW = dm.widthPixels;// 获取分辨率宽度
        offset = (screenW / 3 - bmpW) / 2;// 计算偏移量
        Matrix matrix = new Matrix();
        matrix.postTranslate(offset, 0);
        cursor.setImageMatrix(matrix);// 设置动画初始位置
    }
    /**
     * 初始化ViewPager
     */
    private void InitViewPager() {
        call_phone = (Button) findViewById(biz.AR.id.call_phone);
        address_book = (Button) findViewById(biz.AR.id.address_book);
        phone_record = (Button) findViewById(biz.AR.id.phone_record);
        mPager = (ViewPager) findViewById(biz.AR.id.vPager);
        listViews = new ArrayList<View>();
        LayoutInflater mInflater = getLayoutInflater();
        listViews.add(mInflater.inflate(biz.AR.layout.phone_call_phone_call, null));
        listViews.add(mInflater.inflate(biz.AR.layout.phone_call_phone_address, null));
        listViews.add(mInflater.inflate(biz.AR.layout.phone_call_phone_list, null));
        mPager.setAdapter(new MyPagerAdapter(listViews));
        mPager.setCurrentItem(currentTab);
        switch (currentTab) {
            case 0:
                call_phone.setTextColor(Color.WHITE);
                call_phone.setCompoundDrawablesWithIntrinsicBounds(null, getResources().getDrawable(biz.AR.drawable.phone_call_phone_src_click), null, null);
                break;
            case 1:
                address_book.setTextColor(Color.WHITE);
                address_book.setCompoundDrawablesWithIntrinsicBounds(null, getResources().getDrawable(biz.AR.drawable.phone_address_book_src_click), null, null);
                break;
            case 2:
                phone_record.setTextColor(Color.WHITE);
                phone_record.setCompoundDrawablesWithIntrinsicBounds(null, getResources().getDrawable(biz.AR.drawable.phone_record_src_click), null, null);
        }
        mPager.setOnPageChangeListener(new MyOnPageChangeListener());
    }
    private void initView() {
        InitImageView();
        InitViewPager();
        initCallPage(listViews.get(0));
        initPhoneView(listViews.get(1));
        initRecordView(listViews.get(2));
    }
    private void initPhoneView(View view) {
        phone_search_address = (EditText) view.findViewById(biz.AR.id.phone_search_address);
        content_address_list = (ListView) view.findViewById(biz.AR.id.content_list);
    }
    private void initRecordView(View view) {
        content_record_list = (ListView) view.findViewById(biz.AR.id.content_list);
    }
    private void initCallPage(View view) {
        call_number = (EditText) view.findViewById(biz.AR.id.call_number);
        call_number.setText(preNumber);
        call_number.setInputType(InputType.TYPE_NULL);
        phone_name = (TextView) view.findViewById(biz.AR.id.phone_name);
        phone_number = (TextView) view.findViewById(biz.AR.id.phone_number);
        phone_more = (ImageView) view.findViewById(biz.AR.id.phone_more);
        personicon = (ImageView) view.findViewById(biz.AR.id.personicon);
        list_content3 = (LinearLayout) view.findViewById(biz.AR.id.list_content3);
        jianpan = (LinearLayout) view.findViewById(biz.AR.id.jianpan);
        call_1 = (Button) view.findViewById(biz.AR.id.call_1);
        call_2 = (Button) view.findViewById(biz.AR.id.call_2);
        call_3 = (Button) view.findViewById(biz.AR.id.call_3);
        call_4 = (Button) view.findViewById(biz.AR.id.call_4);
        call_5 = (Button) view.findViewById(biz.AR.id.call_5);
        call_6 = (Button) view.findViewById(biz.AR.id.call_6);
        call_7 = (Button) view.findViewById(biz.AR.id.call_7);
        call_8 = (Button) view.findViewById(biz.AR.id.call_8);
        call_9 = (Button) view.findViewById(biz.AR.id.call_9);
        call_0 = (Button) view.findViewById(biz.AR.id.call_0);
        call_star = (Button) view.findViewById(biz.AR.id.call_star);
        call_jin = (Button) view.findViewById(biz.AR.id.call_jin);
        number_voice = (ImageView) view.findViewById(biz.AR.id.number_voice);
        isCloseVoice = SettingSave.getInstance(this).getBooleanValue("voice", true);
        if (isCloseVoice) {
            number_voice.setImageResource(biz.AR.drawable.phone_voice_open);
        } else {
            number_voice.setImageResource(biz.AR.drawable.phone_voice_close);
        }
        call = (ImageView) view.findViewById(biz.AR.id.call);
        number_cancel = (ImageView) view.findViewById(biz.AR.id.number_cancel);
        search_record_list = (ListView) view.findViewById(biz.AR.id.search_record_list);
    }
    private void addCallEvent() {
        callOnClickListener = new CallOnClickListener();
        personicon.setOnClickListener(callOnClickListener);
        phone_name.setOnClickListener(callOnClickListener);
        phone_number.setOnClickListener(callOnClickListener);
        phone_more.setOnClickListener(callOnClickListener);
        call_1.setOnClickListener(callOnClickListener);
        call_2.setOnClickListener(callOnClickListener);
        call_3.setOnClickListener(callOnClickListener);
        call_4.setOnClickListener(callOnClickListener);
        call_5.setOnClickListener(callOnClickListener);
        call_6.setOnClickListener(callOnClickListener);
        call_7.setOnClickListener(callOnClickListener);
        call_8.setOnClickListener(callOnClickListener);
        call_9.setOnClickListener(callOnClickListener);
        call_0.setOnClickListener(callOnClickListener);
        call_star.setOnClickListener(callOnClickListener);
        call_jin.setOnClickListener(callOnClickListener);
        call.setOnClickListener(callOnClickListener);
        number_voice.setOnClickListener(callOnClickListener);
        number_cancel.setOnClickListener(callOnClickListener);
        //added by lhy on 2012-2-23,长按删除键，删除输入的号码
        number_cancel.setOnLongClickListener(new View.OnLongClickListener() {
            @Override
            public boolean onLongClick(View arg0) {
                if (arg0.equals(number_cancel)) {
                    call_number.setText("");
                }
                return false;
            }
        });
        call_number.addTextChangedListener(new TextWatcher() {
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
                if (!call_number.getText().toString().equals("")) {
                    call_number.setGravity(Gravity.CENTER);
                } else {
                    call_number.setGravity(Gravity.CENTER | Gravity.LEFT);
                }
                search(call_number.getText().toString());
            }
        });
    }
    private void addEvent() {
        call_phone.setOnClickListener(new MyOnClickListener(0));
        address_book.setOnClickListener(new MyOnClickListener(1));
        phone_record.setOnClickListener(new MyOnClickListener(2));
        addCallEvent();
        adapter = new PhoneListAdapter();
        content_address_list.setAdapter(adapter);
        content_address_list.setOnItemClickListener(new OnItemClickListener() {
            //添加联络人点击事件
            @Override
            public void onItemClick(AdapterView<?> arg0, View arg1, int arg2, long arg3) {
                int item = Integer.parseInt(String.valueOf(arg1.getTag()));
                final NormalContacts info = contactDisplayList.get(item);
                String[] items = { CallPhoneActivity.this.getResources().getString(biz.AR.string.phone_call), CallPhoneActivity.this.getResources().getString(biz.AR.string.phone_send_message),
                        CallPhoneActivity.this.getResources().getString(biz.AR.string.phone_cancel) };
                new AlertDialog.Builder(CallPhoneActivity.this).setTitle(info.getNiceName() + ":" + info.getpNumber()).setItems(items, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int item) {
                        switch (item) {
                            case 0:
                                callPhone(info.getpNumber());
                                break;
                            case 1:
                                sendMessage(info.getpNumber());
                                break;
                        }
                    }
                }).create().show();
            }
        });
        phone_search_address.addTextChangedListener(new TextWatcher() {
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
                if (isExisted) addressSearch(phone_search_address.getText().toString());
            }
        });
        recordadapter = new RecordListAdapter();
        content_record_list.setAdapter(recordadapter);
        content_record_list.setOnItemClickListener(new OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> arg0, View arg1, int arg2, long arg3) {
                if (isExisted) {
                    final int clickitem = Integer.parseInt(String.valueOf(arg1.getTag()));
                    final ContactRecordInfo info = recordList.get(clickitem);
                    String name = info.getCachedname();
                    if (name == null || name.equals("")) {
                        String[] items = { CallPhoneActivity.this.getResources().getString(biz.AR.string.phone_call), CallPhoneActivity.this.getResources().getString(biz.AR.string.phone_delete_record),
                                CallPhoneActivity.this.getResources().getString(biz.AR.string.phone_add_contact), CallPhoneActivity.this.getResources().getString(biz.AR.string.phone_cancel) };
                        new AlertDialog.Builder(CallPhoneActivity.this).setTitle(info.getNumber()).setItems(items, new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int item) {
                                switch (item) {
                                    case 0:
                                        callPhone(info.getNumber());
                                        break;
                                    case 1:
                                        deleteCallRecord(clickitem);
                                        break;
                                    case 2:
                                        addContact(info.getNumber());
                                        break;
                                }
                            }
                        }).create().show();
                    } else {
                        String[] items = { CallPhoneActivity.this.getResources().getString(biz.AR.string.phone_call), CallPhoneActivity.this.getResources().getString(biz.AR.string.phone_delete_record),
                                CallPhoneActivity.this.getResources().getString(biz.AR.string.phone_cancel) };
                        new AlertDialog.Builder(CallPhoneActivity.this).setTitle(info.getCachedname() + ":" + info.getNumber()).setItems(items, new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int item) {
                                switch (item) {
                                    case 0:
                                        callPhone(info.getNumber());
                                        break;
                                    case 1:
                                        deleteCallRecord(clickitem);
                                        break;
                                }
                            }
                        }).create().show();
                    }
                }
            }
        });
        searchListAdapter = new SearchListAdapter();
        search_record_list.setAdapter(searchListAdapter);
        search_record_list.setOnItemClickListener(new OnItemClickListener() {
            //添加通话记录点击事件
            @Override
            public void onItemClick(AdapterView<?> arg0, View arg1, int arg2, long arg3) {
                if (isExisted) {
                    int item = Integer.parseInt(String.valueOf(arg1.getTag()));
                    call_number.setText(searchlist.get(item).getpNumber());
                    call_number.setSelection(call_number.getText().toString().length());
                    list_content3.setVisibility(View.GONE);
                    jianpan.setVisibility(View.VISIBLE);
                }
            }
        });
    }
    private void sendMessage(String mobile) {
        Intent intent = new Intent(this, SendMessageActivity.class);
        intent.putExtra("mobile", mobile);
        startActivity(intent);
    }
    private void addressSearch(String addstr) {
        addstr = addstr.toLowerCase();
        if (isExisted) {
            contactDisplayList.clear();
            for (NormalContacts info : contactList) {
                if (addstr != null && !addstr.trim().equals("")) {
                    if (info.getpNumber().contains(addstr) || info.getNiceName().toLowerCase().contains(addstr)) {
                        contactDisplayList.add(info);
                    } else if (ConvertPinYinUtil.isChinese(info.getNiceName()) && ConvertPinYinUtil.getInstance().getSelling(info.getNiceName()).startsWith(addstr)) {
                        contactDisplayList.add(info);
                    }
                } else contactDisplayList.add(info);
            }
            if (adapter != null) adapter.notifyDataSetChanged();
        }
    }
    private void addContact(String number) {
        Uri insertUri = android.provider.ContactsContract.Contacts.CONTENT_URI;
        Intent intent = new Intent(Intent.ACTION_INSERT, insertUri);
        intent.putExtra(android.provider.ContactsContract.Intents.Insert.PHONE, number);
        startActivity(intent);
    }
    public void search(String searchtext) {
        if (isExisted) {
            searchlist.clear();
            if (searchtext != null && !searchtext.trim().equals("")) {
                for (NormalContacts info : contactList) {
                    if (info.getpNumber().contains(searchtext)) {
                        searchlist.add(info);
                    }
                }
            }
            if (searchListAdapter != null) searchListAdapter.notifyDataSetChanged();
            jianpan.setVisibility(View.VISIBLE);
            if (searchlist.size() == 0) {
                list_content3.setVisibility(View.GONE);
                listContent3Visible = false;
                phone_name.setText("");
                phone_number.setText("");
                phone_more.setVisibility(View.INVISIBLE);
                personicon.setVisibility(View.INVISIBLE);
            } else {
                list_content3.setVisibility(View.GONE);
                listContent3Visible = false;
                phone_name.setText(searchlist.get(0).getNiceName());
                phone_number.setText(searchlist.get(0).getpNumber());
                personicon.setVisibility(View.VISIBLE);
                int logo = MessageUtils.getLogo(searchlist.get(0).getpNumber());
                if (searchlist.get(0).getPhoto() != null) {
                    ByteArrayInputStream is = new ByteArrayInputStream(searchlist.get(0).getPhoto());
                    Bitmap map = BitmapFactory.decodeStream(is);
                    personicon.setImageBitmap(map);
                } else if (logo > 0) {
                    personicon.setImageResource(logo);
                } else {
                    personicon.setImageResource(biz.AR.drawable.phone_person_icon);
                }
                if (searchlist.size() == 1) phone_more.setVisibility(View.INVISIBLE);
                else {
                    phone_more.setVisibility(View.VISIBLE);
                    phone_more.setImageDrawable(getResources().getDrawable(biz.AR.drawable.phone_display_list_button_src));
                }
            }
        }
    }
    private void initContactData() {
        contactList = ContactManager.getInstance(this).getList();
        for (NormalContacts contact : contactList) {
            contactMap.put(contact.pNumber, contact);
        }
        addressSearch(phone_search_address.getText().toString());
    }
    private void initRecordData() {
        new AsyncTask<Void, Void, Void>() {
            LinkedHashMap<String, ContactRecordInfo> tempRecordList = new LinkedHashMap<String, ContactRecordInfo>();//通话历史记录数据
            @Override
            protected Void doInBackground(Void... arg0) {
                Cursor record = null;
                //DBManager dbManager = null;
                try {
                    record = getContentResolver().query(CallLog.Calls.CONTENT_URI, null, null, null, CallLog.Calls.DEFAULT_SORT_ORDER);
                    //					dbManager = new DBManager(CallPhoneActivity.this);
                    //					dbManager.openDatabase();
                    while (record.moveToNext() && isExisted) {
                        ContactRecordInfo recordInfo = new ContactRecordInfo();
                        String cachedID = record.getString(record.getColumnIndex(BaseColumns._ID));
                        recordInfo.setId(cachedID);
                        String number = record.getString(record.getColumnIndex(CallLog.Calls.NUMBER));
                        recordInfo.setNumber(number);
                        String cachedname = record.getString(record.getColumnIndex(CallLog.Calls.CACHED_NAME));
                        if (cachedname == null || cachedname.equals("")) {
                            if (contactMap.containsKey(number)) {
                                cachedname = contactMap.get(number).niceName;
                            }
                            //		        			cachedname = dbManager.mobileInfo(number);
                            //if(dbManager!=null)dbManager.closeDatabase();
                        }
                        recordInfo.setCachedname(cachedname);
                        byte[] photo = null;
                        if (contactMap.containsKey(number)) {
                            photo = contactMap.get(number).getPhoto();
                            if (photo != null) recordInfo.setPhoto(photo);
                        }
                        int numbertype = record.getInt(record.getColumnIndex(CallLog.Calls.CACHED_NUMBER_TYPE));
                        recordInfo.setNumbertype(numbertype);
                        Long date = record.getLong(record.getColumnIndex(CallLog.Calls.DATE));
                        recordInfo.setTime(date);
                        int type = record.getInt(record.getColumnIndex(CallLog.Calls.TYPE));
                        recordInfo.setType(type);
                        if (!tempRecordList.containsKey(number)) {
                            recordInfo.setTimes(1);
                            tempRecordList.put(number, recordInfo);
                        } else {
                            tempRecordList.get(number).setTimes(tempRecordList.get(number).getTimes() + 1);
                        }
                    }
                } catch (Throwable e) {
                    Logger.error(e);
                } finally {
                    if (record != null) record.close();
                    //if(dbManager!=null)dbManager.closeDatabase();
                }
                return null;
            }
            @Override
            protected void onPostExecute(Void result) {
                synchronized (_writeLockRecord) {
                    recordList.clear();
                    for (String key : tempRecordList.keySet()) {
                        recordList.add(tempRecordList.get(key));
                    }
                    tempRecordList.clear();
                    if (recordadapter != null) recordadapter.notifyDataSetChanged();
                }
                super.onPostExecute(result);
            }
        }.execute();
    }
    private void addNumber(String s, String playKey) {
        call_number.setText(call_number.getText() + s);
        call_number.setSelection(call_number.getText().toString().length());
        if (isCloseVoice) soundManager.play(CallPhoneActivity.this, playKey);
    }
    private void deleteNumber() {
        String s = call_number.getText().toString();
        if (s.length() > 0) {
            s = s.substring(0, s.length() - 1);
            call_number.setText(s);
        }
        call_number.setSelection(call_number.getText().toString().length());
    }
    private void callPhone(String callNumber) {
        // 生成呼叫意图
        Intent intent = new Intent(Intent.ACTION_CALL, Uri.parse("tel:" + callNumber));
        // 开始呼叫
        intent.putExtra("tel", callNumber);
        startActivityForResult(intent, CALL_PHONE_RESULT);
    }
    private void hiddenSoftInput() {
        try {
            InputMethodManager m = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
            m.hideSoftInputFromWindow(CallPhoneActivity.this.getCurrentFocus().getWindowToken(), 0);
        } catch (Throwable e) {
            Logger.error(e);
        }
    }
    private void deleteCallRecord(int position) {
        ContentResolver resolver = getContentResolver();
        resolver.delete(CallLog.Calls.CONTENT_URI, CallLog.Calls.NUMBER + "=?", new String[] { recordList.get(position).getNumber() + "" });
        recordList.remove(position);
        recordadapter.notifyDataSetChanged();
    }
    // Menu菜单,在按MENU键时调用
    @Override
    public boolean onPrepareOptionsMenu(Menu menu) {
        // TODO Auto-generated method stub
        super.onPrepareOptionsMenu(menu);
        if (currentTab == 2 && recordList.size() > 0) {
            menu.findItem(0).setVisible(true);
        } else {
            menu.findItem(0).setVisible(false);
        }
        return true;
    }
    // Menu菜单,在Activity创建时调用
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        super.onCreateOptionsMenu(menu);
        menu.add(0, 0, 0, getString(biz.AR.string.phone_clear_all_record_value));
        return true;
    }
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case 0:
                ContentResolver resolver = getContentResolver();
                resolver.delete(CallLog.Calls.CONTENT_URI, null, null);
                recordList.clear();
                recordadapter.notifyDataSetChanged();
                break;
        }
        return super.onOptionsItemSelected(item);
    }
    /**
     * 将界面所有控件监听器集中到一起：1、减少内存提高性能（每new一个内部类占1～8k内存）2、方便管理
     * @author wf
     */
    class CallOnClickListener implements OnClickListener {
        @Override
        public void onClick(View v) {
            if (v.equals(call_number)) {
                //todo
            } else if (v.equals(call_1)) {
                addNumber("1", "effecttick_1");
            } else if (v.equals(call_2)) {
                addNumber("2", "effecttick_2");
            } else if (v.equals(call_3)) {
                addNumber("3", "effecttick_3");
            } else if (v.equals(call_4)) {
                addNumber("4", "effecttick_4");
            } else if (v.equals(call_5)) {
                addNumber("5", "effecttick_5");
            } else if (v.equals(call_6)) {
                addNumber("6", "effecttick_6");
            } else if (v.equals(call_7)) {
                addNumber("7", "effecttick_7");
            } else if (v.equals(call_8)) {
                addNumber("8", "effecttick_8");
            } else if (v.equals(call_9)) {
                addNumber("9", "effecttick_9");
            } else if (v.equals(call_0)) {
                addNumber("0", "effecttick_0");
            } else if (v.equals(call_star)) {
                addNumber("*", "effecttick_star");
            } else if (v.equals(call_jin)) {
                addNumber("#", "effecttick_well");
            } else if (v.equals(number_voice)) {
                isCloseVoice = !isCloseVoice;
                SettingSave.getInstance(CallPhoneActivity.this).saveBooleanValue("voice", isCloseVoice);
                if (isCloseVoice) {
                    number_voice.setImageResource(biz.AR.drawable.phone_voice_open);
                } else {
                    number_voice.setImageResource(biz.AR.drawable.phone_voice_close);
                }
            } else if (v.equals(call)) {
                String s = call_number.getText().toString();
                if (s.length() > 0) {
                    callPhone(s);
                }
            } else if (v.equals(number_cancel)) {
                deleteNumber();
            } else if (v.equals(phone_name)) {
                call_number.setText(phone_number.getText().toString());
                call_number.setSelection(call_number.getText().toString().length());
            } else if (v.equals(phone_number)) {
                call_number.setText(phone_number.getText().toString());
                call_number.setSelection(call_number.getText().toString().length());
            } else if (v.equals(personicon)) {
                call_number.setText(phone_number.getText().toString());
                call_number.setSelection(call_number.getText().toString().length());
            } else if (v.equals(phone_more)) {
                if (listContent3Visible) {
                    listContent3Visible = false;
                    list_content3.setVisibility(View.GONE);
                    jianpan.setVisibility(View.VISIBLE);
                    phone_name.setText(searchlist.get(0).getNiceName());
                    phone_number.setText(searchlist.get(0).getpNumber());
                    personicon.setVisibility(View.VISIBLE);
                    phone_more.setImageDrawable(getResources().getDrawable(biz.AR.drawable.phone_display_list_button_src));
                } else {
                    listContent3Visible = true;
                    list_content3.setVisibility(View.VISIBLE);
                    jianpan.setVisibility(View.GONE);
                    phone_name.setText("");
                    phone_number.setText("");
                    personicon.setVisibility(View.INVISIBLE);
                    phone_more.setImageDrawable(getResources().getDrawable(biz.AR.drawable.phone_no_display_list_button_src));
                }
            }
        }
    }
    private class SearchListAdapter extends BaseAdapter {
        @Override
        public int getCount() {
            // TODO Auto-generated method stub 
            return searchlist.size();
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
                convertView = LayoutInflater.from(getApplicationContext()).inflate(biz.AR.layout.phone_searchphonelist, null);
            }
            convertView.setTag(position);
            TextView number = (TextView) convertView.findViewById(biz.AR.id.phone_number);
            number.setText(searchlist.get(position).getpNumber());
            ImageView personicon = (ImageView) convertView.findViewById(biz.AR.id.personicon);
            int logo = MessageUtils.getLogo(searchlist.get(position).getpNumber());
            if (searchlist.get(position).getPhoto() != null) {
                ByteArrayInputStream is = new ByteArrayInputStream(searchlist.get(position).getPhoto());
                Bitmap map = BitmapFactory.decodeStream(is);
                personicon.setImageBitmap(map);
            } else if (logo > 0) {
                personicon.setImageResource(logo);
            } else {
                personicon.setImageResource(biz.AR.drawable.phone_person_icon);
            }
            TextView text = (TextView) convertView.findViewById(biz.AR.id.phone_name);
            text.setText(searchlist.get(position).getNiceName());
            return convertView;
        }
    }
    private class PhoneListAdapter extends BaseAdapter {
        @Override
        public int getCount() {
            // TODO Auto-generated method stub 
            return contactDisplayList.size();
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
        public View getView(final int position, View convertView, ViewGroup parent) {
            // TODO Auto-generated method stub 
            if (convertView == null) {
                convertView = LayoutInflater.from(getApplicationContext()).inflate(biz.AR.layout.phone_phonelist, null);
            }
            convertView.setTag(position);
            ImageView personicon = (ImageView) convertView.findViewById(biz.AR.id.personicon);
            int logo = MessageUtils.getLogo(contactDisplayList.get(position).getpNumber());
            if (contactDisplayList.get(position).getPhoto() != null) {
                ByteArrayInputStream is = new ByteArrayInputStream(contactDisplayList.get(position).getPhoto());
                Bitmap map = BitmapFactory.decodeStream(is);
                personicon.setImageBitmap(map);
            } else if (logo > 0) {
                personicon.setImageResource(logo);
            } else {
                personicon.setImageResource(biz.AR.drawable.phone_person_icon);
            }
            TextView text = (TextView) convertView.findViewById(biz.AR.id.addexam_list_item_text);
            text.setText(contactDisplayList.get(position).getNiceName());
            TextView number = (TextView) convertView.findViewById(biz.AR.id.addexam_list_item_number);
            number.setText(contactDisplayList.get(position).getpNumber());
            ImageView person_icon = (ImageView) convertView.findViewById(biz.AR.id.personicon);
            person_icon.setOnClickListener(new OnClickListener() {
                @Override
                public void onClick(View arg0) {
                    callPhone(contactDisplayList.get(position).getpNumber());
                }
            });
            ImageView addexam_list_icon = (ImageView) convertView.findViewById(biz.AR.id.addexam_list_icon);
            addexam_list_icon.setOnClickListener(new OnClickListener() {
                @Override
                public void onClick(View arg0) {
                    callPhone(contactDisplayList.get(position).getpNumber());
                }
            });
            return convertView;
        }
    }
    private class RecordListAdapter extends BaseAdapter {
        @Override
        public int getCount() {
            // TODO Auto-generated method stub 
            return recordList.size();
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
        public View getView(final int position, View convertView, ViewGroup parent) {
            // TODO Auto-generated method stub 
            if (convertView == null) {
                convertView = LayoutInflater.from(getApplicationContext()).inflate(biz.AR.layout.phone_recordlist, null);
            }
            convertView.setTag(position);
            ImageView personicon = (ImageView) convertView.findViewById(biz.AR.id.personicon);
            int logo = MessageUtils.getLogo(recordList.get(position).getNumber());
            if (recordList.get(position).getPhoto() != null) {
                ByteArrayInputStream is = new ByteArrayInputStream(recordList.get(position).getPhoto());
                Bitmap map = BitmapFactory.decodeStream(is);
                personicon.setImageBitmap(map);
            } else if (logo > 0) {
                personicon.setImageResource(logo);
            } else {
                personicon.setImageResource(biz.AR.drawable.phone_person_icon);
            }
            TextView name = (TextView) convertView.findViewById(biz.AR.id.addexam_list_item_text);
            TextView number = (TextView) convertView.findViewById(biz.AR.id.number);
            if (recordList.get(position).getCachedname() != null) {
                name.setText(recordList.get(position).getCachedname());
            } else name.setText("");
            number.setText(recordList.get(position).getNumber());
            ImageView method = (ImageView) convertView.findViewById(biz.AR.id.method);
            switch (recordList.get(position).getType()) {
                case 1:
                    method.setImageResource(biz.AR.drawable.phone_receive_phone);
                    break;
                case 2:
                    method.setImageResource(biz.AR.drawable.phone_send_phone);
                    break;
                case 3:
                    method.setImageResource(biz.AR.drawable.phone_no_receive);
                    break;
            }
            String[] dis = getDayDisplay(recordList.get(position).getTime());
            TextView time_day = (TextView) convertView.findViewById(biz.AR.id.time_day);
            time_day.setText(dis[0]);
            TextView time_hour = (TextView) convertView.findViewById(biz.AR.id.time_hour);
            if (recordList.get(position).getTimes() > 1) {
                time_hour.setText(dis[1] + " (" + recordList.get(position).getTimes() + "次)");
            } else time_hour.setText(dis[1]);
            ImageView person_icon = (ImageView) convertView.findViewById(biz.AR.id.personicon);
            person_icon.setOnClickListener(new OnClickListener() {
                @Override
                public void onClick(View arg0) {
                    callPhone(recordList.get(position).getNumber());
                }
            });
            return convertView;
        }
    }
    @Override
    public void onBackPressed() {
        System.gc();
        finish();
    }
    /**
     * ViewPager适配器
     */
    public class MyPagerAdapter extends PagerAdapter {
        public List<View> mListViews;
        public MyPagerAdapter(List<View> mListViews) {
            this.mListViews = mListViews;
        }
        @Override
        public void destroyItem(View arg0, int arg1, Object arg2) {
            ((ViewPager) arg0).removeView(mListViews.get(arg1));
        }
        @Override
        public void finishUpdate(View arg0) {}
        @Override
        public int getCount() {
            return mListViews.size();
        }
        @Override
        public Object instantiateItem(View arg0, int arg1) {
            ((ViewPager) arg0).addView(mListViews.get(arg1), 0);
            return mListViews.get(arg1);
        }
        @Override
        public boolean isViewFromObject(View arg0, Object arg1) {
            return arg0 == arg1;
        }
        @Override
        public void restoreState(Parcelable arg0, ClassLoader arg1) {}
        @Override
        public Parcelable saveState() {
            return null;
        }
        @Override
        public void startUpdate(View arg0) {}
    }
    /**
     * 头标点击监听
     */
    public class MyOnClickListener implements View.OnClickListener {
        private int index = 0;
        public MyOnClickListener(int i) {
            index = i;
        }
        @Override
        public void onClick(View v) {
            mPager.setCurrentItem(index);
        }
    };
    private void recoverColor() {
        call_phone.setTextColor(Color.BLACK);
        address_book.setTextColor(Color.BLACK);
        phone_record.setTextColor(Color.BLACK);
        call_phone.setCompoundDrawablesWithIntrinsicBounds(null, getResources().getDrawable(biz.AR.drawable.phone_call_phone_src), null, null);
        address_book.setCompoundDrawablesWithIntrinsicBounds(null, getResources().getDrawable(biz.AR.drawable.phone_address_book_src), null, null);
        phone_record.setCompoundDrawablesWithIntrinsicBounds(null, getResources().getDrawable(biz.AR.drawable.phone_record_src), null, null);
    }
    /**
     * 页卡切换监听
     */
    public class MyOnPageChangeListener implements OnPageChangeListener {
        int one = offset * 2 + bmpW;// 页卡1 -> 页卡2 偏移量
        int two = one * 2;// 页卡1 -> 页卡3 偏移量
        @Override
        public void onPageSelected(int arg0) {
            recoverColor();
            hiddenSoftInput();
            Animation animation = null;
            switch (arg0) {
                case 0:
                    call_phone.setTextColor(Color.WHITE);
                    call_phone.setCompoundDrawablesWithIntrinsicBounds(null, getResources().getDrawable(biz.AR.drawable.phone_call_phone_src_click), null, null);
                    if (currIndex == 1) {
                        animation = new TranslateAnimation(one, 0, 0, 0);
                    } else if (currIndex == 2) {
                        animation = new TranslateAnimation(two, 0, 0, 0);
                    }
                    break;
                case 1:
                    address_book.setTextColor(Color.WHITE);
                    address_book.setCompoundDrawablesWithIntrinsicBounds(null, getResources().getDrawable(biz.AR.drawable.phone_address_book_src_click), null, null);
                    if (currIndex == 0) {
                        animation = new TranslateAnimation(offset, one, 0, 0);
                    } else if (currIndex == 2) {
                        animation = new TranslateAnimation(two, one, 0, 0);
                    }
                    break;
                case 2:
                    phone_record.setTextColor(Color.WHITE);
                    phone_record.setCompoundDrawablesWithIntrinsicBounds(null, getResources().getDrawable(biz.AR.drawable.phone_record_src_click), null, null);
                    if (currIndex == 0) {
                        animation = new TranslateAnimation(offset, two, 0, 0);
                    } else if (currIndex == 1) {
                        animation = new TranslateAnimation(one, two, 0, 0);
                    }
                    break;
            }
            currentTab = arg0;
            currIndex = arg0;
            animation.setFillAfter(true);// True:图片停在动画结束位置
            animation.setDuration(300);
            cursor.startAnimation(animation);
        }
        @Override
        public void onPageScrolled(int arg0, float arg1, int arg2) {}
        @Override
        public void onPageScrollStateChanged(int arg0) {}
    }
    private String[] getDayDisplay(long time) {
        if (time == 0l) return new String[] { "", "" };
        long current = System.currentTimeMillis();
        if ((current - time) / MINIUTE == 0) {
            return new String[] { CallPhoneActivity.this.getResources().getString(biz.AR.string.phone_today), CallPhoneActivity.this.getResources().getString(biz.AR.string.phone_less_one_miniute) };
        } else if ((current - time) / HOUR == 0) {
            return new String[] { CallPhoneActivity.this.getResources().getString(biz.AR.string.phone_today), (current - time) / MINIUTE + CallPhoneActivity.this.getResources().getString(biz.AR.string.phone_miniutes_before) };
        } else if (current / DAY == time / DAY) {
            return new String[] { CallPhoneActivity.this.getResources().getString(biz.AR.string.phone_today), (current - time) / HOUR + CallPhoneActivity.this.getResources().getString(biz.AR.string.phone_hours_before) };
        } else if (current / DAY == time / DAY + 1) {
            Date d = new Date(time);
            return new String[] { CallPhoneActivity.this.getResources().getString(biz.AR.string.phone_yesterday), dateFormat2.format(d) };
        } else {
            Date d = new Date(time);
            return new String[] { dateFormat1.format(d), dateFormat2.format(d) };
        }
    }
}