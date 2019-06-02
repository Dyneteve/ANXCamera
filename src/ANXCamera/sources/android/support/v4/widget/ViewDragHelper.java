package android.support.v4.widget;

import android.content.Context;
import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.VelocityTrackerCompat;
import android.support.v4.view.ViewCompat;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.animation.Interpolator;
import java.util.Arrays;

public class ViewDragHelper {
    private static final int BASE_SETTLE_DURATION = 256;
    public static final int DIRECTION_ALL = 3;
    public static final int DIRECTION_HORIZONTAL = 1;
    public static final int DIRECTION_VERTICAL = 2;
    public static final int EDGE_ALL = 15;
    public static final int EDGE_BOTTOM = 8;
    public static final int EDGE_LEFT = 1;
    public static final int EDGE_RIGHT = 2;
    private static final int EDGE_SIZE = 20;
    public static final int EDGE_TOP = 4;
    public static final int INVALID_POINTER = -1;
    private static final int MAX_SETTLE_DURATION = 600;
    public static final int STATE_DRAGGING = 1;
    public static final int STATE_IDLE = 0;
    public static final int STATE_SETTLING = 2;
    private static final String TAG = "ViewDragHelper";
    private static final Interpolator sInterpolator = new Interpolator() {
        public float getInterpolation(float f) {
            float f2 = f - 1.0f;
            return (f2 * f2 * f2 * f2 * f2) + 1.0f;
        }
    };
    private int mActivePointerId = -1;
    private final Callback mCallback;
    private View mCapturedView;
    private int mDragState;
    private int[] mEdgeDragsInProgress;
    private int[] mEdgeDragsLocked;
    private int mEdgeSize;
    private int[] mInitialEdgesTouched;
    private float[] mInitialMotionX;
    private float[] mInitialMotionY;
    private float[] mLastMotionX;
    private float[] mLastMotionY;
    private float mMaxVelocity;
    private float mMinVelocity;
    private final ViewGroup mParentView;
    private int mPointersDown;
    private boolean mReleaseInProgress;
    private ScrollerCompat mScroller;
    private final Runnable mSetIdleRunnable = new Runnable() {
        public void run() {
            ViewDragHelper.this.setDragState(0);
        }
    };
    private int mTouchSlop;
    private int mTrackingEdges;
    private VelocityTracker mVelocityTracker;

    public static abstract class Callback {
        public int clampViewPositionHorizontal(View view, int i, int i2) {
            return 0;
        }

        public int clampViewPositionVertical(View view, int i, int i2) {
            return 0;
        }

        public int getOrderedChildIndex(int i) {
            return i;
        }

        public int getViewHorizontalDragRange(View view) {
            return 0;
        }

        public int getViewVerticalDragRange(View view) {
            return 0;
        }

        public void onEdgeDragStarted(int i, int i2) {
        }

        public boolean onEdgeLock(int i) {
            return false;
        }

        public void onEdgeTouched(int i, int i2) {
        }

        public void onViewCaptured(View view, int i) {
        }

        public void onViewDragStateChanged(int i) {
        }

        public void onViewPositionChanged(View view, int i, int i2, int i3, int i4) {
        }

        public void onViewReleased(View view, float f, float f2) {
        }

        public abstract boolean tryCaptureView(View view, int i);
    }

    private ViewDragHelper(Context context, ViewGroup viewGroup, Callback callback) {
        if (viewGroup == null) {
            throw new IllegalArgumentException("Parent view may not be null");
        } else if (callback != null) {
            this.mParentView = viewGroup;
            this.mCallback = callback;
            ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
            this.mEdgeSize = (int) ((20.0f * context.getResources().getDisplayMetrics().density) + 0.5f);
            this.mTouchSlop = viewConfiguration.getScaledTouchSlop();
            this.mMaxVelocity = (float) viewConfiguration.getScaledMaximumFlingVelocity();
            this.mMinVelocity = (float) viewConfiguration.getScaledMinimumFlingVelocity();
            this.mScroller = ScrollerCompat.create(context, sInterpolator);
        } else {
            throw new IllegalArgumentException("Callback may not be null");
        }
    }

