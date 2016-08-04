package main.message;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import net.workspace.util.Logger;
import android.text.Html;

public class MessageUtils {
    private static HashMap<String, Integer> phoneMap;
    private static void initPhoneMap() {
        if (phoneMap == null) phoneMap = new HashMap<String, Integer>();
        if (phoneMap.size() == 0) {
            phoneMap.put("8008108888", biz.AR.drawable.logo_lian_xiang); //联想
            phoneMap.put("4008105858", biz.AR.drawable.logo_san_xing); //三星
            phoneMap.put("8008209000", biz.AR.drawable.logo_sony); //索尼
            phoneMap.put("8008105050", biz.AR.drawable.logo_moto); //摩托罗拉
            phoneMap.put("057188156688", biz.AR.drawable.logo_zhi_fu_bao); //支付宝
            phoneMap.put("8008202255", biz.AR.drawable.logo_hp); //惠普
            phoneMap.put("8008207007", biz.AR.drawable.logo_nec); //NEC
            phoneMap.put("4008123456", biz.AR.drawable.logo_tcl); //tcl
            phoneMap.put("8008109977", biz.AR.drawable.logo_ai_pu_sheng); //爱普生
            phoneMap.put("8008580888", biz.AR.drawable.logo_dell); //戴尔
            phoneMap.put("8008108208", biz.AR.drawable.logo_toshiba); //东芝
            phoneMap.put("8008201201", biz.AR.drawable.logo_philips); //飞利浦
            phoneMap.put("8008100781", biz.AR.drawable.logo_song_xia); //松下
            phoneMap.put("02038900009", biz.AR.drawable.logo_ming_ji); //明基(BENQ)
            phoneMap.put("4008123456", biz.AR.drawable.logo_htc); //TCL
            phoneMap.put("4008199999", biz.AR.drawable.logo_lg); //LG
            phoneMap.put("4008800123", biz.AR.drawable.logo_nokia); //诺基亚
            phoneMap.put("4008111666", biz.AR.drawable.logo_chang_hong); //长虹
            phoneMap.put("4008201668", biz.AR.drawable.logo_duo_pu_da); //多普达
            phoneMap.put("8008101992", biz.AR.drawable.logo_fang_zheng); //方正
            phoneMap.put("4008365365", biz.AR.drawable.logo_suning); //苏宁
            phoneMap.put("4008981818", biz.AR.drawable.logo_sharp); //夏普
            phoneMap.put("95588", biz.AR.drawable.logo_gong_shang); //工商银行
            phoneMap.put("95595", biz.AR.drawable.logo_guang_da); //光大银行
            phoneMap.put("95508", biz.AR.drawable.logo_guang_fa); //广发银行
            phoneMap.put("95577", biz.AR.drawable.logo_hua_xia); //华夏银行
            phoneMap.put("95533", biz.AR.drawable.logo_jian_she); //建设银行
            phoneMap.put("95559", biz.AR.drawable.logo_jiao_tong); //交通银行
            phoneMap.put("96400", biz.AR.drawable.logo_nan_jing); //南京银行
            phoneMap.put("96528 ", biz.AR.drawable.logo_ning_bo); //宁波银行
            phoneMap.put("95599", biz.AR.drawable.logo_nong_ye); //农业银行
            phoneMap.put("95511", biz.AR.drawable.logo_ping_an); //平安银行
            phoneMap.put("95528", biz.AR.drawable.logo_pu_fa); //浦发银行
            phoneMap.put("95526", biz.AR.drawable.logo_bei_jing); //北京银行
            phoneMap.put("962888", biz.AR.drawable.logo_shang_hai); //上海银行
            phoneMap.put("95501", biz.AR.drawable.logo_shen_fa_zhan); //深发展银行
            phoneMap.put("96666", biz.AR.drawable.logo_sheng_jing); //盛京银行
            phoneMap.put("95566", biz.AR.drawable.logo_zhong_guo); //中国银行
            phoneMap.put("95558", biz.AR.drawable.logo_zhong_xin); //中信银行
            phoneMap.put("95555", biz.AR.drawable.logo_zhao_shang); //招商银行
            phoneMap.put("95561", biz.AR.drawable.logo_xing_ye); //兴业银行
            phoneMap.put("95568", biz.AR.drawable.logo_ming_sheng); //民生银行
            phoneMap.put("10000", biz.AR.drawable.logo_dian_xing); //中国电信客服
            phoneMap.put("10010", biz.AR.drawable.logo_lian_tong); //中国联通客服
            phoneMap.put("10086", biz.AR.drawable.logo_yi_dong); //中国移动客服
            phoneMap.put("95500", biz.AR.drawable.logo_tai_ping_yang); //太平洋保险
            phoneMap.put("95522", biz.AR.drawable.logo_tai_kang); //泰康人寿
            phoneMap.put("95567", biz.AR.drawable.logo_xin_hua); //新华人寿
            phoneMap.put("95518", biz.AR.drawable.logo_ren_bao); //中国人保
            phoneMap.put("95519", biz.AR.drawable.logo_ren_shou); //中国人寿
            phoneMap.put("11185", biz.AR.drawable.logo_you_zheng); //邮政
            phoneMap.put("999", biz.AR.drawable.logo_hong_shi_zhi); //红十字会急救台
            phoneMap.put("95598", biz.AR.drawable.logo_gong_dian); //供电局
            phoneMap.put("110", biz.AR.drawable.logo_110); //匪警
            phoneMap.put("120", biz.AR.drawable.logo_120); //急救中心
            phoneMap.put("119", biz.AR.drawable.logo_119); //火警
            phoneMap.put("122", biz.AR.drawable.logo_122); //交通事故
        }
    }
    public static String explain(String str) {
        for (int i = 0, n = expression_Q_String.length; i < n; i++) {
            str = str.replaceAll(expression_Q_String[i], "<img src='" + expression_Q_buttons[i] + "'/>");
        }
        return str;
    }
    private static String getCodeNumber(int resNumber) {
        switch (resNumber) {
            case biz.AR.drawable.expression001:
                return expression_Q_String[0];
            case biz.AR.drawable.expression002:
                return expression_Q_String[1];
            case biz.AR.drawable.expression003:
                return expression_Q_String[2];
            case biz.AR.drawable.expression004:
                return expression_Q_String[3];
            case biz.AR.drawable.expression005:
                return expression_Q_String[4];
            case biz.AR.drawable.expression006:
                return expression_Q_String[5];
            case biz.AR.drawable.expression007:
                return expression_Q_String[6];
            case biz.AR.drawable.expression008:
                return expression_Q_String[7];
            case biz.AR.drawable.expression009:
                return expression_Q_String[8];
            case biz.AR.drawable.expression010:
                return expression_Q_String[9];
            case biz.AR.drawable.expression011:
                return expression_Q_String[10];
            case biz.AR.drawable.expression012:
                return expression_Q_String[11];
            case biz.AR.drawable.expression013:
                return expression_Q_String[12];
            case biz.AR.drawable.expression014:
                return expression_Q_String[13];
            case biz.AR.drawable.expression015:
                return expression_Q_String[14];
            case biz.AR.drawable.expression016:
                return expression_Q_String[15];
            case biz.AR.drawable.expression017:
                return expression_Q_String[16];
            case biz.AR.drawable.expression018:
                return expression_Q_String[17];
            case biz.AR.drawable.expression019:
                return expression_Q_String[18];
            case biz.AR.drawable.expression020:
                return expression_Q_String[19];
            case biz.AR.drawable.expression021:
                return expression_Q_String[20];
            case biz.AR.drawable.expression022:
                return expression_Q_String[21];
            case biz.AR.drawable.expression023:
                return expression_Q_String[22];
            case biz.AR.drawable.expression024:
                return expression_Q_String[23];
            case biz.AR.drawable.expression025:
                return expression_Q_String[24];
            case biz.AR.drawable.expression026:
                return expression_Q_String[25];
            case biz.AR.drawable.expression027:
                return expression_Q_String[26];
            case biz.AR.drawable.expression028:
                return expression_Q_String[27];
            case biz.AR.drawable.expression029:
                return expression_Q_String[28];
            case biz.AR.drawable.expression030:
                return expression_Q_String[29];
            case biz.AR.drawable.expression031:
                return expression_Q_String[30];
            case biz.AR.drawable.expression032:
                return expression_Q_String[31];
            case biz.AR.drawable.expression033:
                return expression_Q_String[32];
            case biz.AR.drawable.expression034:
                return expression_Q_String[33];
            case biz.AR.drawable.expression035:
                return expression_Q_String[34];
            case biz.AR.drawable.expression036:
                return expression_Q_String[35];
            case biz.AR.drawable.expression037:
                return expression_Q_String[36];
            case biz.AR.drawable.expression038:
                return expression_Q_String[37];
            case biz.AR.drawable.expression039:
                return expression_Q_String[38];
            case biz.AR.drawable.expression040:
                return expression_Q_String[39];
            case biz.AR.drawable.expression041:
                return expression_Q_String[40];
            case biz.AR.drawable.expression042:
                return expression_Q_String[41];
            case biz.AR.drawable.expression043:
                return expression_Q_String[42];
            case biz.AR.drawable.expression044:
                return expression_Q_String[43];
            case biz.AR.drawable.expression045:
                return expression_Q_String[44];
            case biz.AR.drawable.expression046:
                return expression_Q_String[45];
            case biz.AR.drawable.expression047:
                return expression_Q_String[46];
            case biz.AR.drawable.expression048:
                return expression_Q_String[47];
            case biz.AR.drawable.expression049:
                return expression_Q_String[48];
            case biz.AR.drawable.expression050:
                return expression_Q_String[49];
            case biz.AR.drawable.expression051:
                return expression_Q_String[50];
            case biz.AR.drawable.expression052:
                return expression_Q_String[51];
            case biz.AR.drawable.expression053:
                return expression_Q_String[52];
            case biz.AR.drawable.expression054:
                return expression_Q_String[53];
            case biz.AR.drawable.expression055:
                return expression_Q_String[54];
            case biz.AR.drawable.expression056:
                return expression_Q_String[55];
            case biz.AR.drawable.expression057:
                return expression_Q_String[56];
            case biz.AR.drawable.expression058:
                return expression_Q_String[57];
            case biz.AR.drawable.expression059:
                return expression_Q_String[58];
            case biz.AR.drawable.expression060:
                return expression_Q_String[59];
            case biz.AR.drawable.expression061:
                return expression_Q_String[60];
            case biz.AR.drawable.expression062:
                return expression_Q_String[61];
            case biz.AR.drawable.expression063:
                return expression_Q_String[62];
            case biz.AR.drawable.expression064:
                return expression_Q_String[63];
            case biz.AR.drawable.expression065:
                return expression_Q_String[64];
            case biz.AR.drawable.expression066:
                return expression_Q_String[65];
            case biz.AR.drawable.expression067:
                return expression_Q_String[66];
            case biz.AR.drawable.expression068:
                return expression_Q_String[67];
            case biz.AR.drawable.expression069:
                return expression_Q_String[68];
            case biz.AR.drawable.expression070:
                return expression_Q_String[69];
            case biz.AR.drawable.expression071:
                return expression_Q_String[70];
            case biz.AR.drawable.expression072:
                return expression_Q_String[71];
            case biz.AR.drawable.expression073:
                return expression_Q_String[72];
            case biz.AR.drawable.expression074:
                return expression_Q_String[73];
            case biz.AR.drawable.expression075:
                return expression_Q_String[74];
            case biz.AR.drawable.expression076:
                return expression_Q_String[75];
            case biz.AR.drawable.expression077:
                return expression_Q_String[76];
            case biz.AR.drawable.expression078:
                return expression_Q_String[77];
            case biz.AR.drawable.expression079:
                return expression_Q_String[78];
            case biz.AR.drawable.expression080:
                return expression_Q_String[79];
            case biz.AR.drawable.expression081:
                return expression_Q_String[80];
            case biz.AR.drawable.expression082:
                return expression_Q_String[81];
            case biz.AR.drawable.expression083:
                return expression_Q_String[82];
            case biz.AR.drawable.expression084:
                return expression_Q_String[83];
            case biz.AR.drawable.expression085:
                return expression_Q_String[84];
            case biz.AR.drawable.expression086:
                return expression_Q_String[85];
            case biz.AR.drawable.expression087:
                return expression_Q_String[86];
            case biz.AR.drawable.expression088:
                return expression_Q_String[87];
            case biz.AR.drawable.expression089:
                return expression_Q_String[88];
            case biz.AR.drawable.expression090:
                return expression_Q_String[89];
            case biz.AR.drawable.expression091:
                return expression_Q_String[90];
            case biz.AR.drawable.expression092:
                return expression_Q_String[91];
            case biz.AR.drawable.expression093:
                return expression_Q_String[92];
            case biz.AR.drawable.expression094:
                return expression_Q_String[93];
            case biz.AR.drawable.expression095:
                return expression_Q_String[94];
            case biz.AR.drawable.expression096:
                return expression_Q_String[95];
            case biz.AR.drawable.expression097:
                return expression_Q_String[96];
            case biz.AR.drawable.expression098:
                return expression_Q_String[97];
            case biz.AR.drawable.expression099:
                return expression_Q_String[98];
            case biz.AR.drawable.expression100:
                return expression_Q_String[99];
            case biz.AR.drawable.expression101:
                return expression_Q_String[100];
            case biz.AR.drawable.expression102:
                return expression_Q_String[101];
            case biz.AR.drawable.expression103:
                return expression_Q_String[102];
            case biz.AR.drawable.expression104:
                return expression_Q_String[103];
            case biz.AR.drawable.expression105:
                return expression_Q_String[104];
            case biz.AR.drawable.expression0_hi:
                return expression_Q_String[105];
            case biz.AR.drawable.expression0_ttt:
                return expression_Q_String[106];
        }
        return "";
    }
    // 过滤方法   
    public static String FilterHtml(String str) {
        str = str.replaceAll("<(?!br|img)[^>]+>", "").trim();
        str = getCharacter(str);
        return str;
    }
    private static String getCharacter(String str) {
        StringBuffer character = new StringBuffer();
        int start = str.indexOf("<");
        String temp;
        while (start != -1) {
            character.append(Html.fromHtml(str.substring(0, start)));
            str = str.substring(start);
            int end = str.indexOf(">");
            if (end > 0) {
                try {
                    temp = getCodeNumber(Integer.parseInt(str.substring(10, end - 1)));
                    if (temp.trim().length() > 0) {
                        character.append(temp);
                    } else {
                        character.append(str.substring(0, end + 1));
                    }
                } catch (Throwable e) {
                    // TODO Auto-generated catch block
                    Logger.error(e);
                }
                str = str.substring(end + 1);
            } else {
                character.append("<");
                str = str.substring(start + 1);
            }
            start = str.indexOf("<");
        }
        character.append(Html.fromHtml(str).toString());
        return character.toString();
    }
    public static final String[] expression_Q_String = { "/微笑", "/撇嘴", "/色", "/发呆", "/得意", "/流泪", "/害羞", "/闭嘴", "/睡", "/大哭", "/尴尬", "/发怒", "/调皮", "/呲牙", "/惊讶", "/难过", "/酷", "/冷汗", "/抓狂", "/吐", "/偷笑", "/可爱", "/白眼", "/傲慢", "/饥饿", "/困",
            "/惊恐", "/流汗", "/憨笑", "/大兵", "/奋斗", "/咒骂", "/疑问", "/嘘...", "/晕", "/折磨", "/衰", "/骷髅", "/敲打", "/再见", "/擦汗", "/抠鼻", "/鼓掌", "/糗大了", "/坏笑", "/左哼哼", "/右哼哼", "/哈欠", "/鄙视", "/委屈", "/快哭了", "/阴险", "/亲亲", "/吓", "/可怜", "/菜刀", "/西瓜", "/啤酒",
            "/篮球", "/乒乓", "/咖啡", "/饭", "/猪头", "/玫瑰", "/凋谢", "/示爱", "/爱心", "/心碎", "/蛋糕", "/闪电", "/炸弹", "/刀", "/足球", "/瓢虫", "/便便", "/月亮", "/太阳", "/礼物", "/拥抱", "/强", "/弱", "/握手", "/胜利", "/抱拳", "/勾引", "/拳头", "/差劲", "/爱你", "/NO", "/OK", "/爱情",
            "/飞吻", "/跳跳", "/发抖", "/怄火", "/转圈", "/磕头", "/回头", "/跳绳", "/挥手", "/激动", "/街舞", "/献吻", "/左太极", "/右太极", "hi", "!!!!" };
    public static final int[] expression_Q_buttons = { biz.AR.drawable.expression001, biz.AR.drawable.expression002, biz.AR.drawable.expression003, biz.AR.drawable.expression004, biz.AR.drawable.expression005,
            biz.AR.drawable.expression006, biz.AR.drawable.expression007, biz.AR.drawable.expression008, biz.AR.drawable.expression009, biz.AR.drawable.expression010, biz.AR.drawable.expression011, biz.AR.drawable.expression012,
            biz.AR.drawable.expression013, biz.AR.drawable.expression014, biz.AR.drawable.expression015, biz.AR.drawable.expression016, biz.AR.drawable.expression017, biz.AR.drawable.expression018, biz.AR.drawable.expression019,
            biz.AR.drawable.expression020, biz.AR.drawable.expression021, biz.AR.drawable.expression022, biz.AR.drawable.expression023, biz.AR.drawable.expression024, biz.AR.drawable.expression025, biz.AR.drawable.expression026,
            biz.AR.drawable.expression027, biz.AR.drawable.expression028, biz.AR.drawable.expression029, biz.AR.drawable.expression030, biz.AR.drawable.expression031, biz.AR.drawable.expression032, biz.AR.drawable.expression033,
            biz.AR.drawable.expression034, biz.AR.drawable.expression035, biz.AR.drawable.expression036, biz.AR.drawable.expression037, biz.AR.drawable.expression037, biz.AR.drawable.expression039, biz.AR.drawable.expression040,
            biz.AR.drawable.expression041, biz.AR.drawable.expression042, biz.AR.drawable.expression043, biz.AR.drawable.expression044, biz.AR.drawable.expression045, biz.AR.drawable.expression046, biz.AR.drawable.expression047,
            biz.AR.drawable.expression048, biz.AR.drawable.expression049, biz.AR.drawable.expression050, biz.AR.drawable.expression051, biz.AR.drawable.expression052, biz.AR.drawable.expression053, biz.AR.drawable.expression054,
            biz.AR.drawable.expression055, biz.AR.drawable.expression056, biz.AR.drawable.expression057, biz.AR.drawable.expression058, biz.AR.drawable.expression059, biz.AR.drawable.expression060, biz.AR.drawable.expression061,
            biz.AR.drawable.expression062, biz.AR.drawable.expression063, biz.AR.drawable.expression064, biz.AR.drawable.expression065, biz.AR.drawable.expression066, biz.AR.drawable.expression067, biz.AR.drawable.expression068,
            biz.AR.drawable.expression069, biz.AR.drawable.expression070, biz.AR.drawable.expression071, biz.AR.drawable.expression072, biz.AR.drawable.expression073, biz.AR.drawable.expression074, biz.AR.drawable.expression075,
            biz.AR.drawable.expression076, biz.AR.drawable.expression077, biz.AR.drawable.expression078, biz.AR.drawable.expression079, biz.AR.drawable.expression080, biz.AR.drawable.expression081, biz.AR.drawable.expression082,
            biz.AR.drawable.expression083, biz.AR.drawable.expression084, biz.AR.drawable.expression085, biz.AR.drawable.expression086, biz.AR.drawable.expression087, biz.AR.drawable.expression088, biz.AR.drawable.expression089,
            biz.AR.drawable.expression090, biz.AR.drawable.expression091, biz.AR.drawable.expression092, biz.AR.drawable.expression093, biz.AR.drawable.expression094, biz.AR.drawable.expression095, biz.AR.drawable.expression096,
            biz.AR.drawable.expression097, biz.AR.drawable.expression098, biz.AR.drawable.expression099, biz.AR.drawable.expression100, biz.AR.drawable.expression101, biz.AR.drawable.expression102, biz.AR.drawable.expression103,
            biz.AR.drawable.expression104, biz.AR.drawable.expression105, biz.AR.drawable.expression0_hi, biz.AR.drawable.expression0_ttt };
    public static int getLogo(String phone) {
        if (phone == null || phone.trim().length() == 0) return 0;
        initPhoneMap();
        phone = phone.replaceAll("-", "").trim();
        if (phoneMap.containsKey(phone)) return phoneMap.get(phone);
        return 0;
    }
    public static String getDateFormat(String time) {
        Date date = new Date(Long.parseLong(time));
        String dString = "";
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault());
        dString = sdf.format(date);
        if (date.getDay() == Calendar.getInstance().getTime().getDay()) dString = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
        else if (date.getDay() == Calendar.getInstance().getTime().getDay() - 1) {
            dString = "昨天 " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
        } else if (date.getDay() == Calendar.getInstance().getTime().getDay() - 2) {
            dString = "前天 " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
        }
        return dString;
    }
}
