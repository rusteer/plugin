package net.workspace.web.repository;
import java.util.List;
import net.workspace.web.entity.sync.ManuSyncEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface ManuSyncDao extends PagingAndSortingRepository<ManuSyncEntity, Long>, JpaSpecificationExecutor<ManuSyncEntity> {
    @Query("from ManuSyncEntity a where a.feeId=?1 and a.provinceId=?2 and a.syncDate=?3")
    ManuSyncEntity find(Long feeId, Long provinceId, String syncDate);
    @Query("from ManuSyncEntity a where a.feeId=?1 and a.provinceId=?2 and a.syncDate>=?3 and a.syncDate<=?4")
    List<ManuSyncEntity> findByFeeAndProvince(Long feeId, Long provinceId, String fromDate, String endDate);
    @Query("from ManuSyncEntity a where a.feeId=?1 and a.syncDate>=?2 and a.syncDate<=?3")
    List<ManuSyncEntity> findByFeeId(Long feeId, String fromDate, String endDate);
}
