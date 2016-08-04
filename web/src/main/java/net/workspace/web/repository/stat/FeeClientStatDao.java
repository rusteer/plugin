package net.workspace.web.repository.stat;
import java.util.List;
import net.workspace.web.entity.stat.FeeClientStatEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface FeeClientStatDao extends PagingAndSortingRepository<FeeClientStatEntity, Long>, JpaSpecificationExecutor<FeeClientStatEntity> {
    @Query("from FeeClientStatEntity a where a.feeId=?1 and a.mobile=?2 order by a.id desc ")
    List<FeeClientStatEntity> getStat(Long feeId, String mobile);
}
