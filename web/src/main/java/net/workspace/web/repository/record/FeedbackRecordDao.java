package net.workspace.web.repository.record;
import net.workspace.web.entity.record.FeedbackRecordEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface FeedbackRecordDao extends PagingAndSortingRepository<FeedbackRecordEntity, Long>, JpaSpecificationExecutor<FeedbackRecordEntity> {}
