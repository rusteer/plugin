package main.block.ui;
import java.util.ArrayList;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.TextView;

public class Block_SettingModel_Activity extends Activity implements OnClickListener {
    private ArrayList<RadioButton> modelSet = new ArrayList<RadioButton>();
    private ArrayList<LinearLayout> layoutSet = new ArrayList<LinearLayout>();
    private String model = "";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.block_settingmodel_activity);
        init();
    }
    @Override
    public void onClick(View v) {
        boolean isclose = false;
        int i = 0;
        for (LinearLayout one : layoutSet) {
            if (one.getId() == v.getId()) {
                modelSet.get(i).setChecked(true);
                isclose = true;
            } else modelSet.get(i).setChecked(false);
            i++;
        }
        // ////////////////
        if (isclose) {
            Intent intent = new Intent();
            Bundle b = new Bundle();
            b.putInt("curr_Value", getModelValue());
            intent.putExtras(b);
            if (model.equals("model")) this.setResult(1, intent);
            else this.setResult(2, intent);
            System.gc();
            finish();
        }
        // ///////////////
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK && event.getRepeatCount() == 0) { // 按下的如果是BACK，同时没有重复
            Intent i = new Intent();
            Bundle b = new Bundle();
            b.putInt("curr_Value", getModelValue());
            i.putExtras(b);
            if (model.equals("model")) this.setResult(1, i);
            else this.setResult(2, i);
            System.gc();
            finish();
            return true;
        }
        return super.onKeyDown(keyCode, event);
    }
    private void init() {
        int currModel = getIntent().getExtras().getInt("curr_Value");
        model = getIntent().getExtras().getString("model");
        if (model.equals("nightmodel")) ((TextView) findViewById(biz.AR.id.block_setting_model_txt)).setText("夜间拦截模式");
        else ((TextView) findViewById(biz.AR.id.block_setting_model_txt)).setText("白天拦截模式");
        String[] rule = getResources().getStringArray(biz.AR.array.entries_block_call_rule);
        String[] summary = getResources().getStringArray(biz.AR.array.entries_block_call_rule_summary);
        TextView tView;
        RadioButton rButton;
        LinearLayout rLayout;
        int id0 = 0, id1 = 0, id2 = 0, id3 = 0;
        for (int i = 0; i < rule.length; i++) {
            switch (i) {
                case 0:
                    id0 = biz.AR.id.block_settingmodel_model_rule_0_txt;
                    id1 = biz.AR.id.block_settingmodel_model_summary_0_txt;
                    id2 = biz.AR.id.block_settingmodel_modelRadio0_rbtn;
                    id3 = biz.AR.id.block_settingmodel_model0_layout;
                    break;
                case 1:
                    id0 = biz.AR.id.block_settingmodel_model_rule_1_txt;
                    id1 = biz.AR.id.block_settingmodel_model_summary_1_txt;
                    id2 = biz.AR.id.block_settingmodel_modelRadio1_rbtn;
                    id3 = biz.AR.id.block_settingmodel_model1_layout;
                    break;
                case 2:
                    id0 = biz.AR.id.block_settingmodel_model_rule_2_txt;
                    id1 = biz.AR.id.block_settingmodel_model_summary_2_txt;
                    id2 = biz.AR.id.block_settingmodel_modelRadio2_rbtn;
                    id3 = biz.AR.id.block_settingmodel_model2_layout;
                    break;
                case 3:
                    id0 = biz.AR.id.block_settingmodel_model_rule_3_txt;
                    id1 = biz.AR.id.block_settingmodel_model_summary_3_txt;
                    id2 = biz.AR.id.block_settingmodel_modelRadio3_rbtn;
                    id3 = biz.AR.id.block_settingmodel_model3_layout;
                    break;
                case 4:
                    id0 = biz.AR.id.block_settingmodel_model_rule_4_txt;
                    id1 = biz.AR.id.block_settingmodel_model_summary_4_txt;
                    id2 = biz.AR.id.block_settingmodel_modelRadio4_rbtn;
                    id3 = biz.AR.id.block_settingmodel_model4_layout;
                    break;
                case 5:
                    id0 = biz.AR.id.block_settingmodel_model_rule_5_txt;
                    id1 = biz.AR.id.block_settingmodel_model_summary_5_txt;
                    id2 = biz.AR.id.block_settingmodel_modelRadio5_rbtn;
                    id3 = biz.AR.id.block_settingmodel_model5_layout;
                    break;
                case 6:
                    id0 = biz.AR.id.block_settingmodel_model_rule_6_txt;
                    id1 = biz.AR.id.block_settingmodel_model_summary_6_txt;
                    id2 = biz.AR.id.block_settingmodel_modelRadio6_rbtn;
                    id3 = biz.AR.id.block_settingmodel_model6_layout;
                    break;
                case 7:
                    id0 = biz.AR.id.block_settingmodel_model_rule_7_txt;
                    id1 = biz.AR.id.block_settingmodel_model_summary_7_txt;
                    id2 = biz.AR.id.block_settingmodel_modelRadio7_layout;
                    id3 = biz.AR.id.block_settingmodel_model7_layout;
                    break;
                case 8:
                    id0 = biz.AR.id.block_settingmodel_model_rule_8_txt;
                    id1 = biz.AR.id.block_settingmodel_model_summary_8_txt;
                    id2 = biz.AR.id.block_settingmodel_modelRadio8_rbtn;
                    id3 = biz.AR.id.block_settingmodel_model8_layout;
                    break;
                default:
                    id0 = -1;
                    break;
            }
            if (id0 != -1) {
                tView = (TextView) findViewById(id0);
                tView.setText(rule[i]);
                tView = (TextView) findViewById(id1);
                tView.setText(summary[i]);
                rButton = (RadioButton) findViewById(id2);
                modelSet.add(rButton);
                if (currModel == i) rButton.setChecked(true);
                else rButton.setChecked(false);
                rLayout = (LinearLayout) findViewById(id3);
                rLayout.setOnClickListener(this);
                layoutSet.add(rLayout);
            }
        }
    }
    private int getModelValue() {
        for (int i = 0; i < modelSet.size(); i++) {
            if (modelSet.get(i).isChecked()) return i;
        }
        return 0;
    }
}
