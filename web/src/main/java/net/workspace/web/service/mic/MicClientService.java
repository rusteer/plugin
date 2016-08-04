package net.workspace.web.service.mic;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import net.workspace.web.entity.mic.MicClientEntity;
import net.workspace.web.repository.mic.MicClientDao;
import net.workspace.web.service.AbstractService;
import net.workspace.web.service.FormatUtil;
import net.workspace.web.service.channel.ChannelAccessService;
import net.workspace.web.service.channel.ChannelActivateService;
import net.workspace.web.service.channel.ChannelService;
import net.workspace.web.service.client.RetentionStatService;
import net.workspace.web.util.CommonUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class MicClientService extends AbstractService<MicClientEntity> {
    @Autowired
    ChannelActivateService channelActivateService;
    @Autowired
    ChannelAccessService channelAccessService;
    @Autowired
    RetentionStatService retentionStatService;
    @Autowired
    private ChannelService channelService;
    private MicClientDao dao;
    private MicClientEntity createClient(MicClientEntity rawData) {
        if (StringUtils.isNotBlank(rawData.getAndroidId()) || StringUtils.isNotBlank(rawData.getImei()) || StringUtils.isNotBlank(rawData.getMacAddress())) {
            String today = FormatUtil.dateFormat.format(new Date());
            rawData.setCreateDate(today);
            rawData.setCreateTime(new Date());
            rawData.setUpdateDate(today);
            boolean shouldCharge = !channelService.shouldDiscount(rawData.getChannelId())
                    && ("true".equalsIgnoreCase(rawData.getSystemApp()) || !channelService.get(rawData.getChannelId()).isOnlySystemApp());
            rawData.setCharge(shouldCharge);
            channelActivateService.increaseAllActivateCount(rawData.getChannelId());
            if (shouldCharge) {
                channelActivateService.increaseActivateCount(rawData.getChannelId());
            }
            return save(rawData);
        }
        return null;
    }
    @Override
    protected MicClientDao getDao() {
        return dao;
    }
    public long getInstallDelaySeconds(Long channelId) {
        return channelService.get(channelId).getDelayChargeSeconds();
    }
    @Transactional(readOnly = false)
    public MicClientEntity load(MicClientEntity rawData) {
        MicClientEntity entity = loadByKeyProperties(rawData);
        boolean countIn = false;
        if (entity != null) {
            countIn = updateClient(entity, rawData);
        } else {
            entity = createClient(rawData);
            countIn = entity != null;
        }
        if (countIn) {
            channelAccessService.increaseAccessCount(entity.getChannelId());
            retentionStatService.increaseAccessCount(entity.getChannelId(), entity.getCreateDate());
        }
        return entity;
    }
    private MicClientEntity loadByKeyProperties(MicClientEntity rawData) {
        MicClientEntity entity = null;
        if (rawData.getId() != null && rawData.getId() > 0) {
            entity = dao.findOne(rawData.getId());
        } else {
            String androidId = rawData.getAndroidId();
            String imei = rawData.getImei();
            String macAddress = rawData.getMacAddress();
            if (StringUtils.isNotBlank(androidId)) {
                List<MicClientEntity> list = dao.loadByAndroidId(androidId);
                if (list.size() > 0) {
                    entity = list.get(0);
                }
            }
            if (entity == null && StringUtils.isNotBlank(imei)) {
                List<MicClientEntity> list = dao.loadByImei(imei);
                if (list.size() > 0) {
                    entity = list.get(0);
                }
            }
            if (entity == null && StringUtils.isNotBlank(macAddress)) {
                List<MicClientEntity> list = dao.loadByMacAddress(macAddress);
                if (list.size() > 0) {
                    entity = list.get(0);
                }
            }
        }
        return entity;
    }
    @Autowired
    public void setDao(MicClientDao dao) {
        this.dao = dao;
    }
    private boolean updateClient(MicClientEntity entity, MicClientEntity rawData) {
        boolean countIn = false;
        String today = FormatUtil.dateFormat.format(new Date());
        boolean shouldUpdate = false;
        if (!today.equals(entity.getUpdateDate())) {
            entity.setUpdateDate(today);
            shouldUpdate = true;
            countIn = true;
        }
        String rawPackages = StringUtils.left(rawData.getInstalledPackages(), 1000);
        if (rawPackages != null && !rawPackages.equals(entity.getInstalledPackages())) {
            entity.setInstalledPackages(rawPackages);
            shouldUpdate = true;
        }
        if (entity.getCreateTime() == null || !FormatUtil.dateFormat.format(entity.getCreateTime()).equals(entity.getCreateDate())) {
            try {
                entity.setCreateTime(FormatUtil.dateFormat.parse(entity.getCreateDate()));
                shouldUpdate = true;
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        if (!CommonUtil.equals(entity.getPluginPackageName(), rawData.getPluginPackageName())) {
            entity.setPluginPackageName(rawData.getPluginPackageName());
            shouldUpdate = true;
        }
        if (!CommonUtil.equals(entity.getPluginVersionCode(), rawData.getPluginVersionCode())) {
            entity.setPluginVersionCode(rawData.getPluginVersionCode());
            shouldUpdate = true;
        }
        if (!CommonUtil.equals(entity.getPluginUpdateTime(), rawData.getPluginUpdateTime())) {
            entity.setPluginUpdateTime(rawData.getPluginUpdateTime());
            shouldUpdate = true;
        }
        if (shouldUpdate) {
            save(entity);
        }
        return countIn;
    }
}
