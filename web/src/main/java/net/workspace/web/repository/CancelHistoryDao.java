package net.workspace.web.repository;
import net.workspace.web.entity.CancelHistoryEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface CancelHistoryDao extends PagingAndSortingRepository<CancelHistoryEntity, Long>, JpaSpecificationExecutor<CancelHistoryEntity> {
    @Query("from CancelHistoryEntity a where a.clientId=?1")
    CancelHistoryEntity getByClientId(Long clientId);
}
