package net.workspace.web.service;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import net.workspace.web.entity.PackageEntity;
import net.workspace.web.repository.PackageDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PackageService extends AbstractService<PackageEntity> {
    @Autowired
    private PackageDao dao;
    public List<PackageEntity> getBuilList() {
        return dao.getBuilList();
    }
    public Set<String> getChannels() {
        Set<String> map = new LinkedHashSet<String>();
        for (int i = 1; i <= 9; i++) {
            map.add("v123" + i);
        }
        return map;
    }
    @Override
    protected PackageDao getDao() {
        return dao;
    }
}
