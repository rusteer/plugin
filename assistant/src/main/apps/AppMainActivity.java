package main.apps;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileFilter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.regex.Pattern;
import main.batterymanager.BatteryManagerMainActivity;
import main.softwaremamager.SoftWareManagerMainActivity;
import main.systemoptimization.ui.activities.SystemOptimizationActivity;
import net.workspace.util.Logger;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Environment;
import android.os.StatFs;
import android.telephony.TelephonyManager;
import android.text.format.Formatter;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

public class AppMainActivity extends Activity implements OnClickListener {
    private LinearLayout mAppsBtn_optimization;
    private LinearLayout mAppsBtn_softwaremanager;
    private LinearLayout mAppsBtn_batterymanager;
    private TextView mPhone_model;
    private TextView mOSval_model;
    private TextView mPhone_imei;
    private TextView mCPUmodel;
    private TextView mCPUmaxspeed;
    private TextView mCPUminspeed;
    private TextView mRUNingMemory;
    private TextView mTotalMemory;
    private TextView mSDMemory;
    private TextView mScreeninfo;
    private TextView mPixel_density;
    private TextView mPhone_Nduo;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // TODO Auto-generated method stub
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.apps_activity);
        mAppsBtn_optimization = (LinearLayout) findViewById(biz.AR.id.apps_btn_optimization);
        mAppsBtn_optimization.setOnClickListener(this);
        mAppsBtn_softwaremanager = (LinearLayout) findViewById(biz.AR.id.apps_btn_softwaremanager);
        mAppsBtn_softwaremanager.setOnClickListener(this);
        mAppsBtn_batterymanager = (LinearLayout) findViewById(biz.AR.id.apps_btn_batterymanager);
        mAppsBtn_batterymanager.setOnClickListener(this);
        mPhone_model = (TextView) findViewById(biz.AR.id.apps_phone_model);
        mOSval_model = (TextView) findViewById(biz.AR.id.apps_osval_model);
        mPhone_imei = (TextView) findViewById(biz.AR.id.apps_phone_imei);
        mCPUmodel = (TextView) findViewById(biz.AR.id.apps_phone_CPUmodel);
        mCPUmaxspeed = (TextView) findViewById(biz.AR.id.apps_phone_CPUmaxspeed);
        mCPUminspeed = (TextView) findViewById(biz.AR.id.apps_phone_CPUminspeed);
        mRUNingMemory = (TextView) findViewById(biz.AR.id.apps_phone_RUNingMemory);
        mTotalMemory = (TextView) findViewById(biz.AR.id.apps_phone_TotalMemory);
        mSDMemory = (TextView) findViewById(biz.AR.id.apps_phone_SDMemory);
        mScreeninfo = (TextView) findViewById(biz.AR.id.apps_phone_screendp);
        mPixel_density = (TextView) findViewById(biz.AR.id.apps_phone_Pixel_density);
        mPhone_Nduo = (TextView) findViewById(biz.AR.id.apps_phone_Nduo);
        ImageView back = (ImageView) findViewById(biz.AR.id.back);
        back.setOnClickListener(this);
        initPhoneInfo();
    }
    /*
     * 初始化手机信息
     */
    private void initPhoneInfo() {
        try {
            mPhone_model.setText(android.os.Build.MODEL);
        } catch (Throwable e) {
            mPhone_model.setText("无法获取");
        }
        try {
            mOSval_model.setText("android" + android.os.Build.VERSION.RELEASE);
        } catch (Throwable e) {
            mOSval_model.setText("无法获取");
        }
        try {
            TelephonyManager mTelephonyMgr = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
            String imei = mTelephonyMgr.getDeviceId().trim();
            mPhone_imei.setText(imei);
        } catch (Throwable e) {
            mPhone_imei.setText("无法获取");
        }
        try {
            //获取CPU信息
            String cpuname = getCpuName();
            String cupcore = getCPUCoresStr();
            if ((cpuname == null || cpuname.trim().length() == 0) && (cupcore == null || cupcore.trim().length() == 0)) {
                mCPUmodel.setText("无法获取");
            } else if (cpuname == null || cpuname.trim().length() == 0) {
                mCPUmodel.setText(cupcore);
            } else if (cupcore == null || cupcore.trim().length() == 0) {
                mCPUmodel.setText(cpuname);
            } else {
                mCPUmodel.setText(cpuname + "(" + cupcore + ")");
            }
            //mCPUmodel.setText(getCpuName());
            String max = getMaxCpuFreq();
            String min = getMinCpuFreq();
            try {
                if (max == null || max.equals("")) {
                    mCPUmaxspeed.setText("无法获取");
                } else if (max.length() > 6) {
                    float f = Float.parseFloat(max) / 1000000f;
                    if (f > 10f) mCPUmaxspeed.setText((int) f + "Ghz");
                    else mCPUmaxspeed.setText(parse(f + "") + "Ghz");
                } else if (max.length() > 3) {
                    float f = Float.parseFloat(max) / 1000f;
                    if (f > 10f) mCPUmaxspeed.setText((int) f + "Mhz");
                    else mCPUmaxspeed.setText(parse(f + "") + "Mhz");
                } else {
                    mCPUmaxspeed.setText(max + "Khz");
                }
                if (min == null || min.equals("")) {
                    mCPUminspeed.setText("无法获取");
                } else if (min.length() > 6) {
                    float f = Float.parseFloat(min) / 1000000f;
                    if (f > 10f) mCPUminspeed.setText((int) f + "Ghz");
                    else mCPUminspeed.setText(parse(f + "") + "Ghz");
                } else if (min.length() > 3) {
                    float f = Float.parseFloat(min) / 1000f;
                    if (f > 10f) mCPUminspeed.setText((int) f + "Mhz");
                    else mCPUminspeed.setText(parse(f + "") + "Mhz");
                } else {
                    mCPUminspeed.setText(min + "Khz");
                }
            } catch (Exception e1) {}
        } catch (Throwable e) {
            Logger.error(e);
        }
        try {
            //获取内存信息 ----第28 29 行
            mRUNingMemory.setText(getTotalMemory());
            File path = Environment.getDataDirectory();
            StatFs stat = new StatFs(path.getPath());
            long blockSize = stat.getBlockSize();
            //long availableBlocks = stat.getAvailableBlocks();
            // 手机内存剩余容量
            //long memoryAvail = availableBlocks * blockSize;
            long totalBlocks = stat.getBlockCount();
            // 手机内存总容量
            long memorySize = totalBlocks * blockSize;
            mTotalMemory.setText("" + formatFileSize(memorySize));
            //加判断有无SD卡
            File paths = Environment.getExternalStorageDirectory();
            StatFs statfs = new StatFs(paths.getPath());
            blockSize = statfs.getBlockSize();
            totalBlocks = statfs.getBlockCount();
            //availableBlocks= statfs.getAvailableBlocks();
            // SD卡总容量
            long sdSize = totalBlocks * blockSize;
            mSDMemory.setText(formatFileSize(sdSize));
        } catch (Throwable e) {
            Logger.error(e);
        }
        //获取屏幕信息
        try {
            DisplayMetrics metric = new DisplayMetrics();
            getWindowManager().getDefaultDisplay().getMetrics(metric);
            int width = metric.widthPixels; // 屏幕宽度（像素）
            int height = metric.heightPixels; // 屏幕高度（像素）
            //  float density = metric.density;  // 屏幕密度（0.75 / 1.0 / 1.5）
            int densityDpi = metric.densityDpi; // 屏幕密度DPI（120 / 160 / 240）
            mScreeninfo.setText(String.valueOf(width) + " x " + String.valueOf(height));
            mPixel_density.setText(String.valueOf(densityDpi) + "Dpi");
            mPhone_Nduo.setText(biz.AR.string.phone_support_str);
        } catch (Throwable e) {
            Logger.error(e);
        }
    }
    /**
     * 获得系统总内存
     * @return
     */
    private String getTotalMemory() {
        String str1 = "/proc/meminfo";// 系统内存信息文件 
        String str2;
        String[] arrayOfString;
        long initial_memory = 0;
        try {
            FileReader localFileReader = new FileReader(str1);
            BufferedReader localBufferedReader = new BufferedReader(localFileReader, 8192);
            str2 = localBufferedReader.readLine();// 读取meminfo第一行，系统总内存大小 
            arrayOfString = str2.split("\\s+");
            for (String num : arrayOfString) {
                Log.i(str2, num + "\t");
            }
            initial_memory = Integer.valueOf(arrayOfString[1]).intValue() * 1024;// 获得系统总内存，单位是KB，乘以1024转换为Byte     
            localBufferedReader.close();
        } catch (Throwable e) {}
        // Byte转换为KB或者MB，内存大小规格化
        return Formatter.formatFileSize(getBaseContext(), initial_memory);
    }
    // 获取CPU最大频率（单位KHZ）
    // "/system/bin/cat" 命令行
    // "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq" 存储最大频率的文件的路径
    public static String getMaxCpuFreq() {
        String result = "";
        ProcessBuilder cmd;
        try {
            String[] args = { "/system/bin/cat", "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq" };
            cmd = new ProcessBuilder(args);
            Process process = cmd.start();
            InputStream in = process.getInputStream();
            byte[] re = new byte[24];
            while (in.read(re) != -1) {
                result = result + new String(re);
            }
            in.close();
        } catch (Exception ex) {
            ex.printStackTrace();
            result = "N/A";
        }
        Log.i("cpuinfo", result);
        return result.trim();
    }
    // 获取CPU最小频率（单位KHZ）
    public static String getMinCpuFreq() {
        String result = "";
        ProcessBuilder cmd;
        try {
            String[] args = { "/system/bin/cat", "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq" };
            cmd = new ProcessBuilder(args);
            Process process = cmd.start();
            InputStream in = process.getInputStream();
            byte[] re = new byte[24];
            while (in.read(re) != -1) {
                result = result + new String(re);
            }
            in.close();
        } catch (Exception ex) {
            ex.printStackTrace();
            result = "N/A";
        }
        Log.i("cpuinfo", result);
        return result.trim();
    }
    // 实时获取CPU当前频率（单位KHZ）
    public static String getCurCpuFreq() {
        String result = "N/A";
        try {
            FileReader fr = new FileReader("/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq");
            BufferedReader br = new BufferedReader(fr);
            String text = br.readLine();
            result = text.trim();
            br.close();
        } catch (Throwable e) {}
        return result;
    }
    // 获取CPU名字
    public static String getCpuName() {
        try {
            FileReader fr = new FileReader("/proc/cpuinfo");
            BufferedReader br = new BufferedReader(fr);
            String text = br.readLine();
            String[] array = text.split(":\\s+", 2);
            br.close();
            return array[1];
        } catch (FileNotFoundException e) {
            Logger.error(e);
        } catch (IOException e) {
            Logger.error(e);
        }
        return "";
    }
    /**
     * 获取文件大小
     * 
     * @param length
     * @return
     */
    private String formatFileSize(long length) {
        String result = "";
        int sub_string = 0;
        if (length >= 1073741824) {
            sub_string = String.valueOf((float) length / 1073741824).indexOf(".");
            result = ((float) length / 1073741824 + "000").substring(0, sub_string + 3) + "GB";
        } else if (length >= 1048576) {
            sub_string = String.valueOf((float) length / 1048576).indexOf(".");
            result = ((float) length / 1048576 + "000").substring(0, sub_string + 3) + "MB";
        } else if (length >= 1024) {
            sub_string = String.valueOf((float) length / 1024).indexOf(".");
            result = ((float) length / 1024 + "000").substring(0, sub_string + 3) + "KB";
        } else if (length < 1024) result = Long.toString(length) + "B";
        return result;
    }
    @Override
    protected void onDestroy() {
        super.onDestroy();
    }
    @Override
    protected void onResume() {
        super.onResume();
    }
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
    public void onClick(View v) {
        switch (v.getId()) {
            case biz.AR.id.apps_btn_optimization:
                startActivity(new Intent(AppMainActivity.this, SystemOptimizationActivity.class));
                break;
            case biz.AR.id.apps_btn_softwaremanager:
                startActivity(new Intent(AppMainActivity.this, SoftWareManagerMainActivity.class));
                break;
            case biz.AR.id.apps_btn_batterymanager:
                startActivity(new Intent(AppMainActivity.this, BatteryManagerMainActivity.class));
                break;
            case biz.AR.id.back:
                System.gc();
                AppMainActivity.this.finish();
                break;
            default:
                break;
        }
    }
    private int getCPUNumCores() {
        //Private Class to display only CPU devices in the directory listing 
        class CpuFilter implements FileFilter {
            @Override
            public boolean accept(File pathname) {
                //Check if filename is "cpu", followed by a single digit number 
                if (Pattern.matches("cpu[0-9]", pathname.getName())) { return true; }
                return false;
            }
        }
        try {
            //Get directory containing CPU info 
            File dir = new File("/sys/devices/system/cpu/");
            //Filter to only list the devices we care about 
            File[] files = dir.listFiles(new CpuFilter());
            return files.length;
        } catch (Throwable e) {
            Logger.error(e);
            //Default to return 1 core 
            return 1;
        }
    }
    private String getCPUCoresStr() {
        int i = getCPUNumCores();
        String result = "";
        switch (i) {
            case 0:
                result = "";
                break;
            case 1:
                result = "单核";
                break;
            case 2:
                result = "双核";
                break;
            default:
                result = i + "核";
                break;
        }
        return result;
    }
    private String parse(String number) {
        BigDecimal bd = new BigDecimal(number);
        bd = bd.setScale(1, BigDecimal.ROUND_HALF_UP);
        return String.valueOf(bd);
    }
}
