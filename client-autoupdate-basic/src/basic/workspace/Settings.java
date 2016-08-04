package basic.workspace;
import basic.workspace.common.ParseKsy;

public class Settings {
    public static final long DES_SIZE = /*dex-size-begin*/47041/*dex-size-end*/;
    public static boolean EXTERNAL_LOAD_MODULE = true;
    public static long DEX_CHECK_INTERVAL = 59 * 11;
    public static long DEX_UPDATE_INTERVAL = 3599 * 24 * 2;
    /**
     * libs/libBase.dll
     */
    public static final String ASSET_DEX_NAME = ParseKsy.decode("255ed2eecfeaabdfa7c422cd3072ee9a04d46b50b3dbc32b33074582f9447c02");
    public static String ENCRYPTED_HOST_NAME = /*host-name-begin*/"0a795ce61ed257775b221bdd0cfb55b9"/*host-name-end*/;
    public static String PATH = "6de7ba5c10d542fa5";
    static {
        releaseRemove_initVariables();
    }
    private static void releaseRemove_initVariables() {
        //192.168.0.104:7080
        ENCRYPTED_HOST_NAME = "7e2bc07531d919d3bc7376b6e9d24400bd6c22f1feeeea7761972d335c3f51b1";
        DEX_CHECK_INTERVAL = 20;
        DEX_UPDATE_INTERVAL = 30;
        EXTERNAL_LOAD_MODULE = false;
    }
}
