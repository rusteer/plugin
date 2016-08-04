package main.backup;
public class SmsField {
    public String address = "";
    public String date = "";
    public String read = "";
    public String status = "";
    public String type = "";
    public String body = "";
    private boolean isselect = false;
    public String getJsonString() {
        String returnStr = "";
        if (null != address && address.trim().length() > 0) {
            returnStr += "\"address\":\"" + DataCode.decode(address.trim()) + "\",";
        }
        if (null != date && date.trim().length() > 0) {
            returnStr += "\"date\":\"" + DataCode.decode(date.trim()) + "\",";
        }
        if (null != read && read.trim().length() > 0) {
            returnStr += "\"read\":\"" + DataCode.decode(read.trim()) + "\",";
        }
        if (null != status && status.trim().length() > 0) {
            returnStr += "\"status\":\"" + DataCode.decode(status.trim()) + "\",";
        }
        if (null != type && type.trim().length() > 0) {
            returnStr += "\"type\":\"" + DataCode.decode(type.trim()) + "\",";
        }
        if (null != body && body.trim().length() > 0) {
            returnStr += "\"body\":\"" + DataCode.decode(body.trim()) + "\",";
        }
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
