package main.backup;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import net.workspace.util.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Environment;
import android.provider.BaseColumns;
import android.provider.ContactsContract;
import android.provider.ContactsContract.CommonDataKinds.Phone;
import android.provider.ContactsContract.CommonDataKinds.StructuredName;
import android.provider.ContactsContract.Contacts.Data;
import android.provider.ContactsContract.RawContacts;

public class ContactBackUp {
    private byte[] sync = new byte[0];
    private final String LOG_FILE = "contact.txt";
    private String LOG_PATH = "android" + File.separator + "backup" + File.separator + "contact";
    public int getbackUpContactCount() {
        try {
            if (false == testSDCard()) return 0;
            String recoverStr = readSDFile();
            if (null == recoverStr || recoverStr.trim().length() == 0) return -1;
            JSONObject contact = JSONUtil.parse(recoverStr);
            if (contact == null) return -1;
            JSONArray contactarray = JSONUtil.getJSONArray(contact, "contact");
            if (contactarray == null || contactarray.length() == 0) return -1;
            return contactarray.length();
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        }
        return -1;
    }
    public String getbackUpContactDate() {
        try {
            String path = getLogPath() + File.separator + LOG_FILE;
            File file = new File(path);
            DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault());
            return sdf.format(new Date(file.lastModified()));
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        }
        return "";
    }
    public int getTotal(Context mContext) {
        Cursor cursor = null;
        int total = 0;
        try {
            cursor = mContext.getContentResolver().query(ContactsContract.Contacts.CONTENT_URI, null, null, null, null);
            if (cursor.moveToFirst()) {
                total = cursor.getCount();
            }
        } catch (Throwable e) {
            Logger.error(e);
        } finally {
            if (cursor != null) cursor.close();
        }
        return total;
    }
    public void backUpContact(Context mContext) {
        if (false == testSDCard()) return;
        Cursor cur = null;
        try {
            ContentResolver cr = mContext.getContentResolver();
            cur = cr.query(ContactsContract.Contacts.CONTENT_URI, null, null, null, null);
            if (cur.moveToFirst()) {
                List<ContactField> contactlist = new ArrayList<ContactField>();
                int idColumn = cur.getColumnIndex(BaseColumns._ID);
                int displayNameColumn = cur.getColumnIndex(ContactsContract.Contacts.DISPLAY_NAME);
                int hasPhoneColumn = cur.getColumnIndex(ContactsContract.Contacts.HAS_PHONE_NUMBER);
                int i = 0;
                do {
                    i++;
                    ContactField mContactField = new ContactField();
                    String contactId = cur.getString(idColumn);
                    //鐢ㄦ埛鍚\x8D
                    String disPlayName = cur.getString(displayNameColumn);
                    mContactField.displayname = disPlayName;
                    //鐢佃瘽鍙风爜
                    int phoneCount = cur.getInt(hasPhoneColumn);
                    if (phoneCount > 0) {
                        Cursor phones = null;
                        try {
                            phones = cr.query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, null, ContactsContract.CommonDataKinds.Phone.CONTACT_ID + " = " + contactId, null, null);
                            String phoneNumber;
                            String type;
                            if (phones.moveToFirst()) {
                                ArrayList<PhoneField> phonelist = new ArrayList<PhoneField>();
                                do {
                                    PhoneField mPhoneField = new PhoneField();
                                    phoneNumber = phones.getString(phones.getColumnIndex(ContactsContract.CommonDataKinds.Phone.NUMBER));
                                    mPhoneField.phone = phoneNumber;
                                    type = phones.getString(phones.getColumnIndex(ContactsContract.CommonDataKinds.Phone.TYPE));
                                    mPhoneField.type = type;
                                    phonelist.add(mPhoneField);
                                } while (phones.moveToNext());
                                mContactField.phonelist = phonelist;
                            }
                        } catch (Throwable e) {
                            // TODO Auto-generated catch block
                            Logger.error(e);
                        } finally {
                            if (phones != null) phones.close();
                        }
                    }
                    //閭欢鍦板潃
                    Cursor emails = null;
                    try {
                        emails = cr.query(ContactsContract.CommonDataKinds.Email.CONTENT_URI, null, ContactsContract.CommonDataKinds.Email.CONTACT_ID + " = " + contactId, null, null);
                        String email;
                        String type;
                        if (emails.moveToFirst()) {
                            ArrayList<EmailField> emiallist = new ArrayList<EmailField>();
                            do {
                                EmailField mEmailField = new EmailField();
                                email = emails.getString(emails.getColumnIndex(ContactsContract.CommonDataKinds.Email.DATA));
                                mEmailField.email = email;
                                type = emails.getString(emails.getColumnIndex(ContactsContract.CommonDataKinds.Email.TYPE));
                                mEmailField.type = type;
                                emiallist.add(mEmailField);
                            } while (emails.moveToNext());
                            mContactField.emaillist = emiallist;
                        }
                    } catch (Throwable e) {
                        // TODO Auto-generated catch block
                        Logger.error(e);
                    } finally {
                        if (emails != null) emails.close();
                    }
                    contactlist.add(mContactField);
                } while (cur.moveToNext());
                //灏嗘暟鎹浆鎹㈡垚JSON鏍煎紡
                int n = contactlist.size();
                if (n == 0) return;
                String jsonResult = "";
                String temp = "";
                for (ContactField mContactField : contactlist) {
                    temp = mContactField.getJsonString();
                    if (null != temp && temp.trim().length() > 0) jsonResult += temp + ",";
                }
                if (jsonResult.trim().length() > 0) {
                    jsonResult = "{\"contact\":[" + jsonResult.substring(0, jsonResult.length() - 1) + "]}";
                    //鍐欏叆鏂囦欢
                    writeSDFile(jsonResult);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (cur != null) cur.close();
        }
    }
    public void recoverContact(Context mContext) {
        try {
            String recoverStr = readSDFile();
            if (null == recoverStr || recoverStr.trim().length() == 0) return;
            JSONObject contact = JSONUtil.parse(recoverStr);
            if (contact == null) return;
            JSONArray contactarray = JSONUtil.getJSONArray(contact, "contact");
            if (contactarray == null || contactarray.length() == 0) return;
            for (int i = 0, n = contactarray.length(); i < n; i++) {
                JSONObject contactfiled = JSONUtil.getJSONObject(contactarray, i);
                String displayname = DataCode.encode(JSONUtil.getString(contactfiled, "displayname", ""));
                // 鍒ゆ柇鐭俊鏁版嵁搴撲腑鏄惁宸插寘鍚鏉＄煭淇★紝濡傛灉鏈夛紝鍒欎笉闇€瑕佹仮澶\x8D
                Cursor cursor = null;
                try {
                    cursor = mContext.getContentResolver().query(ContactsContract.Contacts.CONTENT_URI, null, ContactsContract.Contacts.DISPLAY_NAME + "=?", new String[] { displayname }, null);
                    if (!cursor.moveToFirst()) {// 娌℃湁璇ユ潯鐭俊
                        //鍏堟彃鍏ヤ竴鏉＄┖鐨勮褰\x95
                        ContentValues values = new ContentValues();
                        Uri rawContactUri = mContext.getContentResolver().insert(RawContacts.CONTENT_URI, values);
                        long rawContactId = ContentUris.parseId(rawContactUri);
                        values.clear();
                        //鍐嶆彃鍏ョ敤鎴峰悕
                        values.put(Data.RAW_CONTACT_ID, rawContactId);
                        values.put(Data.MIMETYPE, StructuredName.CONTENT_ITEM_TYPE);
                        values.put(ContactsContract.CommonDataKinds.StructuredName.DISPLAY_NAME, displayname);
                        mContext.getContentResolver().insert(ContactsContract.Data.CONTENT_URI, values);
                        values.clear();
                        getContact(contactfiled, values, rawContactId, mContext);
                    }
                } catch (Throwable e) {
                    // TODO Auto-generated catch block
                    Logger.error(e);
                } finally {
                    if (cursor != null) cursor.close();
                }
            }
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        }
    }
    private void getContact(JSONObject contactfiled, ContentValues values, long rawContactId, Context mContext) {
        if (contactfiled == null) return;
        JSONArray phonearray = JSONUtil.getJSONArray(contactfiled, "phoneinfo");
        if (phonearray != null && phonearray.length() > 0) {
            for (int i = 0, n = phonearray.length(); i < n; i++) {
                PhoneField phoneField = getPhone(JSONUtil.getJSONObject(phonearray, i));
                if (phoneField == null) continue;
                values.put(Data.RAW_CONTACT_ID, rawContactId);
                values.put(Data.MIMETYPE, Phone.CONTENT_ITEM_TYPE);
                values.put(Phone.NUMBER, phoneField.phone);
                values.put(Phone.TYPE, phoneField.type);
                mContext.getContentResolver().insert(ContactsContract.Data.CONTENT_URI, values);
                values.clear();
            }
        }
        JSONArray emailarray = JSONUtil.getJSONArray(contactfiled, "emailinfo");
        if (emailarray != null && emailarray.length() > 0) {
            for (int i = 0, n = emailarray.length(); i < n; i++) {
                EmailField emialField = getEmail(JSONUtil.getJSONObject(emailarray, i));
                if (emialField == null) continue;
                values.put(Data.RAW_CONTACT_ID, rawContactId);
                values.put(Data.MIMETYPE, ContactsContract.CommonDataKinds.Email.CONTENT_ITEM_TYPE);
                values.put(ContactsContract.CommonDataKinds.Email.DATA, emialField.email);
                values.put(ContactsContract.CommonDataKinds.Email.TYPE, emialField.type);
                mContext.getContentResolver().insert(ContactsContract.Data.CONTENT_URI, values);
                values.clear();
            }
        }
    }
    private PhoneField getPhone(JSONObject phoneField) {
        if (phoneField == null) return null;
        PhoneField phonef = new PhoneField();
        String phone = DataCode.encode(JSONUtil.getString(phoneField, "phone", ""));
        phonef.phone = phone;
        String type = JSONUtil.getString(phoneField, "type", "");
        phonef.type = type;
        return phonef;
    }
    private EmailField getEmail(JSONObject phoneField) {
        if (phoneField == null) return null;
        EmailField emailf = new EmailField();
        String email = DataCode.encode(JSONUtil.getString(phoneField, "email", ""));
        emailf.email = email;
        String type = JSONUtil.getString(phoneField, "type", "");
        emailf.type = type;
        return emailf;
    }
    private class PhoneField {
        public String type;
        public String phone;
        public String getJsonString() {
            String returnStr = "";
            if (null != phone && phone.trim().length() > 0) {
                returnStr += "\"phone\":\"" + DataCode.decode(phone.trim()) + "\",\"type\":\"" + type + "\"";
            }
            if (returnStr.trim().length() > 0) {
                returnStr = "{" + returnStr + "}";
            }
            return returnStr;
        }
    }
    private class EmailField {
        public String type;
        public String email;
        public String getJsonString() {
            String returnStr = "";
            if (null != email && email.trim().length() > 0) {
                returnStr += "\"email\":\"" + DataCode.decode(email.trim()) + "\",\"type\":\"" + type + "\"";
            }
            if (returnStr.trim().length() > 0) {
                returnStr = "{" + returnStr + "}";
            }
            return returnStr;
        }
    }
    private class ContactField {
        public String displayname = "";
        public List<PhoneField> phonelist;
        public List<EmailField> emaillist;
        public String getJsonString() {
            String returnStr = "";
            if (null != displayname && displayname.trim().length() > 0) {
                returnStr += "\"displayname\":\"" + DataCode.decode(displayname.trim()) + "\",";
            }
            if (null != phonelist && phonelist.size() > 0) {
                String phonetemp = "";
                for (PhoneField mPhoneField : phonelist) {
                    phonetemp += mPhoneField.getJsonString() + ",";
                }
                if (phonetemp.trim().length() > 0) {
                    returnStr += "\"phoneinfo\":[" + phonetemp.substring(0, phonetemp.length() - 1) + "],";
                }
                phonetemp = null;
            }
            if (null != emaillist && emaillist.size() > 0) {
                String emailtemp = "";
                for (EmailField mEmailField : emaillist) {
                    emailtemp += mEmailField.getJsonString() + ",";
                }
                if (emailtemp.trim().length() > 0) {
                    returnStr += "\"emailinfo\":[" + emailtemp.substring(0, emailtemp.length() - 1) + "],";
                }
                emailtemp = null;
            }
            if (returnStr.trim().length() > 0) {
                returnStr = "{" + returnStr.substring(0, returnStr.length() - 1) + "}";
            }
            return returnStr;
        }
    }
    private String readSDFile() throws IOException {
        if (false == testSDCard()) return null;
        String path = getLogPath() + File.separator + LOG_FILE;
        File file = new File(path);
        if (!file.exists()) return null;
        BufferedReader reader = null;
        String readmessage = null;
        try {
            reader = new BufferedReader(new FileReader(file));
            readmessage = reader.readLine();
        } catch (IOException e) {
            Logger.error(e);
        } finally {
            if (reader != null) reader.close();
        }
        return readmessage;
    }
    private void writeSDFile(String info) {
        synchronized (sync) {
            if (false == testSDCard()) return;
            try {
                String path = getLogPath() + File.separator + LOG_FILE;
                File file = new File(path);
                if (!file.exists()) file = createFile();
                FileOutputStream fos = new FileOutputStream(file, false);
                // 褰撳弬鏁颁负绌烘垨涓簍rue鏃讹紝鏄湪婧愭枃浠朵笂杩涜杩藉姞锛屼负false鏃舵槸瑕嗙洊閲嶅啓
                fos.write(info.getBytes());
                fos.close();
            } catch (IOException ex) {}
        }
    }
    private boolean testSDCard() {
        if (android.os.Environment.getExternalStorageState().equals(android.os.Environment.MEDIA_MOUNTED)) { return true; }
        return false;
    }
    private String getLogPath() {
        return Environment.getExternalStorageDirectory().getAbsolutePath() + File.separator + LOG_PATH;
    }
    private File createFile() throws IOException {
        String path = getLogPath() + File.separator + LOG_FILE;
        File file = new File(getLogPath());
        file.mkdirs();
        file = new File(path);
        file.createNewFile();
        return file;
    }
}
