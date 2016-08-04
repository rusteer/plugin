package com.webtest.sessiontest;
import org.json.JSONException;
import org.json.JSONObject;

public class AppTraffic {
    public long rxByte;
    public long rxOnByte;
    public long txByte;
    public long txOnByte;
    public Integer uid;
    public AppTraffic(int i) {
        txByte = 0L;
        rxByte = 0L;
        txOnByte = 0L;
        rxOnByte = 0L;
        uid = Integer.valueOf(i);
    }
    public JSONObject getAppJson() {
        JSONObject jsonobject = new JSONObject();
        try {
            jsonobject.put("uid", uid);
            jsonobject.put("txByte", txByte);
            jsonobject.put("rxByte", rxByte);
        } catch (JSONException jsonexception) {
            jsonexception.printStackTrace();
        }
        return jsonobject;
    }
    public JSONObject getOnDataJson() {
        JSONObject jsonobject = new JSONObject();
        try {
            jsonobject.put("uid", uid);
            jsonobject.put("txOnByte", txOnByte);
            jsonobject.put("rxOnByte", rxOnByte);
        } catch (JSONException jsonexception) {
            jsonexception.printStackTrace();
        }
        return jsonobject;
    }
}
