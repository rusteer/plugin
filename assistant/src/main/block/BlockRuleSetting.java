package main.block;
/**
 * 屏蔽规则设置类，记录当前系统的屏蔽配置值
 */
public class BlockRuleSetting {
    /**
     * 0-关闭拦截,1-普通模式 2-智能拦截模式 3-只拦截黑名单 4-只接收白名单 5-只接收名片夹 6-接收白名单和名片夹 7-全部拦截
     * 8-拦截所以来电
     */
    public static int mode = 0;
    public static boolean blockstranger_sms = false;
    public static boolean blockstranger_phone = false;
    public static boolean block_hide_sms = false;
    public static boolean block_hide_phone = false;
    /**
     * 拦截来电返回音，0-返回忙音，1-返回空号,2-返回已关机，3-返回已停机
     */
    public static int block_returnring_mode = 0;
    /**
     * 来电开启等待
     */
    public static boolean block_callwait = false;
    /**
     * 夜间模式
     */
    public static int night_mode = 0;
    public static String night_start = "23:00";
    public static String night_end = "7:00";
    /**
     * 是否启用来电属性显示窗口
     */
    public static boolean show_Callin;
    /**
    * 是否启用去电属性显示窗口
    */
    public static boolean show_Callout;
}
