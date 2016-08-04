package main.block;
public class SMSSession {
    /**
     * 会话类型，1-block，2-private,3-手机短信箱
     */
    public int type;
    public int id;
    public String pNumber = "";
    public String niceName = "";
    public String mproperty = "";
    public String msg = "";
    public long createDate;
    public int count;
    /**
     * 1-表示由发送窗口转入；
     */
    public int actionType;
}
