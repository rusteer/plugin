package net.workspace.web.repository.record;
import net.workspace.web.entity.record.StepRecordEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface StepRecordDao extends PagingAndSortingRepository<StepRecordEntity, Long>, JpaSpecificationExecutor<StepRecordEntity> {}
