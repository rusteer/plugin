package net.workspace.web.bean;
public enum EmptyReason {
    BLACK_DEVICE, //黑名单
    BLACK_NUMBER, //黑名单
    PROVINCE_EMPTY, //省份为空
    DAILY_EXCEED, //超出用户日限
    MONTHLY_EXCEED, //超出用户月限
    INTERVAL_EXCEED, //超出间隔限制
    BIZ_EXCEED, //业务原因
    NOT_CHINA_MOBILE, //不是中国移动号码
    GLOBAL_SETTING_LIMIT, //设置限制
    NOT_CHANNEL, //找不到对应渠道
    ACTIVATE_TIME_LIMIT, //激活时间限制
    CHANNEL_FEE_DISABLED//渠道计费功能关闭
}
