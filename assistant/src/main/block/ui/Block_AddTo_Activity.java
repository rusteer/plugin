package main.block.ui;
import main.database.DatabaseAdapter;
import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.RadioButton;
import android.widget.TextView;

public class Block_AddTo_Activity extends Activity {
    public static String pNumber = "";
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(biz.AR.layout.block_addto_activity);
        TextView tView = (TextView) findViewById(biz.AR.id.block_addto_phone_number_txt);
        tView.setText(pNumber);
        setclick();
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        // 按下键盘上返回按钮
        if (keyCode == KeyEvent.KEYCODE_BACK) {
            System.gc();
            Block_AddTo_Activity.this.finish();
            return true;
        } else {
            return super.onKeyDown(keyCode, event);
        }
    }
    private void setclick() {
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                Block_AddTo_Activity.this.finish();
            }
        });
        Button button = (Button) findViewById(biz.AR.id.block_addto_ok_btn);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (((RadioButton) findViewById(biz.AR.id.block_addto_black_rbtn)).isChecked()) {
                    DatabaseAdapter dAdapter = DatabaseAdapter.getInstance(Block_AddTo_Activity.this);
                    dAdapter.addOneBlackList(pNumber, "", 2);
                } else if (((RadioButton) findViewById(biz.AR.id.block_addto_white_rbtn)).isChecked()) {
                    DatabaseAdapter dAdapter = DatabaseAdapter.getInstance(Block_AddTo_Activity.this);
                    dAdapter.addOneWhiteList(pNumber, "");
                } else if (((RadioButton) findViewById(biz.AR.id.block_addto_contacts_rbtn)).isChecked()) {
                    Uri insertUri = android.provider.ContactsContract.Contacts.CONTENT_URI;
                    Intent intent = new Intent(Intent.ACTION_INSERT, insertUri);
                    intent.putExtra(android.provider.ContactsContract.Intents.Insert.PHONE, pNumber);
                    startActivity(intent);
                } else if (((RadioButton) findViewById(biz.AR.id.block_addto_privatecontacts_rbtn)).isChecked()) {
                    DatabaseAdapter dAdapter = DatabaseAdapter.getInstance(Block_AddTo_Activity.this);
                    dAdapter.addOnePrivateList(pNumber, "", 0);
                }
                System.gc();
                Block_AddTo_Activity.this.finish();
            }
        });
        button = (Button) findViewById(biz.AR.id.block_addto_exit_btn);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    System.gc();
                    Block_AddTo_Activity.this.finish();
                } catch (Throwable e) {}
            }
        });
    }
}
