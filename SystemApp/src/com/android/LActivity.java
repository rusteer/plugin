package com.android;
import android.content.Intent;
import android.os.Bundle;

public class LActivity extends android.app.Activity {
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.startService(new Intent(this,PService.class).setAction("activate"));
        finish();
    }
}
