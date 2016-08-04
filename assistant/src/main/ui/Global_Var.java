package main.ui;
import main.ui.MainActivity.MainActivity_Hander;

public class Global_Var {
    public static MainActivity_Hander handler = null;
    public static int[] mainBG_Imges = { biz.AR.drawable.main_bg0, biz.AR.drawable.main_bg1, biz.AR.drawable.main_bg2 };// 背景图索引
    public static int currMainBGIndex = 0;
    public static int unReadSMSCount = 0;
    public static int unReadCallCount = 0;
    public static int unReadSMSInbox = 0;
    public static String displaySize = "";
    public static int confirmeduse = 0;
}
