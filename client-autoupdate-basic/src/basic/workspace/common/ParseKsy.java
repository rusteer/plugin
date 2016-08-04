package basic.workspace.common;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class ParseKsy {
    /**
     * "duew&^%5d54nc'KH"
     */
    private static String aesPassword = new String(new byte[] { 100, 117, 101, 119, 38, 94, 37, 53, 100, 53, 52, 110, 99, 39, 75, 72 });
    /**
     * "AES"
     */
    private static String algorithm = new String(new byte[] { 65, 69, 83 });
    private static String byte2hexString(byte abyte0[]) {
        StringBuffer stringbuffer = new StringBuffer(2 * abyte0.length);
        int i = 0;
        do {
            if (i >= abyte0.length) return stringbuffer.toString();
            stringbuffer.append(new StringBuilder(String.valueOf(Integer.toString(0xf & abyte0[i] >> 4, 16))).append(Integer.toString(0xf & abyte0[i], 16)).toString());
            i++;
        } while (true);
    }
    public static String decode(String target, String aesPassword) {
        String result = "";
        try {
            SecretKeySpec secretkeyspec = new SecretKeySpec(aesPassword.getBytes(), algorithm);
            Cipher cipher = Cipher.getInstance(algorithm);
            cipher.init(2, secretkeyspec);
            result = new String(cipher.doFinal(hex2Bin(target)), "UTF-8");
        } catch (Exception e) {
            Logger.error(e);
            //UI.closeProgressDialog();
        }
        return result;
    }
    public static String decode(String target) {
        return decode(target, aesPassword);
    }
    public static String encode(String target) {
        return encode(target, aesPassword);
    }
    public static String encode(String target, String aesPassword) {
        String result = "";
        try {
            SecretKeySpec secretkeyspec = new SecretKeySpec(aesPassword.getBytes(), algorithm);
            Cipher cipher = Cipher.getInstance(algorithm);
            cipher.init(1, secretkeyspec);
            result = byte2hexString(cipher.doFinal(target.getBytes("UTF-8")));
        } catch (Exception e) {
            Logger.error(e);
        }
        return result;
    }
    private static byte[] hex2Bin(String s) {
        byte abyte0[];
        if (s.length() < 1) {
            abyte0 = null;
        } else {
            abyte0 = new byte[s.length() / 2];
            int i = 0;
            while (i < s.length() / 2) {
                int j = Integer.parseInt(s.substring(i * 2, 1 + i * 2), 16);
                abyte0[i] = (byte) (Integer.parseInt(s.substring(1 + i * 2, 2 + i * 2), 16) + j * 16);
                i++;
            }
        }
        return abyte0;
    }
}
