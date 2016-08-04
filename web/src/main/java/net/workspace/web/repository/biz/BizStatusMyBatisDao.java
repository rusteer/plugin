package net.workspace.web.repository.biz;
import net.workspace.web.entity.biz.BizStatusEntity;
import net.workspace.web.repository.MyBatisRepository;

@MyBatisRepository
public interface BizStatusMyBatisDao {
    void increase(BizStatusEntity data);
}
