package main.backup;
import java.net.URLDecoder;
import java.net.URLEncoder;
import net.workspace.util.Logger;

public class DataCode {
    public static String decode(String str) {
        if (str == null || str.trim().length() == 0) return "";
        try {
            return URLEncoder.encode(str, "utf-8");
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        }
        return "";
    }
    public static String encode(String str) {
        if (str == null || str.trim().length() == 0) return "";
        try {
            return URLDecoder.decode(str, "utf-8");
        } catch (Throwable e) {
            // TODO Auto-generated catch block
            Logger.error(e);
        }
        return "";
    }
}
