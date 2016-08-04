package main.database;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import net.workspace.util.Logger;
import android.content.Context;
import android.content.res.AssetManager;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Environment;
import android.util.Log;

public class DBManager {
    private final int BUFFER_SIZE = 1024;
    public static final String DB_NAME = "mobilearea.db"; // 保存的数据库文件名
    private SQLiteDatabase database;
    private Context context;
    public DBManager(Context context) {
        this.context = context;
    }
    public void openDatabase() {
        String path = "/data" + Environment.getDataDirectory().getAbsolutePath() + "/" + context.getPackageName() + "/databases"+ "/" + DB_NAME; // 在手机里存放数据库的位置
        database = this.openDatabase(path);
    }
    public void closeDatabase() {
        try {
            if (database != null) database.close();
        } catch (Throwable e) {
            // TODO: handle exception
        }
    }
    private SQLiteDatabase openDatabase(String dbfile) {
        try {
            if (!new File(dbfile).exists()) {// 判断数据库文件是否存在，若不存在则执行导入，否则直接打开数据库
                AssetManager assetManager = context.getAssets();
                OutputStream fos = new FileOutputStream(dbfile);
                for (int i = 1; i < 4; i++) {
                    InputStream is = assetManager.open(DB_NAME + i); // 欲导入的数据库
                    byte[] buffer = new byte[BUFFER_SIZE];
                    int count = 0;
                    while ((count = is.read(buffer)) > 0) {
                        fos.write(buffer, 0, count);
                    }
                    is.close();
                    fos.flush();
                }
                fos.close();
            }
            database = SQLiteDatabase.openOrCreateDatabase(dbfile, null);
            return database;
        } catch (FileNotFoundException e) {
            Log.e("Database", "File not found");
            Logger.error(e);
            //Toast.makeText(context, "File not found", Toast.LENGTH_SHORT);
        } catch (IOException e) {
            Log.e("Database", "IO exception");
            Logger.error(e);
            //Toast.makeText(context, "IO exception", Toast.LENGTH_SHORT);
        }
        return null;
    }
    public ArrayList<String> GetRefInfo() {
        ArrayList<String> rlt = new ArrayList<String>();
        synchronized (DatabaseAdapter._writeLock) {
            Cursor cursor = null;
            try {
                String sqlString = "select typeName,[index] from refInfo order by id";
                cursor = database.rawQuery(sqlString, null);
                while (cursor.moveToNext()) {
                    rlt.add(cursor.getString(0) + "@" + cursor.getInt(1));
                }
            } catch (Throwable e) {
                // TODO Auto-generated catch block
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (database != null) database.close();
            }
        }
        return rlt;
    }
    public ArrayList<String> GetRefInfoDetail(int index) {
        ArrayList<String> rlt = new ArrayList<String>();
        synchronized (DatabaseAdapter._writeLock) {
            Cursor cursor = null;
            try {
                String sqlString = "select Desc,pNumber from refInfoDetail where [index]=?";
                String[] para = new String[1];
                para[0] = index + "";
                cursor = database.rawQuery(sqlString, para);
                while (cursor.moveToNext()) {
                    rlt.add(cursor.getString(0) + "@" + cursor.getString(1));
                }
            } catch (Throwable e) {
                // TODO Auto-generated catch block
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (database != null) database.close();
            }
        }
        return rlt;
    }
    /**
     * 区号查询
     * @param area
     */
    public String SearchArea(String area) {
        String rlt = "";
        synchronized (DatabaseAdapter._writeLock) {
            Cursor cursor = null;
            try {
                String[] para = new String[1];
                para[0] = area;
                String sqlString = "select city,area,post from post where area=? order by ismaster desc";
                cursor = database.rawQuery(sqlString, para);
                String city;
                if (cursor.moveToFirst()) {
                    city = cursor.getString(0);
                    rlt = city + "区号:" + cursor.getString(1) + " 邮编:" + cursor.getString(2);
                    cursor.close();
                    sqlString = "select prov from cityProv where city=?";
                    para[0] = city;
                    cursor = database.rawQuery(sqlString, para);
                    if (cursor.moveToFirst() && !city.equals(cursor.getString(0))) rlt = cursor.getString(0) + " " + rlt;
                }
            } catch (Throwable e) {
                // TODO Auto-generated catch block
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (database != null) database.close();
            }
        }
        return rlt;
    }
    /**
     * 根据座机号码查询地区消息
     * @param Phone
     */
    public String SearchPhone(String Phone) {
        String rlt = "";
        synchronized (DatabaseAdapter._writeLock) {
            Cursor cursor = null;
            try {
                String[] para = new String[1];
                String sqlString = "select *  from post where substr('" + Phone + "',1,length(area))=area order by ismaster desc";
                cursor = database.rawQuery(sqlString, null);
                String city;
                if (cursor.moveToFirst()) {
                    city = cursor.getString(0);
                    rlt = city + " 固话 ";
                    cursor.close();
                    sqlString = "select prov from cityProv where city=?";
                    para[0] = city;
                    cursor = database.rawQuery(sqlString, para);
                    if (cursor.moveToFirst() && !city.equals(cursor.getString(0))) rlt = cursor.getString(0) + " " + rlt;
                }
            } catch (Throwable e) {
                // TODO Auto-generated catch block
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (database != null) database.close();
            }
        }
        return rlt;
    }
    /**
     * 根据其他类型的号码属性查询
     * @param Phone
     */
    public String SearchOtherPhone(String Phone) {
        String rlt = "";
        synchronized (DatabaseAdapter._writeLock) {
            Cursor cursor = null;
            try {
                String[] para = new String[1];
                para[0] = Phone;
                String sqlString = "select Desc  from refInfoDetail where pNumber=?";
                cursor = database.rawQuery(sqlString, para);
                if (cursor.moveToFirst()) {
                    rlt = cursor.getString(0);
                }
            } catch (Throwable e) {
                // TODO Auto-generated catch block
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (database != null) database.close();
            }
        }
        return rlt;
    }
    /**
     * 邮编查询
     * @param area
     */
    public String SearchByPost(String post) {
        String rlt = "";
        synchronized (DatabaseAdapter._writeLock) {
            Cursor cursor = null;
            try {
                String[] para = new String[1];
                para[0] = post;
                String sqlString = "select city,area,post from post where post=? order by ismaster desc";
                cursor = database.rawQuery(sqlString, para);
                String city;
                if (cursor.moveToFirst()) {
                    city = cursor.getString(0);
                    rlt = city + " 区号:" + cursor.getString(1) + " 邮编:" + cursor.getString(2);
                    cursor.close();
                    sqlString = "select prov from cityProv where city=?";
                    para[0] = city;
                    cursor = database.rawQuery(sqlString, para);
                    if (cursor.moveToFirst() && !city.equals(cursor.getString(0))) rlt = cursor.getString(0) + " " + rlt;
                }
            } catch (Throwable e) {
                // TODO Auto-generated catch block
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (database != null) database.close();
            }
        }
        return rlt;
    }
    /**
     * 邮编查询
     * @param area
     */
    public String SearchByCity(String city) {
        String rlt = "";
        synchronized (DatabaseAdapter._writeLock) {
            Cursor cursor = null;
            try {
                //String[] para = new String[1];
                //para[0] =city;
                String sqlString = "select city,area,post from post where city like '%" + city + "%'";
                cursor = database.rawQuery(sqlString, null);
                if (cursor.moveToFirst()) {
                    city = cursor.getString(0);
                    rlt = city + " 区号:" + cursor.getString(1) + " 邮编:" + cursor.getString(2);
                    cursor.close();
                    sqlString = "select prov from cityProv where city=?";
                    String[] para = new String[1];
                    para[0] = city;
                    cursor = database.rawQuery(sqlString, para);
                    if (cursor.moveToFirst() && !city.equals(cursor.getString(0))) rlt = cursor.getString(0) + " " + rlt;
                }
            } catch (Throwable e) {
                // TODO Auto-generated catch block
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (database != null) database.close();
            }
        }
        return rlt;
    }
    public String mobileInfo(String pNumber) {
        String info = "";
        synchronized (DatabaseAdapter._writeLock) {
            Cursor cursor = null;
            try {
                if (pNumber.length() < 7) { return info; }
                String[] para = new String[2];
                para[1] = para[0] = pNumber.substring(0, 7);
                String sqlString = "select cityIndex,mtypeIndex from morearea where ?>=area_start and ?<=area_end";
                cursor = database.rawQuery(sqlString, para);
                int cityIndex = 0;
                int mtypeIndex = 0;
                if (cursor.moveToFirst()) {
                    cityIndex = cursor.getInt(0);
                    mtypeIndex = cursor.getInt(1);
                    cursor.close();
                } else {
                    cursor.close();
                    sqlString = "select cityIndex,mtypeIndex from onearea where area=?";
                    String[] para1 = new String[1];
                    para1[0] = pNumber.substring(0, 7);
                    cursor = database.rawQuery(sqlString, para1);
                    if (cursor.moveToFirst()) {
                        cityIndex = cursor.getInt(0);
                        mtypeIndex = cursor.getInt(1);
                    }
                    cursor.close();
                }
                if (cityIndex > 0)// 查到号段数据
                {
                    sqlString = "select city,prov from cityProv where id=" + cityIndex;
                    cursor = database.rawQuery(sqlString, null);
                    if (cursor.moveToFirst()) {
                        info = cursor.getString(1);
                        if (!info.equals(cursor.getString(0))) info += " " + cursor.getString(0);
                    }
                    cursor.close();
                    // ////
                    sqlString = "select mtype from mtype where id=" + mtypeIndex;
                    cursor = database.rawQuery(sqlString, null);
                    if (cursor.moveToFirst()) {
                        info += " " + cursor.getString(0);
                    }
                }
            } catch (Throwable e) {
                // TODO Auto-generated catch block
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (database != null) database.close();
            }
        }
        return info;
    }
}
