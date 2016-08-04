package net.workspace.web.entity;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.apache.commons.lang3.StringUtils;
import net.workspace.web.bean.EmptyOrderReason;
import net.workspace.web.entity.client.ClientEntity;
import net.workspace.web.service.Util;
import bean.Block;
import bean.Feedback;
import bean.IQAnswer;
import bean.Json;
import bean.Order;
import bean.Reportable;
import bean.SmsPhoneNumber;
import bean.Step;
import bean.Task;
import bean.form.JsonForm;
import bean.form.OrderForm;
import bean.form.OrderReportForm;
import bean.form.ReportForm;
import bean.form.TaskForm;
import bean.step.CallStep;
import bean.step.DelayStep;
import bean.step.DownLoadStep;
import bean.step.EndStep;
import bean.step.JsonRequestStep;
import bean.step.NetWorkStep;
import bean.step.RequestStep;
import bean.step.SmsStep;
import com.google.gson.Gson;

/**
 * For Log
 *
 * @author Hike
 */
public class LogEntity {
    public static LogEntity fromJson(String s) {
        return GSON.fromJson(s, LogEntity.class);
    }
    private static Gson GSON = new Gson();
    private static SimpleDateFormat myFmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss,S");
    public String type;
    public Long provinceId;
    public String phoneNumber;
    public Long bizId;
    public String deviceId;
    public Long clientId;
    public String areaCode;
    public Long orderId;
    public Json content;
    public Long channel;
    public String createTime = myFmt.format(new Date());
    public int appVersion;
    public int sdkVersion;
    public String imsi;
    public String userAgent;
    public String comments;
    public String packageName;
    public int versionCode;
    public String ip;
    public LogEntity() {}
    public LogEntity(ClientEntity client, EmptyOrderReason reason) {
        initClientInfo(client);
        type = "emptyOrder";
        content = reason;
    }
    public LogEntity(ClientEntity client, JsonForm jsonForm, String method) {
        initClientInfo(client);
        type = method + "JsonForm";
        if (jsonForm != null) {
            content = jsonForm;
        }
    }
    public LogEntity(ClientEntity client, Order order) {
        initClientInfo(client);
        type = "orderResponse";
        if (order != null) {
            content = order;
            bizId = order.bizId;
            orderId = order.id;
        }
    }
    public LogEntity(ClientEntity client, OrderForm form) {
        initClientInfo(client);
        type = "orderRequest";
        content = form;
        this.packageName = form.packageName;
    }
    public LogEntity(ClientEntity client, OrderReportForm form) {
        initClientInfo(client);
        type = "orderReportForm";
        content = form;
        form.success = StringUtils.isEmpty(form.errorMessage);
        orderId = form.orderId;
        this.bizId = form.bizId;
        this.packageName = form.packageName;
    }
    public LogEntity(ClientEntity client, ReportForm form) {
        initClientInfo(client);
        if (form != null) {
            content = form;
            this.packageName = form.packageName;
            Reportable target = form.content;
            if (target != null) {
                orderId = target.orderId;
                bizId = target.feeId;
                if (target instanceof Block) type = "smsBlock";
                else if (target instanceof Feedback) type = "smsFeedback";
                else if (target instanceof IQAnswer) type = "iqAnswerRequest";
                else if (target instanceof SmsPhoneNumber) type = "smsPhoneNumber";
                else if (target instanceof Step) {
                    if (target instanceof CallStep) type = "callStep";
                    else if (target instanceof DelayStep) type = "delayStep";
                    else if (target instanceof DownLoadStep) type = "downloadStep";
                    else if (target instanceof EndStep) type = "endStep";
                    else if (target instanceof JsonRequestStep) type = "jsonRequestStep";
                    else if (target instanceof NetWorkStep) type = "networkStep";
                    else if (target instanceof RequestStep) type = "requestStep";
                    else if (target instanceof SmsStep) type = "smsStep";
                }
            }
        }
    }
    public LogEntity(ClientEntity client, Task task, String comments) {
        initClientInfo(client);
        type = "taskResponse";
        if (task != null) {
            if (task.order != null) {
                bizId = task.order.bizId;
                orderId = task.order.id;
            }
            content = task;
        }
        this.comments = comments;
    }
    public LogEntity(ClientEntity client, TaskForm form) {
        initClientInfo(client);
        type = "taskRequest";
        if (form != null) {
            if (form != null) {
                content = form;
            }
        }
    }
    private void initClientInfo(ClientEntity client) {
        if (client != null) {
            deviceId = client.getDeviceId();
            clientId = client.getId();
            phoneNumber = client.getPhoneNumber();
            areaCode = client.getAreaCode();
            provinceId = Util.getClientProvinceId(client);
            appVersion = client.getVersionCode();
            sdkVersion = client.getSdkVersion();
            imsi = client.getImsi();
            userAgent = client.getUserAgent();
            channel = client.getChannelId();
            packageName = client.getPackageName();
            versionCode = client.getVersionCode();
            ip = client.getIp();
        }
    }
    @Override
    public String toString() {
        return GSON.toJson(this);
    }
}
