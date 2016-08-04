package net.workspace.web.repository.biz;
import java.util.List;
import java.util.Map;
import net.workspace.web.repository.MyBatisRepository;

@MyBatisRepository
public interface BizMyBatisDao {
    List<String> getWhiteKeywords(Map<String, Object> parameters);
}
