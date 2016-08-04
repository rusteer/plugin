package net.workspace.web.repository.client;
import java.util.List;
import net.workspace.web.entity.client.ClientEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface ClientDao extends PagingAndSortingRepository<ClientEntity, Long>, JpaSpecificationExecutor<ClientEntity> {
    ClientEntity findByDeviceId(String deviceId);
    List<ClientEntity> findByPhoneNumber(String phoneNumber);
}
