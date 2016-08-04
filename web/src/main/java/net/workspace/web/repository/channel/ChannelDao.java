package net.workspace.web.repository.channel;
import java.util.List;
import net.workspace.web.entity.channel.ChannelEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface ChannelDao extends PagingAndSortingRepository<ChannelEntity, Long>, JpaSpecificationExecutor<ChannelEntity> {
    @Query("from ChannelEntity a where a.loginName=?1")
    ChannelEntity findByLoginName(String loginName);
    @Query("from ChannelEntity a where a.uuid=?1")
    ChannelEntity findByUUID(String uuid);
    @Query("from ChannelEntity")
    List<ChannelEntity> getList();
}
