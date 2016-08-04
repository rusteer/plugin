package main.ui;
import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.widget.LinearLayout;

public class GuesterLinearLayout extends LinearLayout {
    public GuesterLinearLayout(Context context) {
        super(context);
        // TODO Auto-generated constructor stub
    }
    public GuesterLinearLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
    }
    //true 交给父，false 交给子view
    @Override
    public boolean onInterceptTouchEvent(MotionEvent event) {
        //			onTouchEvent(event);
        if (l != null) l.onTouch(this, event);
        return false;//子
    }
    @Override
    public void setOnTouchListener(OnTouchListener l) {
        // TODO Auto-generated method stub
        super.setOnTouchListener(l);
        this.l = l;
    }
    OnTouchListener l;
}
