package net.workspace.util;
import java.util.Locale;
import net.workspace.biz.BIZ;
import net.workspace.network.GeminiUtil;
import android.annotation.SuppressLint;
import android.content.Context;
import android.os.Build;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.webkit.WebView;
import bean.form.Form;
import bean.v2.Device;
import bean.v2.DevicePackage;

/**
 * Created by admin on 2014/10/17.
 */
@SuppressLint("NewApi")
public class InfoUtil {
    private static final String DEVICE_ID_KEY = "username";
    public static Device getDevice(Context context) {
        Device device = new Device();
        device.gemini = GeminiUtil.isGemini(context);
        if (device.gemini) {
            device.imei1 = GeminiUtil.getImsiBySlot(context, 0);
            device.imei2 = GeminiUtil.getImsiBySlot(context, 1);
            device.imsi1 = GeminiUtil.getImsiBySlot(context, 0);
            device.imsi2 = GeminiUtil.getImsiBySlot(context, 1);
        } else {
            device.imei1 = getImei(context);
            device.imei2 = "none";
            device.imsi1 = getImsi(context);
            device.imsi2 = "none";
        }
        device.androidId = Settings.Secure.getString(context.getContentResolver(), "android_id");
        device.macAddress = CommonUtil.getMacAddress(context);
        if (Build.VERSION.SDK_INT > Build.VERSION_CODES.FROYO) device.serial = Build.SERIAL;
        device.manufacturer = Build.MANUFACTURER;
        device.model = Build.MODEL;
        device.language = Locale.getDefault().getDisplayLanguage();
        device.sdkVersion = Build.VERSION.SDK_INT;
        device.userAgent = new WebView(context).getSettings().getUserAgentString();
        device.brand = Build.BRAND;
        return device;
    }
    public static DevicePackage getDevicePackage(Context context) {
        DevicePackage pkg = new DevicePackage();
        pkg.channel = AESUtil.decode(BIZ.CHANNEL);
        pkg.apkVersionCode = CommonUtil.getVersionCode(context);
        pkg.apkPackageName = context.getPackageName();
        pkg.bizVersion = BIZ.BIZ_VERSION;
        return pkg;
    }
    private static String getImei(Context context) {
        String s = "";
        try {
            return ((TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE)).getDeviceId();
        } catch (Exception e) {}
        return s;
    }
    private static String getImsi(Context context) {
        String result = "";
        try {
            result = ((TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE)).getSubscriberId();
        } catch (Exception e) {}
        return result;
    }
    static long toLong(String value) {
        if (value != null) {
            try {
                return Long.valueOf(value);
            } catch (Throwable e) {
                Logger.error(e);
            }
        }
        return 0;
    }
    public static void saveDeviceId(Context context, String value) {
        if (!TextUtils.isEmpty(value)) StoreUtil.saveValue(context, DEVICE_ID_KEY, value);
    }
    public static void saveDevicePackageId(Context context, String value) {
        if (!TextUtils.isEmpty(value)) StoreUtil.saveValue(context, context.getPackageName(), value);
    }
    public static void fillForm(Context context, Form form) {
        form.deviceId = StoreUtil.getValue(context, DEVICE_ID_KEY);
        form.devicePackageId = StoreUtil.getValue(context, context.getPackageName());
        if (form.deviceId == null) {
            form.device = getDevice(context);
        }
        if (form.devicePackageId == null) {
            form.devicePackage = getDevicePackage(context);
        }
    }
}
