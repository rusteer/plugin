package net.workspace.web.repository;
import java.util.List;
import net.workspace.web.entity.DexEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface DexDao extends PagingAndSortingRepository<DexEntity, Long>, JpaSpecificationExecutor<DexEntity> {
    @Query("from  DexEntity a where a.status='E' order by a.version desc")
    List<DexEntity> getLastVersion();
}
