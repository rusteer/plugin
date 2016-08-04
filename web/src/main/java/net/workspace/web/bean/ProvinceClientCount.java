package net.workspace.web.bean;
public class ProvinceClientCount {
    private long provinceId;
    private long clientCount;
    public ProvinceClientCount() {}
    public long getClientCount() {
        return clientCount;
    }
    public long getProvinceId() {
        return provinceId;
    }
    public void setClientCount(long clientCount) {
        this.clientCount = clientCount;
    }
    public void setProvinceId(long provinceId) {
        this.provinceId = provinceId;
    }
}
