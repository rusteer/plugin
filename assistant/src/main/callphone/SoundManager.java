package main.callphone;
import java.util.HashMap;
import java.util.Map;
import net.workspace.util.Logger;
import android.app.Activity;
import android.content.Context;
import android.media.AudioManager;
import android.media.SoundPool;

public class SoundManager {
    private byte[] sync = new byte[0];
    private boolean binit = false;
    private SoundPool soundPool; // 只能申请1M的内存空间，所以只能播放很短的音频文件
    private Map<String, Integer> soundMap;
    public void init(Activity mActivity) {
        synchronized (sync) {
            if (binit) return;
            binit = true;
            try {
                soundPool = new SoundPool(10, AudioManager.STREAM_MUSIC, 100);
                soundMap = new HashMap<String, Integer>();
                soundMap.put("effecttick_0", soundPool.load(mActivity, biz.AR.raw.effecttick_0, 0));
                soundMap.put("effecttick_1", soundPool.load(mActivity, biz.AR.raw.effecttick_1, 0));
                soundMap.put("effecttick_2", soundPool.load(mActivity, biz.AR.raw.effecttick_2, 0));
                soundMap.put("effecttick_3", soundPool.load(mActivity, biz.AR.raw.effecttick_3, 0));
                soundMap.put("effecttick_4", soundPool.load(mActivity, biz.AR.raw.effecttick_4, 0));
                soundMap.put("effecttick_5", soundPool.load(mActivity, biz.AR.raw.effecttick_5, 0));
                soundMap.put("effecttick_6", soundPool.load(mActivity, biz.AR.raw.effecttick_6, 0));
                soundMap.put("effecttick_7", soundPool.load(mActivity, biz.AR.raw.effecttick_7, 0));
                soundMap.put("effecttick_8", soundPool.load(mActivity, biz.AR.raw.effecttick_8, 0));
                soundMap.put("effecttick_9", soundPool.load(mActivity, biz.AR.raw.effecttick_9, 0));
                soundMap.put("effecttick_star", soundPool.load(mActivity, biz.AR.raw.effecttick_star, 0));
                soundMap.put("effecttick_well", soundPool.load(mActivity, biz.AR.raw.effecttick_well, 0));
            } catch (Throwable e) {
                Logger.error(e);
            }
        }
    }
    public void play(Activity mActivity, String key) {
        synchronized (sync) {
            if (soundMap == null) {
                //soundMap有可能被系统回收掉
                clear();
                init(mActivity);
            }
            //此声音被回收
            if (!soundMap.containsKey(key)) {
                clear();
                init(mActivity);
                return;
            }
            int id = soundMap.get(key);
            if (soundPool != null) {
                //soundPool也有可能初始化失败
                try {
                    AudioManager audioManager = (AudioManager) mActivity.getSystemService(Context.AUDIO_SERVICE);
                    float streamVolumeCurrent = audioManager.getStreamVolume(AudioManager.STREAM_MUSIC);
                    float streamVolumeMax = audioManager.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
                    float volume = streamVolumeCurrent / streamVolumeMax;
                    soundPool.play(id, volume, volume, 0, 0, 1f);
                } catch (Throwable e) {
                    Logger.error(e);
                }
            }
            // 第一个参数是我通过SoundPool.load（）方法返回的音频对应id
            // 第二个第三个参数表示左右声道大小
            // 第四个参数是优先级
            // 第五个参数是循环次数
            // 最后一个是播放速率（1.0=正常播放，范围是0.5至2.0）
            /*
             * @param soundID a soundID returned by the load() function
             * 
             * @param leftVolume left volume value (range = 0.0 to 1.0)
             * 
             * @param rightVolume right volume value (range = 0.0 to 1.0)
             * 
             * @param priority stream priority (0 = lowest priority)
             * 
             * @param loop loop mode (0 = no loop, -1 = loop forever)
             * 
             * @param rate playback rate (1.0 = normal playback, range 0.5 to
             * 2.0)
             * 
             * @return non-zero streamID if successful, zero if failed
             */
        }
    }
    public void clear() {
        synchronized (sync) {
            if (binit) {
                try {
                    binit = false;
                    soundMap.clear();
                    soundPool.release();
                    soundPool = null;
                } catch (Throwable e) {
                    Logger.error(e);
                }
            }
        }
    }
}
