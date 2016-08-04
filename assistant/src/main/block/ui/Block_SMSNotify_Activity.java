package main.block.ui;
import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import main.backup.SmsField;
import main.block.NormalContacts;
import main.callphone.ContactManager;
import main.message.MessageUtils;
import main.ui.GuesterLinearLayout;
import main.ui.SMSSession_Activity;
import net.workspace.util.Logger;
import android.app.Activity;
import android.content.ContentValues;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.text.Html;
import android.text.Html.ImageGetter;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.Window;
import android.widget.ImageView;
import android.widget.TextView;

public class Block_SMSNotify_Activity extends Activity {
    TextView sms_notify_name_txt;
    ImageView sms_notify_img;
    TextView sms_notify_Phone_txt;
    TextView sms_notify_time_txt;
    TextView sms_notify_body_txt;
    TextView sms_notify_count_txt;
    ImageView sms_notify_left;
    ImageView sms_notify_right;
    private Map<String, NormalContacts> contactMap;//通讯录数据
    public static ArrayList<SmsField> smslist;
    public static MyHandler handler;
    private int currentIndex = 0;
    float mTouchStartX = 0.0f;
    private boolean mode = false;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        try {
            handler = new MyHandler(Looper.getMainLooper());
            Bundle bundle = getIntent().getExtras();
            SmsField field = new SmsField();
            field.address = bundle.getString("sender");
            field.body = bundle.getString("body");
            field.date = bundle.getString("time");
            setContentView(biz.AR.layout.block_smsnotify_activity);
            if (smslist != null) {
                smslist.clear();
                smslist = null;
            }
            smslist = new ArrayList<SmsField>();
            smslist.add(field);
            init();
            initData();
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
            finish();
        }
    }
    public class MyHandler extends Handler {
        public MyHandler(Looper looper) {
            super(looper);
        }
        @Override
        public void handleMessage(Message msg) {
            currentIndex = smslist.size() - 1;
            display();
        }
    };
    private void init() {
        NotifyOnClickListener listener = new NotifyOnClickListener();
        sms_notify_img = (ImageView) findViewById(biz.AR.id.sms_notify_img);
        sms_notify_left = (ImageView) findViewById(biz.AR.id.sms_notify_left);
        sms_notify_right = (ImageView) findViewById(biz.AR.id.sms_notify_right);
        sms_notify_name_txt = (TextView) findViewById(biz.AR.id.sms_notify_name_txt);
        sms_notify_Phone_txt = (TextView) findViewById(biz.AR.id.sms_notify_Phone_txt);
        ImageView sms_notify_close_img = (ImageView) findViewById(biz.AR.id.sms_notify_close_img);
        sms_notify_close_img.setOnClickListener(listener);
        sms_notify_time_txt = (TextView) findViewById(biz.AR.id.sms_notify_time_txt);
        sms_notify_count_txt = (TextView) findViewById(biz.AR.id.sms_notify_count_txt);
        sms_notify_body_txt = (TextView) findViewById(biz.AR.id.sms_notify_body_txt);
        TextView notify_delete_btn = (TextView) findViewById(biz.AR.id.notify_delete_btn);
        notify_delete_btn.setOnClickListener(listener);
        TextView notify_read_btn = (TextView) findViewById(biz.AR.id.notify_read_btn);
        notify_read_btn.setOnClickListener(listener);
        TextView notify_reply_btn = (TextView) findViewById(biz.AR.id.notify_reply_btn);
        notify_reply_btn.setOnClickListener(listener);
        GuesterLinearLayout sms_notify_body_layout = (GuesterLinearLayout) findViewById(biz.AR.id.sms_notify_body_layout);
        sms_notify_body_layout.setOnTouchListener(new OnTouchListener() {
            @Override
            public boolean onTouch(View view, MotionEvent event) {
                try {
                    switch (event.getAction()) {
                        case MotionEvent.ACTION_UP:
                            if (mode) {
                                if (event.getRawX() - mTouchStartX > 50) {
                                    //手指方向向右，左滑动
                                    mode = false;
                                    if (currentIndex > 0) currentIndex--;
                                    display();
                                } else if (mTouchStartX - event.getRawX() > 50) {
                                    //手指方向向右，左滑动
                                    mode = false;
                                    if (currentIndex < smslist.size() - 1) currentIndex++;
                                    display();
                                }
                            }
                            break;
                        case MotionEvent.ACTION_DOWN:
                            mode = true;
                            mTouchStartX = event.getRawX();
                            break;
                        case MotionEvent.ACTION_MOVE:
                            if (mode) {
                                if (event.getRawX() - mTouchStartX > 50) {
                                    //手指方向向右，左滑动
                                    mode = false;
                                    if (currentIndex > 0) currentIndex--;
                                    display();
                                } else if (mTouchStartX - event.getRawX() > 50) {
                                    //手指方向向右，左滑动
                                    mode = false;
                                    if (currentIndex < smslist.size() - 1) currentIndex++;
                                    display();
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
    private void back() {
        System.gc();
        finish();
    }
    @Override
    protected void onDestroy() {
        contactMap.clear();
        smslist.clear();
        smslist = null;
        handler = null;
        currentIndex = 0;
        mTouchStartX = 0f;
        super.onDestroy();
    }
    @Override
    protected void onResume() {
        // TODO Auto-generated method stub
        super.onResume();
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) { // 按下的如果是BACK，同时没有重复
            back();
            return false;
        }
        return super.onKeyDown(keyCode, event);
    }
    public class NotifyOnClickListener implements View.OnClickListener {
        @Override
        public void onClick(View v) {
            switch (v.getId()) {
                case biz.AR.id.sms_notify_close_img: {
                    back();
                    break;
                }
                case biz.AR.id.notify_delete_btn: {
                    delete();
                    break;
                }
                case biz.AR.id.notify_read_btn: {
                    read();
                    break;
                }
                case biz.AR.id.notify_reply_btn: {
                    replay();
                    break;
                }
                default:
                    break;
            }
        }
    };
    private void delete() {
        Cursor cursor = null;
        try {
            cursor = getContentResolver().query(Uri.parse("content://sms/"), new String[] { "_id", "thread_id" }, " date=?", new String[] { smslist.get(currentIndex).date }, null);
            while (cursor != null && cursor.moveToNext()) {
                getContentResolver().delete(Uri.parse("content://sms/conversations/" + cursor.getInt(1)), "_id=?", new String[] { cursor.getInt(0) + "" });
                break;
            }
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        } finally {
            if (cursor != null) cursor.close();
        }
        removeIndex();
    }
    private void read() {
        Cursor cursor = null;
        try {
            cursor = getContentResolver().query(Uri.parse("content://sms/"), new String[] { "_id" }, " date=?", new String[] { smslist.get(currentIndex).date }, null);
            while (cursor != null && cursor.moveToNext()) {
                ContentValues cv = new ContentValues();
                cv.put("read", 1);// 0：未读，1：已读
                getContentResolver().update(Uri.parse("content://sms/"), cv, "_id=?", new String[] { cursor.getInt(0) + "" });
                break;
            }
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        } finally {
            if (cursor != null) cursor.close();
        }
        removeIndex();
    }
    private void replay() {
        Cursor cursor = null;
        try {
            cursor = getContentResolver().query(Uri.parse("content://sms/"), new String[] { "thread_id" }, " date=?", new String[] { smslist.get(currentIndex).date }, null);
            while (cursor != null && cursor.moveToNext()) {
                SMSSession_Activity.smsSession.id = cursor.getInt(0);
                SMSSession_Activity.smsSession.pNumber = smslist.get(currentIndex).address;
                if (contactMap.containsKey(smslist.get(currentIndex).address)) {
                    SMSSession_Activity.smsSession.niceName = contactMap.get(smslist.get(currentIndex).address).niceName;
                }
                SMSSession_Activity.smsSession.mproperty = "";
                SMSSession_Activity.smsSession.type = 3;
                Intent smsIntent = new Intent(Block_SMSNotify_Activity.this, SMSSession_Activity.class);
                startActivity(smsIntent);
                break;
            }
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        } finally {
            if (cursor != null) cursor.close();
        }
        removeIndex();
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
    private void removeIndex() {
        try {
            smslist.remove(currentIndex);
            if (currentIndex > 0) currentIndex--;
            if (smslist.size() == 0) back();
            else display();
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        }
    }
    private void initData() {
        new AsyncTask<Void, Void, Void>() {
            @Override
            protected Void doInBackground(Void... arg0) {
                try {
                    contactMap = new HashMap<String, NormalContacts>();
                    List<NormalContacts> contactList = ContactManager.getInstance(Block_SMSNotify_Activity.this).getList();
                    for (NormalContacts contact : contactList) {
                        contactMap.put(contact.pNumber.trim(), contact);
                    }
                    contactList.clear();
                } catch (Throwable e) {
                    Logger.error(e);
                }
                return null;
            }
            @Override
            protected void onPostExecute(Void result) {
                display();
            }
            @Override
            protected void onPreExecute() {}
        }.execute();
    }
    private void display() {
        if (currentIndex >= smslist.size()) return;
        SmsField field = smslist.get(currentIndex);
        sms_notify_Phone_txt.setText(field.address);
        sms_notify_time_txt.setText(MessageUtils.getDateFormat(field.date));
        sms_notify_count_txt.setText(currentIndex + 1 + "/" + smslist.size());
        if (currentIndex + 1 < smslist.size()) sms_notify_right.setVisibility(View.VISIBLE);
        else sms_notify_right.setVisibility(View.INVISIBLE);
        if (currentIndex > 0 && smslist.size() > 1) sms_notify_left.setVisibility(View.VISIBLE);
        else sms_notify_left.setVisibility(View.INVISIBLE);
        sms_notify_body_txt.setText(Html.fromHtml(MessageUtils.explain(field.body), imageGetter, null));
        int logo = MessageUtils.getLogo(field.address);
        if (contactMap.containsKey(field.address) && contactMap.get(field.address).getPhoto() != null) {
            ByteArrayInputStream is = new ByteArrayInputStream(contactMap.get(field.address).getPhoto());
            Bitmap map = BitmapFactory.decodeStream(is);
            sms_notify_img.setImageBitmap(map);
        } else if (logo > 0) {
            sms_notify_img.setImageResource(logo);
        } else {
            sms_notify_img.setImageResource(biz.AR.drawable.phone_person_icon);
        }
        if (contactMap.containsKey(field.address)) {
            String niceName = contactMap.get(field.address).niceName;
            if (niceName != null && niceName.trim().length() > 0) {
                sms_notify_name_txt.setText(niceName);
                sms_notify_name_txt.setVisibility(View.VISIBLE);
            } else {
                sms_notify_name_txt.setVisibility(View.GONE);
            }
        } else sms_notify_name_txt.setVisibility(View.GONE);
    }
}
