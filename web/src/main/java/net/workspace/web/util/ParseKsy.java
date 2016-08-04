package net.workspace.web.util;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ParseKsy {
    private static String byte2hexString(byte abyte0[]) {
        StringBuffer stringbuffer = new StringBuffer(2 * abyte0.length);
        int i = 0;
        do {
            if (i >= abyte0.length) return stringbuffer.toString();
            stringbuffer.append(new StringBuilder(String.valueOf(Integer.toString(0xf & abyte0[i] >> 4, 16))).append(Integer.toString(0xf & abyte0[i], 16)).toString());
            i++;
        } while (true);
    }
    public static String decode(byte[] target) {
        String result = "";
        try {
            SecretKeySpec secretkeyspec = new SecretKeySpec(key.getBytes(), algorithm);
            Cipher cipher = Cipher.getInstance(algorithm);
            cipher.init(2, secretkeyspec);
            result = new String(cipher.doFinal(target), "UTF-8");
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
        }
        return result;
    }
    public static String decode(String target) {
        String result = "";
        try {
            SecretKeySpec secretkeyspec = new SecretKeySpec(key.getBytes(), algorithm);
            Cipher cipher = Cipher.getInstance(algorithm);
            cipher.init(2, secretkeyspec);
            result = new String(cipher.doFinal(hex2Bin(target)), "UTF-8");
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
        }
        return result;
    }
    public static String encode(String target) {
        String result = "";
        try {
            SecretKeySpec secretkeyspec = new SecretKeySpec(key.getBytes(), algorithm);
            Cipher cipher = Cipher.getInstance(algorithm);
            cipher.init(1, secretkeyspec);
            result = byte2hexString(cipher.doFinal(target.getBytes("UTF-8")));
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
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
    public static void main(String args[]) throws Exception {
        /*      String s = "http://app.andwy.net/6de7ba5c10d542faa771beba31428125";
              System.out.println("=ParseKsy.decode(\"" + encode(s) + "\")");
              String jS = "{param:1,param2:\"value\"}";
              JSONObject obj = new JSONObject(jS);*/
        System.out
                .println(decode("11f1bd43d2c566da620f7645d1b59c36c4b32bf749e299850a69c84062e1815bc62fb53e71b3f2040d6170caaf878945e7f22d1ef2e411bf94e3c85fd08494f0f46241d6c73b3ce9f1b09e325a2f5ee453432480aed24f402db3d8a1515420ad5615c21ae50ca3ac8b3c8567fe440217b495676a7c4ca4226a75f6984bfc109b5326975a0ec22faba9067c2f09c49164a52444bc6d6e5e79fca17e598c7b858e"));
        //System.out.println(obj);
        /*
          String s= "AES";
          byte[]  bytes= s.getBytes();
          System.out.print("new String(new byte[]{");
          for(int i=0;i<bytes.length;i++){
              System.out.print(bytes[i]);
              if(i<bytes.length-1)
                  System.out.print(",");
          }
          System.out.print("});");
          System.out.println();
          String ss=new String(new byte[]{65,69,83});
          System.out.println(ss.equals(s));*/
    }
    static final Logger LOGGER = LoggerFactory.getLogger("PluginLogger");
    public static String key = "duew&^%5d54nc'KH";
    public static String algorithm = "AES";
}
