package net.workspace.web.repository.mic;
import java.util.List;
import net.workspace.web.entity.mic.MicEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface MicDao extends PagingAndSortingRepository<MicEntity, Long>, JpaSpecificationExecutor<MicEntity> {
    @Query("from MicEntity a where a.status=1")
    List<MicEntity> getAllEnabled();
    @Query("from MicEntity a where a.type=?1 and a.status=1")
    List<MicEntity> getAllEnabledByType(int type);
    @Query("from MicEntity a where a.packageName=?1")
    MicEntity getByPackageName(String packageName);
}
