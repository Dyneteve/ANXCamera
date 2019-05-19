package com.android.camera.ui.drawable.snap;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.BounceInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.LinearInterpolator;
import com.android.camera.Util;
import com.android.camera.fragment.bottom.BottomAnimationConfig;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BeautyRecording;
import com.android.camera.protocol.ModeProtocol.LiveConfigChanges;
import com.android.camera.ui.drawable.CameraPaintBase;
import com.facebook.rebound.SimpleSpringListener;
import com.facebook.rebound.Spring;
import com.facebook.rebound.SpringConfig;
import com.facebook.rebound.SpringSystem;
import com.facebook.rebound.SpringUtil;
import miui.view.animation.CubicEaseInInterpolator;
import miui.view.animation.CubicEaseOutInterpolator;

public class CameraSnapAnimateDrawable extends Drawable implements Animatable {
    private static final float SNAP_ROUND_ORIGINAL_WIDTH = 0.688f;
    private static final SpringConfig mCameraDownConfig = SpringConfig.fromOrigamiTensionAndFriction(100.0d, 15.0d);
    public static final SpringConfig mCameraUpConfig = SpringConfig.fromOrigamiTensionAndFriction(120.0d, 30.0d);
    public static final SpringConfig mCameraUpSplashConfig = SpringConfig.fromOrigamiTensionAndFriction(180.0d, 10.0d);
    public static final SpringConfig mRecordScaleConfig = SpringConfig.fromOrigamiTensionAndFriction(180.0d, 30.0d);
    /* access modifiers changed from: private */
    public CameraSnapPaintCircle mCirclePaintItem;
    private Spring mDownSpring;
    /* access modifiers changed from: private */
    public float mLiveSpeed;
    /* access modifiers changed from: private */
    public long mLiveStartTime;
    /* access modifiers changed from: private */
    public long mLiveTotalTime;
    /* access modifiers changed from: private */
    public LongPressIncreaseListener mLongPressIncreaseListener = new LongPressIncreaseListener() {
        public void OnIncrease(float f) {
            CameraSnapAnimateDrawable.this.mRecordSpring.setEndValue(Math.min(1.1d, 0.6000000238418579d + ((((double) f) - 0.6d) / 1.0d)));
            CameraSnapAnimateDrawable.this.invalidateSelf();
        }

        public void OnTheValue(boolean z) {
            if (z) {
                CameraSnapAnimateDrawable.this.mUpSpring.setSpringConfig(CameraSnapAnimateDrawable.mCameraUpSplashConfig);
                CameraSnapAnimateDrawable.this.mUpSpring.setEndValue(1.0d);
                CameraSnapAnimateDrawable.this.mRecordSpring.setEndValue(0.6d);
            }
        }

        public void OnValueUp(float f) {
            double d = (double) f;
            CameraSnapAnimateDrawable.this.mUpSpring.setEndValue(d);
            CameraSnapAnimateDrawable.this.mRecordSpring.setEndValue(d);
        }
    };
    private ValueAnimator mModeChangeAnimator;
    /* access modifiers changed from: private */
    public CameraSnapPaintMotion mMotionPaintItem;
    private ValueAnimator mReboundAnimator;
    public Spring mRecordSpring;
    /* access modifiers changed from: private */
    public CameraPaintBase mRecordingPaint;
    private ValueAnimator mRingAnimator;
    /* access modifiers changed from: private */
    public CameraSnapPaintRound mRoundPaintItem;
    /* access modifiers changed from: private */
    public CameraSnapPaintSecond mSecondPaintItem;
    private SpringSystem mSpringSystem;
    private ValueAnimator mTimeAnimator;
    public Spring mUpSpring;

    public interface BeautyRecordingListener {
        void onAngleChanged(float f);
    }

    public interface LongPressIncreaseListener {
        void OnIncrease(float f);

        void OnTheValue(boolean z);

        void OnValueUp(float f);
    }

    public CameraSnapAnimateDrawable(Context context) {
        this.mCirclePaintItem = new CameraSnapPaintCircle(context);
        this.mRoundPaintItem = new CameraSnapPaintRound(context);
        this.mSecondPaintItem = new CameraSnapPaintSecond(context);
        this.mMotionPaintItem = new CameraSnapPaintMotion(context);
    }

