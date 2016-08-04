package main.block;
public class IPSetting {
    /**
     * 记录标识
     */
    public int ID;
    /**
     * 本设置是否启用
     */
    public boolean IsUsed;
    /**
     * IP设置名称
     */
    public String niceName;
    /**
     * IPq前缀号码
     */
    public String IPnumber;
    /**
     * 0-全部地区;1-下面地区;2-除下面地区
     */
    public int AreaType;
    /**
     * 地区(省份、城市)多个用";"隔开
     */
    public String Area;
    /**
     * 不用IP的号码,多个用";"隔开
     */
    public String Outnumber;
    /**
     * 强制IP拨号的号码,多个用";"隔开
     */
    public String IncludeNumber;
    /**
     * 手机号码前加拨0
     */
    public boolean AddZero;
    /**
     * 时间段;多个用";"隔开的
     */
    public String Times;
    /**
     * 周天选择,多个用";"隔开
     */
    public String Days;
    /**
     * 本手机所在城市
     */
    public String LocalCity;
    /**
     * 长途才使用,市话不使用
     */
    public boolean localcity_nouse;
}
