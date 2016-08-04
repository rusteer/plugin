package net.workspace.web.repository;
import java.util.List;
import net.workspace.web.entity.AreaEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface AreaDao extends PagingAndSortingRepository<AreaEntity, Long>, JpaSpecificationExecutor<AreaEntity> {
    List<AreaEntity> findByAreaCode(String areaCode);
    @Query("from AreaEntity a where a.province.id=?1 and a.isCaptial='Y'")
    AreaEntity getCaptial(Long provinceId);
    @Query("from AreaEntity a where a.province.id=?1")
    List<AreaEntity> getListByProvinceId(Long provinceId);
}
