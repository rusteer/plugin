package workspace.utils;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import workspace.base64.Base64;

public class AES {
    /**
     * "AES/CBC/PKCS5Padding"
     */
    private byte[] AES_CBC_PKCS5_PADDING = { 67, 70, 87, 42, 69, 69, 75, 38, 90, 64, 79, 94, 59, 95, 113, 117, 118, 122, 122, 114 };
    /**
     * AES
     */
    private byte[] AES = { 67, 70, 87 };
    private static byte[] commonPassword = { 97, 108, 105, 43, 97, 96, 100, 108, 36, 106, 98, 105, 124, 96, 121, 117 };
    public static String decode(String data) {
        return decode(data, SimpleEncoder.getString(commonPassword));
    }
    public static String encode(String data) {
        return encode(data, SimpleEncoder.getString(commonPassword));
    }
    public static String decode(String data, String password) {
        AES aes = new AES(password);
        byte[] crypted = Base64.decodeToBytes(data);
        return new String(aes.decrypt(crypted));
    }
    /**
     * "sfe023f_9fd&fwfl"
     * @param s
     * @param password
     * @return
     */
    public static String encode(String data, String password) {
        AES aes = new AES(password);
        byte[] crypted = aes.encrypt(data.getBytes());
        return Base64.encode(crypted);
    }
    private IvParameterSpec ivSpec;
    private SecretKeySpec keySpec;
    public AES(String key) {
        try {
            byte[] keyBytes = key.getBytes();
            byte[] buf = new byte[16];
            for (int i = 0; i < keyBytes.length && i < buf.length; i++) {
                buf[i] = keyBytes[i];
            }
            keySpec = new SecretKeySpec(buf, SimpleEncoder.getString(AES));
            ivSpec = new IvParameterSpec(keyBytes);
        } catch (Exception e) {
            Logger.error(e);
        }
    }
    public byte[] decrypt(byte[] crypted) {
        try {
            Cipher cipher = Cipher.getInstance(SimpleEncoder.getString(AES_CBC_PKCS5_PADDING));
            cipher.init(Cipher.DECRYPT_MODE, keySpec, ivSpec);
            return cipher.doFinal(crypted);
        } catch (Exception e) {
            Logger.error(e);
        }
        return null;
    }
    public byte[] encrypt(byte[] origData) {
        try {
            Cipher cipher = Cipher.getInstance(SimpleEncoder.getString(AES_CBC_PKCS5_PADDING));
            cipher.init(Cipher.ENCRYPT_MODE, keySpec, ivSpec);
            return cipher.doFinal(origData);
        } catch (Exception e) {
            Logger.error(e);
        }
        return null;
    }
}
