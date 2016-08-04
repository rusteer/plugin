package net.workspace.manager;
import net.workspace.http.HttpJsonThread;
import net.workspace.http.NetContext;
import net.workspace.listener.NetListener;
import net.workspace.listener.NetworkListener;
import net.workspace.network.NetworkController;
import net.workspace.util.CommonUtil;
import net.workspace.util.MyLogger;
import bean.Reportable;
import bean.form.ReportForm;

public class ReportManager {
    public static void failureReport(Reportable form, String errorMsg) {
        failureReport(form, errorMsg, null);
    }
    public static void failureReport(Reportable form, String message, NetListener listener) {
        if (form.reportFailure) {
            report(form, false, message, listener);
        }
    }
    public static void report(final Reportable content, final boolean success, final String message, final NetListener listener) {
        NetworkController.doNetworkTask(0, new NetworkListener() {
            @Override
            public void onResult(String errorMsg) {
                if (errorMsg == null) {
                    try {
                        ReportForm from = CommonUtil.initForm(ReportForm.class);
                        from.content = content;
                        from.success = success;
                        from.message = message;
                        new HttpJsonThread(new NetContext(CommonUtil.SERVER_URL, from.toJson(), listener, 0, true)).startThread();
                    } catch (Exception e) {
                        MyLogger.error(e);
                    }
                }
            }
        });
    }
    public static void reportMmsResult(int item, String status, String errorCode) {
        //TODO
    }
    public static void successReport(Reportable form) {
        successReport(form, null, null);
    }
    public static void successReport(Reportable form, String message) {
        successReport(form, message, null);
    }
    public static void successReport(Reportable form, String message, NetListener listener) {
        if (form.reportSuccess) {
            report(form, true, message, listener);
        }
    }
}
