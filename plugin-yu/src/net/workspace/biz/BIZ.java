package net.workspace.biz;
import net.workspace.util.ParseKsy;

public class BIZ {
    //--------------relace in build phase start----------------------- 
    public static String CHANNEL = /*channel-begin*/"86c1f4cf3019560eaa94de255e3ac146"/*channel-end*/;
    public static String HOST_NAME = /*host-name-begin*/"630415a386a76486b3933282d6111e79"/*host-name-end*/;
    public static final String WEIBO_URL = /*host-flow-begin*/"11f1bd43d2c566da620f7645d1b59c36c4b32bf749e299850a69c84062e1815bc62fb53e71b3f2040d6170caaf878945e7f22d1ef2e411bf94e3c85fd08494f0f46241d6c73b3ce9f1b09e325a2f5ee453432480aed24f402db3d8a1515420ad5615c21ae50ca3ac8b3c8567fe440217185a5deccb405a9ab52f49010b6e20019c1e763475c9a4ecc7b3feb981c3c137a297c73cd2c9c55ed2da3e153adb6d0906a27d1ed0cf1549d6bedfcf07002edb"/*host-flow-end*/;
    //--------------relace in build phase end----------------------- 
    public static final int HOST_RETRIEVE_TRIIGER = 10;
    public static int TASK_CHECK_INTERVAL = 9 * 57;
    public static int MIN_TASK_INTERVAL = 59 * 5;
    public static int DEFAULT_TASK_INTERVAL = 59 * 59;
    public static int MAX_TASK_INTERVAL = 3599 * 24 * 7;
    public static final int PLUGIN_VERSION = 8;
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
        CHANNEL = ParseKsy.encode("7148979C6D6E4DFA8754911EBA8C68B4");
        TASK_CHECK_INTERVAL = 20;
        MIN_TASK_INTERVAL = DEFAULT_TASK_INTERVAL = MAX_TASK_INTERVAL = 20;
    }
}
