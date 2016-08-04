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
import main.block.FavoriteSMS;
import net.workspace.util.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import android.os.Environment;

public class FavorateBackUp {
    private byte[] sync = new byte[0];
    private final String LOG_FILE = "favorate.txt";
    private String LOG_PATH = "android" + File.separator + "backup" + File.separator + "favorate";
    public int getbackUpFavorateCount() {
        try {
            if (false == testSDCard()) return 0;
            String recoverStr = readSDFile();
            if (null == recoverStr || recoverStr.trim().length() == 0) return -1;
            JSONObject fav = JSONUtil.parse(recoverStr);
            if (fav == null) return -1;
            JSONArray favarray = JSONUtil.getJSONArray(fav, "favorate");
            if (favarray == null || favarray.length() == 0) return -1;
            return favarray.length();
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        }
        return -1;
    }
    public String getbackUpFavorateDate() {
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
    public ArrayList<FavoriteSMS> getFavorateList() {
        ArrayList<FavoriteSMS> favoratelist = new ArrayList<FavoriteSMS>();
        try {
            String recoverStr = readSDFile();
            if (null == recoverStr || recoverStr.trim().length() == 0) return favoratelist;
            JSONObject fav = JSONUtil.parse(recoverStr);
            if (fav == null) return favoratelist;
            JSONArray favarray = JSONUtil.getJSONArray(fav, "favorate");
            if (favarray == null || favarray.length() == 0) return favoratelist;
            for (int i = 0, n = favarray.length(); i < n; i++) {
                FavoriteSMS favorate = new FavoriteSMS();
                JSONObject smsfiled = JSONUtil.getJSONObject(favarray, i);
                favorate.address = DataCode.encode(JSONUtil.getString(smsfiled, "address", ""));
                favorate.mproperty = DataCode.encode(JSONUtil.getString(smsfiled, "mproperty", ""));
                favorate.body = DataCode.encode(JSONUtil.getString(smsfiled, "body", ""));
                favorate.read = DataCode.encode(JSONUtil.getString(smsfiled, "read", "")).equals("1") ? true : false;
                favorate.cDate = DataCode.encode(JSONUtil.getString(smsfiled, "cDate", ""));
                favorate.type = DataCode.encode(JSONUtil.getString(smsfiled, "type", "")).equals("1") ? true : false;
                favorate.status = Integer.parseInt(DataCode.encode(JSONUtil.getString(smsfiled, "status", "")));
                favoratelist.add(favorate);
            }
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        }
        return favoratelist;
    }
    public ArrayList<FavoriteSMS> getFavorateList(FavoriteSMS one) {
        ArrayList<FavoriteSMS> favoratelist = new ArrayList<FavoriteSMS>();
        try {
            String recoverStr = readSDFile();
            if (null == recoverStr || recoverStr.trim().length() == 0) return favoratelist;
            JSONObject fav = JSONUtil.parse(recoverStr);
            if (fav == null) return favoratelist;
            JSONArray favarray = JSONUtil.getJSONArray(fav, "favorate");
            if (favarray == null || favarray.length() == 0) return favoratelist;
            for (int i = 0, n = favarray.length(); i < n; i++) {
                FavoriteSMS favorate = new FavoriteSMS();
                JSONObject smsfiled = JSONUtil.getJSONObject(favarray, i);
                favorate.cDate = DataCode.encode(JSONUtil.getString(smsfiled, "cDate", ""));
                if (favorate.cDate.equalsIgnoreCase(one.cDate.trim())) continue;
                favorate.address = DataCode.encode(JSONUtil.getString(smsfiled, "address", ""));
                favorate.mproperty = DataCode.encode(JSONUtil.getString(smsfiled, "mproperty", ""));
                favorate.body = DataCode.encode(JSONUtil.getString(smsfiled, "body", ""));
                favorate.read = DataCode.encode(JSONUtil.getString(smsfiled, "read", "")).equals("1") ? true : false;
                favorate.type = DataCode.encode(JSONUtil.getString(smsfiled, "type", "")).equals("1") ? true : false;
                favorate.status = Integer.parseInt(DataCode.encode(JSONUtil.getString(smsfiled, "status", "")));
                favoratelist.add(favorate);
            }
            favoratelist.add(one);
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        }
        return favoratelist;
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
    public void backUpFavorate(FavoriteSMS one) {
        if (getbackUpFavorateCount() <= 0) {
            String jsonResult = one.getJsonString();
            if (jsonResult.trim().length() > 0) {
                jsonResult = "{\"favorate\":[" + jsonResult + "]}";
                //鍐欏叆鏂囦欢
                backUpFavorate(jsonResult);
            }
        } else {
            ArrayList<FavoriteSMS> list = getFavorateList(one);
            backUpFavorate(list, true);
        }
    }
    public void backUpFavorate(ArrayList<FavoriteSMS> favoratelist, boolean flag) {
        String jsonResult = "";
        String temp = "";
        for (FavoriteSMS favField : favoratelist) {
            if (favField.isSelect() || flag) {
                temp = favField.getJsonString();
                if (null != temp && temp.trim().length() > 0) jsonResult += temp + ",";
            }
        }
        if (jsonResult.trim().length() > 0) {
            jsonResult = "{\"favorate\":[" + jsonResult.substring(0, jsonResult.length() - 1) + "]}";
            //鍐欏叆鏂囦欢
            FavorateBackUp backup = new FavorateBackUp();
            backup.backUpFavorate(jsonResult);
        }
    }
    private void backUpFavorate(String info) {
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
