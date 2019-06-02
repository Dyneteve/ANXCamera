package android.support.v7.widget.helper;

import android.graphics.Canvas;
import android.graphics.Rect;
import android.os.Build.VERSION;
import android.support.v4.animation.AnimatorCompatHelper;
import android.support.v4.animation.AnimatorListenerCompat;
import android.support.v4.animation.AnimatorUpdateListenerCompat;
import android.support.v4.animation.ValueAnimatorCompat;
import android.support.v4.view.GestureDetectorCompat;
import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.VelocityTrackerCompat;
import android.support.v4.view.ViewCompat;
import android.support.v7.recyclerview.R;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ChildDrawingOrderCallback;
import android.support.v7.widget.RecyclerView.ItemAnimator;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.support.v7.widget.RecyclerView.OnChildAttachStateChangeListener;
import android.support.v7.widget.RecyclerView.OnItemTouchListener;
import android.support.v7.widget.RecyclerView.State;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.util.Log;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewParent;
import android.view.animation.Interpolator;
import java.util.ArrayList;
import java.util.List;

public class ItemTouchHelper extends ItemDecoration implements OnChildAttachStateChangeListener {
    private static final int ACTION_MODE_DRAG_MASK = 16711680;
    private static final int ACTION_MODE_IDLE_MASK = 255;
    private static final int ACTION_MODE_SWIPE_MASK = 65280;
    public static final int ACTION_STATE_DRAG = 2;
    public static final int ACTION_STATE_IDLE = 0;
    public static final int ACTION_STATE_SWIPE = 1;
    private static final int ACTIVE_POINTER_ID_NONE = -1;
    public static final int ANIMATION_TYPE_DRAG = 8;
    public static final int ANIMATION_TYPE_SWIPE_CANCEL = 4;
    public static final int ANIMATION_TYPE_SWIPE_SUCCESS = 2;
    private static final boolean DEBUG = false;
    private static final int DIRECTION_FLAG_COUNT = 8;
    public static final int DOWN = 2;
    public static final int END = 32;
    public static final int LEFT = 4;
    public static final int RIGHT = 8;
    public static final int START = 16;
    private static final String TAG = "ItemTouchHelper";
    public static final int UP = 1;
    int mActionState = 0;
    int mActivePointerId = -1;
    Callback mCallback;
    private ChildDrawingOrderCallback mChildDrawingOrderCallback = null;
    private List<Integer> mDistances;
    private long mDragScrollStartTimeInMs;
    float mDx;
    float mDy;
    /* access modifiers changed from: private */
    public GestureDetectorCompat mGestureDetector;
    float mInitialTouchX;
    float mInitialTouchY;
    private final OnItemTouchListener mOnItemTouchListener = new OnItemTouchListener() {
        public boolean onInterceptTouchEvent(RecyclerView recyclerView, MotionEvent motionEvent) {
            ItemTouchHelper.this.mGestureDetector.onTouchEvent(motionEvent);
            int actionMasked = MotionEventCompat.getActionMasked(motionEvent);
            if (actionMasked == 0) {
                ItemTouchHelper.this.mActivePointerId = MotionEventCompat.getPointerId(motionEvent, 0);
                ItemTouchHelper.this.mInitialTouchX = motionEvent.getX();
                ItemTouchHelper.this.mInitialTouchY = motionEvent.getY();
                ItemTouchHelper.this.obtainVelocityTracker();
                if (ItemTouchHelper.this.mSelected == null) {
                    RecoverAnimation access$600 = ItemTouchHelper.this.findAnimation(motionEvent);
                    if (access$600 != null) {
                        ItemTouchHelper.this.mInitialTouchX -= access$600.mX;
                        ItemTouchHelper.this.mInitialTouchY -= access$600.mY;
                        ItemTouchHelper.this.endRecoverAnimation(access$600.mViewHolder, true);
                        if (ItemTouchHelper.this.mPendingCleanup.remove(access$600.mViewHolder.itemView)) {
                            ItemTouchHelper.this.mCallback.clearView(ItemTouchHelper.this.mRecyclerView, access$600.mViewHolder);
                        }
                        ItemTouchHelper.this.select(access$600.mViewHolder, access$600.mActionState);
                        ItemTouchHelper.this.updateDxDy(motionEvent, ItemTouchHelper.this.mSelectedFlags, 0);
                    }
                }
            } else if (actionMasked == 3 || actionMasked == 1) {
                ItemTouchHelper.this.mActivePointerId = -1;
                ItemTouchHelper.this.select(null, 0);
            } else if (ItemTouchHelper.this.mActivePointerId != -1) {
                int findPointerIndex = MotionEventCompat.findPointerIndex(motionEvent, ItemTouchHelper.this.mActivePointerId);
                if (findPointerIndex >= 0) {
                    ItemTouchHelper.this.checkSelectForSwipe(actionMasked, motionEvent, findPointerIndex);
                }
            }
            if (ItemTouchHelper.this.mVelocityTracker != null) {
                ItemTouchHelper.this.mVelocityTracker.addMovement(motionEvent);
            }
            return ItemTouchHelper.this.mSelected != null;
        }

        public void onRequestDisallowInterceptTouchEvent(boolean z) {
            if (z) {
                ItemTouchHelper.this.select(null, 0);
            }
        }

        public void onTouchEvent(RecyclerView recyclerView, MotionEvent motionEvent) {
            ItemTouchHelper.this.mGestureDetector.onTouchEvent(motionEvent);
            if (ItemTouchHelper.this.mVelocityTracker != null) {
                ItemTouchHelper.this.mVelocityTracker.addMovement(motionEvent);
            }
            if (ItemTouchHelper.this.mActivePointerId != -1) {
                int actionMasked = MotionEventCompat.getActionMasked(motionEvent);
                int findPointerIndex = MotionEventCompat.findPointerIndex(motionEvent, ItemTouchHelper.this.mActivePointerId);
                if (findPointerIndex >= 0) {
                    ItemTouchHelper.this.checkSelectForSwipe(actionMasked, motionEvent, findPointerIndex);
                }
                ViewHolder viewHolder = ItemTouchHelper.this.mSelected;
                if (viewHolder != null) {
                    int i = 0;
                    if (actionMasked != 6) {
                        switch (actionMasked) {
                            case 1:
                            case 3:
                                if (ItemTouchHelper.this.mVelocityTracker != null) {
                                    ItemTouchHelper.this.mVelocityTracker.computeCurrentVelocity(1000, (float) ItemTouchHelper.this.mRecyclerView.getMaxFlingVelocity());
                                }
                                ItemTouchHelper.this.select(null, 0);
                                ItemTouchHelper.this.mActivePointerId = -1;
                                break;
                            case 2:
                                if (findPointerIndex >= 0) {
                                    ItemTouchHelper.this.updateDxDy(motionEvent, ItemTouchHelper.this.mSelectedFlags, findPointerIndex);
                                    ItemTouchHelper.this.moveIfNecessary(viewHolder);
                                    ItemTouchHelper.this.mRecyclerView.removeCallbacks(ItemTouchHelper.this.mScrollRunnable);
                                    ItemTouchHelper.this.mScrollRunnable.run();
                                    ItemTouchHelper.this.mRecyclerView.invalidate();
                                    break;
                                }
                                break;
                        }
                    } else {
                        int actionIndex = MotionEventCompat.getActionIndex(motionEvent);
                        if (MotionEventCompat.getPointerId(motionEvent, actionIndex) == ItemTouchHelper.this.mActivePointerId) {
                            if (ItemTouchHelper.this.mVelocityTracker != null) {
                                ItemTouchHelper.this.mVelocityTracker.computeCurrentVelocity(1000, (float) ItemTouchHelper.this.mRecyclerView.getMaxFlingVelocity());
                            }
                            if (actionIndex == 0) {
                                i = 1;
                            }
                            ItemTouchHelper.this.mActivePointerId = MotionEventCompat.getPointerId(motionEvent, i);
                            ItemTouchHelper.this.updateDxDy(motionEvent, ItemTouchHelper.this.mSelectedFlags, actionIndex);
                        }
                    }
                }
            }
        }
    };
    /* access modifiers changed from: private */
    public View mOverdrawChild = null;
    /* access modifiers changed from: private */
    public int mOverdrawChildPosition = -1;
    final List<View> mPendingCleanup = new ArrayList();
    List<RecoverAnimation> mRecoverAnimations = new ArrayList();
    /* access modifiers changed from: private */
    public RecyclerView mRecyclerView;
    /* access modifiers changed from: private */
    public final Runnable mScrollRunnable = new Runnable() {
        public void run() {
            if (ItemTouchHelper.this.mSelected != null && ItemTouchHelper.this.scrollIfNecessary()) {
                if (ItemTouchHelper.this.mSelected != null) {
                    ItemTouchHelper.this.moveIfNecessary(ItemTouchHelper.this.mSelected);
                }
                ItemTouchHelper.this.mRecyclerView.removeCallbacks(ItemTouchHelper.this.mScrollRunnable);
                ViewCompat.postOnAnimation(ItemTouchHelper.this.mRecyclerView, this);
            }
        }
    };
    ViewHolder mSelected = null;
    int mSelectedFlags;
    float mSelectedStartX;
    float mSelectedStartY;
    private int mSlop;
    private List<ViewHolder> mSwapTargets;
    private final float[] mTmpPosition = new float[2];
    private Rect mTmpRect;
    /* access modifiers changed from: private */
    public VelocityTracker mVelocityTracker;

