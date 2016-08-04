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
import java.util.Locale;
import net.workspace.util.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import android.os.Environment;

public class SMSBackup {
    final String SMS_URI_ALL = "content://sms/";
    private byte[] sync = new byte[0];
    private final String LOG_FILE = "sms.txt";
    private String LOG_PATH = "android" + File.separator + "backup" + File.separator + "sms";
    public int getbackUpSMSCount() {
        try {
            if (false == testSDCard()) return 0;
            String recoverStr = readSDFile();
            if (null == recoverStr || recoverStr.trim().length() == 0) return -1;
            JSONObject sms = JSONUtil.parse(recoverStr);
            if (sms == null) return -1;
            JSONArray smsarray = JSONUtil.getJSONArray(sms, "sms");
            if (smsarray == null || smsarray.length() == 0) return -1;
            return smsarray.length();
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        }
        return -1;
    }
    public String getbackUpSMSDate() {
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
    public ArrayList<SmsField> getSMSList() {
        ArrayList<SmsField> smslist = new ArrayList<SmsField>();
        try {
            String recoverStr = readSDFile();
            if (null == recoverStr || recoverStr.trim().length() == 0) return smslist;
            JSONObject sms = JSONUtil.parse(recoverStr);
            if (sms == null) return smslist;
            JSONArray smsarray = JSONUtil.getJSONArray(sms, "sms");
            if (smsarray == null || smsarray.length() == 0) return smslist;
            for (int i = 0, n = smsarray.length(); i < n; i++) {
                JSONObject smsfiled = JSONUtil.getJSONObject(smsarray, i);
                SmsField field = new SmsField();
                field.address = DataCode.encode(JSONUtil.getString(smsfiled, "address", ""));
                field.date = DataCode.encode(JSONUtil.getString(smsfiled, "date", ""));
                field.read = DataCode.encode(JSONUtil.getString(smsfiled, "read", ""));
                field.status = DataCode.encode(JSONUtil.getString(smsfiled, "status", ""));
                field.type = DataCode.encode(JSONUtil.getString(smsfiled, "type", ""));
                field.body = DataCode.encode(JSONUtil.getString(smsfiled, "body", ""));
                smslist.add(field);
            }
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        }
        return smslist;
    }
    public ArrayList<SmsField> getSMSList(ArrayList<SmsField> list, ArrayList<String> keylist) {
        ArrayList<SmsField> smslist = new ArrayList<SmsField>();
        try {
            String recoverStr = readSDFile();
            if (null == recoverStr || recoverStr.trim().length() == 0) return smslist;
            JSONObject sms = JSONUtil.parse(recoverStr);
            if (sms == null) return smslist;
            JSONArray smsarray = JSONUtil.getJSONArray(sms, "sms");
            if (smsarray == null || smsarray.length() == 0) return smslist;
            for (int i = 0, n = smsarray.length(); i < n; i++) {
                JSONObject smsfiled = JSONUtil.getJSONObject(smsarray, i);
                SmsField field = new SmsField();
                field.address = DataCode.encode(JSONUtil.getString(smsfiled, "address", ""));
                field.date = DataCode.encode(JSONUtil.getString(smsfiled, "date", ""));
                if (keylist.contains(field.date)) continue;
                field.read = DataCode.encode(JSONUtil.getString(smsfiled, "read", ""));
                field.status = DataCode.encode(JSONUtil.getString(smsfiled, "status", ""));
                field.type = DataCode.encode(JSONUtil.getString(smsfiled, "type", ""));
                field.body = DataCode.encode(JSONUtil.getString(smsfiled, "body", ""));
                smslist.add(field);
            }
            smslist.addAll(list);
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        }
        return smslist;
    }
    private String readSDFile() throws IOException {
        if (false == testSDCard()) return null;
        String readmessage = null;
        synchronized (sync) {
            String path = getLogPath() + File.separator + LOG_FILE;
            File file = new File(path);
            if (!file.exists()) return null;
            BufferedReader reader = null;
            try {
                reader = new BufferedReader(new FileReader(file));
                readmessage = reader.readLine();
            } catch (IOException e) {
                Logger.error(e);
            } finally {
                if (reader != null) reader.close();
            }
        }
        return readmessage;
    }
    public void backUpSMS(ArrayList<SmsField> smslist, ArrayList<String> keylist) {
        if (getbackUpSMSCount() <= 0) {
            backUpSMS(smslist, true);
        } else {
            ArrayList<SmsField> list = getSMSList(smslist, keylist);
            backUpSMS(list, true);
        }
    }
    public void backUpSMS(ArrayList<SmsField> smslist, boolean flag) {
        String jsonResult = "";
        String temp = "";
        for (SmsField smsField : smslist) {
            if (smsField.isSelect() || flag) {
                temp = smsField.getJsonString();
                if (null != temp && temp.trim().length() > 0) jsonResult += temp + ",";
            }
        }
        if (jsonResult.trim().length() > 0) {
            jsonResult = "{\"sms\":[" + jsonResult.substring(0, jsonResult.length() - 1) + "]}";
            //鍐欏叆鏂囦欢
            SMSBackup backup = new SMSBackup();
            backup.backUpSMS(jsonResult);
        }
    }
    private void backUpSMS(String info) {
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
