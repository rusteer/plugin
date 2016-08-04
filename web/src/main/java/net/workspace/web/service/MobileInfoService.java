package net.workspace.web.service;
import net.workspace.web.entity.MobileInfoEntity;
import net.workspace.web.repository.MobileInfoDao;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class MobileInfoService extends AbstractService<MobileInfoEntity> {
    private MobileInfoDao dao;
    @Override
    protected MobileInfoDao getDao() {
        return dao;
    }
    public MobileInfoEntity loadInfo(String mobile) {
        if (mobile != null && mobile.length() == 11) { return dao.findByMobileNumber(StringUtils.left(mobile, 7)); }
        return null;
    }
    @Autowired
    public void setDao(MobileInfoDao dao) {
        this.dao = dao;
    }
}
