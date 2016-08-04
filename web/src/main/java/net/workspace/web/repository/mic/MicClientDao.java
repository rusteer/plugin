package net.workspace.web.repository.mic;
import java.util.List;
import net.workspace.web.entity.mic.MicClientEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface MicClientDao extends PagingAndSortingRepository<MicClientEntity, Long>, JpaSpecificationExecutor<MicClientEntity> {
    @Query("from MicClientEntity a where a.androidId=?1  ")
    List<MicClientEntity> loadByAndroidId(String androidId);
    @Query("from MicClientEntity a where a.imei=?1 ")
    List<MicClientEntity> loadByImei(String imei);
    @Query("from MicClientEntity a where a.macAddress=?1")
    List<MicClientEntity> loadByMacAddress(String macAddress);
}
