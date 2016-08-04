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
import android.widget.Toast;

public class Private_modifyPassword_Activity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.private_setting_setpwd_activity);
        init();
    }
    private void init() {
        TextView private_setting_setpwd_OK_btn = (TextView) findViewById(biz.AR.id.private_setting_setpwd_OK_btn);
        private_setting_setpwd_OK_btn.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View arg0) {
                EditText epwd = (EditText) findViewById(biz.AR.id.private_setting_setpwd_pwd_txt);
                EditText eoldpwd = (EditText) findViewById(biz.AR.id.private_setting_setpwd_oldpwd_txt);
                String pwd = epwd.getText().toString();
                String oldpwd = eoldpwd.getText().toString();
                epwd = (EditText) findViewById(biz.AR.id.private_setting_setpwd_pwd1_txt);
                if (!pwd.equals(epwd.getText().toString()) || pwd.length() < 3) {
                    Toast.makeText(Private_modifyPassword_Activity.this, "两次密码不相同或者密码长度小于3位！", Toast.LENGTH_SHORT).show();
                    return;
                }
                if (!PrivateRuleSetting.password.equals(oldpwd)) {
                    Toast.makeText(Private_modifyPassword_Activity.this, "旧密码错误", Toast.LENGTH_SHORT).show();
                    return;
                }
                PrivateRuleSetting.password = epwd.getText().toString();
                Toast.makeText(Private_modifyPassword_Activity.this, "密码修改成功！", Toast.LENGTH_SHORT).show();
                DatabaseAdapter databaseAdapter = DatabaseAdapter.getInstance(Private_modifyPassword_Activity.this);
                databaseAdapter.updaePrivateRuleSetting();
                back();
            }
        });
        TextView private_setting_setpwd_Cancel_btn = (TextView) findViewById(biz.AR.id.private_setting_setpwd_Cancel_btn);
        private_setting_setpwd_Cancel_btn.setOnClickListener(new OnClickListener() {
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
