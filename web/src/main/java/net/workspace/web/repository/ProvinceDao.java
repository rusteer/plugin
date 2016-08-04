package net.workspace.web.repository;
import java.util.List;
import net.workspace.web.entity.ProvinceEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface ProvinceDao extends PagingAndSortingRepository<ProvinceEntity, Long>, JpaSpecificationExecutor<ProvinceEntity> {
    @Query("from ProvinceEntity a order by a.priority")
    List<ProvinceEntity> getAll();
    @Query("from ProvinceEntity a where a.code=?1")
    ProvinceEntity getByCode(String code);
}
