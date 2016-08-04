package net.workspace.web.web.plugin;
import javax.servlet.http.HttpServletRequest;
import net.workspace.web.entity.LogEntity;
import net.workspace.web.entity.client.ClientEntity;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Component;
import bean.Json;
import bean.form.OrderReportForm;

@Component
public class OrderReportWorker extends Worker {
    @Override
    public String execute(HttpServletRequest request, JSONObject obj) throws Exception {
        OrderReportForm form = Json.optObj(OrderReportForm.class, obj);
        String deviceId = form.deviceId;
        ClientEntity client = clientService.findByDeviceId(deviceId);
        checkAreaByIp(request, client);
        log(request, new LogEntity(client, form));
        boolean success = StringUtils.isEmpty(form.errorMessage);
        if (success) {
            this.orderRecordService.setSuccess(form.orderId);
        }
        return null;
    }
}