    private void initReboundSystem() {
        if (this.mSpringSystem == null) {
            this.mSpringSystem = SpringSystem.create();
            this.mUpSpring = this.mSpringSystem.createSpring();
            this.mUpSpring.setSpringConfig(mCameraUpConfig);
            this.mUpSpring.addListener(new SimpleSpringListener() {
                public void onSpringAtRest(Spring spring) {
                    if (spring.getCurrentValue() == 0.0d) {
                        CameraSnapAnimateDrawable.this.mUpSpring.setSpringConfig(CameraSnapAnimateDrawable.mCameraUpConfig);
                    }
                }

                public void onSpringUpdate(Spring spring) {
                    float mapValueFromRangeToRange = (float) SpringUtil.mapValueFromRangeToRange((double) ((float) spring.getCurrentValue()), 0.0d, 1.0d, 1.0d, 1.2d);
                    CameraSnapAnimateDrawable.this.mCirclePaintItem.isRecording = true;
                    CameraSnapAnimateDrawable.this.mCirclePaintItem.isInBeautyMode = true;
                    CameraSnapAnimateDrawable.this.mCirclePaintItem.mCurrentWidthPercent = CameraSnapAnimateDrawable.this.mCirclePaintItem.mSrcWidthPercent * mapValueFromRangeToRange;
                    CameraSnapAnimateDrawable.this.invalidateSelf();
                }
            });
            this.mRecordSpring = this.mSpringSystem.createSpring();
            this.mRecordSpring.setSpringConfig(mRecordScaleConfig);
            this.mRecordSpring.setCurrentValue(1.0d);
            this.mRecordSpring.addListener(new SimpleSpringListener() {
                public void onSpringUpdate(Spring spring) {
                    float currentValue = (float) spring.getCurrentValue();
                    CameraSnapAnimateDrawable.this.mRoundPaintItem.mCurrentWidthPercent = CameraSnapAnimateDrawable.this.mRoundPaintItem.mSrcWidthPercent * currentValue;
                    CameraSnapAnimateDrawable.this.invalidateSelf();
                }
            });
        }
    }

