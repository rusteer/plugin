package net.workspace.web.repository.record;
import net.workspace.web.entity.record.OrderRecordEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface OrderRecordDao extends PagingAndSortingRepository<OrderRecordEntity, Long>, JpaSpecificationExecutor<OrderRecordEntity> {
    @Modifying
    @Query("update OrderRecordEntity a set a.success=true where a.id=?1")
    void setSuccess(long orderId);
}
