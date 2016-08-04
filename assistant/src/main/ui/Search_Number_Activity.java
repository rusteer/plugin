package main.ui;
import main.database.DBManager;
import android.app.Activity;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

public class Search_Number_Activity extends Activity {
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.search_number);
        LinearLayout main = (LinearLayout) findViewById(biz.AR.id.search_number_layout);
        main.setBackgroundResource(Global_Var.mainBG_Imges[Global_Var.currMainBGIndex]);
        setListen();
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) { // 按下的如果是BACK，同时没有重复
            System.gc();
            Search_Number_Activity.this.finish();
            return false;
        }
        return super.onKeyDown(keyCode, event);
    }
    private void setListen() {
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                Search_Number_Activity.this.finish();
            }
        });
        Button bt = (Button) findViewById(biz.AR.id.search_number_rbt);
        bt.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                TextView t = (TextView) findViewById(biz.AR.id.search_number_txt);
                String searchTxt = t.getText().toString();
                if (searchTxt.length() > 1) {
                    boolean isNumber = false;
                    boolean isPhoneNumber = false;
                    boolean isPost = false;
                    try {
                        if (searchTxt.length() >= 11) {
                            Integer.parseInt(searchTxt.substring(0, 7).trim());
                            Integer.parseInt(searchTxt.substring(7, 11).trim());
                            isNumber = true;
                        } else {
                            Integer.parseInt(searchTxt.trim());
                            isNumber = true;
                        }
                    } catch (Throwable e) {
                        isNumber = false;
                    }
                    if (isNumber && searchTxt.length() >= 7) {
                        isPhoneNumber = true;
                    } else if (isNumber && searchTxt.length() == 6) {
                        isPost = true;
                    }
                    DBManager dbManager = new DBManager(Search_Number_Activity.this);
                    dbManager.openDatabase();
                    if (isPhoneNumber) {
                        String info = dbManager.mobileInfo(searchTxt);
                        String[] infos = info.split(" ");
                        if (infos.length == 3) {
                            TextView tView = (TextView) findViewById(biz.AR.id.search_number_num_txt);
                            tView.setText(searchTxt);
                            tView = (TextView) findViewById(biz.AR.id.search_number_address_txt);
                            tView.setText(infos[0] + infos[1]);
                            tView = (TextView) findViewById(biz.AR.id.search_number_type_txt);
                            tView.setText(infos[2]);
                            return;
                        } else if (infos.length == 2) {
                            TextView tView = (TextView) findViewById(biz.AR.id.search_number_num_txt);
                            tView.setText(searchTxt);
                            tView = (TextView) findViewById(biz.AR.id.search_number_address_txt);
                            tView.setText(infos[0]);
                            tView = (TextView) findViewById(biz.AR.id.search_number_type_txt);
                            tView.setText(infos[1]);
                            return;
                        } else if (info.length() == 1) {
                            TextView tView = (TextView) findViewById(biz.AR.id.search_number_num_txt);
                            tView.setText(searchTxt);
                            tView = (TextView) findViewById(biz.AR.id.search_number_address_txt);
                            tView.setText(infos[0]);
                            tView = (TextView) findViewById(biz.AR.id.search_number_type_txt);
                            tView.setText("");
                        }
                    } else if (isNumber && isPost)// 邮编
                    {
                        String info = dbManager.SearchByPost(searchTxt);
                        if (info.length() > 1) {
                            TextView tView = (TextView) findViewById(biz.AR.id.search_number_num_txt);
                            tView.setText(searchTxt);
                            tView = (TextView) findViewById(biz.AR.id.search_number_address_txt);
                            tView.setText(info);
                            tView = (TextView) findViewById(biz.AR.id.search_number_type_txt);
                            tView.setText("");
                            return;
                        }
                    } else if (isNumber && !isPost)// 区号
                    {
                        String info = dbManager.SearchArea(searchTxt);
                        if (info.length() > 1) {
                            TextView tView = (TextView) findViewById(biz.AR.id.search_number_num_txt);
                            tView.setText("");
                            tView = (TextView) findViewById(biz.AR.id.search_number_address_txt);
                            tView.setText(info);
                            tView = (TextView) findViewById(biz.AR.id.search_number_type_txt);
                            tView.setText("");
                            return;
                        }
                    } else
                    // 城市查询区号和邮编
                    {
                        String info = dbManager.SearchByCity(searchTxt);
                        if (info.length() > 1)// 查询到结果
                        {
                            TextView tView = (TextView) findViewById(biz.AR.id.search_number_num_txt);
                            tView.setText("");
                            tView = (TextView) findViewById(biz.AR.id.search_number_address_txt);
                            tView.setText(info);
                            tView = (TextView) findViewById(biz.AR.id.search_number_type_txt);
                            tView.setText("");
                            return;
                        }
                    }
                    // 没有查询到结果，继续查询特殊号码
                    {
                        dbManager.openDatabase();
                        String info = dbManager.SearchOtherPhone(searchTxt);
                        if (info.length() > 1) {
                            TextView tView = (TextView) findViewById(biz.AR.id.search_number_num_txt);
                            tView.setText("");
                            tView = (TextView) findViewById(biz.AR.id.search_number_address_txt);
                            tView.setText(info);
                            tView = (TextView) findViewById(biz.AR.id.search_number_type_txt);
                            tView.setText("");
                            return;
                        }
                    }
                    TextView tView = (TextView) findViewById(biz.AR.id.search_number_num_txt);
                    tView.setText("");
                    tView = (TextView) findViewById(biz.AR.id.search_number_address_txt);
                    tView.setText("");
                    tView = (TextView) findViewById(biz.AR.id.search_number_type_txt);
                    tView.setText("");
                }
            }
        });
    }
}
