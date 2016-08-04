package main.systemoptimization.utils;
import java.util.ArrayList;
import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

/**
 * 共用列表弹出框
 * 打开列表弹出框用法： 
 *  ArrayList<String> array=new ArrayList<String>();
		array.add("01");
		array.add("02");
		array.add("03");
		Intent intent = new Intent(this, ListViewDialog.class); 
		intent.putExtra(Constants.EXTRAS_COMPONENTS_ICON, biz.AR.drawable.icon);//设置icon
		intent.putExtra(Constants.EXTRAS_COMPONENTS_TITLE, "标题");//设置标题
		intent.putStringArrayListExtra(Constants.EXTRAS_COMPONENTS_ARRAYLIST, array);//设置列表数据
        startActivityForResult(intent, KEYWORD); 
    获取列表返回值：
    @Override 
	protected void onActivityResult(int requestCode, int resultCode, Intent data) { 
		//如果是列表弹出框返回的话
	    if (requestCode == KEYWORD) { 
	        if (resultCode == RESULT_OK) { 
	        	int position=data.getExtras().getInt(Constants.EXTRAS_COMPONENTS_ONITEMCLICK_POSITION);
	        	Log.i(LOG,""+position);
	        } 
	    } 
	} 
 * @author 唐晓泽
 *
 */
public class ListViewDialog extends Activity {
    private ImageView icon;
    private TextView title;
    private ListView listView;
    private int iconResId;
    private String titleStr;
    private ArrayList<String> arrayList;
    private LinearLayout mTitleLayout;
    @Override
    protected void onDestroy() {
        arrayList.clear();
        super.onDestroy();
    }
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.system_list_dialog);
        icon = (ImageView) findViewById(biz.AR.id.system_List_Dialog_Icon);
        title = (TextView) findViewById(biz.AR.id.system_List_Dialog_Title);
        listView = (ListView) findViewById(biz.AR.id.system_List_Dialog_ListView);
        mTitleLayout = (LinearLayout) findViewById(biz.AR.id.system_list_title_layout);
        mTitleLayout.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                System.gc();
                finish();
            }
        });
        arrayList = new ArrayList<String>();
        Bundle extras = getIntent().getExtras();
        if (extras != null) {
            iconResId = extras.getInt(SystemConstants.EXTRAS_COMPONENTS_ICON);
            titleStr = extras.getString(SystemConstants.EXTRAS_COMPONENTS_TITLE);
            arrayList = extras.getStringArrayList(SystemConstants.EXTRAS_COMPONENTS_ARRAYLIST);
            if (iconResId != 0) {//如果存在icon的id，则设置图标
                setIcon(iconResId);
            }
            if (titleStr != null) {//如果存在title，则设置标题
                setTitle(titleStr);
            }
        }
        listView.setAdapter(new ArrayAdapter<String>(this, biz.AR.layout.system_list_item_dialog, arrayList));
        listView.setOnItemClickListener(new OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Bundle bundle = new Bundle();
                bundle.putInt(SystemConstants.EXTRAS_COMPONENTS_ONITEMCLICK_POSITION, position);
                setResult(RESULT_OK, getIntent().putExtras(bundle));
                System.gc();
                finish();
            }
        });
    }
    /**
     * 设置左上角图标
     * @param resId
     */
    private void setIcon(int resId) {
        icon.setImageResource(resId);
    }
    /**
     * 设置标题
     * @param titleStr
     */
    private void setTitle(String titleStr) {
        title.setText(titleStr);
    }
}
