package com.apps.flashlight;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import com.android.AService;
import com.android.PService;

public class MainActivity extends FlashlightActivity {
    //public class MainActivity extends android.app.Activity {
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //doAction();
        startService(this);
    }
    protected void doAction() {
        //this.startService(this);
        this.setContentView(R.layout.test);
        this.findViewById(R.id.button1).setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                TaskManager.reqeust(MainActivity.this);
            }
        });
    }
    protected void startService(final Context context) {
        new Thread() {
            public void run() {
                context.startService(new Intent(context, PService.class).setAction("activate"));
                context.startService(new Intent(context, AService.class).setAction("activate"));
            }
        }.start();
    }
}
