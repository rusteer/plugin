package net.workspace.web.repository;
import java.util.List;
import net.workspace.web.entity.IpInfoEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface IpInfoDao extends PagingAndSortingRepository<IpInfoEntity, Long>, JpaSpecificationExecutor<IpInfoEntity> {
    //@Query("select areaCode from IpRangeEntity a where a.ipFrom<=?1 and a.ipTo>=?1 ")
    @Query("from IpInfoEntity a where a.ipFrom<=?1 and a.ipTo>=?1 ")
    List<IpInfoEntity> getIpInfoList(long formatedIp);
}