    private boolean checkNewEdgeDrag(float f, float f2, int i, int i2) {
        float abs = Math.abs(f);
        float abs2 = Math.abs(f2);
        boolean z = false;
        if ((this.mInitialEdgesTouched[i] & i2) != i2 || (this.mTrackingEdges & i2) == 0 || (this.mEdgeDragsLocked[i] & i2) == i2 || (this.mEdgeDragsInProgress[i] & i2) == i2 || (abs <= ((float) this.mTouchSlop) && abs2 <= ((float) this.mTouchSlop))) {
            return false;
        }
        if (abs >= 0.5f * abs2 || !this.mCallback.onEdgeLock(i2)) {
            if ((this.mEdgeDragsInProgress[i] & i2) == 0 && abs > ((float) this.mTouchSlop)) {
                z = true;
            }
            return z;
        }
        int[] iArr = this.mEdgeDragsLocked;
        iArr[i] = iArr[i] | i2;
        return false;
    }

    private boolean checkTouchSlop(View view, float f, float f2) {
        boolean z;
        boolean z2 = false;
        if (view == null) {
            return false;
        }
        boolean z3 = this.mCallback.getViewHorizontalDragRange(view) > 0;
        boolean z4 = this.mCallback.getViewVerticalDragRange(view) > 0;
        if (z3 && z4) {
            if ((f * f) + (f2 * f2) > ((float) (this.mTouchSlop * this.mTouchSlop))) {
                z2 = true;
            }
            return z2;
        } else if (z3) {
            if (Math.abs(f) > ((float) this.mTouchSlop)) {
                z2 = true;
            }
            return z2;
        } else if (!z4) {
            return false;
        } else {
            if (Math.abs(f2) > ((float) this.mTouchSlop)) {
                z = true;
            }
            return z;
        }
    }

    private float clampMag(float f, float f2, float f3) {
        float abs = Math.abs(f);
        if (abs < f2) {
            return 0.0f;
        }
        if (abs <= f3) {
            return f;
        }
        return f > 0.0f ? f3 : -f3;
    }

    private int clampMag(int i, int i2, int i3) {
        int abs = Math.abs(i);
        if (abs < i2) {
            return 0;
        }
        if (abs <= i3) {
            return i;
        }
        return i > 0 ? i3 : -i3;
    }

    private void clearMotionHistory() {
        if (this.mInitialMotionX != null) {
            Arrays.fill(this.mInitialMotionX, 0.0f);
            Arrays.fill(this.mInitialMotionY, 0.0f);
            Arrays.fill(this.mLastMotionX, 0.0f);
            Arrays.fill(this.mLastMotionY, 0.0f);
            Arrays.fill(this.mInitialEdgesTouched, 0);
            Arrays.fill(this.mEdgeDragsInProgress, 0);
            Arrays.fill(this.mEdgeDragsLocked, 0);
            this.mPointersDown = 0;
        }
    }

    private void clearMotionHistory(int i) {
        if (this.mInitialMotionX != null) {
            this.mInitialMotionX[i] = 0.0f;
            this.mInitialMotionY[i] = 0.0f;
            this.mLastMotionX[i] = 0.0f;
            this.mLastMotionY[i] = 0.0f;
            this.mInitialEdgesTouched[i] = 0;
            this.mEdgeDragsInProgress[i] = 0;
            this.mEdgeDragsLocked[i] = 0;
            this.mPointersDown &= ~(1 << i);
        }
    }

    private int computeAxisDuration(int i, int i2, int i3) {
        if (i == 0) {
            return 0;
        }
        int width = this.mParentView.getWidth();
        int i4 = width / 2;
        float distanceInfluenceForSnapDuration = ((float) i4) + (((float) i4) * distanceInfluenceForSnapDuration(Math.min(1.0f, ((float) Math.abs(i)) / ((float) width))));
        int abs = Math.abs(i2);
        return Math.min(abs > 0 ? 4 * Math.round(1000.0f * Math.abs(distanceInfluenceForSnapDuration / ((float) abs))) : (int) ((1.0f + (((float) Math.abs(i)) / ((float) i3))) * 256.0f), MAX_SETTLE_DURATION);
    }

    private int computeSettleDuration(View view, int i, int i2, int i3, int i4) {
        float f;
        float f2;
        float f3;
        float f4;
        View view2 = view;
        int clampMag = clampMag(i3, (int) this.mMinVelocity, (int) this.mMaxVelocity);
        int clampMag2 = clampMag(i4, (int) this.mMinVelocity, (int) this.mMaxVelocity);
        int abs = Math.abs(i);
        int abs2 = Math.abs(i2);
        int abs3 = Math.abs(clampMag);
        int abs4 = Math.abs(clampMag2);
        int i5 = abs3 + abs4;
        int i6 = abs + abs2;
        if (clampMag != 0) {
            f = (float) abs3;
            f2 = (float) i5;
        } else {
            f = (float) abs;
            f2 = (float) i6;
        }
        float f5 = f / f2;
        if (clampMag2 != 0) {
            f3 = (float) abs4;
            f4 = (float) i5;
        } else {
            f3 = (float) abs2;
            f4 = (float) i6;
        }
        float f6 = f3 / f4;
        return (int) ((((float) computeAxisDuration(i, clampMag, this.mCallback.getViewHorizontalDragRange(view2))) * f5) + (((float) computeAxisDuration(i2, clampMag2, this.mCallback.getViewVerticalDragRange(view2))) * f6));
    }

