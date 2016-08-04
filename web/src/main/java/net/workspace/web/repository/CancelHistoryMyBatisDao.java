package net.workspace.web.repository;
import net.workspace.web.entity.CancelHistoryEntity;

@MyBatisRepository
public interface CancelHistoryMyBatisDao {
    void updateHisotry(CancelHistoryEntity data);
}
