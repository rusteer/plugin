package main.privates.ui;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import main.block.NormalContacts;
import main.block.ui.Block_AddTo_Activity;
import main.database.DatabaseAdapter;
import main.message.MessageUtils;
import main.privates.PrivatePhone;
import main.privates.PrivateRuleSetting;
import main.privates.PrivateSMS;
import main.privates.PrivateSMSSession;
import main.ui.Global_Var;
import main.ui.SMSSession_Activity;
import net.workspace.util.Logger;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.drawable.Drawable;
import android.media.RingtoneManager;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import android.provider.CallLog;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.text.Html;
import android.text.Html.ImageGetter;
import android.view.ContextMenu;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.AdapterView.AdapterContextMenuInfo;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.RadioButton;
import android.widget.RelativeLayout;
import android.widget.SimpleAdapter;
import android.widget.TextView;

public class Private_Main_Activity extends Activity {
    private ViewPager mPager;//页卡内容
    private List<View> listViews; // Tab页面列表
    public static Activity s_tabsActivity;
    private RadioButton[] img = new RadioButton[4];
    public static int tabIndex = 0;
    Dialog dialog = null;
    /** 记录当前分页ID */
    private int currentTabID = 0;
    /** Private_SMS_Activity */
    private ArrayList<PrivateSMSSession> bSMSSessionList = new ArrayList<PrivateSMSSession>();
    private int privateSMSTotalCount = 0;
    private BaseAdapter smsMySimperAdapter;
    private ArrayList<HashMap<String, Object>> smsMyData;
    private ListView smsLView;
    private TextView smsTText;
    private int smsDelsmsPosition = 0;
    private final int SMS_MENU_INDEX = 20;
    /** Private_Phone_Activity */
    private ArrayList<PrivatePhone> privatePhones;
    private SimpleAdapter phoneMySimperAdapter;
    private ArrayList<HashMap<String, Object>> phoneMyData;
    private ListView phoneLView;
    private TextView phoneTText;
    private int phoneDelphonePosition = 0;
    private final int PHONE_MENU_INDEX = 40;
    /** Private_Contacts_Activity */
    private SimpleAdapter contactsAdapter;
    private ArrayList<HashMap<String, Object>> contactsData;
    private ListView contactsListView;
    private int delcontactsListPos = 0;
    private boolean[] selected;
    private ArrayList<String> selectedInfo = new ArrayList<String>();
    private ArrayList<String> selectedname = new ArrayList<String>();
    private ArrayList<String> selectedpnumber = new ArrayList<String>();
    private final int CONTACTS_MENU_INDEX = 60;
    /** Private_Setting_Activity */
    private boolean isChangedRuleSetting = false;
    private final int RequestCode_SMSRing = 1002;
    SettingOnClickListener settingOnClickListener;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.private_main_activity);
        LinearLayout main = (LinearLayout) findViewById(biz.AR.id.private_main_layout);
        main.setBackgroundResource(Global_Var.mainBG_Imges[Global_Var.currMainBGIndex]);
        s_tabsActivity = this;
        initViewPage();
        initSMSView(listViews.get(0));
        initPhoneView(listViews.get(1));
        initContactsView(listViews.get(2));
    }
    @Override
    protected void onResume() {
        refreshSMSData();
        refreshPhoneData();
        refreshContactsData();
        update_setting(listViews.get(3));
        super.onResume();
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) { // 按下的如果是BACK，同时没有重复
            System.gc();
            Private_Main_Activity.this.finish();
            return false;
        }
        return super.onKeyDown(keyCode, event);
    }
    @Override
    protected void onPause() {
        if (isChangedRuleSetting) {
            DatabaseAdapter databaseAdapter = DatabaseAdapter.getInstance(this);
            databaseAdapter.updaePrivateRuleSetting();
            isChangedRuleSetting = false;
        }
        super.onPause();
    }
    private void initViewPage() {
        mPager = (ViewPager) findViewById(biz.AR.id.vPager);
        listViews = new ArrayList<View>();
        LayoutInflater mInflater = getLayoutInflater();
        listViews.add(mInflater.inflate(biz.AR.layout.private_sms_activity, null));
        listViews.add(mInflater.inflate(biz.AR.layout.private_phone_activity, null));
        listViews.add(mInflater.inflate(biz.AR.layout.private_contacts_activity, null));
        listViews.add(mInflater.inflate(biz.AR.layout.private_setting_activity, null));
        mPager.setAdapter(new MyPagerAdapter(listViews));
        img[0] = (RadioButton) findViewById(biz.AR.id.private_main_img1);
        img[1] = (RadioButton) findViewById(biz.AR.id.private_main_img2);
        img[2] = (RadioButton) findViewById(biz.AR.id.private_main_img3);
        img[3] = (RadioButton) findViewById(biz.AR.id.private_main_img4);
        mPager.setOnPageChangeListener(new MyOnPageChangeListener());
        img[0].setOnClickListener(new MyOnClickListener(0));
        img[1].setOnClickListener(new MyOnClickListener(1));
        img[2].setOnClickListener(new MyOnClickListener(2));
        img[3].setOnClickListener(new MyOnClickListener(3));
        mPager.setCurrentItem(tabIndex);
    }
    private void initSMSView(View view) {
        ImageView back = (ImageView) view.findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                Private_Main_Activity.this.finish();
            }
        });
        smsTText = (TextView) view.findViewById(biz.AR.id.private_sms_total_txt);
        smsLView = (ListView) view.findViewById(biz.AR.id.private_sms_listView);
        smsLView.setOnItemClickListener(new OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                @SuppressWarnings("unchecked")
                HashMap<String, Object> c = (HashMap<String, Object>) smsMySimperAdapter.getItem(position);
                int ItemImageid = ((Integer) c.get("ItemImage")).intValue();
                if (ItemImageid == biz.AR.drawable.block_smsunread) {
                    String pNumber = c.get("pNumber").toString();
                    DatabaseAdapter dAdapter = DatabaseAdapter.getInstance(s_tabsActivity);
                    dAdapter.flagReadfor_PrivateSMS(pNumber);
                    refreshSMSData();
                    //smsMySimperAdapter.notifyDataSetChanged();;
                }
                // ////////////
                SMSSession_Activity.smsSession.pNumber = bSMSSessionList.get(position).pNumber;
                SMSSession_Activity.smsSession.niceName = bSMSSessionList.get(position).nickname;
                SMSSession_Activity.smsSession.mproperty = bSMSSessionList.get(position).mproperty;
                SMSSession_Activity.smsSession.type = 2;
                Intent smsIntent = new Intent(s_tabsActivity, SMSSession_Activity.class);
                startActivity(smsIntent);
                // //////////
            }
        });
        smsLView.setOnCreateContextMenuListener(new View.OnCreateContextMenuListener() {
            @Override
            public void onCreateContextMenu(ContextMenu menu, View v, ContextMenuInfo menuInfo) {
                menu.setHeaderTitle("操作选择");
                menu.add(1, SMS_MENU_INDEX + 1, 1, "呼叫联系人");
                menu.add(1, SMS_MENU_INDEX + 2, 2, "删除(永久)");
                menu.add(1, SMS_MENU_INDEX + 3, 3, "删除(到回收站)");
                menu.add(1, SMS_MENU_INDEX + 4, 4, "移动到收藏夹");
                menu.add(1, SMS_MENU_INDEX + 5, 5, "将号码添加到");
                menu.add(1, SMS_MENU_INDEX + 6, 6, "恢复到收件箱");
            }
        });
    }
    private void getPrivateSMSSessionList() {
        bSMSSessionList.clear();
        DatabaseAdapter da = DatabaseAdapter.getInstance(this);
        ArrayList<PrivateSMS> privateSMSs = da.readPrivateSMSs();
        privateSMSTotalCount = privateSMSs.size();
        smsTText.setText("您有" + privateSMSTotalCount + "条私密信息");
        if (privateSMSTotalCount <= 0) return;
        PrivateSMSSession bSmsSession = new PrivateSMSSession();
        bSmsSession.pNumber = "@";
        for (PrivateSMS one : privateSMSs) {
            if (bSmsSession.pNumber.equals(one.address))// 同一session,统计数量
            {
                bSmsSession.count++;
            } else {
                if (!bSmsSession.pNumber.equals("@"))// 到下一个session需要保存数据
                {
                    bSMSSessionList.add(bSmsSession);
                    bSmsSession = new PrivateSMSSession();
                    bSmsSession.pNumber = "@";
                }
                bSmsSession.pNumber = one.address;
                bSmsSession.lastMsg = one.body;
                bSmsSession.lastcreateDate = one.cDate;
                bSmsSession.mproperty = one.mproperty;
                StringBuffer niceName = new StringBuffer();
                if (da.searchContact(bSmsSession.pNumber, niceName)) bSmsSession.nickname = niceName.toString();
                niceName = null;
                if (one.read) bSmsSession.unReadCount++;
                bSmsSession.count = 1;
            }
        }
        bSMSSessionList.add(bSmsSession);
    }
    private void refreshSMSData() {
        getPrivateSMSSessionList();
        DateComparator comp = new DateComparator();
        Collections.sort(bSMSSessionList, comp);
        if (smsMyData != null) smsMyData.clear();
        // 生成动态数组，加入数据
        smsMyData = new ArrayList<HashMap<String, Object>>();
        for (PrivateSMSSession one : bSMSSessionList) {
            HashMap<String, Object> map = new HashMap<String, Object>();
            if (one.unReadCount > 0) map.put("ItemImage", biz.AR.drawable.block_smsread);
            else map.put("ItemImage", biz.AR.drawable.block_smsunread);
            map.put("pNumber", one.pNumber);
            map.put("ItemPhone", one.pNumber + "(" + one.count + ")" + one.mproperty);
            // ////////////
            String dString = one.lastcreateDate;
            // /////////////
            map.put("ItemMsg", one.lastMsg);
            map.put("ItemDate", dString);
            smsMyData.add(map);
        }
        // 生成适配器的Item和动态数组对应的元素
        smsMySimperAdapter = new InboxAdapter(this);
        // 添加并且显示
        smsLView.setAdapter(smsMySimperAdapter);
    }
    private void initPhoneView(View view) {
        ImageView back = (ImageView) view.findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                Private_Main_Activity.this.finish();
            }
        });
        phoneTText = (TextView) view.findViewById(biz.AR.id.private_phone_total_txt);
        phoneLView = (ListView) view.findViewById(biz.AR.id.private_phone_listView);
        phoneLView.setOnItemClickListener(new OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                @SuppressWarnings("unchecked")
                HashMap<String, Object> c = (HashMap<String, Object>) phoneMySimperAdapter.getItem(position);
                int ItemImageid = ((Integer) c.get("ItemImage")).intValue();
                if (ItemImageid == biz.AR.drawable.callunread) {
                    int privatephone_id = ((Integer) c.get("phone_id")).intValue();
                    DatabaseAdapter dAdapter = DatabaseAdapter.getInstance(s_tabsActivity);
                    dAdapter.flagReadfor_PrivatePhone(privatephone_id);
                    refreshPhoneData();
                    phoneMySimperAdapter.notifyDataSetChanged();
                }
            }
        });
        phoneLView.setOnCreateContextMenuListener(new View.OnCreateContextMenuListener() {
            @Override
            public void onCreateContextMenu(ContextMenu menu, View v, ContextMenuInfo menuInfo) {
                menu.setHeaderTitle("操作选择");
                menu.add(1, PHONE_MENU_INDEX + 1, 2, "回复短信");
                menu.add(1, PHONE_MENU_INDEX + 2, 3, "呼叫");
                menu.add(1, PHONE_MENU_INDEX + 3, 4, "删除");
                menu.add(1, PHONE_MENU_INDEX + 4, 5, "将号码添加到");
            }
        });
    }
    private void refreshPhoneData() {
        try {
            DatabaseAdapter da = DatabaseAdapter.getInstance(this);
            if (privatePhones != null) privatePhones.clear();
            privatePhones = da.readPrivatePhones();
            if (phoneMyData != null) phoneMyData.clear();
            // 生成动态数组，加入数据
            phoneTText.setText("您有" + privatePhones.size() + "个私密电话");
            phoneMyData = new ArrayList<HashMap<String, Object>>();
            for (int i = 0; i < privatePhones.size(); i++) {
                HashMap<String, Object> map = new HashMap<String, Object>();
                if (privatePhones.get(i).readFlag) map.put("ItemImage", biz.AR.drawable.callread);
                else map.put("ItemImage", biz.AR.drawable.callunread);
                map.put("phone_id", privatePhones.get(i).id);
                map.put("ItemNumber", privatePhones.get(i).pNumber);
                map.put("ItemPhone", privatePhones.get(i).mproperty);
                // ////////////
                String dString = "";
                DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault());
                try {
                    Date date = sdf.parse(privatePhones.get(i).createDate);
                    dString = MessageUtils.getDateFormat(String.valueOf(date.getTime()));;
                } catch (ParseException e) {
                    Logger.error(e);
                }
                // /////////////
                map.put("ItemMsg", dString);
                phoneMyData.add(map);
            }
            // 生成适配器的Item和动态数组对应的元素
            phoneMySimperAdapter = new SimpleAdapter(this, phoneMyData,// 数据源
                    biz.AR.layout.private_phone_activity_listview_item,// ListItem的XML实现
                    // 动态数组与ImageItem对应的子项
                    new String[] { "phone_id", "ItemImage", "ItemPhone", "ItemMsg", "ItemNumber" },
                    // ImageItem的XML文件里面的一个ImageView,两个TextView ID
                    new int[] { biz.AR.id.private_phone_listview_item_id_txt, biz.AR.id.private_phone_listview_item_readFlag_Img, biz.AR.id.private_phone_listview_item_Phone_txt, biz.AR.id.private_phone_listview_item_date_txt,
                            biz.AR.id.private_phone_listview_item_number_txt });
            // 添加并且显示
            phoneLView.setAdapter(phoneMySimperAdapter);
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        }
    }
    private void update_setting(View view) {
        ImageView back = (ImageView) view.findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                Private_Main_Activity.this.finish();
            }
        });
        settingOnClickListener = new SettingOnClickListener();
        TextView tView = (TextView) view.findViewById(biz.AR.id.private_setting_SMS_value_txt);
        tView.setText(PrivateRuleSetting.replySMSs[PrivateRuleSetting.replySmsIndex]);
        tView = (TextView) view.findViewById(biz.AR.id.private_setting_Notifwords_value_txt);
        tView.setText(PrivateRuleSetting.notication_word);
        CheckBox cbox = (CheckBox) view.findViewById(biz.AR.id.private_setting_newNotify_cbox);
        cbox.setChecked(PrivateRuleSetting.new_notication);
        cbox = (CheckBox) view.findViewById(biz.AR.id.private_setting_newNotifvibrate_cbox);
        cbox.setChecked(PrivateRuleSetting.new_vibrate);
        cbox = (CheckBox) view.findViewById(biz.AR.id.private_setting_callautoReturn_cbox);
        cbox.setChecked(PrivateRuleSetting.autoreturn);
        RelativeLayout r = (RelativeLayout) view.findViewById(biz.AR.id.private_setting_pwd_layout);
        r.setOnClickListener(settingOnClickListener);
        r = (RelativeLayout) view.findViewById(biz.AR.id.private_setting_title_layout);
        r.setOnClickListener(settingOnClickListener);
        r = (RelativeLayout) view.findViewById(biz.AR.id.private_setting_newNotify_layout);
        r.setOnClickListener(settingOnClickListener);
        r = (RelativeLayout) view.findViewById(biz.AR.id.private_setting_smsRing_layout);
        r.setOnClickListener(settingOnClickListener);
        r = (RelativeLayout) view.findViewById(biz.AR.id.private_setting_smsNotificon_layout);
        r.setOnClickListener(settingOnClickListener);
        r = (RelativeLayout) view.findViewById(biz.AR.id.private_setting_callNotificon_layout);
        r.setOnClickListener(settingOnClickListener);
        r = (RelativeLayout) view.findViewById(biz.AR.id.private_setting_Notifwords_layout);
        r.setOnClickListener(settingOnClickListener);
        r = (RelativeLayout) view.findViewById(biz.AR.id.private_setting_newNotifvibrate_layout);
        r.setOnClickListener(settingOnClickListener);
        r = (RelativeLayout) view.findViewById(biz.AR.id.private_setting_callautoReturn_layout);
        r.setOnClickListener(settingOnClickListener);
        r = (RelativeLayout) view.findViewById(biz.AR.id.private_setting_SMS_layout);
        r.setOnClickListener(settingOnClickListener);
    }
    private void initContactsView(View view) {
        ImageView back = (ImageView) view.findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                Private_Main_Activity.this.finish();
            }
        });
        contactsListView = (ListView) view.findViewById(biz.AR.id.private_contacts_listview);
        contactsListView.setOnCreateContextMenuListener(new View.OnCreateContextMenuListener() {
            @Override
            public void onCreateContextMenu(ContextMenu menu, View v, ContextMenuInfo menuInfo) {
                menu.setHeaderTitle("联系人操作选择");
                menu.add(1, CONTACTS_MENU_INDEX + 1, 1, "修改");
                menu.add(1, CONTACTS_MENU_INDEX + 2, 2, "发短信");
                menu.add(1, CONTACTS_MENU_INDEX + 3, 3, "电话呼叫");
                menu.add(1, CONTACTS_MENU_INDEX + 4, 4, "删除");
            }
        });
        LinearLayout layout = (LinearLayout) view.findViewById(biz.AR.id.private_contacts_add_layout);
        layout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showDialog(1);
            }
        });
    }
    /**
     * 加载私密联系人listview显示数据
     */
    private void refreshContactsData() {
        try {
            String[] ss = getResources().getStringArray(biz.AR.array.private_block_type);
            DatabaseAdapter da = DatabaseAdapter.getInstance(this);
            PrivateRuleSetting.pContactsList.clear();
            PrivateRuleSetting.pContactsList = da.readPrivateContacts();
            if (contactsData != null) contactsData.clear();
            // 生成动态数组，加入数据
            contactsData = new ArrayList<HashMap<String, Object>>();
            for (int i = 0; i < PrivateRuleSetting.pContactsList.size(); i++) {
                HashMap<String, Object> map = new HashMap<String, Object>();
                map.put("nicename", PrivateRuleSetting.pContactsList.get(i).niceName);
                map.put("attr", "(" + ss[PrivateRuleSetting.pContactsList.get(i).type] + ")");
                map.put("phone", PrivateRuleSetting.pContactsList.get(i).pNumber);
                contactsData.add(map);
            }
            // 生成适配器的Item和动态数组对应的元素
            contactsAdapter = new SimpleAdapter(this, contactsData,// 数据源
                    biz.AR.layout.private_contacts_activity_listitem,// ListItem的XML实现
                    // 动态数组与ImageItem对应的子项
                    new String[] { "nicename", "attr", "phone" },
                    // ImageItem的XML文件里面的一个ImageView,两个TextView ID
                    new int[] { biz.AR.id.private_contacts_white_listitem_nicename_txt, biz.AR.id.private_contacts_white_listitem_type_txt, biz.AR.id.private_contacts_listitem_phone_txt });
            // 添加并且显示
            contactsListView.setAdapter(contactsAdapter);
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        }
    }
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        switch (requestCode) {
            case RequestCode_SMSRing:// 隐私短信铃声
            {
                try {
                    if (resultCode != RESULT_OK) return;
                    Uri uri = data.getParcelableExtra(RingtoneManager.EXTRA_RINGTONE_PICKED_URI);
                    PrivateRuleSetting.smsNotify_Ring = uri.toString();
                    isChangedRuleSetting = true;
                } catch (Throwable e) {
                    Logger.error(e);
                }
            }
        }
    }
    @Override
    protected Dialog onCreateDialog(int id) {
        dialog = null;
        switch (id) {
            case 1: {
                AlertDialog.Builder builder = new AlertDialog.Builder(this);
                builder.setTitle("添加私密联系人");
                final String[] op = new String[4];
                op[0] = "手动添加";
                op[1] = "从联系人中导入";
                op[2] = "从通话记录中导入";
                op[3] = "从短信中导入";
                builder.setItems(op, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int which) {
                        switch (which) {
                            case 0:// "手动添加";
                            {
                                Private_AddEditContacts_Activity.isEdit = false;
                                Intent intent = new Intent(s_tabsActivity, Private_AddEditContacts_Activity.class);
                                startActivity(intent);
                            }
                                break;
                            case 1:// "从联系人中导入";
                            {
                                showDialog(2);
                            }
                                break;
                            case 2:// "从通话记录中导入";
                            {
                                showDialog(3);
                            }
                                break;
                            case 3:// "从短信中导入";
                            {
                                showDialog(4);
                            }
                                break;
                        }
                    }
                });
                dialog = builder.create();
            }
                break;
            case 2: {
                selectedInfo.clear();
                selectedname.clear();
                selectedpnumber.clear();
                DatabaseAdapter da = DatabaseAdapter.getInstance(this);
                ArrayList<NormalContacts> contacts = da.readContacts();
                selected = new boolean[contacts.size()];
                int i = 0;
                for (NormalContacts one : contacts) {
                    selected[i++] = false;
                    selectedInfo.add(one.niceName.trim() + "\n" + one.pNumber);
                    selectedname.add(one.niceName);
                    selectedpnumber.add(one.pNumber);
                }
                AlertDialog.Builder builder = new AlertDialog.Builder(this);
                builder.setTitle("从联系人中导入私密联系人");
                DialogInterface.OnMultiChoiceClickListener mutiListener = new DialogInterface.OnMultiChoiceClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int which, boolean isChecked) {
                        selected[which] = isChecked;
                    }
                };
                builder.setMultiChoiceItems(selectedInfo.toArray(new String[selectedInfo.size()]), selected, mutiListener);
                DialogInterface.OnClickListener btnListener = new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int which) {
                        addTo();
                    }
                };
                builder.setPositiveButton("确定", btnListener);
                dialog = builder.create();
            }
                break;
            case 3: {
                selectedInfo.clear();
                selectedname.clear();
                selectedpnumber.clear();
                ContentResolver cr = getContentResolver();
                Cursor cursor = null;
                try {
                    cursor = cr.query(CallLog.Calls.CONTENT_URI, new String[] { CallLog.Calls.NUMBER, CallLog.Calls.CACHED_NAME, CallLog.Calls.TYPE, CallLog.Calls.DATE }, null, null, CallLog.Calls.DEFAULT_SORT_ORDER);
                    while (cursor != null && cursor.moveToNext()) {
                        SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                        Date date = new Date(Long.parseLong(cursor.getString(3)));
                        if (cursor.getString(1) != null) {
                            selectedInfo.add(cursor.getString(1) + " " + cursor.getString(0) + "\n" + sfd.format(date));
                            selectedname.add(cursor.getString(1));
                            selectedpnumber.add(cursor.getString(0));
                        } else {
                            selectedInfo.add(cursor.getString(0) + "\n" + sfd.format(date));
                            selectedname.add("");
                            selectedpnumber.add(cursor.getString(0));
                        }
                    }
                } catch (Throwable e) {
                    // TODO Auto-generated catch block
                    Logger.error(e);
                } finally {
                    if (cursor != null) cursor.close();
                }
                selected = new boolean[selectedInfo.size()];
                AlertDialog.Builder builder = new AlertDialog.Builder(this);
                builder.setTitle("从通话记录中导入私密联系人");
                DialogInterface.OnMultiChoiceClickListener mutiListener = new DialogInterface.OnMultiChoiceClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int which, boolean isChecked) {
                        selected[which] = isChecked;
                    }
                };
                builder.setMultiChoiceItems(selectedInfo.toArray(new String[selectedInfo.size()]), selected, mutiListener);
                DialogInterface.OnClickListener btnListener = new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int which) {
                        addTo();
                    }
                };
                builder.setPositiveButton("确定", btnListener);
                dialog = builder.create();
            }
                break;
            case 4: {
                selectedInfo.clear();
                selectedname.clear();
                selectedpnumber.clear();
                Cursor cursor = null;
                try {
                    cursor = getContentResolver().query(Uri.parse("content://sms/inbox"), new String[] { "_id", "thread_id", "address", "read", "person", "date", "body" }, null, null, "date desc");
                    while (cursor != null && cursor.moveToNext()) {
                        if (cursor.getString(4) != null) {
                            selectedInfo.add(cursor.getString(4) + " " + cursor.getString(2) + "\n" + cursor.getString(6) + "\n" + MessageUtils.getDateFormat(cursor.getString(5)));
                            selectedname.add(cursor.getString(4));
                            selectedpnumber.add(cursor.getString(2));
                        } else {
                            selectedInfo.add(cursor.getString(2) + "\n" + cursor.getString(6) + "\n" + MessageUtils.getDateFormat(cursor.getString(5)));
                            selectedname.add("");
                            selectedpnumber.add(cursor.getString(2));
                        }
                    }
                } catch (Throwable e) {
                    // TODO Auto-generated catch block
                    Logger.error(e);
                } finally {
                    if (cursor != null) cursor.close();
                }
                // ///////////////////
                selected = new boolean[selectedInfo.size()];
                AlertDialog.Builder builder = new AlertDialog.Builder(this);
                builder.setTitle("从短信中导入私密联系人");
                DialogInterface.OnMultiChoiceClickListener mutiListener = new DialogInterface.OnMultiChoiceClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int which, boolean isChecked) {
                        selected[which] = isChecked;
                    }
                };
                builder.setMultiChoiceItems(selectedInfo.toArray(new String[selectedInfo.size()]), selected, mutiListener);
                DialogInterface.OnClickListener btnListener = new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int which) {
                        addTo();
                    }
                };
                builder.setPositiveButton("确定", btnListener);
                dialog = builder.create();
            }
                break;
        }
        return dialog;
    }
    @Override
    protected void onPrepareDialog(int id, Dialog dialog) {
        if (id < 10) {
            removeDialog(id);
        }
        super.onPrepareDialog(id, dialog);
    }
    private void addTo() {
        boolean add = false;
        for (Boolean one : selected) {
            if (one) {
                add = true;
                break;
            }
        }
        if (!add) return;
        DatabaseAdapter dAdapter = DatabaseAdapter.getInstance(this);
        String pNumber = "", niceName = "";
        for (int i = 0; i < selected.length; i++) {
            if (!selected[i]) continue;
            niceName = selectedname.get(i);
            pNumber = selectedpnumber.get(i);
            dAdapter.addOnePrivateList(pNumber, niceName, 0);
        }
        refreshContactsData();
    }
    // Menu菜单,在按MENU键时调用
    @Override
    public boolean onPrepareOptionsMenu(Menu menu) {
        // TODO Auto-generated method stub
        super.onPrepareOptionsMenu(menu);
        hiddenAllMenu(menu);
        if (currentTabID == 0) {
            menu.findItem(SMS_MENU_INDEX + 1).setVisible(true);
            menu.findItem(SMS_MENU_INDEX + 2).setVisible(true);
            menu.findItem(SMS_MENU_INDEX + 3).setVisible(true);
        } else if (currentTabID == 1) {
            menu.findItem(PHONE_MENU_INDEX + 1).setVisible(true);
            menu.findItem(PHONE_MENU_INDEX + 2).setVisible(true);
        }
        return true;
    }
    private void hiddenAllMenu(Menu menu) {
        menu.findItem(SMS_MENU_INDEX + 1).setVisible(false);
        menu.findItem(SMS_MENU_INDEX + 2).setVisible(false);
        menu.findItem(SMS_MENU_INDEX + 3).setVisible(false);
        menu.findItem(PHONE_MENU_INDEX + 1).setVisible(false);
        menu.findItem(PHONE_MENU_INDEX + 2).setVisible(false);
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        super.onCreateOptionsMenu(menu);
        menu.add(1, SMS_MENU_INDEX + 1, 1, "删除").setIcon(biz.AR.drawable.delete);
        menu.add(1, SMS_MENU_INDEX + 2, 2, "恢复").setIcon(biz.AR.drawable.recover);
        menu.add(1, SMS_MENU_INDEX + 3, 3, "标记为已读").setIcon(biz.AR.drawable.mark_read);
        menu.add(1, PHONE_MENU_INDEX + 1, 1, "删除").setIcon(biz.AR.drawable.delete);
        menu.add(1, PHONE_MENU_INDEX + 2, 2, "标记为已读").setIcon(biz.AR.drawable.mark_read);
        return true;
    }
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case SMS_MENU_INDEX + 1: {
                Intent intent = new Intent(s_tabsActivity, Private_SMSDel_Activity.class);
                startActivity(intent);
            }
                break;
            case SMS_MENU_INDEX + 2: {
                Intent intent = new Intent(s_tabsActivity, Private_SMSRecover_Activity.class);
                startActivity(intent);
            }
                break;
            case SMS_MENU_INDEX + 3: {
                DatabaseAdapter da = DatabaseAdapter.getInstance(this);
                da.flagReadfor_PrivateSMS(-1);
                refreshSMSData();
            }
                break;
            case PHONE_MENU_INDEX + 1:// menu.add(1, 1, 1, "删除")
            {
                Intent intent = new Intent(s_tabsActivity, Private_PhoneDel_Activity.class);
                startActivity(intent);
            }
                break;
            case PHONE_MENU_INDEX + 2:// menu.add(1, 2, 2, "标记为已读"
            {
                DatabaseAdapter da = DatabaseAdapter.getInstance(this);
                da.flagReadfor_PrivatePhone(-1);
                refreshPhoneData();
            }
                break;
            default:
                return super.onOptionsItemSelected(item);
        }
        return true;
    }
    @Override
    public boolean onContextItemSelected(MenuItem item) {
        try {
            switch (item.getItemId()) {
                case SMS_MENU_INDEX + 1:// menu.add(1,1,1,"呼叫联系人");
                {
                    int selectedPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    Intent intent = new Intent(Intent.ACTION_CALL, Uri.parse("tel:" + bSMSSessionList.get(selectedPosition).pNumber));
                    startActivity(intent);
                }
                    break;
                case SMS_MENU_INDEX + 2:// menu.add(1, 2, 2, "删除此号码短信(永久)");
                {
                    smsDelsmsPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    AlertDialog.Builder builder = new AlertDialog.Builder(this).setIcon(biz.AR.drawable.icon).setTitle("提示");
                    builder.setMessage("你确认要删除该号码短信吗?").setCancelable(false).setPositiveButton("确定", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int id) {
                            DatabaseAdapter d = DatabaseAdapter.getInstance(s_tabsActivity);
                            d.delPrivateSMS(bSMSSessionList.get(smsDelsmsPosition).pNumber);
                            refreshSMSData();
                        }
                    }).setNegativeButton("取消", null);
                    AlertDialog alert = builder.create();
                    alert.show();
                }
                    break;
                case SMS_MENU_INDEX + 3:// menu.add(1, 3, 3, "删除此号码短信(到回收站)");
                {
                    smsDelsmsPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    DatabaseAdapter d = DatabaseAdapter.getInstance(s_tabsActivity);
                    d.movePrivateSMS_toTrash(bSMSSessionList.get(smsDelsmsPosition).pNumber);
                    refreshSMSData();
                }
                    break;
                case SMS_MENU_INDEX + 4:// menu.add(1, 4, 4, "移动到我的收藏夹");
                {
                    smsDelsmsPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    DatabaseAdapter d = DatabaseAdapter.getInstance(s_tabsActivity);
                    d.movePrivateSMS_toFavorite(bSMSSessionList.get(smsDelsmsPosition).pNumber);
                    refreshSMSData();
                }
                    break;
                case SMS_MENU_INDEX + 5:// menu.add(1,3,3,"将号码添加到");
                {
                    int selectedPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    Block_AddTo_Activity.pNumber = bSMSSessionList.get(selectedPosition).pNumber;
                    Intent intent = new Intent(s_tabsActivity, Block_AddTo_Activity.class);
                    startActivity(intent);
                }
                    break;
                case SMS_MENU_INDEX + 6://menu.add(1, 6, 6, "恢复此号码短信到收件箱");
                {
                    DatabaseAdapter d = DatabaseAdapter.getInstance(this);
                    ContentValues cv = new ContentValues();
                    int selectedPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    ArrayList<PrivateSMS> oneSession = d.readPrivateSMSSession(bSMSSessionList.get(selectedPosition).pNumber);
                    for (PrivateSMS one : oneSession) {
                        cv.put("address", one.address);
                        cv.put("read", one.read ? 1 : 0);
                        cv.put("type", one.type ? 1 : 2);
                        cv.put("status", one.status);
                        cv.put("date", one.cDate);
                        cv.put("body", one.body);
                        getContentResolver().insert(Uri.parse("content://sms"), cv);
                        d.delPrivateSMS(bSMSSessionList.get(selectedPosition).pNumber);
                        refreshSMSData();
                    }
                }
                    break;
                case PHONE_MENU_INDEX + 1:// menu.add(1, 1, 2, "回复短信")
                {
                    int selectedPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    Intent smsIntent = new Intent(Intent.ACTION_SENDTO, Uri.parse("smsto:" + privatePhones.get(selectedPosition).pNumber));
                    startActivity(smsIntent);
                }
                    break;
                case PHONE_MENU_INDEX + 2:// menu.add(1, 2, 3, "呼叫");
                {
                    int selectedPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    Intent intent = new Intent(Intent.ACTION_CALL, Uri.parse("tel:" + privatePhones.get(selectedPosition).pNumber));
                    startActivity(intent);
                }
                    break;
                case PHONE_MENU_INDEX + 3:// menu.add(1, 3, 4, "删除");
                {
                    phoneDelphonePosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    AlertDialog.Builder builder = new AlertDialog.Builder(this).setIcon(biz.AR.drawable.icon).setTitle("提示");
                    builder.setMessage("你确认要删除该来电记录吗?").setCancelable(false).setPositiveButton("确定", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int id) {
                            DatabaseAdapter d = DatabaseAdapter.getInstance(s_tabsActivity);
                            d.delPrivatePhone(privatePhones.get(phoneDelphonePosition).id);
                            refreshPhoneData();
                        }
                    }).setNegativeButton("取消", null);
                    AlertDialog alert = builder.create();
                    alert.show();
                }
                    break;
                case PHONE_MENU_INDEX + 4:// menu.add(1, 4, 5, "将号码添加到");*/
                {
                    int selectedPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    Block_AddTo_Activity.pNumber = privatePhones.get(selectedPosition).pNumber;
                    Intent intent = new Intent(s_tabsActivity, Block_AddTo_Activity.class);
                    startActivity(intent);
                }
                    break;
                case CONTACTS_MENU_INDEX + 1:// 修改
                {
                    int sPos = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    Private_AddEditContacts_Activity.isEdit = true;
                    Private_AddEditContacts_Activity.pNumber = PrivateRuleSetting.pContactsList.get(sPos).pNumber;
                    Private_AddEditContacts_Activity.niceName = PrivateRuleSetting.pContactsList.get(sPos).niceName;
                    Intent intent = new Intent(s_tabsActivity, Private_AddEditContacts_Activity.class);
                    startActivity(intent);
                }
                    break;
                case CONTACTS_MENU_INDEX + 2:// 发短信
                {
                    int sPos = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    //Intent smsIntent = new Intent(Intent.ACTION_SENDTO, Uri.parse("smsto:"
                    //		+ PrivateRuleSetting.pContactsList.get(sPos).pNumber));
                    //startActivity(smsIntent);
                    SMSSession_Activity.smsSession.pNumber = PrivateRuleSetting.pContactsList.get(sPos).pNumber;
                    SMSSession_Activity.smsSession.niceName = PrivateRuleSetting.pContactsList.get(sPos).niceName;
                    SMSSession_Activity.smsSession.type = 2;
                    Intent smsIntent = new Intent(this, SMSSession_Activity.class);
                    startActivity(smsIntent);
                }
                    break;
                case CONTACTS_MENU_INDEX + 3:// 电话呼叫
                {
                    int sPos = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    Intent intent = new Intent(Intent.ACTION_CALL, Uri.parse("tel:" + PrivateRuleSetting.pContactsList.get(sPos).pNumber));
                    startActivity(intent);
                }
                    break;
                case CONTACTS_MENU_INDEX + 4:// 删除
                {
                    delcontactsListPos = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    AlertDialog.Builder builder = new AlertDialog.Builder(this).setIcon(biz.AR.drawable.icon).setTitle("提示");
                    builder.setMessage("你确认要删除该私密联系人吗?").setCancelable(false).setPositiveButton("确定", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int id) {
                            DatabaseAdapter d = DatabaseAdapter.getInstance(s_tabsActivity);
                            d.delOnePrivateContact(PrivateRuleSetting.pContactsList.get(delcontactsListPos).pNumber);
                            refreshContactsData();
                        }
                    }).setNegativeButton("取消", null);
                    AlertDialog alert = builder.create();
                    alert.show();
                }
                    break;
            }
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        }
        super.onContextItemSelected(item);
        return true;
    }
    public class SettingOnClickListener implements View.OnClickListener {
        View view = listViews.get(3);
        @Override
        public void onClick(View v) {
            switch (v.getId()) {
                case biz.AR.id.private_setting_newNotify_layout: {
                    CheckBox cBox = (CheckBox) view.findViewById(biz.AR.id.private_setting_newNotify_cbox);
                    cBox.setChecked(!cBox.isChecked());
                    PrivateRuleSetting.new_notication = cBox.isChecked();
                    isChangedRuleSetting = true;
                }
                    break;
                case biz.AR.id.private_setting_newNotifvibrate_layout: {
                    CheckBox cBox = (CheckBox) view.findViewById(biz.AR.id.private_setting_newNotifvibrate_cbox);
                    cBox.setChecked(!cBox.isChecked());
                    PrivateRuleSetting.new_vibrate = cBox.isChecked();
                    isChangedRuleSetting = true;
                }
                    break;
                case biz.AR.id.private_setting_callautoReturn_layout: {
                    CheckBox cBox = (CheckBox) view.findViewById(biz.AR.id.private_setting_callautoReturn_cbox);
                    cBox.setChecked(!cBox.isChecked());
                    PrivateRuleSetting.autoreturn = cBox.isChecked();
                    isChangedRuleSetting = true;
                }
                    break;
                case biz.AR.id.private_setting_SMS_layout: {
                    Intent intent = new Intent(s_tabsActivity, Private_SetReply_Activity.class);
                    startActivity(intent);
                }
                    break;
                case biz.AR.id.private_setting_pwd_layout: {
                    Intent intent = new Intent(s_tabsActivity, Private_modifyPassword_Activity.class);
                    startActivity(intent);
                }
                    break;
                case biz.AR.id.private_setting_title_layout: {
                    Intent intent = new Intent(s_tabsActivity, Private_Setting_Title_Activity.class);
                    startActivity(intent);
                }
                    break;
                case biz.AR.id.private_setting_smsRing_layout: {
                    Intent intent = new Intent(RingtoneManager.ACTION_RINGTONE_PICKER);
                    intent.putExtra(RingtoneManager.EXTRA_RINGTONE_TYPE, RingtoneManager.TYPE_NOTIFICATION);
                    intent.putExtra(RingtoneManager.EXTRA_RINGTONE_TITLE, "设置隐私短信通知铃声");
                    startActivityForResult(intent, RequestCode_SMSRing);
                }
                    break;
                case biz.AR.id.private_setting_smsNotificon_layout: {
                    Intent intent = new Intent(s_tabsActivity, Private_SetSMSNotificon_Activity.class);
                    startActivity(intent);
                    //showDialog(SMSNOTIFICON_DIALOG);
                }
                    break;
                case biz.AR.id.private_setting_callNotificon_layout: {
                    Intent intent = new Intent(s_tabsActivity, Private_SetPhoneNotificon_Activity.class);
                    startActivity(intent);
                    //showDialog(CALLNOTIFICON_DIALOG);
                }
                    break;
                case biz.AR.id.private_setting_Notifwords_layout: {
                    Intent intent = new Intent(s_tabsActivity, Private_setNotiwords_Activity.class);
                    startActivity(intent);
                }
                    break;
            }
        }
    };
    public class DateComparator implements Comparator<Object> {
        @Override
        public int compare(Object object1, Object object2) {
            // TODO Auto-generated method stub
            PrivateSMSSession one = (PrivateSMSSession) object1;
            PrivateSMSSession two = (PrivateSMSSession) object2;
            long date1 = 0, date2 = 0;
            try {
                date1 = Long.parseLong(one.lastcreateDate);
                date2 = Long.parseLong(two.lastcreateDate);
            } catch (Throwable e) {}
            if (date1 > date2) return -1;
            else if (date1 < date2) return 1;
            else return 0;
        }
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
    /**
     * 页卡切换监听
     */
    public class MyOnPageChangeListener implements OnPageChangeListener {
        @Override
        public void onPageSelected(int arg0) {
            switch (arg0) {
                case 0:
                    ((ImageView) findViewById(biz.AR.id.private_main_bar_img)).setBackgroundResource(biz.AR.drawable.tab_tag_1);
                    break;
                case 1:
                    ((ImageView) findViewById(biz.AR.id.private_main_bar_img)).setBackgroundResource(biz.AR.drawable.tab_tag_2);
                    break;
                case 2:
                    ((ImageView) findViewById(biz.AR.id.private_main_bar_img)).setBackgroundResource(biz.AR.drawable.tab_tag_3);
                    break;
                case 3:
                    ((ImageView) findViewById(biz.AR.id.private_main_bar_img)).setBackgroundResource(biz.AR.drawable.tab_tag_4);
                    break;
            }
            img[arg0].setChecked(true);
            currentTabID = arg0;
        }
        @Override
        public void onPageScrolled(int arg0, float arg1, int arg2) {}
        @Override
        public void onPageScrollStateChanged(int arg0) {}
    }
    class InboxAdapter extends BaseAdapter {
        Context mcontext;
        public InboxAdapter(Context context) {
            mcontext = context;
        }
        @Override
        public int getCount() {
            return smsMyData.size();
        }
        @Override
        public Object getItem(int position) {
            return smsMyData.get(position);
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
                convertView = mInflater.inflate(biz.AR.layout.private_sms_activity_listview_item, parent, false);
                holder = new InboxVuewHolder();
                holder.threadId = (TextView) convertView.findViewById(biz.AR.id.private_sms_listview_item_id_txt);
                holder.img = (ImageView) convertView.findViewById(biz.AR.id.private_sms_listview_item_img);
                holder.phone = (TextView) convertView.findViewById(biz.AR.id.private_sms_listview_item_Phone_txt);
                holder.msg = (TextView) convertView.findViewById(biz.AR.id.private_sms_listview_item_Msg_txt);
                holder.date = (TextView) convertView.findViewById(biz.AR.id.private_sms_listview_item_Msg_date);
                convertView.setTag(holder);
            } else {
                holder = (InboxVuewHolder) convertView.getTag();
            }
            holder.threadId.setText(String.valueOf(smsMyData.get(position).get("pNumber")));
            holder.img.setImageResource(Integer.parseInt(String.valueOf(smsMyData.get(position).get("ItemImage"))));
            holder.phone.setText(String.valueOf(smsMyData.get(position).get("ItemPhone")));
            holder.msg.setText(Html.fromHtml(MessageUtils.explain(String.valueOf(smsMyData.get(position).get("ItemMsg"))), imageGetter, null));
            holder.date.setText(MessageUtils.getDateFormat(String.valueOf(smsMyData.get(position).get("ItemDate"))));
            return convertView;
        }
    }
    static class InboxVuewHolder {
        private TextView threadId;
        private ImageView img;
        private TextView phone;
        private TextView msg;
        private TextView date;
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
}
