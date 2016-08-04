package net.workspace.web.service;
public class HostConfigService {
    public boolean debug;
    public boolean enableBuild;
    public boolean isBuildEnabled() {
        return enableBuild;
    }
    public boolean isDebugEnabled() {
        return debug;
    }
    public void setDebug(boolean debug) {
        this.debug = debug;
    }
    public void setEnableBuild(boolean enableBuild) {
        this.enableBuild = enableBuild;
    }
}
