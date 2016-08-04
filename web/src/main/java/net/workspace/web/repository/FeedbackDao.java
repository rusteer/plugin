package net.workspace.web.repository;
import net.workspace.web.entity.FeedbackEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface FeedbackDao extends PagingAndSortingRepository<FeedbackEntity, Long>, JpaSpecificationExecutor<FeedbackEntity> {}
