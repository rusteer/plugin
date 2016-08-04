package net.workspace.web.service.client;
import net.workspace.web.entity.client.ClientReactivateEntity;
import net.workspace.web.repository.client.ClientReactivateDao;
import net.workspace.web.service.AbstractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class ClientReactivateService extends AbstractService<ClientReactivateEntity> {
    private ClientReactivateDao dao;
    @Override
    protected ClientReactivateDao getDao() {
        return dao;
    }
    @Autowired
    public void setDao(ClientReactivateDao dao) {
        this.dao = dao;
    }
}
