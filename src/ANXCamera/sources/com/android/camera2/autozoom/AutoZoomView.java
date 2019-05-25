package com.android.camera2.autozoom;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.os.SystemClock;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.util.Size;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import com.android.camera.module.ModuleManager;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.AutoZoomModuleProtocol;
import com.android.camera.protocol.ModeProtocol.AutoZoomViewProtocol;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.oneplus.camera.R;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

public class AutoZoomView extends View implements OnTouchListener, IObjectView {
    public static final long TAP_INTERVAL = 1000;
    public static final float TOLERATE_Y = 10.0f;
    /* access modifiers changed from: private */
    public int[] mAutoZoomActiveObjects;
    /* access modifiers changed from: private */
    public RectF mAutoZoomBound;
    /* access modifiers changed from: private */
    public int[] mAutoZoomPausedObjects;
    /* access modifiers changed from: private */
    public int[] mAutoZoomSelectedObjects;
    /* access modifiers changed from: private */
    public int mAutoZoomStatus;
    private AtomicBoolean mBeginLost;
    private float mBoundWidth;
    private AtomicBoolean mEndLost;
    /* access modifiers changed from: private */
    public long mLastTapTime;
    private Paint mPathPaint;
    private Size mPreviewSize;
    private Paint mRectPaint;
    private int mTolerateY;
    List<AutoZoomTracker> mTrackers;
    private AtomicBoolean mViewActive;
    private AtomicBoolean mViewEnabled;

    public AutoZoomView(Context context) {
        this(context, null);
    }

