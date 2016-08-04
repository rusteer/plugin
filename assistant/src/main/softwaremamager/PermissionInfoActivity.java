package main.softwaremamager;
import java.util.ArrayList;
import java.util.HashMap;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.PermissionGroupInfo;
import android.content.pm.PermissionInfo;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.TextView;

//import com.ranfeng.androidmaster.R;
/**
 * 软件详细权限信息
 * @author Administrator
 *
 */
public class PermissionInfoActivity extends Activity {
    private ListView mPermissioninfoList;
    //	private ImageView  mPermissioninfo;
    private ImageView mPermissioninfoIcon;
    private TextView mPermissioninfoVersion;
    private TextView mPermissioninfoAppName;
    /**
     * 软件权限信息包名
     */
    public final String PERMISSION_PACKAGENAME = "permission_packageName";
    /**
     * 软件权限信息icon
     */
    public final String PERMISSION_APPICON = "permission_appicon";
    /**
     * 软件权限信息软件名称
     */
    public final String PERMISSION_APPNAME = "permission_appname";
    /**
     * 软件权限信息软件版本
     */
    public final String PERMISSION_APPVERSION = "permission_appversion";
    private final String P_PREMNAME = "p_premName";
    private final String P_LEBLE = "p_leble";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // TODO Auto-generated method stub
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.softwaremanager_permissioninfo_activity);
        mPermissioninfoList = (ListView) findViewById(biz.AR.id.softwareManager_permissioninfo_list);
        //		mPermissioninfoList.setOnItemClickListener(mPermissioninfoListOnItemClickListener);
        mPermissioninfoIcon = (ImageView) findViewById(biz.AR.id.softwareManager_permissioninfo_appcion);
        mPermissioninfoAppName = (TextView) findViewById(biz.AR.id.softwareManager_permissioninfo_appName);
        mPermissioninfoVersion = (TextView) findViewById(biz.AR.id.softwaremanager_permissionmanager_version);
        Intent intent = getIntent();
        String packageName = intent.getStringExtra(PERMISSION_PACKAGENAME);
        String appName = intent.getStringExtra(PERMISSION_APPNAME);
        String appVersion = intent.getStringExtra(PERMISSION_APPVERSION);
        byte[] icon = intent.getByteArrayExtra(PERMISSION_APPICON);
        if (icon.length > 0) {
            Bitmap bp = BitmapFactory.decodeByteArray(icon, 0, icon.length);
            mPermissioninfoIcon.setImageBitmap(bp);
        }
        mPermissioninfoAppName.setText(appName);
        mPermissioninfoVersion.setText(appVersion);
        ArrayList<HashMap<String, Object>> listItem = getPermisson(getApplicationContext(), packageName);
        if (listItem != null) {
            SimpleAdapter adapter = new SimpleAdapter(this, listItem, biz.AR.layout.softwaremanager_permissioninfo_head_item, new String[] { P_PREMNAME, P_LEBLE }, new int[] { biz.AR.id.softwaremanager_permissionmanager_permName,
                    biz.AR.id.softwaremanager_permissionmanager_loadLabel });
            mPermissioninfoList.setAdapter(adapter);
        }
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                PermissionInfoActivity.this.finish();
            }
        });
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) { // 按下的如果是BACK，同时没有重复
            System.gc();
            PermissionInfoActivity.this.finish();
            return false;
        }
        return super.onKeyDown(keyCode, event);
    }
    /**
     * 获得软件权限
     * @param context
     * @param pkgName
     * @return
     */
    private ArrayList<HashMap<String, Object>> getPermisson(Context context, String pkgName) {
        ArrayList<HashMap<String, Object>> listItem = null;
        try {
            PackageManager pm = context.getPackageManager();
            PackageInfo pkgInfo = pm.getPackageInfo(pkgName, PackageManager.GET_PERMISSIONS);//通过包名，返回包信息  
            String sharedPkgList[] = pkgInfo.requestedPermissions;//得到权限列表  
            if (sharedPkgList != null) {
                listItem = new ArrayList<HashMap<String, Object>>();
                for (String premname : sharedPkgList) {
                    HashMap<String, Object> hashMap = new HashMap<String, Object>();
                    PermissionInfo tmpPermInfo = pm.getPermissionInfo(premname, 0);//通过permName得到该权限的详细信息  
                    PermissionGroupInfo pgi = pm.getPermissionGroupInfo(tmpPermInfo.group, 0);//权限分为不同的群组，通过权限名，我们得到该权限属于什么类型的权限。  
                    hashMap.put(P_PREMNAME, pgi.loadLabel(pm).toString());
                    hashMap.put(P_LEBLE, tmpPermInfo.loadLabel(pm).toString());
                    listItem.add(hashMap);
                }
            }
   
        } catch (NameNotFoundException e) {
            Log.w("##ddd", "Could'nt retrieve permissions for package");
        }
        return listItem;
    }
    @Override
    protected void onResume() {
        // TODO Auto-generated method stub
        super.onResume();
    }
}
