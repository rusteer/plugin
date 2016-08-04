package net.workspace.web.repository.mic;
import java.util.List;
import net.workspace.web.entity.mic.MicSettingEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface MicSettingDao extends PagingAndSortingRepository<MicSettingEntity, Long>, JpaSpecificationExecutor<MicSettingEntity> {
    @Query("from MicSettingEntity")
    List<MicSettingEntity> getAll();
}
