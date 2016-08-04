package com.webtest.sessiontest;
import android.graphics.drawable.Drawable;

public class DroidApp {
    Drawable icon;
    String names;
    long rxByte;
    boolean selected_3g;
    boolean selected_wifi;
    long txByte;
    int uid;
    public DroidApp() {}
    public DroidApp(int i, String s, boolean flag, boolean flag1, Drawable drawable) {
        uid = i;
        names = s;
        selected_wifi = flag;
        selected_3g = flag1;
        icon = drawable;
    }
}
