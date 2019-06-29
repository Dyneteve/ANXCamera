package com.android.camera.ui;

import android.animation.Animator;
import android.animation.AnimatorInflater;
import android.animation.AnimatorListenerAdapter;
import android.animation.Keyframe;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Point;
import android.graphics.PointF;
import android.graphics.RectF;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.animation.Interpolator;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.runing.ComponentRunningTiltValue;
import com.android.camera.effect.EffectController;
import com.mi.config.b;
import miui.view.animation.CubicEaseOutInterpolator;

public class V6EffectCropView extends View implements V6FunctionUI {
    private static final int ANIMATE_RADIUS = 2;
    private static final int ANIMATE_RANGE = 1;
    private static final int ANIMATE_START_RADIUS = (Util.sWindowHeight / 2);
    private static final int ANIMATE_START_RANGE = Util.sWindowHeight;
    private static final int ANIMATION_TIME = 600;
    private static final int CIRCLE_RESIZE_TOUCH_TOLERANCE = Util.dpToPixel(36.0f);
    private static final int CORNER_BALL_RADIUS = Util.dpToPixel(5.0f);
    private static final int DEFAULT_RADIUS = (Util.sWindowHeight / 6);
    private static final int DEFAULT_RANGE = (Util.sWindowHeight / 3);
    private static final int HIDE_TILT_SHIFT_MASK = 2;
    private static final int MIN_CROP_WIDTH_HEIGHT = Util.dpToPixel(64.0f);
    private static final float MIN_DIS_FOR_MOVE_POINT = ((float) (Util.dpToPixel(30.0f) * Util.dpToPixel(30.0f)));
    private static final int MIN_DIS_FOR_SLOPE = (Util.dpToPixel(10.0f) * Util.dpToPixel(10.0f));
    private static final int MIN_RANGE = Util.dpToPixel(20.0f);
    private static final int MOVE_BLOCK = 16;
    private static final int MOVE_BOTTOM = 8;
    private static final int MOVE_LEFT = 1;
    private static final int MOVE_POINT1 = 257;
    private static final int MOVE_POINT2 = 258;
    private static final int MOVE_RADIUS = 32;
    private static final int MOVE_RANGE = 260;
    private static final int MOVE_RIGHT = 4;
    private static final int MOVE_TOP = 2;
    private static final int SHOW_TILT_SHIFT_MASK = 1;
    private static final int TOUCH_TOLERANCE = Util.dpToPixel(18.0f);
    private Handler mAnimateHandler;
    /* access modifiers changed from: private */
    public int mAnimateRadius = 0;
    /* access modifiers changed from: private */
    public int mAnimateRangeWidth = 0;
    private HandlerThread mAnimateThread;
    /* access modifiers changed from: private */
    public int mAnimationStartRadius;
    /* access modifiers changed from: private */
    public int mAnimationStartRange;
    /* access modifiers changed from: private */
    public long mAnimationStartTime;
    /* access modifiers changed from: private */
    public long mAnimationTotalTime;
    private final Paint mBorderPaint = new Paint();
    private int mCenterLineSquare;
    private final Paint mCornerPaint;
    /* access modifiers changed from: private */
    public final RectF mCropBounds = new RectF();
    /* access modifiers changed from: private */
    public final RectF mDefaultCircleBounds = new RectF();
    private final RectF mDefaultRectBounds = new RectF();
    private final RectF mDisplayBounds = new RectF();
    private final PointF mEffectPoint1 = new PointF();
    private final PointF mEffectPoint2 = new PointF();
    private final RectF mEffectRect = new RectF(0.0f, 0.0f, 1.0f, 1.0f);
    /* access modifiers changed from: private */
    public Interpolator mInterpolator = new CubicEaseOutInterpolator();
    private boolean mIsCircle;
    private boolean mIsInTapSlop;
    private boolean mIsRect;
    private double mLastMoveDis;
    private float mLastX;
    private float mLastY;
    private int mMaxRange;
    private int mMovingEdges;
    private float mNormalizedWidth = 0.0f;
    private final Point mPoint1 = new Point();
    private final Point mPoint2 = new Point();
    /* access modifiers changed from: private */
    public int mRadius = 0;
    /* access modifiers changed from: private */
    public int mRangeWidth = 0;
    private int mTapSlop;
    /* access modifiers changed from: private */
    public boolean mTiltShiftMaskAlive;
    /* access modifiers changed from: private */
    public ObjectAnimator mTiltShiftMaskFadeInAnimator;
    /* access modifiers changed from: private */
    public ObjectAnimator mTiltShiftMaskFadeOutAnimator;
    private AnimatorListenerAdapter mTiltShiftMaskFadeOutListener = new AnimatorListenerAdapter() {
        public void onAnimationStart(Animator animator) {
            super.onAnimationStart(animator);
            if (V6EffectCropView.this.mTiltShiftMaskFadeOutAnimator.isRunning()) {
                V6EffectCropView.this.mTiltShiftMaskAlive = false;
            }
        }
    };
    private Handler mTiltShiftMaskHandler;
    private final Point mTouchCenter = new Point();
    private boolean mVisible;

