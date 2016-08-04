package net.workspace.web.repository.biz;
import java.util.Date;
import java.util.List;
import net.workspace.web.entity.biz.BizEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface BizDao extends PagingAndSortingRepository<BizEntity, Long>, JpaSpecificationExecutor<BizEntity> {
    @Query("from BizEntity a where a.bizCode=?1 ")
    BizEntity getByBizCode(String bizCode);
    @Query("from BizEntity a where a.status='E' and a.id>0")
    List<BizEntity> getEnabledList();
    //
    @Query("from BizEntity a where a.syncPort=?1 and a.syncCommand=?2 ")
    List<BizEntity> getBizListBySyncPortAndSyncCommand(String port, String command);
    //
    @Query("from BizEntity a where a.syncCommand=?1 ")
    List<BizEntity> getListBySyncCommand(String commnad);
    //
    @Query("from BizEntity a where a.syncPort=?1 ")
    List<BizEntity> getListBySyncPort(String port);
    //
    @Query("from BizEntity a where a.status='E' or a.updateTime>?1")
    List<BizEntity> getRecentlyUsedList(Date date);
}
