package net.workspace.web.repository;
import java.util.List;
import net.workspace.web.entity.BlackDeviceEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface BlackDeviceDao extends PagingAndSortingRepository<BlackDeviceEntity, Long>, JpaSpecificationExecutor<BlackDeviceEntity> {
    @Query("from BlackDeviceEntity a where a.deviceId=?1 ")
    List<BlackDeviceEntity> getBlack(String mobile);
}