    private void updateLiveAnimationConfig() {
        LiveConfigChanges liveConfigChanges = (LiveConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(201);
        if (liveConfigChanges != null) {
            this.mLiveSpeed = liveConfigChanges.getRecordSpeed();
            this.mLiveTotalTime = liveConfigChanges.getTotalRecordingTime();
            this.mLiveStartTime = liveConfigChanges.getStartRecordingTime();
        }
    }

    public void addSegmentNow() {
        if (this.mTimeAnimator != null) {
            this.mCirclePaintItem.addSegmentNow(this.mTimeAnimator.getCurrentPlayTime());
            invalidateSelf();
        }
    }

    public void cancelAnimation() {
        if (this.mTimeAnimator != null) {
            this.mTimeAnimator.cancel();
            this.mTimeAnimator = null;
        }
        if (this.mRingAnimator != null) {
            this.mRingAnimator.cancel();
            this.mRingAnimator = null;
        }
    }

    public void cancelRebound() {
        if (this.mReboundAnimator != null) {
            this.mReboundAnimator.cancel();
            this.mCirclePaintItem.isInBeautyMode = false;
            this.mCirclePaintItem.resetRecordingState();
            this.mUpSpring.setEndValue(0.0d);
            this.mRecordSpring.setEndValue(1.0d);
        }
    }

    public void directFinishRecord() {
        cancelAnimation();
        if (this.mRecordingPaint != null) {
            this.mRoundPaintItem.isRecording = false;
            this.mRecordingPaint.setCurrentValues(this.mRecordingPaint.mCurrentWidthPercent, this.mRecordingPaint.mCurrentColor, CameraPaintBase.ALPHA_OPAQUE, (float) Util.dpToPixel(1.0f));
            this.mRecordingPaint.isRecording = false;
            this.mRecordingPaint.resetRecordingState();
            this.mRecordingPaint = null;
        }
    }

    public void draw(Canvas canvas) {
        if (canvas != null) {
            canvas.save();
            this.mCirclePaintItem.drawCanvas(canvas);
            canvas.restore();
            canvas.save();
            this.mRoundPaintItem.drawCanvas(canvas);
            canvas.restore();
            canvas.save();
            this.mSecondPaintItem.drawCanvas(canvas);
            canvas.restore();
            canvas.save();
            this.mMotionPaintItem.drawCanvas(canvas);
            canvas.restore();
        }
    }

    /* JADX WARNING: type inference failed for: r0v5, types: [android.animation.TimeInterpolator, com.android.camera.ui.drawable.snap.CameraSnapAnimateDrawable$12] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v5, types: [android.animation.TimeInterpolator, com.android.camera.ui.drawable.snap.CameraSnapAnimateDrawable$12]
  assigns: [com.android.camera.ui.drawable.snap.CameraSnapAnimateDrawable$12]
  uses: [android.animation.TimeInterpolator]
  mth insns count: 33
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void finishRecord(BottomAnimationConfig bottomAnimationConfig) {
        if (this.mRecordingPaint == null) {
            invalidateSelf();
            return;
        }
        if (bottomAnimationConfig.mNeedFinishRecord) {
            cancelAnimation();
            this.mRecordingPaint.resetRecordingState();
            this.mRecordingPaint.setTargetAlpha(255);
            this.mRoundPaintItem.setTargetAlpha(255);
            this.mTimeAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
            this.mTimeAnimator.setStartDelay(200);
            this.mTimeAnimator.setDuration(260);
            this.mTimeAnimator.setInterpolator(new CubicEaseInInterpolator() {
                public float getInterpolation(float f) {
                    float interpolation = CameraSnapAnimateDrawable.super.getInterpolation(f);
                    CameraSnapAnimateDrawable.this.mRoundPaintItem.updateValue(interpolation);
                    CameraSnapAnimateDrawable.this.mRecordingPaint.updateValue(interpolation);
                    CameraSnapAnimateDrawable.this.invalidateSelf();
                    return interpolation;
                }
            });
            this.mTimeAnimator.removeAllListeners();
            this.mTimeAnimator.addListener(new AnimatorListener() {
                public void onAnimationCancel(Animator animator) {
                }

                public void onAnimationEnd(Animator animator) {
                    CameraSnapAnimateDrawable.this.mRoundPaintItem.isRecording = false;
                }

                public void onAnimationRepeat(Animator animator) {
                }

                public void onAnimationStart(Animator animator) {
                }
            });
            this.mTimeAnimator.start();
        } else {
            stopRecord(bottomAnimationConfig);
        }
    }

    public int getOpacity() {
        return -1;
    }

    public boolean hasSegments() {
        return this.mCirclePaintItem.hasSegments();
    }

    public void hideRoundPaintItem() {
        this.mRoundPaintItem.setVisible(8);
    }

    public void initParameters(int i, boolean z) {
        initTargetValues(i, z);
        this.mCirclePaintItem.setResult();
        this.mRoundPaintItem.setResult();
        this.mSecondPaintItem.setResult();
        this.mMotionPaintItem.setResult();
    }

    public void initTargetValues(int i, boolean z) {
        switch (i) {
            case 161:
            case 162:
            case 170:
            case 174:
                this.mCirclePaintItem.setTargetValues(0.75f, -1, CameraPaintBase.ALPHA_OPAQUE, (float) Util.dpToPixel(1.0f));
                this.mRoundPaintItem.setTargetValues(SNAP_ROUND_ORIGINAL_WIDTH, -109521, CameraPaintBase.ALPHA_OPAQUE, 15.0f);
                this.mSecondPaintItem.setTargetValues(0.833f, -1, 0, 3.0f);
                this.mMotionPaintItem.setTargetValues(0.833f, -1, 0, 3.0f);
                return;
            case 168:
            case 172:
                this.mCirclePaintItem.setTargetValues(0.75f, -1, 0, (float) Util.dpToPixel(1.0f));
                this.mRoundPaintItem.setTargetValues(0.55f, -109521, CameraPaintBase.ALPHA_OPAQUE, 15.0f);
                this.mSecondPaintItem.setTargetValues(0.751f, -1, CameraPaintBase.ALPHA_OUTSTANDING, 3.0f);
                this.mSecondPaintItem.setNeedSpacing(z);
                this.mMotionPaintItem.setTargetValues(0.751f, -1, 0, 3.0f);
                return;
            case 169:
                this.mCirclePaintItem.setTargetValues(0.75f, -1, 0, (float) Util.dpToPixel(1.0f));
                this.mRoundPaintItem.setTargetValues(0.55f, -109521, CameraPaintBase.ALPHA_OPAQUE, 15.0f);
                this.mSecondPaintItem.setTargetValues(0.751f, -1, 0, 3.0f);
                this.mMotionPaintItem.setTargetValues(0.751f, -1, CameraPaintBase.ALPHA_OUTSTANDING, 3.0f);
                return;
            case 173:
                this.mCirclePaintItem.setTargetValues(0.75f, -1, 0, (float) Util.dpToPixel(1.0f));
                this.mRoundPaintItem.setTargetValues(0.55f, -1, CameraPaintBase.ALPHA_OPAQUE, 15.0f);
                this.mSecondPaintItem.setTargetValues(0.751f, -1, CameraPaintBase.ALPHA_OUTSTANDING, 3.0f);
                this.mSecondPaintItem.setNeedSpacing(false);
                this.mMotionPaintItem.setTargetValues(0.751f, -1, 0, 3.0f);
                return;
            default:
                this.mCirclePaintItem.setTargetValues(0.75f, -1, CameraPaintBase.ALPHA_OPAQUE, (float) Util.dpToPixel(1.0f));
                this.mRoundPaintItem.setTargetValues(SNAP_ROUND_ORIGINAL_WIDTH, -1, CameraPaintBase.ALPHA_OPAQUE, 15.0f);
                this.mSecondPaintItem.setTargetValues(0.833f, -1, 0, 3.0f);
                this.mMotionPaintItem.setTargetValues(0.833f, -1, 0, 3.0f);
                return;
        }
    }

    public boolean isRunning() {
        return (this.mModeChangeAnimator != null && this.mModeChangeAnimator.isRunning()) || (this.mTimeAnimator != null && this.mTimeAnimator.isRunning());
    }

    /* access modifiers changed from: protected */
    public void onBoundsChange(Rect rect) {
        super.onBoundsChange(rect);
    }

    public void pauseRecording() {
        if (this.mTimeAnimator != null && this.mTimeAnimator.isRunning()) {
            this.mTimeAnimator.pause();
        }
    }

    public void prepareRecording(final BottomAnimationConfig bottomAnimationConfig) {
        cancelAnimation();
        float f = 2.0f;
        switch (bottomAnimationConfig.mCurrentMode) {
            case 161:
            case 174:
            case 177:
                this.mCirclePaintItem.clearSegments();
                this.mCirclePaintItem.setTargetValues(this.mCirclePaintItem.mCurrentWidthPercent, this.mCirclePaintItem.mCurrentColor, CameraPaintBase.ALPHA_HINT, (float) Util.dpToPixel(2.0f));
                this.mRecordingPaint = this.mCirclePaintItem;
                break;
            case 162:
            case 166:
            case 170:
            case 176:
                this.mCirclePaintItem.setNeedSplit(false);
                CameraSnapPaintCircle cameraSnapPaintCircle = this.mCirclePaintItem;
                float f2 = this.mCirclePaintItem.mCurrentWidthPercent;
                int i = this.mCirclePaintItem.mCurrentColor;
                int i2 = CameraPaintBase.ALPHA_OPAQUE;
                if (!bottomAnimationConfig.mIsVideoBokeh) {
                    f = 1.0f;
                }
                cameraSnapPaintCircle.setTargetValues(f2, i, i2, (float) Util.dpToPixel(f));
                this.mRecordingPaint = this.mCirclePaintItem;
                break;
            case 168:
            case 172:
            case 173:
                this.mSecondPaintItem.setTargetValues(this.mSecondPaintItem.mCurrentWidthPercent, this.mSecondPaintItem.mCurrentColor, CameraPaintBase.ALPHA_HINT, this.mSecondPaintItem.mCurrentStrokeWidth);
                this.mRecordingPaint = this.mSecondPaintItem;
                break;
            case 169:
                this.mMotionPaintItem.setTargetValues(this.mMotionPaintItem.mCurrentWidthPercent, this.mMotionPaintItem.mCurrentColor, CameraPaintBase.ALPHA_HINT, this.mMotionPaintItem.mCurrentStrokeWidth);
                this.mRecordingPaint = this.mMotionPaintItem;
                break;
        }
        this.mRoundPaintItem.prepareRecord();
        this.mRoundPaintItem.isRecording = true;
        this.mRoundPaintItem.setTargetAlpha(255);
        float[] fArr = new float[2];
        fArr[0] = bottomAnimationConfig.mIsInMimojiCreate ? 1.0f : 0.0f;
        fArr[1] = 1.0f;
        ValueAnimator ofFloat = ValueAnimator.ofFloat(fArr);
        ofFloat.setDuration(250);
        ofFloat.setInterpolator(new DecelerateInterpolator() {
            public float getInterpolation(float f) {
                float interpolation = super.getInterpolation(f);
                CameraSnapAnimateDrawable.this.mRecordingPaint.updateValue(interpolation);
                if (!bottomAnimationConfig.mIsInMimojiCreate) {
                    CameraSnapAnimateDrawable.this.mRoundPaintItem.updateRecordValue(interpolation, true);
                }
                CameraSnapAnimateDrawable.this.mRoundPaintItem.updateValue(interpolation);
                CameraSnapAnimateDrawable.this.invalidateSelf();
                return interpolation;
            }
        });
        ofFloat.start();
    }

    public void removeLastSegment() {
        if (!this.mCirclePaintItem.getSegmentRatios().isEmpty()) {
            this.mCirclePaintItem.removeLastSegmentAndGetLastTime();
            invalidateSelf();
        }
    }

    public void resetRecordingState() {
        this.mCirclePaintItem.resetRecordingState();
        this.mRoundPaintItem.resetRecordingState();
        this.mSecondPaintItem.resetRecordingState();
        this.mMotionPaintItem.resetRecordingState();
    }

    public void resumeRecording() {
        updateLiveAnimationConfig();
        if (this.mTimeAnimator != null && this.mTimeAnimator.isPaused()) {
            this.mTimeAnimator.resume();
        }
    }

    public void setAlpha(int i) {
    }

    public void setBounds(Rect rect) {
        super.setBounds(rect);
    }

    public void setColorFilter(ColorFilter colorFilter) {
    }

    public void setWidthHeight(float f, float f2) {
        float f3 = f / 2.0f;
        float min = Math.min(f, f2) / 2.0f;
        this.mCirclePaintItem.setMiddle(f3, f3, min);
        this.mRoundPaintItem.setMiddle(f3, f3, min);
        this.mSecondPaintItem.setMiddle(f3, f3, min);
        this.mMotionPaintItem.setMiddle(f3, f3, min);
    }

    public void showRoundPaintItem() {
        this.mRoundPaintItem.setVisible(0);
    }

    public void start() {
    }

    public void startModeChangeAnimation() {
        this.mModeChangeAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        this.mModeChangeAnimator.setDuration(300);
        this.mModeChangeAnimator.setInterpolator(new DecelerateInterpolator() {
            public float getInterpolation(float f) {
                float interpolation = super.getInterpolation(f);
                CameraSnapAnimateDrawable.this.mCirclePaintItem.updateValue(interpolation);
                CameraSnapAnimateDrawable.this.mRoundPaintItem.updateValue(interpolation);
                CameraSnapAnimateDrawable.this.mSecondPaintItem.updateValue(interpolation);
                CameraSnapAnimateDrawable.this.mMotionPaintItem.updateValue(interpolation);
                CameraSnapAnimateDrawable.this.invalidateSelf();
                return interpolation;
            }
        });
        this.mModeChangeAnimator.setupEndValues();
        this.mModeChangeAnimator.start();
    }

    public void startRebound() {
        initReboundSystem();
        this.mReboundAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        this.mReboundAnimator.setStartDelay(300);
        this.mReboundAnimator.setDuration(8500);
        this.mReboundAnimator.setInterpolator(new LinearInterpolator() {
            public float getInterpolation(float f) {
                float interpolation = super.getInterpolation(f);
                float f2 = 8500.0f * interpolation;
                if (f2 > 500.0f) {
                    CameraSnapAnimateDrawable.this.mCirclePaintItem.timeAngle = 360.0f * ((f2 - 500.0f) / 8000.0f);
                }
                if (f2 <= 1000.0f) {
                    CameraSnapAnimateDrawable.this.mLongPressIncreaseListener.OnValueUp((((f2 / 31.25f) * 2.0f) - 10.0f) / 90.0f);
                    CameraSnapAnimateDrawable.this.mLongPressIncreaseListener.OnTheValue(false);
                } else if (f2 - 1000.0f < 30.0f) {
                    CameraSnapAnimateDrawable.this.mLongPressIncreaseListener.OnTheValue(true);
                } else {
                    CameraSnapAnimateDrawable.this.mLongPressIncreaseListener.OnIncrease((((f2 / 31.25f) * 2.0f) - 10.0f) / 90.0f);
                }
                return interpolation;
            }
        });
        this.mReboundAnimator.addListener(new AnimatorListener() {
            public void onAnimationCancel(Animator animator) {
            }

            public void onAnimationEnd(Animator animator) {
                ((BeautyRecording) ModeCoordinatorImpl.getInstance().getAttachProtocol(173)).handleBeautyRecordingStop();
            }

            public void onAnimationRepeat(Animator animator) {
            }

            public void onAnimationStart(Animator animator) {
                ((BeautyRecording) ModeCoordinatorImpl.getInstance().getAttachProtocol(173)).handleBeautyRecordingStart();
            }
        });
        this.mReboundAnimator.start();
    }

    public void startRecord(final BottomAnimationConfig bottomAnimationConfig) {
        if (this.mRecordingPaint != null) {
            cancelAnimation();
            this.mTimeAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
            if (bottomAnimationConfig.mCurrentMode == 174) {
                updateLiveAnimationConfig();
            }
            this.mTimeAnimator.setDuration((long) bottomAnimationConfig.mDuration);
            this.mTimeAnimator.setInterpolator(new LinearInterpolator() {
                public float getInterpolation(float f) {
                    float f2 = 360.0f * f;
                    if (bottomAnimationConfig.mCurrentMode == 174) {
                        f2 = (((float) (((long) ((1.0d * ((double) (System.currentTimeMillis() - CameraSnapAnimateDrawable.this.mLiveStartTime))) / ((double) CameraSnapAnimateDrawable.this.mLiveSpeed))) + CameraSnapAnimateDrawable.this.mLiveTotalTime)) * 360.0f) / ((float) bottomAnimationConfig.mDuration);
                        if (f2 > 360.0f) {
                            f2 = 360.0f;
                        }
                    }
                    CameraSnapAnimateDrawable.this.mRecordingPaint.timeAngle = f2;
                    float interpolation = super.getInterpolation(f);
                    CameraSnapAnimateDrawable.this.invalidateSelf();
                    return interpolation;
                }
            });
            this.mTimeAnimator.removeAllListeners();
            this.mTimeAnimator.addListener(new AnimatorListener() {
                public void onAnimationCancel(Animator animator) {
                }

                public void onAnimationEnd(Animator animator) {
                }

                public void onAnimationRepeat(Animator animator) {
                    if (bottomAnimationConfig.mCurrentMode != 174) {
                        CameraSnapAnimateDrawable.this.mRecordingPaint.reverseClock();
                    }
                }

                public void onAnimationStart(Animator animator) {
                    CameraSnapAnimateDrawable.this.mRecordingPaint.isRecording = true;
                    CameraSnapAnimateDrawable.this.mRoundPaintItem.isRecording = true;
                    CameraSnapAnimateDrawable.this.mRoundPaintItem.isRecordingCircle = bottomAnimationConfig.mIsRecordingCircle;
                    CameraSnapAnimateDrawable.this.mRoundPaintItem.isRoundingCircle = bottomAnimationConfig.mIsRoundingCircle;
                    CameraSnapAnimateDrawable.this.mCirclePaintItem.setNeedSplit(true);
                }
            });
            if (bottomAnimationConfig.mShouldRepeat) {
                this.mTimeAnimator.setRepeatMode(1);
                this.mTimeAnimator.setRepeatCount(-1);
            }
            this.mTimeAnimator.start();
        }
    }

    public void startRecordAnimation(BottomAnimationConfig bottomAnimationConfig) {
        if (bottomAnimationConfig.mIsStart) {
            startRecord(bottomAnimationConfig);
        } else {
            finishRecord(bottomAnimationConfig);
        }
    }

    public void startRingAnimation() {
        cancelAnimation();
        this.mCirclePaintItem.setRingVisible(0);
        this.mRoundPaintItem.setVisible(8);
        this.mRingAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        this.mRingAnimator.setDuration(500);
        this.mRingAnimator.setRepeatCount(-1);
        this.mRingAnimator.setRepeatMode(1);
        this.mRingAnimator.setInterpolator(new BounceInterpolator() {
            public float getInterpolation(float f) {
                float interpolation = super.getInterpolation(f);
                CameraSnapAnimateDrawable.this.mCirclePaintItem.updateValue(interpolation);
                CameraSnapAnimateDrawable.this.invalidateSelf();
                return interpolation;
            }
        });
        this.mRingAnimator.start();
    }

    /* JADX WARNING: type inference failed for: r1v3, types: [android.animation.TimeInterpolator, com.android.camera.ui.drawable.snap.CameraSnapAnimateDrawable$2] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v3, types: [android.animation.TimeInterpolator, com.android.camera.ui.drawable.snap.CameraSnapAnimateDrawable$2]
  assigns: [com.android.camera.ui.drawable.snap.CameraSnapAnimateDrawable$2]
  uses: [android.animation.TimeInterpolator]
  mth insns count: 17
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void startScaleDownAnimation() {
        this.mRoundPaintItem.setTargetValues(0.63296f, this.mRoundPaintItem.mCurrentColor, this.mRoundPaintItem.mCurrentAlpha, this.mRoundPaintItem.mCurrentStrokeWidth);
        ValueAnimator ofFloat = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        ofFloat.setDuration(200);
        ofFloat.setInterpolator(new CubicEaseOutInterpolator() {
            public float getInterpolation(float f) {
                float interpolation = CameraSnapAnimateDrawable.super.getInterpolation(f);
                CameraSnapAnimateDrawable.this.mRoundPaintItem.updateValue(interpolation);
                CameraSnapAnimateDrawable.this.invalidateSelf();
                return interpolation;
            }
        });
        ofFloat.setupEndValues();
        ofFloat.start();
    }

    /* JADX WARNING: type inference failed for: r2v2, types: [android.animation.TimeInterpolator, com.android.camera.ui.drawable.snap.CameraSnapAnimateDrawable$3] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v2, types: [android.animation.TimeInterpolator, com.android.camera.ui.drawable.snap.CameraSnapAnimateDrawable$3]
  assigns: [com.android.camera.ui.drawable.snap.CameraSnapAnimateDrawable$3]
  uses: [android.animation.TimeInterpolator]
  mth insns count: 14
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void startScaleUpAnimation(long j, AnimatorListener animatorListener) {
        ValueAnimator ofFloat = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        ofFloat.setStartDelay(j);
        ofFloat.setDuration(200);
        ofFloat.setInterpolator(new CubicEaseOutInterpolator() {
            public float getInterpolation(float f) {
                float interpolation = CameraSnapAnimateDrawable.super.getInterpolation(f);
                CameraSnapAnimateDrawable.this.mRoundPaintItem.updateValue(interpolation);
                CameraSnapAnimateDrawable.this.invalidateSelf();
                return interpolation;
            }
        });
        ofFloat.addListener(new AnimatorListener() {
            public void onAnimationCancel(Animator animator) {
            }

            public void onAnimationEnd(Animator animator) {
            }

            public void onAnimationRepeat(Animator animator) {
            }

            public void onAnimationStart(Animator animator) {
                CameraSnapAnimateDrawable.this.mRoundPaintItem.setTargetValues(CameraSnapAnimateDrawable.SNAP_ROUND_ORIGINAL_WIDTH, CameraSnapAnimateDrawable.this.mRoundPaintItem.mCurrentColor, CameraSnapAnimateDrawable.this.mRoundPaintItem.mCurrentAlpha, CameraSnapAnimateDrawable.this.mRoundPaintItem.mCurrentStrokeWidth);
            }
        });
        if (animatorListener != null) {
            ofFloat.addListener(animatorListener);
        }
        ofFloat.setupEndValues();
        ofFloat.start();
    }

    public void stop() {
    }

    /* JADX WARNING: Code restructure failed: missing block: B:10:0x0033, code lost:
        r5.mRoundPaintItem.setTargetAlpha(0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:11:0x0039, code lost:
        r5.mRecordingPaint.setTargetValues(r5.mRecordingPaint.mCurrentWidthPercent, r5.mRecordingPaint.mCurrentColor, com.android.camera.ui.drawable.CameraPaintBase.ALPHA_OPAQUE, (float) com.android.camera.Util.dpToPixel(1.0f));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:9:0x0031, code lost:
        if (r6.mIsPostProcessing == false) goto L_0x0039;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void stopRecord(final BottomAnimationConfig bottomAnimationConfig) {
        if (this.mRecordingPaint != null) {
            this.mRecordingPaint.isRecording = true;
            cancelAnimation();
            int i = bottomAnimationConfig.mCurrentMode;
            if (i != 177) {
                switch (i) {
                    case 161:
                        break;
                    case 162:
                        break;
                    default:
                        switch (i) {
                            case 172:
                            case 173:
                                break;
                            case 174:
                                break;
                            default:
                                this.mRecordingPaint.setTargetValues(this.mRecordingPaint.mCurrentWidthPercent, this.mRecordingPaint.mCurrentColor, CameraPaintBase.ALPHA_OUTSTANDING, this.mRecordingPaint.mCurrentStrokeWidth);
                                break;
                        }
                }
            }
            this.mRecordingPaint.setTargetValues(this.mRecordingPaint.mCurrentWidthPercent, this.mRecordingPaint.mCurrentColor, CameraPaintBase.ALPHA_OPAQUE, (float) Util.dpToPixel(1.0f));
            this.mTimeAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
            this.mTimeAnimator.setDuration(300);
            this.mTimeAnimator.setInterpolator(new LinearInterpolator() {
                public float getInterpolation(float f) {
                    float interpolation = super.getInterpolation(f);
                    CameraSnapAnimateDrawable.this.mRoundPaintItem.updateRecordValue(interpolation, false);
                    if (bottomAnimationConfig.mIsPostProcessing) {
                        CameraSnapAnimateDrawable.this.mRoundPaintItem.updateValue(interpolation);
                    }
                    CameraSnapAnimateDrawable.this.invalidateSelf();
                    return interpolation;
                }
            });
            this.mTimeAnimator.removeAllListeners();
            this.mTimeAnimator.addListener(new AnimatorListener() {
                public void onAnimationCancel(Animator animator) {
                }

                public void onAnimationEnd(Animator animator) {
                    CameraSnapAnimateDrawable.this.mRecordingPaint.resetRecordingState();
                    CameraSnapAnimateDrawable.this.mRoundPaintItem.isRecording = false;
                    CameraSnapAnimateDrawable.this.mRoundPaintItem.isRecordingCircle = false;
                }

                public void onAnimationRepeat(Animator animator) {
                }

                public void onAnimationStart(Animator animator) {
                    CameraSnapAnimateDrawable.this.mRecordingPaint.resetRecordingState();
                    CameraSnapAnimateDrawable.this.mRecordingPaint.needZero = false;
                }
            });
            this.mTimeAnimator.start();
            ValueAnimator ofFloat = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
            ofFloat.setDuration(400);
            ofFloat.setInterpolator(new AccelerateInterpolator() {
                public float getInterpolation(float f) {
                    CameraSnapAnimateDrawable.this.mRecordingPaint.timeAngle = 0.0f;
                    float interpolation = super.getInterpolation(f);
                    CameraSnapAnimateDrawable.this.mRecordingPaint.updateValue(interpolation);
                    CameraSnapAnimateDrawable.this.invalidateSelf();
                    return interpolation;
                }
            });
            ofFloat.start();
        }
    }

    public void stopRingAnimation() {
        if (this.mRingAnimator != null) {
            this.mRingAnimator.cancel();
            this.mCirclePaintItem.setRingVisible(8);
            this.mRoundPaintItem.setVisible(0);
            invalidateSelf();
        }
    }
}
