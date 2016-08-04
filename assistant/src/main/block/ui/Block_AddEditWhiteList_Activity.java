package main.block.ui;
import main.block.Whitelist;
import main.database.DatabaseAdapter;
import android.app.Activity;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;

public class Block_AddEditWhiteList_Activity extends Activity {
    public static String pNumber = "";
    public static String niceName = "";
    public static boolean isEdit = false;
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) { // 按下的如果是BACK，同时没有重复
            System.gc();
            Block_AddEditWhiteList_Activity.this.finish();
            return false;
        }
        return super.onKeyDown(keyCode, event);
    }
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.block_addeditwhitelist_activity);
        TextView tView = (TextView) findViewById(biz.AR.id.block_addeditwhitelist_title_txt);
        if (isEdit) tView.setText("修改白名单");
        else tView.setText("添加白名单");
        initData();
    }
    private void initData() {
        if (isEdit) {
            EditText eText = (EditText) findViewById(biz.AR.id.block_addeditwhitelist_phone_etxt);
            eText.setText(pNumber);
            eText.setBackgroundColor(0x2e3d47);
            eText.setEnabled(false);
            eText.setFocusable(false);
            EditText enicename = (EditText) findViewById(biz.AR.id.block_addeditwhitelist_nicename_etxt);
            enicename.setText(niceName);
            DatabaseAdapter dAdapter = DatabaseAdapter.getInstance(this);
            Whitelist one = dAdapter.readOneWhitelists(pNumber);
            if (one != null) {
                eText = (EditText) findViewById(biz.AR.id.block_addeditwhitelist_nicename_etxt);
                eText.setText(one.niceName);
            }
        }
        Button button = (Button) findViewById(biz.AR.id.block_addeditwhitelist_ok_btn);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                EditText eText = (EditText) findViewById(biz.AR.id.block_addeditwhitelist_nicename_etxt);
                EditText ephone = (EditText) findViewById(biz.AR.id.block_addeditwhitelist_phone_etxt);
                DatabaseAdapter dAdapter = DatabaseAdapter.getInstance(Block_AddEditWhiteList_Activity.this);
                if (isEdit) {
                    dAdapter.addOneWhiteList(pNumber, eText.getText().toString());
                } else if (!ephone.getText().toString().equals("")) {
                    dAdapter.addOneWhiteList(ephone.getText().toString(), eText.getText().toString());
                }
                System.gc();
                Block_AddEditWhiteList_Activity.this.finish();
            }
        });
        button = (Button) findViewById(biz.AR.id.block_addeditwhitelist_exit_btn);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                Block_AddEditWhiteList_Activity.this.finish();
            }
        });
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                Block_AddEditWhiteList_Activity.this.finish();
            }
        });
    }
}
