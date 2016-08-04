package main.privates;
import java.util.ArrayList;

/**
 ** 私密规则设置
 */
public class PrivateRuleSetting {
    /**
     * 私密密码
     */
    public static String password;
    /**
     * 主界面显示名称
     */
    public static String title;
    /**
     * 新内容是否通知
     */
    public static boolean new_notication = true;
    /**
     * 短信通知铃声
     */
    public static String smsNotify_Ring = "";
    /**
     * 短信通知图标
     */
    public static int sms_icon;
    /**
     * 电话通知图标
     */
    public static int phone_icon;
    /**
     * 通知文字
     */
    public static String notication_word;
    /**
     * 是否震动
     */
    public static boolean new_vibrate = true;
    /**
     * 来电自动挂断回复
     */
    public static boolean autoreturn = true;
    /**
     * 自动回复内容数组
     */
    public static String[] replySMSs;
    /**
     * 自动回复内容索引
     */
    public static int replySmsIndex;
    /**
     * 隐私图标索引
     */
    public static int iconIndex;
    /**
     * 私密联系人列表
     */
    public static ArrayList<PrivateContacts> pContactsList = new ArrayList<PrivateContacts>();
}
