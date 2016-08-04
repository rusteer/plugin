package net.workspace.web.web.plugin;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import net.workspace.web.bean.EmptyOrderReason;
import net.workspace.web.bean.GetBizResult;
import net.workspace.web.bean.GetOrderResult;
import net.workspace.web.entity.LogEntity;
import net.workspace.web.entity.client.ClientEntity;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Component;
import bean.Json;
import bean.Order;
import bean.form.OrderForm;

@Component
public class OrderWorker extends Worker {
    @Override
    public String execute(HttpServletRequest request, JSONObject input) throws Exception {
        OrderForm form = Json.optObj(OrderForm.class, input);
        ClientEntity client = clientService.findByDeviceId(form.deviceId);
        checkAreaByIp(request, client);
        log(request, new LogEntity(client, form));
        int pluginVersion = client.getPluginVersion();
        return pluginVersion < 11 ? executeOldVersion(request, client) : executeNewVersion(request, client);
    }
    private String executeNewVersion(HttpServletRequest request, ClientEntity client) throws Exception {
        int orderCount = 3;
        List<Order> list = new ArrayList<Order>();
        Set<Long> ignoreBizIdSet = new HashSet<Long>();
        for (int i = 0; i < orderCount; i++) {
            GetOrderResult result = orderService.getOrder(client, ignoreBizIdSet);
            if (result.order != null) {
                log(request, new LogEntity(client, result.order));
                list.add(result.order);
                ignoreBizIdSet.add(result.order.bizId);
            } else {
                if (list.size() == 0) {
                    log(request, new LogEntity(client, new EmptyOrderReason(result.reason)));
                }
                break;
            }
        }
        if (list.size() > 0) return Json.toJson(list).toString();
        return null;
    }
    private String executeOldVersion(HttpServletRequest request, ClientEntity client) throws Exception, JSONException {
        Set<Long> ignoreBizIdSet = new HashSet<Long>();
        GetOrderResult result = orderService.getOrder(client, ignoreBizIdSet);
        if (result.order != null) {
            ignoreBizIdSet.add(result.order.bizId);
            checkNextOrder(client, result, ignoreBizIdSet);
            log(request, new LogEntity(client, result.order));
            return result.order.toJson().toString();
        }
        log(request, new LogEntity(client, new EmptyOrderReason(result.reason)));
        return null;
    }
    private void checkNextOrder(ClientEntity client, GetOrderResult result, Set<Long> ignoreBizIdSet) {
        GetBizResult nextBiz = bizService.getBiz(client, ignoreBizIdSet);
        if (nextBiz != null) {
            result.order.continueNext = true;
        }
    }
}
