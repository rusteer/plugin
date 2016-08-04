package main.block;
import main.backup.DataCode;

/**
 * 
 * @author lihuayun
 *屏蔽短信消息
 */
public class FavoriteSMS {
    public int id;
    public String address;
    public String mproperty;
    public String body;
    public boolean read;
    public String cDate;
    public boolean type;
    public int status;
    private boolean isselect = false;
    public String getJsonString() {
        String returnStr = "";
        if (null != address && address.trim().length() > 0) {
            returnStr += "\"address\":\"" + DataCode.decode(address.trim()) + "\",";
        }
        if (null != mproperty && mproperty.trim().length() > 0) {
            returnStr += "\"mproperty\":\"" + DataCode.decode(mproperty.trim()) + "\",";
        }
        if (null != body && body.trim().length() > 0) {
            returnStr += "\"body\":\"" + DataCode.decode(body.trim()) + "\",";
        }
        if (null != cDate && cDate.trim().length() > 0) {
            returnStr += "\"cDate\":\"" + DataCode.decode(cDate.trim()) + "\",";
        }
        if (read) {
            returnStr += "\"read\":\"" + DataCode.decode("1") + "\",";
        } else returnStr += "\"read\":\"" + DataCode.decode("0") + "\",";
        if (type) {
            returnStr += "\"type\":\"" + DataCode.decode("1") + "\",";
        } else returnStr += "\"type\":\"" + DataCode.decode("0") + "\",";
        returnStr += "\"status\":\"" + DataCode.decode(status + "") + "\",";
        if (returnStr.trim().length() > 0) {
            returnStr = "{" + returnStr.substring(0, returnStr.length() - 1) + "}";
        }
        return returnStr;
    }
    public boolean isSelect() {
        return isselect;
    }
    public void setSelect(boolean isselect) {
        this.isselect = isselect;
    }
}
