.class public Landroid/support/v7/widget/RecyclerView;
.super Landroid/view/ViewGroup;
.source "RecyclerView.java"

# interfaces
.implements Landroid/support/v4/view/ScrollingView;
.implements Landroid/support/v4/view/NestedScrollingChild;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/RecyclerView$ChildDrawingOrderCallback;,
        Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;,
        Landroid/support/v7/widget/RecyclerView$ItemAnimator;,
        Landroid/support/v7/widget/RecyclerView$ItemAnimatorRestoreListener;,
        Landroid/support/v7/widget/RecyclerView$State;,
        Landroid/support/v7/widget/RecyclerView$SavedState;,
        Landroid/support/v7/widget/RecyclerView$AdapterDataObservable;,
        Landroid/support/v7/widget/RecyclerView$SmoothScroller;,
        Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;,
        Landroid/support/v7/widget/RecyclerView$LayoutParams;,
        Landroid/support/v7/widget/RecyclerView$ViewHolder;,
        Landroid/support/v7/widget/RecyclerView$OnChildAttachStateChangeListener;,
        Landroid/support/v7/widget/RecyclerView$RecyclerListener;,
        Landroid/support/v7/widget/RecyclerView$OnScrollListener;,
        Landroid/support/v7/widget/RecyclerView$SimpleOnItemTouchListener;,
        Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;,
        Landroid/support/v7/widget/RecyclerView$ItemDecoration;,
        Landroid/support/v7/widget/RecyclerView$LayoutManager;,
        Landroid/support/v7/widget/RecyclerView$Adapter;,
        Landroid/support/v7/widget/RecyclerView$ViewCacheExtension;,
        Landroid/support/v7/widget/RecyclerView$Recycler;,
        Landroid/support/v7/widget/RecyclerView$RecycledViewPool;,
        Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;,
        Landroid/support/v7/widget/RecyclerView$ViewFlinger;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final DISPATCH_TEMP_DETACH:Z = false

.field private static final FORCE_INVALIDATE_DISPLAY_LIST:Z

.field public static final HORIZONTAL:I = 0x0

.field private static final INVALID_POINTER:I = -0x1

.field public static final INVALID_TYPE:I = -0x1

.field private static final LAYOUT_MANAGER_CONSTRUCTOR_SIGNATURE:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private static final MAX_SCROLL_DURATION:I = 0x7d0

.field public static final NO_ID:J = -0x1L

.field public static final NO_POSITION:I = -0x1

.field public static final SCROLL_STATE_DRAGGING:I = 0x1

.field public static final SCROLL_STATE_IDLE:I = 0x0

.field public static final SCROLL_STATE_SETTLING:I = 0x2

.field private static final TAG:Ljava/lang/String; = "RecyclerView"

.field public static final TOUCH_SLOP_DEFAULT:I = 0x0

.field public static final TOUCH_SLOP_PAGING:I = 0x1

.field private static final TRACE_BIND_VIEW_TAG:Ljava/lang/String; = "RV OnBindView"

.field private static final TRACE_CREATE_VIEW_TAG:Ljava/lang/String; = "RV CreateView"

.field private static final TRACE_HANDLE_ADAPTER_UPDATES_TAG:Ljava/lang/String; = "RV PartialInvalidate"

.field private static final TRACE_ON_DATA_SET_CHANGE_LAYOUT_TAG:Ljava/lang/String; = "RV FullInvalidate"

.field private static final TRACE_ON_LAYOUT_TAG:Ljava/lang/String; = "RV OnLayout"

.field private static final TRACE_SCROLL_TAG:Ljava/lang/String; = "RV Scroll"

.field public static final VERTICAL:I = 0x1

.field private static final sQuinticInterpolator:Landroid/view/animation/Interpolator;


# instance fields
.field private mAccessibilityDelegate:Landroid/support/v7/widget/RecyclerViewAccessibilityDelegate;

.field private final mAccessibilityManager:Landroid/view/accessibility/AccessibilityManager;

.field private mActiveOnItemTouchListener:Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;

.field private mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

.field mAdapterHelper:Landroid/support/v7/widget/AdapterHelper;

.field private mAdapterUpdateDuringMeasure:Z

.field private mBottomGlow:Landroid/support/v4/widget/EdgeEffectCompat;

.field private mChildDrawingOrderCallback:Landroid/support/v7/widget/RecyclerView$ChildDrawingOrderCallback;

.field mChildHelper:Landroid/support/v7/widget/ChildHelper;

.field private mClipToPadding:Z

.field private mDataSetHasChangedAfterLayout:Z

.field private mEatRequestLayout:Z

.field private mEatenAccessibilityChangeFlags:I

.field private mFirstLayoutComplete:Z

.field private mHasFixedSize:Z

.field private mIgnoreMotionEventTillDown:Z

.field private mInitialTouchX:I

.field private mInitialTouchY:I

.field private mIsAttached:Z

.field mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

.field private mItemAnimatorListener:Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

.field private mItemAnimatorRunner:Ljava/lang/Runnable;

.field private final mItemDecorations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/support/v7/widget/RecyclerView$ItemDecoration;",
            ">;"
        }
    .end annotation
.end field

.field mItemsAddedOrRemoved:Z

.field mItemsChanged:Z

.field private mLastTouchX:I

.field private mLastTouchY:I

.field private mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

.field private mLayoutFrozen:Z

.field private mLayoutOrScrollCounter:I

.field private mLayoutRequestEaten:Z

.field private mLeftGlow:Landroid/support/v4/widget/EdgeEffectCompat;

.field private final mMaxFlingVelocity:I

.field private final mMinFlingVelocity:I

