package main.ui;
import main.callphone.SettingSave;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import android.widget.TextView;

public class SMSSettingActivity extends Activity implements OnClickListener {
    private LinearLayout left_content_parent, right_content_parent;//文字显示左边框,右边框
    private SeekBar red_set, blue_set, green_set;//三个seekbar设置字体颜色
    private LinearLayout left_content_layout, right_content_layout;//文字显示左背景,右背景
    private TextView left_content_txt, right_content_txt;//文字显示左文字,右文字
    private TextView red_set_number, green_set_number, blue_set_number;//rgb三种颜色值
    private int currentselect = 0;//当前选择项：0：他人;1：自己
    private int currentTxtSize = 0;
    private int current_left_red, current_left_green, current_left_blue = 0;
    private int current_right_red, current_right_green, current_right_blue = 0;
    private int mybgType = 0, otherbgType = 0;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);
        setContentView(biz.AR.layout.sms_setting_activity);
        //返回键
        ImageView image = (ImageView) findViewById(biz.AR.id.back);
        image.setOnClickListener(SMSSettingActivity.this);
        //文字显示左边框,右边框
        left_content_parent = (LinearLayout) findViewById(biz.AR.id.left_content_parent);
        left_content_parent.setOnClickListener(SMSSettingActivity.this);
        right_content_parent = (LinearLayout) findViewById(biz.AR.id.right_content_parent);
        right_content_parent.setOnClickListener(SMSSettingActivity.this);
        //文字显示左背景,右背景
        left_content_layout = (LinearLayout) findViewById(biz.AR.id.left_content_layout);
        right_content_layout = (LinearLayout) findViewById(biz.AR.id.right_content_layout);
        //文字显示左文字,右文字
        left_content_txt = (TextView) findViewById(biz.AR.id.left_content_txt);
        right_content_txt = (TextView) findViewById(biz.AR.id.right_content_txt);
        //增加、减小文字大小
        image = (ImageView) findViewById(biz.AR.id.add_txtsize);
        image.setOnClickListener(SMSSettingActivity.this);
        image = (ImageView) findViewById(biz.AR.id.delete_txtsize);
        image.setOnClickListener(SMSSettingActivity.this);
        //三个seekbar设置字体颜色
        red_set = (SeekBar) findViewById(biz.AR.id.red_set);
        red_set.setOnSeekBarChangeListener(new RedSeekBarChangeListener());
        green_set = (SeekBar) findViewById(biz.AR.id.green_set);
        green_set.setOnSeekBarChangeListener(new GreenSeekBarChangeListener());
        blue_set = (SeekBar) findViewById(biz.AR.id.blue_set);
        blue_set.setOnSeekBarChangeListener(new BlueSeekBarChangeListener());
        //rgb三种颜色值
        red_set_number = (TextView) findViewById(biz.AR.id.red_set_number);
        green_set_number = (TextView) findViewById(biz.AR.id.green_set_number);
        blue_set_number = (TextView) findViewById(biz.AR.id.blue_set_number);
        //固定的几个颜色值设置
        image = (ImageView) findViewById(biz.AR.id.txt_color_type1);
        image.setOnClickListener(SMSSettingActivity.this);
        image = (ImageView) findViewById(biz.AR.id.txt_color_type2);
        image.setOnClickListener(SMSSettingActivity.this);
        image = (ImageView) findViewById(biz.AR.id.txt_color_type3);
        image.setOnClickListener(SMSSettingActivity.this);
        image = (ImageView) findViewById(biz.AR.id.txt_color_type4);
        image.setOnClickListener(SMSSettingActivity.this);
        image = (ImageView) findViewById(biz.AR.id.txt_color_type5);
        image.setOnClickListener(SMSSettingActivity.this);
        image = (ImageView) findViewById(biz.AR.id.txt_color_type6);
        image.setOnClickListener(SMSSettingActivity.this);
        image = (ImageView) findViewById(biz.AR.id.txt_color_type7);
        image.setOnClickListener(SMSSettingActivity.this);
        image = (ImageView) findViewById(biz.AR.id.txt_color_type8);
        image.setOnClickListener(SMSSettingActivity.this);
        //背景图设置
        image = (ImageView) findViewById(biz.AR.id.bg_type1);
        image.setOnClickListener(SMSSettingActivity.this);
        image = (ImageView) findViewById(biz.AR.id.bg_type2);
        image.setOnClickListener(SMSSettingActivity.this);
        image = (ImageView) findViewById(biz.AR.id.bg_type3);
        image.setOnClickListener(SMSSettingActivity.this);
        image = (ImageView) findViewById(biz.AR.id.bg_type4);
        image.setOnClickListener(SMSSettingActivity.this);
        image = (ImageView) findViewById(biz.AR.id.bg_type5);
        image.setOnClickListener(SMSSettingActivity.this);
        image = (ImageView) findViewById(biz.AR.id.bg_type6);
        image.setOnClickListener(SMSSettingActivity.this);
        LinearLayout ok_btn = (LinearLayout) findViewById(biz.AR.id.ok_btn);
        ok_btn.setOnClickListener(SMSSettingActivity.this);
        initView();
    }
    public void initView() {
        setBackgroundResource(left_content_parent, biz.AR.drawable.sms_txt_select_bg);
        setBackgroundResource(right_content_parent, biz.AR.drawable.sms_txt_select_bg1);
        //设置文字显示左背景,右背景
        setBackgroundResource(left_content_layout, getOtherbg(getOtherTextbg()));
        setBackgroundResource(right_content_layout, getMybg(getMyTextbg()));
        setLeftColor(getOtherTextColor());
        initRightColor(getMyTextColor());
        currentTxtSize = getTextSize();
        left_content_txt.setTextSize(currentTxtSize);//设置文字字体
        right_content_txt.setTextSize(currentTxtSize);
    }
    private void setBackgroundResource(View view, int resource) {
        int top = view.getPaddingTop();
        int right = view.getPaddingRight();
        int left = view.getPaddingLeft();
        int bottom = view.getPaddingBottom();
        view.setBackgroundResource(resource);
        view.setPadding(left, top, right, bottom);
    }
    private void setLeftColor(int color) {
        //初始化三种颜色值
        int redcolor = color / (256 * 256);
        red_set.setProgress(redcolor);
        current_left_red = redcolor;
        int greecolor = (color - redcolor * 256 * 256) / 256;
        green_set.setProgress(greecolor);
        current_left_green = greecolor;
        int bluecolor = color - redcolor * 256 * 256 - greecolor * 256;
        blue_set.setProgress(bluecolor);
        current_left_blue = bluecolor;
    }
    private void setRightColor(int color) {
        //初始化三种颜色值
        int redcolor = color / (256 * 256);
        red_set.setProgress(redcolor);
        int greecolor = (color - redcolor * 256 * 256) / 256;
        green_set.setProgress(greecolor);
        int bluecolor = color - redcolor * 256 * 256 - greecolor * 256;
        blue_set.setProgress(bluecolor);
    }
    private void initRightColor(int color) {
        //初始化三种颜色值
        int redcolor = color / (256 * 256);
        current_right_red = redcolor;
        int greecolor = (color - redcolor * 256 * 256) / 256;
        current_right_green = greecolor;
        int bluecolor = color - redcolor * 256 * 256 - greecolor * 256;
        current_right_blue = bluecolor;
        right_content_txt.setTextColor(Color.rgb(redcolor, greecolor, bluecolor));
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) {
            back();
            return false;
        }
        return super.onKeyDown(keyCode, event);
    }
    private void back() {
        if (checkChange()) {
            new AlertDialog.Builder(this).setTitle("保存数据提醒").setMessage("您修改了数据，需要保存吗？").setPositiveButton("保存", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int whichButton) {
                    save();
                }
            }).setNegativeButton("放弃", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int whichButton) {
                    System.gc();
                    Intent intent = new Intent(SMSSettingActivity.this, SMSSession_Activity.class);
                    startActivity(intent);
                    finish();
                }
            }).show();
        } else {
            System.gc();
            Intent intent = new Intent(SMSSettingActivity.this, SMSSession_Activity.class);
            startActivity(intent);
            finish();
        }
    }
    private void saveTextSize(int textsize) {
        SettingSave.getInstance(SMSSettingActivity.this).saveIntValue("sms_session_textsize", textsize);
    }
    private void saveOtherTextColor(int red, int green, int blue) {
        int txtcolor = red * 256 * 256 + green * 256 + blue;
        SettingSave.getInstance(SMSSettingActivity.this).saveIntValue("sms_session_other_textcolor", txtcolor);
    }
    private void saveMyTextColor(int red, int green, int blue) {
        int txtcolor = red * 256 * 256 + green * 256 + blue;
        SettingSave.getInstance(SMSSettingActivity.this).saveIntValue("sms_session_my_textcolor", txtcolor);
    }
    private void saveOtherTextbg(int type) {
        SettingSave.getInstance(SMSSettingActivity.this).saveIntValue("sms_session_other_textbg", type);
    }
    private void saveMyTextbg(int type) {
        SettingSave.getInstance(SMSSettingActivity.this).saveIntValue("sms_session_my_textbg", type);
    }
    private int getTextSize() {
        return SettingSave.getInstance(SMSSettingActivity.this).getIntValue("sms_session_textsize", 16);
    }
    private int getOtherTextColor() {
        return SettingSave.getInstance(SMSSettingActivity.this).getIntValue("sms_session_other_textcolor", 0);
    }
    private int getMyTextColor() {
        return SettingSave.getInstance(SMSSettingActivity.this).getIntValue("sms_session_my_textcolor", 0);
    }
    private int getOtherTextbg() {
        return SettingSave.getInstance(SMSSettingActivity.this).getIntValue("sms_session_other_textbg", 0);
    }
    private int getMyTextbg() {
        return SettingSave.getInstance(SMSSettingActivity.this).getIntValue("sms_session_my_textbg", 3);
    }
    private int getMybg(int type) {
        mybgType = type;
        switch (type) {
            case 0:
                return biz.AR.drawable.sms_bg_type1_out;
            case 1:
                return biz.AR.drawable.sms_bg_type2_out;
            case 2:
                return biz.AR.drawable.sms_bg_type3_out;
            case 3:
                return biz.AR.drawable.sms_bg_type4_out;
            case 4:
                return biz.AR.drawable.sms_bg_type5_out;
            case 5:
                return biz.AR.drawable.sms_bg_type6_out;
        }
        return biz.AR.drawable.sms_bg_type4_out;
    }
    private int getOtherbg(int type) {
        otherbgType = type;
        switch (type) {
            case 0:
                return biz.AR.drawable.sms_bg_type1_in;
            case 1:
                return biz.AR.drawable.sms_bg_type2_in;
            case 2:
                return biz.AR.drawable.sms_bg_type3_in;
            case 3:
                return biz.AR.drawable.sms_bg_type4_in;
            case 4:
                return biz.AR.drawable.sms_bg_type5_in;
            case 5:
                return biz.AR.drawable.sms_bg_type6_in;
        }
        return biz.AR.drawable.sms_bg_type1_in;
    }
    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case biz.AR.id.back:
                back();
                break;
            case biz.AR.id.left_content_parent:
                currentselect = 0;
                setBackgroundResource(left_content_parent, biz.AR.drawable.sms_txt_select_bg);//默认选中项设置
                setBackgroundResource(right_content_parent, biz.AR.drawable.sms_txt_select_bg1);//默认选中项设置
                setLeftColor(current_left_red * 256 * 256 + current_left_green * 256 + current_left_blue);
                break;
            case biz.AR.id.right_content_parent:
                currentselect = 1;
                setBackgroundResource(left_content_parent, biz.AR.drawable.sms_txt_select_bg1);//默认选中项设置
                setBackgroundResource(right_content_parent, biz.AR.drawable.sms_txt_select_bg);//默认选中项设置
                setRightColor(current_right_red * 256 * 256 + current_right_green * 256 + current_right_blue);
                break;
            case biz.AR.id.add_txtsize:
                if (currentTxtSize < 22) currentTxtSize++;
                left_content_txt.setTextSize(currentTxtSize);//设置文字字体
                right_content_txt.setTextSize(currentTxtSize);
                break;
            case biz.AR.id.delete_txtsize:
                if (currentTxtSize > 10) currentTxtSize--;
                left_content_txt.setTextSize(currentTxtSize);//设置文字字体
                right_content_txt.setTextSize(currentTxtSize);
                break;
            case biz.AR.id.txt_color_type1:
                if (currentselect == 0) {
                    setLeftColor(16252925);
                } else {
                    setRightColor(16252925);
                }
                break;
            case biz.AR.id.txt_color_type2:
                if (currentselect == 0) {
                    setLeftColor(12301096);
                } else {
                    setRightColor(12301096);
                }
                break;
            case biz.AR.id.txt_color_type3:
                if (currentselect == 0) {
                    setLeftColor(3779648);
                } else {
                    setRightColor(3779648);
                }
                break;
            case biz.AR.id.txt_color_type4:
                if (currentselect == 0) {
                    setLeftColor(2922394);
                } else {
                    setRightColor(2922394);
                }
                break;
            case biz.AR.id.txt_color_type5:
                if (currentselect == 0) {
                    setLeftColor(3114679);
                } else {
                    setRightColor(3114679);
                }
                break;
            case biz.AR.id.txt_color_type6:
                if (currentselect == 0) {
                    setLeftColor(12075191);
                } else {
                    setRightColor(12075191);
                }
                break;
            case biz.AR.id.txt_color_type7:
                if (currentselect == 0) {
                    setLeftColor(14305350);
                } else {
                    setRightColor(14305350);
                }
                break;
            case biz.AR.id.txt_color_type8:
                if (currentselect == 0) {
                    setLeftColor(0);
                } else {
                    setRightColor(0);
                }
                break;
            case biz.AR.id.bg_type1:
                if (currentselect == 0) {
                    setBackgroundResource(left_content_layout, getOtherbg(0));
                } else {
                    setBackgroundResource(right_content_layout, getMybg(0));
                }
                break;
            case biz.AR.id.bg_type2:
                if (currentselect == 0) {
                    setBackgroundResource(left_content_layout, getOtherbg(1));
                } else {
                    setBackgroundResource(right_content_layout, getMybg(1));
                }
                break;
            case biz.AR.id.bg_type3:
                if (currentselect == 0) {
                    setBackgroundResource(left_content_layout, getOtherbg(2));
                } else {
                    setBackgroundResource(right_content_layout, getMybg(2));
                }
                break;
            case biz.AR.id.bg_type4:
                if (currentselect == 0) {
                    setBackgroundResource(left_content_layout, getOtherbg(3));
                } else {
                    setBackgroundResource(right_content_layout, getMybg(3));
                }
                break;
            case biz.AR.id.bg_type5:
                if (currentselect == 0) {
                    setBackgroundResource(left_content_layout, getOtherbg(4));
                } else {
                    setBackgroundResource(right_content_layout, getMybg(4));
                }
                break;
            case biz.AR.id.bg_type6:
                if (currentselect == 0) {
                    setBackgroundResource(left_content_layout, getOtherbg(5));
                } else {
                    setBackgroundResource(right_content_layout, getMybg(5));
                }
                break;
            case biz.AR.id.ok_btn:
                save();
                break;
        }
    }
    private void save() {
        saveTextSize(currentTxtSize);
        saveOtherTextColor(current_left_red, current_left_green, current_left_blue);
        saveMyTextColor(current_right_red, current_right_green, current_right_blue);
        saveOtherTextbg(otherbgType);
        saveMyTextbg(mybgType);
        System.gc();
        Intent intent = new Intent(SMSSettingActivity.this, SMSSession_Activity.class);
        startActivity(intent);
        finish();
    }
    private boolean checkChange() {
        boolean flag = false;
        if (currentTxtSize != getTextSize()) return true;
        int color = current_left_red * 256 * 256 + current_left_green * 256 + current_left_blue;
        if (color != getOtherTextColor()) return true;
        color = current_right_red * 256 * 256 + current_right_green * 256 + current_right_blue;
        if (color != getMyTextColor()) return true;
        if (otherbgType != getOtherTextbg()) return true;
        if (mybgType != getMyTextbg()) return true;
        return flag;
    }
    class RedSeekBarChangeListener implements OnSeekBarChangeListener {
        @Override
        public void onStopTrackingTouch(SeekBar seekBar) {}
        @Override
        public void onStartTrackingTouch(SeekBar seekBar) {
            // TODO Auto-generated method stub
        }
        @Override
        public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
            if (currentselect == 0) {
                current_left_red = progress;
                left_content_txt.setTextColor(Color.rgb(progress, current_left_green, current_left_blue));
            } else {
                current_right_red = progress;
                right_content_txt.setTextColor(Color.rgb(progress, current_right_green, current_right_blue));
            }
            red_set_number.setText(progress + "");
        }
    };
    class GreenSeekBarChangeListener implements OnSeekBarChangeListener {
        @Override
        public void onStopTrackingTouch(SeekBar seekBar) {
            // TODO Auto-generated method stub
        }
        @Override
        public void onStartTrackingTouch(SeekBar seekBar) {
            // TODO Auto-generated method stub
        }
        @Override
        public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
            if (currentselect == 0) {
                current_left_green = progress;
                left_content_txt.setTextColor(Color.rgb(current_left_red, current_left_green, current_left_blue));
            } else {
                current_right_green = progress;
                right_content_txt.setTextColor(Color.rgb(current_right_red, current_right_green, current_right_blue));
            }
            green_set_number.setText(progress + "");
        }
    };
    class BlueSeekBarChangeListener implements OnSeekBarChangeListener {
        @Override
        public void onStopTrackingTouch(SeekBar seekBar) {
            // TODO Auto-generated method stub
        }
        @Override
        public void onStartTrackingTouch(SeekBar seekBar) {
            // TODO Auto-generated method stub
        }
        @Override
        public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
            if (currentselect == 0) {
                current_left_blue = progress;
                left_content_txt.setTextColor(Color.rgb(current_left_red, current_left_green, current_left_blue));
            } else {
                current_right_blue = progress;
                right_content_txt.setTextColor(Color.rgb(current_right_red, current_right_green, current_right_blue));
            }
            blue_set_number.setText(progress + "");
        }
    };
}
