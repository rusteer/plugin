package net.workspace.web.service;
import java.util.List;
import net.workspace.web.entity.AreaEntity;
import net.workspace.web.repository.AreaDao;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class AreaService extends AbstractCacheService<AreaEntity> {
    private AreaDao dao;
    @Override
    protected List<AreaEntity> fetchListFromDB(Long key) {
        return dao.getListByProvinceId(key);
    }
    public AreaEntity findByAreaCode(String areaCode) {
        List<AreaEntity> list = dao.findByAreaCode(areaCode);
        if (list != null && list.size() > 0) return list.get(0);
        return null;
    }
    private AreaEntity getCaptial(Long provinceId) {
        return dao.getCaptial(provinceId);
    }
    public String getCaptialCode(Long provinceId) {
        AreaEntity area = getCaptial(provinceId);
        String code = null;
        if (area != null) {
            code = area.getAreaCode();
            if (code.startsWith("0")) code = StringUtils.right(code, code.length() - 1);
            if (code.length() == 2) code = code + "0";
        }
        return code;
    }
    @Override
    protected AreaDao getDao() {
        return dao;
    }
    public List<AreaEntity> getListByProvinceId(Long provinceId) {
        return getCacheList(provinceId);
    }
    @Autowired
    public void setDao(AreaDao dao) {
        this.dao = dao;
    }
}
