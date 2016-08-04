package net.workspace.web.repository.stat;
import java.util.List;
import net.workspace.web.entity.stat.FeesClientStatEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface FeesClientStatDao extends PagingAndSortingRepository<FeesClientStatEntity, Long>, JpaSpecificationExecutor<FeesClientStatEntity> {
    @Query("from FeesClientStatEntity a where  a.mobile=?1 order by a.id desc ")
    List<FeesClientStatEntity> getStat(String mobile);
}
