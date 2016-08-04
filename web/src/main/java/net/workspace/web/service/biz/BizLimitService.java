package net.workspace.web.service.biz;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import net.workspace.web.entity.biz.BizLimitEntity;
import net.workspace.web.repository.biz.BizLimitDao;
import net.workspace.web.service.AbstractService;
import net.workspace.web.service.FormatUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;

@Component
@Transactional(readOnly = true)
public class BizLimitService extends AbstractService<BizLimitEntity> {
    public static void main(String args[]) {
        String info = "1,0|2,-1|3,0|4,0|5,-1|6,-1|7,-1|8,-1|9,-1|11,-1|12,-1|13,-1|14,-1|15,0|17,-1|16,0|19,-1|18,-1|21,-1|20,-1|23,0|22,0|25,0|24,0|27,-1|26,-1|29,0|28,-3|31,0|30,-1";
        Map<Long, Long> map = toMap(info);
        System.out.println(map);
    }
    private static Map<Long, Long> toMap(String content) {
        Map<Long, Long> map = new HashMap<Long, Long>();
        if (StringUtils.isNotBlank(content)) {
            String[] parts = content.split("\\|");
            for (String part : parts) {
                if (StringUtils.isNotBlank(part)) {
                    String[] field = part.split(",");
                    map.put(Long.valueOf(field[0]), Long.valueOf(field[1]));
                }
            }
        }
        return map;
    }
    private static long CACHE_SECONDS = 120;
    private LoadingCache<Long, Map<Long, Long>> cache = CacheBuilder.newBuilder().maximumSize(1000).expireAfterAccess(CACHE_SECONDS, TimeUnit.SECONDS)
            .build(new CacheLoader<Long, Map<Long, Long>>() {
                @Override
                public Map<Long, Long> load(Long bizId) throws Exception {
                    BizLimitEntity limit = dao.findByBizId(bizId);
                    if (limit != null && FormatUtil.dateFormat.format(new Date()).equals(limit.getLimitDate())) return toMap(limit.getContent());
                    return new HashMap<Long, Long>();
                }
            });//
    private BizLimitDao dao;
    public BizLimitEntity findByBizId(Long bizId) {
        return dao.findByBizId(bizId);
    }
    @Override
    protected BizLimitDao getDao() {
        return dao;
    }
    public boolean isAvailable(Long bizId, Long provinceId) {
        try {
            Map<Long, Long> map = cache.get(bizId);
            if (map != null && map.containsKey(provinceId)) { return map.get(provinceId) > 0; }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }
    @Autowired
    public void setDao(BizLimitDao dao) {
        this.dao = dao;
    }
}
