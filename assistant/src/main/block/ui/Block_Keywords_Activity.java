package main.block.ui;
import java.util.ArrayList;
import main.database.DatabaseAdapter;
import main.ui.Global_Var;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

public class Block_Keywords_Activity extends Activity {
    private ListView keywordsListView;
    private String cKeywrods = "";
    ArrayList<String> keywordsList = new ArrayList<String>();
    private TextView keywords_total;
    private EditText btn_addnew_txt;
    private KeyWordsListAdapter keyWordsListAdapter;
    /**
     * 初始化listview长按上下文菜单
     */
    private void initListView() {
        keywordsListView = (ListView) findViewById(biz.AR.id.block_keywrods_listView);
        keywordsListView.setAdapter(keyWordsListAdapter);
    }
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.block_keywords);
        LinearLayout main = (LinearLayout) findViewById(biz.AR.id.block_keywords_layout);
        main.setBackgroundResource(Global_Var.mainBG_Imges[Global_Var.currMainBGIndex]);
        keywords_total = (TextView) findViewById(biz.AR.id.keywords_total);
        btn_addnew_txt = (EditText) findViewById(biz.AR.id.keywords_add_text);
        keyWordsListAdapter = new KeyWordsListAdapter();
        initListView();
        setaddList();
        refreshData();
    }
    /**
     * 加载私密联系人listview显示数据
     */
    private void refreshData() {
        DatabaseAdapter da = DatabaseAdapter.getInstance(this);
        keywordsList = da.readKeywords();
        keywords_total.setText("目前有" + keywordsList.size() + "个短信过滤关键字");
        // 添加并且显示
        keyWordsListAdapter.notifyDataSetChanged();
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) { // 按下的如果是BACK，同时没有重复
            System.gc();
            Block_Keywords_Activity.this.finish();
            return false;
        }
        return super.onKeyDown(keyCode, event);
    }
    /**
     * 设置点击弹出菜单
     */
    private void setaddList() {
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                Block_Keywords_Activity.this.finish();
            }
        });
        findViewById(biz.AR.id.block_keywrods_add).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String eTxt = btn_addnew_txt.getText().toString().trim();
                if (eTxt.length() == 0) {
                    alert("添加关键字不能为空");
                } else if (keywordsList.contains(eTxt)) {
                    alert("关键字已添加");
                } else if (eTxt.length() >= 7 && eTxt.indexOf(",") == -1) {
                    alert("关键字不符合规则");
                } else {
                    DatabaseAdapter d = DatabaseAdapter.getInstance(Block_Keywords_Activity.this);
                    d.addNewBlockKeyWords(eTxt);
                    keywordsList.clear();
                    keywordsList = d.readKeywords();
                    refreshData();
                    btn_addnew_txt.setText("");
                }
            }
        });
    }
    @Override
    protected void onPause() {
        refreshData();
        super.onPause();
    }
    @Override
    protected Dialog onCreateDialog(int id) {
        Dialog dialog = null;
        if (id == 2)// "删除";
        {
            AlertDialog.Builder builder = new AlertDialog.Builder(this);
            builder.setTitle("删除关键字");
            builder.setMessage("你确定要删除\"" + cKeywrods + "\"吗？");
            DialogInterface.OnClickListener btnListener = new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialogInterface, int which) {
                    DatabaseAdapter d = DatabaseAdapter.getInstance(Block_Keywords_Activity.this);
                    d.delBlockKeyWords(cKeywrods);
                    keywordsList.clear();
                    keywordsList = d.readKeywords();
                    refreshData();
                }
            };
            builder.setPositiveButton("确定", btnListener);
            builder.setNegativeButton("取消", null);
            dialog = builder.create();
        }
        return dialog;
    }
    @Override
    protected void onPrepareDialog(int id, Dialog dialog) {
        removeDialog(id);
        super.onPrepareDialog(id, dialog);
    }
    private void alert(String message) {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setMessage(message);
        builder.setPositiveButton("确定", null);
        Dialog dialog = builder.create();
        dialog.show();
    }
    private class KeyWordsListAdapter extends BaseAdapter {
        @Override
        public int getCount() {
            // TODO Auto-generated method stub 
            return keywordsList.size();
        }
        @Override
        public Object getItem(int position) {
            // TODO Auto-generated method stub 
            return null;
        }
        @Override
        public long getItemId(int position) {
            // TODO Auto-generated method stub 
            return 0;
        }
        @Override
        public boolean isEnabled(int position) {
            // TODO Auto-generated method stub 
            return super.isEnabled(position);
        }
        @Override
        public View getView(final int position, View convertView, ViewGroup parent) {
            // TODO Auto-generated method stub 
            if (convertView == null) {
                convertView = LayoutInflater.from(getApplicationContext()).inflate(biz.AR.layout.block_keywords_listitem, null);
            }
            convertView.setTag(position);
            TextView text = (TextView) convertView.findViewById(biz.AR.id.block_keywords_listitem_item_txt);
            text.setText(keywordsList.get(position));
            Button btn = (Button) convertView.findViewById(biz.AR.id.block_keywords_listitem_item_btn);
            btn.setOnClickListener(new OnClickListener() {
                @Override
                public void onClick(View v) {
                    cKeywrods = keywordsList.get(position);
                    showDialog(2);
                }
            });
            return convertView;
        }
    }
}