    public static abstract class Callback {
        private static final int ABS_HORIZONTAL_DIR_FLAGS = 789516;
        public static final int DEFAULT_DRAG_ANIMATION_DURATION = 200;
        public static final int DEFAULT_SWIPE_ANIMATION_DURATION = 250;
        private static final long DRAG_SCROLL_ACCELERATION_LIMIT_TIME_MS = 2000;
        static final int RELATIVE_DIR_FLAGS = 3158064;
        private static final Interpolator sDragScrollInterpolator = new Interpolator() {
            public float getInterpolation(float f) {
                return f * f * f * f * f;
            }
        };
        private static final Interpolator sDragViewScrollCapInterpolator = new Interpolator() {
            public float getInterpolation(float f) {
                float f2 = f - 1.0f;
                return (f2 * f2 * f2 * f2 * f2) + 1.0f;
            }
        };
        private static final ItemTouchUIUtil sUICallback;
        private int mCachedMaxScrollSpeed = -1;

        static {
            if (VERSION.SDK_INT >= 21) {
                sUICallback = new Lollipop();
            } else if (VERSION.SDK_INT >= 11) {
                sUICallback = new Honeycomb();
            } else {
                sUICallback = new Gingerbread();
            }
        }

        public static int convertToRelativeDirection(int i, int i2) {
            int i3 = i & ABS_HORIZONTAL_DIR_FLAGS;
            if (i3 == 0) {
                return i;
            }
            int i4 = i & (~i3);
            return i2 == 0 ? i4 | (i3 << 2) : i4 | ((i3 << 1) & -789517) | ((ABS_HORIZONTAL_DIR_FLAGS & (i3 << 1)) << 2);
        }

        public static ItemTouchUIUtil getDefaultUIUtil() {
            return sUICallback;
        }

        private int getMaxDragScroll(RecyclerView recyclerView) {
            if (this.mCachedMaxScrollSpeed == -1) {
                this.mCachedMaxScrollSpeed = recyclerView.getResources().getDimensionPixelSize(R.dimen.item_touch_helper_max_drag_scroll_per_frame);
            }
            return this.mCachedMaxScrollSpeed;
        }

        /* access modifiers changed from: private */
        public boolean hasDragFlag(RecyclerView recyclerView, ViewHolder viewHolder) {
            return (ItemTouchHelper.ACTION_MODE_DRAG_MASK & getAbsoluteMovementFlags(recyclerView, viewHolder)) != 0;
        }

        /* access modifiers changed from: private */
        public boolean hasSwipeFlag(RecyclerView recyclerView, ViewHolder viewHolder) {
            return (65280 & getAbsoluteMovementFlags(recyclerView, viewHolder)) != 0;
        }

        public static int makeFlag(int i, int i2) {
            return i2 << (i * 8);
        }

        public static int makeMovementFlags(int i, int i2) {
            return makeFlag(0, i2 | i) | makeFlag(1, i2) | makeFlag(2, i);
        }

        /* access modifiers changed from: private */
        public void onDraw(Canvas canvas, RecyclerView recyclerView, ViewHolder viewHolder, List<RecoverAnimation> list, int i, float f, float f2) {
            Canvas canvas2 = canvas;
            int size = list.size();
            int i2 = 0;
            while (true) {
                int i3 = i2;
                if (i3 >= size) {
                    break;
                }
                RecoverAnimation recoverAnimation = (RecoverAnimation) list.get(i3);
                recoverAnimation.update();
                int save = canvas2.save();
                onChildDraw(canvas2, recyclerView, recoverAnimation.mViewHolder, recoverAnimation.mX, recoverAnimation.mY, recoverAnimation.mActionState, false);
                canvas2.restoreToCount(save);
                i2 = i3 + 1;
            }
            List<RecoverAnimation> list2 = list;
            if (viewHolder != null) {
                int save2 = canvas2.save();
                onChildDraw(canvas2, recyclerView, viewHolder, f, f2, i, true);
                canvas2.restoreToCount(save2);
            }
        }

        /* access modifiers changed from: private */
        public void onDrawOver(Canvas canvas, RecyclerView recyclerView, ViewHolder viewHolder, List<RecoverAnimation> list, int i, float f, float f2) {
            Canvas canvas2 = canvas;
            List<RecoverAnimation> list2 = list;
            int size = list.size();
            int i2 = 0;
            while (true) {
                int i3 = i2;
                if (i3 >= size) {
                    break;
                }
                RecoverAnimation recoverAnimation = (RecoverAnimation) list2.get(i3);
                int save = canvas2.save();
                onChildDrawOver(canvas2, recyclerView, recoverAnimation.mViewHolder, recoverAnimation.mX, recoverAnimation.mY, recoverAnimation.mActionState, false);
                canvas2.restoreToCount(save);
                i2 = i3 + 1;
            }
            if (viewHolder != null) {
                int save2 = canvas2.save();
                onChildDrawOver(canvas2, recyclerView, viewHolder, f, f2, i, true);
                canvas2.restoreToCount(save2);
            }
            boolean z = false;
            for (int i4 = size - 1; i4 >= 0; i4--) {
                RecoverAnimation recoverAnimation2 = (RecoverAnimation) list2.get(i4);
                if (recoverAnimation2.mEnded && !recoverAnimation2.mIsPendingCleanup) {
                    list2.remove(i4);
                    recoverAnimation2.mViewHolder.setIsRecyclable(true);
                } else if (!recoverAnimation2.mEnded) {
                    z = true;
                }
            }
            if (z) {
                recyclerView.invalidate();
            }
        }

