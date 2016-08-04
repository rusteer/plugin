package net.workspace.web.bean;
public class DateClientCount {
    private String statDate;
    private int clientCount;
    public DateClientCount() {}
    public DateClientCount(String statDate, int clientCount) {
        this.statDate = statDate;
        this.clientCount = clientCount;
    }
    public int getClientCount() {
        return clientCount;
    }
    public String getStatDate() {
        return statDate;
    }
    public void setClientCount(int clientCount) {
        this.clientCount = clientCount;
    }
    public void setStatDate(String statDate) {
        this.statDate = statDate;
    }
}
