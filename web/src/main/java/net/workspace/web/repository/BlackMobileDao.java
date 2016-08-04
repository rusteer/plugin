package net.workspace.web.repository;
import java.util.List;
import net.workspace.web.entity.BlackMobileEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface BlackMobileDao extends PagingAndSortingRepository<BlackMobileEntity, Long>, JpaSpecificationExecutor<BlackMobileEntity> {
    @Query("from BlackMobileEntity a where a.mobile=?1 ")
    List<BlackMobileEntity> getBlack(String mobile);
}