        public boolean canDropOver(RecyclerView recyclerView, ViewHolder viewHolder, ViewHolder viewHolder2) {
            return true;
        }

        public ViewHolder chooseDropTarget(ViewHolder viewHolder, List<ViewHolder> list, int i, int i2) {
            ViewHolder viewHolder2 = viewHolder;
            int width = i + viewHolder2.itemView.getWidth();
            int height = i2 + viewHolder2.itemView.getHeight();
            ViewHolder viewHolder3 = null;
            int i3 = -1;
            int left = i - viewHolder2.itemView.getLeft();
            int top = i2 - viewHolder2.itemView.getTop();
            int size = list.size();
            for (int i4 = 0; i4 < size; i4++) {
                ViewHolder viewHolder4 = (ViewHolder) list.get(i4);
                if (left > 0) {
                    int right = viewHolder4.itemView.getRight() - width;
                    if (right < 0 && viewHolder4.itemView.getRight() > viewHolder2.itemView.getRight()) {
                        int abs = Math.abs(right);
                        if (abs > i3) {
                            i3 = abs;
                            viewHolder3 = viewHolder4;
                        }
                    }
                }
                if (left < 0) {
                    int left2 = viewHolder4.itemView.getLeft() - i;
                    if (left2 > 0 && viewHolder4.itemView.getLeft() < viewHolder2.itemView.getLeft()) {
                        int abs2 = Math.abs(left2);
                        if (abs2 > i3) {
                            i3 = abs2;
                            viewHolder3 = viewHolder4;
                        }
                    }
                }
                if (top < 0) {
                    int top2 = viewHolder4.itemView.getTop() - i2;
                    if (top2 > 0 && viewHolder4.itemView.getTop() < viewHolder2.itemView.getTop()) {
                        int abs3 = Math.abs(top2);
                        if (abs3 > i3) {
                            i3 = abs3;
                            viewHolder3 = viewHolder4;
                        }
                    }
                }
                if (top > 0) {
                    int bottom = viewHolder4.itemView.getBottom() - height;
                    if (bottom < 0 && viewHolder4.itemView.getBottom() > viewHolder2.itemView.getBottom()) {
                        int abs4 = Math.abs(bottom);
                        if (abs4 > i3) {
                            i3 = abs4;
                            viewHolder3 = viewHolder4;
                        }
                    }
                }
            }
            List<ViewHolder> list2 = list;
            return viewHolder3;
        }

        public void clearView(RecyclerView recyclerView, ViewHolder viewHolder) {
            sUICallback.clearView(viewHolder.itemView);
        }

        public int convertToAbsoluteDirection(int i, int i2) {
            int i3 = i & RELATIVE_DIR_FLAGS;
            if (i3 == 0) {
                return i;
            }
            int i4 = i & (~i3);
            return i2 == 0 ? i4 | (i3 >> 2) : i4 | ((i3 >> 1) & -3158065) | ((RELATIVE_DIR_FLAGS & (i3 >> 1)) >> 2);
        }

        /* access modifiers changed from: 0000 */
        public final int getAbsoluteMovementFlags(RecyclerView recyclerView, ViewHolder viewHolder) {
            return convertToAbsoluteDirection(getMovementFlags(recyclerView, viewHolder), ViewCompat.getLayoutDirection(recyclerView));
        }

        public long getAnimationDuration(RecyclerView recyclerView, int i, float f, float f2) {
            ItemAnimator itemAnimator = recyclerView.getItemAnimator();
            if (itemAnimator == null) {
                return i == 8 ? 200 : 250;
            }
            return i == 8 ? itemAnimator.getMoveDuration() : itemAnimator.getRemoveDuration();
        }

        public int getBoundingBoxMargin() {
            return 0;
        }

        public float getMoveThreshold(ViewHolder viewHolder) {
            return 0.5f;
        }

        public abstract int getMovementFlags(RecyclerView recyclerView, ViewHolder viewHolder);

        public float getSwipeThreshold(ViewHolder viewHolder) {
            return 0.5f;
        }

        public int interpolateOutOfBoundsScroll(RecyclerView recyclerView, int i, int i2, int i3, long j) {
            int signum = (int) (((float) ((int) (((float) (((int) Math.signum((float) i2)) * getMaxDragScroll(recyclerView))) * sDragViewScrollCapInterpolator.getInterpolation(Math.min(1.0f, (((float) Math.abs(i2)) * 1.0f) / ((float) i)))))) * sDragScrollInterpolator.getInterpolation(j > 2000 ? 1.0f : ((float) j) / 2000.0f));
            if (signum != 0) {
                return signum;
            }
            return i2 > 0 ? 1 : -1;
        }

        public boolean isItemViewSwipeEnabled() {
            return true;
        }

        public boolean isLongPressDragEnabled() {
            return true;
        }

        public void onChildDraw(Canvas canvas, RecyclerView recyclerView, ViewHolder viewHolder, float f, float f2, int i, boolean z) {
            sUICallback.onDraw(canvas, recyclerView, viewHolder.itemView, f, f2, i, z);
        }

        public void onChildDrawOver(Canvas canvas, RecyclerView recyclerView, ViewHolder viewHolder, float f, float f2, int i, boolean z) {
            sUICallback.onDrawOver(canvas, recyclerView, viewHolder.itemView, f, f2, i, z);
        }

        public abstract boolean onMove(RecyclerView recyclerView, ViewHolder viewHolder, ViewHolder viewHolder2);

        public void onMoved(RecyclerView recyclerView, ViewHolder viewHolder, int i, ViewHolder viewHolder2, int i2, int i3, int i4) {
            LayoutManager layoutManager = recyclerView.getLayoutManager();
            if (layoutManager instanceof ViewDropHandler) {
                ((ViewDropHandler) layoutManager).prepareForDrop(viewHolder.itemView, viewHolder2.itemView, i3, i4);
                return;
            }
            if (layoutManager.canScrollHorizontally()) {
                if (layoutManager.getDecoratedLeft(viewHolder2.itemView) <= recyclerView.getPaddingLeft()) {
                    recyclerView.scrollToPosition(i2);
                }
                if (layoutManager.getDecoratedRight(viewHolder2.itemView) >= recyclerView.getWidth() - recyclerView.getPaddingRight()) {
                    recyclerView.scrollToPosition(i2);
                }
            }
            if (layoutManager.canScrollVertically()) {
                if (layoutManager.getDecoratedTop(viewHolder2.itemView) <= recyclerView.getPaddingTop()) {
                    recyclerView.scrollToPosition(i2);
                }
                if (layoutManager.getDecoratedBottom(viewHolder2.itemView) >= recyclerView.getHeight() - recyclerView.getPaddingBottom()) {
                    recyclerView.scrollToPosition(i2);
                }
            }
        }

        public void onSelectedChanged(ViewHolder viewHolder, int i) {
            if (viewHolder != null) {
                sUICallback.onSelected(viewHolder.itemView);
            }
        }

        public abstract void onSwiped(ViewHolder viewHolder, int i);
    }

