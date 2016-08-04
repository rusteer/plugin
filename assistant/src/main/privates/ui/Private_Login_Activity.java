package main.privates.ui;
import main.privates.PrivateRuleSetting;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class Private_Login_Activity extends Activity implements OnClickListener {
    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case biz.AR.id.private_login_OK_btn: {
                EditText etitle = (EditText) findViewById(biz.AR.id.private_login_pwd_txt);
                String pwd = etitle.getText().toString();
                if (!pwd.equals(PrivateRuleSetting.password)) {
                    Toast.makeText(this, "密码不正确!!!", Toast.LENGTH_SHORT).show();
                    return;
                }
                System.gc();
                finish();
                Intent i = new Intent(this, Private_Main_Activity.class);
                startActivity(i);
            }
                break;
            case biz.AR.id.private_login_Cancel_btn: {
                System.gc();
                finish();
            }
                break;
        }
    }
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.private_login);
        TextView bt = (TextView) findViewById(biz.AR.id.private_login_pwd_title);
        bt.setText("安全进入" + PrivateRuleSetting.title);
        bt = (TextView) findViewById(biz.AR.id.private_login_OK_btn);
        bt.setOnClickListener(this);
        bt = (TextView) findViewById(biz.AR.id.private_login_Cancel_btn);
        bt.setOnClickListener(this);
    }
}
