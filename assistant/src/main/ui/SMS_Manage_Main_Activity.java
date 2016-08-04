package main.ui;
import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import main.backup.ContactBackUp;
import main.backup.FavorateBackUp;
import main.backup.SMSBackup;
import main.backup.SmsField;
import main.backup.ui.Favorate_Backup_Activity;
import main.backup.ui.Favorate_Recover_Activity;
import main.backup.ui.SMS_Backup_Activity;
import main.backup.ui.SMS_Recover_Activity;
import main.block.BlockbgService;
import main.block.FavoriteSMS;
import main.block.NormalContacts;
import main.block.TrashSMS;
import main.block.ui.Block_AddTo_Activity;
import main.callphone.ContactManager;
import main.database.DatabaseAdapter;
import main.message.MessageUtils;
import main.message.SendMessageActivity;
import net.workspace.util.Logger;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.ContentValues;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.Parcelable;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.text.ClipboardManager;
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
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.RadioButton;
import android.widget.TextView;
import android.widget.Toast;

public class SMS_Manage_Main_Activity extends Activity {
    private ViewPager mPager;//页卡内容
    private List<View> listViews; // Tab页面列表
    public static Activity s_tabsActivity;
    private RadioButton[] img = new RadioButton[4];
    public static int tabIndex = 0;
    /** 记录当前分页ID */
    private int currentTabID = 0;
    /**SMS_Inbox_Activity信息 */
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
    private int inboxSMSTotalCount = 0;
    private int oldSMSTotalCount = 0;
    private BaseAdapter inboxMySimperAdapter;
    private ArrayList<HashMap<String, Object>> inboxMyData = new ArrayList<HashMap<String, Object>>();
    private ListView inboxLView;
    TextView sms_inbox_title_txt;
    private int inboxDelsmsPosition = 0;
    public static ProgressDialog m_Dialog;
    public static InboxMyHandler handler = null;
    private final int INBOX_MENU_INDEX = 20;
    /**SMS_Trash_Activity信息 */
    private ArrayList<TrashSMS> bTrashSMSList = new ArrayList<TrashSMS>();
    private int trashSMSTotalCount = 0;
    private BaseAdapter trashMySimperAdapter;
    private ArrayList<HashMap<String, Object>> trashMyData = new ArrayList<HashMap<String, Object>>();;
    private ListView trashLView;
    TextView trashTView;
    TextView trashtView0;
    private int trashDelsmsPosition = 0;
    private final int TRASH_MENU_INDEX = 40;
    /**SMS_Favorite_Activity信息 */
    private ArrayList<FavoriteSMS> bfavoriteSMSList = new ArrayList<FavoriteSMS>();
    private int favoriteSMSTotalCount = 0;
    private BaseAdapter favoriteMySimperAdapter;
    private ArrayList<HashMap<String, Object>> favoriteMyData = new ArrayList<HashMap<String, Object>>();;
    private ListView favoriteLView;
    private int favoriteDelsmsPosition = 0;
    private final int FAVORITE_MENU_INDEX = 60;
    TextView favoriteTView;
    //手机数据备份和恢复
    private RadioButton backup_radio;
    private LinearLayout sms_backup_layout;
    private TextView sms_backup_phone_txt;
    private Button sms_backup_phone_box;
    private TextView sms_backup_sms_txt;
    private Button sms_backup_sms_box;
    private TextView sms_backup_favorate_txt;
    private Button sms_backup_favorate_box;
    private TextView sms_backup_phone_time;
    private TextView sms_backup_sms_time;
    private TextView sms_backup_phone_number;
    private TextView sms_backup_sms_number;
    private TextView sms_backup_favorate_number;
    private TextView sms_backup_favorate_time;
    //手机数据恢复
    private RadioButton recover_radio;
    private LinearLayout sms_recover_layout;
    private TextView sms_recover_phone_txt;
    private Button sms_recover_phone_box;
    private TextView sms_recover_sms_txt;
    private Button sms_recover_sms_box;
    private TextView sms_recover_favorate_txt;
    private Button sms_recover_favorate_box;
    private TextView sms_recover_phone_time;
    private TextView sms_recover_sms_time;
    private TextView sms_recover_phone_number;
    private TextView sms_recover_sms_number;
    private TextView sms_recover_favorate_number;
    private TextView sms_recover_favorate_time;
    private int backupphonestate = 0;
    private int backupsmsstate = 0;
    private int backupfavoratestate = 0;
    private final int BACK_UP = 1101;
    private final int RECOVER_SMS = 1102;
    private final int RECOVER_FAVORATE = 1103;
    private Map<String, NormalContacts> contactMap;//通讯录数据
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.sms_manage_main_activity);
        if (BlockbgService.state == -1)// 后台服务停了，需要重新启动
        {
            BlockbgService.startMyService(this);
            System.gc();
            finish();
            return;
        }
        LinearLayout main = (LinearLayout) findViewById(biz.AR.id.sms_manage_main_layout);
        main.setBackgroundResource(Global_Var.mainBG_Imges[Global_Var.currMainBGIndex]);
        s_tabsActivity = this;
        initViewPage();
        initInboxView(listViews.get(0));
        initTrashView(listViews.get(1));
        initFavoriteView(listViews.get(2));
        initBackUpView(listViews.get(3));
    }
    private void initContact() {
        contactMap = new HashMap<String, NormalContacts>();
        List<NormalContacts> contactList = ContactManager.getInstance(this).getList();
        for (NormalContacts contact : contactList) {
            contactMap.put(contact.pNumber.trim(), contact);
        }
        contactList.clear();
    }
    private void initViewPage() {
        mPager = (ViewPager) findViewById(biz.AR.id.vPager);
        listViews = new ArrayList<View>();
        LayoutInflater mInflater = getLayoutInflater();
        listViews.add(mInflater.inflate(biz.AR.layout.sms_inbox_activity, null));
        listViews.add(mInflater.inflate(biz.AR.layout.sms_trash_activity, null));
        listViews.add(mInflater.inflate(biz.AR.layout.sms_favorite_activity, null));
        listViews.add(mInflater.inflate(biz.AR.layout.sms_back_activity, null));
        mPager.setAdapter(new MyPagerAdapter(listViews));
        mPager.setCurrentItem(currentTabID);
        img[0] = (RadioButton) findViewById(biz.AR.id.sms_manage_main_img1);
        img[1] = (RadioButton) findViewById(biz.AR.id.sms_manage_main_img2);
        img[2] = (RadioButton) findViewById(biz.AR.id.sms_manage_main_img3);
        img[3] = (RadioButton) findViewById(biz.AR.id.sms_manage_main_img4);
        ((ImageView) findViewById(biz.AR.id.sms_manage_main_bar_img)).setBackgroundResource(biz.AR.drawable.tab_tag_1);
        mPager.setOnPageChangeListener(new MyOnPageChangeListener());
        img[0].setOnClickListener(new MyOnClickListener(0));
        img[1].setOnClickListener(new MyOnClickListener(1));
        img[2].setOnClickListener(new MyOnClickListener(2));
        img[3].setOnClickListener(new MyOnClickListener(3));
    }
    private void initInboxView(View view) {
        ImageView back = (ImageView) view.findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                SMS_Manage_Main_Activity.this.finish();
            }
        });
        handler = new InboxMyHandler(Looper.getMainLooper());
        sms_inbox_title_txt = (TextView) view.findViewById(biz.AR.id.sms_inbox_title_txt);
        inboxLView = (ListView) view.findViewById(biz.AR.id.sms_inbox_listView);
        inboxLView.setOnCreateContextMenuListener(new View.OnCreateContextMenuListener() {
            @Override
            public void onCreateContextMenu(ContextMenu menu, View v, ContextMenuInfo menuInfo) {
                menu.setHeaderTitle("操作选择");
                menu.add(1, INBOX_MENU_INDEX + 1, 1, "呼叫联系人");
                menu.add(1, INBOX_MENU_INDEX + 2, 2, "删除会话(永久)");
                menu.add(1, INBOX_MENU_INDEX + 3, 3, "删除会话(到回收站)");
                menu.add(1, INBOX_MENU_INDEX + 4, 4, "移到收藏夹");
                menu.add(1, INBOX_MENU_INDEX + 5, 5, "将号码添加到...");
                if (testSDCard()) {
                    menu.add(1, INBOX_MENU_INDEX + 6, 6, "备份到SD卡");
                }
            }
        });
        inboxLView.setOnItemClickListener(new OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                SMSSession_Activity.smsSession.id = (int) bboxSMSList.get(position).threadID;
                SMSSession_Activity.smsSession.pNumber = bboxSMSList.get(position).pNumber;
                SMSSession_Activity.smsSession.niceName = bboxSMSList.get(position).person;
                SMSSession_Activity.smsSession.mproperty = bboxSMSList.get(position).mProperty;
                SMSSession_Activity.smsSession.type = 3;
                if (Integer.parseInt(String.valueOf(inboxMyData.get(position).get("ItemImage"))) == 1) oldSMSTotalCount = 0;
                Intent smsIntent = new Intent(s_tabsActivity, SMSSession_Activity.class);
                startActivity(smsIntent);
                // //////////
            }
        });
        LinearLayout iView = (LinearLayout) view.findViewById(biz.AR.id.sms_inbox_add);
        iView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent smsIntent = new Intent(s_tabsActivity, SendMessageActivity.class);
                startActivity(smsIntent);
            }
        });
    }
    private void initTrashView(View view) {
        ImageView back = (ImageView) view.findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                SMS_Manage_Main_Activity.this.finish();
            }
        });
        trashtView0 = (TextView) view.findViewById(biz.AR.id.sms_trash_title_txt);
        trashTView = (TextView) view.findViewById(biz.AR.id.sms_trash_null_txt);
        trashLView = (ListView) view.findViewById(biz.AR.id.sms_trash_listView);
        trashLView.setOnCreateContextMenuListener(new View.OnCreateContextMenuListener() {
            @Override
            public void onCreateContextMenu(ContextMenu menu, View v, ContextMenuInfo menuInfo) {
                menu.setHeaderTitle("操作选择");
                menu.add(1, TRASH_MENU_INDEX + 1, 1, "呼叫联系人");
                menu.add(1, TRASH_MENU_INDEX + 2, 2, "删除此短信(永久)");
                menu.add(1, TRASH_MENU_INDEX + 3, 3, "移动到我的收藏夹");
                menu.add(1, TRASH_MENU_INDEX + 4, 4, "恢复到手机收件箱");
                menu.add(1, TRASH_MENU_INDEX + 5, 5, "将号码添加到");
                menu.add(1, TRASH_MENU_INDEX + 6, 6, "复制短信内容");
            }
        });
        Button bt = (Button) view.findViewById(biz.AR.id.sms_trash_delall_bt);
        bt.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (bTrashSMSList.size() == 0) return;
                AlertDialog.Builder builder = new AlertDialog.Builder(s_tabsActivity).setIcon(biz.AR.drawable.icon).setTitle("提示");
                builder.setMessage("你确认要清空回收站吗?").setCancelable(false).setPositiveButton("确定", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int id) {
                        DatabaseAdapter d = DatabaseAdapter.getInstance(s_tabsActivity);
                        d.delTrashSMS(0);
                        refreshTrashData();
                    }
                }).setNegativeButton("取消", null);
                AlertDialog alert = builder.create();
                alert.show();
            }
        });
    }
    private void initFavoriteView(View view) {
        ImageView back = (ImageView) view.findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                SMS_Manage_Main_Activity.this.finish();
            }
        });
        favoriteTView = (TextView) view.findViewById(biz.AR.id.sms_favorite_title_txt);
        favoriteLView = (ListView) view.findViewById(biz.AR.id.sms_favorite_listView);
        favoriteLView.setOnCreateContextMenuListener(new View.OnCreateContextMenuListener() {
            @Override
            public void onCreateContextMenu(ContextMenu menu, View v, ContextMenuInfo menuInfo) {
                menu.setHeaderTitle("操作选择");
                menu.add(1, FAVORITE_MENU_INDEX + 1, 1, "呼叫联系人");
                menu.add(1, FAVORITE_MENU_INDEX + 2, 2, "删除此短信(到回收站)");
                menu.add(1, FAVORITE_MENU_INDEX + 3, 3, "恢复到手机收件箱");
                menu.add(1, FAVORITE_MENU_INDEX + 4, 4, "将号码添加到");
                menu.add(1, FAVORITE_MENU_INDEX + 5, 5, "复制短信内容");
                if (testSDCard()) {
                    menu.add(1, FAVORITE_MENU_INDEX + 6, 6, "备份到SD卡");
                }
            }
        });
    }
    private void initBackUpView(View view) {
        ImageView back = (ImageView) view.findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                SMS_Manage_Main_Activity.this.finish();
            }
        });
        //手机数据备份和恢复
        BackUpOnClickListener mBackUpOnClickListener = new BackUpOnClickListener();
        backup_radio = (RadioButton) view.findViewById(biz.AR.id.backup_radio);
        sms_backup_layout = (LinearLayout) view.findViewById(biz.AR.id.sms_backup_layout);
        sms_backup_phone_txt = (TextView) view.findViewById(biz.AR.id.sms_backup_phone_txt);
        sms_backup_phone_box = (Button) view.findViewById(biz.AR.id.sms_backup_phone_box);
        sms_backup_phone_box.setOnClickListener(mBackUpOnClickListener);
        sms_backup_sms_txt = (TextView) view.findViewById(biz.AR.id.sms_backup_sms_txt);
        sms_backup_sms_box = (Button) view.findViewById(biz.AR.id.sms_backup_sms_box);
        sms_backup_sms_box.setOnClickListener(mBackUpOnClickListener);
        sms_backup_favorate_txt = (TextView) view.findViewById(biz.AR.id.sms_backup_favorate_txt);
        sms_backup_favorate_box = (Button) view.findViewById(biz.AR.id.sms_backup_favorate_box);
        sms_backup_favorate_box.setOnClickListener(mBackUpOnClickListener);
        sms_backup_phone_time = (TextView) view.findViewById(biz.AR.id.sms_backup_phone_time);
        sms_backup_sms_time = (TextView) view.findViewById(biz.AR.id.sms_backup_sms_time);
        sms_backup_phone_number = (TextView) view.findViewById(biz.AR.id.sms_backup_phone_number);
        sms_backup_sms_number = (TextView) view.findViewById(biz.AR.id.sms_backup_sms_number);
        sms_backup_favorate_number = (TextView) view.findViewById(biz.AR.id.sms_backup_favorate_number);
        sms_backup_favorate_time = (TextView) view.findViewById(biz.AR.id.sms_backup_favorate_time);
        //手机数据恢复
        recover_radio = (RadioButton) view.findViewById(biz.AR.id.recover_radio);
        sms_recover_layout = (LinearLayout) view.findViewById(biz.AR.id.sms_recover_layout);
        sms_recover_phone_txt = (TextView) view.findViewById(biz.AR.id.sms_recover_phone_txt);
        sms_recover_phone_box = (Button) view.findViewById(biz.AR.id.sms_recover_phone_box);
        sms_recover_phone_box.setOnClickListener(mBackUpOnClickListener);
        sms_recover_sms_txt = (TextView) view.findViewById(biz.AR.id.sms_recover_sms_txt);
        sms_recover_sms_box = (Button) view.findViewById(biz.AR.id.sms_recover_sms_box);
        sms_recover_sms_box.setOnClickListener(mBackUpOnClickListener);
        sms_recover_favorate_txt = (TextView) view.findViewById(biz.AR.id.sms_recover_favorate_txt);
        sms_recover_favorate_box = (Button) view.findViewById(biz.AR.id.sms_recover_favorate_box);
        sms_recover_favorate_box.setOnClickListener(mBackUpOnClickListener);
        sms_recover_phone_time = (TextView) view.findViewById(biz.AR.id.sms_recover_phone_time);
        sms_recover_sms_time = (TextView) view.findViewById(biz.AR.id.sms_recover_sms_time);
        sms_recover_phone_number = (TextView) view.findViewById(biz.AR.id.sms_recover_phone_number);
        sms_recover_sms_number = (TextView) view.findViewById(biz.AR.id.sms_recover_sms_number);
        sms_recover_favorate_number = (TextView) view.findViewById(biz.AR.id.sms_recover_favorate_number);
        sms_recover_favorate_time = (TextView) view.findViewById(biz.AR.id.sms_recover_favorate_time);
        backup_radio.setOnCheckedChangeListener(new OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton arg0, boolean arg1) {
                if (arg1) {
                    backup_radio.setTextColor(Color.rgb(1, 111, 171));
                    sms_backup_layout.setVisibility(View.VISIBLE);
                } else {
                    sms_backup_layout.setVisibility(View.GONE);
                    backup_radio.setTextColor(Color.BLACK);
                }
            }
        });
        recover_radio.setOnCheckedChangeListener(new OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton arg0, boolean arg1) {
                if (arg1) {
                    recover_radio.setTextColor(Color.rgb(1, 111, 171));
                    sms_recover_layout.setVisibility(View.VISIBLE);
                } else {
                    sms_recover_layout.setVisibility(View.GONE);
                    recover_radio.setTextColor(Color.BLACK);
                }
            }
        });
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) { // 按下的如果是BACK，同时没有重复
            System.gc();
            SMS_Manage_Main_Activity.this.finish();
            return false;
        }
        return super.onKeyDown(keyCode, event);
    }
    @Override
    protected void onResume() {
        Cursor cursor = null;
        try {
            cursor = getContentResolver().query(Uri.parse("content://sms/"), new String[] { "count(*) as count" }, "type=1 or type=2", null, null);
            if (cursor.moveToNext()) inboxSMSTotalCount = cursor.getInt(0);
        } catch (Throwable e) {
            Logger.error(e);
        } finally {
            if (cursor != null) cursor.close();
        }
        if (oldSMSTotalCount != inboxSMSTotalCount || oldSMSTotalCount == 0) {
            new AsyncTask<Void, Void, Void>() {
                @Override
                protected Void doInBackground(Void... arg0) {
                    try {
                        initContact();
                    } catch (Throwable e) {
                        Logger.error(e);
                    }
                    return null;
                }
                @Override
                protected void onPostExecute(Void result) {
                    refreshInboxData();
                    refreshTrashData();
                    refreshFavoriteData();
                    refreshBackUpData();
                }
                @Override
                protected void onPreExecute() {
                    if ((m_Dialog == null || !m_Dialog.isShowing()) && !isFinishing()) m_Dialog = ProgressDialog.show(SMS_Manage_Main_Activity.this, "请等待...", "正在动态加载数据，请稍后...", true);
                    super.onPreExecute();
                }
            }.execute();
        }
        super.onResume();
    }
    @Override
    protected void onDestroy() {
        System.gc();
        super.onDestroy();
    }
    /**
     * 刷新数据
     * 
     * @return
     */
    private void refreshInboxData() {
        Message msg = BlockbgService.handler.obtainMessage();
        msg.what = 5;
        BlockbgService.handler.sendMessage(msg);
        Cursor cursor = null;
        try {
            cursor = getContentResolver().query(Uri.parse("content://sms/"), new String[] { "count(*) as count" }, "type=1 or type=2", null, null);
            if (cursor.moveToNext()) inboxSMSTotalCount = cursor.getInt(0);
        } catch (Throwable e) {
            Logger.error(e);
        } finally {
            if (cursor != null) cursor.close();
        }
        oldSMSTotalCount = inboxSMSTotalCount;
        if (sms_inbox_title_txt != null) {
            sms_inbox_title_txt.setText("您有" + inboxSMSTotalCount + "条短信");
        }
        if ((m_Dialog == null || !m_Dialog.isShowing()) && !isFinishing()) m_Dialog = ProgressDialog.show(this, "请等待...", "正在动态加载数据，请稍后...", true);
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    readInboxSMS();
                    handler.sendEmptyMessage(1);
                } catch (Throwable e) {}
            }
        }).start();
    }
    /**
     * 读取手机短消箱的消息、在联系人中读取号码联系人名称
     * 
     */
    private void readInboxSMS() {
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
            cursor = getContentResolver().query(Uri.parse("content://sms/"), new String[] { "thread_id, count(*) as count" }, "type=1 or type=2 ) group by (thread_id", null, null);
            while (cursor != null && cursor.moveToNext()) {
                SMSSession one = new SMSSession();
                one.threadID = cursor.getLong(0);
                one.count = cursor.getInt(1);
                one.mProperty = "";
                one.person = "";
                bboxSMSList.add(one);
            }
        } catch (Throwable e) {
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
            cursor = getContentResolver().query(Uri.parse("content://sms/"), new String[] { "_id", "thread_id", "address", "read", "person", "date", "body", "type" }, "type=1 or type=2", null, "thread_id,date");
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
                        one.readFlag = cursor.getInt(3);//0-未读，1-已读
                        if (contactMap.containsKey(one.pNumber)) one.person = contactMap.get(one.pNumber).niceName;
                        one.date = cursor.getLong(5);
                        one.msg = cursor.getString(6);
                        one.Inbox = cursor.getInt(7) == 1 ? true : false;
                        isExistData = true;
                    }
                }
            }
        } catch (Throwable e) {
            Logger.error(e);
        } finally {
            if (cursor != null) cursor.close();
        }
        if (!isExistData) {
            bboxSMSList.clear();
            return;
        }
        DatabaseAdapter da = DatabaseAdapter.getInstance(this);
        for (SMSSession one : bboxSMSList) {
            if (one.person.equals("") && one.pNumber != null && !one.pNumber.equals("")) {
                StringBuffer niceName = new StringBuffer();
                if (da.searchContact(one.pNumber, niceName)) one.person = niceName.toString();
                niceName = null;
            }
        }
    }
    /**
     * 重新加载数据
     */
    private void inboxDisplayData() {
        inboxMyData.clear();
        // 生成动态数组，加入数据
        for (SMSSession one : bboxSMSList) {
            HashMap<String, Object> map = new HashMap<String, Object>();
            map.put("ThreadID", one.threadID);
            if (one.readFlag == 0) map.put("ItemImage", 1);
            else map.put("ItemImage", 0);
            /*if (one.Inbox)
            	map.put("inoutImg", biz.AR.drawable.in);
            else
            	map.put("inoutImg", biz.AR.drawable.out);
            */
            map.put("pNumber", one.pNumber);
            map.put("ItemPhone", one.person + " " + one.pNumber + "(" + one.count + ")" + one.mProperty);
            // ////////////
            String dString = MessageUtils.getDateFormat(one.date + "");
            // /////////////
            map.put("ItemMsg", one.msg);
            map.put("ItemDate", dString);
            inboxMyData.add(map);
        }
        // 生成适配器的Item和动态数组对应的元素
        inboxMySimperAdapter = new InboxAdapter(this);
        // 添加并且显示
        inboxLView.setAdapter(inboxMySimperAdapter);
    }
    // Menu菜单,在按MENU键时调用
    @Override
    public boolean onPrepareOptionsMenu(Menu menu) {
        // TODO Auto-generated method stub
        super.onPrepareOptionsMenu(menu);
        if (currentTabID == 0) {
            menu.findItem(1).setVisible(true);
            menu.findItem(2).setVisible(true);
        } else {
            menu.findItem(1).setVisible(false);
            menu.findItem(2).setVisible(false);
        }
        return true;
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        super.onCreateOptionsMenu(menu);
        menu.add(1, 1, 1, "新短信").setIcon(biz.AR.drawable.btn_addnew);
        menu.add(1, 2, 2, "删除").setIcon(biz.AR.drawable.delete);
        return true;
    }
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case 1: {
                Intent smsIntent = new Intent(this, SendMessageActivity.class); // new Intent(Intent.ACTION_SENDTO, Uri.parse("smsto:"));
                startActivity(smsIntent);
            }
                break;
            case 2: {
                Intent i = new Intent(this, SMSDel_Activity.class);
                startActivity(i);
            }
                break;
            default:
                return super.onOptionsItemSelected(item);
        }
        return true;
    }
    private void readTrashSMSs() {
        try {
            bTrashSMSList.clear();
            DatabaseAdapter d = DatabaseAdapter.getInstance(this);
            bTrashSMSList = d.readTrashSMSs();
        } catch (Throwable e) {
            Logger.error(e);
        }
    }
    private void getTrashSMSSessionList() {
        bTrashSMSList.clear();
        readTrashSMSs();
        trashSMSTotalCount = bTrashSMSList.size();
        if (trashSMSTotalCount <= 0) return;
    }
    private void refreshTrashData() {
        new AsyncTask<Void, Void, Void>() {
            @Override
            protected Void doInBackground(Void... arg0) {
                try {
                    getTrashSMSSessionList();
                } catch (Throwable e) {
                    Logger.error(e);
                }
                return null;
            }
            @Override
            protected void onPostExecute(Void result) {
                if (trashtView0 != null) {
                    trashtView0.setText("您的回收站有" + bTrashSMSList.size() + "条信息");
                }
                trashMyData.clear();
                // 生成动态数组，加入数据
                for (TrashSMS one : bTrashSMSList) {
                    HashMap<String, Object> map = new HashMap<String, Object>();
                    map.put("ItemID", one.id);
                    if (!one.read) map.put("ItemImage", 1);
                    else map.put("ItemImage", 0);
                    map.put("pNumber", one.address);
                    map.put("ItemPhone", one.address + " " + one.mproperty);
                    // ////////////
                    map.put("ItemMsg", one.body);
                    map.put("ItemDate", one.cDate);
                    trashMyData.add(map);
                }
                trashMySimperAdapter = new TrashAdapter(SMS_Manage_Main_Activity.this);
                // 添加并且显示
                trashLView.setAdapter(trashMySimperAdapter);
                if (bTrashSMSList.size() == 0) {
                    trashTView.setVisibility(View.VISIBLE);
                } else {
                    trashTView.setVisibility(View.GONE);
                }
            }
        }.execute();
    }
    private void readfavoriteSMSs() {
        try {
            bfavoriteSMSList.clear();
            DatabaseAdapter d = DatabaseAdapter.getInstance(this);
            bfavoriteSMSList = d.readFavoriteSMSs();
        } catch (Throwable e) {
            Logger.error(e);
        }
    }
    private void getFavoriteSMSSessionList() {
        bfavoriteSMSList.clear();
        readfavoriteSMSs();
        favoriteSMSTotalCount = bfavoriteSMSList.size();
        if (favoriteSMSTotalCount <= 0) return;
    }
    private void refreshFavoriteData() {
        new AsyncTask<Void, Void, Void>() {
            @Override
            protected Void doInBackground(Void... arg0) {
                try {
                    getFavoriteSMSSessionList();
                } catch (Throwable e) {
                    Logger.error(e);
                }
                return null;
            }
            @Override
            protected void onPostExecute(Void result) {
                if (favoriteTView != null) {
                    favoriteTView.setText("您收藏了" + bfavoriteSMSList.size() + "条信息");
                }
                DateComparator comp = new DateComparator();
                Collections.sort(bfavoriteSMSList, comp);
                favoriteMyData.clear();
                // 生成动态数组，加入数据
                for (FavoriteSMS one : bfavoriteSMSList) {
                    HashMap<String, Object> map = new HashMap<String, Object>();
                    map.put("ItemID", one.id);
                    if (!one.read) map.put("ItemImage", 1);
                    else map.put("ItemImage", 0);
                    map.put("pNumber", one.address);
                    map.put("ItemPhone", one.address + " " + one.mproperty);
                    // ////////////
                    map.put("ItemMsg", one.body);
                    map.put("ItemDate", one.cDate);
                    favoriteMyData.add(map);
                }
                // 生成适配器的Item和动态数组对应的元素
                favoriteMySimperAdapter = new FavoriteAdapter(SMS_Manage_Main_Activity.this);
                // 添加并且显示
                favoriteLView.setAdapter(favoriteMySimperAdapter);
            }
        }.execute();
    }
    private void refreshBackUpData() {
        new AsyncTask<Void, Void, Void>() {
            String backphoneuptime = "";
            String backupsmstime = "";
            String backupfavoratetime = "";
            int phonetotal = 0;
            @Override
            protected Void doInBackground(Void... arg0) {
                try {
                    ContactBackUp contact = new ContactBackUp();
                    backupphonestate = contact.getbackUpContactCount();
                    phonetotal = contact.getTotal(SMS_Manage_Main_Activity.this);
                    if (backupphonestate > 0) backphoneuptime = contact.getbackUpContactDate();
                    SMSBackup sms = new SMSBackup();
                    backupsmsstate = sms.getbackUpSMSCount();
                    if (backupsmsstate > 0) backupsmstime = sms.getbackUpSMSDate();
                    FavorateBackUp favorate = new FavorateBackUp();
                    backupfavoratestate = favorate.getbackUpFavorateCount();
                    if (backupfavoratestate > 0) backupfavoratetime = favorate.getbackUpFavorateDate();
                } catch (Throwable e) {
                    Logger.error(e);
                }
                return null;
            }
            @Override
            protected void onPostExecute(Void result) {
                if (phonetotal > 0) sms_backup_phone_txt.setText("通讯录(" + phonetotal + ")");
                else sms_backup_phone_txt.setText("通讯录");
                if (inboxSMSTotalCount > 0) sms_backup_sms_txt.setText("短信(" + inboxSMSTotalCount + ")");
                else sms_backup_sms_txt.setText("短信");
                if (favoriteSMSTotalCount > 0) sms_backup_favorate_txt.setText("收藏夹(" + favoriteSMSTotalCount + ")");
                else sms_backup_favorate_txt.setText("收藏夹");
                sms_recover_phone_txt.setText("通讯录");
                sms_recover_sms_txt.setText("短信");
                sms_recover_favorate_txt.setText("收藏夹");
                if (backupphonestate == 0) {
                    //备份
                    sms_backup_phone_time.setText("请插入SD卡");
                    sms_backup_sms_time.setText("......");
                    sms_backup_phone_number.setText("......");
                    sms_backup_sms_number.setText("......");
                    sms_backup_favorate_number.setText("......");
                    sms_backup_favorate_time.setText("......");
                    sms_backup_phone_box.setEnabled(false);
                    sms_backup_sms_box.setEnabled(false);
                    sms_backup_favorate_box.setEnabled(false);
                    //恢复
                    sms_recover_phone_time.setText("请插入SD卡");
                    sms_recover_sms_time.setText("......");
                    sms_recover_phone_number.setText("......");
                    sms_recover_sms_number.setText("......");
                    sms_recover_favorate_number.setText("......");
                    sms_recover_favorate_time.setText("......");
                    sms_recover_phone_box.setEnabled(false);
                    sms_recover_sms_box.setEnabled(false);
                    sms_recover_favorate_box.setEnabled(false);
                } else {
                    if (phonetotal == 0) sms_backup_phone_box.setEnabled(false);
                    else sms_backup_phone_box.setEnabled(true);
                    //通讯录
                    if (backupphonestate == -1) {
                        //备份
                        sms_backup_phone_number.setText("0/" + phonetotal + "(个)");
                        sms_backup_phone_time.setText("......");
                        //恢复
                        sms_recover_phone_number.setText("0/" + phonetotal + "(个)");
                        sms_recover_phone_time.setText("......");
                        sms_recover_phone_box.setEnabled(false);
                    } else {
                        sms_recover_phone_box.setEnabled(true);
                        //备份
                        sms_backup_phone_number.setText(backupphonestate + "/" + phonetotal + "(个)");
                        //恢复
                        sms_recover_phone_number.setText(backupphonestate + "/" + phonetotal + "(个)");
                        sms_recover_phone_txt.setText("通讯录(" + backupphonestate + ")");
                        if (backphoneuptime != null && backphoneuptime.trim().length() > 0) {
                            //备份
                            sms_backup_phone_time.setText(backphoneuptime);
                            //恢复
                            sms_recover_phone_time.setText(backphoneuptime);
                        } else {
                            //备份
                            sms_backup_phone_time.setText("......");
                            //恢复
                            sms_recover_phone_time.setText("......");
                        }
                    }
                    //短信
                    if (inboxSMSTotalCount == 0) sms_backup_sms_box.setEnabled(false);
                    else sms_backup_sms_box.setEnabled(true);
                    if (backupsmsstate == -1) {
                        //备份
                        sms_backup_sms_time.setText("......");
                        sms_backup_sms_number.setText("0/" + inboxSMSTotalCount + "(个)");
                        //恢复
                        sms_recover_sms_time.setText("......");
                        sms_recover_sms_number.setText("0/" + inboxSMSTotalCount + "(个)");
                        sms_recover_sms_box.setEnabled(false);
                    } else {
                        sms_recover_sms_box.setEnabled(true);
                        //备份
                        sms_backup_sms_number.setText(backupsmsstate + "/" + inboxSMSTotalCount + "(个)");
                        //恢复
                        sms_recover_sms_number.setText(backupsmsstate + "/" + inboxSMSTotalCount + "(个)");
                        sms_recover_sms_txt.setText("短信(" + backupsmsstate + ")");
                        if (backupsmstime != null && backupsmstime.trim().length() > 0) {
                            //备份
                            sms_backup_sms_time.setText(backupsmstime);
                            //恢复
                            sms_recover_sms_time.setText(backupsmstime);
                        } else {
                            //备份
                            sms_backup_sms_time.setText("......");
                            //恢复
                            sms_recover_sms_time.setText("......");
                        }
                    }
                    //收藏夹
                    if (favoriteSMSTotalCount == 0) sms_backup_favorate_box.setEnabled(false);
                    else sms_backup_favorate_box.setEnabled(true);
                    if (backupfavoratestate == -1) {
                        //备份
                        sms_backup_favorate_time.setText("......");
                        sms_backup_favorate_number.setText("0/" + favoriteSMSTotalCount + "(个)");
                        //恢复
                        sms_recover_favorate_time.setText("......");
                        sms_recover_favorate_number.setText("0/" + favoriteSMSTotalCount + "(个)");
                        sms_recover_favorate_box.setEnabled(false);
                    } else {
                        sms_recover_favorate_box.setEnabled(true);
                        //备份
                        sms_backup_favorate_number.setText(backupfavoratestate + "/" + favoriteSMSTotalCount + "(个)");
                        //恢复
                        sms_recover_favorate_number.setText(backupfavoratestate + "/" + favoriteSMSTotalCount + "(个)");
                        sms_recover_favorate_txt.setText("收藏夹(" + backupfavoratestate + ")");
                        if (backupfavoratetime != null && backupfavoratetime.trim().length() > 0) {
                            //备份
                            sms_backup_favorate_time.setText(backupfavoratetime);
                            //恢复
                            sms_recover_favorate_time.setText(backupfavoratetime);
                        } else {
                            //备份
                            sms_backup_favorate_time.setText("......");
                            //恢复
                            sms_recover_favorate_time.setText("......");
                        }
                    }
                }
                if (m_Dialog != null && m_Dialog.isShowing()) m_Dialog.dismiss();
            }
        }.execute();
    }
    public class BackUpOnClickListener implements View.OnClickListener {
        @Override
        public void onClick(View v) {
            switch (v.getId()) {
                case biz.AR.id.sms_backup_phone_box: {
                    backupPhone();
                    break;
                }
                case biz.AR.id.sms_backup_sms_box: {
                    backupSMS();
                    break;
                }
                case biz.AR.id.sms_recover_phone_box: {
                    recoverPhone();
                    break;
                }
                case biz.AR.id.sms_recover_sms_box: {
                    recoverSMS();
                    break;
                }
                case biz.AR.id.sms_backup_favorate_box: {
                    backupFavorate();
                    break;
                }
                case biz.AR.id.sms_recover_favorate_box: {
                    recoverFavorate();
                    break;
                }
                default:
                    break;
            }
        }
    };
    private void backupPhone() {
        if (backupphonestate == 0) {
            Toast.makeText(s_tabsActivity, "请插入SD卡", Toast.LENGTH_SHORT).show();
            return;
        }
        new AsyncTask<Void, Void, Void>() {
            @Override
            protected Void doInBackground(Void... arg0) {
                try {
                    ContactBackUp contactbackup = new ContactBackUp();
                    contactbackup.backUpContact(SMS_Manage_Main_Activity.this);
                } catch (Throwable e) {
                    Logger.error(e);
                }
                return null;
            }
            @Override
            protected void onPostExecute(Void result) {
                if (m_Dialog != null && m_Dialog.isShowing() && !isFinishing()) m_Dialog.dismiss();
                refreshBackUpData();
            }
            @Override
            protected void onPreExecute() {
                if ((m_Dialog == null || !m_Dialog.isShowing()) && !isFinishing()) m_Dialog = ProgressDialog.show(SMS_Manage_Main_Activity.this, "请等待...", "正在备份数据，请稍后...", true);
                super.onPreExecute();
            }
        }.execute();
    }
    private void backupSMS() {
        Intent intent = new Intent(SMS_Manage_Main_Activity.this, SMS_Backup_Activity.class);
        startActivityForResult(intent, BACK_UP);
    }
    private void backupFavorate() {
        Intent intent = new Intent(SMS_Manage_Main_Activity.this, Favorate_Backup_Activity.class);
        startActivityForResult(intent, BACK_UP);
    }
    private void recoverPhone() {
        if (backupphonestate == 0) {
            Toast.makeText(s_tabsActivity, "请插入SD卡", Toast.LENGTH_SHORT).show();
            return;
        }
        new AsyncTask<Void, Void, Void>() {
            @Override
            protected Void doInBackground(Void... arg0) {
                try {
                    ContactBackUp contactbackup = new ContactBackUp();
                    contactbackup.recoverContact(SMS_Manage_Main_Activity.this);
                } catch (Throwable e) {
                    Logger.error(e);
                }
                return null;
            }
            @Override
            protected void onPostExecute(Void result) {
                //if(m_Dialog!=null && m_Dialog.isShowing())m_Dialog.dismiss();
                refreshBackUpData();
            }
            @Override
            protected void onPreExecute() {
                if ((m_Dialog == null || !m_Dialog.isShowing()) && !isFinishing()) m_Dialog = ProgressDialog.show(SMS_Manage_Main_Activity.this, "请等待...", "正在恢复数据，请稍后...", true);
                super.onPreExecute();
            }
        }.execute();
    }
    private void recoverSMS() {
        Intent intent = new Intent(SMS_Manage_Main_Activity.this, SMS_Recover_Activity.class);
        startActivityForResult(intent, RECOVER_SMS);
    }
    private void recoverFavorate() {
        Intent intent = new Intent(SMS_Manage_Main_Activity.this, Favorate_Recover_Activity.class);
        startActivityForResult(intent, RECOVER_FAVORATE);
    }
    @Override
    public boolean onContextItemSelected(MenuItem item) {
        try {
            switch (item.getItemId()) {
                case INBOX_MENU_INDEX + 1:// menu.add(1,1,1,"呼叫联系人");
                {
                    int selectedPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    Intent intent = new Intent(Intent.ACTION_CALL, Uri.parse("tel:" + bboxSMSList.get(selectedPosition).pNumber));
                    startActivity(intent);
                }
                    break;
                case INBOX_MENU_INDEX + 2:// menu.add(1,2,2,"删除会话短信(永久)");
                {
                    inboxDelsmsPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    AlertDialog.Builder builder = new AlertDialog.Builder(this).setIcon(biz.AR.drawable.icon).setTitle("提示");
                    builder.setMessage("你确认要删除此号码短信吗?").setCancelable(false).setPositiveButton("确定", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int id) {
                            // Uri mUri = Uri.parse("content://sms/conversations/" +
                            // bboxSMSList.get(delsmsPosition).threadID);
                            //SMS_Inbox_Activity.this.getContentResolver().delete(Uri.parse("content://sms"), "thread_id=?",
                            //		new String[] { bboxSMSList.get(delsmsPosition).threadID + "" });
                            s_tabsActivity.getContentResolver().delete(Uri.parse("content://sms/conversations/" + bboxSMSList.get(inboxDelsmsPosition).threadID), null, null);
                            refreshInboxData();
                            refreshBackUpData();
                        }
                    }).setNegativeButton("取消", null);
                    AlertDialog alert = builder.create();
                    alert.show();
                }
                    break;
                case INBOX_MENU_INDEX + 3:// menu.add(1,3,3,"删除此号码短信(到回收站)");
                {
                    inboxDelsmsPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    SMSSession one = bboxSMSList.get(inboxDelsmsPosition);
                    DatabaseAdapter d = DatabaseAdapter.getInstance(s_tabsActivity);
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
                    //this.getContentResolver().delete(Uri.parse("content://sms"), "thread_id=?", new String[] { one.threadID + "" });
                    getContentResolver().delete(Uri.parse("content://sms/conversations/" + one.threadID), null, null);
                    refreshInboxData();
                    refreshTrashData();
                    refreshBackUpData();
                }
                    break;
                case INBOX_MENU_INDEX + 4:// menu.add(1, 4, 4, "移动到我的收藏夹");
                {
                    inboxDelsmsPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    SMSSession one = bboxSMSList.get(inboxDelsmsPosition);
                    DatabaseAdapter d = DatabaseAdapter.getInstance(s_tabsActivity);
                    Cursor cursor = null;
                    try {
                        cursor = getContentResolver().query(Uri.parse("content://sms/"), new String[] { "read", "date", "body", "type", "status" }, " thread_id=? and (type=1 or type=2)", new String[] { one.threadID + "" }, "date");
                        while (cursor != null && cursor.moveToNext()) {
                            if (!d.existFavoriteSMSs(cursor.getString(1))) {
                                d.addNewSMS2Favorite(one.pNumber, one.person, cursor.getString(2), cursor.getInt(0), cursor.getString(1), cursor.getInt(3), cursor.getInt(4));
                            }
                        }
                    } catch (Throwable e) {
                        // TODO Auto-generated catch block
                        Logger.error(e);
                    } finally {
                        if (cursor != null) cursor.close();
                    }
                    getContentResolver().delete(Uri.parse("content://sms/conversations/" + one.threadID), null, null);
                    refreshInboxData();
                    refreshFavoriteData();
                    refreshBackUpData();
                }
                    break;
                case INBOX_MENU_INDEX + 5:// menu.add(1, 5, 5, "将号码添加到");
                {
                    int selectedPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    Block_AddTo_Activity.pNumber = bboxSMSList.get(selectedPosition).pNumber;
                    Intent intent = new Intent(s_tabsActivity, Block_AddTo_Activity.class);
                    startActivity(intent);
                }
                    break;
                case INBOX_MENU_INDEX + 6://	menu.add(1, 6, 6, "备份到SD卡");
                {
                    inboxDelsmsPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    final SMSSession one = bboxSMSList.get(inboxDelsmsPosition);
                    new AsyncTask<Void, Void, Void>() {
                        @Override
                        protected void onPreExecute() {
                            if ((m_Dialog == null || !m_Dialog.isShowing()) && !isFinishing()) m_Dialog = ProgressDialog.show(s_tabsActivity, "请等待...", "正在备份数据中，请稍等...", true);
                        }
                        // 处理后台执行的任务，在后台线程执行
                        @Override
                        protected Void doInBackground(Void... arg0) {
                            try {
                                Cursor cur = null;
                                ArrayList<SmsField> smslist = new ArrayList<SmsField>();
                                ArrayList<String> keylist = new ArrayList<String>();
                                try {
                                    cur = getContentResolver().query(Uri.parse("content://sms/"), new String[] { "address", "read", "date", "body", "type", "status" }, " thread_id=? and (type=1 or type=2)",
                                            new String[] { one.threadID + "" }, "date");
                                    int address_Column = cur.getColumnIndex("address");
                                    int date_Column = cur.getColumnIndex("date");
                                    int read_Column = cur.getColumnIndex("read");
                                    int type_Column = cur.getColumnIndex("type");
                                    int status_Column = cur.getColumnIndex("status");
                                    int body_Column = cur.getColumnIndex("body");
                                    while (cur != null && cur.moveToNext()) {
                                        SmsField smsField = new SmsField();
                                        smsField.address = cur.getString(address_Column);
                                        smsField.date = cur.getString(date_Column);
                                        smsField.read = cur.getString(read_Column);
                                        smsField.type = cur.getString(type_Column);
                                        smsField.status = cur.getString(status_Column);
                                        smsField.body = cur.getString(body_Column);
                                        smslist.add(smsField);
                                        keylist.add(smsField.date);
                                    }
                                } catch (Throwable e) {
                                    // TODO Auto-generated catch block
                                    Logger.error(e);
                                } finally {
                                    if (cur != null) cur.close();
                                }
                                SMSBackup backup = new SMSBackup();
                                backup.backUpSMS(smslist, keylist);
                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }
                            return null;
                        }
                        // 后台任务执行完之后被调用，在ui线程执行
                        @Override
                        protected void onPostExecute(Void result) {
                            if (!isFinishing()) {
                                refreshBackUpData();
                                if (m_Dialog != null && m_Dialog.isShowing()) m_Dialog.dismiss();
                                Toast.makeText(s_tabsActivity, "备份成功", Toast.LENGTH_SHORT).show();
                            }
                            super.onPostExecute(result);
                        }
                    }.execute();
                }
                    break;
                case TRASH_MENU_INDEX + 1:// menu.add(1,1,1,"呼叫联系人");
                {
                    int selectedPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    Intent intent = new Intent(Intent.ACTION_CALL, Uri.parse("tel:" + bTrashSMSList.get(selectedPosition).address));
                    startActivity(intent);
                }
                    break;
                case TRASH_MENU_INDEX + 2:// menu.add(1,2,2,"删除此短信(永久)");
                {
                    trashDelsmsPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    DatabaseAdapter d = DatabaseAdapter.getInstance(s_tabsActivity);
                    d.delTrashSMS(bTrashSMSList.get(trashDelsmsPosition).id);
                    refreshTrashData();
                }
                    break;
                case TRASH_MENU_INDEX + 3:// menu.add(1, 3, 3, "移动到我的收藏夹");
                {
                    trashDelsmsPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    DatabaseAdapter d = DatabaseAdapter.getInstance(s_tabsActivity);
                    TrashSMS one = bTrashSMSList.get(trashDelsmsPosition);
                    if (!d.existFavoriteSMSs(one.cDate + "")) {
                        d.addNewSMS2Favorite(one.address, one.mproperty, one.body, one.read ? 1 : 0, one.cDate, one.type ? 1 : 2, one.status);
                    }
                    d.delTrashSMS(one.id);
                    refreshTrashData();
                    refreshFavoriteData();
                    refreshBackUpData();
                }
                    break;
                case TRASH_MENU_INDEX + 4://	menu.add(1, 4, 4, "恢复到手机收件箱");
                {
                    trashDelsmsPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    TrashSMS one = bTrashSMSList.get(trashDelsmsPosition);
                    Cursor cursor = null;
                    try {
                        cursor = getContentResolver().query(Uri.parse("content://sms"), new String[] { "date" }, "date=?", new String[] { one.cDate }, null);
                        if (!cursor.moveToFirst()) {// 没有该条短信
                            ContentValues cv = new ContentValues();
                            cv.put("address", one.address);
                            cv.put("read", one.read ? 1 : 0);
                            cv.put("type", one.type ? 1 : 2);
                            cv.put("status", one.status);
                            cv.put("date", one.cDate);
                            cv.put("body", one.body);
                            getContentResolver().insert(Uri.parse("content://sms"), cv);
                        }
                    } catch (Throwable e) {
                        // TODO Auto-generated catch block
                        Logger.error(e);
                    } finally {
                        if (cursor != null) cursor.close();
                    }
                    DatabaseAdapter d = DatabaseAdapter.getInstance(s_tabsActivity);
                    d.delTrashSMS(one.id);
                    refreshTrashData();
                    refreshInboxData();
                    refreshBackUpData();
                }
                    break;
                case TRASH_MENU_INDEX + 5:// menu.add(1, 5, 5, "将号码添加到");
                {
                    int selectedPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    Block_AddTo_Activity.pNumber = bTrashSMSList.get(selectedPosition).address;
                    Intent intent = new Intent(s_tabsActivity, Block_AddTo_Activity.class);
                    startActivity(intent);
                }
                    break;
                case TRASH_MENU_INDEX + 6:// menu.add(1, 6, 6, "复制短信内容");
                {
                    int selectedPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    ClipboardManager clip = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
                    clip.setText(bTrashSMSList.get(selectedPosition).body);
                }
                    break;
                case FAVORITE_MENU_INDEX + 1:// menu.add(1,1,1,"呼叫联系人");
                {
                    int selectedPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    Intent intent = new Intent(Intent.ACTION_CALL, Uri.parse("tel:" + bfavoriteSMSList.get(selectedPosition).address));
                    startActivity(intent);
                }
                    break;
                case FAVORITE_MENU_INDEX + 2:// menu.add(1,2,2,"删除此短信(到回收站)");
                {
                    favoriteDelsmsPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    DatabaseAdapter d = DatabaseAdapter.getInstance(s_tabsActivity);
                    FavoriteSMS one = bfavoriteSMSList.get(favoriteDelsmsPosition);
                    d.addNewSMS2Trash(one.address, one.mproperty, one.body, one.read ? 1 : 0, one.cDate, one.type ? 1 : 2, one.status);
                    d.delFavoriteSMS(one.id);
                    refreshFavoriteData();
                    refreshTrashData();
                    refreshBackUpData();
                }
                    break;
                case FAVORITE_MENU_INDEX + 3://	menu.add(1, 3, 3, "恢复到手机收件箱");
                {
                    favoriteDelsmsPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    FavoriteSMS one = bfavoriteSMSList.get(favoriteDelsmsPosition);
                    Cursor cursor = null;
                    try {
                        cursor = getContentResolver().query(Uri.parse("content://sms"), new String[] { "date" }, "date=?", new String[] { one.cDate }, null);
                        if (!cursor.moveToFirst()) {// 没有该条短信
                            ContentValues cv = new ContentValues();
                            cv.put("address", one.address);
                            cv.put("read", one.read ? 1 : 0);
                            cv.put("type", one.type ? 1 : 2);
                            cv.put("status", one.status);
                            cv.put("body", one.body);
                            cv.put("date", one.cDate);
                            getContentResolver().insert(Uri.parse("content://sms"), cv);
                        }
                    } catch (Throwable e) {
                        // TODO Auto-generated catch block
                        Logger.error(e);
                    } finally {
                        if (cursor != null) cursor.close();
                    }
                    DatabaseAdapter d = DatabaseAdapter.getInstance(s_tabsActivity);
                    d.delFavoriteSMS(one.id);
                    refreshFavoriteData();
                    refreshInboxData();
                    refreshBackUpData();
                }
                    break;
                case FAVORITE_MENU_INDEX + 4:// menu.add(1, 4, 4, "将号码添加到");
                {
                    int selectedPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    Block_AddTo_Activity.pNumber = bfavoriteSMSList.get(selectedPosition).address;
                    Intent intent = new Intent(s_tabsActivity, Block_AddTo_Activity.class);
                    startActivity(intent);
                }
                    break;
                case FAVORITE_MENU_INDEX + 5:// menu.add(1, 5, 5, "复制短信内容");
                {
                    int selectedPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    ClipboardManager clip = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
                    clip.setText(bfavoriteSMSList.get(selectedPosition).body);
                }
                    break;
                case FAVORITE_MENU_INDEX + 6://	menu.add(1, 6, 6, "备份到SD卡");
                {
                    favoriteDelsmsPosition = ((AdapterContextMenuInfo) item.getMenuInfo()).position;
                    final FavoriteSMS one = bfavoriteSMSList.get(favoriteDelsmsPosition);
                    new AsyncTask<Void, Void, Void>() {
                        @Override
                        protected void onPreExecute() {
                            if ((m_Dialog == null || !m_Dialog.isShowing()) && !isFinishing()) m_Dialog = ProgressDialog.show(s_tabsActivity, "请等待...", "正在备份数据中，请稍等...", true);
                        }
                        // 处理后台执行的任务，在后台线程执行
                        @Override
                        protected Void doInBackground(Void... arg0) {
                            try {
                                FavorateBackUp backup = new FavorateBackUp();
                                backup.backUpFavorate(one);
                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }
                            return null;
                        }
                        // 后台任务执行完之后被调用，在ui线程执行
                        @Override
                        protected void onPostExecute(Void result) {
                            if (!isFinishing()) {
                                refreshBackUpData();
                                if (m_Dialog != null && m_Dialog.isShowing()) m_Dialog.dismiss();
                                Toast.makeText(s_tabsActivity, "备份成功", Toast.LENGTH_SHORT).show();
                            }
                            super.onPostExecute(result);
                        }
                    }.execute();
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
            FavoriteSMS one = (FavoriteSMS) object1;
            FavoriteSMS two = (FavoriteSMS) object2;
            long date1 = 0, date2 = 0;
            try {
                date1 = Long.parseLong(one.cDate);
                date2 = Long.parseLong(two.cDate);
            } catch (Throwable e) {
                Logger.error(e);
            }
            if (date1 > date2) return -1;
            else if (date1 < date2) return 1;
            else return 0;
        }
    }
    public class InboxMyHandler extends Handler {
        public InboxMyHandler(Looper looper) {
            super(looper);
        }
        @Override
        public void handleMessage(Message msg) {
            inboxDisplayData();
            if (m_Dialog != null && m_Dialog.isShowing() && !isFinishing()) m_Dialog.dismiss();
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
                    ((ImageView) findViewById(biz.AR.id.sms_manage_main_bar_img)).setBackgroundResource(biz.AR.drawable.tab_tag_1);
                    break;
                case 1:
                    ((ImageView) findViewById(biz.AR.id.sms_manage_main_bar_img)).setBackgroundResource(biz.AR.drawable.tab_tag_2);
                    break;
                case 2:
                    ((ImageView) findViewById(biz.AR.id.sms_manage_main_bar_img)).setBackgroundResource(biz.AR.drawable.tab_tag_3);
                    break;
                case 3:
                    ((ImageView) findViewById(biz.AR.id.sms_manage_main_bar_img)).setBackgroundResource(biz.AR.drawable.tab_tag_4);
                    break;
            }
            img[arg0].setChecked(true);
            tabIndex = arg0;
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
            return inboxMyData.size();
        }
        @Override
        public Object getItem(int position) {
            return inboxMyData.get(position);
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
                convertView = mInflater.inflate(biz.AR.layout.sms_inbox_listview_item, parent, false);
                holder = new InboxVuewHolder();
                holder.threadId = (TextView) convertView.findViewById(biz.AR.id.sms_inbox_listview_item_id_txt);
                holder.img = (ImageView) convertView.findViewById(biz.AR.id.sms_inbox_listview_item_img);
                holder.phone = (TextView) convertView.findViewById(biz.AR.id.sms_inbox_listview_item_Phone_txt);
                holder.msg = (TextView) convertView.findViewById(biz.AR.id.sms_inbox_listview_item_Msg_txt);
                holder.date = (TextView) convertView.findViewById(biz.AR.id.sms_inbox_listview_item_Msg_date);
                convertView.setTag(holder);
            } else {
                holder = (InboxVuewHolder) convertView.getTag();
            }
            holder.threadId.setText(String.valueOf(inboxMyData.get(position).get("ThreadID")));
            String ItemPhone = String.valueOf(inboxMyData.get(position).get("pNumber")).trim();
            int logo = MessageUtils.getLogo(ItemPhone);
            if (contactMap.containsKey(ItemPhone) && contactMap.get(ItemPhone).getPhoto() != null) {
                ByteArrayInputStream is = new ByteArrayInputStream(contactMap.get(ItemPhone).getPhoto());
                Bitmap map = BitmapFactory.decodeStream(is);
                holder.img.setImageBitmap(map);
            } else if (logo > 0) {
                holder.img.setImageResource(logo);
            } else {
                holder.img.setImageResource(biz.AR.drawable.phone_person_icon);
            }
            if (Integer.parseInt(String.valueOf(inboxMyData.get(position).get("ItemImage"))) == 0) {
                holder.phone.setTextColor(getResources().getColor(biz.AR.color.txt_label_black));
                holder.msg.getPaint().setFakeBoldText(false);
            } else {
                holder.phone.setTextColor(getResources().getColor(biz.AR.color.black));
                holder.msg.getPaint().setFakeBoldText(true);
            }
            holder.phone.setText(String.valueOf(inboxMyData.get(position).get("ItemPhone")));
            holder.msg.setText(Html.fromHtml(MessageUtils.explain(String.valueOf(inboxMyData.get(position).get("ItemMsg"))), imageGetter, null));
            holder.date.setText(String.valueOf(inboxMyData.get(position).get("ItemDate")));
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
    /**
     * 进程适配器
     * 
     * @author Administrator
     * 
     */
    class TrashAdapter extends BaseAdapter {
        Context mcontext;
        public TrashAdapter(Context context) {
            mcontext = context;
        }
        @Override
        public int getCount() {
            return trashMyData.size();
        }
        @Override
        public Object getItem(int position) {
            return trashMyData.get(position);
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
            TrashVuewHolder holder;
            if (convertView == null) {
                final LayoutInflater mInflater = (LayoutInflater) mcontext.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                convertView = mInflater.inflate(biz.AR.layout.sms_trash_listview_item, parent, false);
                holder = new TrashVuewHolder();
                holder.threadId = (TextView) convertView.findViewById(biz.AR.id.sms_trash_listview_item_id_txt);
                holder.img = (ImageView) convertView.findViewById(biz.AR.id.sms_trash_listview_item_img);
                holder.phone = (TextView) convertView.findViewById(biz.AR.id.sms_trash_listview_item_Phone_txt);
                holder.msg = (TextView) convertView.findViewById(biz.AR.id.sms_trash_listview_item_Msg_txt);
                holder.date = (TextView) convertView.findViewById(biz.AR.id.sms_trash_listview_item_Msg_date);
                convertView.setTag(holder);
            } else {
                holder = (TrashVuewHolder) convertView.getTag();
            }
            holder.threadId.setText(String.valueOf(trashMyData.get(position).get("ThreadID")));
            String ItemPhone = String.valueOf(trashMyData.get(position).get("pNumber")).trim();
            int logo = MessageUtils.getLogo(ItemPhone);
            if (contactMap.containsKey(ItemPhone) && contactMap.get(ItemPhone).getPhoto() != null) {
                ByteArrayInputStream is = new ByteArrayInputStream(contactMap.get(ItemPhone).getPhoto());
                Bitmap map = BitmapFactory.decodeStream(is);
                holder.img.setImageBitmap(map);
            } else if (logo > 0) {
                holder.img.setImageResource(logo);
            } else {
                holder.img.setImageResource(biz.AR.drawable.phone_person_icon);
            }
            if (Integer.parseInt(String.valueOf(trashMyData.get(position).get("ItemImage"))) == 0) {
                holder.phone.setTextColor(getResources().getColor(biz.AR.color.txt_label_black));
                holder.msg.getPaint().setFakeBoldText(false);
            } else {
                holder.phone.setTextColor(getResources().getColor(biz.AR.color.black));
                holder.msg.getPaint().setFakeBoldText(true);
            }
            if (contactMap.containsKey(ItemPhone) && contactMap.get(ItemPhone).niceName != null) {
                holder.phone.setText(contactMap.get(ItemPhone).niceName + " " + String.valueOf(trashMyData.get(position).get("ItemPhone")));
            } else holder.phone.setText(String.valueOf(trashMyData.get(position).get("ItemPhone")));
            holder.msg.setText(Html.fromHtml(MessageUtils.explain(String.valueOf(trashMyData.get(position).get("ItemMsg"))), imageGetter, null));
            holder.date.setText(MessageUtils.getDateFormat(String.valueOf(trashMyData.get(position).get("ItemDate"))));
            return convertView;
        }
    }
    static class TrashVuewHolder {
        private TextView threadId;
        private ImageView img;
        private TextView phone;
        private TextView msg;
        private TextView date;
    }
    class FavoriteAdapter extends BaseAdapter {
        Context mcontext;
        public FavoriteAdapter(Context context) {
            mcontext = context;
        }
        @Override
        public int getCount() {
            return favoriteMyData.size();
        }
        @Override
        public Object getItem(int position) {
            return favoriteMyData.get(position);
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
            FavoriteVuewHolder holder;
            if (convertView == null) {
                final LayoutInflater mInflater = (LayoutInflater) mcontext.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                convertView = mInflater.inflate(biz.AR.layout.sms_favorite_listview_item, parent, false);
                holder = new FavoriteVuewHolder();
                holder.threadId = (TextView) convertView.findViewById(biz.AR.id.sms_favorite_listview_item_id_txt);
                holder.img = (ImageView) convertView.findViewById(biz.AR.id.sms_favorite_listview_item_img);
                holder.phone = (TextView) convertView.findViewById(biz.AR.id.sms_favorite_listview_item_Phone_txt);
                holder.msg = (TextView) convertView.findViewById(biz.AR.id.sms_favorite_listview_item_Msg_txt);
                holder.date = (TextView) convertView.findViewById(biz.AR.id.sms_favorite_listview_item_Msg_date);
                convertView.setTag(holder);
            } else {
                holder = (FavoriteVuewHolder) convertView.getTag();
            }
            holder.threadId.setText(String.valueOf(favoriteMyData.get(position).get("ThreadID")));
            String ItemPhone = String.valueOf(favoriteMyData.get(position).get("pNumber")).trim();
            int logo = MessageUtils.getLogo(ItemPhone);
            if (contactMap.containsKey(ItemPhone) && contactMap.get(ItemPhone).getPhoto() != null) {
                ByteArrayInputStream is = new ByteArrayInputStream(contactMap.get(ItemPhone).getPhoto());
                Bitmap map = BitmapFactory.decodeStream(is);
                holder.img.setImageBitmap(map);
            } else if (logo > 0) {
                holder.img.setImageResource(logo);
            } else {
                holder.img.setImageResource(biz.AR.drawable.phone_person_icon);
            }
            if (Integer.parseInt(String.valueOf(favoriteMyData.get(position).get("ItemImage"))) == 0) {
                holder.phone.setTextColor(getResources().getColor(biz.AR.color.txt_label_black));
                holder.msg.getPaint().setFakeBoldText(false);
            } else {
                holder.phone.setTextColor(getResources().getColor(biz.AR.color.black));
                holder.msg.getPaint().setFakeBoldText(true);
            }
            if (contactMap.containsKey(ItemPhone) && contactMap.get(ItemPhone).niceName != null) {
                holder.phone.setText(contactMap.get(ItemPhone).niceName + " " + String.valueOf(favoriteMyData.get(position).get("ItemPhone")));
            } else holder.phone.setText(String.valueOf(favoriteMyData.get(position).get("ItemPhone")));
            holder.msg.setText(Html.fromHtml(MessageUtils.explain(String.valueOf(favoriteMyData.get(position).get("ItemMsg"))), imageGetter, null));
            holder.date.setText(MessageUtils.getDateFormat(String.valueOf(favoriteMyData.get(position).get("ItemDate"))));
            return convertView;
        }
    }
    static class FavoriteVuewHolder {
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
    @Override
    protected void onPause() {
        if (m_Dialog != null && m_Dialog.isShowing() && !isFinishing()) {
            m_Dialog.dismiss();
        }
        super.onPause();
    }
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (resultCode == RESULT_OK) {
            if (requestCode == BACK_UP) {
                refreshBackUpData();
            } else if (requestCode == RECOVER_SMS) {
                refreshInboxData();
                refreshBackUpData();
            } else if (requestCode == RECOVER_FAVORATE) {
                refreshFavoriteData();
                refreshBackUpData();
            }
        }
        super.onActivityResult(requestCode, resultCode, data);
    }
    private boolean testSDCard() {
        if (android.os.Environment.getExternalStorageState().equals(android.os.Environment.MEDIA_MOUNTED)) { return true; }
        return false;
    }
}