    private class ItemTouchHelperGestureListener extends SimpleOnGestureListener {
        private ItemTouchHelperGestureListener() {
        }

        public boolean onDown(MotionEvent motionEvent) {
            return true;
        }

        public void onLongPress(MotionEvent motionEvent) {
            View access$2400 = ItemTouchHelper.this.findChildView(motionEvent);
            if (access$2400 != null) {
                ViewHolder childViewHolder = ItemTouchHelper.this.mRecyclerView.getChildViewHolder(access$2400);
                if (childViewHolder != null && ItemTouchHelper.this.mCallback.hasDragFlag(ItemTouchHelper.this.mRecyclerView, childViewHolder) && MotionEventCompat.getPointerId(motionEvent, 0) == ItemTouchHelper.this.mActivePointerId) {
                    int findPointerIndex = MotionEventCompat.findPointerIndex(motionEvent, ItemTouchHelper.this.mActivePointerId);
                    float x = MotionEventCompat.getX(motionEvent, findPointerIndex);
                    float y = MotionEventCompat.getY(motionEvent, findPointerIndex);
                    ItemTouchHelper.this.mInitialTouchX = x;
                    ItemTouchHelper.this.mInitialTouchY = y;
                    ItemTouchHelper itemTouchHelper = ItemTouchHelper.this;
                    ItemTouchHelper.this.mDy = 0.0f;
                    itemTouchHelper.mDx = 0.0f;
                    if (ItemTouchHelper.this.mCallback.isLongPressDragEnabled()) {
                        ItemTouchHelper.this.select(childViewHolder, 2);
                    }
                }
            }
        }
    }

    private class RecoverAnimation implements AnimatorListenerCompat {
        final int mActionState;
        /* access modifiers changed from: private */
        public final int mAnimationType;
        /* access modifiers changed from: private */
        public boolean mEnded = false;
        private float mFraction;
        public boolean mIsPendingCleanup;
        boolean mOverridden = false;
        final float mStartDx;
        final float mStartDy;
        final float mTargetX;
        final float mTargetY;
        private final ValueAnimatorCompat mValueAnimator;
        final ViewHolder mViewHolder;
        float mX;
        float mY;

        public RecoverAnimation(ViewHolder viewHolder, int i, int i2, float f, float f2, float f3, float f4) {
            this.mActionState = i2;
            this.mAnimationType = i;
            this.mViewHolder = viewHolder;
            this.mStartDx = f;
            this.mStartDy = f2;
            this.mTargetX = f3;
            this.mTargetY = f4;
            this.mValueAnimator = AnimatorCompatHelper.emptyValueAnimator();
            this.mValueAnimator.addUpdateListener(new AnimatorUpdateListenerCompat(ItemTouchHelper.this) {
                public void onAnimationUpdate(ValueAnimatorCompat valueAnimatorCompat) {
                    RecoverAnimation.this.setFraction(valueAnimatorCompat.getAnimatedFraction());
                }
            });
            this.mValueAnimator.setTarget(viewHolder.itemView);
            this.mValueAnimator.addListener(this);
            setFraction(0.0f);
        }

        public void cancel() {
            this.mValueAnimator.cancel();
        }

        public void onAnimationCancel(ValueAnimatorCompat valueAnimatorCompat) {
            setFraction(1.0f);
        }

        public void onAnimationEnd(ValueAnimatorCompat valueAnimatorCompat) {
            this.mEnded = true;
        }

        public void onAnimationRepeat(ValueAnimatorCompat valueAnimatorCompat) {
        }

        public void onAnimationStart(ValueAnimatorCompat valueAnimatorCompat) {
        }

        public void setDuration(long j) {
            this.mValueAnimator.setDuration(j);
        }

        public void setFraction(float f) {
            this.mFraction = f;
        }

        public void start() {
            this.mViewHolder.setIsRecyclable(false);
            this.mValueAnimator.start();
        }

        public void update() {
            if (this.mStartDx == this.mTargetX) {
                this.mX = ViewCompat.getTranslationX(this.mViewHolder.itemView);
            } else {
                this.mX = this.mStartDx + (this.mFraction * (this.mTargetX - this.mStartDx));
            }
            if (this.mStartDy == this.mTargetY) {
                this.mY = ViewCompat.getTranslationY(this.mViewHolder.itemView);
            } else {
                this.mY = this.mStartDy + (this.mFraction * (this.mTargetY - this.mStartDy));
            }
        }
    }

    public static abstract class SimpleCallback extends Callback {
        private int mDefaultDragDirs;
        private int mDefaultSwipeDirs;

        public SimpleCallback(int i, int i2) {
            this.mDefaultSwipeDirs = i2;
            this.mDefaultDragDirs = i;
        }

        public int getDragDirs(RecyclerView recyclerView, ViewHolder viewHolder) {
            return this.mDefaultDragDirs;
        }

        public int getMovementFlags(RecyclerView recyclerView, ViewHolder viewHolder) {
            return makeMovementFlags(getDragDirs(recyclerView, viewHolder), getSwipeDirs(recyclerView, viewHolder));
        }

        public int getSwipeDirs(RecyclerView recyclerView, ViewHolder viewHolder) {
            return this.mDefaultSwipeDirs;
        }

        public void setDefaultDragDirs(int i) {
            this.mDefaultDragDirs = i;
        }

        public void setDefaultSwipeDirs(int i) {
            this.mDefaultSwipeDirs = i;
        }
    }

    public interface ViewDropHandler {
        void prepareForDrop(View view, View view2, int i, int i2);
    }

    public ItemTouchHelper(Callback callback) {
        this.mCallback = callback;
    }

    private void addChildDrawingOrderCallback() {
        if (VERSION.SDK_INT < 21) {
            if (this.mChildDrawingOrderCallback == null) {
                this.mChildDrawingOrderCallback = new ChildDrawingOrderCallback() {
                    public int onGetChildDrawingOrder(int i, int i2) {
                        if (ItemTouchHelper.this.mOverdrawChild == null) {
                            return i2;
                        }
                        int access$2300 = ItemTouchHelper.this.mOverdrawChildPosition;
                        if (access$2300 == -1) {
                            access$2300 = ItemTouchHelper.this.mRecyclerView.indexOfChild(ItemTouchHelper.this.mOverdrawChild);
                            ItemTouchHelper.this.mOverdrawChildPosition = access$2300;
                        }
                        if (i2 == i - 1) {
                            return access$2300;
                        }
                        return i2 < access$2300 ? i2 : i2 + 1;
                    }
                };
            }
            this.mRecyclerView.setChildDrawingOrderCallback(this.mChildDrawingOrderCallback);
        }
    }

    private int checkHorizontalSwipe(ViewHolder viewHolder, int i) {
        if ((i & 12) != 0) {
            int i2 = 4;
            int i3 = this.mDx > 0.0f ? 8 : 4;
            if (this.mVelocityTracker != null && this.mActivePointerId > -1) {
                float xVelocity = VelocityTrackerCompat.getXVelocity(this.mVelocityTracker, this.mActivePointerId);
                if (xVelocity > 0.0f) {
                    i2 = 8;
                }
                int i4 = i2;
                if ((i4 & i) != 0 && i3 == i4 && Math.abs(xVelocity) >= ((float) this.mRecyclerView.getMinFlingVelocity())) {
                    return i4;
                }
            }
            float width = ((float) this.mRecyclerView.getWidth()) * this.mCallback.getSwipeThreshold(viewHolder);
            if ((i & i3) != 0 && Math.abs(this.mDx) > width) {
                return i3;
            }
        }
        return 0;
    }

