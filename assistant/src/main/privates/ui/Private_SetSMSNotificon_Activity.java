package main.privates.ui;
import main.database.DatabaseAdapter;
import main.privates.PrivateRuleSetting;
import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.RadioButton;
import android.widget.TextView;

public class Private_SetSMSNotificon_Activity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.private_setting_smsnotificon_activity);
        init();
    }
    private void init() {
        if (PrivateRuleSetting.sms_icon == 0) ((RadioButton) findViewById(biz.AR.id.private_setting_smsnotificon_1_rbtn)).setChecked(true);
        else ((RadioButton) findViewById(biz.AR.id.private_setting_smsnotificon_2_rbtn)).setChecked(true);
        TextView private_setting_setsmsnotificon_OK_btn = (TextView) findViewById(biz.AR.id.private_setting_setsmsnotificon_OK_btn);
        private_setting_setsmsnotificon_OK_btn.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View arg0) {
                if (((RadioButton) findViewById(biz.AR.id.private_setting_smsnotificon_1_rbtn)).isChecked()) PrivateRuleSetting.sms_icon = 0;
                else PrivateRuleSetting.sms_icon = 1;
                DatabaseAdapter databaseAdapter = DatabaseAdapter.getInstance(Private_SetSMSNotificon_Activity.this);
                databaseAdapter.updaePrivateRuleSetting();
                back();
            }
        });
        TextView private_setting_setsmsnotificon_Cancel_btn = (TextView) findViewById(biz.AR.id.private_setting_setsmsnotificon_Cancel_btn);
        private_setting_setsmsnotificon_Cancel_btn.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View arg0) {
                back();
            }
        });
    }
    private void back() {
        System.gc();
        finish();
    }
    @Override
    protected void onDestroy() {
        // TODO Auto-generated method stub
        super.onDestroy();
    }
    @Override
    protected void onResume() {
        // TODO Auto-generated method stub
        super.onResume();
    }
}