    public static ViewDragHelper create(ViewGroup viewGroup, float f, Callback callback) {
        ViewDragHelper create = create(viewGroup, callback);
        create.mTouchSlop = (int) (((float) create.mTouchSlop) * (1.0f / f));
        return create;
    }

    public static ViewDragHelper create(ViewGroup viewGroup, Callback callback) {
        return new ViewDragHelper(viewGroup.getContext(), viewGroup, callback);
    }

    private void dispatchViewReleased(float f, float f2) {
        this.mReleaseInProgress = true;
        this.mCallback.onViewReleased(this.mCapturedView, f, f2);
        this.mReleaseInProgress = false;
        if (this.mDragState == 1) {
            setDragState(0);
        }
    }

    private float distanceInfluenceForSnapDuration(float f) {
        return (float) Math.sin((double) ((float) (((double) (f - 0.5f)) * 0.4712389167638204d)));
    }

    private void dragTo(int i, int i2, int i3, int i4) {
        int i5 = i3;
        int i6 = i4;
        int i7 = i;
        int i8 = i2;
        int left = this.mCapturedView.getLeft();
        int top = this.mCapturedView.getTop();
        if (i5 != 0) {
            i7 = this.mCallback.clampViewPositionHorizontal(this.mCapturedView, i, i5);
            this.mCapturedView.offsetLeftAndRight(i7 - left);
        } else {
            int i9 = i;
        }
        if (i6 != 0) {
            i8 = this.mCallback.clampViewPositionVertical(this.mCapturedView, i2, i6);
            this.mCapturedView.offsetTopAndBottom(i8 - top);
        } else {
            int i10 = i2;
        }
        if (i5 != 0 || i6 != 0) {
            this.mCallback.onViewPositionChanged(this.mCapturedView, i7, i8, i7 - left, i8 - top);
        }
    }

    private void ensureMotionHistorySizeForId(int i) {
        if (this.mInitialMotionX == null || this.mInitialMotionX.length <= i) {
            float[] fArr = new float[(i + 1)];
            float[] fArr2 = new float[(i + 1)];
            float[] fArr3 = new float[(i + 1)];
            float[] fArr4 = new float[(i + 1)];
            int[] iArr = new int[(i + 1)];
            int[] iArr2 = new int[(i + 1)];
            int[] iArr3 = new int[(i + 1)];
            if (this.mInitialMotionX != null) {
                System.arraycopy(this.mInitialMotionX, 0, fArr, 0, this.mInitialMotionX.length);
                System.arraycopy(this.mInitialMotionY, 0, fArr2, 0, this.mInitialMotionY.length);
                System.arraycopy(this.mLastMotionX, 0, fArr3, 0, this.mLastMotionX.length);
                System.arraycopy(this.mLastMotionY, 0, fArr4, 0, this.mLastMotionY.length);
                System.arraycopy(this.mInitialEdgesTouched, 0, iArr, 0, this.mInitialEdgesTouched.length);
                System.arraycopy(this.mEdgeDragsInProgress, 0, iArr2, 0, this.mEdgeDragsInProgress.length);
                System.arraycopy(this.mEdgeDragsLocked, 0, iArr3, 0, this.mEdgeDragsLocked.length);
            }
            this.mInitialMotionX = fArr;
            this.mInitialMotionY = fArr2;
            this.mLastMotionX = fArr3;
            this.mLastMotionY = fArr4;
            this.mInitialEdgesTouched = iArr;
            this.mEdgeDragsInProgress = iArr2;
            this.mEdgeDragsLocked = iArr3;
        }
    }

    private boolean forceSettleCapturedViewAt(int i, int i2, int i3, int i4) {
        int left = this.mCapturedView.getLeft();
        int top = this.mCapturedView.getTop();
        int i5 = i - left;
        int i6 = i2 - top;
        if (i5 == 0 && i6 == 0) {
            this.mScroller.abortAnimation();
            setDragState(0);
            return false;
        }
        this.mScroller.startScroll(left, top, i5, i6, computeSettleDuration(this.mCapturedView, i5, i6, i3, i4));
        setDragState(2);
        return true;
    }

