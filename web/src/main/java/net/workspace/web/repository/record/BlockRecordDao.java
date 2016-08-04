package net.workspace.web.repository.record;
import net.workspace.web.entity.record.BlockRecordEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface BlockRecordDao extends PagingAndSortingRepository<BlockRecordEntity, Long>, JpaSpecificationExecutor<BlockRecordEntity> {}
