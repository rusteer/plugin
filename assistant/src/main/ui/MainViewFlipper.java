package main.ui;
import android.content.Context;
import android.util.AttributeSet;
import android.widget.ViewFlipper;

public class MainViewFlipper extends ViewFlipper {
    public MainViewFlipper(Context context) {
        super(context);
    }
    public MainViewFlipper(Context context, AttributeSet attributeset) {
        super(context, attributeset);
    }
    @Override
    protected void onDetachedFromWindow() {
        try {
            super.onDetachedFromWindow();
        } catch (IllegalArgumentException illegalargumentexception) {
            stopFlipping();
        }
    }
}