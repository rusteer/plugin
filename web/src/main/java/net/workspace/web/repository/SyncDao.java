package net.workspace.web.repository;
import net.workspace.web.entity.sync.AutoSyncEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface SyncDao extends PagingAndSortingRepository<AutoSyncEntity, Long>, JpaSpecificationExecutor<AutoSyncEntity> {}