.field private final mMinMaxLayoutPositions:[I

.field private final mNestedOffsets:[I

.field private final mObserver:Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;

.field private mOnChildAttachStateListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/support/v7/widget/RecyclerView$OnChildAttachStateChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field private final mOnItemTouchListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;",
            ">;"
        }
    .end annotation
.end field

.field private mPendingSavedState:Landroid/support/v7/widget/RecyclerView$SavedState;

.field private final mPostUpdatesOnAnimation:Z

.field private mPostedAnimatorRunner:Z

.field final mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

.field private mRecyclerListener:Landroid/support/v7/widget/RecyclerView$RecyclerListener;

.field private mRightGlow:Landroid/support/v4/widget/EdgeEffectCompat;

.field private final mScrollConsumed:[I

.field private mScrollFactor:F

.field private mScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

.field private mScrollListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/support/v7/widget/RecyclerView$OnScrollListener;",
            ">;"
        }
    .end annotation
.end field

.field private final mScrollOffset:[I

.field private mScrollPointerId:I

.field private mScrollState:I

.field private final mScrollingChildHelper:Landroid/support/v4/view/NestedScrollingChildHelper;

.field final mState:Landroid/support/v7/widget/RecyclerView$State;

.field private final mTempRect:Landroid/graphics/Rect;

.field private mTopGlow:Landroid/support/v4/widget/EdgeEffectCompat;

.field private mTouchSlop:I

.field private final mUpdateChildViewsRunnable:Ljava/lang/Runnable;

.field private mVelocityTracker:Landroid/view/VelocityTracker;

.field private final mViewFlinger:Landroid/support/v7/widget/RecyclerView$ViewFlinger;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/16 v3, 0x12

    if-eq v0, v3, :cond_17

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-eq v0, v3, :cond_17

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x14

    if-ne v0, v3, :cond_15

    goto :goto_17

    :cond_15
    move v0, v2

    goto :goto_18

    :cond_17
    :goto_17
    move v0, v1

    :goto_18
    sput-boolean v0, Landroid/support/v7/widget/RecyclerView;->FORCE_INVALIDATE_DISPLAY_LIST:Z

    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Class;

    const-class v3, Landroid/content/Context;

    aput-object v3, v0, v2

    const-class v2, Landroid/util/AttributeSet;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v2, v0, v1

    sput-object v0, Landroid/support/v7/widget/RecyclerView;->LAYOUT_MANAGER_CONSTRUCTOR_SIGNATURE:[Ljava/lang/Class;

    new-instance v0, Landroid/support/v7/widget/RecyclerView$3;

    invoke-direct {v0}, Landroid/support/v7/widget/RecyclerView$3;-><init>()V

    sput-object v0, Landroid/support/v7/widget/RecyclerView;->sQuinticInterpolator:Landroid/view/animation/Interpolator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 16
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v0, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;-><init>(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$1;)V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mObserver:Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;

    new-instance v0, Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/RecyclerView$Recycler;-><init>(Landroid/support/v7/widget/RecyclerView;)V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    new-instance v0, Landroid/support/v7/widget/RecyclerView$1;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/RecyclerView$1;-><init>(Landroid/support/v7/widget/RecyclerView;)V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mUpdateChildViewsRunnable:Ljava/lang/Runnable;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mTempRect:Landroid/graphics/Rect;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemDecorations:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mOnItemTouchListeners:Ljava/util/ArrayList;

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mDataSetHasChangedAfterLayout:Z

    iput v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutOrScrollCounter:I

    new-instance v2, Landroid/support/v7/widget/DefaultItemAnimator;

    invoke-direct {v2}, Landroid/support/v7/widget/DefaultItemAnimator;-><init>()V

    iput-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    iput v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollState:I

    const/4 v2, -0x1

    iput v2, p0, Landroid/support/v7/widget/RecyclerView;->mScrollPointerId:I

    const/4 v2, 0x1

    iput v2, p0, Landroid/support/v7/widget/RecyclerView;->mScrollFactor:F

    new-instance v2, Landroid/support/v7/widget/RecyclerView$ViewFlinger;

    invoke-direct {v2, p0}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;-><init>(Landroid/support/v7/widget/RecyclerView;)V

    iput-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mViewFlinger:Landroid/support/v7/widget/RecyclerView$ViewFlinger;

    new-instance v2, Landroid/support/v7/widget/RecyclerView$State;

    invoke-direct {v2}, Landroid/support/v7/widget/RecyclerView$State;-><init>()V

    iput-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemsAddedOrRemoved:Z

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemsChanged:Z

    new-instance v2, Landroid/support/v7/widget/RecyclerView$ItemAnimatorRestoreListener;

    invoke-direct {v2, p0, v1}, Landroid/support/v7/widget/RecyclerView$ItemAnimatorRestoreListener;-><init>(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$1;)V

    iput-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimatorListener:Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mPostedAnimatorRunner:Z

    const/4 v1, 0x2

    new-array v2, v1, [I

    iput-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mMinMaxLayoutPositions:[I

    new-array v2, v1, [I

    iput-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mScrollOffset:[I

    new-array v2, v1, [I

    iput-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mScrollConsumed:[I

    new-array v2, v1, [I

    iput-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mNestedOffsets:[I

    new-instance v2, Landroid/support/v7/widget/RecyclerView$2;

    invoke-direct {v2, p0}, Landroid/support/v7/widget/RecyclerView$2;-><init>(Landroid/support/v7/widget/RecyclerView;)V

    iput-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimatorRunner:Ljava/lang/Runnable;

    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Landroid/support/v7/widget/RecyclerView;->setScrollContainer(Z)V

    invoke-virtual {p0, v2}, Landroid/support/v7/widget/RecyclerView;->setFocusableInTouchMode(Z)V

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x10

    if-lt v3, v4, :cond_84

    move v4, v2

    goto :goto_85

    :cond_84
    move v4, v0

    :goto_85
    iput-boolean v4, p0, Landroid/support/v7/widget/RecyclerView;->mPostUpdatesOnAnimation:Z

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v5

    iput v5, p0, Landroid/support/v7/widget/RecyclerView;->mTouchSlop:I

    invoke-virtual {v4}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v5

    iput v5, p0, Landroid/support/v7/widget/RecyclerView;->mMinFlingVelocity:I

    invoke-virtual {v4}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v5

    iput v5, p0, Landroid/support/v7/widget/RecyclerView;->mMaxFlingVelocity:I

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getOverScrollMode(Landroid/view/View;)I

    move-result v5

    if-ne v5, v1, :cond_a5

    move v0, v2

    nop

    :cond_a5
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/RecyclerView;->setWillNotDraw(Z)V

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimatorListener:Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setListener(Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;)V

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->initAdapterManager()V

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView;->initChildrenHelper()V

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getImportantForAccessibility(Landroid/view/View;)I

    move-result v0

    if-nez v0, :cond_be

    invoke-static {p0, v2}, Landroid/support/v4/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    :cond_be
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "accessibility"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/accessibility/AccessibilityManager;

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAccessibilityManager:Landroid/view/accessibility/AccessibilityManager;

    new-instance v0, Landroid/support/v7/widget/RecyclerViewAccessibilityDelegate;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/RecyclerViewAccessibilityDelegate;-><init>(Landroid/support/v7/widget/RecyclerView;)V

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/RecyclerView;->setAccessibilityDelegateCompat(Landroid/support/v7/widget/RecyclerViewAccessibilityDelegate;)V

    if-eqz p2, :cond_ef

    const/4 v0, 0x0

    sget-object v1, Landroid/support/v7/recyclerview/R$styleable;->RecyclerView:[I

    invoke-virtual {p1, p2, v1, p3, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    sget v5, Landroid/support/v7/recyclerview/R$styleable;->RecyclerView_layoutManager:I

    invoke-virtual {v1, v5}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    move-object v5, p0

    move-object v6, p1

    move-object v7, v11

    move-object v8, p2

    move v9, p3

    move v10, v0

    invoke-direct/range {v5 .. v10}, Landroid/support/v7/widget/RecyclerView;->createLayoutManager(Landroid/content/Context;Ljava/lang/String;Landroid/util/AttributeSet;II)V

    :cond_ef
    new-instance v0, Landroid/support/v4/view/NestedScrollingChildHelper;

    invoke-direct {v0, p0}, Landroid/support/v4/view/NestedScrollingChildHelper;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollingChildHelper:Landroid/support/v4/view/NestedScrollingChildHelper;

    invoke-virtual {p0, v2}, Landroid/support/v7/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    return-void
.end method

.method static synthetic access$100(Landroid/support/v7/widget/RecyclerView;)Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mFirstLayoutComplete:Z

    return v0
.end method

.method static synthetic access$1300(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$LayoutManager;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    return-object v0
.end method

.method static synthetic access$200(Landroid/support/v7/widget/RecyclerView;)Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mDataSetHasChangedAfterLayout:Z

    return v0
.end method

.method static synthetic access$2200()Landroid/view/animation/Interpolator;
    .registers 1

    sget-object v0, Landroid/support/v7/widget/RecyclerView;->sQuinticInterpolator:Landroid/view/animation/Interpolator;

    return-object v0
.end method

.method static synthetic access$2300(Landroid/support/v7/widget/RecyclerView;)V
    .registers 1

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView;->consumePendingUpdateOperations()V

    return-void
.end method

.method static synthetic access$2400(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    return-object v0
.end method

.method static synthetic access$2500(Landroid/support/v7/widget/RecyclerView;)V
    .registers 1

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView;->onEnterLayoutOrScroll()V

    return-void
.end method

.method static synthetic access$2600(Landroid/support/v7/widget/RecyclerView;)Z
    .registers 2

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView;->supportsChangeAnimations()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2700(Landroid/support/v7/widget/RecyclerView;)V
    .registers 1

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView;->onExitLayoutOrScroll()V

    return-void
.end method

.method static synthetic access$2900(Landroid/support/v7/widget/RecyclerView;)Ljava/util/ArrayList;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemDecorations:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$300(Landroid/support/v7/widget/RecyclerView;)Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutRequestEaten:Z

    return v0
.end method

.method static synthetic access$3000(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 3

    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView;->considerReleasingGlowsOnScroll(II)V

    return-void
.end method

.method static synthetic access$3100(Landroid/support/v7/widget/RecyclerView;)Z
    .registers 2

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->awakenScrollBars()Z

    move-result v0

    return v0
.end method

.method static synthetic access$3200(Landroid/support/v7/widget/RecyclerView;I)V
    .registers 2

    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView;->setScrollState(I)V

    return-void
.end method

.method static synthetic access$3300(Landroid/support/v7/widget/RecyclerView;)V
    .registers 1

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView;->setDataSetChangedAfterLayout()V

    return-void
.end method

.method static synthetic access$3400(Landroid/support/v7/widget/RecyclerView;)Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mPostUpdatesOnAnimation:Z

    return v0
.end method

.method static synthetic access$3500(Landroid/support/v7/widget/RecyclerView;)Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mHasFixedSize:Z

    return v0
.end method

.method static synthetic access$3600(Landroid/support/v7/widget/RecyclerView;)Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mIsAttached:Z

    return v0
.end method

.method static synthetic access$3700(Landroid/support/v7/widget/RecyclerView;)Ljava/lang/Runnable;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mUpdateChildViewsRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$3802(Landroid/support/v7/widget/RecyclerView;Z)Z
    .registers 2

    iput-boolean p1, p0, Landroid/support/v7/widget/RecyclerView;->mAdapterUpdateDuringMeasure:Z

    return p1
.end method

.method static synthetic access$3900()Z
    .registers 1

    sget-boolean v0, Landroid/support/v7/widget/RecyclerView;->FORCE_INVALIDATE_DISPLAY_LIST:Z

    return v0
.end method

.method static synthetic access$4000(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerViewAccessibilityDelegate;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAccessibilityDelegate:Landroid/support/v7/widget/RecyclerViewAccessibilityDelegate;

    return-object v0
.end method

.method static synthetic access$4300(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$RecyclerListener;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mRecyclerListener:Landroid/support/v7/widget/RecyclerView$RecyclerListener;

    return-object v0
.end method

.method static synthetic access$4400(Landroid/support/v7/widget/RecyclerView;)Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mClipToPadding:Z

    return v0
.end method

.method static synthetic access$4500(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 3

    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView;->defaultOnMeasure(II)V

    return-void
.end method

.method static synthetic access$4600(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 3

    invoke-virtual {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView;->setMeasuredDimension(II)V

    return-void
.end method

.method static synthetic access$4700(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;)I
    .registers 3

    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView;->getAdapterPositionFor(Landroid/support/v7/widget/RecyclerView$ViewHolder;)I

    move-result v0

    return v0
.end method

.method static synthetic access$4900(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$ViewFlinger;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mViewFlinger:Landroid/support/v7/widget/RecyclerView$ViewFlinger;

    return-object v0
.end method

.method static synthetic access$502(Landroid/support/v7/widget/RecyclerView;Z)Z
    .registers 2

    iput-boolean p1, p0, Landroid/support/v7/widget/RecyclerView;->mPostedAnimatorRunner:Z

    return p1
.end method

.method static synthetic access$5200(Landroid/support/v7/widget/RecyclerView;I)V
    .registers 2

    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView;->jumpToPositionForSmoothScroller(I)V

    return-void
.end method

.method static synthetic access$5300(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;)Z
    .registers 3

    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView;->removeAnimatingView(Landroid/view/View;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$600(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;)V
    .registers 2

    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView;->dispatchChildAttached(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$700(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;)V
    .registers 2

    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView;->dispatchChildDetached(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$800(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .registers 4

    invoke-virtual {p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView;->attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method static synthetic access$900(Landroid/support/v7/widget/RecyclerView;I)V
    .registers 2

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView;->detachViewFromParent(I)V

    return-void
.end method

.method private addAnimatingView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 8

    iget-object v0, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    const/4 v2, 0x1

    if-ne v1, p0, :cond_b

    move v1, v2

    goto :goto_c

    :cond_b
    const/4 v1, 0x0

    :goto_c
    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView$Recycler;->unscrapView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isTmpDetached()Z

    move-result v3

    if-eqz v3, :cond_26

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    const/4 v4, -0x1

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    invoke-virtual {v3, v0, v4, v5, v2}, Landroid/support/v7/widget/ChildHelper;->attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)V

    goto :goto_33

    :cond_26
    if-nez v1, :cond_2e

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v3, v0, v2}, Landroid/support/v7/widget/ChildHelper;->addView(Landroid/view/View;Z)V

    goto :goto_33

    :cond_2e
    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/ChildHelper;->hide(Landroid/view/View;)V

    :goto_33
    return-void
.end method

.method private animateAppearance(Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/graphics/Rect;II)V
    .registers 14

    iget-object v0, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    const/4 v1, 0x0

    if-eqz p2, :cond_23

    iget v2, p2, Landroid/graphics/Rect;->left:I

    if-ne v2, p3, :cond_d

    iget v2, p2, Landroid/graphics/Rect;->top:I

    if-eq v2, p4, :cond_23

    :cond_d
    invoke-virtual {p1, v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->setIsRecyclable(Z)V

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    iget v5, p2, Landroid/graphics/Rect;->left:I

    iget v6, p2, Landroid/graphics/Rect;->top:I

    move-object v4, p1

    move v7, p3

    move v8, p4

    invoke-virtual/range {v3 .. v8}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->animateMove(Landroid/support/v7/widget/RecyclerView$ViewHolder;IIII)Z

    move-result v1

    if-eqz v1, :cond_31

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView;->postAnimationRunner()V

    goto :goto_31

    :cond_23
    invoke-virtual {p1, v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->setIsRecyclable(Z)V

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    invoke-virtual {v1, p1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->animateAdd(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    move-result v1

    if-eqz v1, :cond_31

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView;->postAnimationRunner()V

    :cond_31
    :goto_31
    return-void
.end method

.method private animateChange(Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 14

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->setIsRecyclable(Z)V

    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView;->addAnimatingView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    iput-object p2, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mShadowedHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {v1, p1}, Landroid/support/v7/widget/RecyclerView$Recycler;->unscrapView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    iget-object v1, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v1

    iget-object v2, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v9

    if-eqz p2, :cond_37

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->shouldIgnore()Z

    move-result v2

    if-eqz v2, :cond_23

    goto :goto_37

    :cond_23
    iget-object v2, p2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v2

    iget-object v3, p2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v3

    invoke-virtual {p2, v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->setIsRecyclable(Z)V

    iput-object p1, p2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mShadowingHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move v0, v2

    move v10, v3

    goto :goto_3a

    :cond_37
    :goto_37
    move v0, v1

    move v2, v9

    move v10, v2

    :goto_3a
    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    move-object v3, p1

    move-object v4, p2

    move v5, v1

    move v6, v9

    move v7, v0

    move v8, v10

    invoke-virtual/range {v2 .. v8}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->animateChange(Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/support/v7/widget/RecyclerView$ViewHolder;IIII)Z

    move-result v2

    if-eqz v2, :cond_4b

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView;->postAnimationRunner()V

    :cond_4b
    return-void
.end method

.method private animateDisappearance(Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;)V
    .registers 13

    iget-object v0, p1, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v1, p1, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-direct {p0, v1}, Landroid/support/v7/widget/RecyclerView;->addAnimatingView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    iget v1, p1, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->left:I

    iget v8, p1, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->top:I

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v9

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v10

    iget-object v2, p1, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isRemoved()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_46

    if-ne v1, v9, :cond_22

    if-eq v8, v10, :cond_46

    :cond_22
    iget-object v2, p1, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->setIsRecyclable(Z)V

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v2

    add-int/2addr v2, v9

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v3

    add-int/2addr v3, v10

    invoke-virtual {v0, v9, v10, v2, v3}, Landroid/view/View;->layout(IIII)V

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    iget-object v3, p1, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move v4, v1

    move v5, v8

    move v6, v9

    move v7, v10

    invoke-virtual/range {v2 .. v7}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->animateMove(Landroid/support/v7/widget/RecyclerView$ViewHolder;IIII)Z

    move-result v2

    if-eqz v2, :cond_58

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView;->postAnimationRunner()V

    goto :goto_58

    :cond_46
    iget-object v2, p1, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->setIsRecyclable(Z)V

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    iget-object v3, p1, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->animateRemove(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    move-result v2

    if-eqz v2, :cond_58

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView;->postAnimationRunner()V

    :cond_58
    :goto_58
    return-void
.end method

.method private cancelTouch()V
    .registers 2

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView;->resetTouch()V

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/RecyclerView;->setScrollState(I)V

    return-void
.end method

.method private considerReleasingGlowsOnScroll(II)V
    .registers 5

    const/4 v0, 0x0

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mLeftGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    if-eqz v1, :cond_15

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mLeftGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v1}, Landroid/support/v4/widget/EdgeEffectCompat;->isFinished()Z

    move-result v1

    if-nez v1, :cond_15

    if-lez p1, :cond_15

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mLeftGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v1}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v0

    :cond_15
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mRightGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    if-eqz v1, :cond_2a

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mRightGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v1}, Landroid/support/v4/widget/EdgeEffectCompat;->isFinished()Z

    move-result v1

    if-nez v1, :cond_2a

    if-gez p1, :cond_2a

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mRightGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v1}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v1

    or-int/2addr v0, v1

    :cond_2a
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mTopGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    if-eqz v1, :cond_3f

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mTopGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v1}, Landroid/support/v4/widget/EdgeEffectCompat;->isFinished()Z

    move-result v1

    if-nez v1, :cond_3f

    if-lez p2, :cond_3f

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mTopGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v1}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v1

    or-int/2addr v0, v1

    :cond_3f
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mBottomGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    if-eqz v1, :cond_54

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mBottomGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v1}, Landroid/support/v4/widget/EdgeEffectCompat;->isFinished()Z

    move-result v1

    if-nez v1, :cond_54

    if-gez p2, :cond_54

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mBottomGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v1}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v1

    or-int/2addr v0, v1

    :cond_54
    if-eqz v0, :cond_59

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    :cond_59
    return-void
.end method

.method private consumePendingUpdateOperations()V
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mUpdateChildViewsRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method private createLayoutManager(Landroid/content/Context;Ljava/lang/String;Landroid/util/AttributeSet;II)V
    .registers 15

    if-eqz p2, :cond_123

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_123

    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView;->getFullClassName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    :try_start_10
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_1f

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    goto :goto_23

    :cond_1f
    invoke-virtual {p1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    :goto_23
    invoke-virtual {v0, p2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1
    :try_end_2d
    .catch Ljava/lang/ClassNotFoundException; {:try_start_10 .. :try_end_2d} :catch_104
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_10 .. :try_end_2d} :catch_e5
    .catch Ljava/lang/InstantiationException; {:try_start_10 .. :try_end_2d} :catch_c6
    .catch Ljava/lang/IllegalAccessException; {:try_start_10 .. :try_end_2d} :catch_a7
    .catch Ljava/lang/ClassCastException; {:try_start_10 .. :try_end_2d} :catch_88

    const/4 v2, 0x0

    move-object v3, v2

    const/4 v4, 0x1

    const/4 v5, 0x0

    :try_start_31
    sget-object v6, Landroid/support/v7/widget/RecyclerView;->LAYOUT_MANAGER_CONSTRUCTOR_SIGNATURE:[Ljava/lang/Class;

    invoke-virtual {v1, v6}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v6

    move-object v2, v6

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Object;

    aput-object p1, v6, v5

    aput-object p3, v6, v4

    const/4 v7, 0x2

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x3

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7
    :try_end_4d
    .catch Ljava/lang/NoSuchMethodException; {:try_start_31 .. :try_end_4d} :catch_4f
    .catch Ljava/lang/ClassNotFoundException; {:try_start_31 .. :try_end_4d} :catch_104
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_31 .. :try_end_4d} :catch_e5
    .catch Ljava/lang/InstantiationException; {:try_start_31 .. :try_end_4d} :catch_c6
    .catch Ljava/lang/IllegalAccessException; {:try_start_31 .. :try_end_4d} :catch_a7
    .catch Ljava/lang/ClassCastException; {:try_start_31 .. :try_end_4d} :catch_88

    move-object v3, v6

    goto :goto_58

    :catch_4f
    move-exception v6

    :try_start_50
    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v1, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v5
    :try_end_56
    .catch Ljava/lang/NoSuchMethodException; {:try_start_50 .. :try_end_56} :catch_66
    .catch Ljava/lang/ClassNotFoundException; {:try_start_50 .. :try_end_56} :catch_104
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_50 .. :try_end_56} :catch_e5
    .catch Ljava/lang/InstantiationException; {:try_start_50 .. :try_end_56} :catch_c6
    .catch Ljava/lang/IllegalAccessException; {:try_start_50 .. :try_end_56} :catch_a7
    .catch Ljava/lang/ClassCastException; {:try_start_50 .. :try_end_56} :catch_88

    move-object v2, v5

    nop

    :goto_58
    :try_start_58
    invoke-virtual {v2, v4}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {p0, v4}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    goto/16 :goto_123

    :catch_66
    move-exception v4

    invoke-virtual {v4, v6}, Ljava/lang/NoSuchMethodException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    new-instance v5, Ljava/lang/IllegalStateException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p3}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, ": Error creating LayoutManager "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
    :try_end_88
    .catch Ljava/lang/ClassNotFoundException; {:try_start_58 .. :try_end_88} :catch_104
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_58 .. :try_end_88} :catch_e5
    .catch Ljava/lang/InstantiationException; {:try_start_58 .. :try_end_88} :catch_c6
    .catch Ljava/lang/IllegalAccessException; {:try_start_58 .. :try_end_88} :catch_a7
    .catch Ljava/lang/ClassCastException; {:try_start_58 .. :try_end_88} :catch_88

    :catch_88
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p3}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ": Class is not a LayoutManager "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_a7
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p3}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ": Cannot access non-public constructor "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_c6
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p3}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ": Could not instantiate the LayoutManager: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_e5
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p3}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ": Could not instantiate the LayoutManager: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_104
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p3}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ": Unable to find LayoutManager "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :cond_123
    :goto_123
    return-void
.end method

.method private defaultOnMeasure(II)V
    .registers 11

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/high16 v6, 0x40000000    # 2.0f

    const/high16 v7, -0x80000000

    if-eq v0, v7, :cond_1f

    if-eq v0, v6, :cond_1f

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getMinimumWidth(Landroid/view/View;)I

    move-result v4

    goto :goto_21

    :cond_1f
    move v4, v2

    nop

    :goto_21
    if-eq v1, v7, :cond_2a

    if-eq v1, v6, :cond_2a

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getMinimumHeight(Landroid/view/View;)I

    move-result v5

    goto :goto_2c

    :cond_2a
    move v5, v3

    nop

    :goto_2c
    invoke-virtual {p0, v4, v5}, Landroid/support/v7/widget/RecyclerView;->setMeasuredDimension(II)V

    return-void
.end method

.method private didChildRangeChange(II)Z
    .registers 9

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/ChildHelper;->getChildCount()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_12

    if-nez p1, :cond_11

    if-eqz p2, :cond_f

    goto :goto_11

    :cond_f
    move v1, v2

    nop

    :cond_11
    :goto_11
    return v1

    :cond_12
    move v3, v2

    :goto_13
    if-ge v3, v0, :cond_33

    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v4, v3}, Landroid/support/v7/widget/ChildHelper;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-static {v4}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->shouldIgnore()Z

    move-result v5

    if-eqz v5, :cond_26

    goto :goto_2f

    :cond_26
    invoke-virtual {v4}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getLayoutPosition()I

    move-result v5

    if-lt v5, p1, :cond_32

    if-le v5, p2, :cond_2f

    goto :goto_32

    :cond_2f
    :goto_2f
    add-int/lit8 v3, v3, 0x1

    goto :goto_13

    :cond_32
    :goto_32
    return v1

    :cond_33
    return v2
.end method

.method private dispatchChildAttached(Landroid/view/View;)V
    .registers 6

    invoke-static {p1}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView;->onChildAttachedToWindow(Landroid/view/View;)V

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    if-eqz v1, :cond_12

    if-eqz v0, :cond_12

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->onViewAttachedToWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    :cond_12
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mOnChildAttachStateListeners:Ljava/util/List;

    if-eqz v1, :cond_2e

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mOnChildAttachStateListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v2, v1, -0x1

    :goto_1e
    if-ltz v2, :cond_2e

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mOnChildAttachStateListeners:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/RecyclerView$OnChildAttachStateChangeListener;

    invoke-interface {v3, p1}, Landroid/support/v7/widget/RecyclerView$OnChildAttachStateChangeListener;->onChildViewAttachedToWindow(Landroid/view/View;)V

    add-int/lit8 v2, v2, -0x1

    goto :goto_1e

    :cond_2e
    return-void
.end method

.method private dispatchChildDetached(Landroid/view/View;)V
    .registers 6

    invoke-static {p1}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView;->onChildDetachedFromWindow(Landroid/view/View;)V

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    if-eqz v1, :cond_12

    if-eqz v0, :cond_12

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->onViewDetachedFromWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    :cond_12
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mOnChildAttachStateListeners:Ljava/util/List;

    if-eqz v1, :cond_2e

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mOnChildAttachStateListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v2, v1, -0x1

    :goto_1e
    if-ltz v2, :cond_2e

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mOnChildAttachStateListeners:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/RecyclerView$OnChildAttachStateChangeListener;

    invoke-interface {v3, p1}, Landroid/support/v7/widget/RecyclerView$OnChildAttachStateChangeListener;->onChildViewDetachedFromWindow(Landroid/view/View;)V

    add-int/lit8 v2, v2, -0x1

    goto :goto_1e

    :cond_2e
    return-void
.end method

.method private dispatchContentChangedIfNecessary()V
    .registers 4

    iget v0, p0, Landroid/support/v7/widget/RecyclerView;->mEatenAccessibilityChangeFlags:I

    const/4 v1, 0x0

    iput v1, p0, Landroid/support/v7/widget/RecyclerView;->mEatenAccessibilityChangeFlags:I

    if-eqz v0, :cond_1c

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->isAccessibilityEnabled()Z

    move-result v1

    if-eqz v1, :cond_1c

    invoke-static {}, Landroid/view/accessibility/AccessibilityEvent;->obtain()Landroid/view/accessibility/AccessibilityEvent;

    move-result-object v1

    const/16 v2, 0x800

    invoke-virtual {v1, v2}, Landroid/view/accessibility/AccessibilityEvent;->setEventType(I)V

    invoke-static {v1, v0}, Landroid/support/v4/view/accessibility/AccessibilityEventCompat;->setContentChangeTypes(Landroid/view/accessibility/AccessibilityEvent;I)V

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/RecyclerView;->sendAccessibilityEventUnchecked(Landroid/view/accessibility/AccessibilityEvent;)V

    :cond_1c
    return-void
.end method

.method private dispatchOnItemTouch(Landroid/view/MotionEvent;)Z
    .registers 9

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mActiveOnItemTouchListener:Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;

    const/4 v2, 0x1

    if-eqz v1, :cond_1c

    const/4 v1, 0x0

    if-nez v0, :cond_f

    iput-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mActiveOnItemTouchListener:Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;

    goto :goto_1c

    :cond_f
    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mActiveOnItemTouchListener:Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;

    invoke-interface {v3, p0, p1}, Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;->onTouchEvent(Landroid/support/v7/widget/RecyclerView;Landroid/view/MotionEvent;)V

    const/4 v3, 0x3

    if-eq v0, v3, :cond_19

    if-ne v0, v2, :cond_1b

    :cond_19
    iput-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mActiveOnItemTouchListener:Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;

    :cond_1b
    return v2

    :cond_1c
    :goto_1c
    const/4 v1, 0x0

    if-eqz v0, :cond_3c

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mOnItemTouchListeners:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v4, v1

    :goto_26
    if-ge v4, v3, :cond_3c

    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView;->mOnItemTouchListeners:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;

    invoke-interface {v5, p0, p1}, Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;->onInterceptTouchEvent(Landroid/support/v7/widget/RecyclerView;Landroid/view/MotionEvent;)Z

    move-result v6

    if-eqz v6, :cond_39

    iput-object v5, p0, Landroid/support/v7/widget/RecyclerView;->mActiveOnItemTouchListener:Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;

    return v2

    :cond_39
    add-int/lit8 v4, v4, 0x1

    goto :goto_26

    :cond_3c
    return v1
.end method

.method private dispatchOnItemTouchIntercept(Landroid/view/MotionEvent;)Z
    .registers 9

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_9

    if-nez v0, :cond_c

    :cond_9
    const/4 v2, 0x0

    iput-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mActiveOnItemTouchListener:Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;

    :cond_c
    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mOnItemTouchListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :goto_14
    if-ge v4, v2, :cond_2d

    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView;->mOnItemTouchListeners:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;

    invoke-interface {v5, p0, p1}, Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;->onInterceptTouchEvent(Landroid/support/v7/widget/RecyclerView;Landroid/view/MotionEvent;)Z

    move-result v6

    if-eqz v6, :cond_2a

    if-eq v0, v1, :cond_2a

    iput-object v5, p0, Landroid/support/v7/widget/RecyclerView;->mActiveOnItemTouchListener:Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;

    const/4 v1, 0x1

    return v1

    :cond_2a
    add-int/lit8 v4, v4, 0x1

    goto :goto_14

    :cond_2d
    return v3
.end method

.method private findMinMaxChildLayoutPositions([I)V
    .registers 10

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/ChildHelper;->getChildCount()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_f

    aput v2, p1, v2

    aput v2, p1, v1

    return-void

    :cond_f
    const v3, 0x7fffffff

    const/high16 v4, -0x80000000

    move v5, v4

    move v4, v3

    move v3, v2

    :goto_17
    if-ge v3, v0, :cond_37

    iget-object v6, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v6, v3}, Landroid/support/v7/widget/ChildHelper;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-static {v6}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->shouldIgnore()Z

    move-result v7

    if-eqz v7, :cond_2a

    goto :goto_34

    :cond_2a
    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getLayoutPosition()I

    move-result v7

    if-ge v7, v4, :cond_31

    move v4, v7

    :cond_31
    if-le v7, v5, :cond_34

    move v5, v7

    :cond_34
    :goto_34
    add-int/lit8 v3, v3, 0x1

    goto :goto_17

    :cond_37
    aput v4, p1, v2

    aput v5, p1, v1

    return-void
.end method

.method private getAdapterPositionFor(Landroid/support/v7/widget/RecyclerView$ViewHolder;)I
    .registers 4

    const/16 v0, 0x20c

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->hasAnyOfTheFlags(I)Z

    move-result v0

    if-nez v0, :cond_18

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isBound()Z

    move-result v0

    if-nez v0, :cond_f

    goto :goto_18

    :cond_f
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAdapterHelper:Landroid/support/v7/widget/AdapterHelper;

    iget v1, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/AdapterHelper;->applyPendingUpdatesToPosition(I)I

    move-result v0

    return v0

    :cond_18
    :goto_18
    const/4 v0, -0x1

    return v0
.end method

.method static getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 2

    if-nez p0, :cond_4

    const/4 v0, 0x0

    return-object v0

    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;->mViewHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    return-object v0
.end method

.method private getFullClassName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2e

    if-ne v0, v1, :cond_1d

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1d
    const-string v0, "."

    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_26

    return-object p2

    :cond_26
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-class v2, Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getScrollFactor()F
    .registers 5

    iget v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollFactor:F

    const/4 v1, 0x1

    cmpl-float v0, v0, v1

    if-nez v0, :cond_33

    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x101004d

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v1

    if-eqz v1, :cond_31

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/util/TypedValue;->getDimension(Landroid/util/DisplayMetrics;)F

    move-result v1

    iput v1, p0, Landroid/support/v7/widget/RecyclerView;->mScrollFactor:F

    goto :goto_33

    :cond_31
    const/4 v1, 0x0

    return v1

    :cond_33
    :goto_33
    iget v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollFactor:F

    return v0
.end method

.method private initChildrenHelper()V
    .registers 3

    new-instance v0, Landroid/support/v7/widget/ChildHelper;

    new-instance v1, Landroid/support/v7/widget/RecyclerView$4;

    invoke-direct {v1, p0}, Landroid/support/v7/widget/RecyclerView$4;-><init>(Landroid/support/v7/widget/RecyclerView;)V

    invoke-direct {v0, v1}, Landroid/support/v7/widget/ChildHelper;-><init>(Landroid/support/v7/widget/ChildHelper$Callback;)V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    return-void
.end method

.method private jumpToPositionForSmoothScroller(I)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->scrollToPosition(I)V

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->awakenScrollBars()Z

    return-void
.end method

.method private onEnterLayoutOrScroll()V
    .registers 2

    iget v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutOrScrollCounter:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutOrScrollCounter:I

    return-void
.end method

.method private onExitLayoutOrScroll()V
    .registers 3

    iget v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutOrScrollCounter:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    iput v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutOrScrollCounter:I

    iget v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutOrScrollCounter:I

    if-ge v0, v1, :cond_10

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutOrScrollCounter:I

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView;->dispatchContentChangedIfNecessary()V

    :cond_10
    return-void
.end method

.method private onPointerUp(Landroid/view/MotionEvent;)V
    .registers 6

    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getActionIndex(Landroid/view/MotionEvent;)I

    move-result v0

    invoke-static {p1, v0}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v1

    iget v2, p0, Landroid/support/v7/widget/RecyclerView;->mScrollPointerId:I

    if-ne v1, v2, :cond_2d

    if-nez v0, :cond_10

    const/4 v1, 0x1

    goto :goto_11

    :cond_10
    const/4 v1, 0x0

    :goto_11
    invoke-static {p1, v1}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v2

    iput v2, p0, Landroid/support/v7/widget/RecyclerView;->mScrollPointerId:I

    invoke-static {p1, v1}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v2

    const/high16 v3, 0x3f000000    # 0.5f

    add-float/2addr v2, v3

    float-to-int v2, v2

    iput v2, p0, Landroid/support/v7/widget/RecyclerView;->mLastTouchX:I

    iput v2, p0, Landroid/support/v7/widget/RecyclerView;->mInitialTouchX:I

    invoke-static {p1, v1}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v2

    add-float/2addr v2, v3

    float-to-int v2, v2

    iput v2, p0, Landroid/support/v7/widget/RecyclerView;->mLastTouchY:I

    iput v2, p0, Landroid/support/v7/widget/RecyclerView;->mInitialTouchY:I

    :cond_2d
    return-void
.end method

.method private postAnimationRunner()V
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mPostedAnimatorRunner:Z

    if-nez v0, :cond_10

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mIsAttached:Z

    if-eqz v0, :cond_10

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimatorRunner:Ljava/lang/Runnable;

    invoke-static {p0, v0}, Landroid/support/v4/view/ViewCompat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mPostedAnimatorRunner:Z

    :cond_10
    return-void
.end method

.method private predictiveItemAnimationsEnabled()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    if-eqz v0, :cond_e

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->supportsPredictiveItemAnimations()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    :goto_f
    return v0
.end method

.method private processAdapterUpdatesAndSetAnimationFlags()V
    .registers 6

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mDataSetHasChangedAfterLayout:Z

    if-eqz v0, :cond_11

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAdapterHelper:Landroid/support/v7/widget/AdapterHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/AdapterHelper;->reset()V

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->markKnownViewsInvalid()V

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0, p0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onItemsChanged(Landroid/support/v7/widget/RecyclerView;)V

    :cond_11
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    if-eqz v0, :cond_23

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->supportsPredictiveItemAnimations()Z

    move-result v0

    if-eqz v0, :cond_23

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAdapterHelper:Landroid/support/v7/widget/AdapterHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/AdapterHelper;->preProcess()V

    goto :goto_28

    :cond_23
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAdapterHelper:Landroid/support/v7/widget/AdapterHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/AdapterHelper;->consumeUpdatesInOnePass()V

    :goto_28
    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemsAddedOrRemoved:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_32

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemsChanged:Z

    if-eqz v0, :cond_43

    :cond_32
    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemsAddedOrRemoved:Z

    if-nez v0, :cond_43

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemsChanged:Z

    if-eqz v0, :cond_41

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView;->supportsChangeAnimations()Z

    move-result v0

    if-eqz v0, :cond_41

    goto :goto_43

    :cond_41
    move v0, v2

    goto :goto_44

    :cond_43
    :goto_43
    move v0, v1

    :goto_44
    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-boolean v4, p0, Landroid/support/v7/widget/RecyclerView;->mFirstLayoutComplete:Z

    if-eqz v4, :cond_6a

    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    if-eqz v4, :cond_6a

    iget-boolean v4, p0, Landroid/support/v7/widget/RecyclerView;->mDataSetHasChangedAfterLayout:Z

    if-nez v4, :cond_5c

    if-nez v0, :cond_5c

    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    # getter for: Landroid/support/v7/widget/RecyclerView$LayoutManager;->mRequestedSimpleAnimations:Z
    invoke-static {v4}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->access$1900(Landroid/support/v7/widget/RecyclerView$LayoutManager;)Z

    move-result v4

    if-eqz v4, :cond_6a

    :cond_5c
    iget-boolean v4, p0, Landroid/support/v7/widget/RecyclerView;->mDataSetHasChangedAfterLayout:Z

    if-eqz v4, :cond_68

    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v4}, Landroid/support/v7/widget/RecyclerView$Adapter;->hasStableIds()Z

    move-result v4

    if-eqz v4, :cond_6a

    :cond_68
    move v4, v1

    goto :goto_6b

    :cond_6a
    move v4, v2

    :goto_6b
    # setter for: Landroid/support/v7/widget/RecyclerView$State;->mRunSimpleAnimations:Z
    invoke-static {v3, v4}, Landroid/support/v7/widget/RecyclerView$State;->access$1802(Landroid/support/v7/widget/RecyclerView$State;Z)Z

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    # getter for: Landroid/support/v7/widget/RecyclerView$State;->mRunSimpleAnimations:Z
    invoke-static {v4}, Landroid/support/v7/widget/RecyclerView$State;->access$1800(Landroid/support/v7/widget/RecyclerView$State;)Z

    move-result v4

    if-eqz v4, :cond_85

    if-eqz v0, :cond_85

    iget-boolean v4, p0, Landroid/support/v7/widget/RecyclerView;->mDataSetHasChangedAfterLayout:Z

    if-nez v4, :cond_85

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView;->predictiveItemAnimationsEnabled()Z

    move-result v4

    if-eqz v4, :cond_85

    goto :goto_86

    :cond_85
    move v1, v2

    :goto_86
    # setter for: Landroid/support/v7/widget/RecyclerView$State;->mRunPredictiveAnimations:Z
    invoke-static {v3, v1}, Landroid/support/v7/widget/RecyclerView$State;->access$1602(Landroid/support/v7/widget/RecyclerView$State;Z)Z

    return-void
.end method

.method private processDisappearingList(Landroid/support/v4/util/ArrayMap;)V
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/util/ArrayMap<",
            "Landroid/view/View;",
            "Landroid/graphics/Rect;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$State;->mDisappearingViewsInLayoutPass:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_a
    if-ltz v1, :cond_61

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-static {v2}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v9

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v3, v3, Landroid/support/v7/widget/RecyclerView$State;->mPreLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v3, v9}, Landroid/support/v4/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v10, v3

    check-cast v10, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v3

    if-nez v3, :cond_30

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v3, v3, Landroid/support/v7/widget/RecyclerView$State;->mPostLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v3, v9}, Landroid/support/v4/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_30
    invoke-virtual {p1, v2}, Landroid/support/v4/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_3e

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {v3, v2, v4}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->removeAndRecycleView(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Recycler;)V

    goto :goto_5e

    :cond_3e
    if-eqz v10, :cond_44

    invoke-direct {p0, v10}, Landroid/support/v7/widget/RecyclerView;->animateDisappearance(Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;)V

    goto :goto_5e

    :cond_44
    new-instance v11, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v5

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v6

    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    move-result v7

    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    move-result v8

    move-object v3, v11

    move-object v4, v9

    invoke-direct/range {v3 .. v8}, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;-><init>(Landroid/support/v7/widget/RecyclerView$ViewHolder;IIII)V

    invoke-direct {p0, v11}, Landroid/support/v7/widget/RecyclerView;->animateDisappearance(Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;)V

    :goto_5e
    add-int/lit8 v1, v1, -0x1

    goto :goto_a

    :cond_61
    invoke-interface {v0}, Ljava/util/List;->clear()V

    return-void
.end method

.method private pullGlows(FFFF)V
    .registers 11

    const/4 v0, 0x0

    const/4 v1, 0x0

    cmpg-float v2, p2, v1

    const/high16 v3, 0x3f800000    # 1.0f

    if-gez v2, :cond_25

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->ensureLeftGlow()V

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mLeftGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    neg-float v4, p2

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v4, v5

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getHeight()I

    move-result v5

    int-to-float v5, v5

    div-float v5, p3, v5

    sub-float v5, v3, v5

    invoke-virtual {v2, v4, v5}, Landroid/support/v4/widget/EdgeEffectCompat;->onPull(FF)Z

    move-result v2

    if-eqz v2, :cond_43

    const/4 v0, 0x1

    goto :goto_43

    :cond_25
    cmpl-float v2, p2, v1

    if-lez v2, :cond_43

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->ensureRightGlow()V

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mRightGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v4

    int-to-float v4, v4

    div-float v4, p2, v4

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getHeight()I

    move-result v5

    int-to-float v5, v5

    div-float v5, p3, v5

    invoke-virtual {v2, v4, v5}, Landroid/support/v4/widget/EdgeEffectCompat;->onPull(FF)Z

    move-result v2

    if-eqz v2, :cond_43

    const/4 v0, 0x1

    :cond_43
    :goto_43
    cmpg-float v2, p4, v1

    if-gez v2, :cond_62

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->ensureTopGlow()V

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mTopGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    neg-float v3, p4

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getHeight()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v4

    int-to-float v4, v4

    div-float v4, p1, v4

    invoke-virtual {v2, v3, v4}, Landroid/support/v4/widget/EdgeEffectCompat;->onPull(FF)Z

    move-result v2

    if-eqz v2, :cond_81

    const/4 v0, 0x1

    goto :goto_81

    :cond_62
    cmpl-float v2, p4, v1

    if-lez v2, :cond_81

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->ensureBottomGlow()V

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mBottomGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getHeight()I

    move-result v4

    int-to-float v4, v4

    div-float v4, p4, v4

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v5

    int-to-float v5, v5

    div-float v5, p1, v5

    sub-float/2addr v3, v5

    invoke-virtual {v2, v4, v3}, Landroid/support/v4/widget/EdgeEffectCompat;->onPull(FF)Z

    move-result v2

    if-eqz v2, :cond_81

    const/4 v0, 0x1

    :cond_81
    :goto_81
    if-nez v0, :cond_8b

    cmpl-float v2, p2, v1

    if-nez v2, :cond_8b

    cmpl-float v1, p4, v1

    if-eqz v1, :cond_8e

    :cond_8b
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    :cond_8e
    return-void
.end method

.method private releaseGlows()V
    .registers 3

    const/4 v0, 0x0

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mLeftGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    if-eqz v1, :cond_b

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mLeftGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v1}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v0

    :cond_b
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mTopGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    if-eqz v1, :cond_16

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mTopGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v1}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v1

    or-int/2addr v0, v1

    :cond_16
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mRightGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    if-eqz v1, :cond_21

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mRightGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v1}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v1

    or-int/2addr v0, v1

    :cond_21
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mBottomGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    if-eqz v1, :cond_2c

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mBottomGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v1}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v1

    or-int/2addr v0, v1

    :cond_2c
    if-eqz v0, :cond_31

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    :cond_31
    return-void
.end method

.method private removeAnimatingView(Landroid/view/View;)Z
    .registers 5

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->eatRequestLayout()V

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/ChildHelper;->removeViewIfHidden(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_19

    invoke-static {p1}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/RecyclerView$Recycler;->unscrapView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/RecyclerView$Recycler;->recycleViewHolderInternal(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    :cond_19
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/RecyclerView;->resumeRequestLayout(Z)V

    return v0
.end method

.method private resetTouch()V
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    :cond_9
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->stopNestedScroll()V

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView;->releaseGlows()V

    return-void
.end method

.method private setAdapterInternal(Landroid/support/v7/widget/RecyclerView$Adapter;ZZ)V
    .registers 7

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    if-eqz v0, :cond_10

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mObserver:Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$Adapter;->unregisterAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p0}, Landroid/support/v7/widget/RecyclerView$Adapter;->onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    :cond_10
    if-eqz p2, :cond_14

    if-eqz p3, :cond_34

    :cond_14
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    if-eqz v0, :cond_1d

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->endAnimations()V

    :cond_1d
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-eqz v0, :cond_2f

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->removeAndRecycleAllViews(Landroid/support/v7/widget/RecyclerView$Recycler;)V

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->removeAndRecycleScrapInt(Landroid/support/v7/widget/RecyclerView$Recycler;)V

    :cond_2f
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Recycler;->clear()V

    :cond_34
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAdapterHelper:Landroid/support/v7/widget/AdapterHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/AdapterHelper;->reset()V

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    iput-object p1, p0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    if-eqz p1, :cond_47

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mObserver:Landroid/support/v7/widget/RecyclerView$RecyclerViewDataObserver;

    invoke-virtual {p1, v1}, Landroid/support/v7/widget/RecyclerView$Adapter;->registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    invoke-virtual {p1, p0}, Landroid/support/v7/widget/RecyclerView$Adapter;->onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    :cond_47
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-eqz v1, :cond_52

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v1, v0, v2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onAdapterChanged(Landroid/support/v7/widget/RecyclerView$Adapter;Landroid/support/v7/widget/RecyclerView$Adapter;)V

    :cond_52
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v1, v0, v2, p2}, Landroid/support/v7/widget/RecyclerView$Recycler;->onAdapterChanged(Landroid/support/v7/widget/RecyclerView$Adapter;Landroid/support/v7/widget/RecyclerView$Adapter;Z)V

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    const/4 v2, 0x1

    # setter for: Landroid/support/v7/widget/RecyclerView$State;->mStructureChanged:Z
    invoke-static {v1, v2}, Landroid/support/v7/widget/RecyclerView$State;->access$1402(Landroid/support/v7/widget/RecyclerView$State;Z)Z

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->markKnownViewsInvalid()V

    return-void
.end method

.method private setDataSetChangedAfterLayout()V
    .registers 5

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mDataSetHasChangedAfterLayout:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mDataSetHasChangedAfterLayout:Z

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/ChildHelper;->getUnfilteredChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_f
    if-ge v1, v0, :cond_2b

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/ChildHelper;->getUnfilteredChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v2

    if-eqz v2, :cond_28

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->shouldIgnore()Z

    move-result v3

    if-nez v3, :cond_28

    const/16 v3, 0x200

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->addFlags(I)V

    :cond_28
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    :cond_2b
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$Recycler;->setAdapterPositionsAsUnknown()V

    return-void
.end method

.method private setScrollState(I)V
    .registers 3

    iget v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollState:I

    if-ne p1, v0, :cond_5

    return-void

    :cond_5
    iput p1, p0, Landroid/support/v7/widget/RecyclerView;->mScrollState:I

    const/4 v0, 0x2

    if-eq p1, v0, :cond_d

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView;->stopScrollersInternal()V

    :cond_d
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView;->dispatchOnScrollStateChanged(I)V

    return-void
.end method

.method private stopScrollersInternal()V
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mViewFlinger:Landroid/support/v7/widget/RecyclerView$ViewFlinger;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->stop()V

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-eqz v0, :cond_e

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->stopSmoothScroller()V

    :cond_e
    return-void
.end method

.method private supportsChangeAnimations()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    if-eqz v0, :cond_e

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->getSupportsChangeAnimations()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    :goto_f
    return v0
.end method


# virtual methods
.method absorbGlows(II)V
    .registers 5

    if-gez p1, :cond_c

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->ensureLeftGlow()V

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLeftGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    neg-int v1, p1

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/EdgeEffectCompat;->onAbsorb(I)Z

    goto :goto_16

    :cond_c
    if-lez p1, :cond_16

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->ensureRightGlow()V

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mRightGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v0, p1}, Landroid/support/v4/widget/EdgeEffectCompat;->onAbsorb(I)Z

    :cond_16
    :goto_16
    if-gez p2, :cond_22

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->ensureTopGlow()V

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mTopGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    neg-int v1, p2

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/EdgeEffectCompat;->onAbsorb(I)Z

    goto :goto_2c

    :cond_22
    if-lez p2, :cond_2c

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->ensureBottomGlow()V

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mBottomGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v0, p2}, Landroid/support/v4/widget/EdgeEffectCompat;->onAbsorb(I)Z

    :cond_2c
    :goto_2c
    if-nez p1, :cond_30

    if-eqz p2, :cond_33

    :cond_30
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    :cond_33
    return-void
.end method

.method public addFocusables(Ljava/util/ArrayList;II)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;II)V"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-eqz v0, :cond_c

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0, p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onAddFocusables(Landroid/support/v7/widget/RecyclerView;Ljava/util/ArrayList;II)Z

    move-result v0

    if-nez v0, :cond_f

    :cond_c
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addFocusables(Ljava/util/ArrayList;II)V

    :cond_f
    return-void
.end method

.method public addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V
    .registers 3

    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;I)V

    return-void
.end method

.method public addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;I)V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    const-string v1, "Cannot add item decoration during a scroll  or layout"

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    :cond_b
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemDecorations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_17

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/RecyclerView;->setWillNotDraw(Z)V

    :cond_17
    if-gez p2, :cond_1f

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemDecorations:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_24

    :cond_1f
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemDecorations:Ljava/util/ArrayList;

    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :goto_24
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->markItemDecorInsetsDirty()V

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->requestLayout()V

    return-void
.end method

.method public addOnChildAttachStateChangeListener(Landroid/support/v7/widget/RecyclerView$OnChildAttachStateChangeListener;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mOnChildAttachStateListeners:Ljava/util/List;

    if-nez v0, :cond_b

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mOnChildAttachStateListeners:Ljava/util/List;

    :cond_b
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mOnChildAttachStateListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public addOnItemTouchListener(Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mOnItemTouchListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollListeners:Ljava/util/List;

    if-nez v0, :cond_b

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollListeners:Ljava/util/List;

    :cond_b
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method assertInLayoutOrScroll(Ljava/lang/String;)V
    .registers 4

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->isComputingLayout()Z

    move-result v0

    if-nez v0, :cond_16

    if-nez p1, :cond_10

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot call this method unless RecyclerView is computing a layout or scrolling"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_10
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_16
    return-void
.end method

.method assertNotInLayoutOrScroll(Ljava/lang/String;)V
    .registers 4

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->isComputingLayout()Z

    move-result v0

    if-eqz v0, :cond_16

    if-nez p1, :cond_10

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot call this method while RecyclerView is computing a layout or scrolling"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_10
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_16
    return-void
.end method

.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 4

    instance-of v0, p1, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    if-eqz v0, :cond_11

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-object v1, p1

    check-cast v1, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->checkLayoutParams(Landroid/support/v7/widget/RecyclerView$LayoutParams;)Z

    move-result v0

    if-eqz v0, :cond_11

    const/4 v0, 0x1

    goto :goto_12

    :cond_11
    const/4 v0, 0x0

    :goto_12
    return v0
.end method

.method clearOldPositions()V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/ChildHelper;->getUnfilteredChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_1f

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/ChildHelper;->getUnfilteredChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->shouldIgnore()Z

    move-result v3

    if-nez v3, :cond_1c

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->clearOldPosition()V

    :cond_1c
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_1f
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$Recycler;->clearOldPositions()V

    return-void
.end method

.method public clearOnChildAttachStateChangeListeners()V
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mOnChildAttachStateListeners:Ljava/util/List;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mOnChildAttachStateListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    :cond_9
    return-void
.end method

.method public clearOnScrollListeners()V
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollListeners:Ljava/util/List;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    :cond_9
    return-void
.end method

.method public computeHorizontalScrollExtent()I
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollHorizontally()Z

    move-result v0

    if-eqz v0, :cond_11

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->computeHorizontalScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    goto :goto_12

    :cond_11
    const/4 v0, 0x0

    :goto_12
    return v0
.end method

.method public computeHorizontalScrollOffset()I
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollHorizontally()Z

    move-result v0

    if-eqz v0, :cond_11

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->computeHorizontalScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    goto :goto_12

    :cond_11
    const/4 v0, 0x0

    :goto_12
    return v0
.end method

.method public computeHorizontalScrollRange()I
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollHorizontally()Z

    move-result v0

    if-eqz v0, :cond_11

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->computeHorizontalScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    goto :goto_12

    :cond_11
    const/4 v0, 0x0

    :goto_12
    return v0
.end method

.method public computeVerticalScrollExtent()I
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollVertically()Z

    move-result v0

    if-eqz v0, :cond_11

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->computeVerticalScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    goto :goto_12

    :cond_11
    const/4 v0, 0x0

    :goto_12
    return v0
.end method

.method public computeVerticalScrollOffset()I
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollVertically()Z

    move-result v0

    if-eqz v0, :cond_11

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->computeVerticalScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    goto :goto_12

    :cond_11
    const/4 v0, 0x0

    :goto_12
    return v0
.end method

.method public computeVerticalScrollRange()I
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollVertically()Z

    move-result v0

    if-eqz v0, :cond_11

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->computeVerticalScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    goto :goto_12

    :cond_11
    const/4 v0, 0x0

    :goto_12
    return v0
.end method

.method dispatchLayout()V
    .registers 22

    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    if-nez v1, :cond_e

    const-string v1, "RecyclerView"

    const-string v2, "No adapter attached; skipping layout"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_e
    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-nez v1, :cond_1a

    const-string v1, "RecyclerView"

    const-string v2, "No layout manager attached; skipping layout"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1a
    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v1, v1, Landroid/support/v7/widget/RecyclerView$State;->mDisappearingViewsInLayoutPass:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->eatRequestLayout()V

    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->onEnterLayoutOrScroll()V

    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->processAdapterUpdatesAndSetAnimationFlags()V

    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v2, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    # getter for: Landroid/support/v7/widget/RecyclerView$State;->mRunSimpleAnimations:Z
    invoke-static {v2}, Landroid/support/v7/widget/RecyclerView$State;->access$1800(Landroid/support/v7/widget/RecyclerView$State;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_45

    iget-boolean v2, v0, Landroid/support/v7/widget/RecyclerView;->mItemsChanged:Z

    if-eqz v2, :cond_45

    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->supportsChangeAnimations()Z

    move-result v2

    if-eqz v2, :cond_45

    new-instance v2, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v2}, Landroid/support/v4/util/ArrayMap;-><init>()V

    goto :goto_46

    :cond_45
    move-object v2, v3

    :goto_46
    iput-object v2, v1, Landroid/support/v7/widget/RecyclerView$State;->mOldChangedHolders:Landroid/support/v4/util/ArrayMap;

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/support/v7/widget/RecyclerView;->mItemsChanged:Z

    iput-boolean v1, v0, Landroid/support/v7/widget/RecyclerView;->mItemsAddedOrRemoved:Z

    const/4 v2, 0x0

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v5, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    # getter for: Landroid/support/v7/widget/RecyclerView$State;->mRunPredictiveAnimations:Z
    invoke-static {v5}, Landroid/support/v7/widget/RecyclerView$State;->access$1600(Landroid/support/v7/widget/RecyclerView$State;)Z

    move-result v5

    # setter for: Landroid/support/v7/widget/RecyclerView$State;->mInPreLayout:Z
    invoke-static {v4, v5}, Landroid/support/v7/widget/RecyclerView$State;->access$1702(Landroid/support/v7/widget/RecyclerView$State;Z)Z

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v5, v0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v5}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v5

    iput v5, v4, Landroid/support/v7/widget/RecyclerView$State;->mItemCount:I

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mMinMaxLayoutPositions:[I

    invoke-direct {v0, v4}, Landroid/support/v7/widget/RecyclerView;->findMinMaxChildLayoutPositions([I)V

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    # getter for: Landroid/support/v7/widget/RecyclerView$State;->mRunSimpleAnimations:Z
    invoke-static {v4}, Landroid/support/v7/widget/RecyclerView$State;->access$1800(Landroid/support/v7/widget/RecyclerView$State;)Z

    move-result v4

    if-eqz v4, :cond_c9

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v4, v4, Landroid/support/v7/widget/RecyclerView$State;->mPreLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v4}, Landroid/support/v4/util/ArrayMap;->clear()V

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v4, v4, Landroid/support/v7/widget/RecyclerView$State;->mPostLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v4}, Landroid/support/v4/util/ArrayMap;->clear()V

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/ChildHelper;->getChildCount()I

    move-result v4

    move v5, v1

    :goto_85
    if-ge v5, v4, :cond_c9

    iget-object v6, v0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v6, v5}, Landroid/support/v7/widget/ChildHelper;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-static {v6}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->shouldIgnore()Z

    move-result v7

    if-nez v7, :cond_c6

    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isInvalid()Z

    move-result v7

    if-eqz v7, :cond_a6

    iget-object v7, v0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v7}, Landroid/support/v7/widget/RecyclerView$Adapter;->hasStableIds()Z

    move-result v7

    if-nez v7, :cond_a6

    goto :goto_c6

    :cond_a6
    iget-object v13, v6, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v7, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v14, v7, Landroid/support/v7/widget/RecyclerView$State;->mPreLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    new-instance v15, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;

    invoke-virtual {v13}, Landroid/view/View;->getLeft()I

    move-result v9

    invoke-virtual {v13}, Landroid/view/View;->getTop()I

    move-result v10

    invoke-virtual {v13}, Landroid/view/View;->getRight()I

    move-result v11

    invoke-virtual {v13}, Landroid/view/View;->getBottom()I

    move-result v12

    move-object v7, v15

    move-object v8, v6

    invoke-direct/range {v7 .. v12}, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;-><init>(Landroid/support/v7/widget/RecyclerView$ViewHolder;IIII)V

    invoke-virtual {v14, v6, v15}, Landroid/support/v4/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_c6
    :goto_c6
    add-int/lit8 v5, v5, 0x1

    goto :goto_85

    :cond_c9
    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    # getter for: Landroid/support/v7/widget/RecyclerView$State;->mRunPredictiveAnimations:Z
    invoke-static {v4}, Landroid/support/v7/widget/RecyclerView$State;->access$1600(Landroid/support/v7/widget/RecyclerView$State;)Z

    move-result v4

    if-eqz v4, :cond_196

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->saveOldPositions()V

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v4, v4, Landroid/support/v7/widget/RecyclerView$State;->mOldChangedHolders:Landroid/support/v4/util/ArrayMap;

    if-eqz v4, :cond_118

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/ChildHelper;->getChildCount()I

    move-result v4

    move v5, v1

    :goto_e1
    if-ge v5, v4, :cond_118

    iget-object v6, v0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v6, v5}, Landroid/support/v7/widget/ChildHelper;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-static {v6}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isChanged()Z

    move-result v7

    if-eqz v7, :cond_115

    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isRemoved()Z

    move-result v7

    if-nez v7, :cond_115

    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->shouldIgnore()Z

    move-result v7

    if-nez v7, :cond_115

    invoke-virtual {v0, v6}, Landroid/support/v7/widget/RecyclerView;->getChangedHolderKey(Landroid/support/v7/widget/RecyclerView$ViewHolder;)J

    move-result-wide v7

    iget-object v9, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v9, v9, Landroid/support/v7/widget/RecyclerView$State;->mOldChangedHolders:Landroid/support/v4/util/ArrayMap;

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-virtual {v9, v10, v6}, Landroid/support/v4/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v9, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v9, v9, Landroid/support/v7/widget/RecyclerView$State;->mPreLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v9, v6}, Landroid/support/v4/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_115
    add-int/lit8 v5, v5, 0x1

    goto :goto_e1

    :cond_118
    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    # getter for: Landroid/support/v7/widget/RecyclerView$State;->mStructureChanged:Z
    invoke-static {v4}, Landroid/support/v7/widget/RecyclerView$State;->access$1400(Landroid/support/v7/widget/RecyclerView$State;)Z

    move-result v4

    iget-object v5, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    # setter for: Landroid/support/v7/widget/RecyclerView$State;->mStructureChanged:Z
    invoke-static {v5, v1}, Landroid/support/v7/widget/RecyclerView$State;->access$1402(Landroid/support/v7/widget/RecyclerView$State;Z)Z

    iget-object v5, v0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget-object v6, v0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    iget-object v7, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v5, v6, v7}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onLayoutChildren(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V

    iget-object v5, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    # setter for: Landroid/support/v7/widget/RecyclerView$State;->mStructureChanged:Z
    invoke-static {v5, v4}, Landroid/support/v7/widget/RecyclerView$State;->access$1402(Landroid/support/v7/widget/RecyclerView$State;Z)Z

    new-instance v5, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v5}, Landroid/support/v4/util/ArrayMap;-><init>()V

    move-object v2, v5

    move v5, v1

    :goto_138
    iget-object v6, v0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v6}, Landroid/support/v7/widget/ChildHelper;->getChildCount()I

    move-result v6

    if-ge v5, v6, :cond_18d

    const/4 v6, 0x0

    iget-object v7, v0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v7, v5}, Landroid/support/v7/widget/ChildHelper;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-static {v7}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v8

    invoke-virtual {v8}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->shouldIgnore()Z

    move-result v8

    if-eqz v8, :cond_152

    goto :goto_18a

    :cond_152
    move v8, v1

    :goto_153
    iget-object v9, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v9, v9, Landroid/support/v7/widget/RecyclerView$State;->mPreLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v9}, Landroid/support/v4/util/ArrayMap;->size()I

    move-result v9

    if-ge v8, v9, :cond_170

    iget-object v9, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v9, v9, Landroid/support/v7/widget/RecyclerView$State;->mPreLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v9, v8}, Landroid/support/v4/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v10, v9, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    if-ne v10, v7, :cond_16d

    const/4 v6, 0x1

    goto :goto_170

    :cond_16d
    add-int/lit8 v8, v8, 0x1

    goto :goto_153

    :cond_170
    :goto_170
    if-nez v6, :cond_18a

    new-instance v8, Landroid/graphics/Rect;

    invoke-virtual {v7}, Landroid/view/View;->getLeft()I

    move-result v9

    invoke-virtual {v7}, Landroid/view/View;->getTop()I

    move-result v10

    invoke-virtual {v7}, Landroid/view/View;->getRight()I

    move-result v11

    invoke-virtual {v7}, Landroid/view/View;->getBottom()I

    move-result v12

    invoke-direct {v8, v9, v10, v11, v12}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v2, v7, v8}, Landroid/support/v4/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_18a
    :goto_18a
    add-int/lit8 v5, v5, 0x1

    goto :goto_138

    :cond_18d
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->clearOldPositions()V

    iget-object v5, v0, Landroid/support/v7/widget/RecyclerView;->mAdapterHelper:Landroid/support/v7/widget/AdapterHelper;

    invoke-virtual {v5}, Landroid/support/v7/widget/AdapterHelper;->consumePostponedUpdates()V

    goto :goto_1e2

    :cond_196
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->clearOldPositions()V

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mAdapterHelper:Landroid/support/v7/widget/AdapterHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/AdapterHelper;->consumeUpdatesInOnePass()V

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v4, v4, Landroid/support/v7/widget/RecyclerView$State;->mOldChangedHolders:Landroid/support/v4/util/ArrayMap;

    if-eqz v4, :cond_1e2

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/ChildHelper;->getChildCount()I

    move-result v4

    move v5, v1

    :goto_1ab
    if-ge v5, v4, :cond_1e2

    iget-object v6, v0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v6, v5}, Landroid/support/v7/widget/ChildHelper;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-static {v6}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isChanged()Z

    move-result v7

    if-eqz v7, :cond_1df

    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isRemoved()Z

    move-result v7

    if-nez v7, :cond_1df

    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->shouldIgnore()Z

    move-result v7

    if-nez v7, :cond_1df

    invoke-virtual {v0, v6}, Landroid/support/v7/widget/RecyclerView;->getChangedHolderKey(Landroid/support/v7/widget/RecyclerView$ViewHolder;)J

    move-result-wide v7

    iget-object v9, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v9, v9, Landroid/support/v7/widget/RecyclerView$State;->mOldChangedHolders:Landroid/support/v4/util/ArrayMap;

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-virtual {v9, v10, v6}, Landroid/support/v4/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v9, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v9, v9, Landroid/support/v7/widget/RecyclerView$State;->mPreLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v9, v6}, Landroid/support/v4/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1df
    add-int/lit8 v5, v5, 0x1

    goto :goto_1ab

    :cond_1e2
    :goto_1e2
    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v5, v0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v5}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v5

    iput v5, v4, Landroid/support/v7/widget/RecyclerView$State;->mItemCount:I

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    # setter for: Landroid/support/v7/widget/RecyclerView$State;->mDeletedInvisibleItemCountSincePreviousLayout:I
    invoke-static {v4, v1}, Landroid/support/v7/widget/RecyclerView$State;->access$1202(Landroid/support/v7/widget/RecyclerView$State;I)I

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    # setter for: Landroid/support/v7/widget/RecyclerView$State;->mInPreLayout:Z
    invoke-static {v4, v1}, Landroid/support/v7/widget/RecyclerView$State;->access$1702(Landroid/support/v7/widget/RecyclerView$State;Z)Z

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget-object v5, v0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    iget-object v6, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v4, v5, v6}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onLayoutChildren(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    # setter for: Landroid/support/v7/widget/RecyclerView$State;->mStructureChanged:Z
    invoke-static {v4, v1}, Landroid/support/v7/widget/RecyclerView$State;->access$1402(Landroid/support/v7/widget/RecyclerView$State;Z)Z

    iput-object v3, v0, Landroid/support/v7/widget/RecyclerView;->mPendingSavedState:Landroid/support/v7/widget/RecyclerView$SavedState;

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v5, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    # getter for: Landroid/support/v7/widget/RecyclerView$State;->mRunSimpleAnimations:Z
    invoke-static {v5}, Landroid/support/v7/widget/RecyclerView$State;->access$1800(Landroid/support/v7/widget/RecyclerView$State;)Z

    move-result v5

    if-eqz v5, :cond_216

    iget-object v5, v0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    if-eqz v5, :cond_216

    const/4 v5, 0x1

    goto :goto_217

    :cond_216
    move v5, v1

    :goto_217
    # setter for: Landroid/support/v7/widget/RecyclerView$State;->mRunSimpleAnimations:Z
    invoke-static {v4, v5}, Landroid/support/v7/widget/RecyclerView$State;->access$1802(Landroid/support/v7/widget/RecyclerView$State;Z)Z

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    # getter for: Landroid/support/v7/widget/RecyclerView$State;->mRunSimpleAnimations:Z
    invoke-static {v4}, Landroid/support/v7/widget/RecyclerView$State;->access$1800(Landroid/support/v7/widget/RecyclerView$State;)Z

    move-result v4

    if-eqz v4, :cond_3e6

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v4, v4, Landroid/support/v7/widget/RecyclerView$State;->mOldChangedHolders:Landroid/support/v4/util/ArrayMap;

    if-eqz v4, :cond_22e

    new-instance v4, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v4}, Landroid/support/v4/util/ArrayMap;-><init>()V

    goto :goto_22f

    :cond_22e
    move-object v4, v3

    :goto_22f
    iget-object v5, v0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v5}, Landroid/support/v7/widget/ChildHelper;->getChildCount()I

    move-result v5

    move v7, v1

    :goto_236
    if-ge v7, v5, :cond_295

    iget-object v8, v0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v8, v7}, Landroid/support/v7/widget/ChildHelper;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    invoke-static {v8}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v8

    invoke-virtual {v8}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->shouldIgnore()Z

    move-result v9

    if-eqz v9, :cond_249

    goto :goto_291

    :cond_249
    iget-object v15, v8, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, v8}, Landroid/support/v7/widget/RecyclerView;->getChangedHolderKey(Landroid/support/v7/widget/RecyclerView$ViewHolder;)J

    move-result-wide v13

    if-eqz v4, :cond_267

    iget-object v9, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v9, v9, Landroid/support/v7/widget/RecyclerView$State;->mOldChangedHolders:Landroid/support/v4/util/ArrayMap;

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/support/v4/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_267

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v4, v9, v8}, Landroid/support/v4/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_291

    :cond_267
    iget-object v9, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v12, v9, Landroid/support/v7/widget/RecyclerView$State;->mPostLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    new-instance v11, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;

    invoke-virtual {v15}, Landroid/view/View;->getLeft()I

    move-result v16

    invoke-virtual {v15}, Landroid/view/View;->getTop()I

    move-result v17

    invoke-virtual {v15}, Landroid/view/View;->getRight()I

    move-result v18

    invoke-virtual {v15}, Landroid/view/View;->getBottom()I

    move-result v19

    move-object v9, v11

    move-object v10, v8

    move-object v6, v11

    move/from16 v11, v16

    move-object v3, v12

    move/from16 v12, v17

    move-wide/from16 v16, v13

    move/from16 v13, v18

    move/from16 v14, v19

    invoke-direct/range {v9 .. v14}, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;-><init>(Landroid/support/v7/widget/RecyclerView$ViewHolder;IIII)V

    invoke-virtual {v3, v8, v6}, Landroid/support/v4/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_291
    add-int/lit8 v7, v7, 0x1

    const/4 v3, 0x0

    goto :goto_236

    :cond_295
    invoke-direct {v0, v2}, Landroid/support/v7/widget/RecyclerView;->processDisappearingList(Landroid/support/v4/util/ArrayMap;)V

    iget-object v3, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v3, v3, Landroid/support/v7/widget/RecyclerView$State;->mPreLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v3}, Landroid/support/v4/util/ArrayMap;->size()I

    move-result v3

    add-int/lit8 v6, v3, -0x1

    :goto_2a2
    if-ltz v6, :cond_2da

    iget-object v7, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v7, v7, Landroid/support/v7/widget/RecyclerView$State;->mPreLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v7, v6}, Landroid/support/v4/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v8, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v8, v8, Landroid/support/v7/widget/RecyclerView$State;->mPostLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v8, v7}, Landroid/support/v4/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2d7

    iget-object v8, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v8, v8, Landroid/support/v7/widget/RecyclerView$State;->mPreLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v8, v6}, Landroid/support/v4/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;

    iget-object v9, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v9, v9, Landroid/support/v7/widget/RecyclerView$State;->mPreLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v9, v6}, Landroid/support/v4/util/ArrayMap;->removeAt(I)Ljava/lang/Object;

    iget-object v9, v8, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v9, v9, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v10, v0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    iget-object v11, v8, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {v10, v11}, Landroid/support/v7/widget/RecyclerView$Recycler;->unscrapView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    invoke-direct {v0, v8}, Landroid/support/v7/widget/RecyclerView;->animateDisappearance(Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;)V

    :cond_2d7
    add-int/lit8 v6, v6, -0x1

    goto :goto_2a2

    :cond_2da
    iget-object v6, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v6, v6, Landroid/support/v7/widget/RecyclerView$State;->mPostLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v6}, Landroid/support/v4/util/ArrayMap;->size()I

    move-result v6

    if-lez v6, :cond_32d

    add-int/lit8 v7, v6, -0x1

    :goto_2e6
    if-ltz v7, :cond_32d

    iget-object v8, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v8, v8, Landroid/support/v7/widget/RecyclerView$State;->mPostLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v8, v7}, Landroid/support/v4/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v9, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v9, v9, Landroid/support/v7/widget/RecyclerView$State;->mPostLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v9, v7}, Landroid/support/v4/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;

    iget-object v10, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v10, v10, Landroid/support/v7/widget/RecyclerView$State;->mPreLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v10}, Landroid/support/v4/util/ArrayMap;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_310

    iget-object v10, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v10, v10, Landroid/support/v7/widget/RecyclerView$State;->mPreLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v10, v8}, Landroid/support/v4/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_32a

    :cond_310
    iget-object v10, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v10, v10, Landroid/support/v7/widget/RecyclerView$State;->mPostLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v10, v7}, Landroid/support/v4/util/ArrayMap;->removeAt(I)Ljava/lang/Object;

    if-eqz v2, :cond_322

    iget-object v10, v8, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2, v10}, Landroid/support/v4/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/graphics/Rect;

    goto :goto_323

    :cond_322
    const/4 v10, 0x0

    :goto_323
    iget v11, v9, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->left:I

    iget v12, v9, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->top:I

    invoke-direct {v0, v8, v10, v11, v12}, Landroid/support/v7/widget/RecyclerView;->animateAppearance(Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/graphics/Rect;II)V

    :cond_32a
    add-int/lit8 v7, v7, -0x1

    goto :goto_2e6

    :cond_32d
    iget-object v7, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v7, v7, Landroid/support/v7/widget/RecyclerView$State;->mPostLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v7}, Landroid/support/v4/util/ArrayMap;->size()I

    move-result v5

    move v7, v1

    :goto_336
    if-ge v7, v5, :cond_388

    iget-object v8, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v8, v8, Landroid/support/v7/widget/RecyclerView$State;->mPostLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v8, v7}, Landroid/support/v4/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v9, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v9, v9, Landroid/support/v7/widget/RecyclerView$State;->mPostLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v9, v7}, Landroid/support/v4/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v9

    move-object v15, v9

    check-cast v15, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;

    iget-object v9, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v9, v9, Landroid/support/v7/widget/RecyclerView$State;->mPreLayoutHolderMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v9, v8}, Landroid/support/v4/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    move-object v14, v9

    check-cast v14, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;

    if-eqz v14, :cond_385

    if-eqz v15, :cond_385

    iget v9, v14, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->left:I

    iget v10, v15, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->left:I

    if-ne v9, v10, :cond_368

    iget v9, v14, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->top:I

    iget v10, v15, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->top:I

    if-eq v9, v10, :cond_385

    :cond_368
    invoke-virtual {v8, v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->setIsRecyclable(Z)V

    iget-object v9, v0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    iget v11, v14, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->left:I

    iget v12, v14, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->top:I

    iget v13, v15, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->left:I

    iget v10, v15, Landroid/support/v7/widget/RecyclerView$ItemHolderInfo;->top:I

    move/from16 v16, v10

    move-object v10, v8

    move-object/from16 v17, v14

    move/from16 v14, v16

    invoke-virtual/range {v9 .. v14}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->animateMove(Landroid/support/v7/widget/RecyclerView$ViewHolder;IIII)Z

    move-result v9

    if-eqz v9, :cond_385

    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->postAnimationRunner()V

    :cond_385
    add-int/lit8 v7, v7, 0x1

    goto :goto_336

    :cond_388
    iget-object v7, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v7, v7, Landroid/support/v7/widget/RecyclerView$State;->mOldChangedHolders:Landroid/support/v4/util/ArrayMap;

    if-eqz v7, :cond_397

    iget-object v7, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v7, v7, Landroid/support/v7/widget/RecyclerView$State;->mOldChangedHolders:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v7}, Landroid/support/v4/util/ArrayMap;->size()I

    move-result v7

    goto :goto_398

    :cond_397
    move v7, v1

    :goto_398
    move v5, v7

    add-int/lit8 v7, v5, -0x1

    :goto_39b
    if-ltz v7, :cond_3e6

    iget-object v8, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v8, v8, Landroid/support/v7/widget/RecyclerView$State;->mOldChangedHolders:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v8, v7}, Landroid/support/v4/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Long;

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    iget-object v10, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v10, v10, Landroid/support/v7/widget/RecyclerView$State;->mOldChangedHolders:Landroid/support/v4/util/ArrayMap;

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/support/v4/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v11, v10, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v10}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->shouldIgnore()Z

    move-result v12

    if-eqz v12, :cond_3c2

    goto :goto_3e3

    :cond_3c2
    iget-object v12, v0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    # getter for: Landroid/support/v7/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;
    invoke-static {v12}, Landroid/support/v7/widget/RecyclerView$Recycler;->access$2000(Landroid/support/v7/widget/RecyclerView$Recycler;)Ljava/util/ArrayList;

    move-result-object v12

    if-eqz v12, :cond_3e3

    iget-object v12, v0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    # getter for: Landroid/support/v7/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;
    invoke-static {v12}, Landroid/support/v7/widget/RecyclerView$Recycler;->access$2000(Landroid/support/v7/widget/RecyclerView$Recycler;)Ljava/util/ArrayList;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_3e3

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    invoke-virtual {v4, v12}, Landroid/support/v4/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-direct {v0, v10, v12}, Landroid/support/v7/widget/RecyclerView;->animateChange(Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    :cond_3e3
    :goto_3e3
    add-int/lit8 v7, v7, -0x1

    goto :goto_39b

    :cond_3e6
    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->resumeRequestLayout(Z)V

    iget-object v3, v0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->removeAndRecycleScrapInt(Landroid/support/v7/widget/RecyclerView$Recycler;)V

    iget-object v3, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget v4, v4, Landroid/support/v7/widget/RecyclerView$State;->mItemCount:I

    # setter for: Landroid/support/v7/widget/RecyclerView$State;->mPreviousLayoutItemCount:I
    invoke-static {v3, v4}, Landroid/support/v7/widget/RecyclerView$State;->access$2102(Landroid/support/v7/widget/RecyclerView$State;I)I

    iput-boolean v1, v0, Landroid/support/v7/widget/RecyclerView;->mDataSetHasChangedAfterLayout:Z

    iget-object v3, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    # setter for: Landroid/support/v7/widget/RecyclerView$State;->mRunSimpleAnimations:Z
    invoke-static {v3, v1}, Landroid/support/v7/widget/RecyclerView$State;->access$1802(Landroid/support/v7/widget/RecyclerView$State;Z)Z

    iget-object v3, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    # setter for: Landroid/support/v7/widget/RecyclerView$State;->mRunPredictiveAnimations:Z
    invoke-static {v3, v1}, Landroid/support/v7/widget/RecyclerView$State;->access$1602(Landroid/support/v7/widget/RecyclerView$State;Z)Z

    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->onExitLayoutOrScroll()V

    iget-object v3, v0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    # setter for: Landroid/support/v7/widget/RecyclerView$LayoutManager;->mRequestedSimpleAnimations:Z
    invoke-static {v3, v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->access$1902(Landroid/support/v7/widget/RecyclerView$LayoutManager;Z)Z

    iget-object v3, v0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    # getter for: Landroid/support/v7/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;
    invoke-static {v3}, Landroid/support/v7/widget/RecyclerView$Recycler;->access$2000(Landroid/support/v7/widget/RecyclerView$Recycler;)Ljava/util/ArrayList;

    move-result-object v3

    if-eqz v3, :cond_41e

    iget-object v3, v0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    # getter for: Landroid/support/v7/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;
    invoke-static {v3}, Landroid/support/v7/widget/RecyclerView$Recycler;->access$2000(Landroid/support/v7/widget/RecyclerView$Recycler;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    :cond_41e
    iget-object v3, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    const/4 v4, 0x0

    iput-object v4, v3, Landroid/support/v7/widget/RecyclerView$State;->mOldChangedHolders:Landroid/support/v4/util/ArrayMap;

    iget-object v3, v0, Landroid/support/v7/widget/RecyclerView;->mMinMaxLayoutPositions:[I

    aget v3, v3, v1

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mMinMaxLayoutPositions:[I

    const/4 v5, 0x1

    aget v4, v4, v5

    invoke-direct {v0, v3, v4}, Landroid/support/v7/widget/RecyclerView;->didChildRangeChange(II)Z

    move-result v3

    if-eqz v3, :cond_435

    invoke-virtual {v0, v1, v1}, Landroid/support/v7/widget/RecyclerView;->dispatchOnScrolled(II)V

    :cond_435
    return-void
.end method

.method public dispatchNestedFling(FFZ)Z
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollingChildHelper:Landroid/support/v4/view/NestedScrollingChildHelper;

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v4/view/NestedScrollingChildHelper;->dispatchNestedFling(FFZ)Z

    move-result v0

    return v0
.end method

.method public dispatchNestedPreFling(FF)Z
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollingChildHelper:Landroid/support/v4/view/NestedScrollingChildHelper;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/view/NestedScrollingChildHelper;->dispatchNestedPreFling(FF)Z

    move-result v0

    return v0
.end method

.method public dispatchNestedPreScroll(II[I[I)Z
    .registers 6

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollingChildHelper:Landroid/support/v4/view/NestedScrollingChildHelper;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/support/v4/view/NestedScrollingChildHelper;->dispatchNestedPreScroll(II[I[I)Z

    move-result v0

    return v0
.end method

.method public dispatchNestedScroll(IIII[I)Z
    .registers 12

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollingChildHelper:Landroid/support/v4/view/NestedScrollingChildHelper;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Landroid/support/v4/view/NestedScrollingChildHelper;->dispatchNestedScroll(IIII[I)Z

    move-result v0

    return v0
.end method

.method dispatchOnScrollStateChanged(I)V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onScrollStateChanged(I)V

    :cond_9
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView;->onScrollStateChanged(I)V

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    if-eqz v0, :cond_15

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    invoke-virtual {v0, p0, p1}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;->onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V

    :cond_15
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollListeners:Ljava/util/List;

    if-eqz v0, :cond_31

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_21
    if-ltz v0, :cond_31

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mScrollListeners:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    invoke-virtual {v1, p0, p1}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;->onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_21

    :cond_31
    return-void
.end method

.method dispatchOnScrolled(II)V
    .registers 7

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getScrollX()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getScrollY()I

    move-result v1

    invoke-virtual {p0, v0, v1, v0, v1}, Landroid/support/v7/widget/RecyclerView;->onScrollChanged(IIII)V

    invoke-virtual {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView;->onScrolled(II)V

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    if-eqz v2, :cond_17

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    invoke-virtual {v2, p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;->onScrolled(Landroid/support/v7/widget/RecyclerView;II)V

    :cond_17
    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mScrollListeners:Ljava/util/List;

    if-eqz v2, :cond_33

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mScrollListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    :goto_23
    if-ltz v2, :cond_33

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mScrollListeners:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    invoke-virtual {v3, p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;->onScrolled(Landroid/support/v7/widget/RecyclerView;II)V

    add-int/lit8 v2, v2, -0x1

    goto :goto_23

    :cond_33
    return-void
.end method

.method protected dispatchRestoreInstanceState(Landroid/util/SparseArray;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Landroid/os/Parcelable;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView;->dispatchThawSelfOnly(Landroid/util/SparseArray;)V

    return-void
.end method

.method protected dispatchSaveInstanceState(Landroid/util/SparseArray;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Landroid/os/Parcelable;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView;->dispatchFreezeSelfOnly(Landroid/util/SparseArray;)V

    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 11

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->draw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemDecorations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_b
    if-ge v2, v0, :cond_1d

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mItemDecorations:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/RecyclerView$ItemDecoration;

    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v3, p1, p0, v4}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;->onDrawOver(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    :cond_1d
    const/4 v2, 0x0

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mLeftGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    const/4 v4, 0x1

    if-eqz v3, :cond_5c

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mLeftGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v3}, Landroid/support/v4/widget/EdgeEffectCompat;->isFinished()Z

    move-result v3

    if-nez v3, :cond_5c

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v3

    iget-boolean v5, p0, Landroid/support/v7/widget/RecyclerView;->mClipToPadding:Z

    if-eqz v5, :cond_38

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getPaddingBottom()I

    move-result v5

    goto :goto_39

    :cond_38
    move v5, v1

    :goto_39
    const/high16 v6, 0x43870000    # 270.0f

    invoke-virtual {p1, v6}, Landroid/graphics/Canvas;->rotate(F)V

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getHeight()I

    move-result v6

    neg-int v6, v6

    add-int/2addr v6, v5

    int-to-float v6, v6

    const/4 v7, 0x0

    invoke-virtual {p1, v6, v7}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v6, p0, Landroid/support/v7/widget/RecyclerView;->mLeftGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    if-eqz v6, :cond_57

    iget-object v6, p0, Landroid/support/v7/widget/RecyclerView;->mLeftGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v6, p1}, Landroid/support/v4/widget/EdgeEffectCompat;->draw(Landroid/graphics/Canvas;)Z

    move-result v6

    if-eqz v6, :cond_57

    move v6, v4

    goto :goto_58

    :cond_57
    move v6, v1

    :goto_58
    move v2, v6

    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_5c
    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mTopGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    if-eqz v3, :cond_90

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mTopGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v3}, Landroid/support/v4/widget/EdgeEffectCompat;->isFinished()Z

    move-result v3

    if-nez v3, :cond_90

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v3

    iget-boolean v5, p0, Landroid/support/v7/widget/RecyclerView;->mClipToPadding:Z

    if-eqz v5, :cond_7d

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getPaddingLeft()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getPaddingTop()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->translate(FF)V

    :cond_7d
    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView;->mTopGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    if-eqz v5, :cond_8b

    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView;->mTopGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v5, p1}, Landroid/support/v4/widget/EdgeEffectCompat;->draw(Landroid/graphics/Canvas;)Z

    move-result v5

    if-eqz v5, :cond_8b

    move v5, v4

    goto :goto_8c

    :cond_8b
    move v5, v1

    :goto_8c
    or-int/2addr v2, v5

    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_90
    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mRightGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    if-eqz v3, :cond_cd

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mRightGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v3}, Landroid/support/v4/widget/EdgeEffectCompat;->isFinished()Z

    move-result v3

    if-nez v3, :cond_cd

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v3

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v5

    iget-boolean v6, p0, Landroid/support/v7/widget/RecyclerView;->mClipToPadding:Z

    if-eqz v6, :cond_ad

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getPaddingTop()I

    move-result v6

    goto :goto_ae

    :cond_ad
    move v6, v1

    :goto_ae
    const/high16 v7, 0x42b40000    # 90.0f

    invoke-virtual {p1, v7}, Landroid/graphics/Canvas;->rotate(F)V

    neg-int v7, v6

    int-to-float v7, v7

    neg-int v8, v5

    int-to-float v8, v8

    invoke-virtual {p1, v7, v8}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v7, p0, Landroid/support/v7/widget/RecyclerView;->mRightGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    if-eqz v7, :cond_c8

    iget-object v7, p0, Landroid/support/v7/widget/RecyclerView;->mRightGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v7, p1}, Landroid/support/v4/widget/EdgeEffectCompat;->draw(Landroid/graphics/Canvas;)Z

    move-result v7

    if-eqz v7, :cond_c8

    move v7, v4

    goto :goto_c9

    :cond_c8
    move v7, v1

    :goto_c9
    or-int/2addr v2, v7

    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_cd
    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mBottomGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    if-eqz v3, :cond_121

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mBottomGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v3}, Landroid/support/v4/widget/EdgeEffectCompat;->isFinished()Z

    move-result v3

    if-nez v3, :cond_121

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v3

    const/high16 v5, 0x43340000    # 180.0f

    invoke-virtual {p1, v5}, Landroid/graphics/Canvas;->rotate(F)V

    iget-boolean v5, p0, Landroid/support/v7/widget/RecyclerView;->mClipToPadding:Z

    if-eqz v5, :cond_100

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v5

    neg-int v5, v5

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getPaddingRight()I

    move-result v6

    add-int/2addr v5, v6

    int-to-float v5, v5

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getHeight()I

    move-result v6

    neg-int v6, v6

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getPaddingBottom()I

    move-result v7

    add-int/2addr v6, v7

    int-to-float v6, v6

    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->translate(FF)V

    goto :goto_10f

    :cond_100
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v5

    neg-int v5, v5

    int-to-float v5, v5

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getHeight()I

    move-result v6

    neg-int v6, v6

    int-to-float v6, v6

    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->translate(FF)V

    :goto_10f
    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView;->mBottomGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    if-eqz v5, :cond_11d

    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView;->mBottomGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v5, p1}, Landroid/support/v4/widget/EdgeEffectCompat;->draw(Landroid/graphics/Canvas;)Z

    move-result v5

    if-eqz v5, :cond_11d

    move v1, v4

    nop

    :cond_11d
    or-int/2addr v2, v1

    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_121
    if-nez v2, :cond_138

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    if-eqz v1, :cond_138

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mItemDecorations:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_138

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_138

    const/4 v2, 0x1

    :cond_138
    if-eqz v2, :cond_13d

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    :cond_13d
    return-void
.end method

.method public drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .registers 6

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result v0

    return v0
.end method

.method eatRequestLayout()V
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mEatRequestLayout:Z

    if-nez v0, :cond_e

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mEatRequestLayout:Z

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutFrozen:Z

    if-nez v0, :cond_e

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutRequestEaten:Z

    :cond_e
    return-void
.end method

.method ensureBottomGlow()V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mBottomGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    if-eqz v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/widget/EdgeEffectCompat;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mBottomGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mClipToPadding:Z

    if-eqz v0, :cond_36

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mBottomGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getMeasuredWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getMeasuredHeight()I

    move-result v2

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getPaddingTop()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getPaddingBottom()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/widget/EdgeEffectCompat;->setSize(II)V

    goto :goto_43

    :cond_36
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mBottomGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getMeasuredWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getMeasuredHeight()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/widget/EdgeEffectCompat;->setSize(II)V

    :goto_43
    return-void
.end method

.method ensureLeftGlow()V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLeftGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    if-eqz v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/widget/EdgeEffectCompat;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLeftGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mClipToPadding:Z

    if-eqz v0, :cond_36

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLeftGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getMeasuredHeight()I

    move-result v1

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getPaddingTop()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getPaddingBottom()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getMeasuredWidth()I

    move-result v2

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getPaddingLeft()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getPaddingRight()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/widget/EdgeEffectCompat;->setSize(II)V

    goto :goto_43

    :cond_36
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLeftGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getMeasuredHeight()I

    move-result v1

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getMeasuredWidth()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/widget/EdgeEffectCompat;->setSize(II)V

    :goto_43
    return-void
.end method

.method ensureRightGlow()V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mRightGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    if-eqz v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/widget/EdgeEffectCompat;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mRightGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mClipToPadding:Z

    if-eqz v0, :cond_36

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mRightGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getMeasuredHeight()I

    move-result v1

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getPaddingTop()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getPaddingBottom()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getMeasuredWidth()I

    move-result v2

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getPaddingLeft()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getPaddingRight()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/widget/EdgeEffectCompat;->setSize(II)V

    goto :goto_43

    :cond_36
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mRightGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getMeasuredHeight()I

    move-result v1

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getMeasuredWidth()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/widget/EdgeEffectCompat;->setSize(II)V

    :goto_43
    return-void
.end method

.method ensureTopGlow()V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mTopGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    if-eqz v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/widget/EdgeEffectCompat;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mTopGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mClipToPadding:Z

    if-eqz v0, :cond_36

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mTopGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getMeasuredWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getMeasuredHeight()I

    move-result v2

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getPaddingTop()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getPaddingBottom()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/widget/EdgeEffectCompat;->setSize(II)V

    goto :goto_43

    :cond_36
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mTopGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getMeasuredWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getMeasuredHeight()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/widget/EdgeEffectCompat;->setSize(II)V

    :goto_43
    return-void
.end method

.method public findChildViewUnder(FF)Landroid/view/View;
    .registers 9

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/ChildHelper;->getChildCount()I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    :goto_8
    if-ltz v1, :cond_44

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/ChildHelper;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Landroid/support/v4/view/ViewCompat;->getTranslationX(Landroid/view/View;)F

    move-result v3

    invoke-static {v2}, Landroid/support/v4/view/ViewCompat;->getTranslationY(Landroid/view/View;)F

    move-result v4

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v5, v3

    cmpl-float v5, p1, v5

    if-ltz v5, :cond_41

    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v5, v3

    cmpg-float v5, p1, v5

    if-gtz v5, :cond_41

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v5, v4

    cmpl-float v5, p2, v5

    if-ltz v5, :cond_41

    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v5, v4

    cmpg-float v5, p2, v5

    if-gtz v5, :cond_41

    return-object v2

    :cond_41
    add-int/lit8 v1, v1, -0x1

    goto :goto_8

    :cond_44
    const/4 v1, 0x0

    return-object v1
.end method

.method public findViewHolderForAdapterPosition(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 7

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mDataSetHasChangedAfterLayout:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    return-object v1

    :cond_6
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/ChildHelper;->getUnfilteredChildCount()I

    move-result v0

    const/4 v2, 0x0

    :goto_d
    if-ge v2, v0, :cond_2b

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v3, v2}, Landroid/support/v7/widget/ChildHelper;->getUnfilteredChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v3

    if-eqz v3, :cond_28

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isRemoved()Z

    move-result v4

    if-nez v4, :cond_28

    invoke-direct {p0, v3}, Landroid/support/v7/widget/RecyclerView;->getAdapterPositionFor(Landroid/support/v7/widget/RecyclerView$ViewHolder;)I

    move-result v4

    if-ne v4, p1, :cond_28

    return-object v3

    :cond_28
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    :cond_2b
    return-object v1
.end method

.method public findViewHolderForItemId(J)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 8

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/ChildHelper;->getUnfilteredChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_21

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/ChildHelper;->getUnfilteredChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v2

    if-eqz v2, :cond_1e

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getItemId()J

    move-result-wide v3

    cmp-long v3, v3, p1

    if-nez v3, :cond_1e

    return-object v2

    :cond_1e
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_21
    const/4 v1, 0x0

    return-object v1
.end method

.method public findViewHolderForLayoutPosition(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 3

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/support/v7/widget/RecyclerView;->findViewHolderForPosition(IZ)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public findViewHolderForPosition(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/support/v7/widget/RecyclerView;->findViewHolderForPosition(IZ)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method findViewHolderForPosition(IZ)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 7

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/ChildHelper;->getUnfilteredChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_2c

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/ChildHelper;->getUnfilteredChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v2

    if-eqz v2, :cond_29

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isRemoved()Z

    move-result v3

    if-nez v3, :cond_29

    if-eqz p2, :cond_22

    iget v3, v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    if-ne v3, p1, :cond_29

    return-object v2

    :cond_22
    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getLayoutPosition()I

    move-result v3

    if-ne v3, p1, :cond_29

    return-object v2

    :cond_29
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_2c
    const/4 v1, 0x0

    return-object v1
.end method

.method public fling(II)Z
    .registers 10

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    const/4 v1, 0x0

    if-nez v0, :cond_d

    const-string v0, "RecyclerView"

    const-string v2, "Cannot fling without a LayoutManager set. Call setLayoutManager with a non-null argument."

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_d
    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutFrozen:Z

    if-eqz v0, :cond_12

    return v1

    :cond_12
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollHorizontally()Z

    move-result v0

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollVertically()Z

    move-result v2

    if-eqz v0, :cond_28

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v3

    iget v4, p0, Landroid/support/v7/widget/RecyclerView;->mMinFlingVelocity:I

    if-ge v3, v4, :cond_29

    :cond_28
    const/4 p1, 0x0

    :cond_29
    if-eqz v2, :cond_33

    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result v3

    iget v4, p0, Landroid/support/v7/widget/RecyclerView;->mMinFlingVelocity:I

    if-ge v3, v4, :cond_34

    :cond_33
    const/4 p2, 0x0

    :cond_34
    if-nez p1, :cond_39

    if-nez p2, :cond_39

    return v1

    :cond_39
    int-to-float v3, p1

    int-to-float v4, p2

    invoke-virtual {p0, v3, v4}, Landroid/support/v7/widget/RecyclerView;->dispatchNestedPreFling(FF)Z

    move-result v3

    if-nez v3, :cond_71

    const/4 v3, 0x1

    if-nez v0, :cond_49

    if-eqz v2, :cond_47

    goto :goto_49

    :cond_47
    move v4, v1

    goto :goto_4a

    :cond_49
    :goto_49
    move v4, v3

    :goto_4a
    int-to-float v5, p1

    int-to-float v6, p2

    invoke-virtual {p0, v5, v6, v4}, Landroid/support/v7/widget/RecyclerView;->dispatchNestedFling(FFZ)Z

    if-eqz v4, :cond_71

    iget v1, p0, Landroid/support/v7/widget/RecyclerView;->mMaxFlingVelocity:I

    neg-int v1, v1

    iget v5, p0, Landroid/support/v7/widget/RecyclerView;->mMaxFlingVelocity:I

    invoke-static {p1, v5}, Ljava/lang/Math;->min(II)I

    move-result v5

    invoke-static {v1, v5}, Ljava/lang/Math;->max(II)I

    move-result p1

    iget v1, p0, Landroid/support/v7/widget/RecyclerView;->mMaxFlingVelocity:I

    neg-int v1, v1

    iget v5, p0, Landroid/support/v7/widget/RecyclerView;->mMaxFlingVelocity:I

    invoke-static {p2, v5}, Ljava/lang/Math;->min(II)I

    move-result v5

    invoke-static {v1, v5}, Ljava/lang/Math;->max(II)I

    move-result p2

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mViewFlinger:Landroid/support/v7/widget/RecyclerView$ViewFlinger;

    invoke-virtual {v1, p1, p2}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->fling(II)V

    return v3

    :cond_71
    return v1
.end method

.method public focusSearch(Landroid/view/View;I)Landroid/view/View;
    .registers 8

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onInterceptFocusSearch(Landroid/view/View;I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_9

    return-object v0

    :cond_9
    invoke-static {}, Landroid/view/FocusFinder;->getInstance()Landroid/view/FocusFinder;

    move-result-object v1

    invoke-virtual {v1, p0, p1, p2}, Landroid/view/FocusFinder;->findNextFocus(Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_36

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    if-eqz v2, :cond_36

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-eqz v2, :cond_36

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->isComputingLayout()Z

    move-result v2

    if-nez v2, :cond_36

    iget-boolean v2, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutFrozen:Z

    if-nez v2, :cond_36

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->eatRequestLayout()V

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v2, p1, p2, v3, v4}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onFocusSearchFailed(Landroid/view/View;ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)Landroid/view/View;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Landroid/support/v7/widget/RecyclerView;->resumeRequestLayout(Z)V

    :cond_36
    if-eqz v0, :cond_3a

    move-object v2, v0

    goto :goto_3e

    :cond_3a
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->focusSearch(Landroid/view/View;I)Landroid/view/View;

    move-result-object v2

    :goto_3e
    return-object v2
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->generateDefaultLayoutParams()Landroid/support/v7/widget/RecyclerView$LayoutParams;

    move-result-object v0

    return-object v0

    :cond_b
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "RecyclerView has no LayoutManager"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-eqz v0, :cond_f

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->generateLayoutParams(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/support/v7/widget/RecyclerView$LayoutParams;

    move-result-object v0

    return-object v0

    :cond_f
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "RecyclerView has no LayoutManager"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/support/v7/widget/RecyclerView$LayoutParams;

    move-result-object v0

    return-object v0

    :cond_b
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "RecyclerView has no LayoutManager"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    return-object v0
.end method

.method public getBaseline()I
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getBaseline()I

    move-result v0

    return v0

    :cond_b
    invoke-super {p0}, Landroid/view/ViewGroup;->getBaseline()I

    move-result v0

    return v0
.end method

.method getChangedHolderKey(Landroid/support/v7/widget/RecyclerView$ViewHolder;)J
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->hasStableIds()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getItemId()J

    move-result-wide v0

    goto :goto_10

    :cond_d
    iget v0, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    int-to-long v0, v0

    :goto_10
    return-wide v0
.end method

.method public getChildAdapterPosition(Landroid/view/View;)I
    .registers 4

    invoke-static {p1}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    if-eqz v0, :cond_b

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v1

    goto :goto_c

    :cond_b
    const/4 v1, -0x1

    :goto_c
    return v1
.end method

.method protected getChildDrawingOrder(II)I
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mChildDrawingOrderCallback:Landroid/support/v7/widget/RecyclerView$ChildDrawingOrderCallback;

    if-nez v0, :cond_9

    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->getChildDrawingOrder(II)I

    move-result v0

    return v0

    :cond_9
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mChildDrawingOrderCallback:Landroid/support/v7/widget/RecyclerView$ChildDrawingOrderCallback;

    invoke-interface {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView$ChildDrawingOrderCallback;->onGetChildDrawingOrder(II)I

    move-result v0

    return v0
.end method

.method public getChildItemId(Landroid/view/View;)J
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    const-wide/16 v1, -0x1

    if-eqz v0, :cond_1b

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->hasStableIds()Z

    move-result v0

    if-nez v0, :cond_f

    goto :goto_1b

    :cond_f
    invoke-static {p1}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    if-eqz v0, :cond_1a

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getItemId()J

    move-result-wide v1

    nop

    :cond_1a
    return-wide v1

    :cond_1b
    :goto_1b
    return-wide v1
.end method

.method public getChildLayoutPosition(Landroid/view/View;)I
    .registers 4

    invoke-static {p1}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    if-eqz v0, :cond_b

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getLayoutPosition()I

    move-result v1

    goto :goto_c

    :cond_b
    const/4 v1, -0x1

    :goto_c
    return v1
.end method

.method public getChildPosition(Landroid/view/View;)I
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v0

    return v0
.end method

.method public getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 6

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_28

    if-ne v0, p0, :cond_9

    goto :goto_28

    :cond_9
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "View "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " is not a direct child of "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_28
    :goto_28
    invoke-static {p1}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v1

    return-object v1
.end method

.method public getCompatAccessibilityDelegate()Landroid/support/v7/widget/RecyclerViewAccessibilityDelegate;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAccessibilityDelegate:Landroid/support/v7/widget/RecyclerViewAccessibilityDelegate;

    return-object v0
.end method

.method public getItemAnimator()Landroid/support/v7/widget/RecyclerView$ItemAnimator;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    return-object v0
.end method

.method getItemDecorInsetsForChild(Landroid/view/View;)Landroid/graphics/Rect;
    .registers 10

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    iget-boolean v1, v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;->mInsetsDirty:Z

    if-nez v1, :cond_d

    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;->mDecorInsets:Landroid/graphics/Rect;

    return-object v1

    :cond_d
    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;->mDecorInsets:Landroid/graphics/Rect;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v2, v2, v2}, Landroid/graphics/Rect;->set(IIII)V

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mItemDecorations:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v4, v2

    :goto_1a
    if-ge v4, v3, :cond_57

    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v5, v2, v2, v2, v2}, Landroid/graphics/Rect;->set(IIII)V

    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView;->mItemDecorations:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/v7/widget/RecyclerView$ItemDecoration;

    iget-object v6, p0, Landroid/support/v7/widget/RecyclerView;->mTempRect:Landroid/graphics/Rect;

    iget-object v7, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v5, v6, p1, p0, v7}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;->getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V

    iget v5, v1, Landroid/graphics/Rect;->left:I

    iget-object v6, p0, Landroid/support/v7/widget/RecyclerView;->mTempRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->left:I

    add-int/2addr v5, v6

    iput v5, v1, Landroid/graphics/Rect;->left:I

    iget v5, v1, Landroid/graphics/Rect;->top:I

    iget-object v6, p0, Landroid/support/v7/widget/RecyclerView;->mTempRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->top:I

    add-int/2addr v5, v6

    iput v5, v1, Landroid/graphics/Rect;->top:I

    iget v5, v1, Landroid/graphics/Rect;->right:I

    iget-object v6, p0, Landroid/support/v7/widget/RecyclerView;->mTempRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->right:I

    add-int/2addr v5, v6

    iput v5, v1, Landroid/graphics/Rect;->right:I

    iget v5, v1, Landroid/graphics/Rect;->bottom:I

    iget-object v6, p0, Landroid/support/v7/widget/RecyclerView;->mTempRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v5, v6

    iput v5, v1, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v4, v4, 0x1

    goto :goto_1a

    :cond_57
    iput-boolean v2, v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;->mInsetsDirty:Z

    return-object v1
.end method

.method public getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    return-object v0
.end method

.method public getMaxFlingVelocity()I
    .registers 2

    iget v0, p0, Landroid/support/v7/widget/RecyclerView;->mMaxFlingVelocity:I

    return v0
.end method

.method public getMinFlingVelocity()I
    .registers 2

    iget v0, p0, Landroid/support/v7/widget/RecyclerView;->mMinFlingVelocity:I

    return v0
.end method

.method public getRecycledViewPool()Landroid/support/v7/widget/RecyclerView$RecycledViewPool;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Recycler;->getRecycledViewPool()Landroid/support/v7/widget/RecyclerView$RecycledViewPool;

    move-result-object v0

    return-object v0
.end method

.method public getScrollState()I
    .registers 2

    iget v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollState:I

    return v0
.end method

.method public hasFixedSize()Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mHasFixedSize:Z

    return v0
.end method

.method public hasNestedScrollingParent()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollingChildHelper:Landroid/support/v4/view/NestedScrollingChildHelper;

    invoke-virtual {v0}, Landroid/support/v4/view/NestedScrollingChildHelper;->hasNestedScrollingParent()Z

    move-result v0

    return v0
.end method

.method public hasPendingAdapterUpdates()Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mFirstLayoutComplete:Z

    if-eqz v0, :cond_13

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mDataSetHasChangedAfterLayout:Z

    if-nez v0, :cond_13

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAdapterHelper:Landroid/support/v7/widget/AdapterHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/AdapterHelper;->hasPendingUpdates()Z

    move-result v0

    if-eqz v0, :cond_11

    goto :goto_13

    :cond_11
    const/4 v0, 0x0

    goto :goto_14

    :cond_13
    :goto_13
    const/4 v0, 0x1

    :goto_14
    return v0
.end method

.method initAdapterManager()V
    .registers 3

    new-instance v0, Landroid/support/v7/widget/AdapterHelper;

    new-instance v1, Landroid/support/v7/widget/RecyclerView$5;

    invoke-direct {v1, p0}, Landroid/support/v7/widget/RecyclerView$5;-><init>(Landroid/support/v7/widget/RecyclerView;)V

    invoke-direct {v0, v1}, Landroid/support/v7/widget/AdapterHelper;-><init>(Landroid/support/v7/widget/AdapterHelper$Callback;)V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAdapterHelper:Landroid/support/v7/widget/AdapterHelper;

    return-void
.end method

.method invalidateGlows()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mBottomGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mTopGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mRightGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLeftGlow:Landroid/support/v4/widget/EdgeEffectCompat;

    return-void
.end method

.method public invalidateItemDecorations()V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemDecorations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_9

    return-void

    :cond_9
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-eqz v0, :cond_14

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    const-string v1, "Cannot invalidate item decorations during a scroll or layout"

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    :cond_14
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->markItemDecorInsetsDirty()V

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->requestLayout()V

    return-void
.end method

.method isAccessibilityEnabled()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAccessibilityManager:Landroid/view/accessibility/AccessibilityManager;

    if-eqz v0, :cond_e

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAccessibilityManager:Landroid/view/accessibility/AccessibilityManager;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    :goto_f
    return v0
.end method

.method public isAnimating()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    if-eqz v0, :cond_e

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    :goto_f
    return v0
.end method

.method public isAttachedToWindow()Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mIsAttached:Z

    return v0
.end method

.method public isComputingLayout()Z
    .registers 2

    iget v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutOrScrollCounter:I

    if-lez v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public isLayoutFrozen()Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutFrozen:Z

    return v0
.end method

.method public isNestedScrollingEnabled()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollingChildHelper:Landroid/support/v4/view/NestedScrollingChildHelper;

    invoke-virtual {v0}, Landroid/support/v4/view/NestedScrollingChildHelper;->isNestedScrollingEnabled()Z

    move-result v0

    return v0
.end method

.method markItemDecorInsetsDirty()V
    .registers 6

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/ChildHelper;->getUnfilteredChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_1b

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/ChildHelper;->getUnfilteredChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    const/4 v4, 0x1

    iput-boolean v4, v3, Landroid/support/v7/widget/RecyclerView$LayoutParams;->mInsetsDirty:Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_1b
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$Recycler;->markItemDecorInsetsDirty()V

    return-void
.end method

.method markKnownViewsInvalid()V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/ChildHelper;->getUnfilteredChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_22

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/ChildHelper;->getUnfilteredChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v2

    if-eqz v2, :cond_1f

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->shouldIgnore()Z

    move-result v3

    if-nez v3, :cond_1f

    const/4 v3, 0x6

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->addFlags(I)V

    :cond_1f
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_22
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->markItemDecorInsetsDirty()V

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$Recycler;->markKnownViewsInvalid()V

    return-void
.end method

.method public offsetChildrenHorizontal(I)V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/ChildHelper;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_15

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/ChildHelper;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/view/View;->offsetLeftAndRight(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_15
    return-void
.end method

.method public offsetChildrenVertical(I)V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/ChildHelper;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_15

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/ChildHelper;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/view/View;->offsetTopAndBottom(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_15
    return-void
.end method

.method offsetPositionRecordsForInsert(II)V
    .registers 9

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/ChildHelper;->getUnfilteredChildCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_8
    if-ge v2, v0, :cond_2c

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v3, v2}, Landroid/support/v7/widget/ChildHelper;->getUnfilteredChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v3

    if-eqz v3, :cond_29

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->shouldIgnore()Z

    move-result v4

    if-nez v4, :cond_29

    iget v4, v3, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    if-lt v4, p1, :cond_29

    invoke-virtual {v3, p2, v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->offsetPosition(IZ)V

    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    const/4 v5, 0x1

    # setter for: Landroid/support/v7/widget/RecyclerView$State;->mStructureChanged:Z
    invoke-static {v4, v5}, Landroid/support/v7/widget/RecyclerView$State;->access$1402(Landroid/support/v7/widget/RecyclerView$State;Z)Z

    :cond_29
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_2c
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {v1, p1, p2}, Landroid/support/v7/widget/RecyclerView$Recycler;->offsetPositionRecordsForInsert(II)V

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->requestLayout()V

    return-void
.end method

.method offsetPositionRecordsForMove(II)V
    .registers 12

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/ChildHelper;->getUnfilteredChildCount()I

    move-result v0

    const/4 v1, 0x1

    if-ge p1, p2, :cond_d

    move v2, p1

    move v3, p2

    const/4 v4, -0x1

    goto :goto_10

    :cond_d
    move v2, p2

    move v3, p1

    move v4, v1

    :goto_10
    const/4 v5, 0x0

    move v6, v5

    :goto_12
    if-ge v6, v0, :cond_3e

    iget-object v7, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v7, v6}, Landroid/support/v7/widget/ChildHelper;->getUnfilteredChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-static {v7}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v7

    if-eqz v7, :cond_3b

    iget v8, v7, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    if-lt v8, v2, :cond_3b

    iget v8, v7, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    if-le v8, v3, :cond_29

    goto :goto_3b

    :cond_29
    iget v8, v7, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    if-ne v8, p1, :cond_33

    sub-int v8, p2, p1

    invoke-virtual {v7, v8, v5}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->offsetPosition(IZ)V

    goto :goto_36

    :cond_33
    invoke-virtual {v7, v4, v5}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->offsetPosition(IZ)V

    :goto_36
    iget-object v8, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    # setter for: Landroid/support/v7/widget/RecyclerView$State;->mStructureChanged:Z
    invoke-static {v8, v1}, Landroid/support/v7/widget/RecyclerView$State;->access$1402(Landroid/support/v7/widget/RecyclerView$State;Z)Z

    :cond_3b
    :goto_3b
    add-int/lit8 v6, v6, 0x1

    goto :goto_12

    :cond_3e
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {v1, p1, p2}, Landroid/support/v7/widget/RecyclerView$Recycler;->offsetPositionRecordsForMove(II)V

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->requestLayout()V

    return-void
.end method

.method offsetPositionRecordsForRemove(IIZ)V
    .registers 11

    add-int v0, p1, p2

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/ChildHelper;->getUnfilteredChildCount()I

    move-result v1

    const/4 v2, 0x0

    :goto_9
    if-ge v2, v1, :cond_3e

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v3, v2}, Landroid/support/v7/widget/ChildHelper;->getUnfilteredChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v3

    if-eqz v3, :cond_3b

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->shouldIgnore()Z

    move-result v4

    if-nez v4, :cond_3b

    iget v4, v3, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    const/4 v5, 0x1

    if-lt v4, v0, :cond_2c

    neg-int v4, p2

    invoke-virtual {v3, v4, p3}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->offsetPosition(IZ)V

    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    # setter for: Landroid/support/v7/widget/RecyclerView$State;->mStructureChanged:Z
    invoke-static {v4, v5}, Landroid/support/v7/widget/RecyclerView$State;->access$1402(Landroid/support/v7/widget/RecyclerView$State;Z)Z

    goto :goto_3b

    :cond_2c
    iget v4, v3, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    if-lt v4, p1, :cond_3b

    add-int/lit8 v4, p1, -0x1

    neg-int v6, p2

    invoke-virtual {v3, v4, v6, p3}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->flagRemovedAndOffsetPosition(IIZ)V

    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    # setter for: Landroid/support/v7/widget/RecyclerView$State;->mStructureChanged:Z
    invoke-static {v4, v5}, Landroid/support/v7/widget/RecyclerView$State;->access$1402(Landroid/support/v7/widget/RecyclerView$State;Z)Z

    :cond_3b
    :goto_3b
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    :cond_3e
    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {v2, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$Recycler;->offsetPositionRecordsForRemove(IIZ)V

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->requestLayout()V

    return-void
.end method

.method protected onAttachedToWindow()V
    .registers 3

    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutOrScrollCounter:I

    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/support/v7/widget/RecyclerView;->mIsAttached:Z

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mFirstLayoutComplete:Z

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-eqz v1, :cond_14

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v1, p0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->dispatchAttachedToWindow(Landroid/support/v7/widget/RecyclerView;)V

    :cond_14
    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mPostedAnimatorRunner:Z

    return-void
.end method

.method public onChildAttachedToWindow(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method public onChildDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 3

    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    if-eqz v0, :cond_c

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->endAnimations()V

    :cond_c
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mFirstLayoutComplete:Z

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->stopScroll()V

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mIsAttached:Z

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-eqz v0, :cond_1f

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {v0, p0, v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->dispatchDetachedFromWindow(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$Recycler;)V

    :cond_1f
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimatorRunner:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/RecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 6

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onDraw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemDecorations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_a
    if-ge v1, v0, :cond_1c

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mItemDecorations:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/RecyclerView$ItemDecoration;

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v2, p1, p0, v3}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;->onDraw(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_1c
    return-void
.end method

.method public onGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .registers 8

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutFrozen:Z

    if-eqz v0, :cond_b

    return v1

    :cond_b
    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getSource(Landroid/view/MotionEvent;)I

    move-result v0

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_52

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/16 v2, 0x8

    if-ne v0, v2, :cond_52

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollVertically()Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_2c

    const/16 v0, 0x9

    invoke-static {p1, v0}, Landroid/support/v4/view/MotionEventCompat;->getAxisValue(Landroid/view/MotionEvent;I)F

    move-result v0

    neg-float v0, v0

    goto :goto_2d

    :cond_2c
    move v0, v2

    :goto_2d
    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollHorizontally()Z

    move-result v3

    if-eqz v3, :cond_3c

    const/16 v3, 0xa

    invoke-static {p1, v3}, Landroid/support/v4/view/MotionEventCompat;->getAxisValue(Landroid/view/MotionEvent;I)F

    move-result v3

    goto :goto_3d

    :cond_3c
    move v3, v2

    :goto_3d
    cmpl-float v4, v0, v2

    if-nez v4, :cond_45

    cmpl-float v2, v3, v2

    if-eqz v2, :cond_52

    :cond_45
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView;->getScrollFactor()F

    move-result v2

    mul-float v4, v3, v2

    float-to-int v4, v4

    mul-float v5, v0, v2

    float-to-int v5, v5

    invoke-virtual {p0, v4, v5, p1}, Landroid/support/v7/widget/RecyclerView;->scrollByInternal(IILandroid/view/MotionEvent;)Z

    :cond_52
    return v1
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-boolean v2, v0, Landroid/support/v7/widget/RecyclerView;->mLayoutFrozen:Z

    const/4 v3, 0x0

    if-eqz v2, :cond_a

    return v3

    :cond_a
    invoke-direct/range {p0 .. p1}, Landroid/support/v7/widget/RecyclerView;->dispatchOnItemTouchIntercept(Landroid/view/MotionEvent;)Z

    move-result v2

    const/4 v4, 0x1

    if-eqz v2, :cond_15

    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->cancelTouch()V

    return v4

    :cond_15
    iget-object v2, v0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-nez v2, :cond_1a

    return v3

    :cond_1a
    iget-object v2, v0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollHorizontally()Z

    move-result v2

    iget-object v5, v0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v5}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollVertically()Z

    move-result v5

    iget-object v6, v0, Landroid/support/v7/widget/RecyclerView;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v6, :cond_30

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v6

    iput-object v6, v0, Landroid/support/v7/widget/RecyclerView;->mVelocityTracker:Landroid/view/VelocityTracker;

    :cond_30
    iget-object v6, v0, Landroid/support/v7/widget/RecyclerView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    invoke-static/range {p1 .. p1}, Landroid/support/v4/view/MotionEventCompat;->getActionMasked(Landroid/view/MotionEvent;)I

    move-result v6

    invoke-static/range {p1 .. p1}, Landroid/support/v4/view/MotionEventCompat;->getActionIndex(Landroid/view/MotionEvent;)I

    move-result v7

    const/high16 v8, 0x3f000000    # 0.5f

    packed-switch v6, :pswitch_data_13a

    :pswitch_42
    goto/16 :goto_133

    :pswitch_44
    invoke-direct/range {p0 .. p1}, Landroid/support/v7/widget/RecyclerView;->onPointerUp(Landroid/view/MotionEvent;)V

    goto/16 :goto_133

    :pswitch_49
    invoke-static {v1, v7}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v9

    iput v9, v0, Landroid/support/v7/widget/RecyclerView;->mScrollPointerId:I

    invoke-static {v1, v7}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v9

    add-float/2addr v9, v8

    float-to-int v9, v9

    iput v9, v0, Landroid/support/v7/widget/RecyclerView;->mLastTouchX:I

    iput v9, v0, Landroid/support/v7/widget/RecyclerView;->mInitialTouchX:I

    invoke-static {v1, v7}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v9

    add-float/2addr v9, v8

    float-to-int v8, v9

    iput v8, v0, Landroid/support/v7/widget/RecyclerView;->mLastTouchY:I

    iput v8, v0, Landroid/support/v7/widget/RecyclerView;->mInitialTouchY:I

    goto/16 :goto_133

    :pswitch_65
    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->cancelTouch()V

    goto/16 :goto_133

    :pswitch_6a
    iget v9, v0, Landroid/support/v7/widget/RecyclerView;->mScrollPointerId:I

    invoke-static {v1, v9}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v9

    if-gez v9, :cond_90

    const-string v4, "RecyclerView"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Error processing scroll; pointer index for id "

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v10, v0, Landroid/support/v7/widget/RecyclerView;->mScrollPointerId:I

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, " not found. Did any MotionEvents get skipped?"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v4, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v3

    :cond_90
    invoke-static {v1, v9}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v10

    add-float/2addr v10, v8

    float-to-int v10, v10

    invoke-static {v1, v9}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v11

    add-float/2addr v11, v8

    float-to-int v8, v11

    iget v11, v0, Landroid/support/v7/widget/RecyclerView;->mScrollState:I

    if-eq v11, v4, :cond_ed

    iget v11, v0, Landroid/support/v7/widget/RecyclerView;->mInitialTouchX:I

    sub-int v11, v10, v11

    iget v12, v0, Landroid/support/v7/widget/RecyclerView;->mInitialTouchY:I

    sub-int v12, v8, v12

    const/4 v13, 0x0

    if-eqz v2, :cond_c4

    invoke-static {v11}, Ljava/lang/Math;->abs(I)I

    move-result v15

    iget v14, v0, Landroid/support/v7/widget/RecyclerView;->mTouchSlop:I

    if-le v15, v14, :cond_c4

    iget v14, v0, Landroid/support/v7/widget/RecyclerView;->mInitialTouchX:I

    iget v15, v0, Landroid/support/v7/widget/RecyclerView;->mTouchSlop:I

    if-gez v11, :cond_bc

    const/16 v17, -0x1

    goto :goto_be

    :cond_bc
    move/from16 v17, v4

    :goto_be
    mul-int v15, v15, v17

    add-int/2addr v14, v15

    iput v14, v0, Landroid/support/v7/widget/RecyclerView;->mLastTouchX:I

    const/4 v13, 0x1

    :cond_c4
    if-eqz v5, :cond_df

    invoke-static {v12}, Ljava/lang/Math;->abs(I)I

    move-result v14

    iget v15, v0, Landroid/support/v7/widget/RecyclerView;->mTouchSlop:I

    if-le v14, v15, :cond_df

    iget v14, v0, Landroid/support/v7/widget/RecyclerView;->mInitialTouchY:I

    iget v15, v0, Landroid/support/v7/widget/RecyclerView;->mTouchSlop:I

    if-gez v12, :cond_d7

    const/16 v16, -0x1

    goto :goto_d9

    :cond_d7
    move/from16 v16, v4

    :goto_d9
    mul-int v15, v15, v16

    add-int/2addr v14, v15

    iput v14, v0, Landroid/support/v7/widget/RecyclerView;->mLastTouchY:I

    const/4 v13, 0x1

    :cond_df
    if-eqz v13, :cond_ed

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->getParent()Landroid/view/ViewParent;

    move-result-object v14

    if-eqz v14, :cond_ea

    invoke-interface {v14, v4}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_ea
    invoke-direct {v0, v4}, Landroid/support/v7/widget/RecyclerView;->setScrollState(I)V

    :cond_ed
    goto :goto_133

    :pswitch_ee
    iget-object v8, v0, Landroid/support/v7/widget/RecyclerView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v8}, Landroid/view/VelocityTracker;->clear()V

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->stopNestedScroll()V

    goto :goto_133

    :pswitch_f7
    iget-boolean v9, v0, Landroid/support/v7/widget/RecyclerView;->mIgnoreMotionEventTillDown:Z

    if-eqz v9, :cond_fd

    iput-boolean v3, v0, Landroid/support/v7/widget/RecyclerView;->mIgnoreMotionEventTillDown:Z

    :cond_fd
    invoke-static {v1, v3}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v9

    iput v9, v0, Landroid/support/v7/widget/RecyclerView;->mScrollPointerId:I

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v9

    add-float/2addr v9, v8

    float-to-int v9, v9

    iput v9, v0, Landroid/support/v7/widget/RecyclerView;->mLastTouchX:I

    iput v9, v0, Landroid/support/v7/widget/RecyclerView;->mInitialTouchX:I

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v9

    add-float/2addr v9, v8

    float-to-int v8, v9

    iput v8, v0, Landroid/support/v7/widget/RecyclerView;->mLastTouchY:I

    iput v8, v0, Landroid/support/v7/widget/RecyclerView;->mInitialTouchY:I

    iget v8, v0, Landroid/support/v7/widget/RecyclerView;->mScrollState:I

    const/4 v9, 0x2

    if-ne v8, v9, :cond_126

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->getParent()Landroid/view/ViewParent;

    move-result-object v8

    invoke-interface {v8, v4}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    invoke-direct {v0, v4}, Landroid/support/v7/widget/RecyclerView;->setScrollState(I)V

    :cond_126
    const/4 v8, 0x0

    if-eqz v2, :cond_12b

    or-int/lit8 v8, v8, 0x1

    :cond_12b
    if-eqz v5, :cond_12f

    or-int/lit8 v8, v8, 0x2

    :cond_12f
    invoke-virtual {v0, v8}, Landroid/support/v7/widget/RecyclerView;->startNestedScroll(I)Z

    nop

    :goto_133
    iget v8, v0, Landroid/support/v7/widget/RecyclerView;->mScrollState:I

    if-ne v8, v4, :cond_139

    move v3, v4

    nop

    :cond_139
    return v3

    :pswitch_data_13a
    .packed-switch 0x0
        :pswitch_f7
        :pswitch_ee
        :pswitch_6a
        :pswitch_65
        :pswitch_42
        :pswitch_49
        :pswitch_44
    .end packed-switch
.end method

.method protected onLayout(ZIIII)V
    .registers 7

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->eatRequestLayout()V

    const-string v0, "RV OnLayout"

    invoke-static {v0}, Landroid/support/v4/os/TraceCompat;->beginSection(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->dispatchLayout()V

    invoke-static {}, Landroid/support/v4/os/TraceCompat;->endSection()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/RecyclerView;->resumeRequestLayout(Z)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mFirstLayoutComplete:Z

    return-void
.end method

.method protected onMeasure(II)V
    .registers 7

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mAdapterUpdateDuringMeasure:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_29

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->eatRequestLayout()V

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView;->processAdapterUpdatesAndSetAnimationFlags()V

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    # getter for: Landroid/support/v7/widget/RecyclerView$State;->mRunPredictiveAnimations:Z
    invoke-static {v0}, Landroid/support/v7/widget/RecyclerView$State;->access$1600(Landroid/support/v7/widget/RecyclerView$State;)Z

    move-result v0

    if-eqz v0, :cond_1a

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    const/4 v2, 0x1

    # setter for: Landroid/support/v7/widget/RecyclerView$State;->mInPreLayout:Z
    invoke-static {v0, v2}, Landroid/support/v7/widget/RecyclerView$State;->access$1702(Landroid/support/v7/widget/RecyclerView$State;Z)Z

    goto :goto_24

    :cond_1a
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAdapterHelper:Landroid/support/v7/widget/AdapterHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/AdapterHelper;->consumeUpdatesInOnePass()V

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    # setter for: Landroid/support/v7/widget/RecyclerView$State;->mInPreLayout:Z
    invoke-static {v0, v1}, Landroid/support/v7/widget/RecyclerView$State;->access$1702(Landroid/support/v7/widget/RecyclerView$State;Z)Z

    :goto_24
    iput-boolean v1, p0, Landroid/support/v7/widget/RecyclerView;->mAdapterUpdateDuringMeasure:Z

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/RecyclerView;->resumeRequestLayout(Z)V

    :cond_29
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    if-eqz v0, :cond_38

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v2

    iput v2, v0, Landroid/support/v7/widget/RecyclerView$State;->mItemCount:I

    goto :goto_3c

    :cond_38
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    iput v1, v0, Landroid/support/v7/widget/RecyclerView$State;->mItemCount:I

    :goto_3c
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-nez v0, :cond_44

    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView;->defaultOnMeasure(II)V

    goto :goto_4d

    :cond_44
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v0, v2, v3, p1, p2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onMeasure(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;II)V

    :goto_4d
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    # setter for: Landroid/support/v7/widget/RecyclerView$State;->mInPreLayout:Z
    invoke-static {v0, v1}, Landroid/support/v7/widget/RecyclerView$State;->access$1702(Landroid/support/v7/widget/RecyclerView$State;Z)Z

    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 4

    move-object v0, p1

    check-cast v0, Landroid/support/v7/widget/RecyclerView$SavedState;

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mPendingSavedState:Landroid/support/v7/widget/RecyclerView$SavedState;

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mPendingSavedState:Landroid/support/v7/widget/RecyclerView$SavedState;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-eqz v0, :cond_21

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mPendingSavedState:Landroid/support/v7/widget/RecyclerView$SavedState;

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$SavedState;->mLayoutState:Landroid/os/Parcelable;

    if-eqz v0, :cond_21

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mPendingSavedState:Landroid/support/v7/widget/RecyclerView$SavedState;

    iget-object v1, v1, Landroid/support/v7/widget/RecyclerView$SavedState;->mLayoutState:Landroid/os/Parcelable;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    :cond_21
    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 3

    new-instance v0, Landroid/support/v7/widget/RecyclerView$SavedState;

    invoke-super {p0}, Landroid/view/ViewGroup;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/widget/RecyclerView$SavedState;-><init>(Landroid/os/Parcelable;)V

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mPendingSavedState:Landroid/support/v7/widget/RecyclerView$SavedState;

    if-eqz v1, :cond_13

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mPendingSavedState:Landroid/support/v7/widget/RecyclerView$SavedState;

    # invokes: Landroid/support/v7/widget/RecyclerView$SavedState;->copyFrom(Landroid/support/v7/widget/RecyclerView$SavedState;)V
    invoke-static {v0, v1}, Landroid/support/v7/widget/RecyclerView$SavedState;->access$1500(Landroid/support/v7/widget/RecyclerView$SavedState;Landroid/support/v7/widget/RecyclerView$SavedState;)V

    goto :goto_23

    :cond_13
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-eqz v1, :cond_20

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v7/widget/RecyclerView$SavedState;->mLayoutState:Landroid/os/Parcelable;

    goto :goto_23

    :cond_20
    const/4 v1, 0x0

    iput-object v1, v0, Landroid/support/v7/widget/RecyclerView$SavedState;->mLayoutState:Landroid/os/Parcelable;

    :goto_23
    return-object v0
.end method

.method public onScrollStateChanged(I)V
    .registers 2

    return-void
.end method

.method public onScrolled(II)V
    .registers 3

    return-void
.end method

.method protected onSizeChanged(IIII)V
    .registers 5

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->onSizeChanged(IIII)V

    if-ne p1, p3, :cond_7

    if-eq p2, p4, :cond_a

    :cond_7
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->invalidateGlows()V

    :cond_a
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-boolean v2, v0, Landroid/support/v7/widget/RecyclerView;->mLayoutFrozen:Z

    const/4 v3, 0x0

    if-nez v2, :cond_1ef

    iget-boolean v2, v0, Landroid/support/v7/widget/RecyclerView;->mIgnoreMotionEventTillDown:Z

    if-eqz v2, :cond_f

    goto/16 :goto_1ef

    :cond_f
    invoke-direct/range {p0 .. p1}, Landroid/support/v7/widget/RecyclerView;->dispatchOnItemTouch(Landroid/view/MotionEvent;)Z

    move-result v2

    const/4 v4, 0x1

    if-eqz v2, :cond_1a

    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->cancelTouch()V

    return v4

    :cond_1a
    iget-object v2, v0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-nez v2, :cond_1f

    return v3

    :cond_1f
    iget-object v2, v0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollHorizontally()Z

    move-result v2

    iget-object v5, v0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v5}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollVertically()Z

    move-result v5

    iget-object v6, v0, Landroid/support/v7/widget/RecyclerView;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v6, :cond_35

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v6

    iput-object v6, v0, Landroid/support/v7/widget/RecyclerView;->mVelocityTracker:Landroid/view/VelocityTracker;

    :cond_35
    const/4 v6, 0x0

    invoke-static/range {p1 .. p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v7

    invoke-static/range {p1 .. p1}, Landroid/support/v4/view/MotionEventCompat;->getActionMasked(Landroid/view/MotionEvent;)I

    move-result v8

    invoke-static/range {p1 .. p1}, Landroid/support/v4/view/MotionEventCompat;->getActionIndex(Landroid/view/MotionEvent;)I

    move-result v9

    if-nez v8, :cond_4c

    iget-object v10, v0, Landroid/support/v7/widget/RecyclerView;->mNestedOffsets:[I

    iget-object v11, v0, Landroid/support/v7/widget/RecyclerView;->mNestedOffsets:[I

    aput v3, v11, v4

    aput v3, v10, v3

    :cond_4c
    iget-object v10, v0, Landroid/support/v7/widget/RecyclerView;->mNestedOffsets:[I

    aget v10, v10, v3

    int-to-float v10, v10

    iget-object v11, v0, Landroid/support/v7/widget/RecyclerView;->mNestedOffsets:[I

    aget v11, v11, v4

    int-to-float v11, v11

    invoke-virtual {v7, v10, v11}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    const/high16 v10, 0x3f000000    # 0.5f

    packed-switch v8, :pswitch_data_1f2

    :pswitch_5e
    move/from16 v16, v6

    goto/16 :goto_1e3

    :pswitch_62
    invoke-direct/range {p0 .. p1}, Landroid/support/v7/widget/RecyclerView;->onPointerUp(Landroid/view/MotionEvent;)V

    goto/16 :goto_1b7

    :pswitch_67
    invoke-static {v1, v9}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v3

    iput v3, v0, Landroid/support/v7/widget/RecyclerView;->mScrollPointerId:I

    invoke-static {v1, v9}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v3

    add-float/2addr v3, v10

    float-to-int v3, v3

    iput v3, v0, Landroid/support/v7/widget/RecyclerView;->mLastTouchX:I

    iput v3, v0, Landroid/support/v7/widget/RecyclerView;->mInitialTouchX:I

    invoke-static {v1, v9}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v3

    add-float/2addr v3, v10

    float-to-int v3, v3

    iput v3, v0, Landroid/support/v7/widget/RecyclerView;->mLastTouchY:I

    iput v3, v0, Landroid/support/v7/widget/RecyclerView;->mInitialTouchY:I

    goto/16 :goto_1b7

    :pswitch_83
    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->cancelTouch()V

    goto/16 :goto_1b7

    :pswitch_88
    iget v11, v0, Landroid/support/v7/widget/RecyclerView;->mScrollPointerId:I

    invoke-static {v1, v11}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v11

    if-gez v11, :cond_ae

    const-string v4, "RecyclerView"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Error processing scroll; pointer index for id "

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v12, v0, Landroid/support/v7/widget/RecyclerView;->mScrollPointerId:I

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v12, " not found. Did any MotionEvents get skipped?"

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v4, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v3

    :cond_ae
    invoke-static {v1, v11}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v12

    add-float/2addr v12, v10

    float-to-int v12, v12

    invoke-static {v1, v11}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v13

    add-float/2addr v13, v10

    float-to-int v10, v13

    iget v13, v0, Landroid/support/v7/widget/RecyclerView;->mLastTouchX:I

    sub-int/2addr v13, v12

    iget v14, v0, Landroid/support/v7/widget/RecyclerView;->mLastTouchY:I

    sub-int/2addr v14, v10

    iget-object v15, v0, Landroid/support/v7/widget/RecyclerView;->mScrollConsumed:[I

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mScrollOffset:[I

    invoke-virtual {v0, v13, v14, v15, v4}, Landroid/support/v7/widget/RecyclerView;->dispatchNestedPreScroll(II[I[I)Z

    move-result v4

    if-eqz v4, :cond_fd

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mScrollConsumed:[I

    aget v4, v4, v3

    sub-int/2addr v13, v4

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mScrollConsumed:[I

    const/4 v15, 0x1

    aget v4, v4, v15

    sub-int/2addr v14, v4

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mScrollOffset:[I

    aget v4, v4, v3

    int-to-float v4, v4

    iget-object v3, v0, Landroid/support/v7/widget/RecyclerView;->mScrollOffset:[I

    aget v3, v3, v15

    int-to-float v3, v3

    invoke-virtual {v7, v4, v3}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    iget-object v3, v0, Landroid/support/v7/widget/RecyclerView;->mNestedOffsets:[I

    const/4 v4, 0x0

    aget v15, v3, v4

    move/from16 v16, v6

    iget-object v6, v0, Landroid/support/v7/widget/RecyclerView;->mScrollOffset:[I

    aget v6, v6, v4

    add-int/2addr v15, v6

    aput v15, v3, v4

    iget-object v3, v0, Landroid/support/v7/widget/RecyclerView;->mNestedOffsets:[I

    const/4 v4, 0x1

    aget v6, v3, v4

    iget-object v15, v0, Landroid/support/v7/widget/RecyclerView;->mScrollOffset:[I

    aget v15, v15, v4

    add-int/2addr v6, v15

    aput v6, v3, v4

    goto :goto_100

    :cond_fd
    move/from16 v16, v6

    const/4 v4, 0x1

    :goto_100
    iget v3, v0, Landroid/support/v7/widget/RecyclerView;->mScrollState:I

    if-eq v3, v4, :cond_141

    const/4 v3, 0x0

    if-eqz v2, :cond_119

    invoke-static {v13}, Ljava/lang/Math;->abs(I)I

    move-result v4

    iget v6, v0, Landroid/support/v7/widget/RecyclerView;->mTouchSlop:I

    if-le v4, v6, :cond_119

    if-lez v13, :cond_115

    iget v4, v0, Landroid/support/v7/widget/RecyclerView;->mTouchSlop:I

    sub-int/2addr v13, v4

    goto :goto_118

    :cond_115
    iget v4, v0, Landroid/support/v7/widget/RecyclerView;->mTouchSlop:I

    add-int/2addr v13, v4

    :goto_118
    const/4 v3, 0x1

    :cond_119
    if-eqz v5, :cond_12d

    invoke-static {v14}, Ljava/lang/Math;->abs(I)I

    move-result v4

    iget v6, v0, Landroid/support/v7/widget/RecyclerView;->mTouchSlop:I

    if-le v4, v6, :cond_12d

    if-lez v14, :cond_129

    iget v4, v0, Landroid/support/v7/widget/RecyclerView;->mTouchSlop:I

    sub-int/2addr v14, v4

    goto :goto_12c

    :cond_129
    iget v4, v0, Landroid/support/v7/widget/RecyclerView;->mTouchSlop:I

    add-int/2addr v14, v4

    :goto_12c
    const/4 v3, 0x1

    :cond_12d
    if-eqz v3, :cond_13f

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    if-eqz v4, :cond_13a

    const/4 v6, 0x1

    invoke-interface {v4, v6}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto :goto_13b

    :cond_13a
    const/4 v6, 0x1

    :goto_13b
    invoke-direct {v0, v6}, Landroid/support/v7/widget/RecyclerView;->setScrollState(I)V

    goto :goto_142

    :cond_13f
    const/4 v6, 0x1

    goto :goto_142

    :cond_141
    move v6, v4

    :goto_142
    move v3, v13

    iget v4, v0, Landroid/support/v7/widget/RecyclerView;->mScrollState:I

    if-ne v4, v6, :cond_170

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mScrollOffset:[I

    const/4 v13, 0x0

    aget v4, v4, v13

    sub-int v4, v12, v4

    iput v4, v0, Landroid/support/v7/widget/RecyclerView;->mLastTouchX:I

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mScrollOffset:[I

    aget v4, v4, v6

    sub-int v4, v10, v4

    iput v4, v0, Landroid/support/v7/widget/RecyclerView;->mLastTouchY:I

    if-eqz v2, :cond_15c

    move v4, v3

    goto :goto_15d

    :cond_15c
    const/4 v4, 0x0

    :goto_15d
    if-eqz v5, :cond_161

    move v6, v14

    goto :goto_162

    :cond_161
    const/4 v6, 0x0

    :goto_162
    invoke-virtual {v0, v4, v6, v7}, Landroid/support/v7/widget/RecyclerView;->scrollByInternal(IILandroid/view/MotionEvent;)Z

    move-result v4

    if-eqz v4, :cond_170

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    const/4 v6, 0x1

    invoke-interface {v4, v6}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_170
    goto/16 :goto_1e3

    :pswitch_172
    move/from16 v16, v6

    iget-object v3, v0, Landroid/support/v7/widget/RecyclerView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v3, v7}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    const/4 v6, 0x1

    iget-object v3, v0, Landroid/support/v7/widget/RecyclerView;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v4, 0x3e8

    iget v10, v0, Landroid/support/v7/widget/RecyclerView;->mMaxFlingVelocity:I

    int-to-float v10, v10

    invoke-virtual {v3, v4, v10}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    const/4 v3, 0x0

    if-eqz v2, :cond_191

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget v10, v0, Landroid/support/v7/widget/RecyclerView;->mScrollPointerId:I

    invoke-static {v4, v10}, Landroid/support/v4/view/VelocityTrackerCompat;->getXVelocity(Landroid/view/VelocityTracker;I)F

    move-result v4

    neg-float v4, v4

    goto :goto_192

    :cond_191
    move v4, v3

    :goto_192
    if-eqz v5, :cond_19e

    iget-object v10, v0, Landroid/support/v7/widget/RecyclerView;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget v11, v0, Landroid/support/v7/widget/RecyclerView;->mScrollPointerId:I

    invoke-static {v10, v11}, Landroid/support/v4/view/VelocityTrackerCompat;->getYVelocity(Landroid/view/VelocityTracker;I)F

    move-result v10

    neg-float v10, v10

    goto :goto_19f

    :cond_19e
    move v10, v3

    :goto_19f
    cmpl-float v11, v4, v3

    if-nez v11, :cond_1a7

    cmpl-float v3, v10, v3

    if-eqz v3, :cond_1af

    :cond_1a7
    float-to-int v3, v4

    float-to-int v11, v10

    invoke-virtual {v0, v3, v11}, Landroid/support/v7/widget/RecyclerView;->fling(II)Z

    move-result v3

    if-nez v3, :cond_1b3

    :cond_1af
    const/4 v3, 0x0

    invoke-direct {v0, v3}, Landroid/support/v7/widget/RecyclerView;->setScrollState(I)V

    :cond_1b3
    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->resetTouch()V

    nop

    :goto_1b7
    move/from16 v16, v6

    goto :goto_1e3

    :pswitch_1ba
    move/from16 v16, v6

    invoke-static {v1, v3}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v3

    iput v3, v0, Landroid/support/v7/widget/RecyclerView;->mScrollPointerId:I

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    add-float/2addr v3, v10

    float-to-int v3, v3

    iput v3, v0, Landroid/support/v7/widget/RecyclerView;->mLastTouchX:I

    iput v3, v0, Landroid/support/v7/widget/RecyclerView;->mInitialTouchX:I

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    add-float/2addr v3, v10

    float-to-int v3, v3

    iput v3, v0, Landroid/support/v7/widget/RecyclerView;->mLastTouchY:I

    iput v3, v0, Landroid/support/v7/widget/RecyclerView;->mInitialTouchY:I

    const/4 v3, 0x0

    if-eqz v2, :cond_1db

    or-int/lit8 v3, v3, 0x1

    :cond_1db
    if-eqz v5, :cond_1df

    or-int/lit8 v3, v3, 0x2

    :cond_1df
    invoke-virtual {v0, v3}, Landroid/support/v7/widget/RecyclerView;->startNestedScroll(I)Z

    nop

    :goto_1e3
    if-nez v16, :cond_1ea

    iget-object v3, v0, Landroid/support/v7/widget/RecyclerView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v3, v7}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    :cond_1ea
    invoke-virtual {v7}, Landroid/view/MotionEvent;->recycle()V

    const/4 v3, 0x1

    return v3

    :cond_1ef
    :goto_1ef
    const/4 v2, 0x0

    return v2

    nop

    :pswitch_data_1f2
    .packed-switch 0x0
        :pswitch_1ba
        :pswitch_172
        :pswitch_88
        :pswitch_83
        :pswitch_5e
        :pswitch_67
        :pswitch_62
    .end packed-switch
.end method

.method rebindUpdatedViewHolders()V
    .registers 7

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/ChildHelper;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_60

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/ChildHelper;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v2

    if-eqz v2, :cond_5d

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->shouldIgnore()Z

    move-result v3

    if-eqz v3, :cond_1c

    goto :goto_5d

    :cond_1c
    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isRemoved()Z

    move-result v3

    if-nez v3, :cond_5a

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isInvalid()Z

    move-result v3

    if-eqz v3, :cond_29

    goto :goto_5a

    :cond_29
    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->needsUpdate()Z

    move-result v3

    if-eqz v3, :cond_5d

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    iget v4, v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemViewType(I)I

    move-result v3

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getItemViewType()I

    move-result v4

    if-ne v4, v3, :cond_56

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isChanged()Z

    move-result v4

    if-eqz v4, :cond_4e

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView;->supportsChangeAnimations()Z

    move-result v4

    if-nez v4, :cond_4a

    goto :goto_4e

    :cond_4a
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->requestLayout()V

    goto :goto_5d

    :cond_4e
    :goto_4e
    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    iget v5, v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    invoke-virtual {v4, v2, v5}, Landroid/support/v7/widget/RecyclerView$Adapter;->bindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    goto :goto_5d

    :cond_56
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->requestLayout()V

    goto :goto_60

    :cond_5a
    :goto_5a
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->requestLayout()V

    :cond_5d
    :goto_5d
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_60
    :goto_60
    return-void
.end method

.method protected removeDetachedView(Landroid/view/View;Z)V
    .registers 7

    invoke-static {p1}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    if-eqz v0, :cond_2e

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isTmpDetached()Z

    move-result v1

    if-eqz v1, :cond_10

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->clearTmpDetachFlag()V

    goto :goto_2e

    :cond_10
    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->shouldIgnore()Z

    move-result v1

    if-eqz v1, :cond_17

    goto :goto_2e

    :cond_17
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Called removeDetachedView with a view which is not flagged as tmp detached."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_2e
    :goto_2e
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView;->dispatchChildDetached(Landroid/view/View;)V

    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->removeDetachedView(Landroid/view/View;Z)V

    return-void
.end method

.method public removeItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    const-string v1, "Cannot remove item decoration during a scroll  or layout"

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    :cond_b
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemDecorations:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemDecorations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_25

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getOverScrollMode(Landroid/view/View;)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_21

    const/4 v0, 0x1

    goto :goto_22

    :cond_21
    const/4 v0, 0x0

    :goto_22
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/RecyclerView;->setWillNotDraw(Z)V

    :cond_25
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->markItemDecorInsetsDirty()V

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->requestLayout()V

    return-void
.end method

.method public removeOnChildAttachStateChangeListener(Landroid/support/v7/widget/RecyclerView$OnChildAttachStateChangeListener;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mOnChildAttachStateListeners:Ljava/util/List;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mOnChildAttachStateListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public removeOnItemTouchListener(Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mOnItemTouchListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mActiveOnItemTouchListener:Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;

    if-ne v0, p1, :cond_c

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mActiveOnItemTouchListener:Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;

    :cond_c
    return-void
.end method

.method public removeOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollListeners:Ljava/util/List;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :cond_9
    return-void
.end method

.method public requestChildFocus(Landroid/view/View;Landroid/view/View;)V
    .registers 9

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v0, p0, v1, p1, p2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onRequestChildFocus(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;Landroid/view/View;Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_62

    if-eqz p2, :cond_62

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v1, v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    if-eqz v1, :cond_4f

    move-object v1, v0

    check-cast v1, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    iget-boolean v2, v1, Landroid/support/v7/widget/RecyclerView$LayoutParams;->mInsetsDirty:Z

    if-nez v2, :cond_4f

    iget-object v2, v1, Landroid/support/v7/widget/RecyclerView$LayoutParams;->mDecorInsets:Landroid/graphics/Rect;

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mTempRect:Landroid/graphics/Rect;

    iget v4, v3, Landroid/graphics/Rect;->left:I

    iget v5, v2, Landroid/graphics/Rect;->left:I

    sub-int/2addr v4, v5

    iput v4, v3, Landroid/graphics/Rect;->left:I

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mTempRect:Landroid/graphics/Rect;

    iget v4, v3, Landroid/graphics/Rect;->right:I

    iget v5, v2, Landroid/graphics/Rect;->right:I

    add-int/2addr v4, v5

    iput v4, v3, Landroid/graphics/Rect;->right:I

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mTempRect:Landroid/graphics/Rect;

    iget v4, v3, Landroid/graphics/Rect;->top:I

    iget v5, v2, Landroid/graphics/Rect;->top:I

    sub-int/2addr v4, v5

    iput v4, v3, Landroid/graphics/Rect;->top:I

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mTempRect:Landroid/graphics/Rect;

    iget v4, v3, Landroid/graphics/Rect;->bottom:I

    iget v5, v2, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v4, v5

    iput v4, v3, Landroid/graphics/Rect;->bottom:I

    :cond_4f
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {p0, p2, v1}, Landroid/support/v7/widget/RecyclerView;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {p0, p1, v1}, Landroid/support/v7/widget/RecyclerView;->offsetRectIntoDescendantCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mTempRect:Landroid/graphics/Rect;

    iget-boolean v2, p0, Landroid/support/v7/widget/RecyclerView;->mFirstLayoutComplete:Z

    xor-int/lit8 v2, v2, 0x1

    invoke-virtual {p0, p1, v1, v2}, Landroid/support/v7/widget/RecyclerView;->requestChildRectangleOnScreen(Landroid/view/View;Landroid/graphics/Rect;Z)Z

    :cond_62
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->requestChildFocus(Landroid/view/View;Landroid/view/View;)V

    return-void
.end method

.method public requestChildRectangleOnScreen(Landroid/view/View;Landroid/graphics/Rect;Z)Z
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0, p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->requestChildRectangleOnScreen(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;Landroid/graphics/Rect;Z)Z

    move-result v0

    return v0
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mOnItemTouchListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_17

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mOnItemTouchListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;

    invoke-interface {v2, p1}, Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;->onRequestDisallowInterceptTouchEvent(Z)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_17
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    return-void
.end method

.method public requestLayout()V
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mEatRequestLayout:Z

    if-nez v0, :cond_c

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutFrozen:Z

    if-nez v0, :cond_c

    invoke-super {p0}, Landroid/view/ViewGroup;->requestLayout()V

    goto :goto_f

    :cond_c
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutRequestEaten:Z

    :goto_f
    return-void
.end method

.method resumeRequestLayout(Z)V
    .registers 4

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mEatRequestLayout:Z

    if-eqz v0, :cond_22

    if-eqz p1, :cond_19

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutRequestEaten:Z

    if-eqz v0, :cond_19

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutFrozen:Z

    if-nez v0, :cond_19

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-eqz v0, :cond_19

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    if-eqz v0, :cond_19

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->dispatchLayout()V

    :cond_19
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mEatRequestLayout:Z

    iget-boolean v1, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutFrozen:Z

    if-nez v1, :cond_22

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutRequestEaten:Z

    :cond_22
    return-void
.end method

.method saveOldPositions()V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/ChildHelper;->getUnfilteredChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_1f

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/ChildHelper;->getUnfilteredChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->shouldIgnore()Z

    move-result v3

    if-nez v3, :cond_1c

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->saveOldPosition()V

    :cond_1c
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_1f
    return-void
.end method

.method public scrollBy(II)V
    .registers 8

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-nez v0, :cond_c

    const-string v0, "RecyclerView"

    const-string v1, "Cannot scroll without a LayoutManager set. Call setLayoutManager with a non-null argument."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_c
    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutFrozen:Z

    if-eqz v0, :cond_11

    return-void

    :cond_11
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollHorizontally()Z

    move-result v0

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollVertically()Z

    move-result v1

    if-nez v0, :cond_21

    if-eqz v1, :cond_2f

    :cond_21
    const/4 v2, 0x0

    if-eqz v0, :cond_26

    move v3, p1

    goto :goto_27

    :cond_26
    move v3, v2

    :goto_27
    if-eqz v1, :cond_2b

    move v2, p2

    nop

    :cond_2b
    const/4 v4, 0x0

    invoke-virtual {p0, v3, v2, v4}, Landroid/support/v7/widget/RecyclerView;->scrollByInternal(IILandroid/view/MotionEvent;)Z

    :cond_2f
    return-void
.end method

.method scrollByInternal(IILandroid/view/MotionEvent;)Z
    .registers 23

    move-object/from16 v6, p0

    move/from16 v7, p1

    move/from16 v8, p2

    move-object/from16 v9, p3

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->consumePendingUpdateOperations()V

    iget-object v4, v6, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    if-eqz v4, :cond_ae

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->eatRequestLayout()V

    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->onEnterLayoutOrScroll()V

    const-string v4, "RV Scroll"

    invoke-static {v4}, Landroid/support/v4/os/TraceCompat;->beginSection(Ljava/lang/String;)V

    if-eqz v7, :cond_2c

    iget-object v4, v6, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget-object v5, v6, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    iget-object v11, v6, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v4, v7, v5, v11}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->scrollHorizontallyBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v2

    sub-int v0, v7, v2

    :cond_2c
    if-eqz v8, :cond_3a

    iget-object v4, v6, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget-object v5, v6, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    iget-object v11, v6, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v4, v8, v5, v11}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->scrollVerticallyBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v3

    sub-int v1, v8, v3

    :cond_3a
    invoke-static {}, Landroid/support/v4/os/TraceCompat;->endSection()V

    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->supportsChangeAnimations()Z

    move-result v4

    if-eqz v4, :cond_9c

    iget-object v4, v6, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/ChildHelper;->getChildCount()I

    move-result v4

    const/4 v5, 0x0

    :goto_4a
    if-ge v5, v4, :cond_9c

    iget-object v11, v6, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v11, v5}, Landroid/support/v7/widget/ChildHelper;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    invoke-virtual {v6, v11}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v12

    if-eqz v12, :cond_91

    iget-object v13, v12, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mShadowingHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    if-eqz v13, :cond_91

    iget-object v13, v12, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mShadowingHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    if-eqz v13, :cond_63

    iget-object v14, v13, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    goto :goto_64

    :cond_63
    const/4 v14, 0x0

    :goto_64
    if-eqz v14, :cond_91

    invoke-virtual {v11}, Landroid/view/View;->getLeft()I

    move-result v15

    invoke-virtual {v11}, Landroid/view/View;->getTop()I

    move-result v10

    move/from16 v16, v0

    invoke-virtual {v14}, Landroid/view/View;->getLeft()I

    move-result v0

    if-ne v15, v0, :cond_80

    invoke-virtual {v14}, Landroid/view/View;->getTop()I

    move-result v0

    if-eq v10, v0, :cond_7d

    goto :goto_80

    :cond_7d
    move/from16 v18, v1

    goto :goto_95

    :cond_80
    :goto_80
    invoke-virtual {v14}, Landroid/view/View;->getWidth()I

    move-result v0

    add-int/2addr v0, v15

    invoke-virtual {v14}, Landroid/view/View;->getHeight()I

    move-result v17

    move/from16 v18, v1

    add-int v1, v10, v17

    invoke-virtual {v14, v15, v10, v0, v1}, Landroid/view/View;->layout(IIII)V

    goto :goto_95

    :cond_91
    move/from16 v16, v0

    move/from16 v18, v1

    :goto_95
    add-int/lit8 v5, v5, 0x1

    move/from16 v0, v16

    move/from16 v1, v18

    goto :goto_4a

    :cond_9c
    move/from16 v16, v0

    move/from16 v18, v1

    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->onExitLayoutOrScroll()V

    const/4 v0, 0x0

    invoke-virtual {v6, v0}, Landroid/support/v7/widget/RecyclerView;->resumeRequestLayout(Z)V

    move v10, v2

    move v11, v3

    move/from16 v12, v16

    move/from16 v13, v18

    goto :goto_b2

    :cond_ae
    move v12, v0

    move v13, v1

    move v10, v2

    move v11, v3

    :goto_b2
    iget-object v0, v6, Landroid/support/v7/widget/RecyclerView;->mItemDecorations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_bd

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->invalidate()V

    :cond_bd
    iget-object v5, v6, Landroid/support/v7/widget/RecyclerView;->mScrollOffset:[I

    move-object v0, v6

    move v1, v10

    move v2, v11

    move v3, v12

    move v4, v13

    invoke-virtual/range {v0 .. v5}, Landroid/support/v7/widget/RecyclerView;->dispatchNestedScroll(IIII[I)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_107

    iget v0, v6, Landroid/support/v7/widget/RecyclerView;->mLastTouchX:I

    iget-object v2, v6, Landroid/support/v7/widget/RecyclerView;->mScrollOffset:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    sub-int/2addr v0, v2

    iput v0, v6, Landroid/support/v7/widget/RecyclerView;->mLastTouchX:I

    iget v0, v6, Landroid/support/v7/widget/RecyclerView;->mLastTouchY:I

    iget-object v2, v6, Landroid/support/v7/widget/RecyclerView;->mScrollOffset:[I

    aget v2, v2, v1

    sub-int/2addr v0, v2

    iput v0, v6, Landroid/support/v7/widget/RecyclerView;->mLastTouchY:I

    if-eqz v9, :cond_ef

    iget-object v0, v6, Landroid/support/v7/widget/RecyclerView;->mScrollOffset:[I

    const/4 v2, 0x0

    aget v0, v0, v2

    int-to-float v0, v0

    iget-object v3, v6, Landroid/support/v7/widget/RecyclerView;->mScrollOffset:[I

    aget v3, v3, v1

    int-to-float v3, v3

    invoke-virtual {v9, v0, v3}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    goto :goto_f0

    :cond_ef
    const/4 v2, 0x0

    :goto_f0
    iget-object v0, v6, Landroid/support/v7/widget/RecyclerView;->mNestedOffsets:[I

    aget v3, v0, v2

    iget-object v4, v6, Landroid/support/v7/widget/RecyclerView;->mScrollOffset:[I

    aget v4, v4, v2

    add-int/2addr v3, v4

    aput v3, v0, v2

    iget-object v0, v6, Landroid/support/v7/widget/RecyclerView;->mNestedOffsets:[I

    aget v3, v0, v1

    iget-object v4, v6, Landroid/support/v7/widget/RecyclerView;->mScrollOffset:[I

    aget v4, v4, v1

    add-int/2addr v3, v4

    aput v3, v0, v1

    goto :goto_121

    :cond_107
    const/4 v2, 0x0

    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/ViewCompat;->getOverScrollMode(Landroid/view/View;)I

    move-result v0

    const/4 v3, 0x2

    if-eq v0, v3, :cond_121

    if-eqz v9, :cond_11e

    invoke-virtual/range {p3 .. p3}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    int-to-float v3, v12

    invoke-virtual/range {p3 .. p3}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    int-to-float v5, v13

    invoke-direct {v6, v0, v3, v4, v5}, Landroid/support/v7/widget/RecyclerView;->pullGlows(FFFF)V

    :cond_11e
    invoke-direct/range {p0 .. p2}, Landroid/support/v7/widget/RecyclerView;->considerReleasingGlowsOnScroll(II)V

    :cond_121
    :goto_121
    if-nez v10, :cond_125

    if-eqz v11, :cond_128

    :cond_125
    invoke-virtual {v6, v10, v11}, Landroid/support/v7/widget/RecyclerView;->dispatchOnScrolled(II)V

    :cond_128
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->awakenScrollBars()Z

    move-result v0

    if-nez v0, :cond_131

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->invalidate()V

    :cond_131
    if-nez v10, :cond_138

    if-eqz v11, :cond_136

    goto :goto_138

    :cond_136
    move v1, v2

    nop

    :cond_138
    :goto_138
    return v1
.end method

.method public scrollTo(II)V
    .registers 5

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "RecyclerView does not support scrolling to an absolute position."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public scrollToPosition(I)V
    .registers 4

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutFrozen:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->stopScroll()V

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-nez v0, :cond_14

    const-string v0, "RecyclerView"

    const-string v1, "Cannot scroll to position a LayoutManager set. Call setLayoutManager with a non-null argument."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_14
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->scrollToPosition(I)V

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->awakenScrollBars()Z

    return-void
.end method

.method public sendAccessibilityEventUnchecked(Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 3

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView;->shouldDeferAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->sendAccessibilityEventUnchecked(Landroid/view/accessibility/AccessibilityEvent;)V

    return-void
.end method

.method public setAccessibilityDelegateCompat(Landroid/support/v7/widget/RecyclerViewAccessibilityDelegate;)V
    .registers 3

    iput-object p1, p0, Landroid/support/v7/widget/RecyclerView;->mAccessibilityDelegate:Landroid/support/v7/widget/RecyclerViewAccessibilityDelegate;

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAccessibilityDelegate:Landroid/support/v7/widget/RecyclerViewAccessibilityDelegate;

    invoke-static {p0, v0}, Landroid/support/v4/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroid/support/v4/view/AccessibilityDelegateCompat;)V

    return-void
.end method

.method public setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V
    .registers 4

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/RecyclerView;->setLayoutFrozen(Z)V

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapterInternal(Landroid/support/v7/widget/RecyclerView$Adapter;ZZ)V

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->requestLayout()V

    return-void
.end method

.method public setChildDrawingOrderCallback(Landroid/support/v7/widget/RecyclerView$ChildDrawingOrderCallback;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mChildDrawingOrderCallback:Landroid/support/v7/widget/RecyclerView$ChildDrawingOrderCallback;

    if-ne p1, v0, :cond_5

    return-void

    :cond_5
    iput-object p1, p0, Landroid/support/v7/widget/RecyclerView;->mChildDrawingOrderCallback:Landroid/support/v7/widget/RecyclerView$ChildDrawingOrderCallback;

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mChildDrawingOrderCallback:Landroid/support/v7/widget/RecyclerView$ChildDrawingOrderCallback;

    if-eqz v0, :cond_d

    const/4 v0, 0x1

    goto :goto_e

    :cond_d
    const/4 v0, 0x0

    :goto_e
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/RecyclerView;->setChildrenDrawingOrderEnabled(Z)V

    return-void
.end method

.method public setClipToPadding(Z)V
    .registers 3

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mClipToPadding:Z

    if-eq p1, v0, :cond_7

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->invalidateGlows()V

    :cond_7
    iput-boolean p1, p0, Landroid/support/v7/widget/RecyclerView;->mClipToPadding:Z

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mFirstLayoutComplete:Z

    if-eqz v0, :cond_13

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->requestLayout()V

    :cond_13
    return-void
.end method

.method public setHasFixedSize(Z)V
    .registers 2

    iput-boolean p1, p0, Landroid/support/v7/widget/RecyclerView;->mHasFixedSize:Z

    return-void
.end method

.method public setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    if-eqz v0, :cond_f

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->endAnimations()V

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setListener(Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;)V

    :cond_f
    iput-object p1, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    if-eqz v0, :cond_1c

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mItemAnimatorListener:Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setListener(Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;)V

    :cond_1c
    return-void
.end method

.method public setItemViewCacheSize(I)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Recycler;->setViewCacheSize(I)V

    return-void
.end method

.method public setLayoutFrozen(Z)V
    .registers 13

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutFrozen:Z

    if-eq p1, v0, :cond_39

    const-string v0, "Do not setLayoutFrozen in layout or scroll"

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/RecyclerView;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    if-nez p1, :cond_20

    iput-boolean p1, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutFrozen:Z

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutRequestEaten:Z

    if-eqz v0, :cond_1c

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-eqz v0, :cond_1c

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    if-eqz v0, :cond_1c

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->requestLayout()V

    :cond_1c
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutRequestEaten:Z

    goto :goto_39

    :cond_20
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v9

    const/4 v5, 0x3

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-wide v1, v9

    move-wide v3, v9

    invoke-static/range {v1 .. v8}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/RecyclerView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    iput-boolean p1, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutFrozen:Z

    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/support/v7/widget/RecyclerView;->mIgnoreMotionEventTillDown:Z

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->stopScroll()V

    :cond_39
    :goto_39
    return-void
.end method

.method public setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-ne p1, v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-eqz v0, :cond_1a

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mIsAttached:Z

    if-eqz v0, :cond_14

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {v0, p0, v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->dispatchDetachedFromWindow(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$Recycler;)V

    :cond_14
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->setRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    :cond_1a
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Recycler;->clear()V

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/ChildHelper;->removeAllViewsUnfiltered()V

    iput-object p1, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-eqz p1, :cond_5c

    iget-object v0, p1, Landroid/support/v7/widget/RecyclerView$LayoutManager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    if-nez v0, :cond_3b

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0, p0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->setRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mIsAttached:Z

    if-eqz v0, :cond_5c

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0, p0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->dispatchAttachedToWindow(Landroid/support/v7/widget/RecyclerView;)V

    goto :goto_5c

    :cond_3b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "LayoutManager "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " is already attached to a RecyclerView: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p1, Landroid/support/v7/widget/RecyclerView$LayoutManager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5c
    :goto_5c
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->requestLayout()V

    return-void
.end method

.method public setNestedScrollingEnabled(Z)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollingChildHelper:Landroid/support/v4/view/NestedScrollingChildHelper;

    invoke-virtual {v0, p1}, Landroid/support/v4/view/NestedScrollingChildHelper;->setNestedScrollingEnabled(Z)V

    return-void
.end method

.method public setOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iput-object p1, p0, Landroid/support/v7/widget/RecyclerView;->mScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    return-void
.end method

.method public setRecycledViewPool(Landroid/support/v7/widget/RecyclerView$RecycledViewPool;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Recycler;->setRecycledViewPool(Landroid/support/v7/widget/RecyclerView$RecycledViewPool;)V

    return-void
.end method

.method public setRecyclerListener(Landroid/support/v7/widget/RecyclerView$RecyclerListener;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v7/widget/RecyclerView;->mRecyclerListener:Landroid/support/v7/widget/RecyclerView$RecyclerListener;

    return-void
.end method

.method public setScrollingTouchSlop(I)V
    .registers 6

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    packed-switch p1, :pswitch_data_36

    const-string v1, "RecyclerView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setScrollingTouchSlop(): bad argument constant "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "; using default value"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2e

    :pswitch_27
    invoke-static {v0}, Landroid/support/v4/view/ViewConfigurationCompat;->getScaledPagingTouchSlop(Landroid/view/ViewConfiguration;)I

    move-result v1

    iput v1, p0, Landroid/support/v7/widget/RecyclerView;->mTouchSlop:I

    goto :goto_35

    :goto_2e
    :pswitch_2e
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    iput v1, p0, Landroid/support/v7/widget/RecyclerView;->mTouchSlop:I

    nop

    :goto_35
    return-void

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_2e
        :pswitch_27
    .end packed-switch
.end method

.method public setViewCacheExtension(Landroid/support/v7/widget/RecyclerView$ViewCacheExtension;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Recycler;->setViewCacheExtension(Landroid/support/v7/widget/RecyclerView$ViewCacheExtension;)V

    return-void
.end method

.method shouldDeferAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 4

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->isComputingLayout()Z

    move-result v0

    if-eqz v0, :cond_17

    const/4 v0, 0x0

    if-eqz p1, :cond_d

    invoke-static {p1}, Landroid/support/v4/view/accessibility/AccessibilityEventCompat;->getContentChangeTypes(Landroid/view/accessibility/AccessibilityEvent;)I

    move-result v0

    :cond_d
    if-nez v0, :cond_10

    const/4 v0, 0x0

    :cond_10
    iget v1, p0, Landroid/support/v7/widget/RecyclerView;->mEatenAccessibilityChangeFlags:I

    or-int/2addr v1, v0

    iput v1, p0, Landroid/support/v7/widget/RecyclerView;->mEatenAccessibilityChangeFlags:I

    const/4 v1, 0x1

    return v1

    :cond_17
    const/4 v0, 0x0

    return v0
.end method

.method public smoothScrollBy(II)V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-nez v0, :cond_c

    const-string v0, "RecyclerView"

    const-string v1, "Cannot smooth scroll without a LayoutManager set. Call setLayoutManager with a non-null argument."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_c
    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutFrozen:Z

    if-eqz v0, :cond_11

    return-void

    :cond_11
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollHorizontally()Z

    move-result v0

    if-nez v0, :cond_1a

    const/4 p1, 0x0

    :cond_1a
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollVertically()Z

    move-result v0

    if-nez v0, :cond_23

    const/4 p2, 0x0

    :cond_23
    if-nez p1, :cond_27

    if-eqz p2, :cond_2c

    :cond_27
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mViewFlinger:Landroid/support/v7/widget/RecyclerView$ViewFlinger;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->smoothScrollBy(II)V

    :cond_2c
    return-void
.end method

.method public smoothScrollToPosition(I)V
    .registers 4

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayoutFrozen:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-nez v0, :cond_11

    const-string v0, "RecyclerView"

    const-string v1, "Cannot smooth scroll without a LayoutManager set. Call setLayoutManager with a non-null argument."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_11
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v0, p0, v1, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->smoothScrollToPosition(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;I)V

    return-void
.end method

.method public startNestedScroll(I)Z
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollingChildHelper:Landroid/support/v4/view/NestedScrollingChildHelper;

    invoke-virtual {v0, p1}, Landroid/support/v4/view/NestedScrollingChildHelper;->startNestedScroll(I)Z

    move-result v0

    return v0
.end method

.method public stopNestedScroll()V
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mScrollingChildHelper:Landroid/support/v4/view/NestedScrollingChildHelper;

    invoke-virtual {v0}, Landroid/support/v4/view/NestedScrollingChildHelper;->stopNestedScroll()V

    return-void
.end method

.method public stopScroll()V
    .registers 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/RecyclerView;->setScrollState(I)V

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView;->stopScrollersInternal()V

    return-void
.end method

.method public swapAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;Z)V
    .registers 4

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/RecyclerView;->setLayoutFrozen(Z)V

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0, p2}, Landroid/support/v7/widget/RecyclerView;->setAdapterInternal(Landroid/support/v7/widget/RecyclerView$Adapter;ZZ)V

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView;->setDataSetChangedAfterLayout()V

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->requestLayout()V

    return-void
.end method

.method viewRangeUpdate(IILjava/lang/Object;)V
    .registers 11

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/ChildHelper;->getUnfilteredChildCount()I

    move-result v0

    add-int v1, p1, p2

    const/4 v2, 0x0

    :goto_9
    if-ge v2, v0, :cond_44

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v3, v2}, Landroid/support/v7/widget/ChildHelper;->getUnfilteredChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v4

    if-eqz v4, :cond_41

    invoke-virtual {v4}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->shouldIgnore()Z

    move-result v5

    if-eqz v5, :cond_1e

    goto :goto_41

    :cond_1e
    iget v5, v4, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    if-lt v5, p1, :cond_41

    iget v5, v4, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    if-ge v5, v1, :cond_41

    const/4 v5, 0x2

    invoke-virtual {v4, v5}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->addFlags(I)V

    invoke-virtual {v4, p3}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->addChangePayload(Ljava/lang/Object;)V

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView;->supportsChangeAnimations()Z

    move-result v5

    if-eqz v5, :cond_38

    const/16 v5, 0x40

    invoke-virtual {v4, v5}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->addFlags(I)V

    :cond_38
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    const/4 v6, 0x1

    iput-boolean v6, v5, Landroid/support/v7/widget/RecyclerView$LayoutParams;->mInsetsDirty:Z

    :cond_41
    :goto_41
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    :cond_44
    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {v2, p1, p2}, Landroid/support/v7/widget/RecyclerView$Recycler;->viewRangeUpdate(II)V

    return-void
.end method
