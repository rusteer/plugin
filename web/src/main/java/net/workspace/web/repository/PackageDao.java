package net.workspace.web.repository;
import java.util.List;
import net.workspace.web.entity.PackageEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface PackageDao extends PagingAndSortingRepository<PackageEntity, Long>, JpaSpecificationExecutor<PackageEntity> {
    @Query("from PackageEntity r where r.needBuild='Y' and r.status='E'")
    List<PackageEntity> getBuilList();
}