    /* access modifiers changed from: private */
    public boolean checkSelectForSwipe(int i, MotionEvent motionEvent, int i2) {
        MotionEvent motionEvent2 = motionEvent;
        if (this.mSelected != null) {
            int i3 = i;
        } else if (i != 2 || this.mActionState == 2 || !this.mCallback.isItemViewSwipeEnabled() || this.mRecyclerView.getScrollState() == 1) {
            return false;
        } else {
            ViewHolder findSwipedView = findSwipedView(motionEvent2);
            if (findSwipedView == null) {
                return false;
            }
            int absoluteMovementFlags = (65280 & this.mCallback.getAbsoluteMovementFlags(this.mRecyclerView, findSwipedView)) >> 8;
            if (absoluteMovementFlags == 0) {
                return false;
            }
            float x = MotionEventCompat.getX(motionEvent, i2);
            float f = x - this.mInitialTouchX;
            float y = MotionEventCompat.getY(motionEvent, i2) - this.mInitialTouchY;
            float abs = Math.abs(f);
            float abs2 = Math.abs(y);
            if (abs < ((float) this.mSlop) && abs2 < ((float) this.mSlop)) {
                return false;
            }
            if (abs > abs2) {
                if (f < 0.0f && (absoluteMovementFlags & 4) == 0) {
                    return false;
                }
                if (f > 0.0f && (absoluteMovementFlags & 8) == 0) {
                    return false;
                }
            } else if (y < 0.0f && (absoluteMovementFlags & 1) == 0) {
                return false;
            } else {
                if (y > 0.0f && (absoluteMovementFlags & 2) == 0) {
                    return false;
                }
            }
            this.mDy = 0.0f;
            this.mDx = 0.0f;
            this.mActivePointerId = MotionEventCompat.getPointerId(motionEvent2, 0);
            select(findSwipedView, 1);
            return true;
        }
        return false;
    }

    private int checkVerticalSwipe(ViewHolder viewHolder, int i) {
        if ((i & 3) != 0) {
            int i2 = 1;
            int i3 = this.mDy > 0.0f ? 2 : 1;
            if (this.mVelocityTracker != null && this.mActivePointerId > -1) {
                float yVelocity = VelocityTrackerCompat.getYVelocity(this.mVelocityTracker, this.mActivePointerId);
                if (yVelocity > 0.0f) {
                    i2 = 2;
                }
                int i4 = i2;
                if ((i4 & i) != 0 && i4 == i3 && Math.abs(yVelocity) >= ((float) this.mRecyclerView.getMinFlingVelocity())) {
                    return i4;
                }
            }
            float height = ((float) this.mRecyclerView.getHeight()) * this.mCallback.getSwipeThreshold(viewHolder);
            if ((i & i3) != 0 && Math.abs(this.mDy) > height) {
                return i3;
            }
        }
        return 0;
    }

    private void destroyCallbacks() {
        this.mRecyclerView.removeItemDecoration(this);
        this.mRecyclerView.removeOnItemTouchListener(this.mOnItemTouchListener);
        this.mRecyclerView.removeOnChildAttachStateChangeListener(this);
        for (int size = this.mRecoverAnimations.size() - 1; size >= 0; size--) {
            this.mCallback.clearView(this.mRecyclerView, ((RecoverAnimation) this.mRecoverAnimations.get(0)).mViewHolder);
        }
        this.mRecoverAnimations.clear();
        this.mOverdrawChild = null;
        this.mOverdrawChildPosition = -1;
        releaseVelocityTracker();
    }

    /* access modifiers changed from: private */
    public int endRecoverAnimation(ViewHolder viewHolder, boolean z) {
        for (int size = this.mRecoverAnimations.size() - 1; size >= 0; size--) {
            RecoverAnimation recoverAnimation = (RecoverAnimation) this.mRecoverAnimations.get(size);
            if (recoverAnimation.mViewHolder == viewHolder) {
                recoverAnimation.mOverridden |= z;
                if (!recoverAnimation.mEnded) {
                    recoverAnimation.cancel();
                }
                this.mRecoverAnimations.remove(size);
                recoverAnimation.mViewHolder.setIsRecyclable(true);
                return recoverAnimation.mAnimationType;
            }
        }
        return 0;
    }

    /* access modifiers changed from: private */
    public RecoverAnimation findAnimation(MotionEvent motionEvent) {
        if (this.mRecoverAnimations.isEmpty()) {
            return null;
        }
        View findChildView = findChildView(motionEvent);
        for (int size = this.mRecoverAnimations.size() - 1; size >= 0; size--) {
            RecoverAnimation recoverAnimation = (RecoverAnimation) this.mRecoverAnimations.get(size);
            if (recoverAnimation.mViewHolder.itemView == findChildView) {
                return recoverAnimation;
            }
        }
        return null;
    }

    /* access modifiers changed from: private */
    public View findChildView(MotionEvent motionEvent) {
        float x = motionEvent.getX();
        float y = motionEvent.getY();
        if (this.mSelected != null) {
            View view = this.mSelected.itemView;
            if (hitTest(view, x, y, this.mSelectedStartX + this.mDx, this.mSelectedStartY + this.mDy)) {
                return view;
            }
        }
        for (int size = this.mRecoverAnimations.size() - 1; size >= 0; size--) {
            RecoverAnimation recoverAnimation = (RecoverAnimation) this.mRecoverAnimations.get(size);
            View view2 = recoverAnimation.mViewHolder.itemView;
            if (hitTest(view2, x, y, recoverAnimation.mX, recoverAnimation.mY)) {
                return view2;
            }
        }
        return this.mRecyclerView.findChildViewUnder(x, y);
    }

