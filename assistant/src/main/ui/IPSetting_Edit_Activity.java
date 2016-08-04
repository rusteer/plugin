package main.ui;
import main.block.BlockRuleSetting;
import main.block.IPSetting;
import main.database.DatabaseAdapter;
import net.workspace.util.Logger;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.TimePickerDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.TimePicker;

public class IPSetting_Edit_Activity extends Activity implements OnClickListener {
    private boolean curr_choice_startTime;
    public static IPSetting ipSetting;
    private CheckBox[] daysCheckBoxs = new CheckBox[7];
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.ipsetting_edit);
        getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);
        LinearLayout main = (LinearLayout) findViewById(biz.AR.id.ipsetting_edit_layout);
        main.setBackgroundResource(Global_Var.mainBG_Imges[Global_Var.currMainBGIndex]);
        initView();
        refreshData();
    }
    @Override
    public void onClick(View v) {
        try {
            switch (v.getId()) {
                case biz.AR.id.ipsetting_edit_startTime_txt: {
                    curr_choice_startTime = true;
                    TextView tView = (TextView) findViewById(biz.AR.id.ipsetting_edit_startTime_txt);
                    String[] _start = tView.getText().toString().split(":");
                    new TimePickerDialog(this, mTimeSetListener, Integer.parseInt(_start[0].trim()), Integer.parseInt(_start[1].trim()), true).show();
                }
                    break;
                case biz.AR.id.ipsetting_edit_endTime_txt: {
                    curr_choice_startTime = false;
                    TextView tView = (TextView) findViewById(biz.AR.id.ipsetting_edit_endTime_txt);
                    String[] _start = tView.getText().toString().split(":");
                    new TimePickerDialog(this, mTimeSetListener, Integer.parseInt(_start[0].trim()), Integer.parseInt(_start[1].trim()), true).show();
                }
                    break;
                case biz.AR.id.back:
                    if (checkData()) {
                        System.gc();
                        IPSetting_Edit_Activity.this.finish();
                    }
                    break;
                case biz.AR.id.ipsetting_edit_exit_btn:
                    System.gc();
                    IPSetting_Edit_Activity.this.finish();
                    break;
                case biz.AR.id.ipsetting_edit_ok_btn: {
                    if (ipSetting == null) {
                        if (IsAddData()) {
                            saveData();
                            System.gc();
                            finish();
                        }
                    } else if (isChangeValues()) {
                        saveData();
                        System.gc();
                        finish();
                    }
                }
                    break;
            }
        } catch (Throwable e) {
            Logger.error(e);
        }
    }
    private void initView() {
        Spinner spinner = (Spinner) findViewById(biz.AR.id.ipsetting_edit_areatype_sp);
        // 0-全部地区;1-下面地区;2-排除下面地区
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this, biz.AR.array.ipsetting_areatype, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter(adapter);
        spinner.setSelection(0);
        spinner.setOnItemSelectedListener(new OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                // Spinner spinner = (Spinner)
                // findViewById(biz.AR.id.ipsetting_edit_areatype_sp);
                EditText eText = (EditText) findViewById(biz.AR.id.ipsetting_edit_area_etxt);
                if (position == 0) eText.setEnabled(false);
                else {
                    eText.setEnabled(true);
                    eText.requestFocus();
                }
            }
            @Override
            public void onNothingSelected(AdapterView<?> parent) {
                // TODO Auto-generated method stub
            }
        });
        TextView tView = (TextView) findViewById(biz.AR.id.ipsetting_edit_startTime_txt);
        tView.setOnClickListener(this);
        tView = (TextView) findViewById(biz.AR.id.ipsetting_edit_endTime_txt);
        tView.setOnClickListener(this);
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(this);
        Button exitbt = (Button) findViewById(biz.AR.id.ipsetting_edit_exit_btn);
        exitbt.setOnClickListener(this);
        Button okbt = (Button) findViewById(biz.AR.id.ipsetting_edit_ok_btn);
        okbt.setOnClickListener(this);
    }
    private void refreshData() {
        CheckBox cBox = (CheckBox) findViewById(biz.AR.id.ipsetting_edit_mon_cbox);
        cBox.setChecked(true);
        daysCheckBoxs[0] = cBox;
        cBox = (CheckBox) findViewById(biz.AR.id.ipsetting_edit_tues_cbox);
        cBox.setChecked(true);
        daysCheckBoxs[1] = cBox;
        cBox = (CheckBox) findViewById(biz.AR.id.ipsetting_edit_wed_cbox);
        cBox.setChecked(true);
        daysCheckBoxs[2] = cBox;
        cBox = (CheckBox) findViewById(biz.AR.id.ipsetting_edit_thurs_cbox);
        cBox.setChecked(true);
        daysCheckBoxs[3] = cBox;
        cBox = (CheckBox) findViewById(biz.AR.id.ipsetting_edit_friday_cbox);
        cBox.setChecked(true);
        daysCheckBoxs[4] = cBox;
        cBox = (CheckBox) findViewById(biz.AR.id.ipsetting_edit_sat_cbox);
        cBox.setChecked(true);
        daysCheckBoxs[5] = cBox;
        cBox = (CheckBox) findViewById(biz.AR.id.ipsetting_edit_sun_cbox);
        cBox.setChecked(true);
        daysCheckBoxs[6] = cBox;
        if (ipSetting == null) {
            ((TextView) findViewById(biz.AR.id.ipsetting_edit_title)).setText("添加新IP配置");
        } else {
            setValues();
        }
    }
    private void setValues() {
        ((TextView) findViewById(biz.AR.id.ipsetting_edit_title)).setText("编辑[" + ipSetting.niceName + "]IP配置");
        EditText eText = (EditText) findViewById(biz.AR.id.ipsetting_edit_niceName_etxt);
        eText.setText(ipSetting.niceName);
        eText = (EditText) findViewById(biz.AR.id.ipsetting_edit_IPNumber_etxt);
        eText.setText(ipSetting.IPnumber);
        Spinner sp = (Spinner) findViewById(biz.AR.id.ipsetting_edit_areatype_sp);
        sp.setSelection(ipSetting.AreaType);
        eText = (EditText) findViewById(biz.AR.id.ipsetting_edit_area_etxt);
        eText.setText(ipSetting.Area);
        if (ipSetting.AreaType == 0) eText.setEnabled(false);
        eText = (EditText) findViewById(biz.AR.id.ipsetting_edit_outnumber_etxt);
        eText.setText(ipSetting.Outnumber);
        eText = (EditText) findViewById(biz.AR.id.ipsetting_edit_includenumber_etxt);
        eText.setText(ipSetting.IncludeNumber);
        eText = (EditText) findViewById(biz.AR.id.ipsetting_edit_LocalCity_etxt);
        eText.setText(ipSetting.LocalCity);
        CheckBox cBox = (CheckBox) findViewById(biz.AR.id.ipsetting_edit_addzero_cbox);
        cBox.setChecked(ipSetting.AddZero);
        cBox = (CheckBox) findViewById(biz.AR.id.ipsetting_edit_localcity_nouse_cbox);
        cBox.setChecked(ipSetting.localcity_nouse);
        TextView tView = (TextView) findViewById(biz.AR.id.ipsetting_edit_startTime_txt);
        tView.setText(ipSetting.Times.substring(0, ipSetting.Times.indexOf(";")));
        tView = (TextView) findViewById(biz.AR.id.ipsetting_edit_endTime_txt);
        tView.setText(ipSetting.Times.substring(ipSetting.Times.indexOf(";") + 1));
        String[] daystr = ipSetting.Days.split(";");
        for (int i = 0; i < daysCheckBoxs.length; i++) {
            daysCheckBoxs[i].setChecked(daystr[i].equals("1") ? true : false);
        }
    }
    private boolean isChangeValues() {
        EditText eText = (EditText) findViewById(biz.AR.id.ipsetting_edit_niceName_etxt);
        if (!eText.getText().toString().equals(ipSetting.niceName)) return true;
        eText = (EditText) findViewById(biz.AR.id.ipsetting_edit_IPNumber_etxt);
        if (!eText.getText().toString().equals(ipSetting.IPnumber)) return true;
        Spinner sp = (Spinner) findViewById(biz.AR.id.ipsetting_edit_areatype_sp);
        if (sp.getSelectedItemPosition() != ipSetting.AreaType) return true;
        eText = (EditText) findViewById(biz.AR.id.ipsetting_edit_area_etxt);
        if (!eText.getText().toString().equals(ipSetting.Area)) return true;
        eText = (EditText) findViewById(biz.AR.id.ipsetting_edit_outnumber_etxt);
        if (!eText.getText().toString().equals(ipSetting.Outnumber)) return true;
        eText = (EditText) findViewById(biz.AR.id.ipsetting_edit_includenumber_etxt);
        if (!eText.getText().toString().equals(ipSetting.IncludeNumber)) return true;
        eText = (EditText) findViewById(biz.AR.id.ipsetting_edit_LocalCity_etxt);
        if (!eText.getText().toString().equals(ipSetting.LocalCity)) return true;
        CheckBox cBox = (CheckBox) findViewById(biz.AR.id.ipsetting_edit_addzero_cbox);
        if (cBox.isChecked() != ipSetting.AddZero) return true;
        cBox = (CheckBox) findViewById(biz.AR.id.ipsetting_edit_localcity_nouse_cbox);
        if (cBox.isChecked() != ipSetting.localcity_nouse) return true;
        TextView tView0 = (TextView) findViewById(biz.AR.id.ipsetting_edit_startTime_txt);
        TextView tView1 = (TextView) findViewById(biz.AR.id.ipsetting_edit_endTime_txt);
        if (!ipSetting.Times.equals(tView0.getText().toString() + ";" + tView1.getText().toString())) return true;
        String[] daystr = ipSetting.Days.split(";");
        for (int i = 0; i < daysCheckBoxs.length; i++) {
            String value = daysCheckBoxs[i].isChecked() ? "1" : "0";
            if (!daystr[i].equals(value)) return true;
        }
        return false;
    }
    @Override
    protected void onPostResume() {
        refreshData();
        super.onPostResume();
    }
    private TimePickerDialog.OnTimeSetListener mTimeSetListener = new TimePickerDialog.OnTimeSetListener() {
        @Override
        public void onTimeSet(TimePicker view, int hourOfDay, int minute) {
            if (curr_choice_startTime) {
                String value = String.format("%02d:%02d", hourOfDay, minute);
                BlockRuleSetting.night_start = value;
                TextView v = (TextView) findViewById(biz.AR.id.ipsetting_edit_startTime_txt);
                v.setText(value);
            } else {
                String value = String.format("%02d:%02d", hourOfDay, minute);
                BlockRuleSetting.night_end = value;
                TextView v = (TextView) findViewById(biz.AR.id.ipsetting_edit_endTime_txt);
                v.setText(value);
            }
        }
    };
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK && event.getRepeatCount() == 0) { return checkData(); }
        return false;
    }
    private boolean checkData() {
        if (ipSetting == null) {
            if (!IsAddData()) {
                System.gc();
                finish();
                return false;
            }
        } else if (!isChangeValues()) {
            System.gc();
            finish();
            return true;
        }
        new AlertDialog.Builder(this).setTitle("保存数据提醒").setMessage("您修改了数据，需要保存吗？").setPositiveButton("保存", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int whichButton) {
                saveData();
                System.gc();
                finish();
            }
        }).setNegativeButton("放弃", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int whichButton) {
                System.gc();
                finish();
            }
        }).show();
        return false;
    }
    private boolean IsAddData() {
        Boolean isChange = false;
        if (ipSetting == null) {
            EditText eText = (EditText) findViewById(biz.AR.id.ipsetting_edit_niceName_etxt);
            if (eText.getText().length() > 0) {
                isChange = true;
                return isChange;
            }
            eText = (EditText) findViewById(biz.AR.id.ipsetting_edit_IPNumber_etxt);
            if (eText.getText().length() > 0) {
                isChange = true;
                return isChange;
            }
        } else {}
        return isChange;
    }
    private void saveData() {
        if (ipSetting == null) {
            ipSetting = new IPSetting();
            ipSetting.IsUsed = false;
        }
        EditText eText = (EditText) findViewById(biz.AR.id.ipsetting_edit_niceName_etxt);
        ipSetting.niceName = eText.getText().toString();
        eText = (EditText) findViewById(biz.AR.id.ipsetting_edit_IPNumber_etxt);
        ipSetting.IPnumber = eText.getText().toString();
        Spinner sp = (Spinner) findViewById(biz.AR.id.ipsetting_edit_areatype_sp);
        ipSetting.AreaType = sp.getSelectedItemPosition();
        eText = (EditText) findViewById(biz.AR.id.ipsetting_edit_area_etxt);
        ipSetting.Area = eText.getText().toString();
        eText = (EditText) findViewById(biz.AR.id.ipsetting_edit_outnumber_etxt);
        ipSetting.Outnumber = eText.getText().toString();
        eText = (EditText) findViewById(biz.AR.id.ipsetting_edit_includenumber_etxt);
        ipSetting.IncludeNumber = eText.getText().toString();
        eText = (EditText) findViewById(biz.AR.id.ipsetting_edit_LocalCity_etxt);
        ipSetting.LocalCity = eText.getText().toString();
        CheckBox cBox = (CheckBox) findViewById(biz.AR.id.ipsetting_edit_addzero_cbox);
        ipSetting.AddZero = cBox.isChecked();
        cBox = (CheckBox) findViewById(biz.AR.id.ipsetting_edit_localcity_nouse_cbox);
        ipSetting.localcity_nouse = cBox.isChecked();
        TextView tView0 = (TextView) findViewById(biz.AR.id.ipsetting_edit_startTime_txt);
        TextView tView1 = (TextView) findViewById(biz.AR.id.ipsetting_edit_endTime_txt);
        ipSetting.Times = tView0.getText().toString() + ";" + tView1.getText().toString();
        String daysstr = "";
        int i = 0;
        for (CheckBox one : daysCheckBoxs) {
            i++;
            daysstr += one.isChecked() ? "1" : "0";
            if (i != daysCheckBoxs.length) daysstr += ";";
        }
        ipSetting.Days = daysstr;
        DatabaseAdapter d = DatabaseAdapter.getInstance(this);
        if (ipSetting.ID == 0) d.AddNewIPSetting(ipSetting);
        else {
            d.UpdateIPSetting(ipSetting);
        }
    }
}
