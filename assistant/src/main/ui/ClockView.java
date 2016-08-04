package main.ui;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.DrawFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PaintFlagsDrawFilter;
import android.graphics.drawable.BitmapDrawable;
import android.os.Handler;
import android.util.AttributeSet;
import android.view.View;

public class ClockView extends View {
    int memoryRate = 20;
    int cpuRate = 20;
    final int BEGINRATE = 70;
    Handler tickHandler;
    int left; //整个View的位置
    int top;
    Bitmap mBitMapGround; //背景图及其大小
    Bitmap mMemoryBitmapResource;//内存圆盘图及其大小
    Bitmap mMemoryZhenResource;//内存指示针
    Bitmap mCPUBitmapResource;//CPU圆盘图及其大小
    Bitmap cpuZhenResource;//cpu指示针
    int memResourceWidth; //内存指示针中心偏移量
    int menResourceHight;
    int memPanCenterX; //内存盘绘制位置
    int memPanCenterY;
    int memoryStringX;//内存文字绘制位置
    int memoryStringY;
    int memoryBeginDegrees = BEGINRATE;
    int memoryEndDegrees = BEGINRATE;
    int memoryDrawDegrees = 0;
    int memoryCurrentTimes = 0;
    Matrix memoryMatrix;
    Paint memoryPaint;
    String memoryText = "";
    int cpuResourceWidth; //CPU指示针中心偏移量
    int cpuResourceHight;
    int cpuPanCenterX; //内存盘绘制位置
    int cpuPanCenterY;
    int cpuStringX;//内存文字绘制位置
    int cpuStringY;
    int cpuBeginDegrees = BEGINRATE;
    int cpuEndDegrees = BEGINRATE;
    int cpuDrawDegrees = 0;
    int cpuCurrentTimes = 0;
    Matrix cpuMatrix;
    Paint cpuPaint;
    String cpuText = "";
    Context mContext;
    Paint aliasPaint;
    DrawFilter drawFilter;
    int width;
    int height;
    public ClockView(Context context) {
        super(context);
        mContext = context;
        init();
    }
    public ClockView(Context context, AttributeSet attrs) {
        super(context, attrs);
        mContext = context;
        init();
    }
    public ClockView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        mContext = context;
        init();
    }
    private void init() {
        left = getLeft();
        top = getTop();
        mBitMapGround = ((BitmapDrawable) mContext.getResources().getDrawable(biz.AR.drawable.clock_bg)).getBitmap();
        int bgWidth = mBitMapGround.getWidth();
        int bgHeight = mBitMapGround.getHeight();
        mMemoryBitmapResource = ((BitmapDrawable) mContext.getResources().getDrawable(biz.AR.drawable.clock_memory_pan)).getBitmap();
        int memoryWidth = mMemoryBitmapResource.getWidth();
        int memoryHeigh = mMemoryBitmapResource.getHeight();
        mMemoryZhenResource = ((BitmapDrawable) mContext.getResources().getDrawable(biz.AR.drawable.clock_memory_zhen)).getBitmap();
        mCPUBitmapResource = ((BitmapDrawable) mContext.getResources().getDrawable(biz.AR.drawable.clock_cpu_pan)).getBitmap();
        int cpuWidth = mCPUBitmapResource.getWidth();
        int cpuHeigh = mCPUBitmapResource.getHeight();
        cpuZhenResource = ((BitmapDrawable) mContext.getResources().getDrawable(biz.AR.drawable.clock_cpu_zhen)).getBitmap();
        memResourceWidth = memoryWidth / 2;
        menResourceHight = memoryHeigh / 2;
        memPanCenterX = left + 5;
        memPanCenterY = top + (bgHeight - memoryHeigh) / 2;
        memoryStringX = left + 25;
        memoryStringY = top + bgHeight * 3 / 4 + 5;
        memoryPaint = new Paint();
        memoryPaint.setColor(mContext.getResources().getColor(biz.AR.color.txt_label_blue));
        memoryPaint.setTextSize(dip2px(10));
        memoryMatrix = new Matrix();
        cpuResourceWidth = cpuWidth / 2;
        cpuResourceHight = cpuHeigh / 2;
        cpuPanCenterX = left + bgWidth - cpuWidth - 4;
        cpuPanCenterY = top + bgHeight - cpuHeigh - 5;
        cpuStringX = left + bgWidth - cpuWidth + 8;
        cpuStringY = top + bgHeight - cpuHeigh / 4;
        cpuPaint = new Paint();
        cpuPaint.setColor(mContext.getResources().getColor(biz.AR.color.txt_label_blue));
        cpuPaint.setTextSize(dip2px(7));
        cpuMatrix = new Matrix();
        setMemoryDegrees(0);
        setCpuDegrees(0);
        aliasPaint = new Paint();
        aliasPaint.setAntiAlias(true);
        drawFilter = new PaintFlagsDrawFilter(0, Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
        run();
    }
    public void run() {
        tickHandler = new Handler();
        tickHandler.post(tickRunnable);
    }
    private Runnable tickRunnable = new Runnable() {
        @Override
        public void run() {
            postInvalidate();
            tickHandler.postDelayed(tickRunnable, 50);
        }
    };
    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.setDrawFilter(drawFilter);
        canvas.drawBitmap(mBitMapGround, left, top, null);
        drawMenory(canvas);
        drawCPU(canvas);
    }
    private void drawMenory(Canvas canvas) {
        canvas.drawBitmap(mMemoryBitmapResource, memPanCenterX, memPanCenterY, null);
        memoryMatrix.reset();
        if (memoryBeginDegrees == memoryEndDegrees) {
            memoryDrawDegrees = 0;
        } else {
            if (memoryCurrentTimes == 0) {
                memoryRate = Math.abs(memoryEndDegrees - memoryBeginDegrees) / 2;
            }
            if (memoryCurrentTimes == memoryRate) {
                memoryBeginDegrees = memoryEndDegrees;
                memoryDrawDegrees = 0;
                memoryCurrentTimes = 0;
            } else {
                if (memoryEndDegrees > memoryBeginDegrees) {
                    memoryDrawDegrees += 2f;
                } else {
                    memoryDrawDegrees -= 2f;
                }
                memoryCurrentTimes++;
            }
        }
        memoryMatrix.postRotate(memoryBeginDegrees + memoryDrawDegrees, memResourceWidth, menResourceHight);
        memoryMatrix.postTranslate(memPanCenterX, memPanCenterY);
        canvas.drawBitmap(mMemoryZhenResource, memoryMatrix, aliasPaint);
        drawText(canvas, memoryText, memPanCenterX, memoryStringY, memResourceWidth * 2, memoryPaint);
    }
    private void drawCPU(Canvas canvas) {
        canvas.drawBitmap(mCPUBitmapResource, cpuPanCenterX, cpuPanCenterY, null);
        cpuMatrix.reset();
        if (cpuBeginDegrees == cpuEndDegrees) {
            cpuDrawDegrees = 0;
        } else {
            if (cpuCurrentTimes == 0) {
                cpuRate = Math.abs(cpuEndDegrees - cpuBeginDegrees) / 2;
            }
            if (cpuCurrentTimes == cpuRate) {
                cpuBeginDegrees = cpuEndDegrees;
                cpuDrawDegrees = 0;
                cpuCurrentTimes = 0;
            } else {
                if (cpuEndDegrees > cpuBeginDegrees) {
                    cpuDrawDegrees += 2f;
                } else {
                    cpuDrawDegrees -= 2f;
                }
                cpuCurrentTimes++;
            }
        }
        cpuMatrix.postRotate(cpuBeginDegrees + cpuDrawDegrees, cpuResourceWidth, cpuResourceHight);
        cpuMatrix.postTranslate(cpuPanCenterX, cpuPanCenterY);
        canvas.drawBitmap(cpuZhenResource, cpuMatrix, aliasPaint);
        drawText(canvas, cpuText, cpuPanCenterX, cpuStringY, cpuResourceWidth * 2, cpuPaint);
    }
    public void setCpuDegrees(int Rate) {
        cpuEndDegrees = Rate * 2 + BEGINRATE;
        cpuText = "CPU:" + Rate + "%";
    }
    public int getCpuDegrees() {
        return cpuEndDegrees;
    }
    public void setMemoryDegrees(int Rate) {
        memoryEndDegrees = Rate * 2 + BEGINRATE;
        memoryText = "内存:" + Rate + "%";
    }
    public int getMemoryDegrees() {
        return memoryEndDegrees;
    }
    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        height = View.MeasureSpec.getSize(heightMeasureSpec);
        width = View.MeasureSpec.getSize(widthMeasureSpec);
        setMeasuredDimension(width, height);
    }
    // 居中显示文字时调用，返回文字显示的起始位置
    private void drawText(Canvas canvas, String text, int positionX, int positionY, int width, Paint paint) {
        int textWidth = (int) paint.measureText(text);
        int namestart = (width - textWidth) / 2;
        canvas.drawText(text, positionX + namestart, positionY, paint);
    }
    /**
    * 根据手机的分辨率从 dp 的单位 转成为 px(像素)
    */
    public int dip2px(float dpValue) {
        final float scale = mContext.getResources().getDisplayMetrics().density;
        return (int) (dpValue * scale + 0.5f);
    }
    /**
    * 根据手机的分辨率从 px(像素) 的单位 转成为 dp
    */
    public int px2dip(float pxValue) {
        final float scale = mContext.getResources().getDisplayMetrics().density;
        return (int) (pxValue / scale + 0.5f);
    }
}
