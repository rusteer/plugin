package main.ui;
import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import main.backup.SMSBackup;
import main.backup.SmsField;
import main.block.BlockSMS;
import main.block.SMSSession;
import main.callphone.SettingSave;
import main.database.DBManager;
import main.database.DatabaseAdapter;
import main.message.MessageUtils;
import main.message.SendMessageActivity;
import main.privates.PrivateSMS;
import net.workspace.util.Logger;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.ContentValues;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
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
import android.provider.ContactsContract;
import android.telephony.SmsManager;
import android.text.ClipboardManager;
import android.text.Editable;
import android.text.Html;
import android.text.Html.ImageGetter;
import android.text.TextWatcher;
import android.text.util.Linkify;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

public class SMSSession_Activity extends Activity implements OnClickListener {
    private final int WC = LinearLayout.LayoutParams.WRAP_CONTENT;
    private SmsSendResult smsSendResult;
    private ArrayList<ONESMS> smsList = new ArrayList<SMSSession_Activity.ONESMS>();
    public static SMSSession smsSession = new SMSSession();
    private int curIndex = 0;
    private String SENDACTION_FLAG = "smssessionActivity";
    LinearLayout main;
    ScrollView smssession_scroll_layout;
    private Bitmap personBitmap = null;
    private String contactID = null;
    private boolean displayGrid = false;
    ImageView select_expression;//选择表情
    GridView gridView; // 网格，显示表情
    //private ProgressDialog m_Dialog;
    private int mode = 0;//多点触控监控
    private float oldDistance;
    private float newDistance;
    /**
     * 处理自定义的消息
     */
    public static MyHandler handler = null;
    class ONESMS {
        public int id;
        public String msg = "";
        public long date;
        public int readFlag;
        public boolean in;
    }
    public class MyHandler extends Handler {
        public MyHandler(Looper looper) {
            super(looper);
        }
        @Override
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 2:// 有短信消息到达,等秒刷新
                {
                    new Thread(new Runnable() {
                        @Override
                        public void run() {
                            try {
                                Thread.sleep(2000);
                                if (SMSSession_Activity.handler != null) {
                                    Message msg2 = SMSSession_Activity.handler.obtainMessage();
                                    msg2.what = 1;
                                    SMSSession_Activity.handler.sendMessage(msg2);
                                }
                            } catch (InterruptedException e) {}
                        }
                    }).start();
                }
                    break;
                case 1:// 有短信消息到达,更新数据
                {
                    load();
                }
                    break;
            }
        }
    }
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.smssession_activity);
        handler = new MyHandler(Looper.getMainLooper());
        getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);
        main = (LinearLayout) findViewById(biz.AR.id.smssession_main_layout);
        smssession_scroll_layout = (ScrollView) findViewById(biz.AR.id.smssession_scroll_layout);
        main.setBackgroundResource(Global_Var.mainBG_Imges[Global_Var.currMainBGIndex]);
        // ///////////////////////////////
        //		new AsyncTask<Void, Void, Void>(){
        //   			@Override
        //			protected Void doInBackground(Void... arg0) {
        try {
            if (smsSession.mproperty.equals("")) {
                DBManager dbManager = new DBManager(SMSSession_Activity.this);
                dbManager.openDatabase();
                smsSession.mproperty = dbManager.mobileInfo(smsSession.pNumber);
                dbManager.closeDatabase();
            }
            if (null == personBitmap) {
                byte[] photo = DatabaseAdapter.getInstance(SMSSession_Activity.this).getPhoto(smsSession.pNumber);
                int logo = MessageUtils.getLogo(smsSession.pNumber);
                if (photo != null) {
                    ByteArrayInputStream is = new ByteArrayInputStream(photo);
                    personBitmap = BitmapFactory.decodeStream(is);
                } else if (logo > 0) {
                    personBitmap = BitmapFactory.decodeResource(SMSSession_Activity.this.getResources(), logo);
                } else {
                    personBitmap = BitmapFactory.decodeResource(SMSSession_Activity.this.getResources(), biz.AR.drawable.phone_person_icon);
                }
            }
            if (smsSession.pNumber != null && smsSession.pNumber.trim().length() > 0) {
                contactID = DatabaseAdapter.getInstance(SMSSession_Activity.this).getContactID(smsSession.pNumber);
            }
        } catch (Throwable e) {
            Logger.error(e);
        }
        //				return null;
        //			}
        //			@Override
        //			protected void onPostExecute(Void result) {
        load();
        final GuesterLinearLayout layout = (GuesterLinearLayout) findViewById(biz.AR.id.smssession_content_layout);
        layout.setOnTouchListener(new OnTouchListener() {
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
                                    int txtsize = SettingSave.getInstance(SMSSession_Activity.this).getIntValue("sms_session_textsize", 16);
                                    if (txtsize < 22) SettingSave.getInstance(SMSSession_Activity.this).saveIntValue("sms_session_textsize", txtsize + 1);
                                    load();
                                } else if (oldDistance - newDistance > 10f) {
                                    oldDistance = newDistance;
                                    int txtsize = SettingSave.getInstance(SMSSession_Activity.this).getIntValue("sms_session_textsize", 16);
                                    if (txtsize > 10) SettingSave.getInstance(SMSSession_Activity.this).saveIntValue("sms_session_textsize", txtsize - 1);
                                    load();
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
        select_expression = (ImageView) findViewById(biz.AR.id.select_expression);
        gridView = (GridView) findViewById(biz.AR.id.myGrid);
        gridView.setAdapter(new ImageAdapter(SMSSession_Activity.this));
        displayGrid = false;
        select_expression.setOnClickListener(SMSSession_Activity.this);
        gridView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> arg0, View arg1, int arg2, long arg3) {
                //					ToastManager.cancelToast();
                int gid = MessageUtils.expression_Q_buttons[(int) arg3];
                ((EditText) findViewById(biz.AR.id.smssession_msg_txt)).append(Html.fromHtml("<img src='" + gid + "'/>", imageGetter, null));
            }
        });
        Button bt = (Button) findViewById(biz.AR.id.smssession_send_bt);
        bt.setOnClickListener(SMSSession_Activity.this);
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(SMSSession_Activity.this);
        EditText eText = (EditText) findViewById(biz.AR.id.smssession_msg_txt);
        eText.addTextChangedListener(new TextWatcher() {
            @Override
            public void onTextChanged(CharSequence str, int start, int before, int count) {
                EditText eText = (EditText) findViewById(biz.AR.id.smssession_msg_txt);
                TextView tView = (TextView) findViewById(biz.AR.id.smssession_msglen_txt);
                String s = MessageUtils.FilterHtml(Html.toHtml(eText.getText()));
                if (s.length() <= 70) tView.setText(s.length() + "/70");
                else {
                    tView.setText(s.length() + "/" + (s.length() / 70 + 1));
                }
            }
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
            @Override
            public void afterTextChanged(Editable s) {}
        });
        if (smsSession.type == 1) SENDACTION_FLAG = "BLOCK_SEND_ACTION";
        else if (smsSession.type == 2) SENDACTION_FLAG = "PRIVATE_SEND_ACTION";
        else SENDACTION_FLAG = "INBOX_SEND_ACTION";
        IntentFilter intentFilter = new IntentFilter(SENDACTION_FLAG);
        if (smsSendResult == null) {
            smsSendResult = new SmsSendResult();
            registerReceiver(smsSendResult, intentFilter);
        }
        // //进入发送消息
        if (smsSession.actionType == 1) {
            smsSession.actionType = 0;
            eText.setText(Html.fromHtml(MessageUtils.explain(smsSession.msg), imageGetter, null));
            SmsManager sms = SmsManager.getDefault();
            Intent intent = new Intent(SENDACTION_FLAG);
            bt.setText("发送中...");
            eText.setEnabled(false);
            PendingIntent sendPi = PendingIntent.getBroadcast(SMSSession_Activity.this, 0, intent, 0);
            // 如果字数超过70,需拆分成多条短信发送
            if (smsSession.msg.length() > 70) {
                ArrayList<String> msgs = sms.divideMessage(smsSession.msg);
                ArrayList<PendingIntent> intentlist = new ArrayList<PendingIntent>();
                intentlist.add(sendPi);
                for (int i = 1, n = msgs.size(); i < n; i++) {
                    intentlist.add(null);
                }
                sms.sendMultipartTextMessage(smsSession.pNumber, null, msgs, intentlist, null);
            } else {
                sms.sendTextMessage(smsSession.pNumber, null, smsSession.msg, sendPi, null);
            }
        }
        //			}
        //			@Override
        //			protected void onPreExecute() {
        //				//if(m_Dialog==null || !m_Dialog.isShowing())m_Dialog = ProgressDialog.show(SMSSession_Activity.this, "请等待...", "正在动态加载数据，请稍后...", true);
        //				super.onPreExecute();
        //			}
        //    	}.execute();
        // /////////////
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) {
            if (!displayGrid) {
                // 按下的如果是BACK，同时没有重复
                System.gc();
                SMSSession_Activity.this.finish();
                return false;
            } else {
                displayGrid = false;
                gridView.setVisibility(View.GONE);
                return false;
            }
        }
        return super.onKeyDown(keyCode, event);
    }
    @Override
    protected void onDestroy() {
        super.onDestroy();
        unregisterReceiver(smsSendResult);
        smsSendResult = null;
        handler = null;
    }
    @Override
    protected void onStart() {
        super.onStart();
    }
    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case biz.AR.id.smssession_send_bt: {
                try {
                    EditText et = (EditText) findViewById(biz.AR.id.smssession_msg_txt);
                    String msg = MessageUtils.FilterHtml(Html.toHtml(et.getText()));
                    if (msg.length() == 0) {
                        Toast.makeText(this, "不能发空的内容!!!", Toast.LENGTH_SHORT).show();
                        return;
                    }
                    SmsManager sms = SmsManager.getDefault();
                    Intent intent = new Intent(SENDACTION_FLAG);
                    PendingIntent sendPi = PendingIntent.getBroadcast(this, 0, intent, 0);
                    Button bt = (Button) findViewById(biz.AR.id.smssession_send_bt);
                    // 如果字数超过70,需拆分成多条短信发送
                    // 如果字数超过70,需拆分成多条短信发送
                    if (smsSession.msg.length() > 70) {
                        ArrayList<String> msgs = sms.divideMessage(msg);
                        ArrayList<PendingIntent> intentlist = new ArrayList<PendingIntent>();
                        intentlist.add(sendPi);
                        for (int i = 1, n = msgs.size(); i < n; i++) {
                            intentlist.add(null);
                        }
                        sms.sendMultipartTextMessage(smsSession.pNumber, null, msgs, intentlist, null);
                    } else {
                        sms.sendTextMessage(smsSession.pNumber, null, msg, sendPi, null);
                    }
                    bt.setText("发送中...");
                    et.setEnabled(false);
                    load();
                } catch (Throwable e) {
                    // TODO Auto-generated catch block
                    Logger.error(e);
                }
            }
                break;
            case biz.AR.id.back:
                System.gc();
                SMSSession_Activity.this.finish();
                break;
            case biz.AR.id.select_expression:
                if (displayGrid) {
                    displayGrid = false;
                    gridView.setVisibility(View.GONE);
                } else {
                    displayGrid = true;
                    gridView.setVisibility(View.VISIBLE);
                }
                break;
        }
    }
    private void ReadBoxSMS() {
        smsList.clear();
        Cursor cursor = null;
        int n = 0;
        try {
            if (smsSession.actionType == 1 || smsSession.id == 0) cursor = getContentResolver().query(Uri.parse("content://sms/"), new String[] { "_id", "thread_id", "address", "read", "person", "date", "body", "type" },
                    " address=? and (type=1 or type=2)", new String[] { smsSession.pNumber }, "date");
            else cursor = getContentResolver().query(Uri.parse("content://sms/"), new String[] { "_id", "thread_id", "address", "read", "person", "date", "body", "type" }, " thread_id=? and (type=1 or type=2)",
                    new String[] { smsSession.id + "" }, "date");
            n = 0;
            while (cursor != null && cursor.moveToNext()) {
                ONESMS one = new ONESMS();
                one.id = cursor.getInt(0);
                // one.pNumber = cursor.getString(2);
                one.readFlag = cursor.getInt(3);
                // one.person = cursor.getString(4);
                one.date = cursor.getLong(5);
                one.msg = cursor.getString(6);
                one.in = cursor.getInt(7) == 1 ? true : false;
                smsList.add(one);
                if (smsSession.id == 0) {
                    smsSession.id = cursor.getInt(1);
                }
                n++;
            }
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        } finally {
            if (cursor != null) cursor.close();
        }
        if (n == 0) smsSession.id = 0;
        ContentValues cv = new ContentValues();
        cv.put("read", 1);// 0：未读，1：已读
        getContentResolver().update(Uri.parse("content://sms/"), cv, "thread_id=?", new String[] { smsSession.id + "" });
    }
    private void readPrivateSMS() {
        smsList.clear();
        DatabaseAdapter da = DatabaseAdapter.getInstance(this);
        ArrayList<PrivateSMS> smss = da.readPrivateSMSSession(smsSession.pNumber);
        for (PrivateSMS one : smss) {
            ONESMS the = new ONESMS();
            the.id = one.id;
            the.in = one.type;
            the.readFlag = one.read ? 1 : 0;
            the.msg = one.body;
            the.date = Long.parseLong(one.cDate);
            smsList.add(the);
        }
    }
    private void readBlockSMS() {
        smsList.clear();
        DatabaseAdapter da = DatabaseAdapter.getInstance(this);
        ArrayList<BlockSMS> smss = da.readBlockSMS(smsSession.pNumber);
        for (BlockSMS one : smss) {
            ONESMS the = new ONESMS();
            the.id = one.id;
            the.in = one.type;
            the.readFlag = one.read ? 1 : 0;
            the.msg = one.body;
            the.date = Long.parseLong(one.cDate);
            smsList.add(the);
        }
    }
    private void load() {
        final LinearLayout layout = (LinearLayout) findViewById(biz.AR.id.smssession_content_layout);
        layout.removeAllViews();
        //		new AsyncTask<Void, Void, Void>(){
        //   			@Override
        //			protected Void doInBackground(Void... arg0) {
        try {
            if (smsSession.type == 3) ReadBoxSMS();
            else if (smsSession.type == 2) readPrivateSMS();
            if (smsSession.type == 1) readBlockSMS();
        } catch (Throwable e) {
            Logger.error(e);
        }
        //				return null;
        //			}
        //			@Override
        //			protected void onPostExecute(Void result) {
        int inCount = 0, outCount = 0, id = 0;
        int mybg = getMybg(getMyTextbg());
        int otherbg = getOtherbg(getOtherTextbg());
        int mycolor = getMyTextColor();
        int othercolor = getOtherTextColor();
        int textsize = SettingSave.getInstance(SMSSession_Activity.this).getIntValue("sms_session_textsize", 16);
        for (ONESMS one : smsList) {
            id = inCount + outCount + 10;
            LinearLayout bgLayout = new LinearLayout(SMSSession_Activity.this);
            bgLayout.setOrientation(LinearLayout.HORIZONTAL);
            bgLayout.setPadding(0, 5, 0, 5);
            LinearLayout onesmsLayout = new LinearLayout(SMSSession_Activity.this);
            onesmsLayout.setOrientation(LinearLayout.HORIZONTAL);
            LinearLayout.LayoutParams oneLayoutParams = new LinearLayout.LayoutParams(WC, WC);
            oneLayoutParams.gravity = Gravity.CENTER;
            oneLayoutParams.weight = 1;
            // 一个相关布局为一条完整的短信消息（包括短信内容msgView和日期tDate
            // 2个控件）+rWeight控制消息在（收到的消息）左边或者右边（发出的消息）
            TextView rWeightTextView = new TextView(SMSSession_Activity.this);
            LinearLayout.LayoutParams rWeightTextView_params = new LinearLayout.LayoutParams(WC, WC);
            rWeightTextView_params.weight = 1;
            if (!one.in) onesmsLayout.addView(rWeightTextView, rWeightTextView_params); // 对出去的消息,将rWeightTextView_params添加在左边
            RelativeLayout relativeLayout = new RelativeLayout(SMSSession_Activity.this);
            //文字背景
            relativeLayout.setBackgroundResource(one.in ? otherbg : mybg);
            RelativeLayout.LayoutParams relativeLayout_params = new RelativeLayout.LayoutParams(WC, WC);
            relativeLayout.setPadding(20, 10, 20, 10);
            relativeLayout.setLayoutParams(relativeLayout_params);
            TextView smsTextView = new TextView(SMSSession_Activity.this);
            //字体颜色
            if (one.in) setRightColor(smsTextView, othercolor);
            else setRightColor(smsTextView, mycolor);
            smsTextView.setTextSize(textsize);
            smsTextView.setId(id);
            smsTextView.setAutoLinkMask(Linkify.ALL);
            smsTextView.setOnTouchListener(new OnTouchListener() {
                @Override
                public boolean onTouch(View v, MotionEvent event) {
                    return false;
                }
            });
            smsTextView.setOnClickListener(new OnClickListener() {
                @Override
                public void onClick(View v) {
                    curIndex = v.getId() - 10;
                    showDialog(1);
                }
            });
            String dString = MessageUtils.getDateFormat(one.date + "");
            RelativeLayout.LayoutParams smsTextView_params = new RelativeLayout.LayoutParams(WC, WC);
            smsTextView_params.addRule(RelativeLayout.ALIGN_PARENT_LEFT); // 设置相对属性,需先指定相对控件的ID
            smsTextView.setText(Html.fromHtml(MessageUtils.explain(one.msg), imageGetter, null));
            smsTextView.setPadding(5, 5, 5, 5);
            relativeLayout.addView(smsTextView, smsTextView_params);
            TextView tDate = new TextView(SMSSession_Activity.this);
            tDate.setTextSize(12);
            tDate.setText(dString);
            tDate.setTextColor(getResources().getColor(biz.AR.color.half_black));
            tDate.setEnabled(false);
            tDate.setLines(1);
            RelativeLayout.LayoutParams tDate_params = new RelativeLayout.LayoutParams(WC, WC);
            tDate_params.addRule(RelativeLayout.BELOW, id);
            tDate_params.addRule(RelativeLayout.ALIGN_RIGHT, id);
            relativeLayout.addView(tDate, tDate_params);
            onesmsLayout.addView(relativeLayout);
            if (one.in) inCount++;
            else outCount++;
            if (one.in) onesmsLayout.addView(rWeightTextView, rWeightTextView_params); // 对进来的消息,将rWeight添加在后面
            if (one.in) {
                LinearLayout.LayoutParams bgLayoutParams = new LinearLayout.LayoutParams(WC, WC);
                bgLayoutParams.gravity = Gravity.LEFT | Gravity.CENTER_VERTICAL;
                bgLayout.setLayoutParams(bgLayoutParams);
                ImageView image = new ImageView(SMSSession_Activity.this);
                image.setImageBitmap(personBitmap);
                LinearLayout.LayoutParams imageView_params = new LinearLayout.LayoutParams(dip2px(46), dip2px(46));
                imageView_params.setMargins(0, 2, 0, 0);
                image.setOnClickListener(new ImageOnClickListener());
                oneLayoutParams.setMargins(2, 0, 0, 0);
                bgLayout.addView(image, imageView_params);
                bgLayout.addView(onesmsLayout, oneLayoutParams);
            } else {
                LinearLayout.LayoutParams bgLayoutParams = new LinearLayout.LayoutParams(WC, WC);
                bgLayoutParams.gravity = Gravity.RIGHT | Gravity.CENTER_VERTICAL;
                bgLayout.setLayoutParams(bgLayoutParams);
                ImageView image = new ImageView(SMSSession_Activity.this);
                image.setImageResource(biz.AR.drawable.phone_person_icon1);
                LinearLayout.LayoutParams imageView_params = new LinearLayout.LayoutParams(dip2px(46), dip2px(46));
                imageView_params.setMargins(0, 2, 0, 0);
                oneLayoutParams.setMargins(0, 0, 2, 0);
                bgLayout.addView(onesmsLayout, oneLayoutParams);
                bgLayout.addView(image, imageView_params);
            }
            layout.addView(bgLayout);
        }
        TextView titleTextView = (TextView) findViewById(biz.AR.id.smssession_main_title_txt);
        if (smsSession.niceName != null && smsSession.niceName.trim().length() > 0) titleTextView.setText(smsSession.niceName + " " + smsSession.pNumber + "(" + inCount + "/" + outCount + ")" + " " + smsSession.mproperty);
        else titleTextView.setText(smsSession.pNumber + "(" + inCount + "/" + outCount + ")" + " " + smsSession.mproperty);
        smssession_scroll_layout.post(new Runnable() {
            @Override
            public void run() {
                smssession_scroll_layout.scrollBy(0, 10000);
            }
        });
        //if(m_Dialog!=null && m_Dialog.isShowing())m_Dialog.dismiss();
        //			}
        //			@Override
        //			protected void onPreExecute() {
        //				//if(m_Dialog==null || !m_Dialog.isShowing())m_Dialog = ProgressDialog.show(SMSSession_Activity.this, "请等待...", "正在动态加载数据，请稍后...", true);
        //				super.onPreExecute();
        //			}
        //
        //    	}.execute();
    }
    private class ImageOnClickListener implements OnClickListener {
        @Override
        public void onClick(View arg0) {
            if (null != contactID && contactID.trim().length() > 0) {
                try {
                    Intent intent = new Intent(Intent.ACTION_EDIT, Uri.withAppendedPath(ContactsContract.Contacts.CONTENT_URI, contactID));
                    startActivity(intent);
                } catch (Throwable e) {
                    // TODO Auto-generated catch block
                    Logger.error(e);
                }
            } else {
                Uri insertUri = android.provider.ContactsContract.Contacts.CONTENT_URI;
                Intent intent = new Intent(Intent.ACTION_INSERT, insertUri);
                intent.putExtra(android.provider.ContactsContract.Intents.Insert.PHONE, smsSession.pNumber);
                startActivity(intent);
            }
        }
    }
    @Override
    protected Dialog onCreateDialog(int id) {
        Dialog dialog = null;
        if (id == 1) {
            AlertDialog.Builder builder = new AlertDialog.Builder(this);
            builder.setTitle("操作选择");
            String[] op = null;
            if (testSDCard()) {
                op = new String[7];
                op[0] = "复制";
                op[1] = "移动到收藏夹";
                op[2] = "删除(到回收站)";
                op[3] = "删除(永久)";
                op[4] = "转发";
                op[5] = "备份到SD卡";
                op[6] = "设置";
            } else {
                op = new String[6];
                op[0] = "复制";
                op[1] = "移动到收藏夹";
                op[2] = "删除(到回收站)";
                op[3] = "删除(永久)";
                op[4] = "转发";
                op[5] = "设置";
            }
            builder.setItems(op, new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialogInterface, int which) {
                    switch (which) {
                        case 0: {
                            ClipboardManager clip = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
                            clip.setText(smsList.get(curIndex).msg);
                        }
                            break;
                        case 1:// "移动到收藏夹";
                        {
                            DatabaseAdapter d = DatabaseAdapter.getInstance(SMSSession_Activity.this);
                            if (!d.existFavoriteSMSs(smsList.get(curIndex).date + "")) {
                                d.addNewSMS2Favorite(smsSession.pNumber, smsSession.mproperty, smsList.get(curIndex).msg, smsList.get(curIndex).readFlag, smsList.get(curIndex).date + "", smsList.get(curIndex).in ? 1 : 0, 0);
                            }
                            if (smsSession.type == 3) SMSSession_Activity.this.getContentResolver().delete(Uri.parse("content://sms/conversations/" + smsSession.id), "_id=?", new String[] { smsList.get(curIndex).id + "" });
                            else if (smsSession.type == 2) d.delPrivateSMS(smsList.get(curIndex).id);
                            else if (smsSession.type == 1) d.delBlockSMS(smsList.get(curIndex).id);
                            load();
                        }
                            break;
                        case 2:// "删除(到回收站)";
                        {
                            DatabaseAdapter d = DatabaseAdapter.getInstance(SMSSession_Activity.this);
                            d.addNewSMS2Trash(smsSession.pNumber, smsSession.mproperty, smsList.get(curIndex).msg, smsList.get(curIndex).readFlag, smsList.get(curIndex).date + "", smsList.get(curIndex).in ? 1 : 0, 0);
                            if (smsSession.type == 3) SMSSession_Activity.this.getContentResolver().delete(Uri.parse("content://sms/conversations/" + smsSession.id), "_id=?", new String[] { smsList.get(curIndex).id + "" });
                            else if (smsSession.type == 2) d.delPrivateSMS(smsList.get(curIndex).id);
                            else if (smsSession.type == 1) d.delBlockSMS(smsList.get(curIndex).id);
                            load();
                        }
                            break;
                        case 3: // "删除(永久)";
                        {
                            DatabaseAdapter d = DatabaseAdapter.getInstance(SMSSession_Activity.this);
                            if (smsSession.type == 3) SMSSession_Activity.this.getContentResolver().delete(Uri.parse("content://sms/conversations/" + smsSession.id), "_id=?", new String[] { smsList.get(curIndex).id + "" });
                            else if (smsSession.type == 2) d.delPrivateSMS(smsList.get(curIndex).id);
                            else if (smsSession.type == 1) d.delBlockSMS(smsList.get(curIndex).id);
                            load();
                        }
                            break;
                        case 4: {
                            Intent it = new Intent(SMSSession_Activity.this, SendMessageActivity.class);
                            // Intent it = new Intent(Intent.ACTION_SENDTO,
                            // Uri.parse("smsto:"));
                            it.putExtra("sms_body", smsList.get(curIndex).msg);
                            startActivity(it);
                            System.gc();
                            SMSSession_Activity.this.finish();
                        }
                            break;
                        case 5: {
                            if (testSDCard()) {
                                new AsyncTask<Void, Void, Void>() {
                                    // 处理后台执行的任务，在后台线程执行
                                    @Override
                                    protected Void doInBackground(Void... arg0) {
                                        try {
                                            ArrayList<SmsField> smslist = new ArrayList<SmsField>();
                                            ArrayList<String> keylist = new ArrayList<String>();
                                            SmsField smsField = new SmsField();
                                            smsField.address = smsSession.pNumber;
                                            smsField.date = smsList.get(curIndex).date + "";
                                            smsField.read = smsList.get(curIndex).readFlag == 1 ? "1" : "2";
                                            smsField.type = smsList.get(curIndex).in ? "1" : "0";
                                            smsField.status = "0";
                                            smsField.body = smsList.get(curIndex).msg;
                                            smslist.add(smsField);
                                            keylist.add(smsField.date);
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
                                            Toast.makeText(SMSSession_Activity.this, "备份成功", Toast.LENGTH_SHORT).show();
                                        }
                                        super.onPostExecute(result);
                                    }
                                }.execute();
                            } else {
                                Intent it = new Intent(SMSSession_Activity.this, SMSSettingActivity.class);
                                startActivity(it);
                                finish();
                            }
                        }
                            break;
                        case 6: {
                            Intent it = new Intent(SMSSession_Activity.this, SMSSettingActivity.class);
                            startActivity(it);
                            finish();
                        }
                            break;
                    }
                }
            });
            dialog = builder.create();
        }
        return dialog;
    }
    /*
     * private int getPersonID(String pNumber) { Cursor cursor =
     * getContentResolver().query(Uri.parse("content://sms/"), new String[] {
     * "_id", "thread_id", "address", "read", "person", "date", "body", "type" },
     * "type=1 or type=2", null, "thread_id,date");
     * 
     * while (cursor != null && cursor.moveToNext()) { threadid =
     * cursor.getLong(1); for (SMSSession one : bboxSMSList) { if (one.threadID ==
     * threadid) { one.id = cursor.getLong(0); one.pNumber = cursor.getString(2);
     * if (one.pNumber != null) { if (one.pNumber.indexOf("86") == 0) one.pNumber
     * = one.pNumber.substring(2); if (one.pNumber.indexOf("+86") == 0)
     * one.pNumber = one.pNumber.substring(3); } one.readFlag =
     * cursor.getInt(3);//0-未读，1-已读 // one.person = cursor.getString(4); one.date
     * = cursor.getLong(5); one.msg = cursor.getString(6); one.Inbox =
     * cursor.getInt(7) == 1 ? true : false; isExistData = true; } } }
     * cursor.close();
     * 
     * }
     */
    public class SmsSendResult extends BroadcastReceiver {
        @Override
        public void onReceive(Context context, Intent intent) {
            Button bt = (Button) findViewById(biz.AR.id.smssession_send_bt);
            bt.setText("发送");
            EditText et = (EditText) findViewById(biz.AR.id.smssession_msg_txt);
            et.setEnabled(true);
            if (getResultCode() == Activity.RESULT_OK) {
                TextView tView = (TextView) findViewById(biz.AR.id.smssession_msglen_txt);
                tView.setText("");
                String dateStr = System.currentTimeMillis() + "";
                if (smsSession.type == 3 && et.getText().length() > 0) {
                    // ///////////////////加入发件箱
                    ContentValues cv = new ContentValues();
                    cv.put("address", smsSession.pNumber);
                    cv.put("read", 1);
                    cv.put("type", 2);
                    cv.put("status", 0);
                    cv.put("date", dateStr);
                    cv.put("body", MessageUtils.FilterHtml(Html.toHtml(et.getText())));
                    getContentResolver().insert(Uri.parse("content://sms"), cv);
                } else if (smsSession.type == 1) {
                    DatabaseAdapter d = DatabaseAdapter.getInstance(context);
                    d.addNewBlockSMS(smsSession.pNumber, smsSession.mproperty, MessageUtils.FilterHtml(Html.toHtml(et.getText())), 0, dateStr, 2, 0);
                } else if (smsSession.type == 2) {
                    DatabaseAdapter d = DatabaseAdapter.getInstance(context);
                    d.addNewPrivateSMS(smsSession.pNumber, smsSession.mproperty, MessageUtils.FilterHtml(Html.toHtml(et.getText())), 0, dateStr, 2, 0);
                }
                et.setText("");
                // ///////////////////
                load();
            } else {
                Toast.makeText(context, "发送失败!!!", Toast.LENGTH_SHORT).show();
            }
        }
    }
    /**
    * 根据手机的分辨率从 dp 的单位 转成为 px(像素)
    */
    public int dip2px(float dpValue) {
        final float scale = getResources().getDisplayMetrics().density;
        return (int) (dpValue * scale + 0.5f);
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
        return biz.AR.drawable.sms_bg_type6_out;
    }
    private int getOtherbg(int type) {
        switch (type) {
            case 0:
                return biz.AR.drawable.sms_bg_type1_in;
            case 1:
                return biz.AR.drawable.sms_bg_type2_in;
            case 2:
                return biz.AR.drawable.sms_bg_type3_in;
            case 3:
                return biz.AR.drawable.sms_bg_type4_in;
            case 4:
                return biz.AR.drawable.sms_bg_type5_in;
            case 5:
                return biz.AR.drawable.sms_bg_type6_in;
        }
        return biz.AR.drawable.sms_bg_type1_in;
    }
    private int getOtherTextColor() {
        return SettingSave.getInstance(SMSSession_Activity.this).getIntValue("sms_session_other_textcolor", 0);
    }
    private int getMyTextColor() {
        return SettingSave.getInstance(SMSSession_Activity.this).getIntValue("sms_session_my_textcolor", 0);
    }
    private int getOtherTextbg() {
        return SettingSave.getInstance(SMSSession_Activity.this).getIntValue("sms_session_other_textbg", 0);
    }
    private int getMyTextbg() {
        return SettingSave.getInstance(SMSSession_Activity.this).getIntValue("sms_session_my_textbg", 3);
    }
    private void setRightColor(TextView view, int color) {
        //初始化三种颜色值
        int redcolor = color / (256 * 256);
        int greecolor = (color - redcolor * 256 * 256) / 256;
        int bluecolor = color - redcolor * 256 * 256 - greecolor * 256;
        view.setTextColor(Color.rgb(redcolor, greecolor, bluecolor));
    }
    private boolean testSDCard() {
        if (android.os.Environment.getExternalStorageState().equals(android.os.Environment.MEDIA_MOUNTED)) { return true; }
        return false;
    }
}
