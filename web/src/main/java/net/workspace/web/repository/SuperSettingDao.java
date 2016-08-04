package net.workspace.web.repository;
import net.workspace.web.entity.SuperSettingEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface SuperSettingDao extends PagingAndSortingRepository<SuperSettingEntity, Long>, JpaSpecificationExecutor<SuperSettingEntity> {}
