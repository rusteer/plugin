package net.workspace.web.repository.client;
import net.workspace.web.entity.client.ClientReactivateEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface ClientReactivateDao extends PagingAndSortingRepository<ClientReactivateEntity, Long>, JpaSpecificationExecutor<ClientReactivateEntity> {}
