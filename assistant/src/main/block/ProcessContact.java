package main.block;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import main.callphone.ConvertPinYinUtil;
import main.database.DatabaseAdapter;
import net.workspace.util.Logger;
import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.BaseColumns;
import android.provider.ContactsContract;
import android.provider.ContactsContract.PhoneLookup;

public class ProcessContact {
    final static int BUFFER_SIZE = 4096;
    /**
     * 加载联系人数据到表中
     * @param context
     * @return
     */
    public boolean updateContacts(Context context) {
        try {
            ArrayList<NormalContacts> contacts = new ArrayList<NormalContacts>();
            ContentResolver cr = context.getContentResolver();
            // 取得电话本中开始一项的光标，必须先moveToNext()
            Cursor cursor = null;
            try {
                cursor = cr.query(ContactsContract.Contacts.CONTENT_URI, null, null, null, null);
                ConvertPinYinUtil pingyinUtil = ConvertPinYinUtil.getInstance();
                while (cursor.moveToNext()) {
                    // 取得联系人的名字索引
                    int nameIndex = cursor.getColumnIndex(PhoneLookup.DISPLAY_NAME);
                    String contactName = cursor.getString(nameIndex);
                    String pingyinName = "";
                    if (contactName != null) {
                        if (ConvertPinYinUtil.isChinese(contactName)) {
                            pingyinName = pingyinUtil.getSelling(contactName);
                        } else {
                            pingyinName = contactName;
                        }
                    }
                    // 取得联系人的ID索引值
                    String contactId = cursor.getString(cursor.getColumnIndex(BaseColumns._ID));
                    Cursor phone = null;
                    try {
                        phone = cr.query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, null, ContactsContract.CommonDataKinds.Phone.CONTACT_ID + "=" + contactId, null, null);
                        //得到联系人头像ID
                        Long photoid = cursor.getLong(cursor.getColumnIndex(ContactsContract.Contacts.PHOTO_ID));
                        byte[] contactPhoto = null;
                        if (photoid > 0) {
                            Uri uri = ContentUris.withAppendedId(ContactsContract.Contacts.CONTENT_URI, Long.parseLong(contactId));
                            InputStream input = ContactsContract.Contacts.openContactPhotoInputStream(cr, uri);
                            contactPhoto = InputStreamTOByte(input);
                        }
                        // 一个人可能有几个号码
                        if (phone.moveToNext()) {
                            String strPhoneNumber = phone.getString(phone.getColumnIndex(ContactsContract.CommonDataKinds.Phone.NUMBER));
                            NormalContacts nc = new NormalContacts();
                            nc.contactID = contactId;
                            nc.niceName = contactName;
                            nc.pingyinName = pingyinName;
                            if (strPhoneNumber == null) strPhoneNumber = "";
                            if (strPhoneNumber.indexOf("+86") == 0) strPhoneNumber = strPhoneNumber.substring(3);
                            nc.pNumber = strPhoneNumber;
                            if (contactPhoto != null) nc.photo = contactPhoto;
                            contacts.add(nc);
                        }
                    } catch (Throwable e) {
                        // TODO Auto-generated catch block
                        Logger.error(e);
                    } finally {
                        if (phone != null) phone.close();
                    }
                }
            } catch (Throwable e) {
                // TODO Auto-generated catch block
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
            }
            DatabaseAdapter da = DatabaseAdapter.getInstance(context);
            da.updateContacts(contacts);
            contacts.clear();
            return true;
        } catch (Throwable e) {
            return false;
        }
    }
    /** 
    * 将InputStream转换成byte数组 
    * @param in InputStream 
    * @return byte[] 
    * @throws IOException 
    */
    public byte[] InputStreamTOByte(InputStream in) throws IOException {
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
        byte[] data = new byte[BUFFER_SIZE];
        int count = -1;
        while ((count = in.read(data, 0, BUFFER_SIZE)) != -1)
            outStream.write(data, 0, count);
        data = null;
        return outStream.toByteArray();
    }
}
