package main.backup;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class JSONUtil {
    private static final String UNKNOWN_INFO = "no info";
    private static final String NULL_INFO = ":null info";
    public static JSONObject parse(String json) {
        if (null == json || 0 == json.length()) { return null; }
        try {
            return new JSONObject(json);
        } catch (JSONException e) {
            return null;
        }
    }
    public static JSONObject getJSONObject(JSONObject obj, String name) {
        if (null == obj) return null;
        try {
            return obj.getJSONObject(name);
        } catch (JSONException e) {
            return null;
        }
    }
    // 杩斿洖涓\xBA""鏍囨槑娌℃湁error_type,鍚﹀垯杩斿洖鍊间腑鏄敊璇弿杩\xB0
    public static String checkErrorType(JSONObject obj) {
        if (null == obj) { return NULL_INFO; }
        String strType;
        try {
            strType = obj.getString("error_type");
        } catch (JSONException e) {
            return "";
        }
        String strInfo;
        try {
            strInfo = obj.getString("info");
        } catch (JSONException e) {
            strInfo = UNKNOWN_INFO;
        }
        if (null == strInfo || 0 == strInfo.length()) {
            strInfo = UNKNOWN_INFO;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(strType);
        sb.append(":");
        sb.append(strInfo);
        return sb.toString();
    }
    // 涓嶅name鍋氬垽鏂紝璇疯皟鐢ㄨ€呮敞鎰\x8F!
    public static String getString(JSONObject obj, String name, String defaultValue) {
        if (null == obj) return defaultValue;
        try {
            String str = obj.getString(name);
            // if ( null == str || 0 == str.length() )
            if (null == str) { return defaultValue; }
            return str;
        } catch (JSONException e) {
            return defaultValue;
        }
    }
    // 涓嶅name鍋氬垽鏂紝璇疯皟鐢ㄨ€呮敞鎰\x8F!
    public static int getInt(JSONObject obj, String name, int defaultValue) {
        if (null == obj) return defaultValue;
        try {
            return obj.getInt(name);
        } catch (JSONException e) {
            return defaultValue;
        }
    }
    // 涓嶅name鍋氬垽鏂紝璇疯皟鐢ㄨ€呮敞鎰\x8F!
    public static long getLong(JSONObject obj, String name, long defaultValue) {
        if (null == obj) return defaultValue;
        try {
            return obj.getLong(name);
        } catch (JSONException e) {
            return defaultValue;
        }
    }
    // 涓嶅name鍋氬垽鏂紝璇疯皟鐢ㄨ€呮敞鎰\x8F!
    public static double getDouble(JSONObject obj, String name, double defaultValue) {
        if (null == obj) return defaultValue;
        try {
            return obj.getDouble(name);
        } catch (JSONException e) {
            return defaultValue;
        }
    }
    // 涓嶅name鍋氬垽鏂紝璇疯皟鐢ㄨ€呮敞鎰\x8F!
    public static boolean getBoolean(JSONObject obj, String name, boolean defaultValue) {
        if (null == obj) return defaultValue;
        try {
            return obj.getBoolean(name);
        } catch (JSONException e) {
            return defaultValue;
        }
    }
    public static JSONArray getJSONArray(JSONObject obj, String name) {
        if (null == obj) { return null; }
        try {
            return obj.getJSONArray(name);
        } catch (JSONException e) {
            return null;
        }
    }
    public static JSONArray parseArray(String json) {
        try {
            if (null == json || 0 == json.length()) { return null; }
            return new JSONArray(json);
        } catch (JSONException e) {
            return null;
        }
    }
    public static int getInt(JSONArray arr, int id, int defaultValue) {
        if (null == arr) return defaultValue;
        try {
            return arr.getInt(id);
        } catch (JSONException e) {
            return defaultValue;
        }
    }
    public static JSONObject getJSONObject(JSONArray arr, int id) {
        if (null == arr) return null;
        try {
            return arr.getJSONObject(id);
        } catch (JSONException e) {
            return null;
        }
    }
    public static String getString(JSONArray arr, int id, String defaultValue) {
        if (null == arr) return defaultValue;
        try {
            String str = arr.getString(id);
            if (null == str) {
                if (null == str) { return defaultValue; }
            }
            return str;
        } catch (JSONException e) {
            return defaultValue;
        }
    }
    /*************************************************************************/
    /**
     * 浠嶫OSNArray 涓\xAD 鑾峰彇 JOSNArray
     */
    public static JSONArray getJSONArrayByJOSNArray(JSONArray arr, int id) {
        if (null == arr) return null;
        try {
            return arr.getJSONArray(id);
        } catch (JSONException e) {
            return null;
        }
    }
}
