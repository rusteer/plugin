package net.workspace.web.service.channel;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import net.workspace.web.entity.channel.ChannelAccessEntity;
import net.workspace.web.repository.channel.ChannelAccessMyBatisDao;
import net.workspace.web.service.FormatUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class ChannelAccessService {
    @Autowired
    ChannelAccessMyBatisDao dao;
    public long getAccess(String date, long channelId) {
        long result = -1;
        Map<String, Object> parameters = new HashMap<String, Object>();
        parameters.put("channelId", channelId);
        parameters.put("date", date);
        ChannelAccessEntity data = dao.getAccess(parameters);
        if (data != null) {
            result = data.getAccessCount();
        }
        return result;
    }
    public List<ChannelAccessEntity> getList(Long channelId, String fromDate, String toDate) {
        Map<String, Object> parameters = new HashMap<String, Object>();
        parameters.put("channelId", channelId);
        parameters.put("fromDate", fromDate);
        parameters.put("toDate", toDate);
        List<ChannelAccessEntity> result = dao.getList(parameters);
        return result;
    }
    @Transactional(readOnly = false)
    public void increaseAccessCount(Long channelId) {
        ChannelAccessEntity data = new ChannelAccessEntity();
        data.setChannelId(channelId);
        data.setStatDate(FormatUtil.dateFormat.format(new Date()));
        dao.increaseAccessCount(data);
    }
}