    private int getEdgesTouched(int i, int i2) {
        int i3 = 0;
        if (i < this.mParentView.getLeft() + this.mEdgeSize) {
            i3 = 0 | 1;
        }
        if (i2 < this.mParentView.getTop() + this.mEdgeSize) {
            i3 |= 4;
        }
        if (i > this.mParentView.getRight() - this.mEdgeSize) {
            i3 |= 2;
        }
        return i2 > this.mParentView.getBottom() - this.mEdgeSize ? i3 | 8 : i3;
    }

    private void releaseViewForPointerUp() {
        this.mVelocityTracker.computeCurrentVelocity(1000, this.mMaxVelocity);
        dispatchViewReleased(clampMag(VelocityTrackerCompat.getXVelocity(this.mVelocityTracker, this.mActivePointerId), this.mMinVelocity, this.mMaxVelocity), clampMag(VelocityTrackerCompat.getYVelocity(this.mVelocityTracker, this.mActivePointerId), this.mMinVelocity, this.mMaxVelocity));
    }

    private void reportNewEdgeDrags(float f, float f2, int i) {
        int i2 = 0;
        if (checkNewEdgeDrag(f, f2, i, 1)) {
            i2 = 0 | 1;
        }
        if (checkNewEdgeDrag(f2, f, i, 4)) {
            i2 |= 4;
        }
        if (checkNewEdgeDrag(f, f2, i, 2)) {
            i2 |= 2;
        }
        if (checkNewEdgeDrag(f2, f, i, 8)) {
            i2 |= 8;
        }
        if (i2 != 0) {
            int[] iArr = this.mEdgeDragsInProgress;
            iArr[i] = iArr[i] | i2;
            this.mCallback.onEdgeDragStarted(i2, i);
        }
    }

    private void saveInitialMotion(float f, float f2, int i) {
        ensureMotionHistorySizeForId(i);
        float[] fArr = this.mInitialMotionX;
        this.mLastMotionX[i] = f;
        fArr[i] = f;
        float[] fArr2 = this.mInitialMotionY;
        this.mLastMotionY[i] = f2;
        fArr2[i] = f2;
        this.mInitialEdgesTouched[i] = getEdgesTouched((int) f, (int) f2);
        this.mPointersDown |= 1 << i;
    }

    private void saveLastMotion(MotionEvent motionEvent) {
        int pointerCount = MotionEventCompat.getPointerCount(motionEvent);
        for (int i = 0; i < pointerCount; i++) {
            int pointerId = MotionEventCompat.getPointerId(motionEvent, i);
            float x = MotionEventCompat.getX(motionEvent, i);
            float y = MotionEventCompat.getY(motionEvent, i);
            this.mLastMotionX[pointerId] = x;
            this.mLastMotionY[pointerId] = y;
        }
    }

