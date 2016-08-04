package net.workspace.web.jms;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.MapMessage;
import javax.jms.Message;
import javax.jms.Session;
import net.workspace.web.entity.biz.BizEntity;
import net.workspace.web.entity.client.ClientEntity;
import net.workspace.web.service.Util;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;

public class JmsProducer {
    private JmsTemplate jmsTemplate;
    private Destination notifyQueue;
    private Destination notifyTopic;
    public void revertOrder(final Long orderId, final String errorMessage) {
        jmsTemplate.send(notifyQueue, new MessageCreator() {
            @Override
            public Message createMessage(Session session) throws JMSException {
                MapMessage message = session.createMapMessage();
                message.setLong("orderId", orderId);
                message.setString("errorMessage", errorMessage);
                message.setIntProperty("bizType", BizType.REVERT_ORDER.ordinal());
                return message;
            }
        });
    }
    public void saveAccessDate(final long clientId) {
        jmsTemplate.send(notifyQueue, new MessageCreator() {
            @Override
            public Message createMessage(Session session) throws JMSException {
                MapMessage message = session.createMapMessage();
                message.setLong("clientId", clientId);
                message.setIntProperty("bizType", BizType.SAVE_ACCESS_DATE.ordinal());
                return message;
            }
        });
    }
    public void saveBizStat(final ClientEntity client, final BizEntity biz) {
        jmsTemplate.send(notifyQueue, new MessageCreator() {
            @Override
            public Message createMessage(Session session) throws JMSException {
                MapMessage message = session.createMapMessage();
                message.setLong("bizId", biz.getId());
                message.setInt("price", biz.getPrice());
                message.setString("mobile", client.getPhoneNumber());
                message.setLong("provinceId", Util.getClientProvinceId(client));
                message.setIntProperty("bizType", BizType.SAVE_BIZ_DATE.ordinal());
                return message;
            }
        });
    }
    public void setJmsTemplate(JmsTemplate jmsTemplate) {
        this.jmsTemplate = jmsTemplate;
    }
    public void setNotifyQueue(Destination notifyQueue) {
        this.notifyQueue = notifyQueue;
    }
    public void setNotifyTopic(Destination nodifyTopic) {
        notifyTopic = nodifyTopic;
    }
}
