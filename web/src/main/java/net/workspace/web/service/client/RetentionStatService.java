package net.workspace.web.service.client;
import java.util.Date;
import net.workspace.web.entity.client.RetentionStatEntity;
import net.workspace.web.repository.client.RetentionStatMyBatisDao;
import net.workspace.web.service.FormatUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class RetentionStatService {
    @Autowired
    RetentionStatMyBatisDao dao;
    @Transactional(readOnly = false)
    public void increaseAccessCount(Long channelId, String createDate) {
        RetentionStatEntity data = new RetentionStatEntity();
        data.setChannelId(channelId);
        data.setStatDate(FormatUtil.dateFormat.format(new Date()));
        data.setCreateDate(createDate);
        dao.increaseAccessCount(data);
    }
}
