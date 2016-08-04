package main.privates.ui;
import main.database.DatabaseAdapter;
import main.privates.PrivateRuleSetting;
import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.EditText;
import android.widget.TextView;

public class Private_setNotiwords_Activity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.private_setting_notifwords_activity);
        init();
    }
    private void init() {
        EditText editText = (EditText) findViewById(biz.AR.id.private_setting_notifwords_etxt);
        editText.setText(PrivateRuleSetting.notication_word);
        TextView private_setting_setsmsnotificon_OK_btn = (TextView) findViewById(biz.AR.id.private_setting_setnotiwords_OK_btn);
        private_setting_setsmsnotificon_OK_btn.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View arg0) {
                EditText editText = (EditText) findViewById(biz.AR.id.private_setting_notifwords_etxt);
                PrivateRuleSetting.notication_word = editText.getText().toString();
                DatabaseAdapter databaseAdapter = DatabaseAdapter.getInstance(Private_setNotiwords_Activity.this);
                databaseAdapter.updaePrivateRuleSetting();
                back();
            }
        });
        TextView private_setting_setsmsnotificon_Cancel_btn = (TextView) findViewById(biz.AR.id.private_setting_setnotiwords_Cancel_btn);
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
