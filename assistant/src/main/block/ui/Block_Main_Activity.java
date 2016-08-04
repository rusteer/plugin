package main.block.ui;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import main.block.Blacklist;
import main.block.BlockPhone;
import main.block.BlockRuleSetting;
import main.block.BlockSMS;
import main.block.BlockSMSSession;
import main.block.BlockbgService;
import main.block.NormalContacts;
import main.block.Whitelist;
import main.database.DatabaseAdapter;
import main.message.MessageUtils;
import main.ui.Global_Var;
import main.ui.SMSSession_Activity;
import net.workspace.util.Logger;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.app.TimePickerDialog;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.net.ParseException;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Message;
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
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.RadioButton;
import android.widget.RelativeLayout;
import android.widget.SimpleAdapter;
import android.widget.TextView;
import android.widget.TimePicker;
import android.widget.Toast;

public class Block_Main_Activity extends Activity {
    private ViewPager mPager;//页卡内容
    private List<View> listViews; // Tab页面列表
    public static Activity s_tabsActivity;
    private RadioButton[] img = new RadioButton[4];
    public static int tabIndex = 0;
    /** 记录当前分页ID */
    private int currentTabID = 0;
    /** Block_SMS_Activity */
    DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault());
    private ArrayList<BlockSMSSession> bSMSSessionList = new ArrayList<BlockSMSSession>();
    private int blockSMSTotalCount = 0;
    private BaseAdapter smsMySimperAdapter;
    private ArrayList<HashMap<String, Object>> smsMyData = new ArrayList<HashMap<String, Object>>();;
    private ListView smsLView;
    private TextView smsTView;
    private TextView smsMView;
    private int smsDelsmsPosition = 0;
    private final int SMS_MENU_INDEX = 20;
    /** Block_Phone_Activity */
    private ArrayList<BlockPhone> blockPhones = new ArrayList<BlockPhone>();
    private SimpleAdapter phoineMySimperAdapter;
    private ArrayList<HashMap<String, Object>> phoneMyData = new ArrayList<HashMap<String, Object>>();;
    private ListView phoneLView;
    private TextView phoneTView;
    private TextView phoneMView;
    private int phoneDelphonePosition = 0;
    private final int PHONE_MENU_INDEX = 40;
    /**Block_BlackWhiteList_Activity*/
    private SimpleAdapter blackAdapter;
    private SimpleAdapter whiteAdapter;
    private ArrayList<HashMap<String, Object>> myblackData = new ArrayList<HashMap<String, Object>>();;
    private ArrayList<HashMap<String, Object>> mywhiteData = new ArrayList<HashMap<String, Object>>();;
    private ListView blackListView;
    private ListView whiteListView;
    private int delBlackListPos = 0;
    private int delWhiteListPos = 0;
    private boolean[] selected;
    private ArrayList<String> selectedInfo = new ArrayList<String>();
    private ArrayList<String> selectedname = new ArrayList<String>();
    private ArrayList<String> selectedpnumber = new ArrayList<String>();
    private boolean isAddBlackList = false;
    ArrayList<Whitelist> whiteLists = new ArrayList<Whitelist>();
    ArrayList<Blacklist> blacklists = new ArrayList<Blacklist>();
    private final int BLACK_MENU_INDEX = 60;
    /**Block_Setting_Activity*/
    private boolean isChangedRuleSetting = false;
    private boolean curr_choice_startTime = true;
    private SetOnClickListener setOnClickListener;
    private final int SETTING_REQUEST_CODE = 1121;
    private static ProgressDialog m_Dialog;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        try {
            super.onCreate(savedInstanceState);
            requestWindowFeature(Window.FEATURE_NO_TITLE);
            setContentView(biz.AR.layout.block_main_activity);
            LinearLayout main = (LinearLayout) findViewById(biz.AR.id.block_main_layout);
            main.setBackgroundResource(Global_Var.mainBG_Imges[Global_Var.currMainBGIndex]);
            s_tabsActivity = this;
            initViewPage();
            initSMSView(listViews.get(0));
            initPhoneView(listViews.get(1));
            initBlackView(listViews.get(2));
            update_setting(listViews.get(3));
        } catch (Throwable e) {
            Logger.error(e);
        }
    }
    @Override
    protected void onResume() {
        refreshSMSData();
        refreshPhoneData();
        refreshBlackData();
        super.onResume();
    }
    private void initViewPage() {
        mPager = (ViewPager) findViewById(biz.AR.id.vPager1);
        listViews = new ArrayList<View>();
        LayoutInflater mInflater = getLayoutInflater();
        listViews.add(mInflater.inflate(biz.AR.layout.block_sms_activity, null));
        listViews.add(mInflater.inflate(biz.AR.layout.block_phone_activity, null));
        listViews.add(mInflater.inflate(biz.AR.layout.block_blackwhitelist_activity, null));
        listViews.add(mInflater.inflate(biz.AR.layout.block_setting_activity, null));
        mPager.setAdapter(new MyPagerAdapter(listViews));
        img[0] = (RadioButton) findViewById(biz.AR.id.block_main_img1);
        img[1] = (RadioButton) findViewById(biz.AR.id.block_main_img2);
        img[2] = (RadioButton) findViewById(biz.AR.id.block_main_img3);
        img[3] = (RadioButton) findViewById(biz.AR.id.block_main_img4);
        ((ImageView) findViewById(biz.AR.id.block_main_bar_img)).setBackgroundResource(biz.AR.drawable.tab_tag_1);
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
                Block_Main_Activity.this.finish();
            }
        });
        smsLView = (ListView) view.findViewById(biz.AR.id.block_sms_listView);
        smsMView = (TextView) view.findViewById(biz.AR.id.block_sms_model_txt);
        smsTView = (TextView) view.findViewById(biz.AR.id.block_sms_total_txt);
        smsLView.setOnItemClickListener(new OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                try {
                    @SuppressWarnings("unchecked")
                    HashMap<String, Object> c = (HashMap<String, Object>) smsMySimperAdapter.getItem(position);
                    int ItemImageid = ((Integer) c.get("ItemImage")).intValue();
                    if (ItemImageid == biz.AR.drawable.block_smsunread) {
                        String pNumber = c.get("pNumber").toString();
                        DatabaseAdapter dAdapter = DatabaseAdapter.getInstance(s_tabsActivity);
                        dAdapter.flagReadfor_BlockSMS(pNumber);
                        refreshSMSData();
                        refreshNotify();
                    }
                    SMSSession_Activity.smsSession.pNumber = bSMSSessionList.get(position).pNumber;
                    SMSSession_Activity.smsSession.niceName = bSMSSessionList.get(position).nickname;
                    SMSSession_Activity.smsSession.mproperty = bSMSSessionList.get(position).mproperty;
                    SMSSession_Activity.smsSession.type = 1;
                    Intent smsIntent = new Intent(s_tabsActivity, SMSSession_Activity.class);
                    startActivity(smsIntent);
                } catch (Throwable e) {
                    Logger.error(e);
                }
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
    /**
     * 通知更新
     */
    private void refreshNotify() {
        try {
            Message msg = BlockbgService.handler.obtainMessage();
            msg.what = 5;
            BlockbgService.handler.sendMessage(msg);
        } catch (Throwable e) {
            Logger.error(e);
        }
    }
    private void getBlockSMSSessionList() {
        bSMSSessionList.clear();
        DatabaseAdapter da = DatabaseAdapter.getInstance(this);
        ArrayList<BlockSMS> blockSMSs = da.readBlockSMSs();
        blockSMSTotalCount = blockSMSs.size();
        if (blockSMSTotalCount <= 0) return;
        BlockSMSSession bSmsSession = new BlockSMSSession();
        bSmsSession.pNumber = "@";
        for (BlockSMS one : blockSMSs) {
            if (bSmsSession.pNumber.equals(one.address))// 同一session,统计数量
            {
                bSmsSession.count++;
            } else {
                if (!bSmsSession.pNumber.equals("@"))// 到下一个session需要保存数据
                {
                    bSMSSessionList.add(bSmsSession);
                    bSmsSession = new BlockSMSSession();
                    bSmsSession.pNumber = "@";
                }
                bSmsSession.pNumber = one.address;
                bSmsSession.lastMsg = one.body;
                bSmsSession.lastcreateDate = one.cDate;
                bSmsSession.lastID = one.id;
                bSmsSession.mproperty = one.mproperty;
                StringBuffer niceName = new StringBuffer();
                if (da.searchContact(bSmsSession.pNumber, niceName)) bSmsSession.nickname = niceName.toString();
                niceName = null;
                if (!one.read) bSmsSession.unReadCount++;
                bSmsSession.count = 1;
            }
        }
        if (!bSmsSession.pNumber.equals("@")) bSMSSessionList.add(bSmsSession);
    }
    private void refreshSMSData() {
        new AsyncTask<Void, Void, Void>() {
            @Override
            protected Void doInBackground(Void... arg0) {
                try {
                    getBlockSMSSessionList();
                    DateComparator comp = new DateComparator();
                    Collections.sort(bSMSSessionList, comp);
                    smsMyData.clear();
                    // 生成动态数组，加入数据
                    for (BlockSMSSession one : bSMSSessionList) {
                        HashMap<String, Object> map = new HashMap<String, Object>();
                        if (one.unReadCount > 0) map.put("ItemImage", biz.AR.drawable.block_smsunread);
                        else map.put("ItemImage", biz.AR.drawable.block_smsread);
                        map.put("pNumber", one.pNumber);
                        map.put("ItemPhone", one.pNumber + "(" + one.count + ")" + one.mproperty);
                        // ////////////
                        String dString = one.lastcreateDate;
                        // /////////////
                        map.put("ItemMsg", one.lastMsg);
                        map.put("ItemDate", dString);
                        smsMyData.add(map);
                    }
                } catch (Throwable e) {
                    Logger.error(e);
                }
                return null;
            }
            @Override
            protected void onPostExecute(Void result) {
                // 生成适配器的Item和动态数组对应的元素
                smsMySimperAdapter = new InboxAdapter(Block_Main_Activity.this);
                // 添加并且显示
                smsLView.setAdapter(smsMySimperAdapter);
                refreshSMSUI();
                refreshNotify();
                if (m_Dialog != null && m_Dialog.isShowing() && !isFinishing()) m_Dialog.dismiss();
            }
            @Override
            protected void onPreExecute() {
                if ((m_Dialog == null || !m_Dialog.isShowing()) && !isFinishing()) m_Dialog = ProgressDialog.show(Block_Main_Activity.this, "请等待...", "正在动态加载数据，请稍后...", true);
                super.onPreExecute();
            }
        }.execute();
    }
    /**
     * 统计拦截短信数据
     */
    private void refreshSMSUI() {
        String[] a = getResources().getStringArray(biz.AR.array.entries_block_call_rule);
        smsMView.setText("当前模式:" + a[BlockRuleSetting.mode]);
        smsTView.setText("最近拦截短信" + blockSMSTotalCount + "条");
    }
    private void initPhoneView(View view) {
        ImageView back = (ImageView) view.findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                Block_Main_Activity.this.finish();
            }
        });
        phoneLView = (ListView) view.findViewById(biz.AR.id.block_phone_listView);
        phoneMView = (TextView) view.findViewById(biz.AR.id.block_phone_model_txt);
        phoneTView = (TextView) view.findViewById(biz.AR.id.block_phone_total_txt);
        phoneLView.setOnItemClickListener(new OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                try {
                    @SuppressWarnings("unchecked")
                    HashMap<String, Object> c = (HashMap<String, Object>) phoineMySimperAdapter.getItem(position);
                    int ItemImageid = ((Integer) c.get("ItemImage")).intValue();
                    if (ItemImageid == biz.AR.drawable.callunread) {
                        int blockphone_id = ((Integer) c.get("blockphone_id")).intValue();
                        DatabaseAdapter dAdapter = DatabaseAdapter.getInstance(s_tabsActivity);
                        dAdapter.flagReadfor_BlockPhone(blockphone_id);
                        refreshPhoneData();
                        phoineMySimperAdapter.notifyDataSetChanged();
                        refreshNotify();
                    }
                } catch (Throwable e) {
                    // TODO Auto-generated catch block
                    Logger.error(e);
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
        new AsyncTask<Void, Void, Void>() {
            @Override
            protected Void doInBackground(Void... arg0) {
                try {
                    DatabaseAdapter da = DatabaseAdapter.getInstance(Block_Main_Activity.this);
                    blockPhones.clear();
                    blockPhones = da.readBlockPhones();
                    phoneMyData.clear();
                    // 生成动态数组，加入数据
                    for (int i = 0; i < blockPhones.size(); i++) {
                        HashMap<String, Object> map = new HashMap<String, Object>();
                        if (blockPhones.get(i).readFlag) map.put("ItemImage", biz.AR.drawable.callread);
                        else map.put("ItemImage", biz.AR.drawable.callunread);
                        map.put("blockphone_id", blockPhones.get(i).id);
                        map.put("ItemName", blockPhones.get(i).pNumber);
                        map.put("ItemPhone", blockPhones.get(i).mproperty);
                        //////////////
                        String dString = "";
                        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault());
                        try {
                            Date date = sdf.parse(blockPhones.get(i).createDate);
                            dString = MessageUtils.getDateFormat(String.valueOf(date.getTime()));;
                        } catch (ParseException e) {
                            Logger.error(e);
                        }
                        ///////////////
                        map.put("ItemMsg", dString);
                        phoneMyData.add(map);
                    }
                } catch (Throwable e) {
                    Logger.error(e);
                }
                return null;
            }
            @Override
            protected void onPostExecute(Void result) {
                try {
                    // 生成适配器的Item和动态数组对应的元素
                    phoineMySimperAdapter = new SimpleAdapter(Block_Main_Activity.this, phoneMyData,// 数据源
                            biz.AR.layout.block_phone_activity_listview_item,// ListItem的XML实现
                            // 动态数组与ImageItem对应的子项
                            new String[] { "blockphone_id", "ItemImage", "ItemPhone", "ItemMsg", "ItemName" },
                            // ImageItem的XML文件里面的一个ImageView,两个TextView ID
                            new int[] { biz.AR.id.block_phone_listview_item_id_txt, biz.AR.id.block_phone_listview_item_readFlag_Img, biz.AR.id.block_phone_listview_item_Phone_txt, biz.AR.id.block_phone_listview_item_date_txt,
                                    biz.AR.id.block_phone_listview_item_Phone_name });
                    // 添加并且显示
                    phoneLView.setAdapter(phoineMySimperAdapter);
                    refreshPhoneUI();
                    if (m_Dialog != null && m_Dialog.isShowing() && !isFinishing()) m_Dialog.dismiss();
                } catch (Throwable e) {
                    // TODO Auto-generated catch block
                    Logger.error(e);
                }
            }
            @Override
            protected void onPreExecute() {
                if ((m_Dialog == null || !m_Dialog.isShowing()) && !isFinishing()) m_Dialog = ProgressDialog.show(Block_Main_Activity.this, "请等待...", "正在动态加载数据，请稍后...", true);
                super.onPreExecute();
            }
        }.execute();
    }
    /**
     * 统计拦截短信数据
     */
    private void refreshPhoneUI() {
        String[] a = getResources().getStringArray(biz.AR.array.entries_block_call_rule);
        phoneMView.setText("当前模式:" + a[BlockRuleSetting.mode]);
        phoneTView.setText("最近拦截电话" + blockPhones.size() + "个");
    }
    private void initBlackView(View view) {
        ImageView back = (ImageView) view.findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                Block_Main_Activity.this.finish();
            }
        });
        blackListView = (ListView) view.findViewById(biz.AR.id.block_blackwhitelist_black_listview);
        blackListView.setOnCreateContextMenuListener(new View.OnCreateContextMenuListener() {
            @Override
            public void onCreateContextMenu(ContextMenu menu, View v, ContextMenuInfo menuInfo) {
                menu.setHeaderTitle("黑名单操作选择");
                menu.add(1, BLACK_MENU_INDEX + 1, 1, "修改");
                menu.add(1, BLACK_MENU_INDEX + 2, 2, "发短信");
                menu.add(1, BLACK_MENU_INDEX + 3, 3, "电话呼叫");
                menu.add(1, BLACK_MENU_INDEX + 4, 4, "删除");
            }
        });
        whiteListView = (ListView) view.findViewById(biz.AR.id.block_blackwhitelist_white_listview);
        whiteListView.setOnCreateContextMenuListener(new View.OnCreateContextMenuListener() {
            @Override
            public void onCreateContextMenu(ContextMenu menu, View v, ContextMenuInfo menuInfo) {
                menu.setHeaderTitle("白名单操作选择");
                menu.add(2, BLACK_MENU_INDEX + 5, 1, "修改");
                menu.add(2, BLACK_MENU_INDEX + 6, 2, "发短信");
                menu.add(2, BLACK_MENU_INDEX + 7, 3, "电话呼叫");
                menu.add(2, BLACK_MENU_INDEX + 8, 4, "删除");
            }
        });
        setaddBlackList(view);
        setBlackclick(view);
    }
    /* 加载黑白名单listview显示数据
    */
    private void refreshBlackData() {
        new AsyncTask<Void, Void, Void>() {
            @Override
            protected Void doInBackground(Void... arg0) {
                try {
                    String[] ss = getResources().getStringArray(biz.AR.array.block_type);
                    DatabaseAdapter da = DatabaseAdapter.getInstance(Block_Main_Activity.this);
                    myblackData.clear();
                    blacklists.clear();
                    blacklists = da.readBlacklists();
                    // 生成动态数组，加入数据
                    for (Blacklist one : blacklists) {
                        HashMap<String, Object> map = new HashMap<String, Object>();
                        map.put("phone", one.pNumber);
                        map.put("nicename", one.niceName);
                        map.put("attr", "拦截：" + ss[one.type]);
                        myblackData.add(map);
                    }
                    // //////////////////////////////////////白名单处理
                    mywhiteData.clear();
                    whiteLists.clear();
                    whiteLists = da.readWhitelists();
                    // 生成动态数组，加入数据
                    for (Whitelist one : whiteLists) {
                        HashMap<String, Object> map = new HashMap<String, Object>();
                        map.put("phone", one.pNumber);
                        map.put("nicename", one.niceName);
                        mywhiteData.add(map);
                    }
                } catch (Throwable e) {
                    Logger.error(e);
                }
                return null;
            }
            @Override
            protected void onPostExecute(Void result) {
                try {
                    // 生成适配器的Item和动态数组对应的元素
                    blackAdapter = new SimpleAdapter(Block_Main_Activity.this, myblackData,// 数据源
                            biz.AR.layout.block_blackwhitelist_activity_black_listitem,// ListItem的XML实现
                            // 动态数组与ImageItem对应的子项
                            new String[] { "phone", "nicename", "attr" },
                            // ImageItem的XML文件里面的一个ImageView,两个TextView ID
                            new int[] { biz.AR.id.block_blackwhitelist_black_listitem_phone_txt, biz.AR.id.block_blackwhitelist_black_listitem_nicename_txt, biz.AR.id.block_blackwhitelist_black_listitem_attr_txt });
                    // 添加并且显示
                    blackListView.setAdapter(blackAdapter);
                    // 生成适配器的Item和动态数组对应的元素
                    whiteAdapter = new SimpleAdapter(Block_Main_Activity.this, mywhiteData,// 数据源
                            biz.AR.layout.block_blackwhitelist_activity_white_listitem,// ListItem的XML实现
                            // 动态数组与ImageItem对应的子项
                            new String[] { "phone", "nicename" },
                            // ImageItem的XML文件里面的一个ImageView,两个TextView ID
                            new int[] { biz.AR.id.block_blackwhitelist_white_listitem_phone_txt, biz.AR.id.block_blackwhitelist_white_listitem_nicename_txt });
                    // 添加并且显示
                    whiteListView.setAdapter(whiteAdapter);
                    if (m_Dialog != null && m_Dialog.isShowing() && !isFinishing()) m_Dialog.dismiss();
                } catch (Throwable e) {
                    // TODO Auto-generated catch block
                    Logger.error(e);
                }
            }
            @Override
            protected void onPreExecute() {
                if ((m_Dialog == null || !m_Dialog.isShowing()) && !isFinishing()) m_Dialog = ProgressDialog.show(Block_Main_Activity.this, "请等待...", "正在动态加载数据，请稍后...", true);
                super.onPreExecute();
            }
        }.execute();
    }
    /**
     * 设置添加黑白名单点击弹出菜单
     */
    private void setaddBlackList(View view) {
        LinearLayout layout = (LinearLayout) view.findViewById(biz.AR.id.block_blackwhitelist_black_add_layout);
        layout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                isAddBlackList = true;
                showDialog(1);
            }
        });
        layout = (LinearLayout) view.findViewById(biz.AR.id.block_blackwhitelist_white_add_layout);
        layout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                isAddBlackList = false;
                showDialog(1);
            }
        });
    }
    /**
     * 设置布局layout的点击显示与收缩
     */
    private void setBlackclick(final View view) {
        final RadioButton block_blackwhite_radio1 = (RadioButton) view.findViewById(biz.AR.id.block_blackwhite_radio1);
        block_blackwhite_radio1.setOnCheckedChangeListener(new OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton arg0, boolean arg1) {
                LinearLayout llayout = (LinearLayout) findViewById(biz.AR.id.block_blackwhitelist_black);
                if (arg1) {
                    block_blackwhite_radio1.setTextColor(Color.rgb(1, 111, 171));
                    llayout.setVisibility(View.VISIBLE);
                } else {
                    llayout.setVisibility(View.GONE);
                    block_blackwhite_radio1.setTextColor(Color.BLACK);
                }
            }
        });
        final RadioButton block_blackwhite_radio2 = (RadioButton) view.findViewById(biz.AR.id.block_blackwhite_radio2);
        block_blackwhite_radio2.setOnCheckedChangeListener(new OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton arg0, boolean arg1) {
                LinearLayout llayout = (LinearLayout) findViewById(biz.AR.id.block_blackwhitelist_white);
                if (arg1) {
                    block_blackwhite_radio2.setTextColor(Color.rgb(1, 111, 171));
                    llayout.setVisibility(View.VISIBLE);
                } else {
                    llayout.setVisibility(View.GONE);
                    block_blackwhite_radio2.setTextColor(Color.BLACK);
                }
            }
        });
    }
    @Override
    protected Dialog onCreateDialog(int id) {
        Dialog dialog = null;
        if (id == 1)// 添加名单对话框
        {
            AlertDialog.Builder builder = new AlertDialog.Builder(this);
            if (isAddBlackList) builder.setTitle("添加黑名单");
            else builder.setTitle("添加白名单");
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
                            if (isAddBlackList) {
                                Block_AddEditBlackList_Activity.isEdit = false;
                                Intent intent = new Intent(s_tabsActivity, Block_AddEditBlackList_Activity.class);
                                startActivity(intent);
                            } else {
                                Block_AddEditWhiteList_Activity.isEdit = false;
                                Intent intent = new Intent(s_tabsActivity, Block_AddEditWhiteList_Activity.class);
                                startActivity(intent);
                            }
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
        // /////////////////////////////////////
        else if (id == 2)// "从联系人中导入";
        {
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
            if (isAddBlackList) builder.setTitle("从联系人中导入黑名单");
            else builder.setTitle("从联系人中导入白名单");
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
        } else if (id == 3)// 从通话记录中导入
        {
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
            if (isAddBlackList) builder.setTitle("从通话记录中导入黑名单");
            else builder.setTitle("从通话记录中导入白名单");
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
        // ///////////////////////////////////
        else if (id == 4)// 从短信中导入
        {
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
            if (isAddBlackList) builder.setTitle("从短信中导入黑名单");
            else builder.setTitle("从短信中导入白名单");
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
        return dialog;
    }
    @Override
    protected void onPrepareDialog(int id, Dialog dialog) {
        removeDialog(id);
        super.onPrepareDialog(id, dialog);
    }
    private void addTo() {
        try {
            boolean add = false;
            for (Boolean one : selected) {
                if (one) {
                    add = true;
                    break;
                }
            }
            if (!add) return;
            DatabaseAdapter dAdapter = DatabaseAdapter.getInstance(this);
            String pNumber = "";
            String niceName = "";
            for (int i = 0; i < selected.length; i++) {
                if (!selected[i]) continue;
                niceName = selectedname.get(i);
                pNumber = selectedpnumber.get(i);
                if (isAddBlackList) {
                    boolean flag = false;
                    for (int m = 0, n = mywhiteData.size(); m < n; m++) {
                        if (mywhiteData.get(m).get("phone").equals(pNumber)) {
                            flag = true;
                            break;
                        }
                    }
                    if (flag) {
                        String tips = "";
                        if (niceName != null && !niceName.trim().equals("")) {
                            tips = niceName;
                        } else {
                            tips = pNumber;
                        }
                        Toast.makeText(s_tabsActivity, tips + getResources().getString(biz.AR.string.phone_already_in_white), Toast.LENGTH_SHORT).show();
                    } else {
                        dAdapter.addOneBlackList(pNumber, niceName, 2);
                    }
                } else {
                    boolean flag = false;
                    for (int m = 0, n = myblackData.size(); m < n; m++) {
                        if (myblackData.get(m).get("phone").equals(pNumber)) {
                            flag = true;
                            break;
                        }
                    }
                    if (flag) {
                        String tips = "";
                        if (niceName != null && !niceName.trim().equals("")) {
                            tips = niceName;
                        } else {
                            tips = pNumber;
                        }
                        Toast.makeText(s_tabsActivity, tips + getResources().getString(biz.AR.string.phone_already_in_black), Toast.LENGTH_SHORT).show();
                    } else {
                        dAdapter.addOneWhiteList(pNumber, niceName);
                    }
                }
            }
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        }
        refreshBlackData();
    }
    private void update_setting(View view) {
        setOnClickListener = new SetOnClickListener();
        ImageView back = (ImageView) view.findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                Block_Main_Activity.this.finish();
            }
        });
        TextView tView = (TextView) view.findViewById(biz.AR.id.block_setting_model_value_txt);
        String[] s = getResources().getStringArray(biz.AR.array.entries_block_call_rule);
        tView.setText(s[BlockRuleSetting.mode]);
        CheckBox cbox = (CheckBox) view.findViewById(biz.AR.id.block_setting_strangersms_value_cbox);
        cbox.setChecked(BlockRuleSetting.blockstranger_sms);
        cbox = (CheckBox) view.findViewById(biz.AR.id.block_setting_strangerphone_value_cbox);
        cbox.setChecked(BlockRuleSetting.blockstranger_phone);
        cbox = (CheckBox) view.findViewById(biz.AR.id.block_setting_hidesms_value_cbox);
        cbox.setChecked(BlockRuleSetting.block_hide_sms);
        cbox = (CheckBox) view.findViewById(biz.AR.id.block_setting_hidephone_value_cbox);
        cbox.setChecked(BlockRuleSetting.block_hide_phone);
        tView = (TextView) view.findViewById(biz.AR.id.block_setting_nightmodel_value_txt);
        tView.setText(s[BlockRuleSetting.night_mode]);
        tView = (TextView) view.findViewById(biz.AR.id.block_setting_nightstart_value_txt);
        tView.setText(BlockRuleSetting.night_start.toString());
        tView = (TextView) view.findViewById(biz.AR.id.block_setting_nightend_value_txt);
        tView.setText(BlockRuleSetting.night_end.toString());
        RelativeLayout r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_model_layout);
        r.setOnClickListener(setOnClickListener);
        r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_nightmodel_layout);
        r.setOnClickListener(setOnClickListener);
        r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_callreturnring_layout);
        r.setOnClickListener(setOnClickListener);
        r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_keywords_layout);
        r.setOnClickListener(setOnClickListener);
        r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_strangersms_layout);
        r.setOnClickListener(setOnClickListener);
        r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_strangerphone_layout);
        r.setOnClickListener(setOnClickListener);
        r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_hidesms_layout);
        r.setOnClickListener(setOnClickListener);
        r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_hidephone_layout);
        r.setOnClickListener(setOnClickListener);
        r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_nightstart_layout);
        r.setOnClickListener(setOnClickListener);
        r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_nightend_layout);
        r.setOnClickListener(setOnClickListener);
        updateDisplay(view);
    }
    /**
    * 设置各选项是否可设置
    */
    private void updateDisplay(View view) {
        RelativeLayout r;
        TextView t;
        if (BlockRuleSetting.mode == 0 || BlockRuleSetting.mode == 7) {
            r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_callreturnring_layout);
            r.setClickable(false);
            t = (TextView) view.findViewById(biz.AR.id.block_setting_callreturnring_title_txt);
            t.setTextColor(getResources().getColor(biz.AR.color.txt_status_gray));
            r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_keywords_layout);
            r.setClickable(false);
            t = (TextView) view.findViewById(biz.AR.id.block_setting_keywords_title_txt);
            t.setTextColor(getResources().getColor(biz.AR.color.txt_status_gray));
            r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_strangersms_layout);
            r.setClickable(false);
            t = (TextView) view.findViewById(biz.AR.id.block_setting_strangersms_title_txt);
            t.setTextColor(getResources().getColor(biz.AR.color.txt_status_gray));
            r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_strangerphone_layout);
            r.setClickable(false);
            t = (TextView) view.findViewById(biz.AR.id.block_setting_strangerphone_title_txt);
            t.setTextColor(getResources().getColor(biz.AR.color.txt_status_gray));
            r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_hidesms_layout);
            r.setClickable(false);
            t = (TextView) view.findViewById(biz.AR.id.block_setting_hidesms_title_txt);
            t.setTextColor(getResources().getColor(biz.AR.color.txt_status_gray));
            r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_hidephone_layout);
            r.setClickable(false);
            t = (TextView) view.findViewById(biz.AR.id.block_setting_hidephone_title_txt);
            t.setTextColor(getResources().getColor(biz.AR.color.txt_status_gray));
        } else {
            r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_callreturnring_layout);
            r.setClickable(true);
            t = (TextView) view.findViewById(biz.AR.id.block_setting_callreturnring_title_txt);
            t.setTextColor(getResources().getColor(biz.AR.color.black));
            r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_keywords_layout);
            r.setClickable(true);
            t = (TextView) view.findViewById(biz.AR.id.block_setting_keywords_title_txt);
            t.setTextColor(getResources().getColor(biz.AR.color.black));
            r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_strangersms_layout);
            r.setClickable(true);
            t = (TextView) view.findViewById(biz.AR.id.block_setting_strangersms_title_txt);
            t.setTextColor(getResources().getColor(biz.AR.color.black));
            r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_strangerphone_layout);
            r.setClickable(true);
            t = (TextView) view.findViewById(biz.AR.id.block_setting_strangerphone_title_txt);
            t.setTextColor(getResources().getColor(biz.AR.color.black));
            r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_hidesms_layout);
            r.setClickable(true);
            t = (TextView) view.findViewById(biz.AR.id.block_setting_hidesms_title_txt);
            t.setTextColor(getResources().getColor(biz.AR.color.black));
            r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_hidephone_layout);
            r.setClickable(true);
            t = (TextView) view.findViewById(biz.AR.id.block_setting_hidephone_title_txt);
            t.setTextColor(getResources().getColor(biz.AR.color.black));
        }
        if (BlockRuleSetting.night_mode == 0 || BlockRuleSetting.night_mode == 7) {
            r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_nightstart_layout);
            r.setClickable(false);
            t = (TextView) view.findViewById(biz.AR.id.block_setting_nightstart_title_txt);
            t.setTextColor(getResources().getColor(biz.AR.color.txt_status_gray));
            r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_nightend_layout);
            r.setClickable(false);
            t = (TextView) view.findViewById(biz.AR.id.block_setting_nightend_title_txt);
            t.setTextColor(getResources().getColor(biz.AR.color.txt_status_gray));
        } else {
            r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_nightstart_layout);
            r.setClickable(true);
            t = (TextView) view.findViewById(biz.AR.id.block_setting_nightstart_title_txt);
            t.setTextColor(getResources().getColor(biz.AR.color.black));
            r = (RelativeLayout) view.findViewById(biz.AR.id.block_setting_nightend_layout);
            r.setClickable(true);
            t = (TextView) view.findViewById(biz.AR.id.block_setting_nightend_title_txt);
            t.setTextColor(getResources().getColor(biz.AR.color.black));
        }
    }
    @Override
    protected void onPause() {
        if (m_Dialog != null && m_Dialog.isShowing() && !isFinishing()) {
            m_Dialog.dismiss();
        }
        if (isChangedRuleSetting) {
            DatabaseAdapter databaseAdapter = DatabaseAdapter.getInstance(this);
            databaseAdapter.updaeBlockRuleSetting();
            isChangedRuleSetting = false;
        }
        super.onPause();
    }
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == SETTING_REQUEST_CODE) {
            View view = listViews.get(3);
            switch (resultCode) {
                case 1://返回模式
                {
                    Bundle b = data.getExtras();
                    int modelvalue = b.getInt("curr_Value");
                    BlockRuleSetting.mode = modelvalue;
                    ////101为设置显示或者隐藏通知栏图标
                    Message msg = BlockbgService.handler.obtainMessage();
                    msg.what = 101;
                    BlockbgService.handler.sendMessage(msg);
                    //////
                    String[] s = getResources().getStringArray(biz.AR.array.entries_block_call_rule);
                    TextView tView = (TextView) view.findViewById(biz.AR.id.block_setting_model_value_txt);
                    tView.setText(s[BlockRuleSetting.mode]);
                    isChangedRuleSetting = true;
                }
                    break;
                case 2://返回夜间模式
                {
                    Bundle b = data.getExtras();
                    int modelvalue = b.getInt("curr_Value");
                    BlockRuleSetting.night_mode = modelvalue;
                    String[] s = getResources().getStringArray(biz.AR.array.entries_block_call_rule);
                    TextView tView = (TextView) view.findViewById(biz.AR.id.block_setting_nightmodel_value_txt);
                    tView.setText(s[BlockRuleSetting.night_mode]);
                    isChangedRuleSetting = true;
                }
            }
            updateDisplay(view);
        }
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) { // 按下的如果是BACK，同时没有重复
            System.gc();
            Block_Main_Activity.this.finish();
            return false;
        }
        return super.onKeyDown(keyCode, event);
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
                if (bSMSSessionList.size() == 0) return true;
                Intent intent = new Intent(s_tabsActivity, Block_SMSDel_Activity.class);
                startActivity(intent);
            }
                break;
            case SMS_MENU_INDEX + 2: {
                if (bSMSSessionList.size() == 0) return true;
                Intent intent = new Intent(s_tabsActivity, Block_SMSRecover_Activity.class);
                startActivity(intent);
            }
                break;
            case SMS_MENU_INDEX + 3: {
                if (bSMSSessionList.size() == 0) return true;
                DatabaseAdapter da = DatabaseAdapter.getInstance(this);
                da.flagReadfor_BlockSMS("");
                refreshSMSData();
            }
                break;
            case PHONE_MENU_INDEX + 1://menu.add(1, 1, 1, "删除")
            {
                Intent intent = new Intent(s_tabsActivity, Block_PhoneDel_Activity.class);
                startActivity(intent);
            }
                break;
            case PHONE_MENU_INDEX + 2://menu.add(1, 2, 2, "标记为已读"
            {
                DatabaseAdapter da = DatabaseAdapter.getInstance(this);
                da.flagReadfor_BlockPhone(-1);
                refreshPhoneData();
                refreshNotify();
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
                case SMS_MENU_INDEX + 2:// menu.add(1,2,2,"删除此号码短信(永久)");
                {
                    smsDelsmsPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    AlertDialog.Builder builder = new AlertDialog.Builder(this).setIcon(biz.AR.drawable.icon).setTitle("提示");
                    builder.setMessage("你确认要删除此号码短信吗?").setCancelable(false).setPositiveButton("确定", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int id) {
                            DatabaseAdapter d = DatabaseAdapter.getInstance(s_tabsActivity);
                            d.delBlockSMS(bSMSSessionList.get(smsDelsmsPosition).pNumber);
                            refreshSMSData();
                        }
                    }).setNegativeButton("取消", null);
                    AlertDialog alert = builder.create();
                    alert.show();
                }
                    break;
                case SMS_MENU_INDEX + 3:// menu.add(1,3,3,"删除此号码短信(到回收站)");
                {
                    smsDelsmsPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    DatabaseAdapter d = DatabaseAdapter.getInstance(s_tabsActivity);
                    d.delBlockSMS_toTrash(bSMSSessionList.get(smsDelsmsPosition).pNumber);
                    refreshSMSData();
                }
                    break;
                case SMS_MENU_INDEX + 4:// menu.add(1, 4, 4, "移动到我的收藏夹");
                {
                    smsDelsmsPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    DatabaseAdapter d = DatabaseAdapter.getInstance(s_tabsActivity);
                    d.moveBlockSMS_toFavorite(bSMSSessionList.get(smsDelsmsPosition).pNumber);
                    refreshSMSData();
                }
                    break;
                case SMS_MENU_INDEX + 5:// menu.add(1, 5, 5, "将号码添加到");
                {
                    int selectedPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    Block_AddTo_Activity.pNumber = bSMSSessionList.get(selectedPosition).pNumber;
                    Intent intent = new Intent(s_tabsActivity, Block_AddTo_Activity.class);
                    startActivity(intent);
                }
                    break;
                case SMS_MENU_INDEX + 6:// menu.add(1, 6, 6, "恢复此号码短信到收件箱");
                {
                    DatabaseAdapter d = DatabaseAdapter.getInstance(s_tabsActivity);
                    ContentValues cv = new ContentValues();
                    int selectedPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    ArrayList<BlockSMS> oneSession = d.readBlockSMS(bSMSSessionList.get(selectedPosition).pNumber);
                    for (BlockSMS one : oneSession) {
                        cv.put("address", one.address);
                        cv.put("read", one.read ? 1 : 0);
                        cv.put("type", one.type ? 1 : 2);
                        cv.put("status", one.status);
                        cv.put("date", one.cDate);
                        cv.put("body", one.body);
                        getContentResolver().insert(Uri.parse("content://sms"), cv);
                    }
                    d.delBlockSMS(bSMSSessionList.get(selectedPosition).pNumber);
                    refreshSMSData();
                }
                    break;
                case PHONE_MENU_INDEX + 1:// menu.add(1, 1, 2, "回复短信")
                {
                    int selectedPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    Intent smsIntent = new Intent(Intent.ACTION_SENDTO, Uri.parse("smsto:" + blockPhones.get(selectedPosition).pNumber));
                    startActivity(smsIntent);
                }
                    break;
                case PHONE_MENU_INDEX + 2:// menu.add(1, 2, 3, "呼叫");
                {
                    int selectedPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    Intent intent = new Intent(Intent.ACTION_CALL, Uri.parse("tel:" + blockPhones.get(selectedPosition).pNumber));
                    startActivity(intent);
                }
                    break;
                case PHONE_MENU_INDEX + 3:// 	menu.add(1, 3, 4, "删除");
                {
                    phoneDelphonePosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    AlertDialog.Builder builder = new AlertDialog.Builder(this).setIcon(biz.AR.drawable.icon).setTitle("提示");
                    builder.setMessage("你确认要删除该来电记录吗?").setCancelable(false).setPositiveButton("确定", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int id) {
                            DatabaseAdapter d = DatabaseAdapter.getInstance(s_tabsActivity);
                            d.delBlockPhone(blockPhones.get(phoneDelphonePosition).id);
                            refreshPhoneData();
                        }
                    }).setNegativeButton("取消", null);
                    AlertDialog alert = builder.create();
                    alert.show();
                }
                    break;
                case PHONE_MENU_INDEX + 4:// 	menu.add(1, 4, 5, "将号码添加到");*/
                {
                    int selectedPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    Block_AddTo_Activity.pNumber = blockPhones.get(selectedPosition).pNumber;
                    Intent intent = new Intent(s_tabsActivity, Block_AddTo_Activity.class);
                    startActivity(intent);
                }
                    break;
                case BLACK_MENU_INDEX + 1:// 修改
                {
                    int sPos = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    Block_AddEditBlackList_Activity.isEdit = true;
                    Block_AddEditBlackList_Activity.pNumber = blacklists.get(sPos).pNumber;
                    Block_AddEditBlackList_Activity.niceName = blacklists.get(sPos).niceName;
                    Intent intent = new Intent(s_tabsActivity, Block_AddEditBlackList_Activity.class);
                    startActivity(intent);
                }
                    break;
                case BLACK_MENU_INDEX + 2:// 发短信
                {
                    int sPos = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    Intent smsIntent = new Intent(Intent.ACTION_SENDTO, Uri.parse("smsto:" + blacklists.get(sPos).pNumber));
                    startActivity(smsIntent);
                }
                    break;
                case BLACK_MENU_INDEX + 3:// 电话呼叫
                {
                    int sPos = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    Intent intent = new Intent(Intent.ACTION_CALL, Uri.parse("tel:" + blacklists.get(sPos).pNumber));
                    startActivity(intent);
                }
                    break;
                case BLACK_MENU_INDEX + 4:// 删除该黑名单
                {
                    delBlackListPos = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    AlertDialog.Builder builder = new AlertDialog.Builder(this).setIcon(biz.AR.drawable.icon).setTitle("提示");
                    builder.setMessage("你确认要删除该黑名单吗?").setCancelable(false).setPositiveButton("确定", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int id) {
                            DatabaseAdapter d = DatabaseAdapter.getInstance(s_tabsActivity);
                            d.delOneBlackList(blacklists.get(delBlackListPos).pNumber);
                            refreshBlackData();
                        }
                    }).setNegativeButton("取消", null);
                    AlertDialog alert = builder.create();
                    alert.show();
                }
                    break;
                case BLACK_MENU_INDEX + 5:// 修改
                {
                    int sPos = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    Block_AddEditWhiteList_Activity.isEdit = true;
                    Block_AddEditWhiteList_Activity.pNumber = whiteLists.get(sPos).pNumber;
                    Block_AddEditWhiteList_Activity.niceName = whiteLists.get(sPos).niceName;
                    Intent intent = new Intent(s_tabsActivity, Block_AddEditWhiteList_Activity.class);
                    startActivity(intent);
                }
                    break;
                case BLACK_MENU_INDEX + 6:// 发短信
                {
                    int sPos = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    Intent smsIntent = new Intent(Intent.ACTION_SENDTO, Uri.parse("smsto:" + whiteLists.get(sPos).pNumber));
                    startActivity(smsIntent);
                }
                    break;
                case BLACK_MENU_INDEX + 7:// 电话呼叫
                {
                    int sPos = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    Intent intent = new Intent(Intent.ACTION_CALL, Uri.parse("tel:" + whiteLists.get(sPos).pNumber));
                    startActivity(intent);
                }
                    break;
                case BLACK_MENU_INDEX + 8:// 删除该白名单
                {
                    delWhiteListPos = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    AlertDialog.Builder builder = new AlertDialog.Builder(this).setIcon(biz.AR.drawable.icon).setTitle("提示");
                    builder.setMessage("你确认要删除该白名单吗?").setCancelable(false).setPositiveButton("确定", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int id) {
                            DatabaseAdapter d = DatabaseAdapter.getInstance(s_tabsActivity);
                            d.delOneWhiteList(whiteLists.get(delWhiteListPos).pNumber);
                            refreshBlackData();
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
    public class DateComparator implements Comparator<Object> {
        @Override
        public int compare(Object object1, Object object2) {
            // TODO Auto-generated method stub
            BlockSMSSession one = (BlockSMSSession) object1;
            BlockSMSSession two = (BlockSMSSession) object2;
            long date1 = 0, date2 = 0;
            try {
                date1 = sdf.parse(one.lastcreateDate).getTime();
                date2 = sdf.parse(two.lastcreateDate).getTime();
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
    public class SetOnClickListener implements View.OnClickListener {
        @Override
        public void onClick(View v) {
            switch (v.getId()) {
                case biz.AR.id.block_setting_model_layout:
                case biz.AR.id.block_setting_nightmodel_layout: {
                    Intent intent1 = new Intent(s_tabsActivity, Block_SettingModel_Activity.class);
                    Bundle b1 = new Bundle();
                    if (v.getId() == biz.AR.id.block_setting_model_layout) {
                        b1.putInt("curr_Value", BlockRuleSetting.mode);
                        b1.putString("model", "model");
                    } else {
                        b1.putString("model", "nightmodel");
                        b1.putInt("curr_Value", BlockRuleSetting.night_mode);
                    }
                    intent1.putExtras(b1);
                    startActivityForResult(intent1, SETTING_REQUEST_CODE);
                }
                    break;
                case biz.AR.id.block_setting_callreturnring_layout: {
                    isChangedRuleSetting = true;
                    Intent intent = new Intent(s_tabsActivity, Block_SettingReturnRing_Activity.class);
                    startActivity(intent);
                }
                    break;
                case biz.AR.id.block_setting_keywords_layout: {
                    Intent intent = new Intent(s_tabsActivity, Block_Keywords_Activity.class);
                    startActivity(intent);
                }
                    break;
                case biz.AR.id.block_setting_strangersms_layout: {
                    CheckBox cBox = (CheckBox) findViewById(biz.AR.id.block_setting_strangersms_value_cbox);
                    cBox.setChecked(!cBox.isChecked());
                    BlockRuleSetting.blockstranger_sms = cBox.isChecked();
                    isChangedRuleSetting = true;
                }
                    break;
                case biz.AR.id.block_setting_strangerphone_layout: {
                    CheckBox cBox = (CheckBox) findViewById(biz.AR.id.block_setting_strangerphone_value_cbox);
                    cBox.setChecked(!cBox.isChecked());
                    BlockRuleSetting.blockstranger_phone = cBox.isChecked();
                    isChangedRuleSetting = true;
                }
                    break;
                case biz.AR.id.block_setting_hidesms_layout: {
                    CheckBox cBox = (CheckBox) findViewById(biz.AR.id.block_setting_hidesms_value_cbox);
                    cBox.setChecked(!cBox.isChecked());
                    BlockRuleSetting.block_hide_sms = cBox.isChecked();
                    isChangedRuleSetting = true;
                }
                    break;
                case biz.AR.id.block_setting_hidephone_layout: {
                    CheckBox cBox = (CheckBox) findViewById(biz.AR.id.block_setting_hidephone_value_cbox);
                    cBox.setChecked(!cBox.isChecked());
                    BlockRuleSetting.block_hide_phone = cBox.isChecked();
                    isChangedRuleSetting = true;
                }
                    break;
                case biz.AR.id.block_setting_nightstart_layout: {
                    String[] _start = BlockRuleSetting.night_start.split(":");
                    curr_choice_startTime = true;
                    new TimePickerDialog(s_tabsActivity, mTimeSetListener, Integer.parseInt(_start[0]), Integer.parseInt(_start[1]), true).show();
                }
                    break;
                case biz.AR.id.block_setting_nightend_layout: {
                    String[] _start = BlockRuleSetting.night_end.split(":");
                    curr_choice_startTime = false;
                    new TimePickerDialog(s_tabsActivity, mTimeSetListener, Integer.parseInt(_start[0]), Integer.parseInt(_start[1]), true).show();
                }
                    break;
                default:
                    break;
            }
        }
    };
    private TimePickerDialog.OnTimeSetListener mTimeSetListener = new TimePickerDialog.OnTimeSetListener() {
        @Override
        public void onTimeSet(TimePicker view, int hourOfDay, int minute) {
            if (curr_choice_startTime) {
                if (hourOfDay < 18 && hourOfDay >= 10) {
                    Toast.makeText(s_tabsActivity, "夜间模式时间必须在18点后或10点前", Toast.LENGTH_SHORT).show();
                    return;
                }
                String[] feTime = BlockRuleSetting.night_end.split(":");
                int end = Integer.parseInt(feTime[0]);
                if (end < hourOfDay && (end > 18 || hourOfDay < 10)) {
                    Toast.makeText(s_tabsActivity, "夜间模式时间必须在18点到第二天10点之间", Toast.LENGTH_SHORT).show();
                    return;
                }
                if (end > 18 && hourOfDay < 10) {
                    Toast.makeText(s_tabsActivity, "夜间模式时间必须在18点到第二天10点之间", Toast.LENGTH_SHORT).show();
                    return;
                }
                String value = String.format("%02d:%02d", hourOfDay, minute);
                BlockRuleSetting.night_start = value;
                TextView v = (TextView) findViewById(biz.AR.id.block_setting_nightstart_value_txt);
                v.setText(value);
            } else {
                String[] fsTime = BlockRuleSetting.night_start.split(":");
                int start = Integer.parseInt(fsTime[0]);
                if (hourOfDay <= 18 && hourOfDay > 10) {
                    Toast.makeText(s_tabsActivity, "夜间模式时间必须在18点到第二天10点之间", Toast.LENGTH_SHORT).show();
                    return;
                }
                if (hourOfDay < start && (hourOfDay > 18 || start < 10)) {
                    Toast.makeText(s_tabsActivity, "夜间模式时间必须在18点后或10点前", Toast.LENGTH_SHORT).show();
                    return;
                }
                if (hourOfDay > 18 && start < 10) {
                    Toast.makeText(s_tabsActivity, "夜间模式时间必须在18点到第二天10点之间", Toast.LENGTH_SHORT).show();
                    return;
                }
                String value = String.format("%02d:%02d", hourOfDay, minute);
                BlockRuleSetting.night_end = value;
                TextView v = (TextView) findViewById(biz.AR.id.block_setting_nightend_value_txt);
                v.setText(value);
            }
            isChangedRuleSetting = true;
        }
    };
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
                    ((ImageView) findViewById(biz.AR.id.block_main_bar_img)).setBackgroundResource(biz.AR.drawable.tab_tag_1);
                    break;
                case 1:
                    ((ImageView) findViewById(biz.AR.id.block_main_bar_img)).setBackgroundResource(biz.AR.drawable.tab_tag_2);
                    break;
                case 2:
                    ((ImageView) findViewById(biz.AR.id.block_main_bar_img)).setBackgroundResource(biz.AR.drawable.tab_tag_3);
                    break;
                case 3:
                    ((ImageView) findViewById(biz.AR.id.block_main_bar_img)).setBackgroundResource(biz.AR.drawable.tab_tag_4);
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
                convertView = mInflater.inflate(biz.AR.layout.block_sms_activity_listview_item, parent, false);
                holder = new InboxVuewHolder();
                holder.threadId = (TextView) convertView.findViewById(biz.AR.id.block_sms_listview_item_id_txt);
                holder.img = (ImageView) convertView.findViewById(biz.AR.id.block_sms_listview_item_img);
                holder.phone = (TextView) convertView.findViewById(biz.AR.id.block_sms_listview_item_Phone_txt);
                holder.msg = (TextView) convertView.findViewById(biz.AR.id.block_sms_listview_item_Msg_txt);
                holder.date = (TextView) convertView.findViewById(biz.AR.id.block_sms_listview_item_Msg_date);
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
