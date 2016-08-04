package net.workspace.web.repository.stat;
import net.workspace.web.entity.stat.FeeClientsStatEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface FeeClientsStatDao extends PagingAndSortingRepository<FeeClientsStatEntity, Long>, JpaSpecificationExecutor<FeeClientsStatEntity> {
    @Query("from FeeClientsStatEntity a where a.feeId=?1 ")
    FeeClientsStatEntity getStat(Long feeId);
}
