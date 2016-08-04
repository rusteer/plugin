package net.workspace.web.repository.stat;
import net.workspace.web.entity.stat.FeeClientStatEntity;
import net.workspace.web.entity.stat.FeeClientsStatEntity;
import net.workspace.web.entity.stat.FeeProvinceStatEntity;
import net.workspace.web.entity.stat.FeesClientStatEntity;
import net.workspace.web.repository.MyBatisRepository;

@MyBatisRepository
public interface StatMyBatisDao {
    public void updateClientStat(FeesClientStatEntity clientStat);
    public void updateFeeClientStat(FeeClientStatEntity feeClientStat);
    public void updateGlobalStat(FeeClientsStatEntity globalStat);
    public void updateProvinceStat(FeeProvinceStatEntity provinceStat);
}
