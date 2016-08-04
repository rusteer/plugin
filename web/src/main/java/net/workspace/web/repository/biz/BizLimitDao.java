package net.workspace.web.repository.biz;
import net.workspace.web.entity.biz.BizLimitEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface BizLimitDao extends PagingAndSortingRepository<BizLimitEntity, Long>, JpaSpecificationExecutor<BizLimitEntity> {
    BizLimitEntity findByBizId(Long bizId);
}
