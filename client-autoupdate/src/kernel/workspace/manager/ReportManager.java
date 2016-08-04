package kernel.workspace.manager;
import kernel.workspace.http.HttpJsonThread;
import kernel.workspace.http.NetContext;
import kernel.workspace.listener.NetListener;
import kernel.workspace.listener.NetworkListener;
import kernel.workspace.network.NetworkController;
import kernel.workspace.util.Logger;
import kernel.workspace.util.T;
import org.json.JSONException;
import android.content.Context;
import bean.Reportable;
import bean.form.ReportForm;

public class ReportManager {
    public static void reportMmsResult(int item, String status, String errorCode) {
        //TODO
    }
    public static void successReport(Context context, Reportable form, String message, NetListener listener) {
        if (form.reportSuccess) {
            report(context, form, true, message, listener);
        }
    }
    public static void successReport(Context context, Reportable form) {
        successReport(context, form, null, null);
    }
    public static void successReport(Context context, Reportable form, String message) {
        successReport(context, form, message, null);
    }
    public static void failureReport(Context context, Reportable form, String message, NetListener listener) {
        if (form.reportFailure) {
            report(context, form, false, message, listener);
        }
    }
    public static void failureReport(Context context, Reportable form, String errorMsg) {
        failureReport(context, form, errorMsg, null);
    }
    public static void report(final Context context, final Reportable form, final boolean success, final String message, final NetListener listener) {
        NetworkController.doNetworkTask(context, 0, new NetworkListener() {
            @Override
            public void onResult(String errorMsg) {
                if (errorMsg == null) {
                    ReportForm reportForm = new ReportForm(form, success, message);
                    T.fillForm(reportForm);
                    try {
                        new HttpJsonThread(context, new NetContext(T.SERVER_URL, reportForm.toJson(), listener, 0, true)).startThread();
                    } catch (JSONException e) {
                        Logger.error(e);
                    }
                }
            }
        });
    }
}
