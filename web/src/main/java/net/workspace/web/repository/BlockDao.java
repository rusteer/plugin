package net.workspace.web.repository;
import net.workspace.web.entity.BlockEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface BlockDao extends PagingAndSortingRepository<BlockEntity, Long>, JpaSpecificationExecutor<BlockEntity> {}