    public V6EffectCropView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mBorderPaint.setStyle(Style.STROKE);
        this.mBorderPaint.setColor(-1);
        this.mBorderPaint.setStrokeWidth((float) (b.isPad() ? 4 : 2));
        this.mCornerPaint = new Paint();
        this.mCornerPaint.setAntiAlias(true);
        this.mCornerPaint.setColor(-1);
        ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
        this.mTapSlop = viewConfiguration.getScaledTouchSlop() * viewConfiguration.getScaledTouchSlop();
        this.mTiltShiftMaskFadeInAnimator = (ObjectAnimator) AnimatorInflater.loadAnimator(context, R.anim.tilt_shift_mask_fade_in);
        this.mTiltShiftMaskFadeOutAnimator = (ObjectAnimator) AnimatorInflater.loadAnimator(context, R.anim.tilt_shift_mask_fade_out);
        this.mTiltShiftMaskFadeInAnimator.setTarget(EffectController.getInstance());
        this.mTiltShiftMaskFadeInAnimator.setValues(new PropertyValuesHolder[]{PropertyValuesHolder.ofKeyframe(this.mTiltShiftMaskFadeInAnimator.getPropertyName(), new Keyframe[]{Keyframe.ofFloat(0.0f), Keyframe.ofFloat(0.3f, 1.0f), Keyframe.ofFloat(1.0f, 1.0f)})});
        this.mTiltShiftMaskFadeOutAnimator.setTarget(EffectController.getInstance());
        this.mTiltShiftMaskFadeOutAnimator.addListener(this.mTiltShiftMaskFadeOutListener);
    }

    private void computeCertenLineCrossPoints(Point point, Point point2) {
        int i;
        int i2;
        if (squareOfPoints(point, point2) >= MIN_DIS_FOR_SLOPE) {
            int width = (int) this.mDisplayBounds.width();
            int height = (int) this.mDisplayBounds.height();
            if (point.x == point2.x) {
                int clamp = Util.clamp(point.x, 0, width);
                this.mPoint1.set(clamp, 0);
                this.mPoint2.set(clamp, height);
            } else if (point.y == point2.y) {
                int clamp2 = Util.clamp(point.y, 0, height);
                this.mPoint1.set(0, clamp2);
                this.mPoint2.set(width, clamp2);
            } else {
                Point[] pointArr = new Point[2];
                float f = ((float) (point2.y - point.y)) / ((float) (point2.x - point.x));
                int i3 = (int) (((float) point.x) - (((float) point.y) / f));
                if (i3 < 0 || i3 > width) {
                    i = 0;
                } else {
                    pointArr[0] = new Point(i3, 0);
                    i = 1;
                }
                int i4 = (int) (((float) point.x) + (((float) (height - point.y)) / f));
                if (i4 >= 0 && i4 <= width) {
                    int i5 = i + 1;
                    pointArr[i] = new Point(i4, height);
                    i = i5;
                }
                int i6 = (int) (((float) point.y) - (((float) point.x) * f));
                if (i6 >= 0 && i6 <= height && !isContained(pointArr, 0, i6)) {
                    int i7 = i + 1;
                    pointArr[i] = new Point(0, i6);
                    i = i7;
                }
                int i8 = (int) (((float) point.y) + (((float) (width - point.x)) * f));
                if (i8 >= 0 && i8 <= height && !isContained(pointArr, width, i8)) {
                    int i9 = i + 1;
                    pointArr[i] = new Point(width, i8);
                    i = i9;
                }
                if (i == 1) {
                    i2 = i + 1;
                    pointArr[i] = new Point(pointArr[0]);
                } else {
                    i2 = i;
                }
                if (i2 == 2 && MIN_CROP_WIDTH_HEIGHT * MIN_CROP_WIDTH_HEIGHT <= squareOfPoints(pointArr[0], pointArr[1])) {
                    this.mPoint1.set(pointArr[0].x, pointArr[0].y);
                    this.mPoint2.set(pointArr[1].x, pointArr[1].y);
                }
            }
        }
    }

    private Point computePointWithDistance(int i) {
        Point point = new Point();
        if (this.mPoint1.x == this.mPoint2.x) {
            point.set(this.mPoint1.x - i, this.mPoint1.y);
        } else if (this.mPoint1.y == this.mPoint2.y) {
            point.set(this.mPoint1.x, this.mPoint1.y - i);
        } else {
            float sqrt = (float) Math.sqrt((double) this.mCenterLineSquare);
            point.set(this.mPoint1.x + ((int) (((float) ((this.mPoint1.y - this.mPoint2.y) * i)) / sqrt)), this.mPoint1.y - ((int) (((float) ((this.mPoint1.x - this.mPoint2.x) * i)) / sqrt)));
        }
        return point;
    }

    private void detectMovingEdges(float f, float f2) {
        boolean z = false;
        this.mMovingEdges = 0;
        if (this.mIsRect) {
            if (f2 <= this.mCropBounds.bottom + ((float) TOUCH_TOLERANCE) && this.mCropBounds.top - ((float) TOUCH_TOLERANCE) <= f2) {
                float abs = Math.abs(f - this.mCropBounds.left);
                float abs2 = Math.abs(f - this.mCropBounds.right);
                if (abs <= ((float) TOUCH_TOLERANCE) && abs < abs2) {
                    this.mMovingEdges |= 1;
                } else if (abs2 <= ((float) TOUCH_TOLERANCE)) {
                    this.mMovingEdges |= 4;
                }
            }
            if (f <= this.mCropBounds.right + ((float) TOUCH_TOLERANCE) && this.mCropBounds.left - ((float) TOUCH_TOLERANCE) <= f) {
                float abs3 = Math.abs(f2 - this.mCropBounds.top);
                float abs4 = Math.abs(f2 - this.mCropBounds.bottom);
                boolean z2 = abs3 <= ((float) TOUCH_TOLERANCE);
                if (abs3 < abs4) {
                    z = true;
                }
                if (z && z2) {
                    this.mMovingEdges |= 2;
                } else if (abs4 <= ((float) TOUCH_TOLERANCE)) {
                    this.mMovingEdges |= 8;
                }
            }
            if (this.mCropBounds.contains(f, f2) && this.mMovingEdges == 0) {
                this.mMovingEdges = 16;
            }
        } else if (this.mIsCircle) {
            showTiltShiftMask();
            float width = (this.mCropBounds.width() + this.mCropBounds.height()) / 4.0f;
            float f3 = (((float) CIRCLE_RESIZE_TOUCH_TOLERANCE) + width) * (width + ((float) CIRCLE_RESIZE_TOUCH_TOLERANCE));
            float centerX = f - this.mCropBounds.centerX();
            float centerY = f2 - this.mCropBounds.centerY();
            float f4 = (centerX * centerX) + (centerY * centerY);
            if (f4 > width * width && f4 <= f3) {
                this.mMovingEdges = 32;
            }
            if (this.mCropBounds.contains(f, f2) && this.mMovingEdges == 0) {
                this.mMovingEdges = 16;
            }
        } else {
            showTiltShiftMask();
            Point point = new Point((int) f, (int) f2);
            this.mTouchCenter.set((this.mPoint1.x + this.mPoint2.x) / 2, (this.mPoint1.y + this.mPoint2.y) / 2);
            if (MIN_DIS_FOR_MOVE_POINT < ((float) this.mCenterLineSquare) && squareOfPoints(point, this.mPoint1) < this.mCenterLineSquare / 16) {
                this.mMovingEdges = 257;
            } else if (MIN_DIS_FOR_MOVE_POINT >= ((float) this.mCenterLineSquare) || squareOfPoints(point, this.mPoint2) >= this.mCenterLineSquare / 16) {
                float squareOfDistance = getSquareOfDistance(f, f2, new PointF(this.mPoint1), new PointF(this.mPoint2), false);
                if (squareOfDistance < ((float) ((this.mRangeWidth * this.mRangeWidth) / 9))) {
                    this.mMovingEdges = 16;
                    return;
                }
                this.mLastMoveDis = Math.sqrt((double) squareOfDistance);
                this.mMovingEdges = 260;
            } else {
                this.mMovingEdges = 258;
            }
        }
    }

    private float getSquareOfDistance(float f, float f2, PointF pointF, PointF pointF2, boolean z) {
        PointF pointF3 = pointF;
        PointF pointF4 = pointF2;
        float f3 = pointF3.x;
        float f4 = pointF3.y;
        float f5 = pointF4.x;
        float f6 = pointF4.y;
        if (f3 == f5) {
            float f7 = f - f3;
            return f7 * f7;
        } else if (f4 == f6) {
            float f8 = f2 - f4;
            return f8 * f8;
        } else {
            float f9 = f5 - f3;
            float f10 = f - f3;
            float f11 = f6 - f4;
            float f12 = f2 - f4;
            float f13 = (f9 * f10) + (f11 * f12);
            if (z && ((double) f13) <= 0.0d) {
                return (f10 * f10) + (f12 * f12);
            }
            float f14 = (f9 * f9) + (f11 * f11);
            if (!z || f13 < f14) {
                float f15 = f13 / f14;
                float f16 = f - (f3 + (f9 * f15));
                float f17 = (f4 + (f11 * f15)) - f2;
                return (f16 * f16) + (f17 * f17);
            }
            float f18 = f - f5;
            float f19 = f2 - f6;
            return (f18 * f18) + (f19 * f19);
        }
    }

    /* access modifiers changed from: private */
    public void hideTiltShiftMask() {
        if (this.mTiltShiftMaskHandler != null) {
            this.mTiltShiftMaskHandler.sendEmptyMessage(2);
        }
    }

    private void initHandler() {
        if (this.mTiltShiftMaskHandler == null) {
            this.mTiltShiftMaskHandler = new Handler(Looper.getMainLooper()) {
                public void dispatchMessage(Message message) {
                    switch (message.what) {
                        case 1:
                            V6EffectCropView.this.mTiltShiftMaskFadeOutAnimator.cancel();
                            if (!V6EffectCropView.this.mTiltShiftMaskAlive) {
                                V6EffectCropView.this.mTiltShiftMaskAlive = true;
                                V6EffectCropView.this.mTiltShiftMaskFadeInAnimator.setupStartValues();
                                V6EffectCropView.this.mTiltShiftMaskFadeInAnimator.start();
                                return;
                            }
                            return;
                        case 2:
                            if (V6EffectCropView.this.mTiltShiftMaskFadeInAnimator.isRunning()) {
                                V6EffectCropView.this.mTiltShiftMaskFadeOutAnimator.setStartDelay(V6EffectCropView.this.mTiltShiftMaskFadeInAnimator.getDuration() - V6EffectCropView.this.mTiltShiftMaskFadeInAnimator.getCurrentPlayTime());
                            } else {
                                V6EffectCropView.this.mTiltShiftMaskFadeOutAnimator.setStartDelay(0);
                            }
                            if (V6EffectCropView.this.mTiltShiftMaskAlive) {
                                V6EffectCropView.this.mTiltShiftMaskFadeOutAnimator.start();
                                return;
                            }
                            return;
                        default:
                            return;
                    }
                }
            };
        }
        if (this.mAnimateHandler == null) {
            this.mAnimateThread = new HandlerThread("animateThread");
            this.mAnimateThread.start();
            this.mAnimateHandler = new Handler(this.mAnimateThread.getLooper()) {
                public void dispatchMessage(Message message) {
                    long currentTimeMillis = System.currentTimeMillis() - V6EffectCropView.this.mAnimationStartTime;
                    float f = 1.0f;
                    switch (message.what) {
                        case 1:
                            if (currentTimeMillis < 600) {
                                f = V6EffectCropView.this.mInterpolator.getInterpolation(((float) currentTimeMillis) / ((float) V6EffectCropView.this.mAnimationTotalTime));
                                sendEmptyMessageDelayed(1, 30);
                            } else {
                                V6EffectCropView.this.hideTiltShiftMask();
                            }
                            V6EffectCropView.this.mRangeWidth = V6EffectCropView.this.mAnimationStartRange + ((int) (((float) V6EffectCropView.this.mAnimateRangeWidth) * f));
                            V6EffectCropView.this.onCropChange();
                            return;
                        case 2:
                            if (currentTimeMillis < 600) {
                                f = V6EffectCropView.this.mInterpolator.getInterpolation(((float) currentTimeMillis) / ((float) V6EffectCropView.this.mAnimationTotalTime));
                                sendEmptyMessageDelayed(2, 30);
                            } else {
                                V6EffectCropView.this.hideTiltShiftMask();
                            }
                            float centerX = V6EffectCropView.this.mDefaultCircleBounds.centerX();
                            float centerY = V6EffectCropView.this.mDefaultCircleBounds.centerY();
                            V6EffectCropView.this.mRadius = V6EffectCropView.this.mAnimationStartRadius + ((int) (((float) V6EffectCropView.this.mAnimateRadius) * f));
                            V6EffectCropView.this.mCropBounds.set(centerX - ((float) V6EffectCropView.this.mRadius), centerY - ((float) V6EffectCropView.this.mRadius), centerX + ((float) V6EffectCropView.this.mRadius), centerY + ((float) V6EffectCropView.this.mRadius));
                            V6EffectCropView.this.onCropChange();
                            return;
                        default:
                            return;
                    }
                }
            };
        }
    }

    private void innerShow() {
        int i = 1;
        boolean z = !isTiltShift();
        boolean isCircle = isCircle();
        if (!this.mVisible || this.mIsRect != z || this.mIsCircle != isCircle) {
            this.mVisible = true;
            this.mMovingEdges = 0;
            setVisibility(0);
            this.mIsRect = z;
            this.mIsCircle = isCircle;
            if (isTiltShift()) {
                this.mPoint1.set(0, ((int) this.mDisplayBounds.height()) / 2);
                this.mPoint2.set((int) this.mDisplayBounds.width(), ((int) this.mDisplayBounds.height()) / 2);
                this.mRangeWidth = ANIMATE_START_RANGE;
                this.mRadius = ANIMATE_START_RADIUS;
                this.mAnimationStartTime = System.currentTimeMillis();
                this.mAnimationTotalTime = 600;
                this.mAnimateRangeWidth = DEFAULT_RANGE - this.mRangeWidth;
                this.mAnimationStartRange = this.mRangeWidth;
                this.mAnimateRadius = DEFAULT_RADIUS - this.mRadius;
                this.mAnimationStartRadius = this.mRadius;
                float centerX = this.mDefaultCircleBounds.centerX();
                float centerY = this.mDefaultCircleBounds.centerY();
                this.mCropBounds.set(centerX - ((float) this.mRadius), centerY - ((float) this.mRadius), centerX + ((float) this.mRadius), centerY + ((float) this.mRadius));
                showTiltShiftMask();
                if (this.mAnimateHandler != null) {
                    Handler handler = this.mAnimateHandler;
                    if (isCircle) {
                        i = 2;
                    }
                    handler.sendEmptyMessage(i);
                }
                invalidate();
            } else {
                this.mCropBounds.set(this.mDefaultRectBounds);
                setLayerType(2, null);
            }
            EffectController.getInstance().setInvertFlag(0);
            onCropChange();
        }
    }

    private static boolean isCircle() {
        if (CameraSettings.isTiltShiftOn()) {
            return DataRepository.dataItemRunning().getComponentRunningTiltValue().getComponentValue(160).equals(ComponentRunningTiltValue.TILT_CIRCLE);
        }
        return false;
    }

    private boolean isContained(Point[] pointArr, int i, int i2) {
        if (!(pointArr == null || pointArr.length == 0)) {
            for (Point point : pointArr) {
                if (point == null) {
                    return false;
                }
                if (point.x == i || point.y == i2) {
                    return true;
                }
            }
        }
        return false;
    }

    private static boolean isTiltShift() {
        return CameraSettings.isTiltShiftOn();
    }

    private void moveCircle(float f, float f2, float f3, float f4) {
        if (this.mMovingEdges == 16) {
            this.mCropBounds.offset(f3 > 0.0f ? Math.min(this.mDisplayBounds.right - this.mCropBounds.right, f3) : Math.max(this.mDisplayBounds.left - this.mCropBounds.left, f3), f4 > 0.0f ? Math.min(this.mDisplayBounds.bottom - this.mCropBounds.bottom, f4) : Math.max(this.mDisplayBounds.top - this.mCropBounds.top, f4));
        } else {
            float f5 = (float) (MIN_CROP_WIDTH_HEIGHT / 2);
            float min = Math.min(this.mDisplayBounds.width(), this.mDisplayBounds.height()) / 2.0f;
            float centerX = this.mCropBounds.centerX();
            float centerY = this.mCropBounds.centerY();
            float f6 = f - centerX;
            float f7 = f2 - centerY;
            float min2 = Math.min(min, Math.max(f5, (float) Math.sqrt((double) ((f6 * f6) + (f7 * f7)))));
            this.mCropBounds.set(centerX - min2, centerY - min2, centerX + min2, centerY + min2);
        }
        onCropChange();
    }

    private void moveCrop(float f, float f2, float f3, float f4) {
        if (this.mMovingEdges == 260) {
            double sqrt = Math.sqrt((double) getSquareOfDistance(f, f2, new PointF(this.mPoint1), new PointF(this.mPoint2), false));
            this.mRangeWidth = Util.clamp(this.mRangeWidth + ((int) (sqrt - this.mLastMoveDis)), MIN_RANGE, this.mMaxRange);
            this.mLastMoveDis = sqrt;
        } else if (this.mMovingEdges == 257 || this.mMovingEdges == 258) {
            computeCertenLineCrossPoints(this.mTouchCenter, new Point((int) f, (int) f2));
        } else if (this.mMovingEdges == 16) {
            int i = (int) f3;
            int i2 = (int) f4;
            computeCertenLineCrossPoints(new Point(this.mPoint1.x + i, this.mPoint1.y + i2), new Point(this.mPoint2.x + i, this.mPoint2.y + i2));
        }
        onCropChange();
    }

    private void moveEdges(float f, float f2) {
        if (this.mMovingEdges == 16) {
            this.mCropBounds.offset(f > 0.0f ? Math.min(this.mDisplayBounds.right - this.mCropBounds.right, f) : Math.max(this.mDisplayBounds.left - this.mCropBounds.left, f), f2 > 0.0f ? Math.min(this.mDisplayBounds.bottom - this.mCropBounds.bottom, f2) : Math.max(this.mDisplayBounds.top - this.mCropBounds.top, f2));
        } else {
            float f3 = (float) MIN_CROP_WIDTH_HEIGHT;
            float f4 = (float) MIN_CROP_WIDTH_HEIGHT;
            if ((this.mMovingEdges & 1) != 0) {
                this.mCropBounds.left = Math.min(this.mCropBounds.left + f, this.mCropBounds.right - f3);
            }
            if ((this.mMovingEdges & 2) != 0) {
                this.mCropBounds.top = Math.min(this.mCropBounds.top + f2, this.mCropBounds.bottom - f4);
            }
            if ((this.mMovingEdges & 4) != 0) {
                this.mCropBounds.right = Math.max(this.mCropBounds.right + f, this.mCropBounds.left + f3);
            }
            if ((this.mMovingEdges & 8) != 0) {
                this.mCropBounds.bottom = Math.max(this.mCropBounds.bottom + f2, this.mCropBounds.top + f4);
            }
            this.mCropBounds.intersect(this.mDisplayBounds);
        }
        onCropChange();
    }

    private void normalizeRangeWidth() {
        Point computePointWithDistance = computePointWithDistance(this.mRangeWidth);
        this.mNormalizedWidth = (float) Math.sqrt((double) getSquareOfDistance(((float) computePointWithDistance.x) / this.mDisplayBounds.width(), ((float) computePointWithDistance.y) / this.mDisplayBounds.height(), this.mEffectPoint1, this.mEffectPoint2, false));
    }

    /* access modifiers changed from: private */
    public void onCropChange() {
        float width = this.mDisplayBounds.width();
        float height = this.mDisplayBounds.height();
        this.mEffectRect.set(this.mCropBounds.left / width, this.mCropBounds.top / height, this.mCropBounds.right / width, this.mCropBounds.bottom / height);
        this.mEffectPoint1.set(((float) this.mPoint1.x) / width, ((float) this.mPoint1.y) / height);
        this.mEffectPoint2.set(((float) this.mPoint2.x) / width, ((float) this.mPoint2.y) / height);
        this.mCenterLineSquare = squareOfPoints(this.mPoint1, this.mPoint2);
        normalizeRangeWidth();
        EffectController.getInstance().setEffectAttribute(this.mEffectRect, this.mEffectPoint1, this.mEffectPoint2, this.mNormalizedWidth);
        if (this.mIsRect) {
            invalidate();
        }
    }

    private void showTiltShiftMask() {
        if (this.mTiltShiftMaskHandler != null) {
            this.mTiltShiftMaskHandler.sendEmptyMessage(1);
        }
    }

    private int squareOfPoints(Point point, Point point2) {
        int i = point.x - point2.x;
        int i2 = point.y - point2.y;
        return (i * i) + (i2 * i2);
    }

    public void enableControls(boolean z) {
    }

    public void hide() {
        if (this.mVisible) {
            this.mVisible = false;
            setVisibility(4);
            EffectController.getInstance().clearEffectAttribute();
            EffectController.getInstance().setInvertFlag(0);
        }
    }

    public boolean isMoved() {
        return !this.mIsInTapSlop && this.mMovingEdges != 0;
    }

    public boolean isVisible() {
        return this.mVisible;
    }

    public void onCameraOpen() {
    }

    public void onCreate() {
        initHandler();
    }

    public void onDestroy() {
        if (this.mAnimateThread != null) {
            this.mAnimateThread.quit();
            this.mAnimateThread = null;
            this.mAnimateHandler = null;
        }
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        if (this.mVisible && this.mIsRect) {
            canvas.drawRect(this.mCropBounds, this.mBorderPaint);
            canvas.drawCircle(this.mCropBounds.left, this.mCropBounds.top, (float) CORNER_BALL_RADIUS, this.mCornerPaint);
            canvas.drawCircle(this.mCropBounds.right, this.mCropBounds.top, (float) CORNER_BALL_RADIUS, this.mCornerPaint);
            canvas.drawCircle(this.mCropBounds.left, this.mCropBounds.bottom, (float) CORNER_BALL_RADIUS, this.mCornerPaint);
            canvas.drawCircle(this.mCropBounds.right, this.mCropBounds.bottom, (float) CORNER_BALL_RADIUS, this.mCornerPaint);
        }
    }

    public void onPause() {
        if (this.mAnimateHandler != null && this.mAnimateHandler.hasMessages(1)) {
            if (this.mAnimateHandler.hasMessages(1)) {
                this.mAnimateHandler.removeMessages(1);
                this.mRangeWidth = this.mAnimationStartRange + this.mAnimateRangeWidth;
            }
            if (this.mAnimateHandler.hasMessages(2)) {
                this.mAnimateHandler.removeMessages(2);
                this.mRadius = this.mAnimationStartRadius + this.mAnimateRadius;
            }
        }
    }

    public void onResume() {
    }

    /* access modifiers changed from: protected */
    public void onSizeChanged(int i, int i2, int i3, int i4) {
        float f = (float) i;
        float f2 = (float) i2;
        this.mDisplayBounds.set(0.0f, 0.0f, f, f2);
        this.mDefaultRectBounds.set((float) ((3 * i) / 8), (float) ((3 * i2) / 8), (float) ((5 * i) / 8), (float) ((5 * i2) / 8));
        float f3 = (float) DEFAULT_RADIUS;
        float f4 = f / 2.0f;
        float f5 = f2 / 2.0f;
        this.mDefaultCircleBounds.set(f4 - f3, f5 - f3, f4 + f3, f5 + f3);
        this.mCropBounds.set(this.mIsRect ? this.mDefaultRectBounds : this.mDefaultCircleBounds);
        int i5 = i2 / 2;
        this.mPoint1.set(0, i5);
        this.mPoint2.set(i, i5);
        this.mMaxRange = (i2 * 2) / 3;
        this.mRangeWidth = this.mVisible ? DEFAULT_RANGE : ANIMATE_START_RANGE;
        onCropChange();
    }

    public boolean onViewTouchEvent(MotionEvent motionEvent) {
        if (!this.mVisible) {
            return false;
        }
        if (isEnabled()) {
            float x = motionEvent.getX();
            float y = motionEvent.getY();
            int action = motionEvent.getAction() & 255;
            if (action != 5) {
                switch (action) {
                    case 0:
                        detectMovingEdges(x, y);
                        this.mIsInTapSlop = true;
                        this.mLastX = x;
                        this.mLastY = y;
                        break;
                    case 1:
                    case 3:
                        break;
                    case 2:
                        float f = x - this.mLastX;
                        float f2 = y - this.mLastY;
                        if (this.mIsInTapSlop && ((float) this.mTapSlop) < (f * f) + (f2 * f2)) {
                            this.mIsInTapSlop = false;
                        }
                        if (!this.mIsInTapSlop) {
                            if (this.mMovingEdges != 0) {
                                if (this.mIsRect) {
                                    moveEdges(x - this.mLastX, y - this.mLastY);
                                } else if (this.mIsCircle) {
                                    moveCircle(x, y, x - this.mLastX, y - this.mLastY);
                                } else {
                                    moveCrop(x, y, x - this.mLastX, y - this.mLastY);
                                }
                            }
                            this.mLastX = x;
                            this.mLastY = y;
                            break;
                        }
                        break;
                }
            }
            this.mMovingEdges = 0;
            hideTiltShiftMask();
            invalidate();
        }
        return true;
    }

    public void removeTiltShiftMask() {
        if (this.mTiltShiftMaskHandler != null) {
            this.mTiltShiftMaskHandler.removeMessages(1);
            this.mTiltShiftMaskHandler.removeMessages(2);
        }
    }

    public void show() {
        if (EffectController.getInstance().isNeedRect(EffectController.getInstance().getEffectForPreview(false)) || isTiltShift()) {
            innerShow();
        }
    }

    public void show(float f, float f2) {
        if (!this.mVisible) {
            this.mVisible = true;
            setVisibility(0);
            RectF rectF = this.mIsRect ? this.mDefaultRectBounds : this.mDefaultCircleBounds;
            this.mCropBounds.set(f - (rectF.width() / 2.0f), f2 - (rectF.height() / 2.0f), f + (rectF.width() / 2.0f), f2 + (rectF.height() / 2.0f));
            onCropChange();
        }
    }

    public void updateVisible() {
        if (EffectController.getInstance().isNeedRect(EffectController.getInstance().getEffectForPreview(false)) || isTiltShift()) {
            innerShow();
        } else {
            hide();
        }
    }

    public void updateVisible(int i) {
        if (EffectController.getInstance().isNeedRect(i)) {
            innerShow();
        } else {
            hide();
        }
    }
}
