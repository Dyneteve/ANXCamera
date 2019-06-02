package android.support.v4.widget;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.animation.FastOutSlowInInterpolator;
import android.view.View;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;
import com.android.camera.fragment.top.FragmentTopAlert;

final class SwipeProgressBar {
    private static final int ANIMATION_DURATION_MS = 2000;
    private static final int COLOR1 = -1291845632;
    private static final int COLOR2 = Integer.MIN_VALUE;
    private static final int COLOR3 = 1291845632;
    private static final int COLOR4 = 436207616;
    private static final int FINISH_ANIMATION_DURATION_MS = 1000;
    private static final Interpolator INTERPOLATOR = new FastOutSlowInInterpolator();
    private Rect mBounds = new Rect();
    private final RectF mClipRect = new RectF();
    private int mColor1;
    private int mColor2;
    private int mColor3;
    private int mColor4;
    private long mFinishTime;
    private final Paint mPaint = new Paint();
    private View mParent;
    private boolean mRunning;
    private long mStartTime;
    private float mTriggerPercentage;

    public SwipeProgressBar(View view) {
        this.mParent = view;
        this.mColor1 = COLOR1;
        this.mColor2 = Integer.MIN_VALUE;
        this.mColor3 = COLOR3;
        this.mColor4 = COLOR4;
    }

    private void drawCircle(Canvas canvas, float f, float f2, int i, float f3) {
        this.mPaint.setColor(i);
        canvas.save();
        canvas.translate(f, f2);
        float interpolation = INTERPOLATOR.getInterpolation(f3);
        canvas.scale(interpolation, interpolation);
        canvas.drawCircle(0.0f, 0.0f, f, this.mPaint);
        canvas.restore();
    }

    private void drawTrigger(Canvas canvas, int i, int i2) {
        this.mPaint.setColor(this.mColor1);
        canvas.drawCircle((float) i, (float) i2, ((float) i) * this.mTriggerPercentage, this.mPaint);
    }

    /* access modifiers changed from: 0000 */
    public void draw(Canvas canvas) {
        long j;
        boolean z;
        Canvas canvas2 = canvas;
        int width = this.mBounds.width();
        int height = this.mBounds.height();
        int i = width / 2;
        int i2 = height / 2;
        int save = canvas.save();
        canvas2.clipRect(this.mBounds);
        if (this.mRunning || this.mFinishTime > 0) {
            long currentAnimationTimeMillis = AnimationUtils.currentAnimationTimeMillis();
            long j2 = (currentAnimationTimeMillis - this.mStartTime) % FragmentTopAlert.HINT_DELAY_TIME;
            long j3 = (currentAnimationTimeMillis - this.mStartTime) / FragmentTopAlert.HINT_DELAY_TIME;
            float f = ((float) j2) / 20.0f;
            if (this.mRunning) {
                z = false;
                j = j2;
            } else if (currentAnimationTimeMillis - this.mFinishTime >= 1000) {
                this.mFinishTime = 0;
                return;
            } else {
                long j4 = (currentAnimationTimeMillis - this.mFinishTime) % 1000;
                float f2 = ((float) j4) / 10.0f;
                long j5 = j4;
                float interpolation = ((float) (width / 2)) * INTERPOLATOR.getInterpolation(f2 / 100.0f);
                float f3 = f2;
                float f4 = interpolation;
                j = j2;
                this.mClipRect.set(((float) i) - interpolation, 0.0f, ((float) i) + interpolation, (float) height);
                canvas2.saveLayerAlpha(this.mClipRect, 0, 0);
                z = true;
            }
            if (j3 == 0) {
                canvas2.drawColor(this.mColor1);
            } else if (f >= 0.0f && f < 25.0f) {
                canvas2.drawColor(this.mColor4);
            } else if (f >= 25.0f && f < 50.0f) {
                canvas2.drawColor(this.mColor1);
            } else if (f < 50.0f || f >= 75.0f) {
                canvas2.drawColor(this.mColor3);
            } else {
                canvas2.drawColor(this.mColor2);
            }
            if (f < 0.0f || f > 25.0f) {
                long j6 = j;
            } else {
                Canvas canvas3 = canvas2;
                long j7 = j;
                drawCircle(canvas3, (float) i, (float) i2, this.mColor1, ((f + 25.0f) * 2.0f) / 100.0f);
            }
            if (f >= 0.0f && f <= 50.0f) {
                Canvas canvas4 = canvas2;
                drawCircle(canvas4, (float) i, (float) i2, this.mColor2, (f * 2.0f) / 100.0f);
            }
            if (f >= 25.0f && f <= 75.0f) {
                Canvas canvas5 = canvas2;
                drawCircle(canvas5, (float) i, (float) i2, this.mColor3, ((f - 25.0f) * 2.0f) / 100.0f);
            }
            if (f >= 50.0f && f <= 100.0f) {
                Canvas canvas6 = canvas2;
                drawCircle(canvas6, (float) i, (float) i2, this.mColor4, ((f - 50.0f) * 2.0f) / 100.0f);
            }
            if (f >= 75.0f && f <= 100.0f) {
                Canvas canvas7 = canvas2;
                drawCircle(canvas7, (float) i, (float) i2, this.mColor1, ((f - 75.0f) * 2.0f) / 100.0f);
            }
            if (this.mTriggerPercentage > 0.0f && z) {
                canvas2.restoreToCount(save);
                int save2 = canvas.save();
                canvas2.clipRect(this.mBounds);
                drawTrigger(canvas2, i, i2);
                save = save2;
            }
            ViewCompat.postInvalidateOnAnimation(this.mParent, this.mBounds.left, this.mBounds.top, this.mBounds.right, this.mBounds.bottom);
            boolean z2 = z;
        } else if (this.mTriggerPercentage > 0.0f && ((double) this.mTriggerPercentage) <= 1.0d) {
            drawTrigger(canvas2, i, i2);
        }
        canvas2.restoreToCount(save);
    }

    /* access modifiers changed from: 0000 */
    public boolean isRunning() {
        return this.mRunning || this.mFinishTime > 0;
    }

    /* access modifiers changed from: 0000 */
    public void setBounds(int i, int i2, int i3, int i4) {
        this.mBounds.left = i;
        this.mBounds.top = i2;
        this.mBounds.right = i3;
        this.mBounds.bottom = i4;
    }

    /* access modifiers changed from: 0000 */
    public void setColorScheme(int i, int i2, int i3, int i4) {
        this.mColor1 = i;
        this.mColor2 = i2;
        this.mColor3 = i3;
        this.mColor4 = i4;
    }

    /* access modifiers changed from: 0000 */
    public void setTriggerPercentage(float f) {
        this.mTriggerPercentage = f;
        this.mStartTime = 0;
        ViewCompat.postInvalidateOnAnimation(this.mParent, this.mBounds.left, this.mBounds.top, this.mBounds.right, this.mBounds.bottom);
    }

    /* access modifiers changed from: 0000 */
    public void start() {
        if (!this.mRunning) {
            this.mTriggerPercentage = 0.0f;
            this.mStartTime = AnimationUtils.currentAnimationTimeMillis();
            this.mRunning = true;
            this.mParent.postInvalidate();
        }
    }

    /* access modifiers changed from: 0000 */
    public void stop() {
        if (this.mRunning) {
            this.mTriggerPercentage = 0.0f;
            this.mFinishTime = AnimationUtils.currentAnimationTimeMillis();
            this.mRunning = false;
            this.mParent.postInvalidate();
        }
    }
}
