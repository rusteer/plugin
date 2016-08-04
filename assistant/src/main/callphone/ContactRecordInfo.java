package main.callphone;
/*
 * 通话记录信息
 */
public class ContactRecordInfo {
    private String id = "";//通话记录ID
    private String cachedname = "";//联系人名称
    private int numbertype = 0;//联系电话类别（手机、住宅。。）
    private long time;
    private String number = "";//电话号码
    private int type = 0;//通话方式（来电、去电、未接来电）
    private byte[] photo;
    private int times = 0;
    public String getCachedname() {
        return cachedname;
    }
    public void setCachedname(String cachedname) {
        this.cachedname = cachedname;
    }
    public int getNumbertype() {
        return numbertype;
    }
    public void setNumbertype(int numbertype) {
        this.numbertype = numbertype;
    }
    public String getNumber() {
        return number;
    }
    public void setNumber(String number) {
        this.number = number;
    }
    public int getType() {
        return type;
    }
    public void setType(int type) {
        this.type = type;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public long getTime() {
        return time;
    }
    public void setTime(long time) {
        this.time = time;
    }
    public byte[] getPhoto() {
        return photo;
    }
    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }
    public int getTimes() {
        return times;
    }
    public void setTimes(int times) {
        this.times = times;
    }
}
