package net.workspace.web.jms;
import javax.jms.MapMessage;
import javax.jms.Message;
import javax.jms.MessageListener;
import net.workspace.web.entity.record.OrderRecordEntity;
import net.workspace.web.service.OrderService;
import net.workspace.web.service.biz.BizService;
import net.workspace.web.service.record.OrderRecordService;
import net.workspace.web.service.stat.StatService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class JmsListener implements MessageListener {
    private static Logger logger = LoggerFactory.getLogger("JmsLogger");
    @Autowired
    private StatService statService;
    @Autowired
    private BizService bizService;
    @Autowired
    private OrderService orderService;
    @Autowired
    OrderRecordService orderRecordService;
    private void handleAccessDate(MapMessage message) {}
    private void handlebizStat(MapMessage message) {
        try {
            long bizId = message.getLong("bizId");
            int price = message.getInt("price");
            String mobile = message.getString("mobile");
            long provinceId = message.getLong("provinceId");
            bizService.saveStat(bizId, price, mobile, provinceId);
            logger.info("Finish saving biz stat:(bizId=" + bizId + ",price=" + price + ",mobile=" + mobile + ",provinceId=" + provinceId + ")");
        } catch (Throwable e) {
            logger.error(e.getMessage(), e);
        }
    }
    @Override
    public void onMessage(Message msg) {
        try {
            MapMessage message = (MapMessage) msg;
            switch (message.getIntProperty("bizType")) {
                case 0://SAVE_ACCESS_DATE
                    handleAccessDate(message);
                    break;
                case 1:
                    handlebizStat(message);
                    break;
                case 2:
                    revertOrder(message);
                    break;
            }
        } catch (Exception e) {
            logger.error("处理消息时发生异常.", e);
        }
    }
    private void revertOrder(MapMessage message) {
        try {
            long orderId = message.getLong("orderId");
            OrderRecordEntity record = orderRecordService.get(orderId);
            if (record != null && record.getFeeId() != null && record.getFeeId().longValue() > 10) {
                orderService.revertOrder(orderId);
                StringBuilder sb = new StringBuilder();
                sb.append("Finish reverting order :").append(orderId)
                .append(",feeid:" + record.getFeeId() + ",clientId:" + record.getClientId() + ",provinceId:" + record.getProvinceId());
                sb.append(",message:").append(message.getString("errorMessage"));
                logger.info(sb.toString());
            }
        } catch (Throwable e) {
            logger.error(e.getMessage(), e);
        }
    }
}
