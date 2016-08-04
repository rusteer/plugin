package main.privates.ui;
import main.database.DatabaseAdapter;
import main.privates.PrivateRuleSetting;
import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

public class Private_Setting_Title_Activity extends Activity implements OnClickListener {
    private int iconIndex;
    private int[] IconIDs = { biz.AR.drawable.main_item_private, biz.AR.drawable.private_icon1, biz.AR.drawable.private_icon2, biz.AR.drawable.private_icon3, biz.AR.drawable.private_icon4 };
    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case biz.AR.id.private_setting_title_OK_btn: {
                EditText etitle = (EditText) findViewById(biz.AR.id.private_setting_title_etxt);
                String title = etitle.getText().toString();
                if (title.length() == 0 || title.length() > 4) {
                    Toast.makeText(this, "隐私长度为1-4个字符", Toast.LENGTH_SHORT).show();
                    return;
                }
                PrivateRuleSetting.title = title;
                PrivateRuleSetting.iconIndex = iconIndex;
                DatabaseAdapter da = DatabaseAdapter.getInstance(this);
                da.updaePrivateRuleSetting();
                System.gc();
                finish();
            }
                break;
            case biz.AR.id.private_setting_title_Cancel_btn: {
                System.gc();
                finish();
            }
                break;
            case biz.AR.id.private_setting_title_icon_img: {
                if (iconIndex + 1 >= IconIDs.length) iconIndex = 0;
                else iconIndex++;
                ImageView iView = (ImageView) findViewById(biz.AR.id.private_setting_title_icon_img);
                iView.setImageResource(IconIDs[iconIndex]);
                PrivateRuleSetting.iconIndex = iconIndex;
                DatabaseAdapter da = DatabaseAdapter.getInstance(this);
                da.updaePrivateRuleSetting();
            }
                break;
        }
    }
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.private_setting_title_activity);
        TextView bt = (TextView) findViewById(biz.AR.id.private_setting_title_OK_btn);
        bt.setOnClickListener(this);
        bt = (TextView) findViewById(biz.AR.id.private_setting_title_Cancel_btn);
        bt.setOnClickListener(this);
        ImageView iView = (ImageView) findViewById(biz.AR.id.private_setting_title_icon_img);
        iconIndex = PrivateRuleSetting.iconIndex;
        iView.setImageResource(IconIDs[iconIndex]);
        iView.setOnClickListener(this);
        EditText editText = (EditText) findViewById(biz.AR.id.private_setting_title_etxt);
        editText.setText(PrivateRuleSetting.title);
    }
}
