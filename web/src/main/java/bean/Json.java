package bean;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class Json {
    public static <T extends Json> T optObj(Class<T> c, JSONObject obj) {
        if (obj != null) {
            try {
                T t = c.newInstance();
                t.init(obj);
                return t;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }
    protected abstract void init(JSONObject obj);
    public static <T extends Json> List<T> optList(Class<T> c, JSONArray array) {
        if (array != null) {
            List<T> list = new ArrayList<T>();
            for (int i = 0; i < array.length(); i++) {
                T t = optObj(c, array.optJSONObject(i));
                if (t != null) list.add(t);
            }
            return list;
        }
        return null;
    }
    protected void put(JSONObject obj, String name, boolean value) throws JSONException {
        if (value) obj.put(name, value);
    }
    protected void put(JSONObject obj, String name, int value) throws JSONException {
        if (value != 0) obj.put(name, value);
    }
    protected void put(JSONObject obj, String name, Object value) throws JSONException {
        if (value != null) obj.put(name, value);
    }
    protected void put(JSONObject obj, String name, String value) throws JSONException {
        if (value != null && value.length() > 0) {
            obj.put(name, value);
        }
    }
    protected <T extends Json> JSONArray toArray(List<T> list) throws JSONException {
        JSONArray result = null;
        if (list != null) {
            result = new JSONArray();
            for (T t : list) {
                if (t != null) result.put(t.toJson());
            }
        }
        return result;
    }
    public JSONObject toJson() throws JSONException {
        return new JSONObject();
    }
    public static <T extends Json> JSONObject toJson(T t) throws JSONException {
        JSONObject result = null;
        if (t != null) {
            result = t.toJson();
        }
        return result;
    }
    public static <T extends Json> JSONArray toJson(List<T> list) throws JSONException {
        JSONArray array = null;
        if (list != null) {
            array = new JSONArray();
            for (T t : list) {
                array.put(toJson(t));
            }
        }
        return array;
    }
}
