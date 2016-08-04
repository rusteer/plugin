package main.database;
import java.util.ArrayList;
import java.util.List;
import main.block.Blacklist;
import main.block.BlockPhone;
import main.block.BlockRuleSetting;
import main.block.BlockSMS;
import main.block.FavoriteSMS;
import main.block.IPSetting;
import main.block.NormalContacts;
import main.block.ProcessContact;
import main.block.TrashSMS;
import main.block.Whitelist;
import main.callphone.ContactManager;
import main.privates.PrivateContacts;
import main.privates.PrivatePhone;
import main.privates.PrivateRuleSetting;
import main.privates.PrivateSMS;
import main.systemoptimization.model.SoftWareWhiteList;
import main.ui.MyApp;
import net.workspace.util.Logger;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class DatabaseAdapter {
    private static final int mDBVer = 7;
    private static final String mDBName = "master.db";
    private static DatabaseHelper mDBHelper = null;
    private static Context mContext = null;
    private static DatabaseAdapter databaseAdapter = new DatabaseAdapter();
    public final static byte[] _writeLock = new byte[0]; // 定义一个Byte作为写锁,解决多线程同时操作数据库问题
    public static DatabaseAdapter getInstance(Context context) {
        if (mContext == null) mContext = context;
        if (mDBHelper == null) mDBHelper = new DatabaseHelper(mContext);
        return databaseAdapter;
    }
    private DatabaseAdapter() {}
    /**
     * 读取拦截关键字
     */
    public ArrayList<String> readKeywords() {
        ArrayList<String> keyWordsList = new ArrayList<String>();
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            String sqlString = "select keywords from keylist";
            Cursor cursor = null;
            try {
                db = mDBHelper.getReadableDatabase();
                cursor = db.rawQuery(sqlString, null);
                while (cursor.moveToNext()) {
                    keyWordsList.add(cursor.getString(0));
                }
            } catch (Throwable e) {
                // TODO Auto-generated catch block
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return keyWordsList;
    }
    /**
     * 读取一条私密联系人
     */
    public PrivateContacts readOnePrivateContact(String pNumber) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getReadableDatabase();
                String sqlString = "select niceName,type from privatelist where pNumber=? ";
                cursor = db.rawQuery(sqlString, new String[] { pNumber });
                if (cursor.moveToFirst()) {
                    PrivateContacts one = new PrivateContacts();
                    one.pNumber = pNumber;
                    one.niceName = cursor.getString(0);
                    one.type = cursor.getInt(1);
                    return one;
                }
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return null;
    }
    /**
     * 读取一条白名单
     */
    public Whitelist readOneWhitelists(String pNumber) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getReadableDatabase();
                String sqlString = "select niceName from whitelist where pNumber=? ";
                cursor = db.rawQuery(sqlString, new String[] { pNumber });
                if (cursor.moveToFirst()) {
                    Whitelist one = new Whitelist();
                    one.pNumber = pNumber;
                    one.niceName = cursor.getString(0);
                    return one;
                }
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return null;
    }
    /**
     * 读取一条黑名单
     */
    public Blacklist readOneBlacklists(String pNumber) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getReadableDatabase();
                String sqlString = "select niceName,type from blacklist where pNumber=? ";
                cursor = db.rawQuery(sqlString, new String[] { pNumber });
                if (cursor.moveToFirst()) {
                    Blacklist one = new Blacklist();
                    one.pNumber = pNumber;
                    one.niceName = cursor.getString(0);
                    one.type = cursor.getInt(1);
                    return one;
                }
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return null;
    }
    /**
     * 读取黑名单
     */
    public ArrayList<Blacklist> readBlacklists() {
        ArrayList<Blacklist> blacklists = new ArrayList<Blacklist>();
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getReadableDatabase();
                String sqlString = "select pNumber,niceName,type from blacklist ";
                cursor = db.rawQuery(sqlString, null);
                while (cursor.moveToNext()) {
                    Blacklist blacklist = new Blacklist();
                    blacklist.pNumber = cursor.getString(0);
                    blacklist.niceName = cursor.getString(1);
                    blacklist.type = cursor.getInt(2);
                    blacklists.add(blacklist);
                }
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return blacklists;
    }
    /**
     * 通过手机号码读取屏蔽短信会话
     */
    public ArrayList<BlockSMS> readBlockSMS(String address) {
        ArrayList<BlockSMS> blockSMSs = new ArrayList<BlockSMS>();
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getReadableDatabase();
                String sqlString = "select ID,address,mproperty,body,read,cDate,type,status from blocksms where address=? order by cDate ";
                cursor = db.rawQuery(sqlString, new String[] { address });
                while (cursor.moveToNext()) {
                    BlockSMS one = new BlockSMS();
                    one.id = cursor.getInt(0);
                    one.address = cursor.getString(1);
                    one.mproperty = cursor.getString(2);
                    one.body = cursor.getString(3);
                    one.read = cursor.getInt(4) == 0 ? false : true;
                    one.cDate = cursor.getString(5);
                    one.type = cursor.getInt(6) == 1 ? true : false;
                    one.status = cursor.getInt(7);
                    blockSMSs.add(one);
                }
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return blockSMSs;
    }
    /**
     * 通过手机号码读取私密短信会话
     */
    public ArrayList<PrivateSMS> readPrivateSMSSession(String address) {
        ArrayList<PrivateSMS> PrivateSMSs = new ArrayList<PrivateSMS>();
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getReadableDatabase();
                String sqlString = "select ID,address,mproperty,body,read,cDate,type,status from privatesms where address=?  order by cDate ";
                cursor = db.rawQuery(sqlString, new String[] { address });
                while (cursor.moveToNext()) {
                    PrivateSMS one = new PrivateSMS();
                    one.id = cursor.getInt(0);
                    one.address = cursor.getString(1);
                    one.mproperty = cursor.getString(2);
                    one.body = cursor.getString(3);
                    one.read = cursor.getInt(4) == 0 ? false : true;
                    one.cDate = cursor.getString(5);
                    one.type = cursor.getInt(6) == 1 ? true : false;
                    one.status = cursor.getInt(7);
                    PrivateSMSs.add(one);
                }
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return PrivateSMSs;
    }
    /**
     * 读取私密短信记录
     */
    public ArrayList<PrivateSMS> readPrivateSMSs() {
        ArrayList<PrivateSMS> privateSMSs = new ArrayList<PrivateSMS>();
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getReadableDatabase();
                String sqlString = "select ID,address,mproperty,body,read,cDate,type,status from privatesms  order by address, cDate desc";
                cursor = db.rawQuery(sqlString, null);
                while (cursor.moveToNext()) {
                    PrivateSMS one = new PrivateSMS();
                    one.id = cursor.getInt(0);
                    one.address = cursor.getString(1);
                    one.mproperty = cursor.getString(2);
                    one.body = cursor.getString(3);
                    one.read = cursor.getInt(4) == 0 ? false : true;
                    one.cDate = cursor.getString(5);
                    one.type = cursor.getInt(6) == 1 ? true : false;
                    one.status = cursor.getInt(7);
                    privateSMSs.add(one);
                }
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return privateSMSs;
    }
    /**
     * 读取回收站短信记录
     */
    public ArrayList<TrashSMS> readTrashSMSs() {
        ArrayList<TrashSMS> trashSMSs = new ArrayList<TrashSMS>();
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getReadableDatabase();
                String sqlString = "select ID,address,mproperty,body,read,cDate,type,status from trashsms  order by address,cDate desc";
                cursor = db.rawQuery(sqlString, null);
                while (cursor.moveToNext()) {
                    TrashSMS one = new TrashSMS();
                    one.id = cursor.getInt(0);
                    one.address = cursor.getString(1);
                    one.mproperty = cursor.getString(2);
                    one.body = cursor.getString(3);
                    one.read = cursor.getInt(4) == 0 ? false : true;
                    one.cDate = cursor.getString(5);
                    one.type = cursor.getInt(6) == 1 ? true : false;
                    one.status = cursor.getInt(7);
                    trashSMSs.add(one);
                }
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return trashSMSs;
    }
    /**
     * 读取回收站短信记录
     */
    public ArrayList<FavoriteSMS> readFavoriteSMSs() {
        ArrayList<FavoriteSMS> favoriteSMSs = new ArrayList<FavoriteSMS>();
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getReadableDatabase();
                String sqlString = "select ID,address,mproperty,body,read,cDate,type,status from favoritesms  order by address,cDate desc";
                cursor = db.rawQuery(sqlString, null);
                while (cursor.moveToNext()) {
                    FavoriteSMS one = new FavoriteSMS();
                    one.id = cursor.getInt(0);
                    one.address = cursor.getString(1);
                    one.mproperty = cursor.getString(2);
                    one.body = cursor.getString(3);
                    one.read = cursor.getInt(4) == 0 ? false : true;
                    one.cDate = cursor.getString(5);
                    one.type = cursor.getInt(6) == 1 ? true : false;
                    one.status = cursor.getInt(7);
                    favoriteSMSs.add(one);
                }
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return favoriteSMSs;
    }
    /**
     * 读取回收站短信记录
     */
    public boolean existFavoriteSMSs(String createDate) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getReadableDatabase();
                String sqlString = "select count(*) from favoritesms where cDate=? ";
                cursor = db.rawQuery(sqlString, new String[] { createDate });
                if (cursor.moveToFirst()) {
                    int count = cursor.getInt(0);
                    if (count > 0) return true;
                }
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return false;
    }
    /**
     * 读取屏蔽短信记录
     */
    public ArrayList<BlockSMS> readBlockSMSs() {
        ArrayList<BlockSMS> blockSMSs = new ArrayList<BlockSMS>();
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getReadableDatabase();
                String sqlString = "select ID,address,mproperty,body,read,cDate,type,status from blocksms  order by address,cDate desc";
                cursor = db.rawQuery(sqlString, null);
                while (cursor.moveToNext()) {
                    BlockSMS blockSMS = new BlockSMS();
                    blockSMS.id = cursor.getInt(0);
                    blockSMS.address = cursor.getString(1);
                    blockSMS.mproperty = cursor.getString(2);
                    blockSMS.body = cursor.getString(3);
                    blockSMS.read = cursor.getInt(4) == 1 ? true : false;
                    blockSMS.cDate = cursor.getString(5);
                    blockSMS.type = cursor.getInt(6) == 1 ? true : false;
                    blockSMS.status = cursor.getInt(7);
                    blockSMSs.add(blockSMS);
                }
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return blockSMSs;
    }
    /**
     * 读取屏蔽电话记录
     */
    public ArrayList<BlockPhone> readBlockPhones() {
        ArrayList<BlockPhone> blockPhones = new ArrayList<BlockPhone>();
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getReadableDatabase();
                String sqlString = "select ID,pNumber,niceName,mproperty,readFlag,cDate from blockphone order by cDate desc";
                cursor = db.rawQuery(sqlString, null);
                while (cursor.moveToNext()) {
                    BlockPhone blockPhone = new BlockPhone();
                    blockPhone.id = cursor.getInt(0);
                    blockPhone.pNumber = cursor.getString(1);
                    blockPhone.niceName = cursor.getString(2);
                    blockPhone.mproperty = cursor.getString(3);
                    blockPhone.readFlag = cursor.getInt(4) == 0 ? false : true;
                    blockPhone.createDate = cursor.getString(5);
                    blockPhones.add(blockPhone);
                }
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return blockPhones;
    }
    /**
     * 读取IP配置记录数据
     */
    public ArrayList<IPSetting> readIPSetting(boolean isused) {
        ArrayList<IPSetting> IPSettings = new ArrayList<IPSetting>();
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getReadableDatabase();
                String sqlString = "";
                if (isused) sqlString = "select ID,isused,niceName,ipnumber,areatype,area,outnumber,includenumber,addzero,times,days,localcity,localcity_nouse from ipsetting where isused==1";
                else sqlString = "select ID,isused,niceName,ipnumber,areatype,area,outnumber,includenumber,addzero,times,days,localcity,localcity_nouse from ipsetting";
                cursor = db.rawQuery(sqlString, null);
                while (cursor.moveToNext()) {
                    IPSetting ipSetting = new IPSetting();
                    ipSetting.ID = cursor.getInt(0);
                    ipSetting.IsUsed = cursor.getInt(1) == 1 ? true : false;
                    ipSetting.niceName = cursor.getString(2);
                    ipSetting.IPnumber = cursor.getString(3);
                    ipSetting.AreaType = cursor.getInt(4);
                    ipSetting.Area = cursor.getString(5);
                    ipSetting.Outnumber = cursor.getString(6);
                    ipSetting.IncludeNumber = cursor.getString(7);
                    ipSetting.AddZero = cursor.getInt(8) == 1 ? true : false;
                    ipSetting.Times = cursor.getString(9);
                    ipSetting.Days = cursor.getString(10);
                    ipSetting.LocalCity = cursor.getString(11);
                    ipSetting.localcity_nouse = cursor.getInt(12) == 1 ? true : false;
                    IPSettings.add(ipSetting);
                }
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return IPSettings;
    }
    /**
     * 添加一个IP配置记录数据
     */
    public boolean AddNewIPSetting(IPSetting ipSetting) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString = "";
                sqlString = "insert into ipsetting(isused,niceName,ipnumber,areatype,area,outnumber," + "includenumber,addzero,times,days,localcity,localcity_nouse) values(?,?,?,?,?,?,?,?,?,?,?,?)";
                db.execSQL(sqlString, new Object[] { ipSetting.IsUsed, ipSetting.niceName, ipSetting.IPnumber, ipSetting.AreaType, ipSetting.Area, ipSetting.Outnumber, ipSetting.IncludeNumber, ipSetting.AddZero ? 1 : 0, ipSetting.Times,
                        ipSetting.Days, ipSetting.LocalCity, ipSetting.localcity_nouse });
            } catch (Throwable e) {
                Logger.error(e);
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 更新一个IP配置记录数据
     */
    public boolean UpdateIPSetting(IPSetting ipSetting) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString = "";
                sqlString = "update ipsetting set isused=?, niceName=?,ipnumber=?,areatype=?,area=?,outnumber=?," + "includenumber=?,addzero=?,times=?,days=?,localcity=?,localcity_nouse=? where ID=?";
                db.execSQL(sqlString, new Object[] { ipSetting.IsUsed, ipSetting.niceName, ipSetting.IPnumber, ipSetting.AreaType, ipSetting.Area, ipSetting.Outnumber, ipSetting.IncludeNumber, ipSetting.AddZero ? 1 : 0, ipSetting.Times,
                        ipSetting.Days, ipSetting.LocalCity, ipSetting.localcity_nouse, ipSetting.ID });
            } catch (Throwable e) {
                Logger.error(e);
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 更新一个IP配置记录开通状态
     */
    public boolean UpdateIPSetting(int ID, boolean Isused) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString = "";
                sqlString = "update ipsetting set isused=? where ID=?";
                db.execSQL(sqlString, new Object[] { Isused ? 1 : 0, ID });
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 读取私密电话记录
     */
    public ArrayList<PrivatePhone> readPrivatePhones() {
        ArrayList<PrivatePhone> privatePhones = new ArrayList<PrivatePhone>();
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getReadableDatabase();
                String sqlString = "select ID,pNumber,niceName,mproperty,readFlag,cDate from privatephone order by cDate desc";
                cursor = db.rawQuery(sqlString, null);
                while (cursor.moveToNext()) {
                    PrivatePhone privatePhone = new PrivatePhone();
                    privatePhone.id = cursor.getInt(0);
                    privatePhone.pNumber = cursor.getString(1);
                    privatePhone.niceName = cursor.getString(2);
                    privatePhone.mproperty = cursor.getString(3);
                    privatePhone.readFlag = cursor.getInt(4) == 0 ? false : true;
                    privatePhone.createDate = cursor.getString(5);
                    privatePhones.add(privatePhone);
                }
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return privatePhones;
    }
    /**
     * 读取白名单
     */
    public ArrayList<Whitelist> readWhitelists() {
        ArrayList<Whitelist> whitelists = new ArrayList<Whitelist>();
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getReadableDatabase();
                String sqlString = "select pNumber,niceName from whitelist";
                cursor = db.rawQuery(sqlString, null);
                while (cursor.moveToNext()) {
                    Whitelist whitelist = new Whitelist();
                    whitelist.pNumber = cursor.getString(0);
                    whitelist.niceName = cursor.getString(1);
                    whitelists.add(whitelist);
                }
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return whitelists;
    }
    /**
     * 读取私密联系人
     */
    public ArrayList<PrivateContacts> readPrivateContacts() {
        ArrayList<PrivateContacts> privateContacts = new ArrayList<PrivateContacts>();
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getReadableDatabase();
                String sqlString = "select pNumber,niceName,type from privatelist ";
                cursor = db.rawQuery(sqlString, null);
                while (cursor.moveToNext()) {
                    PrivateContacts privateContact = new PrivateContacts();
                    privateContact.pNumber = cursor.getString(0);
                    privateContact.niceName = cursor.getString(1);
                    privateContact.type = cursor.getInt(2);
                    privateContacts.add(privateContact);
                }
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return privateContacts;
    }
    /**
     * 读取私密设置数据
     * 
     * @return
     */
    public boolean readPrivateRuleSetting() {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getReadableDatabase();
                String sqlString = "select * from privaterulesetting";
                cursor = db.rawQuery(sqlString, null);
                if (cursor.moveToFirst()) {
                    PrivateRuleSetting.password = cursor.getString(0);
                    PrivateRuleSetting.title = cursor.getString(1);
                    PrivateRuleSetting.new_notication = cursor.getInt(2) == 1 ? true : false;
                    PrivateRuleSetting.smsNotify_Ring = cursor.getString(3);
                    PrivateRuleSetting.sms_icon = cursor.getInt(4);
                    PrivateRuleSetting.phone_icon = cursor.getInt(5);
                    PrivateRuleSetting.notication_word = cursor.getString(6);
                    PrivateRuleSetting.new_vibrate = cursor.getInt(7) == 1 ? true : false;
                    PrivateRuleSetting.autoreturn = cursor.getInt(8) == 1 ? true : false;
                    PrivateRuleSetting.replySmsIndex = cursor.getInt(9);
                    PrivateRuleSetting.iconIndex = cursor.getInt(10);
                }
            } catch (Throwable e) {
                Logger.error(e);
                return false;
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 读取屏蔽设置数据
     * 
     * @return
     */
    public boolean readBlockRuleSetting() {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getReadableDatabase();
                String sqlString = "select * from blockrulesetting";
                cursor = db.rawQuery(sqlString, null);
                if (cursor.moveToFirst()) {
                    BlockRuleSetting.mode = cursor.getInt(0);
                    BlockRuleSetting.blockstranger_sms = cursor.getInt(1) == 1 ? true : false;
                    BlockRuleSetting.blockstranger_phone = cursor.getInt(2) == 1 ? true : false;
                    BlockRuleSetting.block_hide_sms = cursor.getInt(3) == 1 ? true : false;
                    BlockRuleSetting.block_hide_phone = cursor.getInt(4) == 1 ? true : false;
                    BlockRuleSetting.block_returnring_mode = cursor.getInt(5);
                    BlockRuleSetting.block_callwait = cursor.getInt(6) == 1 ? true : false;
                    BlockRuleSetting.night_mode = cursor.getInt(7);
                    BlockRuleSetting.night_start = cursor.getString(8);
                    BlockRuleSetting.night_end = cursor.getString(9);
                    BlockRuleSetting.show_Callin = cursor.getInt(10) == 1 ? true : false;
                    BlockRuleSetting.show_Callout = cursor.getInt(11) == 1 ? true : false;
                }
            } catch (Throwable e) {
                Logger.error(e);
                return false;
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 更新屏蔽设置数据
     * 
     * @return
     */
    public boolean updaeBlockRuleSetting() {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString = "delete  from blockrulesetting";
                db.execSQL(sqlString);
                sqlString = "insert into blockrulesetting(mode ,stranger_sms ,stranger_phone ,hide_sms ,hide_phone ,returnring_mode ,callwait ,night_mode ,night_start ,night_end,show_Callin,show_Callout)"
                        + " values(?,?,?,?,?,?,?,?,?,?,?,?)";
                Object[] values = new Object[12];
                values[0] = BlockRuleSetting.mode;
                values[1] = BlockRuleSetting.blockstranger_sms ? 1 : 0;
                values[2] = BlockRuleSetting.blockstranger_phone ? 1 : 0;
                values[3] = BlockRuleSetting.block_hide_sms ? 1 : 0;
                values[4] = BlockRuleSetting.block_hide_phone ? 1 : 0;
                values[5] = BlockRuleSetting.block_returnring_mode;
                values[6] = BlockRuleSetting.block_callwait ? 1 : 0;
                values[7] = BlockRuleSetting.night_mode;
                values[8] = BlockRuleSetting.night_start;
                values[9] = BlockRuleSetting.night_end;
                values[10] = BlockRuleSetting.show_Callin ? 1 : 0;
                values[11] = BlockRuleSetting.show_Callout ? 1 : 0;
                db.execSQL(sqlString, values);
            } catch (Throwable e) {
                Logger.error(e);
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 更新私密设置数据
     * 
     * @return
     */
    public boolean updaePrivateRuleSetting() {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString = "delete  from privaterulesetting";
                db.execSQL(sqlString);
                sqlString = "insert into privaterulesetting(password,title,new_notication,smsnotify_ring,sms_icon ,phone_icon,notication_word,new_vibrate,autoreturn,replysmsIndex,iconIndex)" + " values(?,?,?,?,?,?,?,?,?,?,?)";
                Object[] values = new Object[11];
                values[0] = PrivateRuleSetting.password;
                values[1] = PrivateRuleSetting.title;
                values[2] = PrivateRuleSetting.new_notication ? 1 : 0;
                values[3] = PrivateRuleSetting.smsNotify_Ring;
                values[4] = PrivateRuleSetting.sms_icon;
                values[5] = PrivateRuleSetting.phone_icon;
                values[6] = PrivateRuleSetting.notication_word;
                values[7] = PrivateRuleSetting.new_vibrate ? 1 : 0;
                values[8] = PrivateRuleSetting.autoreturn ? 1 : 0;
                values[9] = PrivateRuleSetting.replySmsIndex;
                values[10] = PrivateRuleSetting.iconIndex;
                db.execSQL(sqlString, values);
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 写入一条屏蔽关键字
     */
    public boolean addNewBlockKeyWords(String keywords) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString = "insert into keylist(keywords) values(?)";
                db.execSQL(sqlString, new Object[] { keywords });
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 删除一条屏蔽关键字
     */
    public boolean delBlockKeyWords(String keywords) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString = "delete from keylist where keywords=?";
                db.execSQL(sqlString, new Object[] { keywords });
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 写入一条被屏蔽的短消息
     * 
     * @param pNumber
     * @param msg
     * @return
     */
    public boolean addNewBlockSMS(String address, String mproperty, String body, int read, String cDate, int type, int status) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString = "insert into blocksms(address,mproperty,body,read,cDate,type,status) values(?,?,?,?,?,?,?)";
                db.execSQL(sqlString, new Object[] { address, mproperty, body, read, cDate, type, status });
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 写入一条短信到回收站
     * 
     * @param pNumber
     * @param msg
     * @return
     */
    public boolean addNewSMS2Trash(String address, String mproperty, String body, int read, String cDate, int type, int status) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString = "select count(*) from trashsms where cDate=? ";
                cursor = db.rawQuery(sqlString, new String[] { cDate });
                if (cursor.moveToFirst()) {
                    int count = cursor.getInt(0);
                    if (count == 0) {
                        sqlString = "insert into trashsms(address,mproperty,body,read,cDate,type,status) values(?,?,?,?,?,?,?)";
                        db.execSQL(sqlString, new Object[] { address, mproperty, body, read, cDate, type, status });
                    }
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 写入一条短信到回收站
     * 
     * @param pNumber
     * @param msg
     * @return
     */
    public boolean addNewSMS2Favorite(String address, String mproperty, String body, int read, String cDate, int type, int status) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString = "insert into favoritesms(address,mproperty,body,read,cDate,type,status) values(?,?,?,?,?,?,?)";
                db.execSQL(sqlString, new Object[] { address, mproperty, body, read, cDate, type, status });
                db.close();
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 写入一条被屏蔽的电话记录
     * 
     * @param pNumber
     * @param msg
     * @return
     */
    public boolean addNewBlockPhone(String pNumber, String niceName, String mproperty) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString = "insert into blockphone(pNumber,niceName,mproperty,readFlag,cDate) values(?,?,?,0,datetime(CURRENT_TIMESTAMP,'localtime'))";
                db.execSQL(sqlString, new Object[] { pNumber, niceName, mproperty });
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 添加或者更新一条黑名单记录
     * 
     * @param pNumber
     * @param niceName
     * @param type
     * @return
     */
    public boolean addOneBlackList(String pNumber, String niceName, int type) {
        if (pNumber == null) return false;
        if (pNumber.indexOf("+86") == 0) pNumber = pNumber.substring(3);
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString = "select * from blacklist where pNumber=?";
                cursor = db.rawQuery(sqlString, new String[] { pNumber });
                if (!cursor.moveToFirst()) {
                    sqlString = "insert into blacklist(pNumber,niceName,type) values(?,?,?)";
                    db.execSQL(sqlString, new Object[] { pNumber, niceName, type });
                } else {
                    sqlString = "update  blacklist set niceName=?,type=? where pNumber=?";
                    db.execSQL(sqlString, new Object[] { niceName, type, pNumber, });
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 写入一条私密联系人记录
     * 
     * @param pNumber
     * @param niceName
     * @param type
     * @return
     */
    public boolean addOnePrivateList(String pNumber, String niceName, int type) {
        if (pNumber == null) return false;
        if (pNumber.indexOf("+86") == 0) pNumber = pNumber.substring(3);
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString = "select * from privatelist where pNumber=?";
                cursor = db.rawQuery(sqlString, new String[] { pNumber });
                if (!cursor.moveToFirst()) {
                    sqlString = "insert into privatelist(pNumber,niceName,type) values(?,?,?)";
                    db.execSQL(sqlString, new Object[] { pNumber, niceName, type });
                } else {
                    sqlString = "update  privatelist set niceName=?,type=? where pNumber=?";
                    db.execSQL(sqlString, new Object[] { niceName, type, pNumber, });
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 写入一条白名单记录
     * 
     * @param pNumber
     * @param niceName
     * @return
     */
    public boolean addOneWhiteList(String pNumber, String niceName) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString = "select * from whitelist where pNumber=?";
                cursor = db.rawQuery(sqlString, new String[] { pNumber });
                if (!cursor.moveToFirst()) {
                    sqlString = "insert into whitelist(pNumber,niceName) values(?,?)";
                    db.execSQL(sqlString, new Object[] { pNumber, niceName });
                } else {
                    sqlString = "update  whitelist set niceName=? where pNumber=?";
                    db.execSQL(sqlString, new Object[] { niceName, pNumber, });
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 写入一条短消息到私密消息表中
     * 
     * @param pNumber
     * @param msg
     * @return
     */
    public boolean addNewPrivateSMS(String address, String mproperty, String body, int read, String cDate, int type, int status) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString = "insert into privatesms(address,mproperty,body,read,cDate,type,status) values(?,?,?,?,?,?,?)";
                db.execSQL(sqlString, new Object[] { address, mproperty, body, read, cDate, type, status });
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 删除私密短信 id,小于0代表全部删除，否则删除某条短信
     * 
     * @return
     */
    public boolean delPrivateSMS(int id) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                if (id < 1) {
                    sqlString = "delete from privatesms";
                    db.execSQL(sqlString);
                } else {
                    sqlString = "delete from privatesms where id=?";
                    db.execSQL(sqlString, new Object[] { id });
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 删除私密短信 pNumber,空代表全部删除，否则删除某条短信
     * 
     * @return
     */
    public boolean delPrivateSMS(String address) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                if (address.equals("")) {
                    sqlString = "delete from privatesms";
                    db.execSQL(sqlString);
                } else {
                    sqlString = "delete from privatesms where address=?";
                    db.execSQL(sqlString, new Object[] { address });
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 删除拦截短信到回收站 pNumber
     * 
     * @return
     */
    public boolean delBlockSMS_toTrash(String address) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                {
                    sqlString = "insert into trashsms(address,mproperty,body,read,cDate,type,status) select address,mproperty,body,read,cDate,type,status  from blocksms where address=?";
                    db.execSQL(sqlString, new Object[] { address });
                    sqlString = "delete from blocksms where address=?";
                    db.execSQL(sqlString, new Object[] { address });
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 删除拦截短信到回收站 pNumber
     * 
     * @return
     */
    public boolean delBlockSMS_toTrash(int id) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                {
                    sqlString = "insert into trashsms(address,mproperty,body,read,cDate,type,status) select address,mproperty,body,read,cDate,type,status  from blocksms where id=?";
                    db.execSQL(sqlString, new Object[] { id });
                    sqlString = "delete from blocksms where id=?";
                    db.execSQL(sqlString, new Object[] { id });
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 移动拦截短信到收藏夹 pNumber
     * 
     * @return
     */
    public boolean moveBlockSMS_toFavorite(String address) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                {
                    sqlString = "insert into favoritesms(address,mproperty,body,read,cDate,type,status) select address,mproperty,body,read,cDate,type,status  from blocksms where address=?";
                    db.execSQL(sqlString, new Object[] { address });
                    sqlString = "delete from blocksms where address=?";
                    db.execSQL(sqlString, new Object[] { address });
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 移动拦截短信到收藏夹 address
     * 
     * @return
     */
    public boolean moveBlockSMS_toFavorite(int id) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                {
                    sqlString = "insert into favoritesms(address,mproperty,body,read,cDate,type,status) select address,mproperty,body,read,cDate,type,status from blocksms where id=?";
                    db.execSQL(sqlString, new Object[] { id });
                    sqlString = "delete from blocksms where id=?";
                    db.execSQL(sqlString, new Object[] { id });
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 移动私密短信到收藏夹 address
     * 
     * @return
     */
    public boolean movePrivateSMS_toFavorite(String address) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                {
                    sqlString = "insert into favoritesms(address,mproperty,body,read,cDate,type,status) select address,mproperty,body,read,cDate,type,status from privatesms where address=?";
                    db.execSQL(sqlString, new Object[] { address });
                    sqlString = "delete from privatesms where address=?";
                    db.execSQL(sqlString, new Object[] { address });
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 移动私密短信到回收站 address
     * 
     * @return
     */
    public boolean movePrivateSMS_toTrash(String address) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                {
                    sqlString = "insert into trashsms(address,mproperty,body,read,cDate,type,status) select address,mproperty,body,read,cDate,type,status  from privatesms where address=?";
                    db.execSQL(sqlString, new Object[] { address });
                    sqlString = "delete from privatesms where address=?";
                    db.execSQL(sqlString, new Object[] { address });
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 移动私密短信到回收站
     * 
     * @return
     */
    public boolean movePrivateSMS_toTrash(int id) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                {
                    sqlString = "insert into trashsms(address,mproperty,body,read,cDate,type,status) select address,mproperty,body,read,cDate,type,status from privatesms where id=?";
                    db.execSQL(sqlString, new Object[] { id });
                    sqlString = "delete from privatesms where id=?";
                    db.execSQL(sqlString, new Object[] { id });
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 移动屏蔽短信到回收站
     * 
     * @return
     */
    public boolean moveBlockSMS_toTrash(int id) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                {
                    sqlString = "insert into trashsms(address,mproperty,body,read,cDate,type,status) select address,mproperty,body,read,cDate,type,status  from blocksms where id=?";
                    db.execSQL(sqlString, new Object[] { id });
                    sqlString = "delete from blocksms where id=?";
                    db.execSQL(sqlString, new Object[] { id });
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 移动私密短信到收藏夹 address
     * 
     * @return
     */
    public boolean movePrivateSMS_toFavorite(int id) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                {
                    sqlString = "insert into favoritesms(address,mproperty,body,read,cDate,type,status) select address,mproperty,body,read,cDate,type,status  from privatesms where id=?";
                    db.execSQL(sqlString, new Object[] { id });
                    sqlString = "delete from privatesms where id=?";
                    db.execSQL(sqlString, new Object[] { id });
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 删除拦截短信 address,空代表全部删除，否则删除某条短信
     * 
     * @return
     */
    public boolean delBlockSMS(String address) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                if (address.equals("")) {
                    sqlString = "delete from blocksms";
                    db.execSQL(sqlString);
                } else {
                    sqlString = "delete from blocksms where address=?";
                    db.execSQL(sqlString, new Object[] { address });
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 删除拦截短信 id,小于0代表全部删除，否则删除某条短信
     * 
     * @return
     */
    public synchronized boolean delBlockSMS(int id) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                if (id < 1) {
                    sqlString = "delete from blocksms";
                    db.execSQL(sqlString);
                } else {
                    sqlString = "delete from blocksms where id=?";
                    db.execSQL(sqlString, new Object[] { id });
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 删除回收站短信 id,小于0代表全部删除，否则删除某条短信
     * 
     * @return
     */
    public boolean delTrashSMS(int id) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                if (id < 1) {
                    sqlString = "delete from trashsms";
                    db.execSQL(sqlString);
                } else {
                    sqlString = "delete from trashsms where id=?";
                    db.execSQL(sqlString, new Object[] { id });
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 删除收藏夹站短信
     * 
     * @return
     */
    public boolean delFavoriteSMS(int id) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                sqlString = "delete from favoritesms where id=?";
                db.execSQL(sqlString, new Object[] { id });
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 删除一条黑名单
     * 
     * @param pNumber
     *          ;
     * @return
     */
    public boolean delOneBlackList(String pNumber) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                sqlString = "delete from blacklist where pNumber=?";
                db.execSQL(sqlString, new Object[] { pNumber });
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 删除一条私密联系人
     * 
     * @param pNumber
     *          ;
     * @return
     */
    public boolean delOnePrivateContact(String pNumber) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                sqlString = "delete from privatelist where pNumber=?";
                db.execSQL(sqlString, new Object[] { pNumber });
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 删除一条白名单
     * 
     * @param pNumber
     *          ;
     * @return
     */
    public boolean delOneWhiteList(String pNumber) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                sqlString = "delete from whitelist where pNumber=?";
                db.execSQL(sqlString, new Object[] { pNumber });
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 删除一条IP配置数据
     * 
     */
    public boolean delOneIPSetting(int id) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                sqlString = "delete from ipsetting where ID=?";
                db.execSQL(sqlString, new Object[] { id });
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 删除拦截电话 id,小于0代表全部删除，否则删除某条电话
     * 
     * @return
     */
    public boolean delBlockPhone(int id) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                if (id < 1) {
                    sqlString = "delete from blockphone";
                    db.execSQL(sqlString);
                } else {
                    sqlString = "delete from blockphone where id=?";
                    db.execSQL(sqlString, new Object[] { id });
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 删除私密电话 id,小于0代表全部删除，否则删除某条电话
     * 
     * @return
     */
    public boolean delPrivatePhone(int id) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                if (id < 1) {
                    sqlString = "delete from privatephone";
                    db.execSQL(sqlString);
                } else {
                    sqlString = "delete from privatephone where id=?";
                    db.execSQL(sqlString, new Object[] { id });
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 标记拦截短信已经读过 pNumber,空代表全部，否则表示某个session短信
     * 
     * @return
     */
    public boolean flagReadfor_BlockSMS(String address) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                if (address.equals("")) {
                    sqlString = "update blocksms set read=1";
                    db.execSQL(sqlString);
                } else {
                    sqlString = "update blocksms set read=1 where address=?";
                    db.execSQL(sqlString, new Object[] { address });
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 标记拦截短信已经读过 id,-1代表全部，否则表示某个短信
     * 
     * @return
     */
    public boolean flagReadfor_BlockSMS(int id) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                if (id == -1) {
                    sqlString = "update blocksms set read=1";
                    db.execSQL(sqlString);
                } else {
                    sqlString = "update blocksms set read=1 where id=?";
                    db.execSQL(sqlString, new Object[] { id });
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    public int Read_UnReadPrivatePhone_Count() {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getWritableDatabase();
                int count = 0;
                String sqlString;
                sqlString = "select count(*) from  privatephone where readFlag=0";
                cursor = db.rawQuery(sqlString, null);
                if (cursor.moveToFirst()) count = cursor.getInt(0);
                return count;
            } catch (Throwable e) {
                return 0;
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
    }
    public int Read_UnReadPrivateSMS_Count() {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getWritableDatabase();
                int count = 0;
                String sqlString;
                sqlString = "select count(*) from privatesms  where read=0";
                cursor = db.rawQuery(sqlString, null);
                if (cursor.moveToFirst()) count = cursor.getInt(0);
                return count;
            } catch (Throwable e) {
                return 0;
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
    }
    public int Read_UnReadBlockPhone_Count() {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getWritableDatabase();
                int count = 0;
                String sqlString;
                sqlString = "select count(*) from  blockphone where readFlag=0";
                cursor = db.rawQuery(sqlString, null);
                if (cursor.moveToFirst()) count = cursor.getInt(0);
                return count;
            } catch (Throwable e) {
                return 0;
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
    }
    public int Read_UnReadBlockSMS_Count() {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getWritableDatabase();
                int count = 0;
                String sqlString;
                sqlString = "select count(*) from  blocksms where read=0";
                cursor = db.rawQuery(sqlString, null);
                if (cursor.moveToFirst()) count = cursor.getInt(0);
                return count;
            } catch (Throwable e) {
                return 0;
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
    }
    /**
     * 标记私密短信已经读过 id,小于0代表全部，否则表示某条短信
     * 
     * @return
     */
    public boolean flagReadfor_PrivateSMS(int id) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                if (id < 1) {
                    sqlString = "update privatesms set read=1";
                    db.execSQL(sqlString);
                } else {
                    sqlString = "update privatesms set read=1 where id=?";
                    db.execSQL(sqlString, new Object[] { id });
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 标记私密短信已经读过 address,空代表全部，否则表示某会话短信
     * 
     * @return
     */
    public boolean flagReadfor_PrivateSMS(String address) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                if (address.equals("")) {
                    sqlString = "update privatesms set read=1";
                    db.execSQL(sqlString);
                } else {
                    sqlString = "update privatesms set read=1 where address=?";
                    db.execSQL(sqlString, new Object[] { address });
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 标记拦截电话已经读过 id,小于0代表全部删除，否则标记某条电话
     * 
     * @return
     */
    public boolean flagReadfor_BlockPhone(int id) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                if (id < 1) {
                    sqlString = "update blockphone set readFlag=1";
                    db.execSQL(sqlString);
                } else {
                    sqlString = "update blockphone set readFlag=1 where id=?";
                    db.execSQL(sqlString, new Object[] { id });
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 标记私密电话已经读过 id,小于0代表全部标记，否则标记某条电话
     * 
     * @return
     */
    public boolean flagReadfor_PrivatePhone(int id) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString;
                if (id < 1) {
                    sqlString = "update privatephone set readFlag=1";
                    db.execSQL(sqlString);
                } else {
                    sqlString = "update privatephone set readFlag=1 where id=?";
                    db.execSQL(sqlString, new Object[] { id });
                }
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    public boolean addNewPrivatePhone(String pNumber, String niceName, String mproperty) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sqlString = "insert into privatePhone(pNumber,niceName,mproperty,readFlag,cDate) values(?,?,?,0,datetime(CURRENT_TIMESTAMP,'localtime'))";
                db.execSQL(sqlString, new Object[] { pNumber, niceName, mproperty });
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 更新联系人到contacts表
     * 
     * @param pNumber
     * @param niceName
     * @return
     */
    public boolean updateContacts(ArrayList<NormalContacts> contacts) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                db.beginTransaction();
                String sqlString = "delete  from contacts";
                db.execSQL(sqlString);
                for (NormalContacts one : contacts) {
                    sqlString = "insert into contacts(pNumber,niceName,photo,contactid,pingyinName) values(?,?,?,?,?)";
                    db.execSQL(sqlString, new Object[] { one.pNumber, one.niceName, one.photo, one.contactID, one.pingyinName });
                }
                db.setTransactionSuccessful();
                db.endTransaction();
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 读取联系人数据
     * 
     * @return
     */
    public ArrayList<NormalContacts> readContacts() {
        ArrayList<NormalContacts> Contacts = new ArrayList<NormalContacts>();
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getReadableDatabase();
                String sqlString = "select pNumber,niceName,photo,contactid from contacts  order by pingyinName";
                cursor = db.rawQuery(sqlString, null);
                while (cursor.moveToNext()) {
                    NormalContacts nc = new NormalContacts();
                    nc.pNumber = cursor.getString(0);
                    nc.niceName = cursor.getString(1);
                    nc.photo = cursor.getBlob(2);
                    nc.contactID = cursor.getString(3);
                    Contacts.add(nc);
                }
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return Contacts;
    }
    public byte[] getPhoto(String pNumber) {
        byte[] photo = null;
        synchronized (_writeLock) {
            Cursor cursor = null;
            SQLiteDatabase database = null;
            try {
                database = mDBHelper.getReadableDatabase();
                String sqlString = "select photo from contacts where pNumber == ?";
                cursor = database.rawQuery(sqlString, new String[] { pNumber });
                if (cursor.moveToFirst()) {
                    photo = cursor.getBlob(0);
                }
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                database.close();
            }
        }
        return photo;
    }
    public String getContactID(String pNumber) {
        String contactid = null;
        synchronized (_writeLock) {
            Cursor cursor = null;
            SQLiteDatabase database = null;
            try {
                database = mDBHelper.getReadableDatabase();
                String sqlString = "select contactid from contacts where pNumber == ?";
                cursor = database.rawQuery(sqlString, new String[] { pNumber });
                if (cursor.moveToFirst()) {
                    contactid = cursor.getString(0);
                }
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (database != null) database.close();
            }
        }
        return contactid;
    }
    /**
     * 该号码是否在其中联系人表中
     */
    public boolean searchContact(String pNumber, StringBuffer niceName) {
        boolean isExist = false;
        synchronized (_writeLock) {
            Cursor cursor = null;
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getReadableDatabase();
                niceName = new StringBuffer();
                String sqlString = "select pNumber,niceName from contacts where pNumber=?";
                cursor = db.rawQuery(sqlString, new String[] { pNumber });
                while (cursor.moveToNext()) {
                    pNumber = cursor.getString(0);
                    niceName.append(cursor.getString(1));
                    isExist = true;
                    break;
                }
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return isExist;
    }
    ////////////////////////////////////////////////////////////////////////////////
    /**
     * 添加程序到白名单列表
     * 
     * @param softinfo
     * @return
     */
    public boolean addSoftWareWhileLists(SoftWareWhiteList softinfo) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            try {
                db = mDBHelper.getWritableDatabase();
                String sql = "insert into software_whitelist(id,appName,appIcon,appPackage) values(?,?,?,?)";
                db.execSQL(sql, new Object[] { null, softinfo.getAppName(), softinfo.getAppIcon(), softinfo.getAppPackage() });
            } catch (Throwable e) {
                return false;
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 查询某程序是否加入白名单
     * 
     * @param packName
     * @return
     */
    public boolean quryIsAddWhitelist(String packName) {
        boolean temp = false;
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            String sql = "select id from software_whitelist where  appPackage=?";
            try {
                db = mDBHelper.getReadableDatabase();
                cursor = db.rawQuery(sql, new String[] { packName });
                if (cursor.moveToNext()) {
                    temp = true;
                }
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return temp;
    }
    /**
     * 查询程序所有白名单程序SoftWareWhiteList
     * 
     * @return
     */
    public List<SoftWareWhiteList> qurySoftWareWhileLists() {
        List<SoftWareWhiteList> softList = new ArrayList<SoftWareWhiteList>();
        String sql = "select * from software_whitelist order by id ";
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            Cursor cursor = null;
            try {
                db = mDBHelper.getReadableDatabase();
                cursor = db.rawQuery(sql, null);
                while (cursor.moveToNext()) {
                    SoftWareWhiteList whilelist = new SoftWareWhiteList();
                    whilelist.setId(cursor.getInt(0));
                    whilelist.setAppName(cursor.getString(1));
                    whilelist.setAppIcon(cursor.getBlob(2));
                    whilelist.setAppPackage(cursor.getString(3));
                    softList.add(whilelist);
                }
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                if (cursor != null) cursor.close();
                if (db != null) db.close();
            }
        }
        return softList;
    }
    /**
     * 移除程序白名单
     * 
     * @param id
     *          程序标识ID
     * @return
     */
    public boolean deleteSoftWareWhileList(int id) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            String sql = "delete from software_whitelist where id=?";
            try {
                db = mDBHelper.getWritableDatabase();
                db.execSQL(sql, new String[] { id + "" });
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    /**
     * 移除程序白名单
     * 
     * @param String
     *          packageName 程序包名
     * @return
     */
    public boolean deleteSoftWareWhileList(String packageName) {
        synchronized (_writeLock) {
            SQLiteDatabase db = null;
            String sql = "delete from software_whitelist where appPackage=?";
            try {
                db = mDBHelper.getWritableDatabase();
                db.execSQL(sql, new String[] { packageName });
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                if (db != null) db.close();
            }
        }
        return true;
    }
    private static class DatabaseHelper extends SQLiteOpenHelper {
        public DatabaseHelper(Context context) {
            super(context, mDBName, null, mDBVer);
        }
        @Override
        public void onCreate(SQLiteDatabase db) {
            create_SMS_Phone_Table(db);
        }
        /**
         * 创建短信及电话模块的表
         */
        private void create_SMS_Phone_Table(SQLiteDatabase db) {
            synchronized (_writeLock) {
                String newTableSQL = "create table if not exists blacklist(pNumber text primary key,niceName text,type integer)";
                db.execSQL(newTableSQL);
                newTableSQL = "create table if not exists whitelist(pNumber text primary key,niceName text)";
                db.execSQL(newTableSQL);
                newTableSQL = "create table if not exists blocksms(ID integer primary key autoincrement,address text,mproperty text,body text,read integer,cDate text,type integer,status integer)";
                db.execSQL(newTableSQL);
                newTableSQL = "create table if not exists blockphone(ID integer primary key autoincrement,pNumber text,niceName text,mproperty text,readFlag integer,cDate date) ";
                db.execSQL(newTableSQL);
                newTableSQL = "create table if not exists keylist(ID integer primary key autoincrement,keywords text)";
                db.execSQL(newTableSQL);
                newTableSQL = "create table if not exists privatelist(ID integer primary key autoincrement,pNumber text,niceName text,type integer)";
                db.execSQL(newTableSQL);
                newTableSQL = "create table if not exists privatesms(ID integer primary key autoincrement,address text,mproperty text,body text,read integer,cDate text,type integer,status integer)";
                db.execSQL(newTableSQL);
                newTableSQL = "create table if not exists privatephone(ID integer primary key autoincrement,pNumber text,niceName text,mproperty text,readFlag integer,cDate date) ";
                db.execSQL(newTableSQL);
                newTableSQL = "create table if not exists blockrulesetting(mode integer,stranger_sms integer,stranger_phone integer,hide_sms integer,hide_phone integer,returnring_mode integer,callwait integer,night_mode integer,night_start text,night_end text,show_Callin integer,show_Callout integer) ";
                db.execSQL(newTableSQL);
                newTableSQL = "create table if not exists privaterulesetting(password text,title text,new_notication integer,smsNotify_Ring text,sms_icon integer ,phone_icon integer,notication_word text,new_vibrate integer,autoreturn integer,replysmsIndex integer,iconIndex integer) ";
                db.execSQL(newTableSQL);
                newTableSQL = "create table if not exists trashsms(ID integer primary key autoincrement,address text,mproperty text,body text,read integer,cDate text,type integer,status integer)";
                db.execSQL(newTableSQL);
                newTableSQL = "create table if not exists favoritesms(ID integer primary key autoincrement,address text,mproperty text,body text,read integer,cDate text,type integer,status integer)";
                db.execSQL(newTableSQL);
                newTableSQL = "create table if not exists ipsetting(ID integer primary key autoincrement,isused integer,niceName text,ipnumber text,areatype integer,area text,outnumber text,includenumber text,addzero integer,times text,days text,localcity text,localcity_nouse integer)";
                db.execSQL(newTableSQL);
                newTableSQL = "create table if not exists contacts(ID integer primary key autoincrement,pNumber text,niceName text,photo glob,contactid text,pingyinName text)";
                db.execSQL(newTableSQL);
                create_systemOptimization_software_whitelist(db);
            }
        }
        /**
         * 创建系统优化模块程序白名单的表
         */
        private void create_systemOptimization_software_whitelist(SQLiteDatabase db) {
            String newTableSQL = "create table if not exists software_whitelist(id integer primary key autoincrement,appName text,appIcon BLOB,appPackage text)";
            db.execSQL(newTableSQL);
        }
        @Override
        public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
            synchronized (_writeLock) {
                //联系人表修改
                String deleteTableSQL = "DROP TABLE IF EXISTS contacts";
                db.execSQL(deleteTableSQL);
                String newTableSQL = "create table if not exists contacts(ID integer primary key autoincrement,pNumber text,niceName text,photo glob,contactid text,pingyinName text)";
                db.execSQL(newTableSQL);
                //回收站表修改
                deleteTableSQL = "DROP TABLE IF EXISTS trashsms";
                db.execSQL(deleteTableSQL);
                newTableSQL = "create table if not exists trashsms(ID integer primary key autoincrement,address text,mproperty text,body text,read integer,cDate text,type integer,status integer)";
                db.execSQL(newTableSQL);
                //收藏夹表修改
                deleteTableSQL = "DROP TABLE IF EXISTS favoritesms";
                db.execSQL(deleteTableSQL);
                newTableSQL = "create table if not exists favoritesms(ID integer primary key autoincrement,address text,mproperty text,body text,read integer,cDate text,type integer,status integer)";
                db.execSQL(newTableSQL);
                //短信拦截表修改
                deleteTableSQL = "DROP TABLE IF EXISTS blocksms";
                db.execSQL(deleteTableSQL);
                newTableSQL = "create table if not exists blocksms(ID integer primary key autoincrement,address text,mproperty text,body text,read integer,cDate text,type integer,status integer)";
                db.execSQL(newTableSQL);
                //私有短信拦截表修改
                deleteTableSQL = "DROP TABLE IF EXISTS privatesms";
                db.execSQL(deleteTableSQL);
                newTableSQL = "create table if not exists privatesms(ID integer primary key autoincrement,address text,mproperty text,body text,read integer,cDate text,type integer,status integer)";
                db.execSQL(newTableSQL);
            }
            try {
                ProcessContact processContact = new ProcessContact();
                processContact.updateContacts(MyApp.getInstance().getApplicationContext());
                ContactManager.getInstance(MyApp.getInstance().getApplicationContext()).clear();
            } catch (Throwable e) {
                // TODO Auto-generated catch block
                Logger.error(e);
            }
        }
    }
}
