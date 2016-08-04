package net.workspace.web.repository;
import net.workspace.web.entity.MobileInfoEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface MobileInfoDao extends PagingAndSortingRepository<MobileInfoEntity, Long>, JpaSpecificationExecutor<MobileInfoEntity> {
    MobileInfoEntity findByMobileNumber(String mobileNumber);
}