    public AutoZoomView(Context context, @Nullable AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public AutoZoomView(Context context, @Nullable AttributeSet attributeSet, int i) {
        this(context, attributeSet, i, 0);
    }

    public AutoZoomView(Context context, @Nullable AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
        this.mTrackers = new ArrayList();
        this.mBoundWidth = 1.0f;
        init();
    }

    private RectF fillBoundsInOverlay(int i, float[] fArr) {
        if (this.mPreviewSize == null || fArr == null) {
            return null;
        }
        int i2 = i * 4;
        int i3 = i2 + 3;
        if (fArr.length <= i3) {
            return null;
        }
        float f = fArr[i2];
        float f2 = fArr[i2 + 1];
        RectF rectF = new RectF(f / ((float) this.mPreviewSize.getWidth()), f2 / ((float) this.mPreviewSize.getHeight()), (f + fArr[i2 + 2]) / ((float) this.mPreviewSize.getWidth()), (f2 + fArr[i3]) / ((float) this.mPreviewSize.getHeight()));
        AutoZoomUtils.fromVidhanceCoordinateSystem(rectF);
        AutoZoomUtils.rotateFromVidhance(getContext(), rectF);
        AutoZoomUtils.normalizedRectToSize(rectF, new Size(getWidth(), getHeight()));
        return rectF;
    }

    private RectF getTapedRect(float f, float f2) {
        float width = (f / ((float) getWidth())) - 0.1f;
        float height = (f2 / ((float) getHeight())) - 0.1f;
        return new RectF(width, height, width + 0.2f, 0.2f + height);
    }

    private void init() {
        this.mViewEnabled = new AtomicBoolean(false);
        this.mViewActive = new AtomicBoolean(false);
        this.mBeginLost = new AtomicBoolean(false);
        this.mEndLost = new AtomicBoolean(false);
        this.mRectPaint = new Paint();
        this.mRectPaint.setAntiAlias(true);
        this.mRectPaint.setXfermode(new PorterDuffXfermode(Mode.CLEAR));
        this.mPathPaint = new Paint();
        this.mPathPaint.setAntiAlias(true);
        this.mPathPaint.setStrokeWidth(this.mBoundWidth);
        this.mPathPaint.setStyle(Style.STROKE);
        this.mPathPaint.setColor(getContext().getColor(R.color.white_80));
        this.mTolerateY = AutoZoomUtils.dp2px(getContext(), 10.0f);
        setWillNotDraw(false);
        setOnTouchListener(this);
        setLayerType(2, null);
    }

    private boolean isLost() {
        return this.mAutoZoomActiveObjects == null && this.mAutoZoomPausedObjects == null && !isMoving() && this.mAutoZoomSelectedObjects == null;
    }

    private boolean isLosting() {
        return isMoving() && this.mAutoZoomSelectedObjects == null && this.mAutoZoomActiveObjects != null && this.mAutoZoomPausedObjects != null && this.mAutoZoomActiveObjects[0] == this.mAutoZoomPausedObjects[0];
    }

    private boolean isTrackingNotLost() {
        return this.mAutoZoomActiveObjects != null && this.mAutoZoomPausedObjects == null;
    }

    private void tapAt(float f, float f2) {
        if (this.mViewEnabled.get() && this.mPreviewSize != null && SystemClock.uptimeMillis() - this.mLastTapTime >= 1000) {
            AutoZoomModuleProtocol autoZoomModuleProtocol = (AutoZoomModuleProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(215);
            if (this.mTrackers.size() >= 1 && autoZoomModuleProtocol != null) {
                autoZoomModuleProtocol.setAutoZoomStopCapture(0);
            }
            RectF tapedRect = getTapedRect(f, f2);
            AutoZoomUtils.rotateToVidhance(getContext(), tapedRect);
            AutoZoomUtils.toVidhanceCoordinateSystem(tapedRect);
            AutoZoomUtils.normalizedRectToSize(tapedRect, this.mPreviewSize);
            AutoZoomViewProtocol autoZoomViewProtocol = (AutoZoomViewProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(214);
            if (autoZoomViewProtocol != null) {
                setViewActive(true);
                if (!isViewVisibile()) {
                    setVisibility(0);
                }
                autoZoomViewProtocol.onTrackingStarted(tapedRect);
            }
            this.mLastTapTime = SystemClock.uptimeMillis();
        }
    }

    public void clear(final int i) {
        if (i != -1) {
            post(new Runnable() {
                public void run() {
                    AutoZoomView.this.mTrackers.clear();
                    AutoZoomView.this.mAutoZoomStatus = 0;
                    AutoZoomView.this.mAutoZoomBound = null;
                    AutoZoomView.this.mAutoZoomPausedObjects = null;
                    AutoZoomView.this.mAutoZoomActiveObjects = null;
                    AutoZoomView.this.mLastTapTime = 0;
                    AutoZoomView.this.mAutoZoomSelectedObjects = null;
                    if (AutoZoomView.this.getVisibility() != i) {
                        AutoZoomView.this.setVisibility(i);
                    }
                }
            });
        }
        postInvalidate();
    }

    public void feedData(AutoZoomCaptureResult autoZoomCaptureResult) {
        if (this.mViewEnabled.get() && this.mViewActive.get() && this.mPreviewSize != null) {
            float[] autoZoomBounds = autoZoomCaptureResult.getAutoZoomBounds();
            if (autoZoomBounds != null) {
                this.mAutoZoomStatus = autoZoomCaptureResult.getAutoZoomStatus();
                int[] autoZoomActiveObjects = autoZoomCaptureResult.getAutoZoomActiveObjects();
                ArrayList arrayList = new ArrayList();
                if (autoZoomActiveObjects != null) {
                    for (int i = 0; i < autoZoomActiveObjects.length; i++) {
                        arrayList.add(new AutoZoomTracker(autoZoomActiveObjects[i], fillBoundsInOverlay(i, autoZoomCaptureResult.getAutoZoomObjectBoundsStabilized())));
                    }
                }
                this.mTrackers = arrayList;
                this.mAutoZoomPausedObjects = autoZoomCaptureResult.getAutoZoomPausedObjects();
                this.mAutoZoomActiveObjects = autoZoomCaptureResult.getAutoZoomActiveObjects();
                this.mAutoZoomSelectedObjects = autoZoomCaptureResult.getAutoZoomSelectedObjects();
                this.mAutoZoomBound = fillBoundsInOverlay(0, autoZoomBounds);
                AutoZoomModuleProtocol autoZoomModuleProtocol = (AutoZoomModuleProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(215);
                if (isLosting() && !this.mBeginLost.get()) {
                    this.mBeginLost.getAndSet(true);
                    if (autoZoomModuleProtocol != null) {
                        autoZoomModuleProtocol.onTrackLosting();
                    }
                }
                if (isLost() && this.mBeginLost.get() && !this.mEndLost.get()) {
                    this.mEndLost.getAndSet(true);
                    if (autoZoomModuleProtocol != null) {
                        autoZoomModuleProtocol.onTrackLost();
                    }
                }
                if (this.mAutoZoomBound != null) {
                    postInvalidate();
                }
            }
        }
    }

    public Size getPreviewSize() {
        return this.mPreviewSize;
    }

    public boolean isMoving() {
        return (this.mAutoZoomStatus & 32) == 32;
    }

    public boolean isViewActive() {
        return this.mViewActive.get();
    }

    public boolean isViewEnabled() {
        return this.mViewEnabled.get();
    }

    public boolean isViewVisibile() {
        return getVisibility() == 0;
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.mViewEnabled.get() && this.mViewActive.get() && this.mAutoZoomBound != null) {
            canvas.drawColor(getContext().getColor(R.color.semi_transparent_dark));
            canvas.drawRect(this.mAutoZoomBound, this.mRectPaint);
            if (!isLost()) {
                canvas.drawRect(this.mAutoZoomBound, this.mPathPaint);
            }
        }
    }

    public boolean onTouch(View view, MotionEvent motionEvent) {
        if (motionEvent.getAction() == 0) {
            TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
            if (topAlert != null && topAlert.isExtraMenuShowing()) {
                return false;
            }
        }
        return onViewTouchEvent(motionEvent);
    }

    public boolean onViewTouchEvent(MotionEvent motionEvent) {
        if (!this.mViewEnabled.get() || !ModuleManager.isVideoModule() || motionEvent.getY() < ((float) this.mTolerateY)) {
            return false;
        }
        switch (motionEvent.getAction()) {
            case 0:
                if (this.mViewEnabled.get()) {
                    return true;
                }
                break;
            case 1:
                tapAt(motionEvent.getX(), motionEvent.getY());
                return true;
        }
        return false;
    }

    public void setPreviewSize(Size size) {
        this.mPreviewSize = size;
    }

    public void setViewActive(boolean z) {
        this.mBeginLost.getAndSet(false);
        this.mEndLost.getAndSet(false);
        this.mViewActive.getAndSet(z);
    }

    public void setViewEnable(boolean z) {
        this.mViewEnabled.getAndSet(z);
    }

    public void setViewVisibility(final int i) {
        post(new Runnable() {
            public void run() {
                AutoZoomView.this.setVisibility(i);
            }
        });
    }
}
