package net.workspace.web.web.plugin;
import org.apache.commons.lang3.StringUtils;

public class ClientUtil {
    static int[] chinaMobilePrefixArray = new int[] { 134, 135, 136, 137, 138, 139, 147, 150, 151, 152, 154, 157, 158, 159, 182, 183, 187, 188 };
    static int[] chinaUnionPrefixArray = new int[] { 130, 131, 132, 155, 156, 185, 186 };
    static int[] chinaComPrefixArray = new int[] { 133, 1349, 153, 180, 189 };
    //private static String whiteClient = "352167055836184,352931059139568,868391010787244";
    public static boolean isMobile(String mobile) {
        return mobile != null && mobile.length() == 11 && mobile.startsWith("1");
    }
    public static int getCarrierOperatorByImsi(String imsi) {
        if (StringUtils.isNotBlank(imsi)) {
            if (imsi.startsWith("46000") || imsi.startsWith("46002") || imsi.startsWith("46007")) return 1;
            if (imsi.startsWith("46001")) return 2;
            if (imsi.startsWith("46003")) return 3;
        }
        return 0;
    }
    public static int getCarrierOperatorByPhoneNumber(String phoneNumber) {
        for (int i : chinaMobilePrefixArray) {
            if (phoneNumber.startsWith(String.valueOf(i))) return 1;
        }
        for (int i : chinaUnionPrefixArray) {
            if (phoneNumber.startsWith(String.valueOf(i))) return 2;
        }
        for (int i : chinaComPrefixArray) {
            if (phoneNumber.startsWith(String.valueOf(i))) return 3;
        }
        return 0;
    }
}