    private List<ViewHolder> findSwapTargets(ViewHolder viewHolder) {
        int i;
        int i2;
        ViewHolder viewHolder2 = viewHolder;
        if (this.mSwapTargets == null) {
            this.mSwapTargets = new ArrayList();
            this.mDistances = new ArrayList();
        } else {
            this.mSwapTargets.clear();
            this.mDistances.clear();
        }
        int boundingBoxMargin = this.mCallback.getBoundingBoxMargin();
        int round = Math.round(this.mSelectedStartX + this.mDx) - boundingBoxMargin;
        int round2 = Math.round(this.mSelectedStartY + this.mDy) - boundingBoxMargin;
        int width = viewHolder2.itemView.getWidth() + round + (2 * boundingBoxMargin);
        int height = viewHolder2.itemView.getHeight() + round2 + (2 * boundingBoxMargin);
        int i3 = (round + width) / 2;
        int i4 = (round2 + height) / 2;
        LayoutManager layoutManager = this.mRecyclerView.getLayoutManager();
        int childCount = layoutManager.getChildCount();
        int i5 = 0;
        while (i5 < childCount) {
            View childAt = layoutManager.getChildAt(i5);
            if (childAt != viewHolder2.itemView) {
                if (childAt.getBottom() >= round2 && childAt.getTop() <= height && childAt.getRight() >= round) {
                    if (childAt.getLeft() <= width) {
                        ViewHolder childViewHolder = this.mRecyclerView.getChildViewHolder(childAt);
                        if (this.mCallback.canDropOver(this.mRecyclerView, this.mSelected, childViewHolder)) {
                            int abs = Math.abs(i3 - ((childAt.getLeft() + childAt.getRight()) / 2));
                            int abs2 = Math.abs(i4 - ((childAt.getTop() + childAt.getBottom()) / 2));
                            int i6 = (abs * abs) + (abs2 * abs2);
                            int i7 = abs;
                            int size = this.mSwapTargets.size();
                            i2 = boundingBoxMargin;
                            int i8 = 0;
                            int i9 = 0;
                            while (true) {
                                i = round;
                                int i10 = i9;
                                if (i10 >= size) {
                                    int i11 = size;
                                    break;
                                }
                                int i12 = size;
                                if (i6 <= ((Integer) this.mDistances.get(i10)).intValue()) {
                                    break;
                                }
                                i8++;
                                i9 = i10 + 1;
                                round = i;
                                size = i12;
                            }
                            this.mSwapTargets.add(i8, childViewHolder);
                            this.mDistances.add(i8, Integer.valueOf(i6));
                            i5++;
                            boundingBoxMargin = i2;
                            round = i;
                            viewHolder2 = viewHolder;
                        }
                    }
                }
                i2 = boundingBoxMargin;
                i = round;
                i5++;
                boundingBoxMargin = i2;
                round = i;
                viewHolder2 = viewHolder;
            }
            i2 = boundingBoxMargin;
            i = round;
            i5++;
            boundingBoxMargin = i2;
            round = i;
            viewHolder2 = viewHolder;
        }
        int i13 = boundingBoxMargin;
        int i14 = round;
        return this.mSwapTargets;
    }

    private ViewHolder findSwipedView(MotionEvent motionEvent) {
        LayoutManager layoutManager = this.mRecyclerView.getLayoutManager();
        if (this.mActivePointerId == -1) {
            return null;
        }
        int findPointerIndex = MotionEventCompat.findPointerIndex(motionEvent, this.mActivePointerId);
        float y = MotionEventCompat.getY(motionEvent, findPointerIndex) - this.mInitialTouchY;
        float abs = Math.abs(MotionEventCompat.getX(motionEvent, findPointerIndex) - this.mInitialTouchX);
        float abs2 = Math.abs(y);
        if (abs < ((float) this.mSlop) && abs2 < ((float) this.mSlop)) {
            return null;
        }
        if (abs > abs2 && layoutManager.canScrollHorizontally()) {
            return null;
        }
        if (abs2 > abs && layoutManager.canScrollVertically()) {
            return null;
        }
        View findChildView = findChildView(motionEvent);
        if (findChildView == null) {
            return null;
        }
        return this.mRecyclerView.getChildViewHolder(findChildView);
    }

    private void getSelectedDxDy(float[] fArr) {
        if ((this.mSelectedFlags & 12) != 0) {
            fArr[0] = (this.mSelectedStartX + this.mDx) - ((float) this.mSelected.itemView.getLeft());
        } else {
            fArr[0] = ViewCompat.getTranslationX(this.mSelected.itemView);
        }
        if ((this.mSelectedFlags & 3) != 0) {
            fArr[1] = (this.mSelectedStartY + this.mDy) - ((float) this.mSelected.itemView.getTop());
        } else {
            fArr[1] = ViewCompat.getTranslationY(this.mSelected.itemView);
        }
    }

    /* access modifiers changed from: private */
    public boolean hasRunningRecoverAnim() {
        int size = this.mRecoverAnimations.size();
        for (int i = 0; i < size; i++) {
            if (!((RecoverAnimation) this.mRecoverAnimations.get(i)).mEnded) {
                return true;
            }
        }
        return false;
    }

    private static boolean hitTest(View view, float f, float f2, float f3, float f4) {
        return f >= f3 && f <= ((float) view.getWidth()) + f3 && f2 >= f4 && f2 <= ((float) view.getHeight()) + f4;
    }

    private void initGestureDetector() {
        if (this.mGestureDetector == null) {
            this.mGestureDetector = new GestureDetectorCompat(this.mRecyclerView.getContext(), new ItemTouchHelperGestureListener());
        }
    }

    /* access modifiers changed from: private */
    public void moveIfNecessary(ViewHolder viewHolder) {
        ViewHolder viewHolder2 = viewHolder;
        if (!this.mRecyclerView.isLayoutRequested() && this.mActionState == 2) {
            float moveThreshold = this.mCallback.getMoveThreshold(viewHolder2);
            int i = (int) (this.mSelectedStartX + this.mDx);
            int i2 = (int) (this.mSelectedStartY + this.mDy);
            if (((float) Math.abs(i2 - viewHolder2.itemView.getTop())) >= ((float) viewHolder2.itemView.getHeight()) * moveThreshold || ((float) Math.abs(i - viewHolder2.itemView.getLeft())) >= ((float) viewHolder2.itemView.getWidth()) * moveThreshold) {
                List findSwapTargets = findSwapTargets(viewHolder);
                if (findSwapTargets.size() != 0) {
                    ViewHolder chooseDropTarget = this.mCallback.chooseDropTarget(viewHolder2, findSwapTargets, i, i2);
                    if (chooseDropTarget == null) {
                        this.mSwapTargets.clear();
                        this.mDistances.clear();
                        return;
                    }
                    int adapterPosition = chooseDropTarget.getAdapterPosition();
                    int adapterPosition2 = viewHolder.getAdapterPosition();
                    if (this.mCallback.onMove(this.mRecyclerView, viewHolder2, chooseDropTarget)) {
                        this.mCallback.onMoved(this.mRecyclerView, viewHolder2, adapterPosition2, chooseDropTarget, adapterPosition, i, i2);
                    }
                }
            }
        }
    }

    /* access modifiers changed from: private */
    public void obtainVelocityTracker() {
        if (this.mVelocityTracker != null) {
            this.mVelocityTracker.recycle();
        }
        this.mVelocityTracker = VelocityTracker.obtain();
    }

    /* access modifiers changed from: private */
    public void postDispatchSwipe(final RecoverAnimation recoverAnimation, final int i) {
        this.mRecyclerView.post(new Runnable() {
            public void run() {
                if (ItemTouchHelper.this.mRecyclerView != null && ItemTouchHelper.this.mRecyclerView.isAttachedToWindow() && !recoverAnimation.mOverridden && recoverAnimation.mViewHolder.getAdapterPosition() != -1) {
                    ItemAnimator itemAnimator = ItemTouchHelper.this.mRecyclerView.getItemAnimator();
                    if ((itemAnimator == null || !itemAnimator.isRunning(null)) && !ItemTouchHelper.this.hasRunningRecoverAnim()) {
                        ItemTouchHelper.this.mCallback.onSwiped(recoverAnimation.mViewHolder, i);
                    } else {
                        ItemTouchHelper.this.mRecyclerView.post(this);
                    }
                }
            }
        });
    }

    private void releaseVelocityTracker() {
        if (this.mVelocityTracker != null) {
            this.mVelocityTracker.recycle();
            this.mVelocityTracker = null;
        }
    }

    /* access modifiers changed from: private */
    public void removeChildDrawingOrderCallbackIfNecessary(View view) {
        if (view == this.mOverdrawChild) {
            this.mOverdrawChild = null;
            if (this.mChildDrawingOrderCallback != null) {
                this.mRecyclerView.setChildDrawingOrderCallback(null);
            }
        }
    }

