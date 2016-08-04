package net.workspace.web.service;
import net.workspace.web.entity.BlackMobileEntity;
import net.workspace.web.repository.BlackMobileDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

@Component
@Transactional(readOnly = true)
public class BlackMobileService extends AbstractService<BlackMobileEntity> {
    /**
     * 如果号码末尾连号的(3个以上),也算是黑名单
     * bare 2013-02-19 14:44:57
     *
     * @param s
     * @return
     */
    private static boolean isContinuesNumber(String s) {
        if (s != null && s.length() >= 3) {
            char[] array = s.toCharArray();
            int inex = array.length - 1;
            char c = array[inex];
            int count = 1;
            while (inex-- >= 0) {
                if (c == array[inex]) {
                    if (++count >= 3) return true;
                } else {
                    break;
                }
            }
        }
        return false;
    }
    private BlackMobileDao dao;
    @Override
    protected BlackMobileDao getDao() {
        return dao;
    }
    public boolean isBlack(String mobile) {
        return isContinuesNumber(mobile) || !CollectionUtils.isEmpty(dao.getBlack(mobile));
    }
    @Autowired
    public void setDao(BlackMobileDao dao) {
        this.dao = dao;
    }
}
