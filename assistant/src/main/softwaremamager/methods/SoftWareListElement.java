package main.softwaremamager.methods;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;

/**
 * 软件列表显示 接口
 * @author Administrator
 *
 */
public interface SoftWareListElement {
    /**
     * 资源文件
     * @return
     */
    public int getLayoutId();
    /**
     * 点击
     * @return
     */
    public boolean isClickable();
    /**
     * 获得元素界面
     * @param layoutInflater
     * @param context
     * @param view
     * @return
     */
    public View getViewForListElement(LayoutInflater layoutInflater, Context context, View view);
}
