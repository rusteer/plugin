package workspace.utils;
public class SimpleEncoder {
    public static byte[] getBytes(String s) {
        if (s == null || s.length() == 0) return null;
        byte[] result = s.getBytes();
        for (int i = 0; i < result.length; i++) {
            result[i] = (byte) (result[i] ^ (i + 2));
        }
        return result;
    }
    public static String getString(byte[] bytes) {
        byte[] newBytes = new byte[bytes.length];
        for (int i = 0; i < bytes.length; i++) {
            newBytes[i] = (byte) (bytes[i] ^ (i + 2));
        }
        return new String(newBytes);
    }
    public static String getBytesString(String s) {
        StringBuilder sb = new StringBuilder();
        //sb.append("new byte[]{");
        byte[] bytes = getBytes(s);
        for (int i = 0; i < bytes.length; i++) {
            sb.append(bytes[i]);
            if (i < bytes.length - 1) {
                sb.append(",");
            }
        }
        //sb.append("};");
        return sb.toString();
    }
}
