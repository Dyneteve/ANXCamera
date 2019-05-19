package com.android.camera.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import com.android.camera.R;
import com.android.camera.log.Log;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class SeekBarCompat extends SeekBar implements OnTouchListener, OnSeekBarChangeListener {
    public static final int CENTER_SEEKBAR = 2;
    public static final int NORMAL_SEEKBAR = 1;
    private static final String TAG = SeekBarCompat.class.getSimpleName();
    private boolean mCenterTwoWayMode;
    private OnSeekBarCompatTouchListener mOnSeekBarCompatTouchListener;
    private Paint mPinPointPaint;
    private int mPinProgress;
    private Drawable mPinProgressBgDrawable;
    private int mPinProgressColor;
    private Paint mPinProgressPaint;
    private RectF mPinProgressRectF;
    private float mPinProgressStrokeWidth;
    private int mPinRadius;
    private OnSeekBarCompatChangeListener mSeekBarCompatChangeListener;
    private float mX;

    public interface OnSeekBarCompatChangeListener {
        void onProgressChanged(SeekBar seekBar, int i, boolean z);

        void onStartTrackingTouch(SeekBar seekBar);

        void onStopTrackingTouch(SeekBar seekBar);
    }

    public interface OnSeekBarCompatTouchListener {
        boolean onTouch(View view, MotionEvent motionEvent);
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface SeekBarMode {
    }

    public SeekBarCompat(Context context) {
        this(context, null);
    }

    public SeekBarCompat(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mPinProgressStrokeWidth = 1.4f;
        this.mPinProgressColor = -1;
        setOnSeekBarChangeListener(this);
        setOnTouchListener(this);
    }

    private float clamp(float f) {
        if (getProgress() > getMax() / 2) {
            f = (float) getThumb().getBounds().left;
            if (f < ((float) (getWidth() / 2))) {
                f = (float) (getWidth() / 2);
            }
        }
        if (getProgress() < getMax() / 2) {
            f = (float) getThumb().getBounds().right;
            if (f > ((float) (getWidth() / 2))) {
                f = (float) (getWidth() / 2);
            }
        }
        return f < ((float) getPaddingLeft()) ? (float) getLeft() : f > ((float) (getWidth() - getPaddingRight())) ? (float) (getWidth() - getPaddingRight()) : f;
    }

    public int getPinProgress() {
        return this.mPinProgress;
    }

    public boolean isCenterTwoWayMode() {
        return this.mCenterTwoWayMode;
    }

    /* access modifiers changed from: protected */
    public synchronized void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.mPinProgress != 0) {
            canvas.drawCircle(((float) getWidth()) * (((float) this.mPinProgress) / ((float) getMax())), (float) (getHeight() / 2), (float) this.mPinRadius, this.mPinPointPaint);
        }
        if (this.mCenterTwoWayMode) {
            if (!(this.mPinProgressBgDrawable == null || this.mPinProgressBgDrawable == getProgressDrawable())) {
                setProgressDrawable(this.mPinProgressBgDrawable);
            }
            int height = getHeight() / 2;
            this.mPinProgressRectF = new RectF();
            float width = (float) getWidth();
            this.mPinProgressRectF.left = (((float) this.mPinProgress) / ((float) getMax())) * width;
            int progress = getProgress();
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("current progress:");
            sb.append(progress);
            Log.d(str, sb.toString());
            if (progress == this.mPinProgress) {
                this.mPinProgressRectF.right = width / 2.0f;
            } else {
                if (this.mX == 0.0f) {
                    this.mX = (float) (getThumb().getBounds().left + (getThumb().getBounds().width() / 2));
                }
                this.mPinProgressRectF.right = clamp(this.mX);
            }
            float f = (float) height;
            this.mPinProgressRectF.top = f - (this.mPinProgressStrokeWidth / 2.0f);
            this.mPinProgressRectF.bottom = f + (this.mPinProgressStrokeWidth / 2.0f);
            canvas.drawRoundRect(this.mPinProgressRectF, 0.0f, 0.0f, this.mPinProgressPaint);
            this.mX = 0.0f;
        }
    }

    public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
        if (this.mSeekBarCompatChangeListener != null) {
            if (this.mCenterTwoWayMode) {
                i -= this.mPinProgress;
            }
            this.mSeekBarCompatChangeListener.onProgressChanged(seekBar, i, z);
        }
    }

    public void onStartTrackingTouch(SeekBar seekBar) {
        if (this.mSeekBarCompatChangeListener != null) {
            this.mSeekBarCompatChangeListener.onStartTrackingTouch(seekBar);
        }
    }

    public void onStopTrackingTouch(SeekBar seekBar) {
        if (this.mSeekBarCompatChangeListener != null) {
            this.mSeekBarCompatChangeListener.onStopTrackingTouch(seekBar);
        }
    }

    public boolean onTouch(View view, MotionEvent motionEvent) {
        if (this.mCenterTwoWayMode) {
            this.mX = motionEvent.getX();
            invalidate();
        }
        if (this.mOnSeekBarCompatTouchListener != null) {
            return this.mOnSeekBarCompatTouchListener.onTouch(view, motionEvent);
        }
        return false;
    }

    public void setCenterTwoWayMode(boolean z) {
        this.mCenterTwoWayMode = z;
        if (this.mCenterTwoWayMode) {
            invalidate();
        }
    }

    public void setOnSeekBarChangeListener(OnSeekBarCompatChangeListener onSeekBarCompatChangeListener) {
        this.mSeekBarCompatChangeListener = onSeekBarCompatChangeListener;
    }

    public void setOnSeekBarCompatTouchListener(OnSeekBarCompatTouchListener onSeekBarCompatTouchListener) {
        this.mOnSeekBarCompatTouchListener = onSeekBarCompatTouchListener;
    }

    public synchronized void setProgress(int i) {
        if (this.mCenterTwoWayMode) {
            super.setProgress(i + this.mPinProgress);
        } else {
            super.setProgress(i);
        }
    }

    public void setSeekBarPinProgress(int i) {
        int max = getMax();
        int min = getMin();
        if (i == max || i == min) {
            this.mPinProgress = 0;
            return;
        }
        this.mPinProgress = i;
        if (this.mPinProgressBgDrawable == null) {
            this.mPinProgressBgDrawable = getResources().getDrawable(R.drawable.center_seekbar_style);
            this.mPinProgressPaint = new Paint();
            this.mPinProgressPaint.setStrokeWidth(this.mPinProgressStrokeWidth);
            this.mPinProgressPaint.setColor(this.mPinProgressColor);
            this.mPinProgressPaint.setAntiAlias(true);
            this.mPinPointPaint = new Paint();
            this.mPinPointPaint.setStyle(Style.FILL);
            this.mPinPointPaint.setColor(-1);
            this.mPinPointPaint.setAntiAlias(true);
            this.mPinRadius = getResources().getDimensionPixelSize(R.dimen.beauty_seek_bar_point_radius);
        }
    }
}
