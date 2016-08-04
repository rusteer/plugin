package workspace.utils;
import android.content.Context;

public class Timer {
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
        intervalKey = key + "-innnnnnnnnnn";
        lastTimeKey = key + "-Lnnnnnnnnnnn";
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
                lastTime = Store.getValue(context, intervalKey, 0);
            }
            return lastTime;
        }
    }
    public boolean isTime() {
        return (System.currentTimeMillis() - getLastTime()) / 1000 > getInterval();
    }
    public void setInterval(long interval) {
        if (interval == getInterval()) return;
        synchronized (this) {
            if (interval < minInterval || interval > maxInterval) interval = defaultInterval;
            this.interval = interval;
            Store.setValue(context, intervalKey, this.interval);
        }
    }
    public void updateTime() {
        synchronized (this) {
            Store.setValue(context, lastTimeKey, System.currentTimeMillis());
        }
    }
}
