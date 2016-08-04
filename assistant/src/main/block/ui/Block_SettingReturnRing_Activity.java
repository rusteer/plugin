package main.block.ui;
import main.block.BlockRuleSetting;
import android.app.Activity;
import android.app.Dialog;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.RadioButton;

public class Block_SettingReturnRing_Activity extends Activity implements OnClickListener {
    //"#" 必须用 "%23“代替
    // 忙音,空号,关机,停机,启动呼叫等待,取消呼叫等待
    private final String[] SERVICE_SET = { "tel:%23%2367%23", "tel:**67*13800000000%23", "tel:**67*13810538911%23", "tel:**67*13701110216%23", "tel:*43%23", "tel:%2343%23" };
    // ///////////////////
    /**
     * 处理自定义的消息
     */
    public MyHandler handler = new MyHandler(Looper.getMainLooper());
    private RadioButton rbt0;
    private RadioButton rbt1;
    private RadioButton rbt2;
    private RadioButton rbt3;
    private LinearLayout r0;
    private LinearLayout r1;
    private LinearLayout r2;
    private LinearLayout r3;
    public class MyHandler extends Handler {
        public MyHandler(Looper looper) {
            super(looper);
        }
        @Override
        public void handleMessage(Message msg) {
            if (msg.what == 10) {
                try {
                    Intent i = new Intent(Intent.ACTION_CALL);
                    i.setData(Uri.parse(SERVICE_SET[msg.arg1]));
                    startActivity(i);
                } catch (Throwable e) {}
            }
        }
    };
    private void clearChecked() {
        rbt0.setChecked(false);
        rbt1.setChecked(false);
        rbt2.setChecked(false);
        rbt3.setChecked(false);
    }
    @Override
    public void onClick(View v) {
        boolean isclose = false;
        switch (v.getId()) {
            case biz.AR.id.block_set_return0_layout: {
                clearChecked();
                rbt0.setChecked(true);
                sendMessage(0);
                isclose = true;
            }
                break;
            case biz.AR.id.block_set_return1_layout: {
                clearChecked();
                rbt1.setChecked(true);
                sendMessage(1);
                isclose = true;
            }
                break;
            case biz.AR.id.block_set_return2_layout: {
                clearChecked();
                rbt2.setChecked(true);
                sendMessage(2);
                isclose = true;
            }
                break;
            case biz.AR.id.block_set_return3_layout: {
                clearChecked();
                rbt3.setChecked(true);
                sendMessage(3);
                isclose = true;
            }
                break;
            case biz.AR.id.block_settingreturnring_returnring_wait_layout: {
                Message message = handler.obtainMessage();
                message.what = 10;
                CheckBox cBox = (CheckBox) findViewById(biz.AR.id.block_settingreturnring_returnring_wait_value_cbox);
                if (!cBox.isChecked()) message.arg1 = SERVICE_SET.length - 2;
                else message.arg1 = SERVICE_SET.length - 1;
                handler.sendMessage(message);
                BlockRuleSetting.block_callwait = !cBox.isChecked();
                cBox.setChecked(!cBox.isChecked());
                isclose = true;
            }
                break;
        }
        if (isclose) finish();
    }
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.block_settingreturnring_activity);
        update_setting();
    }
    private void update_setting() {
        rbt0 = (RadioButton) findViewById(biz.AR.id.block_set_return0_rbtn);
        rbt1 = (RadioButton) findViewById(biz.AR.id.block_set_return1_rbtn);
        rbt2 = (RadioButton) findViewById(biz.AR.id.block_set_return2_rbtn);
        rbt3 = (RadioButton) findViewById(biz.AR.id.block_set_return3_rbtn);
        CheckBox cbox = (CheckBox) findViewById(biz.AR.id.block_settingreturnring_returnring_wait_value_cbox);
        cbox.setChecked(BlockRuleSetting.block_callwait);
        r0 = (LinearLayout) findViewById(biz.AR.id.block_set_return0_layout);
        r0.setOnClickListener(this);
        r1 = (LinearLayout) findViewById(biz.AR.id.block_set_return1_layout);
        r1.setOnClickListener(this);
        r2 = (LinearLayout) findViewById(biz.AR.id.block_set_return2_layout);
        r2.setOnClickListener(this);
        r3 = (LinearLayout) findViewById(biz.AR.id.block_set_return3_layout);
        r3.setOnClickListener(this);
        LinearLayout r = (LinearLayout) findViewById(biz.AR.id.block_settingreturnring_returnring_wait_layout);
        r.setOnClickListener(this);
        switch (BlockRuleSetting.block_returnring_mode) {
            case 0:
                rbt0.setChecked(true);
                break;
            case 1:
                rbt1.setChecked(true);
                break;
            case 2:
                rbt2.setChecked(true);
                break;
            case 3:
                rbt3.setChecked(true);
                break;
        }
    }
    @Override
    protected void onPrepareDialog(int id, Dialog dialog) {
        removeDialog(id);
        super.onPrepareDialog(id, dialog);
    }
    private void sendMessage(int item) {
        BlockRuleSetting.block_returnring_mode = item;
        Message message = handler.obtainMessage();
        message.what = 10;
        message.arg1 = item;
        handler.sendMessage(message);
    }
}
