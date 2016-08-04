package net.workspace.web.repository.biz;
import java.util.List;
import java.util.Map;
import net.workspace.web.bean.Stat;
import net.workspace.web.repository.MyBatisRepository;

@MyBatisRepository
public interface BizStatDao {
    List<Stat> getAutoSyncStat(Map<String, Object> parameters);
    List<Stat> getManuSyncStat(Map<String, Object> parameters);
    //---------Group by Biz start-------------
    List<Stat> getStat(Map<String, Object> parameters);
    List<Stat> getSuccessStat(Map<String, Object> parameters);
    List<Stat> getStatWithoutClientTable(Map<String, Object> parameters);
}
