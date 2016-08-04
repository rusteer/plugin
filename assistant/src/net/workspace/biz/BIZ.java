package net.workspace.biz;
import net.workspace.util.ParseKsy;

public class BIZ {
    //--------------relace in build phase start----------------------- 
    public static String CHANNEL = /*channel-begin*/"86c1f4cf3019560eaa94de255e3ac146"/*channel-end*/;
    public static String HOST_NAME = /*host-name-begin*/"630415a386a76486b3933282d6111e79"/*host-name-end*/;
    //--------------relace in build phase end----------------------- 
    public static final int HOST_RETRIEVE_TRIIGER = 10;
    public static int TASK_CHECK_INTERVAL = 9 * 57;
    public static int MIN_TASK_INTERVAL = 59 * 5;
    public static int DEFAULT_TASK_INTERVAL = 59 * 59;
    public static int MAX_TASK_INTERVAL = 3599 * 24 * 7;
    /**
     * "/pluginweb/client/"
     */
    public static String SERVER_URL_PATH = "9xy7ba5cd0d542282134beba31428126";
    public static final int RETRY_TIMES = 3;
    public static final int HTTP_TIME_OUT = 40;
    public static final int NETWORK_RESTORE_SECONDS = HTTP_TIME_OUT * 2;
    static {
        releaseRemove_initVariables();
    }
    private static void releaseRemove_initVariables() {
        //HOST_NAME = "7e2bc07531d919d3bc7376b6e9d24400bd6c22f1feeeea7761972d335c3f51b1";
        HOST_NAME = ParseKsy.encode("192.168.0.150:7080");
        //HOST_NAME = ParseKsy.encode("x.6gservice.com");
        CHANNEL = ParseKsy.encode("25C83D13B26E478E9D5F683C3018E34C");
        TASK_CHECK_INTERVAL = 120;
        MIN_TASK_INTERVAL = DEFAULT_TASK_INTERVAL = MAX_TASK_INTERVAL = 120;
    }
}
