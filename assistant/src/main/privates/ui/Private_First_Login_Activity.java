package main.privates.ui;
import main.database.DatabaseAdapter;
import main.privates.PrivateRuleSetting;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class Private_First_Login_Activity extends Activity implements OnClickListener {
    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case biz.AR.id.private_firstlogin_OK_btn: {
                EditText etitle = (EditText) findViewById(biz.AR.id.private_firstlogin_pwd_txt);
                String pwd = etitle.getText().toString();
                if (pwd.length() < 4) {
                    Toast.makeText(this, "密码长度需要大于4个字符!!!", Toast.LENGTH_SHORT).show();
                    return;
                }
                etitle = (EditText) findViewById(biz.AR.id.private_firstlogin_cpwd_txt);
                if (!etitle.getText().toString().equals(pwd)) {
                    Toast.makeText(this, "2次密码不相符合!!!", Toast.LENGTH_SHORT).show();
                    etitle.setFocusable(true);
                    return;
                }
                PrivateRuleSetting.password = pwd;
                DatabaseAdapter da = DatabaseAdapter.getInstance(this);
                da.updaePrivateRuleSetting();
                System.gc();
                finish();
                Intent i = new Intent(this, Private_Login_Activity.class);
                startActivity(i);
            }
                break;
            case biz.AR.id.private_firstlogin_Cancel_btn: {
                System.gc();
                finish();
            }
                break;
        }
    }
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(biz.AR.layout.private_firstlogin);
        TextView bt = (TextView) findViewById(biz.AR.id.private_firstlogin_OK_btn);
        bt.setOnClickListener(this);
        bt = (TextView) findViewById(biz.AR.id.private_firstlogin_Cancel_btn);
        bt.setOnClickListener(this);
    }
}
