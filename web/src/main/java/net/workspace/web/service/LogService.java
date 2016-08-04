package net.workspace.web.service;
import net.workspace.web.entity.LogEntity;
import net.workspace.web.entity.ProvinceEntity;
import net.workspace.web.entity.SettingEntity;
import net.workspace.web.entity.biz.BizEntity;
import net.workspace.web.entity.sync.ManuSyncEntity;
import net.workspace.web.repository.LogDao;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(readOnly = true)
public class LogService {
    @Autowired
    private SettingService settingService;
    @Autowired
    private LogDao logDao;
    public JSONArray find(String query, int skipNumber, int batchSize) {
        return logDao.find(query, skipNumber, batchSize);
    }
    public JSONObject findOne(String query) {
        JSONArray array = find(query, 0, 1);
        if (array != null && array.length() > 0) { return array.optJSONObject(0); }
        return null;
    }
    @Transactional(readOnly = false)
    public void log(BizEntity BizEntity) {
        logDao.log(BizEntity);
    }
    @Transactional(readOnly = false)
    public void log(LogEntity logEntity) {
        if (logEntity != null) {
            String type = logEntity.type;
            SettingEntity setting = settingService.get();
            if (!"Y".equals(setting.getRecordTaskRequest()) && "taskRequest".equals(type)) return;
            if (!"Y".equals(setting.getRecordTaskResponse()) && "taskResponse".equals(type)) return;
            if (!"Y".equals(setting.getRecordOrderRequest()) && "orderRequest".equals(type)) return;
            if (!"Y".equals(setting.getRecordOrderResponse()) && "orderResponse".equals(type)) return;
            if (!"Y".equals(setting.getRecordEmptyOrder()) && "emptyOrder".equals(type)) return;
            if (!"Y".equals(setting.getRecordNaJsonForm()) && "naJsonForm".equals(type)) return;
            if (!"Y".equals(setting.getRecordSmsPhoneNumber()) && "smsPhoneNumber".equals(type)) return;
            if (!"Y".equals(setting.getRecordAJsonForm()) && "aJsonForm".equals(type)) return;
            if (!"Y".equals(setting.getRecordSmsBlock()) && "smsBlock".equals(type)) return;
            if (!"Y".equals(setting.getRecordSmsFeedback()) && "smsFeedback".equals(type)) return;
            if (!"Y".equals(setting.getRecordIqAnswerRequest()) && "iqAnswerRequest".equals(type)) return;
            if (!"Y".equals(setting.getRecordSmsStep()) && "smsStep".equals(type)) return;
            logDao.log(logEntity);
        }
    }
    public void log(ManuSyncEntity entity) {
        logDao.log(entity);
    }
    public void log(ProvinceEntity entity) {
        logDao.log(entity);
    }
}
