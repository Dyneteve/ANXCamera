package com.android.camera.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint.Align;
import android.util.AttributeSet;
import android.view.GestureDetector;
import android.view.GestureDetector.OnGestureListener;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Scroller;
import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.CameraAction;

public class HorizontalSlideView extends View {
    private static final String TAG = "HSlideView";
    private HorizontalDrawAdapter mDrawAdapter;
    private GestureDetector mGestureDetector;
    private OnGestureListener mGestureListener = new SimpleOnGestureListener() {
        public boolean onDown(MotionEvent motionEvent) {
            HorizontalSlideView.this.mScroller.forceFinished(true);
            HorizontalSlideView.this.mNeedJustify = false;
            return true;
        }

        public boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            HorizontalSlideView.this.flingX(-((int) f));
            return true;
        }

        public boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            HorizontalSlideView.this.mIsScrollingPerformed = true;
            if (HorizontalSlideView.this.mPositionX == HorizontalSlideView.this.mMinX && f < 0.0f) {
                return false;
            }
            if (HorizontalSlideView.this.mPositionX == HorizontalSlideView.this.mMaxX && f > 0.0f) {
                return false;
            }
            HorizontalSlideView.this.setPositionX((int) (((float) HorizontalSlideView.this.mPositionX) + f));
            return true;
        }

        public boolean onSingleTapUp(MotionEvent motionEvent) {
            HorizontalSlideView.this.scroll((int) (motionEvent.getX() - HorizontalSlideView.this.mOriginX));
            if (HorizontalSlideView.this.mOnTabListener != null) {
                HorizontalSlideView.this.mOnTabListener.onTab(HorizontalSlideView.this);
            }
            return true;
        }
    };
    /* access modifiers changed from: private */
    public boolean mIsScrollingPerformed;
    private boolean mJustifyEnabled = true;
    /* access modifiers changed from: private */
    public int mMaxX = 0;
    /* access modifiers changed from: private */
    public int mMinX = 0;
    /* access modifiers changed from: private */
    public boolean mNeedJustify;
    private OnItemSelectListener mOnItemSelectListener;
    private OnPositionSelectListener mOnPositionSelectListener;
    /* access modifiers changed from: private */
    public OnTabListener mOnTabListener;
    protected float mOriginX;
    protected int mPositionX = 0;
    protected Scroller mScroller;
    protected int mSelectedItemIndex;
    private boolean mTouchDown;

    public static abstract class HorizontalDrawAdapter {
        public abstract void draw(int i, Canvas canvas, boolean z);

        public abstract Align getAlign(int i);

        public abstract int getCount();

        public abstract float measureGap(int i);

        public abstract float measureWidth(int i);
    }

    public interface OnItemSelectListener {
        void onItemSelect(HorizontalSlideView horizontalSlideView, int i);
    }

    public interface OnPositionSelectListener {
        void onPositionSelect(HorizontalSlideView horizontalSlideView, int i, float f);
    }

    public interface OnTabListener {
        void onTab(View view);
    }

    public HorizontalSlideView(Context context) {
        super(context);
        init(context);
    }

    public HorizontalSlideView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init(context);
    }

    public HorizontalSlideView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init(context);
    }

    private float calculateLength(int i, int i2) {
        float f;
        float f2 = this.mOriginX;
        float f3 = 0.0f;
        if (this.mDrawAdapter != null) {
            boolean isLayoutRTL = Util.isLayoutRTL(getContext());
            int count = isLayoutRTL ? this.mDrawAdapter.getCount() - 1 : 0;
            int count2 = isLayoutRTL ? 0 : this.mDrawAdapter.getCount() - 1;
            int i3 = isLayoutRTL ? -1 : 1;
            f = 0.0f;
            float f4 = 0.0f;
            float f5 = 0.0f;
            for (int i4 = 0; i4 < this.mDrawAdapter.getCount(); i4++) {
                int i5 = (i4 * i3) + count;
                boolean z = i5 == count;
                boolean z2 = i5 == count2;
                float itemWidth = getItemWidth(i5);
                float f6 = itemWidth / 2.0f;
                if (z) {
                    f5 = this.mOriginX - f6;
                }
                float f7 = z ? f2 : f5 + f6;
                f5 += z2 ? 0.0f : getItemGap(i4) + itemWidth;
                if (i5 == i) {
                    int i6 = i2;
                    f = f7;
                } else if (i5 == i2) {
                    f4 = f7;
                }
            }
            f3 = f4;
        } else {
            f = 0.0f;
        }
        return Math.abs(f3 - f);
    }

    /* access modifiers changed from: private */
    public void flingX(int i) {
        this.mIsScrollingPerformed = true;
        this.mScroller.fling(this.mPositionX, 0, i, 0, this.mMinX, this.mMaxX, 0, 0);
        invalidate();
    }

    private float getItemGap(int i) {
        return this.mDrawAdapter.measureGap(i);
    }

    private float getItemWidth(int i) {
        return this.mDrawAdapter.measureWidth(i);
    }

    /* access modifiers changed from: private */
    public void scroll(int i) {
        if (i != 0) {
            if (this.mPositionX + i < this.mMinX) {
                i = this.mMinX - this.mPositionX;
            } else if (this.mPositionX + i > this.mMaxX) {
                i = this.mMaxX - this.mPositionX;
            }
            this.mIsScrollingPerformed = true;
            this.mScroller.startScroll(this.mPositionX, 0, i, 0);
            invalidate();
        }
    }

    private void select(int i) {
        CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
        if (cameraAction == null || !cameraAction.isDoingAction()) {
            if (this.mSelectedItemIndex != i || !isScrolling()) {
                this.mSelectedItemIndex = i;
                if (this.mOnItemSelectListener != null) {
                    this.mOnItemSelectListener.onItemSelect(this, this.mSelectedItemIndex);
                }
            }
            if (this.mOnPositionSelectListener != null) {
                float f = ((float) this.mPositionX) / ((float) (this.mMaxX - this.mMinX));
                OnPositionSelectListener onPositionSelectListener = this.mOnPositionSelectListener;
                int i2 = this.mSelectedItemIndex;
                if (Util.isLayoutRTL(getContext())) {
                    f = 1.0f - f;
                }
                onPositionSelectListener.onPositionSelect(this, i2, f);
            }
            return;
        }
        Log.d(TAG, "is doing action, ignore select.");
    }

    /* access modifiers changed from: private */
    public void setPositionX(int i) {
        this.mPositionX = i;
        if (this.mPositionX < this.mMinX) {
            this.mPositionX = this.mMinX;
        } else if (this.mPositionX > this.mMaxX) {
            this.mPositionX = this.mMaxX;
        }
        invalidate();
    }

    public boolean canPositionScroll() {
        return true;
    }

    public int getSelectedItemIndex() {
        return this.mSelectedItemIndex;
    }

    /* access modifiers changed from: protected */
    public void init(Context context) {
        this.mGestureDetector = new GestureDetector(context, this.mGestureListener);
        this.mGestureDetector.setIsLongpressEnabled(false);
        this.mScroller = new Scroller(context);
    }

    public boolean isScrolling() {
        return this.mIsScrollingPerformed;
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        float f;
        Canvas canvas2 = canvas;
        if (this.mScroller.computeScrollOffset()) {
            this.mPositionX = this.mScroller.getCurrX();
            invalidate();
        }
        boolean z = false;
        if (this.mScroller.isFinished() && !this.mTouchDown) {
            this.mIsScrollingPerformed = false;
        }
        float f2 = this.mOriginX - ((float) this.mPositionX);
        float f3 = 2.0f;
        float height = ((float) getHeight()) / 2.0f;
        float f4 = 0.0f;
        if (this.mDrawAdapter != null) {
            boolean isLayoutRTL = Util.isLayoutRTL(getContext());
            int count = isLayoutRTL ? this.mDrawAdapter.getCount() - 1 : 0;
            int count2 = isLayoutRTL ? 0 : this.mDrawAdapter.getCount() - 1;
            int i = isLayoutRTL ? -1 : 1;
            float f5 = f2;
            int i2 = 0;
            float f6 = 0.0f;
            float f7 = 0.0f;
            float f8 = 0.0f;
            boolean z2 = true;
            while (i2 < this.mDrawAdapter.getCount()) {
                int i3 = (i2 * i) + count;
                boolean z3 = i3 == count ? true : z;
                boolean z4 = i3 == count2 ? true : z;
                float itemWidth = getItemWidth(i3);
                float f9 = itemWidth / f3;
                if (z3) {
                    f6 = 0.0f;
                }
                float itemGap = z4 ? 0.0f : getItemGap(i3) / f3;
                if (z3) {
                    f7 = f2 - f9;
                }
                f5 = z3 ? f2 : f7 + f9;
                if (z2) {
                    float f10 = f5 - this.mOriginX;
                    if ((f10 <= 0.0f && (-f10) <= f9 + itemGap) || (f10 > 0.0f && f10 <= f9 + f6)) {
                        select(i3);
                        f8 = f10;
                        z2 = false;
                    }
                }
                f7 += z4 ? 0.0f : itemWidth + getItemGap(i3);
                i2++;
                f6 = itemGap;
                z = false;
                f3 = 2.0f;
            }
            this.mMaxX = (int) (f5 - f2);
            int i4 = 0;
            while (i4 < this.mDrawAdapter.getCount()) {
                int i5 = (i4 * i) + count;
                boolean z5 = i5 == count;
                boolean z6 = i5 == count2;
                float itemWidth2 = getItemWidth(i5);
                float f11 = itemWidth2 / 2.0f;
                if (z5) {
                    f7 = f2 - f11;
                }
                float f12 = z5 ? f2 : f7 + f11;
                float f13 = f7 + itemWidth2;
                if (f13 >= f4 && f7 <= ((float) getWidth())) {
                    canvas.save();
                    if (this.mDrawAdapter.getAlign(i5) == Align.LEFT) {
                        canvas2.translate(f7, height);
                    } else if (this.mDrawAdapter.getAlign(i5) == Align.CENTER) {
                        canvas2.translate(f12, height);
                    } else {
                        canvas2.translate(f13, height);
                    }
                    this.mDrawAdapter.draw(i5, canvas2, this.mSelectedItemIndex == i5);
                    canvas.restore();
                }
                f7 += z6 ? 0.0f : itemWidth2 + getItemGap(i5);
                i4++;
                f4 = 0.0f;
            }
            f = f8;
        } else {
            f = 0.0f;
        }
        if (this.mJustifyEnabled && this.mNeedJustify && this.mScroller.isFinished()) {
            this.mNeedJustify = false;
            scroll((int) f);
        }
    }

    /* access modifiers changed from: protected */
    public void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        this.mOriginX = ((float) i) / 2.0f;
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        boolean onTouchEvent = this.mGestureDetector.onTouchEvent(motionEvent);
        int action = motionEvent.getAction();
        if (action != 3) {
            switch (action) {
                case 0:
                    this.mTouchDown = true;
                    if (!canPositionScroll()) {
                        Log.d(TAG, "cannot scroll, do not process the down event.");
                        return false;
                    }
                    break;
                case 1:
                    break;
            }
        }
        this.mTouchDown = false;
        this.mNeedJustify = true;
        invalidate();
        return onTouchEvent;
    }

    public void setDrawAdapter(HorizontalDrawAdapter horizontalDrawAdapter) {
        this.mDrawAdapter = horizontalDrawAdapter;
        this.mNeedJustify = false;
        this.mSelectedItemIndex = 0;
        this.mScroller.forceFinished(true);
        if (this.mDrawAdapter != null) {
            this.mMaxX = this.mMinX + ((int) calculateLength(0, this.mDrawAdapter.getCount() - 1));
        }
        if (Util.isLayoutRTL(getContext())) {
            this.mPositionX = this.mMaxX;
        } else {
            this.mPositionX = this.mMinX;
        }
        invalidate();
    }

    public void setJustifyEnabled(boolean z) {
        this.mJustifyEnabled = z;
    }

    public void setOnItemSelectListener(OnItemSelectListener onItemSelectListener) {
        this.mOnItemSelectListener = onItemSelectListener;
    }

    public void setOnPositionSelectListener(OnPositionSelectListener onPositionSelectListener) {
        this.mOnPositionSelectListener = onPositionSelectListener;
    }

    public void setOnTabListener(OnTabListener onTabListener) {
        this.mOnTabListener = onTabListener;
    }

    public void setSelection(float f) {
        if (Util.isLayoutRTL(getContext()) && this.mDrawAdapter != null) {
            f = 1.0f - f;
        }
        this.mNeedJustify = false;
        this.mScroller.forceFinished(true);
        this.mPositionX = (int) (f * ((float) (this.mMaxX - this.mMinX)));
        invalidate();
    }

    public void setSelection(int i) {
        if (this.mSelectedItemIndex != i) {
            this.mNeedJustify = false;
            this.mScroller.forceFinished(true);
            if (this.mDrawAdapter != null) {
                if (i >= this.mDrawAdapter.getCount()) {
                    i = this.mDrawAdapter.getCount() - 1;
                }
                if (Util.isLayoutRTL(getContext())) {
                    this.mPositionX = this.mMaxX - ((int) calculateLength(0, i));
                } else {
                    this.mPositionX = this.mMinX + ((int) calculateLength(0, i));
                }
            }
            select(i);
            invalidate();
        }
    }

    public void stopScroll() {
        this.mNeedJustify = true;
        this.mScroller.forceFinished(true);
        invalidate();
    }
}
