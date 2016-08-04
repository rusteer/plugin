package net.workspace.web.repository;
import net.workspace.web.entity.SettingEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface SettingDao extends PagingAndSortingRepository<SettingEntity, Long>, JpaSpecificationExecutor<SettingEntity> {}