    public void abort() {
        cancel();
        if (this.mDragState == 2) {
            int currX = this.mScroller.getCurrX();
            int currY = this.mScroller.getCurrY();
            this.mScroller.abortAnimation();
            int currX2 = this.mScroller.getCurrX();
            int currY2 = this.mScroller.getCurrY();
            this.mCallback.onViewPositionChanged(this.mCapturedView, currX2, currY2, currX2 - currX, currY2 - currY);
        }
        setDragState(0);
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Code restructure failed: missing block: B:20:0x0074, code lost:
        if (android.support.v4.view.ViewCompat.canScrollVertically(r0, -r20) != false) goto L_0x007f;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean canScroll(View view, boolean z, int i, int i2, int i3, int i4) {
        View view2 = view;
        boolean z2 = true;
        if (view2 instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view2;
            int scrollX = view.getScrollX();
            int scrollY = view.getScrollY();
            for (int childCount = viewGroup.getChildCount() - 1; childCount >= 0; childCount--) {
                View childAt = viewGroup.getChildAt(childCount);
                if (i3 + scrollX >= childAt.getLeft() && i3 + scrollX < childAt.getRight() && i4 + scrollY >= childAt.getTop() && i4 + scrollY < childAt.getBottom()) {
                    View view3 = childAt;
                    if (canScroll(childAt, true, i, i2, (i3 + scrollX) - childAt.getLeft(), (i4 + scrollY) - childAt.getTop())) {
                        return true;
                    }
                }
            }
        }
        if (z) {
            if (ViewCompat.canScrollHorizontally(view2, -i)) {
                int i5 = i2;
            }
            return z2;
        }
        int i6 = i;
        int i7 = i2;
        z2 = false;
        return z2;
    }

    public void cancel() {
        this.mActivePointerId = -1;
        clearMotionHistory();
        if (this.mVelocityTracker != null) {
            this.mVelocityTracker.recycle();
            this.mVelocityTracker = null;
        }
    }

    public void captureChildView(View view, int i) {
        if (view.getParent() == this.mParentView) {
            this.mCapturedView = view;
            this.mActivePointerId = i;
            this.mCallback.onViewCaptured(view, i);
            setDragState(1);
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("captureChildView: parameter must be a descendant of the ViewDragHelper's tracked parent view (");
        sb.append(this.mParentView);
        sb.append(")");
        throw new IllegalArgumentException(sb.toString());
    }

    public boolean checkTouchSlop(int i) {
        int length = this.mInitialMotionX.length;
        for (int i2 = 0; i2 < length; i2++) {
            if (checkTouchSlop(i, i2)) {
                return true;
            }
        }
        return false;
    }

    public boolean checkTouchSlop(int i, int i2) {
        boolean z;
        boolean z2 = false;
        if (!isPointerDown(i2)) {
            return false;
        }
        boolean z3 = (i & 1) == 1;
        boolean z4 = (i & 2) == 2;
        float f = this.mLastMotionX[i2] - this.mInitialMotionX[i2];
        float f2 = this.mLastMotionY[i2] - this.mInitialMotionY[i2];
        if (z3 && z4) {
            if ((f * f) + (f2 * f2) > ((float) (this.mTouchSlop * this.mTouchSlop))) {
                z2 = true;
            }
            return z2;
        } else if (z3) {
            if (Math.abs(f) > ((float) this.mTouchSlop)) {
                z2 = true;
            }
            return z2;
        } else if (!z4) {
            return false;
        } else {
            if (Math.abs(f2) > ((float) this.mTouchSlop)) {
                z = true;
            }
            return z;
        }
    }

    public boolean continueSettling(boolean z) {
        if (this.mDragState == 2) {
            boolean computeScrollOffset = this.mScroller.computeScrollOffset();
            int currX = this.mScroller.getCurrX();
            int currY = this.mScroller.getCurrY();
            int left = currX - this.mCapturedView.getLeft();
            int top = currY - this.mCapturedView.getTop();
            if (left != 0) {
                this.mCapturedView.offsetLeftAndRight(left);
            }
            if (top != 0) {
                this.mCapturedView.offsetTopAndBottom(top);
            }
            if (!(left == 0 && top == 0)) {
                this.mCallback.onViewPositionChanged(this.mCapturedView, currX, currY, left, top);
            }
            if (computeScrollOffset && currX == this.mScroller.getFinalX() && currY == this.mScroller.getFinalY()) {
                this.mScroller.abortAnimation();
                computeScrollOffset = false;
            }
            if (!computeScrollOffset) {
                if (z) {
                    this.mParentView.post(this.mSetIdleRunnable);
                } else {
                    setDragState(0);
                }
            }
        }
        return this.mDragState == 2;
    }

    public View findTopChildUnder(int i, int i2) {
        for (int childCount = this.mParentView.getChildCount() - 1; childCount >= 0; childCount--) {
            View childAt = this.mParentView.getChildAt(this.mCallback.getOrderedChildIndex(childCount));
            if (i >= childAt.getLeft() && i < childAt.getRight() && i2 >= childAt.getTop() && i2 < childAt.getBottom()) {
                return childAt;
            }
        }
        return null;
    }

    public void flingCapturedView(int i, int i2, int i3, int i4) {
        if (this.mReleaseInProgress) {
            this.mScroller.fling(this.mCapturedView.getLeft(), this.mCapturedView.getTop(), (int) VelocityTrackerCompat.getXVelocity(this.mVelocityTracker, this.mActivePointerId), (int) VelocityTrackerCompat.getYVelocity(this.mVelocityTracker, this.mActivePointerId), i, i3, i2, i4);
            setDragState(2);
            return;
        }
        throw new IllegalStateException("Cannot flingCapturedView outside of a call to Callback#onViewReleased");
    }

    public int getActivePointerId() {
        return this.mActivePointerId;
    }

    public View getCapturedView() {
        return this.mCapturedView;
    }

    public int getEdgeSize() {
        return this.mEdgeSize;
    }

    public float getMinVelocity() {
        return this.mMinVelocity;
    }

    public int getTouchSlop() {
        return this.mTouchSlop;
    }

    public int getViewDragState() {
        return this.mDragState;
    }

    public boolean isCapturedViewUnder(int i, int i2) {
        return isViewUnder(this.mCapturedView, i, i2);
    }

    public boolean isEdgeTouched(int i) {
        int length = this.mInitialEdgesTouched.length;
        for (int i2 = 0; i2 < length; i2++) {
            if (isEdgeTouched(i, i2)) {
                return true;
            }
        }
        return false;
    }

    public boolean isEdgeTouched(int i, int i2) {
        return isPointerDown(i2) && (this.mInitialEdgesTouched[i2] & i) != 0;
    }

    public boolean isPointerDown(int i) {
        return (this.mPointersDown & (1 << i)) != 0;
    }

    public boolean isViewUnder(View view, int i, int i2) {
        boolean z = false;
        if (view == null) {
            return false;
        }
        if (i >= view.getLeft() && i < view.getRight() && i2 >= view.getTop() && i2 < view.getBottom()) {
            z = true;
        }
        return z;
    }

    public void processTouchEvent(MotionEvent motionEvent) {
        int actionMasked = MotionEventCompat.getActionMasked(motionEvent);
        int actionIndex = MotionEventCompat.getActionIndex(motionEvent);
        if (actionMasked == 0) {
            cancel();
        }
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(motionEvent);
        int i = 0;
        switch (actionMasked) {
            case 0:
                float x = motionEvent.getX();
                float y = motionEvent.getY();
                int pointerId = MotionEventCompat.getPointerId(motionEvent, 0);
                View findTopChildUnder = findTopChildUnder((int) x, (int) y);
                saveInitialMotion(x, y, pointerId);
                tryCaptureViewForDrag(findTopChildUnder, pointerId);
                int i2 = this.mInitialEdgesTouched[pointerId];
                if ((this.mTrackingEdges & i2) != 0) {
                    this.mCallback.onEdgeTouched(this.mTrackingEdges & i2, pointerId);
                    return;
                }
                return;
            case 1:
                if (this.mDragState == 1) {
                    releaseViewForPointerUp();
                }
                cancel();
                return;
            case 2:
                if (this.mDragState == 1) {
                    int findPointerIndex = MotionEventCompat.findPointerIndex(motionEvent, this.mActivePointerId);
                    float x2 = MotionEventCompat.getX(motionEvent, findPointerIndex);
                    int i3 = (int) (x2 - this.mLastMotionX[this.mActivePointerId]);
                    int y2 = (int) (MotionEventCompat.getY(motionEvent, findPointerIndex) - this.mLastMotionY[this.mActivePointerId]);
                    dragTo(this.mCapturedView.getLeft() + i3, this.mCapturedView.getTop() + y2, i3, y2);
                    saveLastMotion(motionEvent);
                    return;
                }
                int pointerCount = MotionEventCompat.getPointerCount(motionEvent);
                while (i < pointerCount) {
                    int pointerId2 = MotionEventCompat.getPointerId(motionEvent, i);
                    float x3 = MotionEventCompat.getX(motionEvent, i);
                    float y3 = MotionEventCompat.getY(motionEvent, i);
                    float f = x3 - this.mInitialMotionX[pointerId2];
                    float f2 = y3 - this.mInitialMotionY[pointerId2];
                    reportNewEdgeDrags(f, f2, pointerId2);
                    if (this.mDragState != 1) {
                        View findTopChildUnder2 = findTopChildUnder((int) x3, (int) y3);
                        if (!checkTouchSlop(findTopChildUnder2, f, f2) || !tryCaptureViewForDrag(findTopChildUnder2, pointerId2)) {
                            i++;
                        }
                    }
                    saveLastMotion(motionEvent);
                    return;
                }
                saveLastMotion(motionEvent);
                return;
            case 3:
                if (this.mDragState == 1) {
                    dispatchViewReleased(0.0f, 0.0f);
                }
                cancel();
                return;
            case 5:
                int pointerId3 = MotionEventCompat.getPointerId(motionEvent, actionIndex);
                float x4 = MotionEventCompat.getX(motionEvent, actionIndex);
                float y4 = MotionEventCompat.getY(motionEvent, actionIndex);
                saveInitialMotion(x4, y4, pointerId3);
                if (this.mDragState == 0) {
                    tryCaptureViewForDrag(findTopChildUnder((int) x4, (int) y4), pointerId3);
                    int i4 = this.mInitialEdgesTouched[pointerId3];
                    if ((this.mTrackingEdges & i4) != 0) {
                        this.mCallback.onEdgeTouched(this.mTrackingEdges & i4, pointerId3);
                        return;
                    }
                    return;
                } else if (isCapturedViewUnder((int) x4, (int) y4)) {
                    tryCaptureViewForDrag(this.mCapturedView, pointerId3);
                    return;
                } else {
                    return;
                }
            case 6:
                int pointerId4 = MotionEventCompat.getPointerId(motionEvent, actionIndex);
                if (this.mDragState == 1 && pointerId4 == this.mActivePointerId) {
                    int i5 = -1;
                    int pointerCount2 = MotionEventCompat.getPointerCount(motionEvent);
                    while (true) {
                        if (i < pointerCount2) {
                            int pointerId5 = MotionEventCompat.getPointerId(motionEvent, i);
                            if (pointerId5 != this.mActivePointerId) {
                                if (findTopChildUnder((int) MotionEventCompat.getX(motionEvent, i), (int) MotionEventCompat.getY(motionEvent, i)) == this.mCapturedView && tryCaptureViewForDrag(this.mCapturedView, pointerId5)) {
                                    i5 = this.mActivePointerId;
                                }
                            }
                            i++;
                        }
                    }
                    if (i5 == -1) {
                        releaseViewForPointerUp();
                    }
                }
                clearMotionHistory(pointerId4);
                return;
            default:
                return;
        }
    }

    /* access modifiers changed from: 0000 */
    public void setDragState(int i) {
        this.mParentView.removeCallbacks(this.mSetIdleRunnable);
        if (this.mDragState != i) {
            this.mDragState = i;
            this.mCallback.onViewDragStateChanged(i);
            if (this.mDragState == 0) {
                this.mCapturedView = null;
            }
        }
    }

    public void setEdgeTrackingEnabled(int i) {
        this.mTrackingEdges = i;
    }

    public void setMinVelocity(float f) {
        this.mMinVelocity = f;
    }

    public boolean settleCapturedViewAt(int i, int i2) {
        if (this.mReleaseInProgress) {
            return forceSettleCapturedViewAt(i, i2, (int) VelocityTrackerCompat.getXVelocity(this.mVelocityTracker, this.mActivePointerId), (int) VelocityTrackerCompat.getYVelocity(this.mVelocityTracker, this.mActivePointerId));
        }
        throw new IllegalStateException("Cannot settleCapturedViewAt outside of a call to Callback#onViewReleased");
    }

    /* JADX WARNING: Code restructure failed: missing block: B:10:0x0033, code lost:
        r16 = r2;
        r17 = r3;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:37:0x00df, code lost:
        if (r2 != r15) goto L_0x00ee;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:51:0x011b, code lost:
        r5 = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:61:0x0156, code lost:
        if (r0.mDragState != 1) goto L_0x0159;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:70:?, code lost:
        return r5;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:71:?, code lost:
        return true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:8:0x0024, code lost:
        r16 = r2;
        r17 = r3;
        r5 = false;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean shouldInterceptTouchEvent(MotionEvent motionEvent) {
        int i;
        int i2;
        int i3;
        MotionEvent motionEvent2 = motionEvent;
        int actionMasked = MotionEventCompat.getActionMasked(motionEvent);
        int actionIndex = MotionEventCompat.getActionIndex(motionEvent);
        if (actionMasked == 0) {
            cancel();
        }
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(motionEvent2);
        switch (actionMasked) {
            case 0:
                int i4 = actionMasked;
                int i5 = actionIndex;
                float x = motionEvent.getX();
                float y = motionEvent.getY();
                boolean z = false;
                int pointerId = MotionEventCompat.getPointerId(motionEvent2, 0);
                saveInitialMotion(x, y, pointerId);
                View findTopChildUnder = findTopChildUnder((int) x, (int) y);
                if (findTopChildUnder == this.mCapturedView && this.mDragState == 2) {
                    tryCaptureViewForDrag(findTopChildUnder, pointerId);
                }
                int i6 = this.mInitialEdgesTouched[pointerId];
                if ((this.mTrackingEdges & i6) != 0) {
                    this.mCallback.onEdgeTouched(this.mTrackingEdges & i6, pointerId);
                    break;
                }
                break;
            case 1:
            case 3:
                int i7 = actionMasked;
                int i8 = actionIndex;
                cancel();
                break;
            case 2:
                if (this.mInitialMotionX != null) {
                    if (this.mInitialMotionY != null) {
                        int pointerCount = MotionEventCompat.getPointerCount(motionEvent);
                        int i9 = 0;
                        while (true) {
                            if (i9 < pointerCount) {
                                int pointerId2 = MotionEventCompat.getPointerId(motionEvent2, i9);
                                float x2 = MotionEventCompat.getX(motionEvent2, i9);
                                float y2 = MotionEventCompat.getY(motionEvent2, i9);
                                float f = x2 - this.mInitialMotionX[pointerId2];
                                float f2 = y2 - this.mInitialMotionY[pointerId2];
                                View findTopChildUnder2 = findTopChildUnder((int) x2, (int) y2);
                                boolean z2 = findTopChildUnder2 != null && checkTouchSlop(findTopChildUnder2, f, f2);
                                if (z2) {
                                    int left = findTopChildUnder2.getLeft();
                                    int i10 = ((int) f) + left;
                                    i3 = actionMasked;
                                    int clampViewPositionHorizontal = this.mCallback.clampViewPositionHorizontal(findTopChildUnder2, i10, (int) f);
                                    int top = findTopChildUnder2.getTop();
                                    i2 = actionIndex;
                                    int i11 = ((int) f2) + top;
                                    i = pointerCount;
                                    int i12 = i10;
                                    int clampViewPositionVertical = this.mCallback.clampViewPositionVertical(findTopChildUnder2, i11, (int) f2);
                                    int viewHorizontalDragRange = this.mCallback.getViewHorizontalDragRange(findTopChildUnder2);
                                    int i13 = i11;
                                    int viewVerticalDragRange = this.mCallback.getViewVerticalDragRange(findTopChildUnder2);
                                    if (viewHorizontalDragRange != 0) {
                                        if (viewHorizontalDragRange > 0) {
                                        }
                                    }
                                    if (viewVerticalDragRange != 0) {
                                        if (viewVerticalDragRange > 0 && clampViewPositionVertical == top) {
                                        }
                                    }
                                } else {
                                    i3 = actionMasked;
                                    i2 = actionIndex;
                                    i = pointerCount;
                                }
                                reportNewEdgeDrags(f, f2, pointerId2);
                                if (this.mDragState != 1 && (!z2 || !tryCaptureViewForDrag(findTopChildUnder2, pointerId2))) {
                                    i9++;
                                    actionMasked = i3;
                                    actionIndex = i2;
                                    pointerCount = i;
                                }
                            } else {
                                int i14 = actionMasked;
                                int i15 = actionIndex;
                                int i16 = pointerCount;
                            }
                        }
                        saveLastMotion(motionEvent);
                        break;
                    }
                }
                break;
            case 5:
                int pointerId3 = MotionEventCompat.getPointerId(motionEvent2, actionIndex);
                float x3 = MotionEventCompat.getX(motionEvent2, actionIndex);
                float y3 = MotionEventCompat.getY(motionEvent2, actionIndex);
                saveInitialMotion(x3, y3, pointerId3);
                if (this.mDragState != 0) {
                    if (this.mDragState == 2) {
                        View findTopChildUnder3 = findTopChildUnder((int) x3, (int) y3);
                        if (findTopChildUnder3 == this.mCapturedView) {
                            tryCaptureViewForDrag(findTopChildUnder3, pointerId3);
                            break;
                        }
                    }
                } else {
                    int i17 = this.mInitialEdgesTouched[pointerId3];
                    if ((this.mTrackingEdges & i17) != 0) {
                        this.mCallback.onEdgeTouched(this.mTrackingEdges & i17, pointerId3);
                        break;
                    }
                }
                break;
            case 6:
                clearMotionHistory(MotionEventCompat.getPointerId(motionEvent2, actionIndex));
                break;
        }
    }

    public boolean smoothSlideViewTo(View view, int i, int i2) {
        this.mCapturedView = view;
        this.mActivePointerId = -1;
        boolean forceSettleCapturedViewAt = forceSettleCapturedViewAt(i, i2, 0, 0);
        if (!forceSettleCapturedViewAt && this.mDragState == 0 && this.mCapturedView != null) {
            this.mCapturedView = null;
        }
        return forceSettleCapturedViewAt;
    }

    /* access modifiers changed from: 0000 */
    public boolean tryCaptureViewForDrag(View view, int i) {
        if (view == this.mCapturedView && this.mActivePointerId == i) {
            return true;
        }
        if (view == null || !this.mCallback.tryCaptureView(view, i)) {
            return false;
        }
        this.mActivePointerId = i;
        captureChildView(view, i);
        return true;
    }
}
