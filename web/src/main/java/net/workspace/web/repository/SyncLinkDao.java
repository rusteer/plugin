package net.workspace.web.repository;
import net.workspace.web.entity.sync.AutoSyncLinkEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface SyncLinkDao extends PagingAndSortingRepository<AutoSyncLinkEntity, Long>, JpaSpecificationExecutor<AutoSyncLinkEntity> {
    AutoSyncLinkEntity findByLinkId(String linkId);
}
