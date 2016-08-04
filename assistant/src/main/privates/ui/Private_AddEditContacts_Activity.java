package main.privates.ui;
import main.database.DatabaseAdapter;
import main.privates.PrivateContacts;
import android.app.Activity;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;

public class Private_AddEditContacts_Activity extends Activity {
    public static String pNumber = "";
    public static String niceName = "";
    public static boolean isEdit = false;
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) { // 按下的如果是BACK，同时没有重复
            System.gc();
            Private_AddEditContacts_Activity.this.finish();
        }
        return super.onKeyDown(keyCode, event);
    }
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.private_addeditcontacts_activity);
        TextView tView = (TextView) findViewById(biz.AR.id.private_addeditContacts_title_txt);
        if (isEdit) tView.setText("修改私密联系人");
        else tView.setText("添加私密联系人");
        initData();
    }
    private void initData() {
        Spinner spinner = (Spinner) findViewById(biz.AR.id.private_addeditContacts_type_sp);
        ArrayAdapter<CharSequence> adapter0 = ArrayAdapter.createFromResource(this, biz.AR.array.private_block_type, android.R.layout.simple_spinner_item);
        adapter0.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter(adapter0);
        spinner.setSelection(1);
        if (isEdit) {
            EditText eText = (EditText) findViewById(biz.AR.id.private_addeditContacts_phone_etxt);
            eText.setText(pNumber);
            eText.setEnabled(false);
            EditText enicename = (EditText) findViewById(biz.AR.id.private_addeditContacts_nicename_etxt);
            enicename.setText(niceName);
            enicename.requestFocus();
            DatabaseAdapter dAdapter = DatabaseAdapter.getInstance(this);
            PrivateContacts one = dAdapter.readOnePrivateContact(pNumber);
            if (one != null) {
                eText = (EditText) findViewById(biz.AR.id.private_addeditContacts_nicename_etxt);
                eText.setText(one.niceName);
                spinner.setSelection(one.type);
            }
        }
        TextView button = (TextView) findViewById(biz.AR.id.private_addeditContacts_ok_btn);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                EditText eText = (EditText) findViewById(biz.AR.id.private_addeditContacts_nicename_etxt);
                EditText ephone = (EditText) findViewById(biz.AR.id.private_addeditContacts_phone_etxt);
                Spinner sp = (Spinner) findViewById(biz.AR.id.private_addeditContacts_type_sp);
                DatabaseAdapter dAdapter = DatabaseAdapter.getInstance(Private_AddEditContacts_Activity.this);
                if (isEdit) {
                    dAdapter.addOnePrivateList(pNumber, eText.getText().toString(), sp.getSelectedItemPosition());
                } else if (!ephone.getText().toString().equals("")) {
                    dAdapter.addOnePrivateList(ephone.getText().toString(), eText.getText().toString(), sp.getSelectedItemPosition());
                }
                System.gc();
                Private_AddEditContacts_Activity.this.finish();
            }
        });
        button = (TextView) findViewById(biz.AR.id.private_addeditContacts_exit_btn);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                Private_AddEditContacts_Activity.this.finish();
            }
        });
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                Private_AddEditContacts_Activity.this.finish();
            }
        });
    }
}
