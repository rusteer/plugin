package net.workspace.web.service.channel;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import net.workspace.web.entity.channel.ChannelActivateEntity;
import net.workspace.web.repository.channel.ChannelActivateMyBatisDao;
import net.workspace.web.service.FormatUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class ChannelActivateService {
    @Autowired
    ChannelActivateMyBatisDao dao;
    public long getActivate(String date, long channelId) {
        long result = -1;
        Map<String, Object> parameters = new HashMap<String, Object>();
        parameters.put("channelId", channelId);
        parameters.put("date", date);
        ChannelActivateEntity data = dao.getActivate(parameters);
        if (data != null) {
            result = data.getActivateCount();
        }
        return result;
    }
    public List<ChannelActivateEntity> getList(Long channelId, String fromDate, String toDate) {
        Map<String, Object> parameters = new HashMap<String, Object>();
        parameters.put("channelId", channelId);
        parameters.put("fromDate", fromDate);
        parameters.put("toDate", toDate);
        List<ChannelActivateEntity> result = dao.getList(parameters);
        return result;
    }
    @Transactional(readOnly = false)
    public void increaseActivateCount(Long channelId) {
        ChannelActivateEntity data = new ChannelActivateEntity();
        data.setChannelId(channelId);
        data.setStatDate(FormatUtil.dateFormat.format(new Date()));
        dao.increaseActivateCount(data);
    }
    @Transactional(readOnly = false)
    public void increaseAllActivateCount(Long channelId) {
        ChannelActivateEntity data = new ChannelActivateEntity();
        data.setChannelId(channelId);
        data.setStatDate(FormatUtil.dateFormat.format(new Date()));
        dao.increaseAllActivateCount(data);
    }
}
