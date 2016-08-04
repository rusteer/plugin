package net.workspace.listener;
public interface DownloadListener {
    public abstract void onDownloadFinished(int i, String s, String s1, int j);
    public abstract void onDownloadProgress(String s, int i, int j, int k);
}
