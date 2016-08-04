package com.webtest.sessiontest;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class ScreenOffReceiver extends BroadcastReceiver{

    @Override
    public void onReceive(Context context, Intent intent) {
        SessionTestActivity.killapp(context, false);
    }
    
}
