package net.workspace.web.service;
import java.util.List;
import net.workspace.web.entity.IpInfoEntity;
import net.workspace.web.repository.IpInfoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class IpInfoService extends AbstractService<IpInfoEntity> {
    private IpInfoDao dao;
    @Override
    protected IpInfoDao getDao() {
        return dao;
    }
    @Autowired
    public void setDao(IpInfoDao dao) {
        this.dao = dao;
    }
    public IpInfoEntity getAreaCode(String ip) {
        List<IpInfoEntity> list = this.dao.getIpInfoList(formatIp(ip));
        if (list.size() > 0) return list.get(0);
        return null;
    }
    private long formatIp(String ip) {
        StringBuilder sb = new StringBuilder("1");
        String[] parts = ip.split("\\.");
        for (int i = 0; i < parts.length; i++) {
            String part = parts[i];
            if (part.length() == 2) sb.append("0");
            else if (part.length() == 1) sb.append("00");
            sb.append(part);
            if (i < parts.length - 1) {
                //sb.append(".");
            }
        }
        return Long.valueOf(sb.toString());
    }
}
