package net.workspace.web.repository.client;
import java.util.List;
import java.util.Map;
import net.workspace.web.bean.ChannelStat;
import net.workspace.web.bean.ClientDailyStat;
import net.workspace.web.bean.DateClientCount;
import net.workspace.web.bean.ProvinceClientCount;
import net.workspace.web.repository.MyBatisRepository;

@MyBatisRepository
public interface ClientMyBatisDao {
    List<DateClientCount> getAllAccessClientCountBySingleDate(Map<String, Object> parameters);
    long getChannelClientCount(long channelId);
    List<ChannelStat> getChannelNewCount(Map<String, Object> parameters);
    List<ChannelStat> getChannelReactivateCount(Map<String, Object> parameters);
    List<ClientDailyStat> getDailyAccessCount(Map<String, Object> parameters);
    List<DateClientCount> getDailyAllAccessClientCount(Map<String, Object> parameters);
    //---------Group by Date end-------------
    List<DateClientCount> getDailyNewCount(Map<String, Object> parameters);
    List<DateClientCount> getDailyReactivateCount(Map<String, Object> parameters);
    /**
     * 查看留存用户
     *
     * @param parameters
     * @return
     */
    List<ProvinceClientCount> getProvinceAccessCount(Map<String, Object> parameters);
    List<ProvinceClientCount> getProvinceNewCount(Map<String, Object> parameters);
    List<Integer> getSdkVersionList();
}
