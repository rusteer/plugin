package main.block;
/**
 * 
 * @author lihuayun
 * 电话联系人
 */
public class NormalContacts {
    public String contactID;
    public String pNumber;
    public String niceName;
    public String pingyinName;
    public byte[] photo;
    public String getpNumber() {
        return pNumber;
    }
    public void setpNumber(String pNumber) {
        this.pNumber = pNumber;
    }
    public String getNiceName() {
        return niceName;
    }
    public void setNiceName(String niceName) {
        this.niceName = niceName;
    }
    public byte[] getPhoto() {
        return photo;
    }
    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }
    public String getContactID() {
        return contactID;
    }
    public void setContactID(String contactID) {
        this.contactID = contactID;
    }
    public String getPingyinName() {
        return pingyinName;
    }
    public void setPingyinName(String pingyinName) {
        this.pingyinName = pingyinName;
    }
}