    /* access modifiers changed from: private */
    public boolean scrollIfNecessary() {
        if (this.mSelected == null) {
            this.mDragScrollStartTimeInMs = Long.MIN_VALUE;
            return false;
        }
        long currentTimeMillis = System.currentTimeMillis();
        long j = this.mDragScrollStartTimeInMs == Long.MIN_VALUE ? 0 : currentTimeMillis - this.mDragScrollStartTimeInMs;
        LayoutManager layoutManager = this.mRecyclerView.getLayoutManager();
        if (this.mTmpRect == null) {
            this.mTmpRect = new Rect();
        }
        int i = 0;
        int i2 = 0;
        layoutManager.calculateItemDecorationsForChild(this.mSelected.itemView, this.mTmpRect);
        if (layoutManager.canScrollHorizontally()) {
            int i3 = (int) (this.mSelectedStartX + this.mDx);
            int paddingLeft = (i3 - this.mTmpRect.left) - this.mRecyclerView.getPaddingLeft();
            if (this.mDx < 0.0f && paddingLeft < 0) {
                i = paddingLeft;
            } else if (this.mDx > 0.0f) {
                int width = ((this.mSelected.itemView.getWidth() + i3) + this.mTmpRect.right) - (this.mRecyclerView.getWidth() - this.mRecyclerView.getPaddingRight());
                if (width > 0) {
                    i = width;
                }
            }
        }
        if (layoutManager.canScrollVertically()) {
            int i4 = (int) (this.mSelectedStartY + this.mDy);
            int paddingTop = (i4 - this.mTmpRect.top) - this.mRecyclerView.getPaddingTop();
            if (this.mDy < 0.0f && paddingTop < 0) {
                i2 = paddingTop;
            } else if (this.mDy > 0.0f) {
                int height = ((this.mSelected.itemView.getHeight() + i4) + this.mTmpRect.bottom) - (this.mRecyclerView.getHeight() - this.mRecyclerView.getPaddingBottom());
                if (height > 0) {
                    i2 = height;
                }
            }
        }
        if (i != 0) {
            i = this.mCallback.interpolateOutOfBoundsScroll(this.mRecyclerView, this.mSelected.itemView.getWidth(), i, this.mRecyclerView.getWidth(), j);
        }
        if (i2 != 0) {
            i2 = this.mCallback.interpolateOutOfBoundsScroll(this.mRecyclerView, this.mSelected.itemView.getHeight(), i2, this.mRecyclerView.getHeight(), j);
        }
        if (i == 0 && i2 == 0) {
            this.mDragScrollStartTimeInMs = Long.MIN_VALUE;
            return false;
        }
        if (this.mDragScrollStartTimeInMs == Long.MIN_VALUE) {
            this.mDragScrollStartTimeInMs = currentTimeMillis;
        }
        this.mRecyclerView.scrollBy(i, i2);
        return true;
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x0137  */
    /* JADX WARNING: Removed duplicated region for block: B:47:0x0142  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void select(ViewHolder viewHolder, int i) {
        int i2;
        boolean z;
        ViewParent parent;
        float f;
        float f2;
        float f3;
        float signum;
        ViewHolder viewHolder2 = viewHolder;
        int i3 = i;
        if (viewHolder2 != this.mSelected || i3 != this.mActionState) {
            this.mDragScrollStartTimeInMs = Long.MIN_VALUE;
            int i4 = this.mActionState;
            endRecoverAnimation(viewHolder2, true);
            this.mActionState = i3;
            if (i3 == 2) {
                this.mOverdrawChild = viewHolder2.itemView;
                addChildDrawingOrderCallback();
            }
            int i5 = (1 << ((8 * i3) + 8)) - 1;
            boolean z2 = false;
            if (this.mSelected != null) {
                ViewHolder viewHolder3 = this.mSelected;
                if (viewHolder3.itemView.getParent() != null) {
                    int swipeIfNecessary = i4 == 2 ? 0 : swipeIfNecessary(viewHolder3);
                    releaseVelocityTracker();
                    int i6 = 4;
                    if (swipeIfNecessary == 4 || swipeIfNecessary == 8 || swipeIfNecessary == 16 || swipeIfNecessary == 32) {
                        f = 0.0f;
                        f2 = Math.signum(this.mDx) * ((float) this.mRecyclerView.getWidth());
                    } else {
                        switch (swipeIfNecessary) {
                            case 1:
                            case 2:
                                f3 = 0.0f;
                                signum = Math.signum(this.mDy) * ((float) this.mRecyclerView.getHeight());
                                break;
                            default:
                                f3 = 0.0f;
                                signum = 0.0f;
                                break;
                        }
                        f2 = f3;
                        f = signum;
                    }
                    if (i4 == 2) {
                        i6 = 8;
                    } else if (swipeIfNecessary > 0) {
                        i6 = 2;
                    }
                    int i7 = i6;
                    getSelectedDxDy(this.mTmpPosition);
                    float f4 = this.mTmpPosition[0];
                    float f5 = this.mTmpPosition[1];
                    int i8 = i7;
                    ViewHolder viewHolder4 = viewHolder3;
                    int i9 = i4;
                    final int i10 = swipeIfNecessary;
                    i2 = 2;
                    final ViewHolder viewHolder5 = viewHolder4;
                    AnonymousClass3 r0 = new RecoverAnimation(viewHolder3, i7, i4, f4, f5, f2, f) {
                        public void onAnimationEnd(ValueAnimatorCompat valueAnimatorCompat) {
                            super.onAnimationEnd(valueAnimatorCompat);
                            if (!this.mOverridden) {
                                if (i10 <= 0) {
                                    ItemTouchHelper.this.mCallback.clearView(ItemTouchHelper.this.mRecyclerView, viewHolder5);
                                } else {
                                    ItemTouchHelper.this.mPendingCleanup.add(viewHolder5.itemView);
                                    this.mIsPendingCleanup = true;
                                    if (i10 > 0) {
                                        ItemTouchHelper.this.postDispatchSwipe(this, i10);
                                    }
                                }
                                if (ItemTouchHelper.this.mOverdrawChild == viewHolder5.itemView) {
                                    ItemTouchHelper.this.removeChildDrawingOrderCallbackIfNecessary(viewHolder5.itemView);
                                }
                            }
                        }
                    };
                    r0.setDuration(this.mCallback.getAnimationDuration(this.mRecyclerView, i8, f2 - f4, f - f5));
                    this.mRecoverAnimations.add(r0);
                    r0.start();
                    z2 = true;
                    ViewHolder viewHolder6 = viewHolder4;
                } else {
                    int i11 = i4;
                    i2 = 2;
                    ViewHolder viewHolder7 = viewHolder3;
                    removeChildDrawingOrderCallbackIfNecessary(viewHolder7.itemView);
                    this.mCallback.clearView(this.mRecyclerView, viewHolder7);
                }
                this.mSelected = null;
            } else {
                int i12 = i4;
                i2 = 2;
            }
            if (viewHolder2 != null) {
                this.mSelectedFlags = (this.mCallback.getAbsoluteMovementFlags(this.mRecyclerView, viewHolder2) & i5) >> (this.mActionState * 8);
                this.mSelectedStartX = (float) viewHolder2.itemView.getLeft();
                this.mSelectedStartY = (float) viewHolder2.itemView.getTop();
                this.mSelected = viewHolder2;
                if (i3 == i2) {
                    z = false;
                    this.mSelected.itemView.performHapticFeedback(0);
                    parent = this.mRecyclerView.getParent();
                    if (parent != null) {
                        if (this.mSelected != null) {
                            z = true;
                        }
                        parent.requestDisallowInterceptTouchEvent(z);
                    }
                    if (!z2) {
                        this.mRecyclerView.getLayoutManager().requestSimpleAnimationsInNextLayout();
                    }
                    this.mCallback.onSelectedChanged(this.mSelected, this.mActionState);
                    this.mRecyclerView.invalidate();
                }
            }
            z = false;
            parent = this.mRecyclerView.getParent();
            if (parent != null) {
            }
            if (!z2) {
            }
            this.mCallback.onSelectedChanged(this.mSelected, this.mActionState);
            this.mRecyclerView.invalidate();
        }
    }

    private void setupCallbacks() {
        this.mSlop = ViewConfiguration.get(this.mRecyclerView.getContext()).getScaledTouchSlop();
        this.mRecyclerView.addItemDecoration(this);
        this.mRecyclerView.addOnItemTouchListener(this.mOnItemTouchListener);
        this.mRecyclerView.addOnChildAttachStateChangeListener(this);
        initGestureDetector();
    }

    private int swipeIfNecessary(ViewHolder viewHolder) {
        if (this.mActionState == 2) {
            return 0;
        }
        int movementFlags = this.mCallback.getMovementFlags(this.mRecyclerView, viewHolder);
        int convertToAbsoluteDirection = (this.mCallback.convertToAbsoluteDirection(movementFlags, ViewCompat.getLayoutDirection(this.mRecyclerView)) & 65280) >> 8;
        if (convertToAbsoluteDirection == 0) {
            return 0;
        }
        int i = (65280 & movementFlags) >> 8;
        if (Math.abs(this.mDx) > Math.abs(this.mDy)) {
            int checkHorizontalSwipe = checkHorizontalSwipe(viewHolder, convertToAbsoluteDirection);
            int i2 = checkHorizontalSwipe;
            if (checkHorizontalSwipe > 0) {
                return (i & i2) == 0 ? Callback.convertToRelativeDirection(i2, ViewCompat.getLayoutDirection(this.mRecyclerView)) : i2;
            }
            int checkVerticalSwipe = checkVerticalSwipe(viewHolder, convertToAbsoluteDirection);
            int i3 = checkVerticalSwipe;
            if (checkVerticalSwipe > 0) {
                return i3;
            }
        } else {
            int checkVerticalSwipe2 = checkVerticalSwipe(viewHolder, convertToAbsoluteDirection);
            int i4 = checkVerticalSwipe2;
            if (checkVerticalSwipe2 > 0) {
                return i4;
            }
            int checkHorizontalSwipe2 = checkHorizontalSwipe(viewHolder, convertToAbsoluteDirection);
            int i5 = checkHorizontalSwipe2;
            if (checkHorizontalSwipe2 > 0) {
                return (i & i5) == 0 ? Callback.convertToRelativeDirection(i5, ViewCompat.getLayoutDirection(this.mRecyclerView)) : i5;
            }
        }
        return 0;
    }

    /* access modifiers changed from: private */
    public void updateDxDy(MotionEvent motionEvent, int i, int i2) {
        float x = MotionEventCompat.getX(motionEvent, i2);
        float y = MotionEventCompat.getY(motionEvent, i2);
        this.mDx = x - this.mInitialTouchX;
        this.mDy = y - this.mInitialTouchY;
        if ((i & 4) == 0) {
            this.mDx = Math.max(0.0f, this.mDx);
        }
        if ((i & 8) == 0) {
            this.mDx = Math.min(0.0f, this.mDx);
        }
        if ((i & 1) == 0) {
            this.mDy = Math.max(0.0f, this.mDy);
        }
        if ((i & 2) == 0) {
            this.mDy = Math.min(0.0f, this.mDy);
        }
    }

    public void attachToRecyclerView(RecyclerView recyclerView) {
        if (this.mRecyclerView != recyclerView) {
            if (this.mRecyclerView != null) {
                destroyCallbacks();
            }
            this.mRecyclerView = recyclerView;
            if (this.mRecyclerView != null) {
                setupCallbacks();
            }
        }
    }

    public void getItemOffsets(Rect rect, View view, RecyclerView recyclerView, State state) {
        rect.setEmpty();
    }

    public void onChildViewAttachedToWindow(View view) {
    }

    public void onChildViewDetachedFromWindow(View view) {
        removeChildDrawingOrderCallbackIfNecessary(view);
        ViewHolder childViewHolder = this.mRecyclerView.getChildViewHolder(view);
        if (childViewHolder != null) {
            if (this.mSelected == null || childViewHolder != this.mSelected) {
                endRecoverAnimation(childViewHolder, false);
                if (this.mPendingCleanup.remove(childViewHolder.itemView)) {
                    this.mCallback.clearView(this.mRecyclerView, childViewHolder);
                }
            } else {
                select(null, 0);
            }
        }
    }

    public void onDraw(Canvas canvas, RecyclerView recyclerView, State state) {
        this.mOverdrawChildPosition = -1;
        float f = 0.0f;
        float f2 = 0.0f;
        if (this.mSelected != null) {
            getSelectedDxDy(this.mTmpPosition);
            f = this.mTmpPosition[0];
            f2 = this.mTmpPosition[1];
        }
        this.mCallback.onDraw(canvas, recyclerView, this.mSelected, this.mRecoverAnimations, this.mActionState, f, f2);
    }

    public void onDrawOver(Canvas canvas, RecyclerView recyclerView, State state) {
        float f = 0.0f;
        float f2 = 0.0f;
        if (this.mSelected != null) {
            getSelectedDxDy(this.mTmpPosition);
            f = this.mTmpPosition[0];
            f2 = this.mTmpPosition[1];
        }
        this.mCallback.onDrawOver(canvas, recyclerView, this.mSelected, this.mRecoverAnimations, this.mActionState, f, f2);
    }

    public void startDrag(ViewHolder viewHolder) {
        if (!this.mCallback.hasDragFlag(this.mRecyclerView, viewHolder)) {
            Log.e(TAG, "Start drag has been called but swiping is not enabled");
        } else if (viewHolder.itemView.getParent() != this.mRecyclerView) {
            Log.e(TAG, "Start drag has been called with a view holder which is not a child of the RecyclerView which is controlled by this ItemTouchHelper.");
        } else {
            obtainVelocityTracker();
            this.mDy = 0.0f;
            this.mDx = 0.0f;
            select(viewHolder, 2);
        }
    }

    public void startSwipe(ViewHolder viewHolder) {
        if (!this.mCallback.hasSwipeFlag(this.mRecyclerView, viewHolder)) {
            Log.e(TAG, "Start swipe has been called but dragging is not enabled");
        } else if (viewHolder.itemView.getParent() != this.mRecyclerView) {
            Log.e(TAG, "Start swipe has been called with a view holder which is not a child of the RecyclerView controlled by this ItemTouchHelper.");
        } else {
            obtainVelocityTracker();
            this.mDy = 0.0f;
            this.mDx = 0.0f;
            select(viewHolder, 1);
        }
    }
}
