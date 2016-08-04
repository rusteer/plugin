package main.batterymanager.methods;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.widget.AbsSeekBar;

public class VerticalSeekBar extends AbsSeekBar {
    private Drawable mThumb;
    private int height;
    private int width;
    //	public interface OnSeekBarChangeListener {
    //		void onProgressChanged(VerticalSeekBar verticalSeekBar, int progress,
    //				boolean fromUser);
    //
    //		void onStartTrackingTouch(VerticalSeekBar verticalSeekBar);
    //
    //		void onStopTrackingTouch(VerticalSeekBar verticalSeekBar);
    //	}
    //	private OnSeekBarChangeListener mOnSeekBarChangeListener;
    public VerticalSeekBar(Context context) {
        this(context, null);
        setThumbOffset(10000);
    }
    public VerticalSeekBar(Context context, AttributeSet attrs) {
        this(context, attrs, android.R.attr.seekBarStyle);
    }
    public VerticalSeekBar(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }
    //	public void setOnSeekBarChangeListener(OnSeekBarChangeListener l) {
    ////		mOnSeekBarChangeListener = l;
    //	}
    void onStartTrackingTouch() {
        //		if (mOnSeekBarChangeListener != null) {
        //			mOnSeekBarChangeListener.onStartTrackingTouch(this);
        //		}
    }
    void onStopTrackingTouch() {
        //		if (mOnSeekBarChangeListener != null) {
        //			mOnSeekBarChangeListener.onStopTrackingTouch(this);
        //		}
    }
    void onProgressRefresh(float scale, boolean fromUser) {
        Drawable thumb = mThumb;
        if (thumb != null) {
            setThumbPos(getHeight(), thumb, scale, Integer.MIN_VALUE);
            invalidate();
        }
        //		if (mOnSeekBarChangeListener != null) {
        //			mOnSeekBarChangeListener.onProgressChanged(this, getProgress(),
        //					fromUser);
        //		}
    }
    private void setThumbPos(int w, Drawable thumb, float scale, int gap) {
        // The extra space for the thumb to move on the track
        if (gap == Integer.MIN_VALUE) {} else {}
        //thumb.setBounds(thumbPos, topBound, thumbPos + thumbWidth, bottomBound);
    }
    @Override
    protected void onDraw(Canvas c) {
        c.rotate(-90);
        c.translate(-height, 0);
        super.onDraw(c);
    }
    @Override
    protected synchronized void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        //		width = 33;
        //height = 250;
        //Rect oldBounds = mThumb.getBounds();
        //mThumb.setBounds(oldBounds.left, oldBounds.top, oldBounds.right, oldBounds.bottom + 3);
        height = View.MeasureSpec.getSize(heightMeasureSpec);
        width = View.MeasureSpec.getSize(widthMeasureSpec);
        setMeasuredDimension(width, height);
    }
    @Override
    public void setThumb(Drawable thumb) {
        mThumb = thumb;
        super.setThumb(null);
    }
    @Override
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(h, w, oldw, oldh);
    }
    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (!isEnabled()) { return false; }
        /*switch (event.getAction()) {
        case MotionEvent.ACTION_DOWN:
        	setPressed(true);
        	onStartTrackingTouch();
        	trackTouchEvent(event);
        	break;

        case MotionEvent.ACTION_MOVE:
        	trackTouchEvent(event);
        	attemptClaimDrag();
        	break;

        case MotionEvent.ACTION_UP:
        	trackTouchEvent(event);
        	onStopTrackingTouch();
        	setPressed(false);
        	break;

        case MotionEvent.ACTION_CANCEL:
        	onStopTrackingTouch();
        	setPressed(false);
        	break;
        }*/
        return true;
    }
    @Override
    public boolean dispatchKeyEvent(KeyEvent event) {
        if (event.getAction() == KeyEvent.ACTION_DOWN) {
            KeyEvent newEvent = null;
            switch (event.getKeyCode()) {
                case KeyEvent.KEYCODE_DPAD_UP:
                    newEvent = new KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_DPAD_RIGHT);
                    break;
                case KeyEvent.KEYCODE_DPAD_DOWN:
                    newEvent = new KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_DPAD_LEFT);
                    break;
                case KeyEvent.KEYCODE_DPAD_LEFT:
                    newEvent = new KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_DPAD_DOWN);
                    break;
                case KeyEvent.KEYCODE_DPAD_RIGHT:
                    newEvent = new KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_DPAD_UP);
                    break;
                default:
                    newEvent = new KeyEvent(KeyEvent.ACTION_DOWN, event.getKeyCode());
                    break;
            }
            return newEvent.dispatch(this);
        }
        return false;
    }
}
