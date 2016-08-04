package basic.workspace.common;
import java.io.File;

public abstract class FileCallback {
    public abstract void onCompleted(Throwable e, File result);
    public void onProgress(int downloaded, int total) {}
}
