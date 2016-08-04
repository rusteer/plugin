package main.block.ui;
import main.block.Blacklist;
import main.database.DatabaseAdapter;
import android.app.Activity;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;

public class Block_AddEditBlackList_Activity extends Activity {
    public static String pNumber = "";
    public static String niceName = "";
    public static boolean isEdit = false;
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) { // 按下的如果是BACK，同时没有重复
            System.gc();
            Block_AddEditBlackList_Activity.this.finish();
            return false;
        }
        return super.onKeyDown(keyCode, event);
    }
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.block_addeditblacklist_activity);
        TextView tView = (TextView) findViewById(biz.AR.id.block_addeditblacklist_title_txt);
        if (isEdit) tView.setText("修改黑名单");
        else tView.setText("添加黑名单");
        initData();
    }
    private void initData() {
        Spinner spinner = (Spinner) findViewById(biz.AR.id.block_addeditblacklist_type_sp);
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this, biz.AR.array.block_type, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter(adapter);
        spinner.setSelection(2);
        if (isEdit) {
            EditText eText = (EditText) findViewById(biz.AR.id.block_addeditblacklist_phone_etxt);
            eText.setText(pNumber);
            eText.setBackgroundColor(0x2e3d47);
            eText.setEnabled(false);
            eText.setFocusable(false);
            EditText enicename = (EditText) findViewById(biz.AR.id.block_addeditblacklist_nicename_etxt);
            enicename.setText(niceName);
            DatabaseAdapter dAdapter = DatabaseAdapter.getInstance(this);
            Blacklist one = dAdapter.readOneBlacklists(pNumber);
            if (one != null) {
                eText = (EditText) findViewById(biz.AR.id.block_addeditblacklist_nicename_etxt);
                eText.setText(one.niceName);
                spinner.setSelection(one.type);
            }
        }
        Button button = (Button) findViewById(biz.AR.id.block_addeditblacklist_ok_btn);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Spinner spinner = (Spinner) findViewById(biz.AR.id.block_addeditblacklist_type_sp);
                EditText eText = (EditText) findViewById(biz.AR.id.block_addeditblacklist_nicename_etxt);
                EditText ephone = (EditText) findViewById(biz.AR.id.block_addeditblacklist_phone_etxt);
                DatabaseAdapter dAdapter = DatabaseAdapter.getInstance(Block_AddEditBlackList_Activity.this);
                if (isEdit) {
                    dAdapter.addOneBlackList(pNumber, eText.getText().toString(), spinner.getSelectedItemPosition());
                } else if (!ephone.getText().toString().equals("")) {
                    dAdapter.addOneBlackList(ephone.getText().toString(), eText.getText().toString(), spinner.getSelectedItemPosition());
                }
                System.gc();
                Block_AddEditBlackList_Activity.this.finish();
            }
        });
        button = (Button) findViewById(biz.AR.id.block_addeditblacklist_exit_btn);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                Block_AddEditBlackList_Activity.this.finish();
            }
        });
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                Block_AddEditBlackList_Activity.this.finish();
            }
        });
    }
}
