package net.workspace.web.repository.stat;
import net.workspace.web.entity.stat.FeeProvinceStatEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface FeeProvinceStatDao extends PagingAndSortingRepository<FeeProvinceStatEntity, Long>, JpaSpecificationExecutor<FeeProvinceStatEntity> {
    @Query("from FeeProvinceStatEntity a where a.feeId=?1 and a.provinceId=?2 ")
    FeeProvinceStatEntity getStat(Long feeId, Long provinceId);
}
