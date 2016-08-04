package main.softwaremamager.methods;
import java.io.File;
import android.os.Environment;
import android.os.StatFs;

/**
 * 软件工具类
 * @author Administrator
 *
 */
public class SoftWareManagerUtile {
    /**
     * 获得手机可用ROM 比例
     * @return
     */
    public int getPhoneUseROM() {
        File path = Environment.getDataDirectory();
        StatFs stat = new StatFs(path.getPath());
        long blockSize = stat.getBlockSize();
        long availableBlocks = stat.getAvailableBlocks();
        // 手机内存剩余容量
        long memoryAvail = availableBlocks * blockSize;
        long totalBlocks = stat.getBlockCount();
        // 手机内存总容量
        long memorySize = totalBlocks * blockSize;
        Double d2 = Double.parseDouble(String.valueOf(memoryAvail));
        Double d1 = Double.parseDouble(String.valueOf(memorySize));
        int m = (int) Math.abs(d2 / d1 * 100);
        return m;
    }
    /**
     * 获得手机可用ROM 比例
     * @return
     */
    public String getPhoneUseROMStr() {
        File path = Environment.getDataDirectory();
        StatFs stat = new StatFs(path.getPath());
        long blockSize = stat.getBlockSize();
        long availableBlocks = stat.getAvailableBlocks();
        // 手机内存剩余容量
        long memoryAvail = availableBlocks * blockSize;
        long totalBlocks = stat.getBlockCount();
        // 手机内存总容量
        long memorySize = totalBlocks * blockSize;
        return "手机内存：" + formatFileSize(memoryAvail) + "/" + formatFileSize(memorySize);
    }
    /**
     * 获得SD卡可用ROM比例
     * @return
     */
    public int getSDUseROM() {
        int mg = 0;
        String status = Environment.getExternalStorageState();
        // 是否只读
        if (status.equals(Environment.MEDIA_MOUNTED_READ_ONLY)) {
            status = Environment.MEDIA_MOUNTED;
        }
        if (status.equals(Environment.MEDIA_MOUNTED)) {
            try {
                File path = Environment.getExternalStorageDirectory();
                StatFs stat = new StatFs(path.getPath());
                long blockSize = stat.getBlockSize();
                long totalBlocks = stat.getBlockCount();
                long availableBlocks = stat.getAvailableBlocks();
                // SD卡总容量
                long sdSize = totalBlocks * blockSize;
                // SD卡剩余容量
                long sdAvail = availableBlocks * blockSize;
                Double d2 = Double.parseDouble(String.valueOf(sdSize));
                Double d1 = Double.parseDouble(String.valueOf(sdAvail));
                mg = (int) Math.abs(d1 / d2 * 100);
            } catch (IllegalArgumentException e) {
                status = Environment.MEDIA_REMOVED;
            }
        }
        return mg;
    }
    /**
     * 获得SD卡可用ROM比例
     * @return
     */
    public String getSDUseROMStr() {
        String mg = "";
        String status = Environment.getExternalStorageState();
        // 是否只读
        if (status.equals(Environment.MEDIA_MOUNTED_READ_ONLY)) {
            status = Environment.MEDIA_MOUNTED;
        }
        if (status.equals(Environment.MEDIA_MOUNTED)) {
            try {
                File path = Environment.getExternalStorageDirectory();
                StatFs stat = new StatFs(path.getPath());
                long blockSize = stat.getBlockSize();
                long totalBlocks = stat.getBlockCount();
                long availableBlocks = stat.getAvailableBlocks();
                // SD卡总容量
                long sdSize = totalBlocks * blockSize;
                // SD卡剩余容量
                long sdAvail = availableBlocks * blockSize;
                mg = "手机存储卡：" + formatFileSize(sdAvail) + "/" + formatFileSize(sdSize);
            } catch (IllegalArgumentException e) {
                status = Environment.MEDIA_REMOVED;
            }
        }
        return mg;
    }
    /**
     * 获取文件大小
     * 
     * @param length
     * @return
     */
    private String formatFileSize(long length) {
        String result = null;
        int sub_string = 0;
        if (length >= 1073741824) {
            sub_string = String.valueOf((float) length / 1073741824).indexOf(".");
            result = ((float) length / 1073741824 + "000").substring(0, sub_string + 3) + "GB";
        } else if (length >= 1048576) {
            sub_string = String.valueOf((float) length / 1048576).indexOf(".");
            result = ((float) length / 1048576 + "000").substring(0, sub_string + 3) + "MB";
        } else if (length >= 1024) {
            sub_string = String.valueOf((float) length / 1024).indexOf(".");
            result = ((float) length / 1024 + "000").substring(0, sub_string + 3) + "KB";
        } else if (length < 1024) result = Long.toString(length) + "B";
        return result;
    }
}
