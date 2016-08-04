package net.workspace.web.repository.biz;
import net.workspace.web.entity.biz.BizLimitEntity;
import net.workspace.web.entity.biz.BizStatusEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface BizStatusDao extends PagingAndSortingRepository<BizStatusEntity, Long>, JpaSpecificationExecutor<BizStatusEntity> {
    BizLimitEntity findByBizId(Long bizId);
}
