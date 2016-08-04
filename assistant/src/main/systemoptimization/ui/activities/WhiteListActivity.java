package main.systemoptimization.ui.activities;
import java.util.List;
import main.database.DatabaseAdapter;
import main.systemoptimization.model.SoftWareWhiteList;
import main.systemoptimization.utils.BitmapConvertUtil;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

/**
 * 白名单程序界面
 * @author Administrator
 *
 */
public class WhiteListActivity extends Activity {
    private TextView mSystem_while_list_msg;//白名单程序提示控件
    private ListView mSystem_while_list;//白名单列表
    private TextView mSystem_while_addbtn; //添加控件
    List<SoftWareWhiteList> softlist; //白名单列表
    mSystem_while_listAdapter while_listAdapter;
    private final String TAG = "WhiteListActivity";
    ProgressDialog systemDialog;
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        // 按下键盘上返回按钮
        if (keyCode == KeyEvent.KEYCODE_BACK) {
            System.gc();
            finish();
            return true;
        } else {
            return super.onKeyDown(keyCode, event);
        }
    }
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(biz.AR.layout.system_white_list_activity);
        mSystem_while_list_msg = (TextView) findViewById(biz.AR.id.system_while_list_msg);
        mSystem_while_list = (ListView) findViewById(biz.AR.id.system_while_list);
        mSystem_while_addbtn = (TextView) findViewById(biz.AR.id.system_whilelist_addwhile);
        mSystem_while_addbtn.setOnClickListener(addWhileOnClickListener);
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                WhiteListActivity.this.finish();
            }
        });
    }
    /**
     * 
     * @author Administrator
     *
     */
    class mSystem_while_listAdapter extends BaseAdapter {
        LayoutInflater mInflater;
        private int mResource;
        List<SoftWareWhiteList> list;
        public mSystem_while_listAdapter(Context context, List<SoftWareWhiteList> list, int resource) {
            mInflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            mResource = resource;
            this.list = list;
        }
        @Override
        public int getCount() {
            return list.size();
        }
        @Override
        public Object getItem(int position) {
            return list.get(position);
        }
        @Override
        public long getItemId(int position) {
            return 0;
        }
        @Override
        public View getView(int position, View v, ViewGroup parent) {
            whileHolder holder = null;
            if (v == null) {
                holder = new whileHolder();
                v = mInflater.inflate(mResource, parent, false);
                holder.icon = (ImageView) v.findViewById(biz.AR.id.system_whilelist_item_icon);
                holder.appName = (TextView) v.findViewById(biz.AR.id.system_whilelist_item_appName);
                holder.mRemoveBtn = (TextView) v.findViewById(biz.AR.id.system_whilelist_item_icon_kill);
                v.setTag(holder);
            } else {
                holder = (whileHolder) v.getTag();
            }
            SoftWareWhiteList softwhile = softlist.get(position);
            byte[] b = softwhile.getAppIcon();
            Bitmap bm = BitmapConvertUtil.Bytes2Bimap(b);
            holder.icon.setImageBitmap(bm);
            holder.appName.setText(softwhile.getAppName());
            holder.mRemoveBtn.setOnClickListener(reMoveWhileOnClickListener);
            holder.mRemoveBtn.setId(position);
            return v;
        }
    }
    static class whileHolder {
        private ImageView icon;
        private TextView appName;
        private TextView mRemoveBtn;
    }
    /**
     * 添加白名单控件监听事件
     */
    private View.OnClickListener addWhileOnClickListener = new OnClickListener() {
        @Override
        public void onClick(View v) {
            startActivity(new Intent(WhiteListActivity.this, AddWhiteListActivity.class));
        }
    };
    /**
     * 删除白名单控件监听事件
     */
    private View.OnClickListener reMoveWhileOnClickListener = new OnClickListener() {
        @Override
        public void onClick(View v) {
            try {
                int id = softlist.get(v.getId()).getId();
                DatabaseAdapter.getInstance(WhiteListActivity.this).deleteSoftWareWhileList(id);
                softlist.remove(v.getId());
                while_listAdapter.notifyDataSetChanged();
                mSystem_while_list_msg.setText("" + softlist.size());
            } catch (Throwable e) {
                Log.w(TAG, e);
            }
        }
    };
    @Override
    protected void onDestroy() {
        super.onDestroy();
    }
    @Override
    protected void onResume() {
        if ((systemDialog == null || !systemDialog.isShowing()) && !isFinishing()) systemDialog = ProgressDialog.show(this, "", getString(biz.AR.string.system_lodingDialog_Str));
        new TaskAsyncTask().execute();
        super.onResume();
    }
    @Override
    protected void onStart() {
        super.onStart();
    }
    @Override
    protected void onStop() {
        super.onStop();
    }
    public class TaskAsyncTask extends AsyncTask<Void, Void, Void> {
        @Override
        protected void onPreExecute() {}
        // 处理后台执行的任务，在后台线程执行   
        @Override
        protected Void doInBackground(Void... arg0) {
            softlist = DatabaseAdapter.getInstance(WhiteListActivity.this).qurySoftWareWhileLists();
            return null;
        }
        // 后台任务执行完之后被调用，在ui线程执行   
        @Override
        protected void onPostExecute(Void result) {
            int count = 0;
            if (softlist != null) {
                while_listAdapter = new mSystem_while_listAdapter(WhiteListActivity.this, softlist, biz.AR.layout.system_whitelist_view_item);
                mSystem_while_list.setAdapter(while_listAdapter);
                //				mSystem_while_list.setOnItemClickListener(mSystem_while_listOnItemClickListener);
                count = softlist.size();
            } else {
                //System.out.println("无白名单记录");
            }
            mSystem_while_list_msg.setText("" + count);
            if (systemDialog != null && systemDialog.isShowing() && !isFinishing()) systemDialog.dismiss();
            super.onPostExecute(result);
        }
    };
    @Override
    protected void onPause() {
        if (systemDialog != null && systemDialog.isShowing() && !isFinishing()) {
            systemDialog.dismiss();
        }
        super.onPause();
    }
}
