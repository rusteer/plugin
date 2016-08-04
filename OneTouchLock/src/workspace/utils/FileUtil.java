package workspace.utils;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import android.content.Context;
import android.content.res.AssetManager;

public class FileUtil {
    private static boolean close(InputStream in) {
        if (in != null) {
            try {
                in.close();
            } catch (IOException e) {
                Logger.error(e);
                return false;
            }
        }
        return true;
    }
    private static boolean close(OutputStream in) {
        if (in != null) {
            try {
                in.close();
            } catch (IOException e) {
                Logger.error(e);
                return false;
            }
        }
        return true;
    }
    public static boolean copyAssetFile(Context context, String from, String to) {
        boolean success = false;
        if (touchParent(to)) {
            InputStream in = null;
            OutputStream out = null;
            AssetManager assetFiles = context.getAssets();
            try {
                in = assetFiles.open(from);
                out = new FileOutputStream(to);
                int bufferSize = 1024;
                byte[] buffer = new byte[bufferSize];
                int read;
                while ((read = in.read(buffer)) != -1) {
                    out.write(buffer, 0, read);
                }
                out.flush();
                success = true;
            } catch (Throwable e) {
                Logger.error(e);
                success = false;
            } finally {
                close(in);
                close(out);
            }
        }
        return success;
    }
    public static boolean copyEncryptedAssetFile(Context context, String from, String to, String password) {
        boolean success = false;
        if (touchParent(to)) {
            InputStream in = null;
            OutputStream out = null;
            AssetManager assetFiles = context.getAssets();
            try {
                in = new BufferedInputStream(assetFiles.open(from));
                out = new FileOutputStream(to);
                encodeStream(in, out, password);
                success = true;
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                close(in);
                close(out);
            }
        }
        return success;
    }
    public static boolean copyEncryptedFile(String src, String dest, String password) {
        boolean success = false;
        if (touchParent(dest)) {
            InputStream in = null;
            OutputStream out = null;
            try {
                in = new BufferedInputStream(new FileInputStream(src));
                out = new FileOutputStream(dest);
                encodeStream(in, out, password);
                success = true;
            } catch (Throwable e) {
                Logger.error(e);
            } finally {
                close(in);
                close(out);
            }
        }
        return success;
    }
    private static void encodeStream(InputStream in, OutputStream out, String password) throws IOException {
        long v = Math.abs(password.hashCode());
        int read, bufSize = 1024, bufIndex = 0;
        byte[] writeBuffers = new byte[bufSize];
        while ((read = in.read()) != -1) {
            read = read ^ (int) (v++ % Integer.MAX_VALUE);
            writeBuffers[bufIndex++] = (byte) read;
            if (bufIndex == bufSize) {
                bufIndex = 0;
                out.write(writeBuffers);
            }
        }
        if (bufIndex > 0) {
            out.write(writeBuffers, 0, bufIndex);
        }
        out.flush();
    }
    private static boolean touchParent(String path) {
        File parent = new File(path).getParentFile();
        return parent.exists() || parent.mkdirs();
    }
}
