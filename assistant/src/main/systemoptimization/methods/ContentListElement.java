package main.systemoptimization.methods;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * 列表每一行的生成
 * @author Administrator
 *
 */
public class ContentListElement implements ListElement {
    private Drawable image = null;
    private String appName = "";
    private String packageName = "";
    private String serviceName = "";
    private String state = "";
    private int id;
    private Bitmap icon;
    public Drawable getImage() {
        return image;
    }
    public void setImage(Drawable image) {
        this.image = image;
    }
    public String getAppName() {
        return appName;
    }
    public void setAppName(String appName) {
        this.appName = appName;
    }
    public String getPackageName() {
        return packageName;
    }
    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }
    public String getServiceName() {
        return serviceName;
    }
    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }
    public String getState() {
        return state;
    }
    public void setState(String state) {
        this.state = state;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public Bitmap getIcon() {
        return icon;
    }
    public void setIcon(Bitmap icon) {
        this.icon = icon;
    }
    @Override
    public int getLayoutId() {
        // TODO Auto-generated method stub
        return biz.AR.layout.system_bootsporpspeedup_item;
    }
    @Override
    public View getViewForListElement(LayoutInflater layoutInflater, Context context, View view) {
        // TODO Auto-generated method stub
        LinearLayout layout = (LinearLayout) layoutInflater.inflate(getLayoutId(), null);
        TextView textView = (TextView) layout.findViewById(biz.AR.id.system_BootStarpSpeedup_item_appName);
        TextView packView = (TextView) layout.findViewById(biz.AR.id.system_BootStarpSpeedup_item_appPackageName);
        ImageView imageView = (ImageView) layout.findViewById(biz.AR.id.system_BootStarpSpeedup_item_icon);
        ImageView allowBtn = (ImageView) layout.findViewById(biz.AR.id.system_bootsporpspeedup_item_kill_allow);
        ImageView banBtn = (ImageView) layout.findViewById(biz.AR.id.system_bootsporpspeedup_item_kill_ban);
        if (image != null) {
            imageView.setImageDrawable(image);
        } else {
            imageView.setImageBitmap(icon);
        }
        textView.setText(appName);
        packView.setText(serviceName);
        int textColorWarnValue = 0xffff0000;// 异常文字颜色值
        if (state.equals("1")) {
            // 为启动
            allowBtn.setVisibility(View.GONE);
            banBtn.setVisibility(View.VISIBLE);
        } else {
            packView.setTextColor(textColorWarnValue);
            packView.getPaint().setFlags(Paint.STRIKE_THRU_TEXT_FLAG);
            allowBtn.setVisibility(View.VISIBLE);
            banBtn.setVisibility(View.GONE);
        }
        return layout;
    }
    @Override
    public boolean isClickable() {
        // TODO Auto-generated method stub
        return true;
    }
}
