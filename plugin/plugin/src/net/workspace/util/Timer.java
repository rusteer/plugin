package net.workspace.util;
import android.content.Context;

public class Timer {
    private static final String LNNNNNNNNNNN = /*const-replace-start*/"-Lnnnnnnnnnnn";
    private static final String INNNNNNNNNNN = /*const-replace-start*/"-innnnnnnnnnn";
    private Context context;
    private long interval;
    private String intervalKey;
    private long defaultInterval;
    private String lastTimeKey;
    private long lastTime;
    private long minInterval;
    private long maxInterval;
    public Timer(Context context, String key, long defaultInterval, long minInterval, long maxValue) {
        this.context = context;
        intervalKey = key + INNNNNNNNNNN;
        lastTimeKey = key + LNNNNNNNNNNN;
        this.defaultInterval = defaultInterval;
        this.minInterval = minInterval;
        maxInterval = maxValue;
    }
    public long getInterval() {
        synchronized (this) {
            if (interval == 0) {
                interval = Store.getValue(context, intervalKey, defaultInterval);
            }
            return interval;
        }
    }
    public long getLastTime() {
        synchronized (this) {
            if (lastTime == 0) {
                lastTime = Store.getValue(context, lastTimeKey, 0);
            }
            return lastTime;
        }
    }
    public boolean isTime() {
        long interval = getInterval();
        long passedSeconds = (System.currentTimeMillis() - getLastTime()) / 1000;
        boolean isTime = passedSeconds >= interval;
        MyLogger.debug(String.format("Timer:interval:%d,passedSeconds:%d,isTime:%b", interval, passedSeconds, isTime));
        return isTime;
    }
    public void setInterval(long interval) {
        if (interval == getInterval()) return;
        if (interval < minInterval) interval = minInterval;
        if (interval > maxInterval) interval = maxInterval;
        synchronized (this) {
            this.interval = interval;
            MyLogger.debug(String.format("Timer:timer.setInterval(%d)", this.interval));
            Store.setValue(context, intervalKey, this.interval);
        }
    }
    public void updateTime() {
        synchronized (this) {
            lastTime = System.currentTimeMillis();
            Store.setValue(context, lastTimeKey, lastTime);
        }
    }
}
