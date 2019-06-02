.class public Landroid/support/v4/view/ViewPager;
.super Landroid/view/ViewGroup;
.source "ViewPager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/view/ViewPager$ViewPositionComparator;,
        Landroid/support/v4/view/ViewPager$LayoutParams;,
        Landroid/support/v4/view/ViewPager$PagerObserver;,
        Landroid/support/v4/view/ViewPager$MyAccessibilityDelegate;,
        Landroid/support/v4/view/ViewPager$SavedState;,
        Landroid/support/v4/view/ViewPager$Decor;,
        Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;,
        Landroid/support/v4/view/ViewPager$PageTransformer;,
        Landroid/support/v4/view/ViewPager$SimpleOnPageChangeListener;,
        Landroid/support/v4/view/ViewPager$OnPageChangeListener;,
        Landroid/support/v4/view/ViewPager$ItemInfo;
    }
.end annotation


# static fields
.field private static final CLOSE_ENOUGH:I = 0x2

.field private static final COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Landroid/support/v4/view/ViewPager$ItemInfo;",
            ">;"
        }
    .end annotation
.end field

.field private static final DEBUG:Z = false

.field private static final DEFAULT_GUTTER_SIZE:I = 0x10

.field private static final DEFAULT_OFFSCREEN_PAGES:I = 0x1

.field private static final DRAW_ORDER_DEFAULT:I = 0x0

.field private static final DRAW_ORDER_FORWARD:I = 0x1

.field private static final DRAW_ORDER_REVERSE:I = 0x2

.field private static final INVALID_POINTER:I = -0x1

.field private static final LAYOUT_ATTRS:[I

.field private static final MAX_SETTLE_DURATION:I = 0x258

.field private static final MIN_DISTANCE_FOR_FLING:I = 0x19

.field private static final MIN_FLING_VELOCITY:I = 0x190

.field public static final SCROLL_STATE_DRAGGING:I = 0x1

.field public static final SCROLL_STATE_IDLE:I = 0x0

.field public static final SCROLL_STATE_SETTLING:I = 0x2

.field private static final TAG:Ljava/lang/String; = "ViewPager"

.field private static final USE_CACHE:Z = false

.field private static final sInterpolator:Landroid/view/animation/Interpolator;

.field private static final sPositionComparator:Landroid/support/v4/view/ViewPager$ViewPositionComparator;


# instance fields
.field private mActivePointerId:I

.field private mAdapter:Landroid/support/v4/view/PagerAdapter;

.field private mAdapterChangeListener:Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;

.field private mBottomPageBounds:I

.field private mCalledSuper:Z

.field private mChildHeightMeasureSpec:I

.field private mChildWidthMeasureSpec:I

.field private mCloseEnough:I

.field private mCurItem:I

.field private mDecorChildCount:I

.field private mDefaultGutterSize:I

.field private mDrawingOrder:I

.field private mDrawingOrderedChildren:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final mEndScrollRunnable:Ljava/lang/Runnable;

.field private mExpectedAdapterCount:I

.field private mFakeDragBeginTime:J

.field private mFakeDragging:Z

.field private mFirstLayout:Z

.field private mFirstOffset:F

.field private mFlingDistance:I

.field private mGutterSize:I

.field private mInLayout:Z

.field private mInitialMotionX:F

.field private mInitialMotionY:F

.field private mInternalPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

.field private mIsBeingDragged:Z

.field private mIsUnableToDrag:Z

.field private final mItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/support/v4/view/ViewPager$ItemInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mLastMotionX:F

.field private mLastMotionY:F

.field private mLastOffset:F

.field private mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

.field private mMarginDrawable:Landroid/graphics/drawable/Drawable;

.field private mMaximumVelocity:I

.field private mMinimumVelocity:I

.field private mNeedCalculatePageOffsets:Z

.field private mObserver:Landroid/support/v4/view/ViewPager$PagerObserver;

.field private mOffscreenPageLimit:I

.field private mOnPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

.field private mOnPageChangeListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/support/v4/view/ViewPager$OnPageChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field private mPageMargin:I

.field private mPageTransformer:Landroid/support/v4/view/ViewPager$PageTransformer;

.field private mPopulatePending:Z

.field private mRestoredAdapterState:Landroid/os/Parcelable;

.field private mRestoredClassLoader:Ljava/lang/ClassLoader;

.field private mRestoredCurItem:I

.field private mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

.field private mScrollState:I

.field private mScroller:Landroid/widget/Scroller;

.field private mScrollingCacheEnabled:Z

.field private mSetChildrenDrawingOrderEnabled:Ljava/lang/reflect/Method;

.field private final mTempItem:Landroid/support/v4/view/ViewPager$ItemInfo;

.field private final mTempRect:Landroid/graphics/Rect;

.field private mTopPageBounds:I

.field private mTouchSlop:I

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x10100b3

    aput v2, v0, v1

    sput-object v0, Landroid/support/v4/view/ViewPager;->LAYOUT_ATTRS:[I

    new-instance v0, Landroid/support/v4/view/ViewPager$1;

    invoke-direct {v0}, Landroid/support/v4/view/ViewPager$1;-><init>()V

    sput-object v0, Landroid/support/v4/view/ViewPager;->COMPARATOR:Ljava/util/Comparator;

    new-instance v0, Landroid/support/v4/view/ViewPager$2;

    invoke-direct {v0}, Landroid/support/v4/view/ViewPager$2;-><init>()V

    sput-object v0, Landroid/support/v4/view/ViewPager;->sInterpolator:Landroid/view/animation/Interpolator;

    new-instance v0, Landroid/support/v4/view/ViewPager$ViewPositionComparator;

    invoke-direct {v0}, Landroid/support/v4/view/ViewPager$ViewPositionComparator;-><init>()V

    sput-object v0, Landroid/support/v4/view/ViewPager;->sPositionComparator:Landroid/support/v4/view/ViewPager$ViewPositionComparator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    new-instance v0, Landroid/support/v4/view/ViewPager$ItemInfo;

    invoke-direct {v0}, Landroid/support/v4/view/ViewPager$ItemInfo;-><init>()V

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mTempItem:Landroid/support/v4/view/ViewPager$ItemInfo;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mTempRect:Landroid/graphics/Rect;

    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v4/view/ViewPager;->mRestoredCurItem:I

    const/4 v1, 0x0

    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mRestoredAdapterState:Landroid/os/Parcelable;

    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mRestoredClassLoader:Ljava/lang/ClassLoader;

    const v1, -0x800001

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    const v1, 0x7f7fffff    # Float.MAX_VALUE

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    const/4 v1, 0x1

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mOffscreenPageLimit:I

    iput v0, p0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    iput-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mNeedCalculatePageOffsets:Z

    new-instance v1, Landroid/support/v4/view/ViewPager$3;

    invoke-direct {v1, p0}, Landroid/support/v4/view/ViewPager$3;-><init>(Landroid/support/v4/view/ViewPager;)V

    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mEndScrollRunnable:Ljava/lang/Runnable;

    iput v0, p0, Landroid/support/v4/view/ViewPager;->mScrollState:I

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->initViewPager()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5

    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    new-instance v0, Landroid/support/v4/view/ViewPager$ItemInfo;

    invoke-direct {v0}, Landroid/support/v4/view/ViewPager$ItemInfo;-><init>()V

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mTempItem:Landroid/support/v4/view/ViewPager$ItemInfo;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mTempRect:Landroid/graphics/Rect;

    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v4/view/ViewPager;->mRestoredCurItem:I

    const/4 v1, 0x0

    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mRestoredAdapterState:Landroid/os/Parcelable;

    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mRestoredClassLoader:Ljava/lang/ClassLoader;

    const v1, -0x800001

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    const v1, 0x7f7fffff    # Float.MAX_VALUE

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    const/4 v1, 0x1

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mOffscreenPageLimit:I

    iput v0, p0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    iput-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mNeedCalculatePageOffsets:Z

    new-instance v1, Landroid/support/v4/view/ViewPager$3;

    invoke-direct {v1, p0}, Landroid/support/v4/view/ViewPager$3;-><init>(Landroid/support/v4/view/ViewPager;)V

    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mEndScrollRunnable:Ljava/lang/Runnable;

    iput v0, p0, Landroid/support/v4/view/ViewPager;->mScrollState:I

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->initViewPager()V

    return-void
.end method

.method static synthetic access$000(Landroid/support/v4/view/ViewPager;I)V
    .registers 2

    invoke-direct {p0, p1}, Landroid/support/v4/view/ViewPager;->setScrollState(I)V

    return-void
.end method

.method static synthetic access$200(Landroid/support/v4/view/ViewPager;)Landroid/support/v4/view/PagerAdapter;
    .registers 2

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    return-object v0
.end method

.method static synthetic access$300(Landroid/support/v4/view/ViewPager;)I
    .registers 2

    iget v0, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    return v0
.end method

.method static synthetic access$400()[I
    .registers 1

    sget-object v0, Landroid/support/v4/view/ViewPager;->LAYOUT_ATTRS:[I

    return-object v0
.end method

.method private calculatePageOffsets(Landroid/support/v4/view/ViewPager$ItemInfo;ILandroid/support/v4/view/ViewPager$ItemInfo;)V
    .registers 15

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v0}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v0

    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v1

    if-lez v1, :cond_12

    iget v2, p0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    int-to-float v2, v2

    int-to-float v3, v1

    div-float/2addr v2, v3

    goto :goto_13

    :cond_12
    const/4 v2, 0x0

    :goto_13
    if-eqz p3, :cond_b7

    iget v3, p3, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v4, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ge v3, v4, :cond_6d

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget v6, p3, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget v7, p3, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v6, v7

    add-float/2addr v6, v2

    add-int/lit8 v7, v3, 0x1

    :goto_25
    iget v8, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-gt v7, v8, :cond_6c

    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v4, v8, :cond_6c

    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object v5, v8

    check-cast v5, Landroid/support/v4/view/ViewPager$ItemInfo;

    :goto_3a
    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-le v7, v8, :cond_54

    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    if-ge v4, v8, :cond_54

    add-int/lit8 v4, v4, 0x1

    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object v5, v8

    check-cast v5, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_3a

    :cond_54
    :goto_54
    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ge v7, v8, :cond_63

    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v8, v7}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v8

    add-float/2addr v8, v2

    add-float/2addr v6, v8

    add-int/lit8 v7, v7, 0x1

    goto :goto_54

    :cond_63
    iput v6, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v8, v2

    add-float/2addr v6, v8

    add-int/lit8 v7, v7, 0x1

    goto :goto_25

    :cond_6c
    goto :goto_b7

    :cond_6d
    iget v4, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-le v3, v4, :cond_b7

    iget-object v4, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    const/4 v5, 0x0

    iget v6, p3, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    add-int/lit8 v7, v3, -0x1

    :goto_7e
    iget v8, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-lt v7, v8, :cond_b7

    if-ltz v4, :cond_b7

    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object v5, v8

    check-cast v5, Landroid/support/v4/view/ViewPager$ItemInfo;

    :goto_8d
    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ge v7, v8, :cond_9f

    if-lez v4, :cond_9f

    add-int/lit8 v4, v4, -0x1

    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object v5, v8

    check-cast v5, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_8d

    :cond_9f
    :goto_9f
    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-le v7, v8, :cond_ae

    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v8, v7}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v8

    add-float/2addr v8, v2

    sub-float/2addr v6, v8

    add-int/lit8 v7, v7, -0x1

    goto :goto_9f

    :cond_ae
    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v8, v2

    sub-float/2addr v6, v8

    iput v6, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    add-int/lit8 v7, v7, -0x1

    goto :goto_7e

    :cond_b7
    :goto_b7
    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    iget v4, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget v5, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    add-int/lit8 v5, v5, -0x1

    iget v6, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-nez v6, :cond_ca

    iget v6, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    goto :goto_cd

    :cond_ca
    const v6, -0x800001

    :goto_cd
    iput v6, p0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    iget v6, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    add-int/lit8 v7, v0, -0x1

    const/high16 v8, 0x3f800000    # 1.0f

    if-ne v6, v7, :cond_de

    iget v6, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget v7, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v6, v7

    sub-float/2addr v6, v8

    goto :goto_e1

    :cond_de
    const v6, 0x7f7fffff    # Float.MAX_VALUE

    :goto_e1
    iput v6, p0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    add-int/lit8 v6, p2, -0x1

    :goto_e5
    if-ltz v6, :cond_110

    iget-object v7, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/support/v4/view/ViewPager$ItemInfo;

    :goto_ef
    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-le v5, v9, :cond_ff

    iget-object v9, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    add-int/lit8 v10, v5, -0x1

    invoke-virtual {v9, v5}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v5

    add-float/2addr v5, v2

    sub-float/2addr v4, v5

    move v5, v10

    goto :goto_ef

    :cond_ff
    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v9, v2

    sub-float/2addr v4, v9

    iput v4, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-nez v9, :cond_10b

    iput v4, p0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    :cond_10b
    add-int/lit8 v6, v6, -0x1

    add-int/lit8 v5, v5, -0x1

    goto :goto_e5

    :cond_110
    iget v6, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget v7, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v6, v7

    add-float/2addr v6, v2

    iget v4, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v5, p2, 0x1

    :goto_11c
    if-ge v5, v3, :cond_14d

    iget-object v7, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/support/v4/view/ViewPager$ItemInfo;

    :goto_126
    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ge v4, v9, :cond_136

    iget-object v9, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    add-int/lit8 v10, v4, 0x1

    invoke-virtual {v9, v4}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v4

    add-float/2addr v4, v2

    add-float/2addr v6, v4

    move v4, v10

    goto :goto_126

    :cond_136
    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    add-int/lit8 v10, v0, -0x1

    if-ne v9, v10, :cond_142

    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v9, v6

    sub-float/2addr v9, v8

    iput v9, p0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    :cond_142
    iput v6, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v9, v2

    add-float/2addr v6, v9

    add-int/lit8 v5, v5, 0x1

    add-int/lit8 v4, v4, 0x1

    goto :goto_11c

    :cond_14d
    const/4 v5, 0x0

    iput-boolean v5, p0, Landroid/support/v4/view/ViewPager;->mNeedCalculatePageOffsets:Z

    return-void
.end method

.method private completeScroll(Z)V
    .registers 8

    iget v0, p0, Landroid/support/v4/view/ViewPager;->mScrollState:I

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    move v0, v1

    :goto_9
    if-eqz v0, :cond_33

    invoke-direct {p0, v1}, Landroid/support/v4/view/ViewPager;->setScrollingCacheEnabled(Z)V

    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v2}, Landroid/widget/Scroller;->abortAnimation()V

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v2

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getScrollY()I

    move-result v3

    iget-object v4, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->getCurrX()I

    move-result v4

    iget-object v5, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v5}, Landroid/widget/Scroller;->getCurrY()I

    move-result v5

    if-ne v2, v4, :cond_2b

    if-eq v3, v5, :cond_33

    :cond_2b
    invoke-virtual {p0, v4, v5}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    if-eq v4, v2, :cond_33

    invoke-direct {p0, v4}, Landroid/support/v4/view/ViewPager;->pageScrolled(I)Z

    :cond_33
    iput-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    move v2, v0

    move v0, v1

    :goto_37
    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_51

    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v4/view/ViewPager$ItemInfo;

    iget-boolean v4, v3, Landroid/support/v4/view/ViewPager$ItemInfo;->scrolling:Z

    if-eqz v4, :cond_4e

    const/4 v2, 0x1

    iput-boolean v1, v3, Landroid/support/v4/view/ViewPager$ItemInfo;->scrolling:Z

    :cond_4e
    add-int/lit8 v0, v0, 0x1

    goto :goto_37

    :cond_51
    if-eqz v2, :cond_60

    if-eqz p1, :cond_5b

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mEndScrollRunnable:Ljava/lang/Runnable;

    invoke-static {p0, v0}, Landroid/support/v4/view/ViewCompat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    goto :goto_60

    :cond_5b
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mEndScrollRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :cond_60
    :goto_60
    return-void
.end method

.method private determineTargetPage(IFII)I
    .registers 10

    invoke-static {p4}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iget v1, p0, Landroid/support/v4/view/ViewPager;->mFlingDistance:I

    if-le v0, v1, :cond_17

    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iget v1, p0, Landroid/support/v4/view/ViewPager;->mMinimumVelocity:I

    if-le v0, v1, :cond_17

    if-lez p3, :cond_14

    move v0, p1

    goto :goto_16

    :cond_14
    add-int/lit8 v0, p1, 0x1

    :goto_16
    goto :goto_26

    :cond_17
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-lt p1, v0, :cond_1f

    const v0, 0x3ecccccd    # 0.4f

    goto :goto_22

    :cond_1f
    const v0, 0x3f19999a    # 0.6f

    :goto_22
    int-to-float v1, p1

    add-float/2addr v1, p2

    add-float/2addr v1, v0

    float-to-int v0, v1

    :goto_26
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_53

    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/view/ViewPager$ItemInfo;

    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager$ItemInfo;

    iget v3, v1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v4, v2, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    invoke-static {v0, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v0

    :cond_53
    return v0
.end method

.method private dispatchOnPageScrolled(IFI)V
    .registers 7

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    invoke-interface {v0, p1, p2, p3}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageScrolled(IFI)V

    :cond_9
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    if-eqz v0, :cond_26

    const/4 v0, 0x0

    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    :goto_14
    if-ge v0, v1, :cond_26

    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v2, :cond_23

    invoke-interface {v2, p1, p2, p3}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageScrolled(IFI)V

    :cond_23
    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    :cond_26
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mInternalPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v0, :cond_2f

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mInternalPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    invoke-interface {v0, p1, p2, p3}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageScrolled(IFI)V

    :cond_2f
    return-void
.end method

.method private dispatchOnPageSelected(I)V
    .registers 5

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    invoke-interface {v0, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    :cond_9
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    if-eqz v0, :cond_26

    const/4 v0, 0x0

    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    :goto_14
    if-ge v0, v1, :cond_26

    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v2, :cond_23

    invoke-interface {v2, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    :cond_23
    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    :cond_26
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mInternalPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v0, :cond_2f

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mInternalPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    invoke-interface {v0, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    :cond_2f
    return-void
.end method

.method private dispatchOnScrollStateChanged(I)V
    .registers 5

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    invoke-interface {v0, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageScrollStateChanged(I)V

    :cond_9
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    if-eqz v0, :cond_26

    const/4 v0, 0x0

    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    :goto_14
    if-ge v0, v1, :cond_26

    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v2, :cond_23

    invoke-interface {v2, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageScrollStateChanged(I)V

    :cond_23
    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    :cond_26
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mInternalPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v0, :cond_2f

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mInternalPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    invoke-interface {v0, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageScrollStateChanged(I)V

    :cond_2f
    return-void
.end method

.method private enableLayers(Z)V
    .registers 8

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_6
    if-ge v2, v0, :cond_18

    if-eqz p1, :cond_c

    const/4 v3, 0x2

    goto :goto_d

    :cond_c
    move v3, v1

    :goto_d
    invoke-virtual {p0, v2}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v3, v5}, Landroid/support/v4/view/ViewCompat;->setLayerType(Landroid/view/View;ILandroid/graphics/Paint;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_18
    return-void
.end method

.method private endDrag()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    iput-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mIsUnableToDrag:Z

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_11

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    :cond_11
    return-void
.end method

.method private getChildRectInPagerCoordinates(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;
    .registers 7

    if-nez p1, :cond_8

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    move-object p1, v0

    :cond_8
    if-nez p2, :cond_f

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/graphics/Rect;->set(IIII)V

    return-object p1

    :cond_f
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v0

    iput v0, p1, Landroid/graphics/Rect;->left:I

    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    move-result v0

    iput v0, p1, Landroid/graphics/Rect;->right:I

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v0

    iput v0, p1, Landroid/graphics/Rect;->top:I

    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    move-result v0

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    :goto_2b
    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_5d

    if-eq v0, p0, :cond_5d

    move-object v1, v0

    check-cast v1, Landroid/view/ViewGroup;

    iget v2, p1, Landroid/graphics/Rect;->left:I

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getLeft()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/Rect;->left:I

    iget v2, p1, Landroid/graphics/Rect;->right:I

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getRight()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/Rect;->right:I

    iget v2, p1, Landroid/graphics/Rect;->top:I

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getTop()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/Rect;->top:I

    iget v2, p1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getBottom()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    goto :goto_2b

    :cond_5d
    return-object p1
.end method

.method private getClientWidth()I
    .registers 3

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method private infoForCurrentScrollPosition()Landroid/support/v4/view/ViewPager$ItemInfo;
    .registers 15

    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_f

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v2

    int-to-float v2, v2

    int-to-float v3, v0

    div-float/2addr v2, v3

    goto :goto_10

    :cond_f
    move v2, v1

    :goto_10
    if-lez v0, :cond_18

    iget v1, p0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    int-to-float v1, v1

    int-to-float v3, v0

    div-float/2addr v1, v3

    nop

    :cond_18
    const/4 v3, -0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x0

    :goto_1e
    iget-object v9, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v8, v9, :cond_76

    iget-object v9, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/support/v4/view/ViewPager$ItemInfo;

    if-nez v6, :cond_4d

    iget v10, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    add-int/lit8 v11, v3, 0x1

    if-eq v10, v11, :cond_4d

    iget-object v9, p0, Landroid/support/v4/view/ViewPager;->mTempItem:Landroid/support/v4/view/ViewPager$ItemInfo;

    add-float v10, v4, v5

    add-float/2addr v10, v1

    iput v10, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    add-int/lit8 v10, v3, 0x1

    iput v10, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget-object v10, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget v11, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    invoke-virtual {v10, v11}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v10

    iput v10, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-int/lit8 v8, v8, -0x1

    :cond_4d
    iget v10, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    move v11, v10

    iget v12, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v12, v10

    add-float/2addr v12, v1

    if-nez v6, :cond_5c

    cmpl-float v13, v2, v11

    if-ltz v13, :cond_5b

    goto :goto_5c

    :cond_5b
    return-object v7

    :cond_5c
    :goto_5c
    cmpg-float v13, v2, v12

    if-ltz v13, :cond_75

    iget-object v13, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    if-ne v8, v13, :cond_6b

    goto :goto_75

    :cond_6b
    const/4 v6, 0x0

    iget v3, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    move v4, v10

    iget v5, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    move-object v7, v9

    add-int/lit8 v8, v8, 0x1

    goto :goto_1e

    :cond_75
    :goto_75
    return-object v9

    :cond_76
    return-object v7
.end method

.method private isGutterDrag(FF)Z
    .registers 6

    iget v0, p0, Landroid/support/v4/view/ViewPager;->mGutterSize:I

    int-to-float v0, v0

    cmpg-float v0, p1, v0

    const/4 v1, 0x0

    if-gez v0, :cond_c

    cmpl-float v0, p2, v1

    if-gtz v0, :cond_1c

    :cond_c
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getWidth()I

    move-result v0

    iget v2, p0, Landroid/support/v4/view/ViewPager;->mGutterSize:I

    sub-int/2addr v0, v2

    int-to-float v0, v0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_1e

    cmpg-float v0, p2, v1

    if-gez v0, :cond_1e

    :cond_1c
    const/4 v0, 0x1

    goto :goto_1f

    :cond_1e
    const/4 v0, 0x0

    :goto_1f
    return v0
.end method

.method private onSecondaryPointerUp(Landroid/view/MotionEvent;)V
    .registers 6

    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getActionIndex(Landroid/view/MotionEvent;)I

    move-result v0

    invoke-static {p1, v0}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v1

    iget v2, p0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    if-ne v1, v2, :cond_26

    if-nez v0, :cond_10

    const/4 v2, 0x1

    goto :goto_11

    :cond_10
    const/4 v2, 0x0

    :goto_11
    invoke-static {p1, v2}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v3

    iput v3, p0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    invoke-static {p1, v2}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v3

    iput v3, p0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v3, :cond_26

    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v3}, Landroid/view/VelocityTracker;->clear()V

    :cond_26
    return-void
.end method

.method private pageScrolled(I)Z
    .registers 11

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1c

    iput-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mCalledSuper:Z

    const/4 v0, 0x0

    invoke-virtual {p0, v1, v0, v1}, Landroid/support/v4/view/ViewPager;->onPageScrolled(IFI)V

    iget-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mCalledSuper:Z

    if-eqz v0, :cond_14

    return v1

    :cond_14
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "onPageScrolled did not call superclass implementation"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1c
    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->infoForCurrentScrollPosition()Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v0

    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v2

    iget v3, p0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    add-int/2addr v3, v2

    iget v4, p0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    int-to-float v4, v4

    int-to-float v5, v2

    div-float/2addr v4, v5

    iget v5, v0, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    int-to-float v6, p1

    int-to-float v7, v2

    div-float/2addr v6, v7

    iget v7, v0, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    sub-float/2addr v6, v7

    iget v7, v0, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v7, v4

    div-float/2addr v6, v7

    int-to-float v7, v3

    mul-float/2addr v7, v6

    float-to-int v7, v7

    iput-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mCalledSuper:Z

    invoke-virtual {p0, v5, v6, v7}, Landroid/support/v4/view/ViewPager;->onPageScrolled(IFI)V

    iget-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mCalledSuper:Z

    if-eqz v1, :cond_46

    const/4 v1, 0x1

    return v1

    :cond_46
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v8, "onPageScrolled did not call superclass implementation"

    invoke-direct {v1, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private performDrag(F)Z
    .registers 19

    move-object/from16 v0, p0

    move/from16 v1, p1

    const/4 v2, 0x0

    iget v3, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    sub-float/2addr v3, v1

    iput v1, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v4

    int-to-float v4, v4

    add-float v5, v4, v3

    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v6

    int-to-float v7, v6

    iget v8, v0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    mul-float/2addr v7, v8

    int-to-float v8, v6

    iget v9, v0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    mul-float/2addr v8, v9

    const/4 v9, 0x1

    const/4 v10, 0x1

    iget-object v11, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/support/v4/view/ViewPager$ItemInfo;

    iget-object v12, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    iget-object v13, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/support/v4/view/ViewPager$ItemInfo;

    iget v13, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-eqz v13, :cond_42

    const/4 v9, 0x0

    iget v13, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    int-to-float v14, v6

    mul-float v7, v13, v14

    :cond_42
    iget v13, v12, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget-object v14, v0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v14}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v14

    add-int/lit8 v14, v14, -0x1

    if-eq v13, v14, :cond_54

    const/4 v10, 0x0

    iget v13, v12, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    int-to-float v14, v6

    mul-float v8, v13, v14

    :cond_54
    cmpg-float v13, v5, v7

    if-gez v13, :cond_6b

    if-eqz v9, :cond_69

    sub-float v13, v7, v5

    iget-object v14, v0, Landroid/support/v4/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-static {v13}, Ljava/lang/Math;->abs(F)F

    move-result v15

    int-to-float v1, v6

    div-float/2addr v15, v1

    invoke-virtual {v14, v15}, Landroid/support/v4/widget/EdgeEffectCompat;->onPull(F)Z

    move-result v1

    move v2, v1

    :cond_69
    move v5, v7

    goto :goto_81

    :cond_6b
    cmpl-float v1, v5, v8

    if-lez v1, :cond_81

    if-eqz v10, :cond_80

    sub-float v1, v5, v8

    iget-object v13, v0, Landroid/support/v4/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v14

    int-to-float v15, v6

    div-float/2addr v14, v15

    invoke-virtual {v13, v14}, Landroid/support/v4/widget/EdgeEffectCompat;->onPull(F)Z

    move-result v1

    move v2, v1

    :cond_80
    move v5, v8

    :cond_81
    :goto_81
    iget v1, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    float-to-int v13, v5

    int-to-float v13, v13

    sub-float v13, v5, v13

    add-float/2addr v1, v13

    iput v1, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    float-to-int v1, v5

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollY()I

    move-result v13

    invoke-virtual {v0, v1, v13}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    float-to-int v1, v5

    invoke-direct {v0, v1}, Landroid/support/v4/view/ViewPager;->pageScrolled(I)Z

    return v2
.end method

.method private recomputeScrollPosition(IIII)V
    .registers 22

    move-object/from16 v0, p0

    move/from16 v1, p1

    if-lez p2, :cond_66

    iget-object v2, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_66

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingLeft()I

    move-result v2

    sub-int v2, v1, v2

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingRight()I

    move-result v3

    sub-int/2addr v2, v3

    add-int v2, v2, p3

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingLeft()I

    move-result v4

    sub-int v4, p2, v4

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingRight()I

    move-result v5

    sub-int/2addr v4, v5

    add-int v4, v4, p4

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v6

    int-to-float v7, v6

    int-to-float v8, v4

    div-float/2addr v7, v8

    int-to-float v8, v2

    mul-float/2addr v8, v7

    float-to-int v8, v8

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollY()I

    move-result v9

    invoke-virtual {v0, v8, v9}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    iget-object v9, v0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v9}, Landroid/widget/Scroller;->isFinished()Z

    move-result v9

    if-nez v9, :cond_65

    iget-object v9, v0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v9}, Landroid/widget/Scroller;->getDuration()I

    move-result v9

    iget-object v10, v0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v10}, Landroid/widget/Scroller;->timePassed()I

    move-result v10

    sub-int v15, v9, v10

    iget v9, v0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    invoke-virtual {v0, v9}, Landroid/support/v4/view/ViewPager;->infoForPosition(I)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v14

    iget-object v9, v0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    const/4 v11, 0x0

    iget v10, v14, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    int-to-float v12, v1

    mul-float/2addr v10, v12

    float-to-int v12, v10

    const/4 v13, 0x0

    move v10, v8

    move-object/from16 v16, v14

    move v14, v15

    invoke-virtual/range {v9 .. v14}, Landroid/widget/Scroller;->startScroll(IIIII)V

    :cond_65
    goto :goto_97

    :cond_66
    iget v2, v0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    invoke-virtual {v0, v2}, Landroid/support/v4/view/ViewPager;->infoForPosition(I)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v2

    if-eqz v2, :cond_77

    iget v4, v2, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget v6, v0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    invoke-static {v4, v6}, Ljava/lang/Math;->min(FF)F

    move-result v4

    goto :goto_78

    :cond_77
    const/4 v4, 0x0

    :goto_78
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingLeft()I

    move-result v6

    sub-int v6, v1, v6

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingRight()I

    move-result v7

    sub-int/2addr v6, v7

    int-to-float v6, v6

    mul-float/2addr v6, v4

    float-to-int v6, v6

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v7

    if-eq v6, v7, :cond_97

    const/4 v7, 0x0

    invoke-direct {v0, v7}, Landroid/support/v4/view/ViewPager;->completeScroll(Z)V

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollY()I

    move-result v7

    invoke-virtual {v0, v6, v7}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    :cond_97
    :goto_97
    return-void
.end method

.method private removeNonDecorViews()V
    .registers 5

    const/4 v0, 0x0

    :goto_1
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1d

    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager$LayoutParams;

    iget-boolean v3, v2, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-nez v3, :cond_1a

    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->removeViewAt(I)V

    add-int/lit8 v0, v0, -0x1

    :cond_1a
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1d
    return-void
.end method

.method private requestParentDisallowInterceptTouchEvent(Z)V
    .registers 3

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_9

    invoke-interface {v0, p1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_9
    return-void
.end method

.method private scrollToItem(IZIZ)V
    .registers 12

    invoke-virtual {p0, p1}, Landroid/support/v4/view/ViewPager;->infoForPosition(I)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1c

    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v2

    int-to-float v3, v2

    iget v4, p0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    iget v5, v0, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget v6, p0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    invoke-static {v5, v6}, Ljava/lang/Math;->min(FF)F

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    move-result v4

    mul-float/2addr v3, v4

    float-to-int v1, v3

    :cond_1c
    const/4 v2, 0x0

    if-eqz p2, :cond_28

    invoke-virtual {p0, v1, v2, p3}, Landroid/support/v4/view/ViewPager;->smoothScrollTo(III)V

    if-eqz p4, :cond_36

    invoke-direct {p0, p1}, Landroid/support/v4/view/ViewPager;->dispatchOnPageSelected(I)V

    goto :goto_36

    :cond_28
    if-eqz p4, :cond_2d

    invoke-direct {p0, p1}, Landroid/support/v4/view/ViewPager;->dispatchOnPageSelected(I)V

    :cond_2d
    invoke-direct {p0, v2}, Landroid/support/v4/view/ViewPager;->completeScroll(Z)V

    invoke-virtual {p0, v1, v2}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    invoke-direct {p0, v1}, Landroid/support/v4/view/ViewPager;->pageScrolled(I)Z

    :cond_36
    :goto_36
    return-void
.end method

.method private setScrollState(I)V
    .registers 3

    iget v0, p0, Landroid/support/v4/view/ViewPager;->mScrollState:I

    if-ne v0, p1, :cond_5

    return-void

    :cond_5
    iput p1, p0, Landroid/support/v4/view/ViewPager;->mScrollState:I

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mPageTransformer:Landroid/support/v4/view/ViewPager$PageTransformer;

    if-eqz v0, :cond_13

    if-eqz p1, :cond_f

    const/4 v0, 0x1

    goto :goto_10

    :cond_f
    const/4 v0, 0x0

    :goto_10
    invoke-direct {p0, v0}, Landroid/support/v4/view/ViewPager;->enableLayers(Z)V

    :cond_13
    invoke-direct {p0, p1}, Landroid/support/v4/view/ViewPager;->dispatchOnScrollStateChanged(I)V

    return-void
.end method

.method private setScrollingCacheEnabled(Z)V
    .registers 3

    iget-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mScrollingCacheEnabled:Z

    if-eq v0, p1, :cond_6

    iput-boolean p1, p0, Landroid/support/v4/view/ViewPager;->mScrollingCacheEnabled:Z

    :cond_6
    return-void
.end method

.method private sortChildDrawingOrder()V
    .registers 5

    iget v0, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrder:I

    if-eqz v0, :cond_2f

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrderedChildren:Ljava/util/ArrayList;

    if-nez v0, :cond_10

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrderedChildren:Ljava/util/ArrayList;

    goto :goto_15

    :cond_10
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrderedChildren:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :goto_15
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_1a
    if-ge v1, v0, :cond_28

    invoke-virtual {p0, v1}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrderedChildren:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_1a

    :cond_28
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrderedChildren:Ljava/util/ArrayList;

    sget-object v2, Landroid/support/v4/view/ViewPager;->sPositionComparator:Landroid/support/v4/view/ViewPager$ViewPositionComparator;

    invoke-static {v1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    :cond_2f
    return-void
.end method


# virtual methods
.method public addFocusables(Ljava/util/ArrayList;II)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;II)V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getDescendantFocusability()I

    move-result v1

    const/high16 v2, 0x60000

    if-eq v1, v2, :cond_2f

    const/4 v2, 0x0

    :goto_d
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v3

    if-ge v2, v3, :cond_2f

    invoke-virtual {p0, v2}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_2c

    invoke-virtual {p0, v3}, Landroid/support/v4/view/ViewPager;->infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v4

    if-eqz v4, :cond_2c

    iget v5, v4, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v6, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ne v5, v6, :cond_2c

    invoke-virtual {v3, p1, p2, p3}, Landroid/view/View;->addFocusables(Ljava/util/ArrayList;II)V

    :cond_2c
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    :cond_2f
    const/high16 v2, 0x40000

    if-ne v1, v2, :cond_39

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ne v0, v2, :cond_57

    :cond_39
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->isFocusable()Z

    move-result v2

    if-nez v2, :cond_40

    return-void

    :cond_40
    and-int/lit8 v2, p3, 0x1

    const/4 v3, 0x1

    if-ne v2, v3, :cond_52

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->isInTouchMode()Z

    move-result v2

    if-eqz v2, :cond_52

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->isFocusableInTouchMode()Z

    move-result v2

    if-nez v2, :cond_52

    return-void

    :cond_52
    if-eqz p1, :cond_57

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_57
    return-void
.end method

.method addNewItem(II)Landroid/support/v4/view/ViewPager$ItemInfo;
    .registers 5

    new-instance v0, Landroid/support/v4/view/ViewPager$ItemInfo;

    invoke-direct {v0}, Landroid/support/v4/view/ViewPager$ItemInfo;-><init>()V

    iput p1, v0, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v1, p0, p1}, Landroid/support/v4/view/PagerAdapter;->instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v4/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v1, p1}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v1

    iput v1, v0, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    if-ltz p2, :cond_28

    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt p2, v1, :cond_22

    goto :goto_28

    :cond_22
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1, p2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_2d

    :cond_28
    :goto_28
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_2d
    return-object v0
.end method

.method public addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    if-nez v0, :cond_b

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    :cond_b
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public addTouchables(Ljava/util/ArrayList;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    :goto_1
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_23

    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-nez v2, :cond_20

    invoke-virtual {p0, v1}, Landroid/support/v4/view/ViewPager;->infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v2

    if-eqz v2, :cond_20

    iget v3, v2, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v4, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ne v3, v4, :cond_20

    invoke-virtual {v1, p1}, Landroid/view/View;->addTouchables(Ljava/util/ArrayList;)V

    :cond_20
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_23
    return-void
.end method

.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .registers 7

    invoke-virtual {p0, p3}, Landroid/support/v4/view/ViewPager;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result v0

    if-nez v0, :cond_a

    invoke-virtual {p0, p3}, Landroid/support/v4/view/ViewPager;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object p3

    :cond_a
    move-object v0, p3

    check-cast v0, Landroid/support/v4/view/ViewPager$LayoutParams;

    iget-boolean v1, v0, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    instance-of v2, p1, Landroid/support/v4/view/ViewPager$Decor;

    or-int/2addr v1, v2

    iput-boolean v1, v0, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    iget-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mInLayout:Z

    if-eqz v1, :cond_2e

    if-eqz v0, :cond_27

    iget-boolean v1, v0, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-nez v1, :cond_1f

    goto :goto_27

    :cond_1f
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Cannot add pager decor view during layout"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_27
    :goto_27
    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/support/v4/view/ViewPager$LayoutParams;->needsMeasure:Z

    invoke-virtual {p0, p1, p2, p3}, Landroid/support/v4/view/ViewPager;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)Z

    goto :goto_31

    :cond_2e
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    :goto_31
    return-void
.end method

.method public arrowScroll(I)Z
    .registers 8

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->findFocus()Landroid/view/View;

    move-result-object v0

    if-ne v0, p0, :cond_8

    const/4 v0, 0x0

    goto :goto_66

    :cond_8
    if-eqz v0, :cond_66

    const/4 v1, 0x0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    :goto_f
    instance-of v3, v2, Landroid/view/ViewGroup;

    if-eqz v3, :cond_1c

    if-ne v2, p0, :cond_17

    const/4 v1, 0x1

    goto :goto_1c

    :cond_17
    invoke-interface {v2}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    goto :goto_f

    :cond_1c
    :goto_1c
    if-nez v1, :cond_66

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    :goto_32
    instance-of v4, v3, Landroid/view/ViewGroup;

    if-eqz v4, :cond_4b

    const-string v4, " => "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v3}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    goto :goto_32

    :cond_4b
    const-string v3, "ViewPager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "arrowScroll tried to find focus based on non-child current focused view "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    :cond_66
    :goto_66
    const/4 v1, 0x0

    invoke-static {}, Landroid/view/FocusFinder;->getInstance()Landroid/view/FocusFinder;

    move-result-object v2

    invoke-virtual {v2, p0, v0, p1}, Landroid/view/FocusFinder;->findNextFocus(Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    move-result-object v2

    const/16 v3, 0x42

    const/16 v4, 0x11

    if-eqz v2, :cond_b7

    if-eq v2, v0, :cond_b7

    if-ne p1, v4, :cond_97

    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mTempRect:Landroid/graphics/Rect;

    invoke-direct {p0, v3, v2}, Landroid/support/v4/view/ViewPager;->getChildRectInPagerCoordinates(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->left:I

    iget-object v4, p0, Landroid/support/v4/view/ViewPager;->mTempRect:Landroid/graphics/Rect;

    invoke-direct {p0, v4, v0}, Landroid/support/v4/view/ViewPager;->getChildRectInPagerCoordinates(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v4

    iget v4, v4, Landroid/graphics/Rect;->left:I

    if-eqz v0, :cond_92

    if-lt v3, v4, :cond_92

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->pageLeft()Z

    move-result v1

    goto :goto_96

    :cond_92
    invoke-virtual {v2}, Landroid/view/View;->requestFocus()Z

    move-result v1

    :goto_96
    goto :goto_cb

    :cond_97
    if-ne p1, v3, :cond_cb

    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mTempRect:Landroid/graphics/Rect;

    invoke-direct {p0, v3, v2}, Landroid/support/v4/view/ViewPager;->getChildRectInPagerCoordinates(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->left:I

    iget-object v4, p0, Landroid/support/v4/view/ViewPager;->mTempRect:Landroid/graphics/Rect;

    invoke-direct {p0, v4, v0}, Landroid/support/v4/view/ViewPager;->getChildRectInPagerCoordinates(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v4

    iget v4, v4, Landroid/graphics/Rect;->left:I

    if-eqz v0, :cond_b2

    if-gt v3, v4, :cond_b2

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->pageRight()Z

    move-result v1

    goto :goto_b6

    :cond_b2
    invoke-virtual {v2}, Landroid/view/View;->requestFocus()Z

    move-result v1

    :goto_b6
    goto :goto_cb

    :cond_b7
    if-eq p1, v4, :cond_c7

    const/4 v4, 0x1

    if-ne p1, v4, :cond_bd

    goto :goto_c7

    :cond_bd
    if-eq p1, v3, :cond_c2

    const/4 v3, 0x2

    if-ne p1, v3, :cond_cb

    :cond_c2
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->pageRight()Z

    move-result v1

    goto :goto_cb

    :cond_c7
    :goto_c7
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->pageLeft()Z

    move-result v1

    :cond_cb
    :goto_cb
    if-eqz v1, :cond_d4

    invoke-static {p1}, Landroid/view/SoundEffectConstants;->getContantForFocusDirection(I)I

    move-result v3

    invoke-virtual {p0, v3}, Landroid/support/v4/view/ViewPager;->playSoundEffect(I)V

    :cond_d4
    return v1
.end method

.method public beginFakeDrag()Z
    .registers 13

    iget-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    if-eqz v0, :cond_6

    const/4 v0, 0x0

    return v0

    :cond_6
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mFakeDragging:Z

    invoke-direct {p0, v0}, Landroid/support/v4/view/ViewPager;->setScrollState(I)V

    const/4 v1, 0x0

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v1, :cond_1c

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    goto :goto_21

    :cond_1c
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v1}, Landroid/view/VelocityTracker;->clear()V

    :goto_21
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v10

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-wide v2, v10

    move-wide v4, v10

    invoke-static/range {v2 .. v9}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v2, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    iput-wide v10, p0, Landroid/support/v4/view/ViewPager;->mFakeDragBeginTime:J

    return v0
.end method

.method protected canScroll(Landroid/view/View;ZIII)Z
    .registers 20

    move-object v0, p1

    instance-of v1, v0, Landroid/view/ViewGroup;

    const/4 v2, 0x1

    if-eqz v1, :cond_5c

    move-object v1, v0

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/View;->getScrollX()I

    move-result v3

    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result v4

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    add-int/lit8 v6, v5, -0x1

    :goto_17
    if-ltz v6, :cond_5c

    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v13

    add-int v7, p4, v3

    invoke-virtual {v13}, Landroid/view/View;->getLeft()I

    move-result v8

    if-lt v7, v8, :cond_59

    add-int v7, p4, v3

    invoke-virtual {v13}, Landroid/view/View;->getRight()I

    move-result v8

    if-ge v7, v8, :cond_59

    add-int v7, p5, v4

    invoke-virtual {v13}, Landroid/view/View;->getTop()I

    move-result v8

    if-lt v7, v8, :cond_59

    add-int v7, p5, v4

    invoke-virtual {v13}, Landroid/view/View;->getBottom()I

    move-result v8

    if-ge v7, v8, :cond_59

    const/4 v9, 0x1

    add-int v7, p4, v3

    invoke-virtual {v13}, Landroid/view/View;->getLeft()I

    move-result v8

    sub-int v11, v7, v8

    add-int v7, p5, v4

    invoke-virtual {v13}, Landroid/view/View;->getTop()I

    move-result v8

    sub-int v12, v7, v8

    move-object v7, p0

    move-object v8, v13

    move/from16 v10, p3

    invoke-virtual/range {v7 .. v12}, Landroid/support/v4/view/ViewPager;->canScroll(Landroid/view/View;ZIII)Z

    move-result v7

    if-eqz v7, :cond_59

    return v2

    :cond_59
    add-int/lit8 v6, v6, -0x1

    goto :goto_17

    :cond_5c
    if-eqz p2, :cond_68

    move/from16 v3, p3

    neg-int v4, v3

    invoke-static {v0, v4}, Landroid/support/v4/view/ViewCompat;->canScrollHorizontally(Landroid/view/View;I)Z

    move-result v4

    if-eqz v4, :cond_6a

    goto :goto_6b

    :cond_68
    move/from16 v3, p3

    :cond_6a
    const/4 v2, 0x0

    :goto_6b
    return v2
.end method

.method public canScrollHorizontally(I)Z
    .registers 8

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v2

    const/4 v3, 0x1

    if-gez p1, :cond_1b

    int-to-float v4, v0

    iget v5, p0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    mul-float/2addr v4, v5

    float-to-int v4, v4

    if-le v2, v4, :cond_1a

    move v1, v3

    nop

    :cond_1a
    return v1

    :cond_1b
    if-lez p1, :cond_27

    int-to-float v4, v0

    iget v5, p0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    mul-float/2addr v4, v5

    float-to-int v4, v4

    if-ge v2, v4, :cond_26

    move v1, v3

    nop

    :cond_26
    return v1

    :cond_27
    return v1
.end method

.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 3

    instance-of v0, p1, Landroid/support/v4/view/ViewPager$LayoutParams;

    if-eqz v0, :cond_c

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    :goto_d
    return v0
.end method

.method public clearOnPageChangeListeners()V
    .registers 2

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    :cond_9
    return-void
.end method

.method public computeScroll()V
    .registers 6

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_3e

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v0

    if-eqz v0, :cond_3e

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getScrollY()I

    move-result v1

    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v2}, Landroid/widget/Scroller;->getCurrX()I

    move-result v2

    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v3}, Landroid/widget/Scroller;->getCurrY()I

    move-result v3

    if-ne v0, v2, :cond_28

    if-eq v1, v3, :cond_3a

    :cond_28
    invoke-virtual {p0, v2, v3}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    invoke-direct {p0, v2}, Landroid/support/v4/view/ViewPager;->pageScrolled(I)Z

    move-result v4

    if-nez v4, :cond_3a

    iget-object v4, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->abortAnimation()V

    const/4 v4, 0x0

    invoke-virtual {p0, v4, v3}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    :cond_3a
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    return-void

    :cond_3e
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Landroid/support/v4/view/ViewPager;->completeScroll(Z)V

    return-void
.end method

.method dataSetChanged()V
    .registers 13

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v0}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v0

    iput v0, p0, Landroid/support/v4/view/ViewPager;->mExpectedAdapterCount:I

    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget v2, p0, Landroid/support/v4/view/ViewPager;->mOffscreenPageLimit:I

    mul-int/lit8 v2, v2, 0x2

    const/4 v3, 0x1

    add-int/2addr v2, v3

    const/4 v4, 0x0

    if-ge v1, v2, :cond_21

    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v1, v0, :cond_21

    move v1, v3

    goto :goto_22

    :cond_21
    move v1, v4

    :goto_22
    iget v2, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    const/4 v5, 0x0

    move v6, v2

    move v2, v1

    move v1, v4

    :goto_28
    iget-object v7, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v1, v7, :cond_84

    iget-object v7, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/support/v4/view/ViewPager$ItemInfo;

    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v8, v9}, Landroid/support/v4/view/PagerAdapter;->getItemPosition(Ljava/lang/Object;)I

    move-result v8

    const/4 v9, -0x1

    if-ne v8, v9, :cond_44

    goto :goto_82

    :cond_44
    const/4 v9, -0x2

    if-ne v8, v9, :cond_74

    iget-object v9, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    add-int/lit8 v1, v1, -0x1

    if-nez v5, :cond_56

    iget-object v9, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v9, p0}, Landroid/support/v4/view/PagerAdapter;->startUpdate(Landroid/view/ViewGroup;)V

    const/4 v5, 0x1

    :cond_56
    iget-object v9, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget v10, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget-object v11, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v9, p0, v10, v11}, Landroid/support/v4/view/PagerAdapter;->destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    const/4 v2, 0x1

    iget v9, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    iget v10, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ne v9, v10, :cond_82

    iget v9, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    add-int/lit8 v10, v0, -0x1

    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v9

    invoke-static {v4, v9}, Ljava/lang/Math;->max(II)I

    move-result v6

    const/4 v2, 0x1

    goto :goto_82

    :cond_74
    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-eq v9, v8, :cond_82

    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v10, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ne v9, v10, :cond_7f

    move v6, v8

    :cond_7f
    iput v8, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    const/4 v2, 0x1

    :cond_82
    :goto_82
    add-int/2addr v1, v3

    goto :goto_28

    :cond_84
    if-eqz v5, :cond_8b

    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v1, p0}, Landroid/support/v4/view/PagerAdapter;->finishUpdate(Landroid/view/ViewGroup;)V

    :cond_8b
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    sget-object v7, Landroid/support/v4/view/ViewPager;->COMPARATOR:Ljava/util/Comparator;

    invoke-static {v1, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    if-eqz v2, :cond_b5

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v1

    move v7, v4

    :goto_99
    if-ge v7, v1, :cond_af

    invoke-virtual {p0, v7}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Landroid/support/v4/view/ViewPager$LayoutParams;

    iget-boolean v10, v9, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-nez v10, :cond_ac

    const/4 v10, 0x0

    iput v10, v9, Landroid/support/v4/view/ViewPager$LayoutParams;->widthFactor:F

    :cond_ac
    add-int/lit8 v7, v7, 0x1

    goto :goto_99

    :cond_af
    invoke-virtual {p0, v6, v4, v3}, Landroid/support/v4/view/ViewPager;->setCurrentItemInternal(IZZ)V

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->requestLayout()V

    :cond_b5
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 3

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_f

    invoke-virtual {p0, p1}, Landroid/support/v4/view/ViewPager;->executeKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_d

    goto :goto_f

    :cond_d
    const/4 v0, 0x0

    goto :goto_10

    :cond_f
    :goto_f
    const/4 v0, 0x1

    :goto_10
    return v0
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 9

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v0

    const/16 v1, 0x1000

    if-ne v0, v1, :cond_d

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v0

    return v0

    :cond_d
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_13
    if-ge v2, v0, :cond_36

    invoke-virtual {p0, v2}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_33

    invoke-virtual {p0, v3}, Landroid/support/v4/view/ViewPager;->infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v4

    if-eqz v4, :cond_33

    iget v5, v4, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v6, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ne v5, v6, :cond_33

    invoke-virtual {v3, p1}, Landroid/view/View;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v5

    if-eqz v5, :cond_33

    const/4 v1, 0x1

    return v1

    :cond_33
    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    :cond_36
    return v1
.end method

.method distanceInfluenceForSnapDuration(F)F
    .registers 6

    const/high16 v0, 0x3f000000    # 0.5f

    sub-float/2addr p1, v0

    float-to-double v0, p1

    const-wide v2, 0x3fde28c7460698c7L    # 0.4712389167638204

    mul-double/2addr v0, v2

    double-to-float p1, v0

    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 10

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->draw(Landroid/graphics/Canvas;)V

    const/4 v0, 0x0

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getOverScrollMode(Landroid/view/View;)I

    move-result v1

    if-eqz v1, :cond_26

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1a

    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v3, :cond_1a

    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v3}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v3

    if-le v3, v2, :cond_1a

    goto :goto_26

    :cond_1a
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v2}, Landroid/support/v4/widget/EdgeEffectCompat;->finish()V

    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v2}, Landroid/support/v4/widget/EdgeEffectCompat;->finish()V

    goto/16 :goto_aa

    :cond_26
    :goto_26
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v2}, Landroid/support/v4/widget/EdgeEffectCompat;->isFinished()Z

    move-result v2

    if-nez v2, :cond_66

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v2

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getHeight()I

    move-result v3

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingTop()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingBottom()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getWidth()I

    move-result v4

    const/high16 v5, 0x43870000    # 270.0f

    invoke-virtual {p1, v5}, Landroid/graphics/Canvas;->rotate(F)V

    neg-int v5, v3

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingTop()I

    move-result v6

    add-int/2addr v5, v6

    int-to-float v5, v5

    iget v6, p0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    int-to-float v7, v4

    mul-float/2addr v6, v7

    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v5, p0, Landroid/support/v4/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v5, v3, v4}, Landroid/support/v4/widget/EdgeEffectCompat;->setSize(II)V

    iget-object v5, p0, Landroid/support/v4/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v5, p1}, Landroid/support/v4/widget/EdgeEffectCompat;->draw(Landroid/graphics/Canvas;)Z

    move-result v5

    or-int/2addr v0, v5

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_66
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v2}, Landroid/support/v4/widget/EdgeEffectCompat;->isFinished()Z

    move-result v2

    if-nez v2, :cond_aa

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v2

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getHeight()I

    move-result v4

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingTop()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingBottom()I

    move-result v5

    sub-int/2addr v4, v5

    const/high16 v5, 0x42b40000    # 90.0f

    invoke-virtual {p1, v5}, Landroid/graphics/Canvas;->rotate(F)V

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingTop()I

    move-result v5

    neg-int v5, v5

    int-to-float v5, v5

    iget v6, p0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    const/high16 v7, 0x3f800000    # 1.0f

    add-float/2addr v6, v7

    neg-float v6, v6

    int-to-float v7, v3

    mul-float/2addr v6, v7

    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v5, p0, Landroid/support/v4/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v5, v4, v3}, Landroid/support/v4/widget/EdgeEffectCompat;->setSize(II)V

    iget-object v5, p0, Landroid/support/v4/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v5, p1}, Landroid/support/v4/widget/EdgeEffectCompat;->draw(Landroid/graphics/Canvas;)Z

    move-result v5

    or-int/2addr v0, v5

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    nop

    :cond_aa
    :goto_aa
    if-eqz v0, :cond_af

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    :cond_af
    return-void
.end method

.method protected drawableStateChanged()V
    .registers 3

    invoke-super {p0}, Landroid/view/ViewGroup;->drawableStateChanged()V

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_14

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v1

    if-eqz v1, :cond_14

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    :cond_14
    return-void
.end method

.method public endFakeDrag()V
    .registers 11

    iget-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mFakeDragging:Z

    if-eqz v0, :cond_43

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v1, 0x3e8

    iget v2, p0, Landroid/support/v4/view/ViewPager;->mMaximumVelocity:I

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    iget v1, p0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    invoke-static {v0, v1}, Landroid/support/v4/view/VelocityTrackerCompat;->getXVelocity(Landroid/view/VelocityTracker;I)F

    move-result v1

    float-to-int v1, v1

    const/4 v2, 0x1

    iput-boolean v2, p0, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v4

    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->infoForCurrentScrollPosition()Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v5

    iget v6, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    int-to-float v7, v4

    int-to-float v8, v3

    div-float/2addr v7, v8

    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    sub-float/2addr v7, v8

    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    div-float/2addr v7, v8

    iget v8, p0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    iget v9, p0, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    sub-float/2addr v8, v9

    float-to-int v8, v8

    invoke-direct {p0, v6, v7, v1, v8}, Landroid/support/v4/view/ViewPager;->determineTargetPage(IFII)I

    move-result v9

    invoke-virtual {p0, v9, v2, v2, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItemInternal(IZZI)V

    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->endDrag()V

    const/4 v2, 0x0

    iput-boolean v2, p0, Landroid/support/v4/view/ViewPager;->mFakeDragging:Z

    return-void

    :cond_43
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No fake drag in progress. Call beginFakeDrag first."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public executeKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 5

    const/4 v0, 0x0

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_3e

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    const/16 v2, 0x3d

    if-eq v1, v2, :cond_21

    packed-switch v1, :pswitch_data_40

    goto :goto_3e

    :pswitch_13
    const/16 v1, 0x42

    invoke-virtual {p0, v1}, Landroid/support/v4/view/ViewPager;->arrowScroll(I)Z

    move-result v0

    goto :goto_3e

    :pswitch_1a
    const/16 v1, 0x11

    invoke-virtual {p0, v1}, Landroid/support/v4/view/ViewPager;->arrowScroll(I)Z

    move-result v0

    goto :goto_3e

    :cond_21
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_3e

    invoke-static {p1}, Landroid/support/v4/view/KeyEventCompat;->hasNoModifiers(Landroid/view/KeyEvent;)Z

    move-result v1

    if-eqz v1, :cond_33

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Landroid/support/v4/view/ViewPager;->arrowScroll(I)Z

    move-result v0

    goto :goto_3e

    :cond_33
    const/4 v1, 0x1

    invoke-static {p1, v1}, Landroid/support/v4/view/KeyEventCompat;->hasModifiers(Landroid/view/KeyEvent;I)Z

    move-result v2

    if-eqz v2, :cond_3e

    invoke-virtual {p0, v1}, Landroid/support/v4/view/ViewPager;->arrowScroll(I)Z

    move-result v0

    :cond_3e
    :goto_3e
    return v0

    nop

    :pswitch_data_40
    .packed-switch 0x15
        :pswitch_1a
        :pswitch_13
    .end packed-switch
.end method

.method public fakeDragBy(F)V
    .registers 21

    move-object/from16 v0, p0

    iget-boolean v1, v0, Landroid/support/v4/view/ViewPager;->mFakeDragging:Z

    if-eqz v1, :cond_8d

    iget v1, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    add-float v1, v1, p1

    iput v1, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v1

    int-to-float v1, v1

    sub-float v2, v1, p1

    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v3

    int-to-float v4, v3

    iget v5, v0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    mul-float/2addr v4, v5

    int-to-float v5, v3

    iget v6, v0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    mul-float/2addr v5, v6

    iget-object v6, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/support/v4/view/ViewPager$ItemInfo;

    iget-object v7, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    iget-object v8, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/support/v4/view/ViewPager$ItemInfo;

    iget v8, v6, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-eqz v8, :cond_41

    iget v8, v6, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    int-to-float v9, v3

    mul-float v4, v8, v9

    :cond_41
    iget v8, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget-object v9, v0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v9}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    if-eq v8, v9, :cond_52

    iget v8, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    int-to-float v9, v3

    mul-float v5, v8, v9

    :cond_52
    cmpg-float v8, v2, v4

    if-gez v8, :cond_58

    move v2, v4

    goto :goto_5d

    :cond_58
    cmpl-float v8, v2, v5

    if-lez v8, :cond_5d

    move v2, v5

    :cond_5d
    :goto_5d
    iget v8, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    float-to-int v9, v2

    int-to-float v9, v9

    sub-float v9, v2, v9

    add-float/2addr v8, v9

    iput v8, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    float-to-int v8, v2

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollY()I

    move-result v9

    invoke-virtual {v0, v8, v9}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    float-to-int v8, v2

    invoke-direct {v0, v8}, Landroid/support/v4/view/ViewPager;->pageScrolled(I)Z

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v17

    iget-wide v9, v0, Landroid/support/v4/view/ViewPager;->mFakeDragBeginTime:J

    const/4 v13, 0x2

    iget v14, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-wide/from16 v11, v17

    invoke-static/range {v9 .. v16}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v8

    iget-object v9, v0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v9, v8}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    invoke-virtual {v8}, Landroid/view/MotionEvent;->recycle()V

    return-void

    :cond_8d
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "No fake drag in progress. Call beginFakeDrag first."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    new-instance v0, Landroid/support/v4/view/ViewPager$LayoutParams;

    invoke-direct {v0}, Landroid/support/v4/view/ViewPager$LayoutParams;-><init>()V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 4

    new-instance v0, Landroid/support/v4/view/ViewPager$LayoutParams;

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/support/v4/view/ViewPager$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 3

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public getAdapter()Landroid/support/v4/view/PagerAdapter;
    .registers 2

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    return-object v0
.end method

.method protected getChildDrawingOrder(II)I
    .registers 5

    iget v0, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrder:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_9

    add-int/lit8 v0, p1, -0x1

    sub-int/2addr v0, p2

    goto :goto_a

    :cond_9
    move v0, p2

    :goto_a
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrderedChildren:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/v4/view/ViewPager$LayoutParams;

    iget v1, v1, Landroid/support/v4/view/ViewPager$LayoutParams;->childIndex:I

    return v1
.end method

.method public getCurrentItem()I
    .registers 2

    iget v0, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    return v0
.end method

.method public getOffscreenPageLimit()I
    .registers 2

    iget v0, p0, Landroid/support/v4/view/ViewPager;->mOffscreenPageLimit:I

    return v0
.end method

.method public getPageMargin()I
    .registers 2

    iget v0, p0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    return v0
.end method

.method infoForAnyChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;
    .registers 4

    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    move-object v1, v0

    if-eq v0, p0, :cond_14

    if-eqz v1, :cond_12

    instance-of v0, v1, Landroid/view/View;

    if-nez v0, :cond_e

    goto :goto_12

    :cond_e
    move-object p1, v1

    check-cast p1, Landroid/view/View;

    goto :goto_0

    :cond_12
    :goto_12
    const/4 v0, 0x0

    return-object v0

    :cond_14
    invoke-virtual {p0, p1}, Landroid/support/v4/view/ViewPager;->infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v0

    return-object v0
.end method

.method infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;
    .registers 6

    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1f

    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/view/ViewPager$ItemInfo;

    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v3, v1, Landroid/support/v4/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v2, p1, v3}, Landroid/support/v4/view/PagerAdapter;->isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c

    return-object v1

    :cond_1c
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1f
    const/4 v0, 0x0

    return-object v0
.end method

.method infoForPosition(I)Landroid/support/v4/view/ViewPager$ItemInfo;
    .registers 5

    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_19

    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/view/ViewPager$ItemInfo;

    iget v2, v1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ne v2, p1, :cond_16

    return-object v1

    :cond_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_19
    const/4 v0, 0x0

    return-object v0
.end method

.method initViewPager()V
    .registers 6

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->setWillNotDraw(Z)V

    const/high16 v0, 0x40000

    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->setDescendantFocusability(I)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->setFocusable(Z)V

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Landroid/widget/Scroller;

    sget-object v3, Landroid/support/v4/view/ViewPager;->sInterpolator:Landroid/view/animation/Interpolator;

    invoke-direct {v2, v1, v3}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object v2, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-static {v1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v2

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    invoke-static {v2}, Landroid/support/v4/view/ViewConfigurationCompat;->getScaledPagingTouchSlop(Landroid/view/ViewConfiguration;)I

    move-result v4

    iput v4, p0, Landroid/support/v4/view/ViewPager;->mTouchSlop:I

    const/high16 v4, 0x43c80000    # 400.0f

    mul-float/2addr v4, v3

    float-to-int v4, v4

    iput v4, p0, Landroid/support/v4/view/ViewPager;->mMinimumVelocity:I

    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v4

    iput v4, p0, Landroid/support/v4/view/ViewPager;->mMaximumVelocity:I

    new-instance v4, Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-direct {v4, v1}, Landroid/support/v4/widget/EdgeEffectCompat;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Landroid/support/v4/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    new-instance v4, Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-direct {v4, v1}, Landroid/support/v4/widget/EdgeEffectCompat;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Landroid/support/v4/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    const/high16 v4, 0x41c80000    # 25.0f

    mul-float/2addr v4, v3

    float-to-int v4, v4

    iput v4, p0, Landroid/support/v4/view/ViewPager;->mFlingDistance:I

    const/high16 v4, 0x40000000    # 2.0f

    mul-float/2addr v4, v3

    float-to-int v4, v4

    iput v4, p0, Landroid/support/v4/view/ViewPager;->mCloseEnough:I

    const/high16 v4, 0x41800000    # 16.0f

    mul-float/2addr v4, v3

    float-to-int v4, v4

    iput v4, p0, Landroid/support/v4/view/ViewPager;->mDefaultGutterSize:I

    new-instance v4, Landroid/support/v4/view/ViewPager$MyAccessibilityDelegate;

    invoke-direct {v4, p0}, Landroid/support/v4/view/ViewPager$MyAccessibilityDelegate;-><init>(Landroid/support/v4/view/ViewPager;)V

    invoke-static {p0, v4}, Landroid/support/v4/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroid/support/v4/view/AccessibilityDelegateCompat;)V

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getImportantForAccessibility(Landroid/view/View;)I

    move-result v4

    if-nez v4, :cond_6b

    invoke-static {p0, v0}, Landroid/support/v4/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    :cond_6b
    return-void
.end method

.method public isFakeDragging()Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mFakeDragging:Z

    return v0
.end method

.method protected onAttachedToWindow()V
    .registers 2

    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mEndScrollRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->removeCallbacks(Ljava/lang/Runnable;)Z

    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 20

    move-object/from16 v0, p0

    invoke-super/range {p0 .. p1}, Landroid/view/ViewGroup;->onDraw(Landroid/graphics/Canvas;)V

    iget v1, v0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    if-lez v1, :cond_b5

    iget-object v1, v0, Landroid/support/v4/view/ViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_b5

    iget-object v1, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_b5

    iget-object v1, v0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v1, :cond_b5

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v1

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getWidth()I

    move-result v2

    iget v3, v0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    int-to-float v3, v3

    int-to-float v4, v2

    div-float/2addr v3, v4

    const/4 v4, 0x0

    iget-object v5, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/v4/view/ViewPager$ItemInfo;

    iget v6, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget-object v7, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget-object v9, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    add-int/lit8 v10, v7, -0x1

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/support/v4/view/ViewPager$ItemInfo;

    iget v9, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    move v10, v6

    move v6, v4

    move v4, v8

    :goto_49
    if-ge v4, v9, :cond_b5

    :goto_4b
    iget v11, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-le v4, v11, :cond_5d

    if-ge v6, v7, :cond_5d

    iget-object v11, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v11, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    move-object v5, v11

    check-cast v5, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_4b

    :cond_5d
    iget v11, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ne v4, v11, :cond_71

    iget v11, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget v12, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v11, v12

    int-to-float v12, v2

    mul-float/2addr v11, v12

    iget v12, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget v13, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v12, v13

    add-float/2addr v12, v3

    move v10, v12

    move v12, v11

    goto :goto_7e

    :cond_71
    iget-object v11, v0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v11, v4}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v11

    add-float v12, v10, v11

    int-to-float v13, v2

    mul-float/2addr v12, v13

    add-float v13, v11, v3

    add-float/2addr v10, v13

    :goto_7e
    iget v11, v0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    int-to-float v11, v11

    add-float/2addr v11, v12

    int-to-float v13, v1

    cmpl-float v11, v11, v13

    if-lez v11, :cond_a4

    iget-object v11, v0, Landroid/support/v4/view/ViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    float-to-int v13, v12

    iget v14, v0, Landroid/support/v4/view/ViewPager;->mTopPageBounds:I

    iget v15, v0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    int-to-float v15, v15

    add-float/2addr v15, v12

    const/high16 v16, 0x3f000000    # 0.5f

    add-float v15, v15, v16

    float-to-int v15, v15

    move/from16 v17, v3

    iget v3, v0, Landroid/support/v4/view/ViewPager;->mBottomPageBounds:I

    invoke-virtual {v11, v13, v14, v15, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v3, v0, Landroid/support/v4/view/ViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v11, p1

    invoke-virtual {v3, v11}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_a8

    :cond_a4
    move-object/from16 v11, p1

    move/from16 v17, v3

    :goto_a8
    add-int v3, v1, v2

    int-to-float v3, v3

    cmpl-float v3, v12, v3

    if-lez v3, :cond_b0

    goto :goto_b7

    :cond_b0
    add-int/lit8 v4, v4, 0x1

    move/from16 v3, v17

    goto :goto_49

    :cond_b5
    move-object/from16 v11, p1

    :goto_b7
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 22

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    and-int/lit16 v8, v0, 0xff

    const/4 v0, -0x1

    const/4 v9, 0x0

    const/4 v1, 0x3

    if-eq v8, v1, :cond_123

    const/4 v10, 0x1

    if-ne v8, v10, :cond_14

    goto/16 :goto_123

    :cond_14
    if-eqz v8, :cond_20

    iget-boolean v1, v6, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    if-eqz v1, :cond_1b

    return v10

    :cond_1b
    iget-boolean v1, v6, Landroid/support/v4/view/ViewPager;->mIsUnableToDrag:Z

    if-eqz v1, :cond_20

    return v9

    :cond_20
    const/4 v1, 0x2

    if-eqz v8, :cond_bf

    if-eq v8, v1, :cond_2f

    const/4 v0, 0x6

    if-eq v8, v0, :cond_2a

    goto/16 :goto_111

    :cond_2a
    invoke-direct/range {p0 .. p1}, Landroid/support/v4/view/ViewPager;->onSecondaryPointerUp(Landroid/view/MotionEvent;)V

    goto/16 :goto_111

    :cond_2f
    iget v11, v6, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    if-ne v11, v0, :cond_35

    goto/16 :goto_111

    :cond_35
    invoke-static {v7, v11}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v12

    invoke-static {v7, v12}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v13

    iget v0, v6, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    sub-float v14, v13, v0

    invoke-static {v14}, Ljava/lang/Math;->abs(F)F

    move-result v15

    invoke-static {v7, v12}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v5

    iget v0, v6, Landroid/support/v4/view/ViewPager;->mInitialMotionY:F

    sub-float v0, v5, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v16

    const/16 v17, 0x0

    cmpl-float v0, v14, v17

    if-eqz v0, :cond_78

    iget v0, v6, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    invoke-direct {v6, v0, v14}, Landroid/support/v4/view/ViewPager;->isGutterDrag(FF)Z

    move-result v0

    if-nez v0, :cond_78

    const/4 v2, 0x0

    float-to-int v3, v14

    float-to-int v4, v13

    float-to-int v1, v5

    move-object v0, v6

    move/from16 v18, v1

    move-object v1, v6

    move v9, v5

    move/from16 v5, v18

    invoke-virtual/range {v0 .. v5}, Landroid/support/v4/view/ViewPager;->canScroll(Landroid/view/View;ZIII)Z

    move-result v0

    if-eqz v0, :cond_79

    iput v13, v6, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    iput v9, v6, Landroid/support/v4/view/ViewPager;->mLastMotionY:F

    iput-boolean v10, v6, Landroid/support/v4/view/ViewPager;->mIsUnableToDrag:Z

    const/4 v0, 0x0

    return v0

    :cond_78
    move v9, v5

    :cond_79
    iget v0, v6, Landroid/support/v4/view/ViewPager;->mTouchSlop:I

    int-to-float v0, v0

    cmpl-float v0, v15, v0

    if-lez v0, :cond_a8

    const/high16 v0, 0x3f000000    # 0.5f

    mul-float/2addr v0, v15

    cmpl-float v0, v0, v16

    if-lez v0, :cond_a8

    iput-boolean v10, v6, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    invoke-direct {v6, v10}, Landroid/support/v4/view/ViewPager;->requestParentDisallowInterceptTouchEvent(Z)V

    invoke-direct {v6, v10}, Landroid/support/v4/view/ViewPager;->setScrollState(I)V

    cmpl-float v0, v14, v17

    if-lez v0, :cond_9a

    iget v0, v6, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    iget v1, v6, Landroid/support/v4/view/ViewPager;->mTouchSlop:I

    int-to-float v1, v1

    add-float/2addr v0, v1

    goto :goto_a0

    :cond_9a
    iget v0, v6, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    iget v1, v6, Landroid/support/v4/view/ViewPager;->mTouchSlop:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    :goto_a0
    iput v0, v6, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    iput v9, v6, Landroid/support/v4/view/ViewPager;->mLastMotionY:F

    invoke-direct {v6, v10}, Landroid/support/v4/view/ViewPager;->setScrollingCacheEnabled(Z)V

    goto :goto_b1

    :cond_a8
    iget v0, v6, Landroid/support/v4/view/ViewPager;->mTouchSlop:I

    int-to-float v0, v0

    cmpl-float v0, v16, v0

    if-lez v0, :cond_b1

    iput-boolean v10, v6, Landroid/support/v4/view/ViewPager;->mIsUnableToDrag:Z

    :cond_b1
    :goto_b1
    iget-boolean v0, v6, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    if-eqz v0, :cond_111

    invoke-direct {v6, v13}, Landroid/support/v4/view/ViewPager;->performDrag(F)Z

    move-result v0

    if-eqz v0, :cond_111

    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    goto :goto_111

    :cond_bf
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, v6, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    iput v0, v6, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, v6, Landroid/support/v4/view/ViewPager;->mInitialMotionY:F

    iput v0, v6, Landroid/support/v4/view/ViewPager;->mLastMotionY:F

    const/4 v0, 0x0

    invoke-static {v7, v0}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v2

    iput v2, v6, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    iput-boolean v0, v6, Landroid/support/v4/view/ViewPager;->mIsUnableToDrag:Z

    iget-object v0, v6, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    iget v0, v6, Landroid/support/v4/view/ViewPager;->mScrollState:I

    if-ne v0, v1, :cond_10a

    iget-object v0, v6, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getFinalX()I

    move-result v0

    iget-object v1, v6, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrX()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iget v1, v6, Landroid/support/v4/view/ViewPager;->mCloseEnough:I

    if-le v0, v1, :cond_10a

    iget-object v0, v6, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    const/4 v0, 0x0

    iput-boolean v0, v6, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->populate()V

    iput-boolean v10, v6, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    invoke-direct {v6, v10}, Landroid/support/v4/view/ViewPager;->requestParentDisallowInterceptTouchEvent(Z)V

    invoke-direct {v6, v10}, Landroid/support/v4/view/ViewPager;->setScrollState(I)V

    goto :goto_111

    :cond_10a
    const/4 v0, 0x0

    invoke-direct {v6, v0}, Landroid/support/v4/view/ViewPager;->completeScroll(Z)V

    iput-boolean v0, v6, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    nop

    :cond_111
    :goto_111
    iget-object v0, v6, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v0, :cond_11b

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, v6, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    :cond_11b
    iget-object v0, v6, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, v7}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    iget-boolean v0, v6, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    return v0

    :cond_123
    :goto_123
    const/4 v1, 0x0

    iput-boolean v1, v6, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    iput-boolean v1, v6, Landroid/support/v4/view/ViewPager;->mIsUnableToDrag:Z

    iput v0, v6, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    iget-object v0, v6, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_136

    iget-object v0, v6, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    const/4 v0, 0x0

    iput-object v0, v6, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    :cond_136
    const/4 v0, 0x0

    return v0
.end method

.method protected onLayout(ZIIII)V
    .registers 34

    move-object/from16 v0, p0

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v1

    sub-int v4, p4, p2

    sub-int v7, p5, p3

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingLeft()I

    move-result v8

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingTop()I

    move-result v9

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingRight()I

    move-result v10

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingBottom()I

    move-result v11

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v12

    const/4 v13, 0x0

    move v15, v13

    move v13, v11

    move v11, v9

    move v9, v8

    const/4 v8, 0x0

    :goto_24
    if-ge v8, v1, :cond_c6

    invoke-virtual {v0, v8}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v14

    invoke-virtual {v14}, Landroid/view/View;->getVisibility()I

    move-result v2

    const/16 v3, 0x8

    if-eq v2, v3, :cond_c2

    invoke-virtual {v14}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager$LayoutParams;

    const/4 v3, 0x0

    const/16 v16, 0x0

    move/from16 v17, v3

    iget-boolean v3, v2, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-eqz v3, :cond_c2

    iget v3, v2, Landroid/support/v4/view/ViewPager$LayoutParams;->gravity:I

    and-int/lit8 v3, v3, 0x7

    iget v5, v2, Landroid/support/v4/view/ViewPager$LayoutParams;->gravity:I

    and-int/lit8 v5, v5, 0x70

    move-object/from16 v18, v2

    const/4 v2, 0x1

    if-eq v3, v2, :cond_6d

    const/4 v2, 0x3

    if-eq v3, v2, :cond_65

    const/4 v2, 0x5

    if-eq v3, v2, :cond_56

    move v2, v9

    goto :goto_7a

    :cond_56
    sub-int v2, v4, v10

    invoke-virtual {v14}, Landroid/view/View;->getMeasuredWidth()I

    move-result v19

    sub-int v2, v2, v19

    invoke-virtual {v14}, Landroid/view/View;->getMeasuredWidth()I

    move-result v17

    add-int v10, v10, v17

    goto :goto_7a

    :cond_65
    move v2, v9

    invoke-virtual {v14}, Landroid/view/View;->getMeasuredWidth()I

    move-result v17

    add-int v9, v9, v17

    goto :goto_7a

    :cond_6d
    invoke-virtual {v14}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    sub-int v2, v4, v2

    div-int/lit8 v2, v2, 0x2

    invoke-static {v2, v9}, Ljava/lang/Math;->max(II)I

    move-result v2

    nop

    :goto_7a
    move/from16 v20, v3

    const/16 v3, 0x10

    if-eq v5, v3, :cond_a1

    const/16 v3, 0x30

    if-eq v5, v3, :cond_99

    const/16 v3, 0x50

    if-eq v5, v3, :cond_8a

    move v3, v11

    goto :goto_ae

    :cond_8a
    sub-int v3, v7, v13

    invoke-virtual {v14}, Landroid/view/View;->getMeasuredHeight()I

    move-result v17

    sub-int v3, v3, v17

    invoke-virtual {v14}, Landroid/view/View;->getMeasuredHeight()I

    move-result v16

    add-int v13, v13, v16

    goto :goto_ae

    :cond_99
    move v3, v11

    invoke-virtual {v14}, Landroid/view/View;->getMeasuredHeight()I

    move-result v16

    add-int v11, v11, v16

    goto :goto_ae

    :cond_a1
    invoke-virtual {v14}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    sub-int v3, v7, v3

    div-int/lit8 v3, v3, 0x2

    invoke-static {v3, v11}, Ljava/lang/Math;->max(II)I

    move-result v3

    nop

    :goto_ae
    add-int/2addr v2, v12

    invoke-virtual {v14}, Landroid/view/View;->getMeasuredWidth()I

    move-result v16

    move/from16 v21, v5

    add-int v5, v2, v16

    invoke-virtual {v14}, Landroid/view/View;->getMeasuredHeight()I

    move-result v16

    add-int v6, v3, v16

    invoke-virtual {v14, v2, v3, v5, v6}, Landroid/view/View;->layout(IIII)V

    add-int/lit8 v15, v15, 0x1

    :cond_c2
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_24

    :cond_c6
    sub-int v2, v4, v9

    sub-int/2addr v2, v10

    const/4 v3, 0x0

    :goto_ca
    if-ge v3, v1, :cond_13e

    invoke-virtual {v0, v3}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v6

    const/16 v8, 0x8

    if-eq v6, v8, :cond_12f

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/support/v4/view/ViewPager$LayoutParams;

    iget-boolean v14, v6, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-nez v14, :cond_12f

    invoke-virtual {v0, v5}, Landroid/support/v4/view/ViewPager;->infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v14

    move-object/from16 v22, v14

    if-eqz v14, :cond_12f

    int-to-float v14, v2

    move/from16 v23, v1

    move-object/from16 v8, v22

    iget v1, v8, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    mul-float/2addr v14, v1

    float-to-int v1, v14

    add-int v14, v9, v1

    move/from16 v24, v11

    move/from16 v25, v1

    iget-boolean v1, v6, Landroid/support/v4/view/ViewPager$LayoutParams;->needsMeasure:Z

    if-eqz v1, :cond_11b

    const/4 v1, 0x0

    iput-boolean v1, v6, Landroid/support/v4/view/ViewPager$LayoutParams;->needsMeasure:Z

    int-to-float v1, v2

    move/from16 v26, v2

    iget v2, v6, Landroid/support/v4/view/ViewPager$LayoutParams;->widthFactor:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    sub-int v16, v7, v11

    move/from16 v27, v4

    sub-int v4, v16, v13

    invoke-static {v4, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    invoke-virtual {v5, v1, v2}, Landroid/view/View;->measure(II)V

    goto :goto_11f

    :cond_11b
    move/from16 v26, v2

    move/from16 v27, v4

    :goto_11f
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    add-int/2addr v1, v14

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    move/from16 v4, v24

    add-int/2addr v2, v4

    invoke-virtual {v5, v14, v4, v1, v2}, Landroid/view/View;->layout(IIII)V

    goto :goto_135

    :cond_12f
    move/from16 v23, v1

    move/from16 v26, v2

    move/from16 v27, v4

    :goto_135
    add-int/lit8 v3, v3, 0x1

    move/from16 v1, v23

    move/from16 v2, v26

    move/from16 v4, v27

    goto :goto_ca

    :cond_13e
    move/from16 v23, v1

    move/from16 v26, v2

    move/from16 v27, v4

    iput v11, v0, Landroid/support/v4/view/ViewPager;->mTopPageBounds:I

    sub-int v1, v7, v13

    iput v1, v0, Landroid/support/v4/view/ViewPager;->mBottomPageBounds:I

    iput v15, v0, Landroid/support/v4/view/ViewPager;->mDecorChildCount:I

    iget-boolean v1, v0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    if-eqz v1, :cond_157

    iget v1, v0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2, v2}, Landroid/support/v4/view/ViewPager;->scrollToItem(IZIZ)V

    goto :goto_158

    :cond_157
    const/4 v2, 0x0

    :goto_158
    iput-boolean v2, v0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    return-void
.end method

.method protected onMeasure(II)V
    .registers 25

    move-object/from16 v0, p0

    const/4 v1, 0x0

    move/from16 v2, p1

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewPager;->getDefaultSize(II)I

    move-result v3

    move/from16 v4, p2

    invoke-static {v1, v4}, Landroid/support/v4/view/ViewPager;->getDefaultSize(II)I

    move-result v5

    invoke-virtual {v0, v3, v5}, Landroid/support/v4/view/ViewPager;->setMeasuredDimension(II)V

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getMeasuredWidth()I

    move-result v3

    div-int/lit8 v5, v3, 0xa

    iget v6, v0, Landroid/support/v4/view/ViewPager;->mDefaultGutterSize:I

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v6

    iput v6, v0, Landroid/support/v4/view/ViewPager;->mGutterSize:I

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingLeft()I

    move-result v6

    sub-int v6, v3, v6

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingRight()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getMeasuredHeight()I

    move-result v7

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingTop()I

    move-result v8

    sub-int/2addr v7, v8

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingBottom()I

    move-result v8

    sub-int/2addr v7, v8

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v8

    move v9, v7

    move v7, v6

    move v6, v1

    :goto_40
    const/16 v10, 0x8

    if-ge v6, v8, :cond_e7

    invoke-virtual {v0, v6}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    invoke-virtual {v12}, Landroid/view/View;->getVisibility()I

    move-result v13

    if-eq v13, v10, :cond_d6

    invoke-virtual {v12}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    check-cast v10, Landroid/support/v4/view/ViewPager$LayoutParams;

    if-eqz v10, :cond_d6

    iget-boolean v13, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-eqz v13, :cond_d6

    iget v13, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->gravity:I

    and-int/lit8 v13, v13, 0x7

    iget v14, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->gravity:I

    and-int/lit8 v14, v14, 0x70

    const/high16 v15, -0x80000000

    const/high16 v16, -0x80000000

    const/16 v1, 0x30

    if-eq v14, v1, :cond_71

    const/16 v1, 0x50

    if-ne v14, v1, :cond_6f

    goto :goto_71

    :cond_6f
    const/4 v1, 0x0

    goto :goto_72

    :cond_71
    :goto_71
    const/4 v1, 0x1

    :goto_72
    const/4 v11, 0x3

    if-eq v13, v11, :cond_7c

    const/4 v11, 0x5

    if-ne v13, v11, :cond_79

    goto :goto_7c

    :cond_79
    const/16 v17, 0x0

    goto :goto_7e

    :cond_7c
    :goto_7c
    const/16 v17, 0x1

    :goto_7e
    move/from16 v11, v17

    if-eqz v1, :cond_85

    const/high16 v15, 0x40000000    # 2.0f

    goto :goto_89

    :cond_85
    if-eqz v11, :cond_89

    const/high16 v16, 0x40000000    # 2.0f

    :cond_89
    :goto_89
    move/from16 v17, v7

    move/from16 v18, v9

    iget v2, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->width:I

    move/from16 v19, v3

    const/4 v3, -0x2

    if-eq v2, v3, :cond_9e

    const/high16 v15, 0x40000000    # 2.0f

    iget v2, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->width:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_9e

    iget v2, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->width:I

    goto :goto_a0

    :cond_9e
    move/from16 v2, v17

    :goto_a0
    iget v3, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->height:I

    const/4 v4, -0x2

    if-eq v3, v4, :cond_b1

    const/high16 v16, 0x40000000    # 2.0f

    iget v3, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->height:I

    const/4 v4, -0x1

    if-eq v3, v4, :cond_b1

    iget v3, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->height:I

    move/from16 v4, v16

    goto :goto_b5

    :cond_b1
    move/from16 v4, v16

    move/from16 v3, v18

    :goto_b5
    move/from16 v20, v5

    invoke-static {v2, v15}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    move/from16 v21, v2

    invoke-static {v3, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    invoke-virtual {v12, v5, v2}, Landroid/view/View;->measure(II)V

    if-eqz v1, :cond_cd

    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v16

    sub-int v9, v9, v16

    goto :goto_da

    :cond_cd
    if-eqz v11, :cond_da

    invoke-virtual {v12}, Landroid/view/View;->getMeasuredWidth()I

    move-result v16

    sub-int v7, v7, v16

    goto :goto_da

    :cond_d6
    move/from16 v19, v3

    move/from16 v20, v5

    :cond_da
    :goto_da
    add-int/lit8 v6, v6, 0x1

    move/from16 v3, v19

    move/from16 v5, v20

    const/4 v1, 0x0

    move/from16 v2, p1

    move/from16 v4, p2

    goto/16 :goto_40

    :cond_e7
    move/from16 v19, v3

    move/from16 v20, v5

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v7, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    iput v2, v0, Landroid/support/v4/view/ViewPager;->mChildWidthMeasureSpec:I

    invoke-static {v9, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    iput v2, v0, Landroid/support/v4/view/ViewPager;->mChildHeightMeasureSpec:I

    const/4 v2, 0x1

    iput-boolean v2, v0, Landroid/support/v4/view/ViewPager;->mInLayout:Z

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->populate()V

    const/4 v2, 0x0

    iput-boolean v2, v0, Landroid/support/v4/view/ViewPager;->mInLayout:Z

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v3

    nop

    :goto_107
    if-ge v2, v3, :cond_130

    invoke-virtual {v0, v2}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-eq v5, v10, :cond_12d

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/support/v4/view/ViewPager$LayoutParams;

    if-eqz v5, :cond_11f

    iget-boolean v6, v5, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-nez v6, :cond_12d

    :cond_11f
    int-to-float v6, v7

    iget v8, v5, Landroid/support/v4/view/ViewPager$LayoutParams;->widthFactor:F

    mul-float/2addr v6, v8

    float-to-int v6, v6

    invoke-static {v6, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    iget v8, v0, Landroid/support/v4/view/ViewPager;->mChildHeightMeasureSpec:I

    invoke-virtual {v4, v6, v8}, Landroid/view/View;->measure(II)V

    :cond_12d
    add-int/lit8 v2, v2, 0x1

    goto :goto_107

    :cond_130
    return-void
.end method

.method protected onPageScrolled(IFI)V
    .registers 19
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    move-object v0, p0

    iget v1, v0, Landroid/support/v4/view/ViewPager;->mDecorChildCount:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-lez v1, :cond_6f

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v1

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getPaddingLeft()I

    move-result v4

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getPaddingRight()I

    move-result v5

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getWidth()I

    move-result v6

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v7

    move v8, v5

    move v5, v4

    move v4, v2

    :goto_1e
    if-ge v4, v7, :cond_6f

    invoke-virtual {v0, v4}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    check-cast v10, Landroid/support/v4/view/ViewPager$LayoutParams;

    iget-boolean v11, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-nez v11, :cond_2f

    goto :goto_6c

    :cond_2f
    iget v11, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->gravity:I

    and-int/lit8 v11, v11, 0x7

    const/4 v12, 0x0

    if-eq v11, v3, :cond_53

    const/4 v13, 0x3

    if-eq v11, v13, :cond_4c

    const/4 v13, 0x5

    if-eq v11, v13, :cond_3e

    move v12, v5

    goto :goto_60

    :cond_3e
    sub-int v13, v6, v8

    invoke-virtual {v9}, Landroid/view/View;->getMeasuredWidth()I

    move-result v14

    sub-int v12, v13, v14

    invoke-virtual {v9}, Landroid/view/View;->getMeasuredWidth()I

    move-result v13

    add-int/2addr v8, v13

    goto :goto_60

    :cond_4c
    move v12, v5

    invoke-virtual {v9}, Landroid/view/View;->getWidth()I

    move-result v13

    add-int/2addr v5, v13

    goto :goto_60

    :cond_53
    invoke-virtual {v9}, Landroid/view/View;->getMeasuredWidth()I

    move-result v13

    sub-int v13, v6, v13

    div-int/lit8 v13, v13, 0x2

    invoke-static {v13, v5}, Ljava/lang/Math;->max(II)I

    move-result v12

    nop

    :goto_60
    add-int/2addr v12, v1

    invoke-virtual {v9}, Landroid/view/View;->getLeft()I

    move-result v13

    sub-int v13, v12, v13

    if-eqz v13, :cond_6c

    invoke-virtual {v9, v13}, Landroid/view/View;->offsetLeftAndRight(I)V

    :cond_6c
    :goto_6c
    add-int/lit8 v4, v4, 0x1

    goto :goto_1e

    :cond_6f
    invoke-direct/range {p0 .. p3}, Landroid/support/v4/view/ViewPager;->dispatchOnPageScrolled(IFI)V

    iget-object v1, v0, Landroid/support/v4/view/ViewPager;->mPageTransformer:Landroid/support/v4/view/ViewPager$PageTransformer;

    if-eqz v1, :cond_a4

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v1

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v4

    nop

    :goto_7f
    if-ge v2, v4, :cond_a4

    invoke-virtual {v0, v2}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/support/v4/view/ViewPager$LayoutParams;

    iget-boolean v7, v6, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-eqz v7, :cond_90

    goto :goto_a1

    :cond_90
    invoke-virtual {v5}, Landroid/view/View;->getLeft()I

    move-result v7

    sub-int/2addr v7, v1

    int-to-float v7, v7

    invoke-direct {v0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v8

    int-to-float v8, v8

    div-float/2addr v7, v8

    iget-object v8, v0, Landroid/support/v4/view/ViewPager;->mPageTransformer:Landroid/support/v4/view/ViewPager$PageTransformer;

    invoke-interface {v8, v5, v7}, Landroid/support/v4/view/ViewPager$PageTransformer;->transformPage(Landroid/view/View;F)V

    :goto_a1
    add-int/lit8 v2, v2, 0x1

    goto :goto_7f

    :cond_a4
    iput-boolean v3, v0, Landroid/support/v4/view/ViewPager;->mCalledSuper:Z

    return-void
.end method

.method protected onRequestFocusInDescendants(ILandroid/graphics/Rect;)Z
    .registers 12

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v0

    and-int/lit8 v1, p1, 0x2

    if-eqz v1, :cond_c

    const/4 v1, 0x0

    const/4 v2, 0x1

    move v3, v0

    goto :goto_10

    :cond_c
    add-int/lit8 v1, v0, -0x1

    const/4 v2, -0x1

    const/4 v3, -0x1

    :goto_10
    move v4, v1

    :goto_11
    if-eq v4, v3, :cond_33

    invoke-virtual {p0, v4}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v6

    if-nez v6, :cond_31

    invoke-virtual {p0, v5}, Landroid/support/v4/view/ViewPager;->infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v6

    if-eqz v6, :cond_31

    iget v7, v6, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v8, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ne v7, v8, :cond_31

    invoke-virtual {v5, p1, p2}, Landroid/view/View;->requestFocus(ILandroid/graphics/Rect;)Z

    move-result v7

    if-eqz v7, :cond_31

    const/4 v7, 0x1

    return v7

    :cond_31
    add-int/2addr v4, v2

    goto :goto_11

    :cond_33
    const/4 v4, 0x0

    return v4
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 6

    instance-of v0, p1, Landroid/support/v4/view/ViewPager$SavedState;

    if-nez v0, :cond_8

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    return-void

    :cond_8
    move-object v0, p1

    check-cast v0, Landroid/support/v4/view/ViewPager$SavedState;

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v1, :cond_27

    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v2, v0, Landroid/support/v4/view/ViewPager$SavedState;->adapterState:Landroid/os/Parcelable;

    iget-object v3, v0, Landroid/support/v4/view/ViewPager$SavedState;->loader:Ljava/lang/ClassLoader;

    invoke-virtual {v1, v2, v3}, Landroid/support/v4/view/PagerAdapter;->restoreState(Landroid/os/Parcelable;Ljava/lang/ClassLoader;)V

    iget v1, v0, Landroid/support/v4/view/ViewPager$SavedState;->position:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {p0, v1, v2, v3}, Landroid/support/v4/view/ViewPager;->setCurrentItemInternal(IZZ)V

    goto :goto_33

    :cond_27
    iget v1, v0, Landroid/support/v4/view/ViewPager$SavedState;->position:I

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mRestoredCurItem:I

    iget-object v1, v0, Landroid/support/v4/view/ViewPager$SavedState;->adapterState:Landroid/os/Parcelable;

    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mRestoredAdapterState:Landroid/os/Parcelable;

    iget-object v1, v0, Landroid/support/v4/view/ViewPager$SavedState;->loader:Ljava/lang/ClassLoader;

    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mRestoredClassLoader:Ljava/lang/ClassLoader;

    :goto_33
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    invoke-super {p0}, Landroid/view/ViewGroup;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    new-instance v1, Landroid/support/v4/view/ViewPager$SavedState;

    invoke-direct {v1, v0}, Landroid/support/v4/view/ViewPager$SavedState;-><init>(Landroid/os/Parcelable;)V

    iget v2, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    iput v2, v1, Landroid/support/v4/view/ViewPager$SavedState;->position:I

    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v2, :cond_19

    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v2}, Landroid/support/v4/view/PagerAdapter;->saveState()Landroid/os/Parcelable;

    move-result-object v2

    iput-object v2, v1, Landroid/support/v4/view/ViewPager$SavedState;->adapterState:Landroid/os/Parcelable;

    :cond_19
    return-object v1
.end method

.method protected onSizeChanged(IIII)V
    .registers 7

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->onSizeChanged(IIII)V

    if-eq p1, p3, :cond_c

    iget v0, p0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    iget v1, p0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    invoke-direct {p0, p1, p3, v0, v1}, Landroid/support/v4/view/ViewPager;->recomputeScrollPosition(IIII)V

    :cond_c
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-boolean v2, v0, Landroid/support/v4/view/ViewPager;->mFakeDragging:Z

    const/4 v3, 0x1

    if-eqz v2, :cond_a

    return v3

    :cond_a
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    const/4 v4, 0x0

    if-nez v2, :cond_18

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    move-result v2

    if-eqz v2, :cond_18

    return v4

    :cond_18
    iget-object v2, v0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v2, :cond_179

    iget-object v2, v0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v2}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v2

    if-nez v2, :cond_26

    goto/16 :goto_179

    :cond_26
    iget-object v2, v0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v2, :cond_30

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v2

    iput-object v2, v0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    :cond_30
    iget-object v2, v0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v2, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    const/4 v5, 0x0

    and-int/lit16 v6, v2, 0xff

    const/4 v7, -0x1

    packed-switch v6, :pswitch_data_17a

    :cond_40
    :pswitch_40
    move/from16 v16, v2

    goto/16 :goto_172

    :pswitch_44
    invoke-direct/range {p0 .. p1}, Landroid/support/v4/view/ViewPager;->onSecondaryPointerUp(Landroid/view/MotionEvent;)V

    iget v4, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v4

    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v4

    iput v4, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    goto :goto_81

    :pswitch_54
    invoke-static/range {p1 .. p1}, Landroid/support/v4/view/MotionEventCompat;->getActionIndex(Landroid/view/MotionEvent;)I

    move-result v4

    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v6

    iput v6, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v7

    iput v7, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    goto :goto_81

    :pswitch_65
    iget-boolean v6, v0, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    if-eqz v6, :cond_81

    iget v6, v0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    invoke-direct {v0, v6, v3, v4, v4}, Landroid/support/v4/view/ViewPager;->scrollToItem(IZIZ)V

    iput v7, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->endDrag()V

    iget-object v4, v0, Landroid/support/v4/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v4}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v4

    iget-object v6, v0, Landroid/support/v4/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v6}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v6

    or-int v5, v4, v6

    :cond_81
    :goto_81
    move/from16 v16, v2

    goto/16 :goto_172

    :pswitch_85
    iget-boolean v4, v0, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    if-nez v4, :cond_e0

    iget v4, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v4

    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v6

    iget v7, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    sub-float v7, v6, v7

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v8

    iget v9, v0, Landroid/support/v4/view/ViewPager;->mLastMotionY:F

    sub-float v9, v8, v9

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v9

    iget v10, v0, Landroid/support/v4/view/ViewPager;->mTouchSlop:I

    int-to-float v10, v10

    cmpl-float v10, v7, v10

    if-lez v10, :cond_e0

    cmpl-float v10, v7, v9

    if-lez v10, :cond_e0

    iput-boolean v3, v0, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    invoke-direct {v0, v3}, Landroid/support/v4/view/ViewPager;->requestParentDisallowInterceptTouchEvent(Z)V

    iget v10, v0, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    sub-float v10, v6, v10

    const/4 v11, 0x0

    cmpl-float v10, v10, v11

    if-lez v10, :cond_c7

    iget v10, v0, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    iget v11, v0, Landroid/support/v4/view/ViewPager;->mTouchSlop:I

    int-to-float v11, v11

    add-float/2addr v10, v11

    goto :goto_cd

    :cond_c7
    iget v10, v0, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    iget v11, v0, Landroid/support/v4/view/ViewPager;->mTouchSlop:I

    int-to-float v11, v11

    sub-float/2addr v10, v11

    :goto_cd
    iput v10, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    iput v8, v0, Landroid/support/v4/view/ViewPager;->mLastMotionY:F

    invoke-direct {v0, v3}, Landroid/support/v4/view/ViewPager;->setScrollState(I)V

    invoke-direct {v0, v3}, Landroid/support/v4/view/ViewPager;->setScrollingCacheEnabled(Z)V

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getParent()Landroid/view/ViewParent;

    move-result-object v10

    if-eqz v10, :cond_e0

    invoke-interface {v10, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_e0
    iget-boolean v4, v0, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    if-eqz v4, :cond_81

    iget v4, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v4

    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v6

    invoke-direct {v0, v6}, Landroid/support/v4/view/ViewPager;->performDrag(F)Z

    move-result v7

    or-int/2addr v5, v7

    goto :goto_81

    :pswitch_f4
    iget-boolean v4, v0, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    if-eqz v4, :cond_40

    iget-object v4, v0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v6, 0x3e8

    iget v8, v0, Landroid/support/v4/view/ViewPager;->mMaximumVelocity:I

    int-to-float v8, v8

    invoke-virtual {v4, v6, v8}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    iget v6, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    invoke-static {v4, v6}, Landroid/support/v4/view/VelocityTrackerCompat;->getXVelocity(Landroid/view/VelocityTracker;I)F

    move-result v6

    float-to-int v6, v6

    iput-boolean v3, v0, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v8

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v9

    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->infoForCurrentScrollPosition()Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v10

    iget v11, v10, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    int-to-float v12, v9

    int-to-float v13, v8

    div-float/2addr v12, v13

    iget v13, v10, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    sub-float/2addr v12, v13

    iget v13, v10, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    div-float/2addr v12, v13

    iget v13, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    invoke-static {v1, v13}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v13

    invoke-static {v1, v13}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v14

    iget v15, v0, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    sub-float v15, v14, v15

    float-to-int v15, v15

    invoke-direct {v0, v11, v12, v6, v15}, Landroid/support/v4/view/ViewPager;->determineTargetPage(IFII)I

    move-result v7

    invoke-virtual {v0, v7, v3, v3, v6}, Landroid/support/v4/view/ViewPager;->setCurrentItemInternal(IZZI)V

    const/4 v3, -0x1

    iput v3, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->endDrag()V

    iget-object v3, v0, Landroid/support/v4/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v3}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v3

    move/from16 v16, v2

    iget-object v2, v0, Landroid/support/v4/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v2}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v2

    or-int v5, v3, v2

    goto :goto_172

    :pswitch_14f
    move/from16 v16, v2

    iget-object v2, v0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v2}, Landroid/widget/Scroller;->abortAnimation()V

    iput-boolean v4, v0, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->populate()V

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    iput v2, v0, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    iput v2, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    iput v2, v0, Landroid/support/v4/view/ViewPager;->mInitialMotionY:F

    iput v2, v0, Landroid/support/v4/view/ViewPager;->mLastMotionY:F

    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v2

    iput v2, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    nop

    :goto_172
    if-eqz v5, :cond_177

    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    :cond_177
    const/4 v2, 0x1

    return v2

    :cond_179
    :goto_179
    return v4

    :pswitch_data_17a
    .packed-switch 0x0
        :pswitch_14f
        :pswitch_f4
        :pswitch_85
        :pswitch_65
        :pswitch_40
        :pswitch_54
        :pswitch_44
    .end packed-switch
.end method

.method pageLeft()Z
    .registers 3

    iget v0, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-lez v0, :cond_c

    iget v0, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-virtual {p0, v0, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    return v1

    :cond_c
    const/4 v0, 0x0

    return v0
.end method

.method pageRight()Z
    .registers 4

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v0, :cond_17

    iget v0, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v1}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    if-ge v0, v1, :cond_17

    iget v0, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    add-int/2addr v0, v2

    invoke-virtual {p0, v0, v2}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    return v2

    :cond_17
    const/4 v0, 0x0

    return v0
.end method

.method populate()V
    .registers 2

    iget v0, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->populate(I)V

    return-void
.end method

.method populate(I)V
    .registers 25

    move-object/from16 v1, p0

    move/from16 v2, p1

    const/4 v0, 0x0

    const/4 v3, 0x2

    iget v4, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-eq v4, v2, :cond_1c

    iget v4, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ge v4, v2, :cond_11

    const/16 v4, 0x42

    goto :goto_13

    :cond_11
    const/16 v4, 0x11

    :goto_13
    move v3, v4

    iget v4, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    invoke-virtual {v1, v4}, Landroid/support/v4/view/ViewPager;->infoForPosition(I)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v0

    iput v2, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    :cond_1c
    move v4, v3

    move-object v3, v0

    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-nez v0, :cond_26

    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->sortChildDrawingOrder()V

    return-void

    :cond_26
    iget-boolean v0, v1, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    if-eqz v0, :cond_2e

    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->sortChildDrawingOrder()V

    return-void

    :cond_2e
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    if-nez v0, :cond_35

    return-void

    :cond_35
    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/PagerAdapter;->startUpdate(Landroid/view/ViewGroup;)V

    iget v5, v1, Landroid/support/v4/view/ViewPager;->mOffscreenPageLimit:I

    iget v0, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    sub-int/2addr v0, v5

    const/4 v6, 0x0

    invoke-static {v6, v0}, Ljava/lang/Math;->max(II)I

    move-result v7

    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v0}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v8

    add-int/lit8 v0, v8, -0x1

    iget v9, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    add-int/2addr v9, v5

    invoke-static {v0, v9}, Ljava/lang/Math;->min(II)I

    move-result v9

    iget v0, v1, Landroid/support/v4/view/ViewPager;->mExpectedAdapterCount:I

    if-ne v8, v0, :cond_279

    const/4 v0, -0x1

    const/4 v10, 0x0

    const/4 v0, 0x0

    :goto_5a
    iget-object v11, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-ge v0, v11, :cond_7b

    iget-object v11, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/support/v4/view/ViewPager$ItemInfo;

    iget v12, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v13, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-lt v12, v13, :cond_78

    iget v12, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v13, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ne v12, v13, :cond_7b

    move-object v10, v11

    goto :goto_7b

    :cond_78
    add-int/lit8 v0, v0, 0x1

    goto :goto_5a

    :cond_7b
    :goto_7b
    if-nez v10, :cond_85

    if-lez v8, :cond_85

    iget v11, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    invoke-virtual {v1, v11, v0}, Landroid/support/v4/view/ViewPager;->addNewItem(II)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v10

    :cond_85
    if-eqz v10, :cond_1e9

    const/4 v13, 0x0

    add-int/lit8 v14, v0, -0x1

    if-ltz v14, :cond_95

    iget-object v15, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v15, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_96

    :cond_95
    const/4 v15, 0x0

    :goto_96
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v6

    const/high16 v17, 0x40000000    # 2.0f

    if-gtz v6, :cond_a2

    move/from16 v19, v0

    const/4 v11, 0x0

    goto :goto_b0

    :cond_a2
    iget v12, v10, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    sub-float v12, v17, v12

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingLeft()I

    move-result v11

    int-to-float v11, v11

    move/from16 v19, v0

    int-to-float v0, v6

    div-float/2addr v11, v0

    add-float/2addr v11, v12

    :goto_b0
    move v0, v11

    iget v11, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    add-int/lit8 v11, v11, -0x1

    move/from16 v12, v19

    :goto_b7
    if-ltz v11, :cond_127

    cmpl-float v19, v13, v0

    if-ltz v19, :cond_ed

    if-ge v11, v7, :cond_ed

    if-nez v15, :cond_c6

    nop

    move/from16 v20, v0

    goto/16 :goto_129

    :cond_c6
    move/from16 v20, v0

    iget v0, v15, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ne v11, v0, :cond_120

    iget-boolean v0, v15, Landroid/support/v4/view/ViewPager$ItemInfo;->scrolling:Z

    if-nez v0, :cond_120

    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v2, v15, Landroid/support/v4/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v0, v1, v11, v2}, Landroid/support/v4/view/PagerAdapter;->destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    add-int/lit8 v14, v14, -0x1

    add-int/lit8 v12, v12, -0x1

    if-ltz v14, :cond_eb

    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_ec

    :cond_eb
    const/4 v0, 0x0

    :goto_ec
    goto :goto_106

    :cond_ed
    move/from16 v20, v0

    if-eqz v15, :cond_107

    iget v0, v15, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ne v11, v0, :cond_107

    iget v0, v15, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v13, v0

    add-int/lit8 v14, v14, -0x1

    if-ltz v14, :cond_105

    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_106

    :cond_105
    const/4 v0, 0x0

    :goto_106
    goto :goto_11f

    :cond_107
    add-int/lit8 v0, v14, 0x1

    invoke-virtual {v1, v11, v0}, Landroid/support/v4/view/ViewPager;->addNewItem(II)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v0

    iget v2, v0, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v13, v2

    add-int/lit8 v12, v12, 0x1

    if-ltz v14, :cond_11d

    iget-object v2, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_11e

    :cond_11d
    const/4 v2, 0x0

    :goto_11e
    move-object v0, v2

    :goto_11f
    move-object v15, v0

    :cond_120
    add-int/lit8 v11, v11, -0x1

    move/from16 v0, v20

    move/from16 v2, p1

    goto :goto_b7

    :cond_127
    move/from16 v20, v0

    :goto_129
    iget v0, v10, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-int/lit8 v2, v12, 0x1

    cmpg-float v11, v0, v17

    if-gez v11, :cond_1e1

    iget-object v11, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-ge v2, v11, :cond_142

    iget-object v11, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v11, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_143

    :cond_142
    const/4 v11, 0x0

    :goto_143
    if-gtz v6, :cond_147

    const/4 v14, 0x0

    goto :goto_150

    :cond_147
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingRight()I

    move-result v14

    int-to-float v14, v14

    int-to-float v15, v6

    div-float/2addr v14, v15

    add-float v14, v14, v17

    :goto_150
    iget v15, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    add-int/lit8 v15, v15, 0x1

    :goto_154
    if-ge v15, v8, :cond_1db

    cmpl-float v17, v0, v14

    if-ltz v17, :cond_194

    if-le v15, v9, :cond_194

    if-nez v11, :cond_165

    nop

    move/from16 v21, v5

    move/from16 v22, v6

    goto/16 :goto_1df

    :cond_165
    move/from16 v21, v5

    iget v5, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ne v15, v5, :cond_191

    iget-boolean v5, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->scrolling:Z

    if-nez v5, :cond_191

    iget-object v5, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    iget-object v5, v1, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    move/from16 v22, v6

    iget-object v6, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v5, v1, v15, v6}, Landroid/support/v4/view/PagerAdapter;->destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    iget-object v5, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v2, v5, :cond_18e

    iget-object v5, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_18f

    :cond_18e
    const/4 v5, 0x0

    :goto_18f
    move-object v11, v5

    goto :goto_1d3

    :cond_191
    move/from16 v22, v6

    goto :goto_1d3

    :cond_194
    move/from16 v21, v5

    move/from16 v22, v6

    if-eqz v11, :cond_1b7

    iget v5, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ne v15, v5, :cond_1b7

    iget v5, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v0, v5

    add-int/lit8 v2, v2, 0x1

    iget-object v5, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v2, v5, :cond_1b4

    iget-object v5, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_1b5

    :cond_1b4
    const/4 v5, 0x0

    :goto_1b5
    move-object v11, v5

    goto :goto_1d3

    :cond_1b7
    invoke-virtual {v1, v15, v2}, Landroid/support/v4/view/ViewPager;->addNewItem(II)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v5

    add-int/lit8 v2, v2, 0x1

    iget v6, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v0, v6

    iget-object v6, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v2, v6, :cond_1d1

    iget-object v6, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_1d2

    :cond_1d1
    const/4 v6, 0x0

    :goto_1d2
    move-object v11, v6

    :goto_1d3
    add-int/lit8 v15, v15, 0x1

    move/from16 v5, v21

    move/from16 v6, v22

    goto/16 :goto_154

    :cond_1db
    move/from16 v21, v5

    move/from16 v22, v6

    :goto_1df
    move-object v15, v11

    goto :goto_1e5

    :cond_1e1
    move/from16 v21, v5

    move/from16 v22, v6

    :goto_1e5
    invoke-direct {v1, v10, v12, v3}, Landroid/support/v4/view/ViewPager;->calculatePageOffsets(Landroid/support/v4/view/ViewPager$ItemInfo;ILandroid/support/v4/view/ViewPager$ItemInfo;)V

    goto :goto_1ef

    :cond_1e9
    move/from16 v19, v0

    move/from16 v21, v5

    move/from16 v12, v19

    :goto_1ef
    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget v2, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-eqz v10, :cond_1f8

    iget-object v5, v10, Landroid/support/v4/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    goto :goto_1f9

    :cond_1f8
    const/4 v5, 0x0

    :goto_1f9
    invoke-virtual {v0, v1, v2, v5}, Landroid/support/v4/view/PagerAdapter;->setPrimaryItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/PagerAdapter;->finishUpdate(Landroid/view/ViewGroup;)V

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v0

    const/4 v2, 0x0

    :goto_206
    if-ge v2, v0, :cond_232

    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/support/v4/view/ViewPager$LayoutParams;

    iput v2, v6, Landroid/support/v4/view/ViewPager$LayoutParams;->childIndex:I

    iget-boolean v11, v6, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-nez v11, :cond_22e

    iget v11, v6, Landroid/support/v4/view/ViewPager$LayoutParams;->widthFactor:F

    const/4 v13, 0x0

    cmpl-float v11, v11, v13

    if-nez v11, :cond_22f

    invoke-virtual {v1, v5}, Landroid/support/v4/view/ViewPager;->infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v11

    if-eqz v11, :cond_22f

    iget v14, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    iput v14, v6, Landroid/support/v4/view/ViewPager$LayoutParams;->widthFactor:F

    iget v14, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iput v14, v6, Landroid/support/v4/view/ViewPager$LayoutParams;->position:I

    goto :goto_22f

    :cond_22e
    const/4 v13, 0x0

    :cond_22f
    :goto_22f
    add-int/lit8 v2, v2, 0x1

    goto :goto_206

    :cond_232
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->sortChildDrawingOrder()V

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->hasFocus()Z

    move-result v2

    if-eqz v2, :cond_278

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->findFocus()Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_248

    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPager;->infoForAnyChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v5

    move-object/from16 v18, v5

    goto :goto_24a

    :cond_248
    const/16 v18, 0x0

    :goto_24a
    move-object/from16 v5, v18

    if-eqz v5, :cond_254

    iget v6, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v11, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-eq v6, v11, :cond_278

    :cond_254
    const/16 v16, 0x0

    :goto_256
    move/from16 v6, v16

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v11

    if-ge v6, v11, :cond_278

    invoke-virtual {v1, v6}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    invoke-virtual {v1, v11}, Landroid/support/v4/view/ViewPager;->infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v5

    if-eqz v5, :cond_275

    iget v13, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v14, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ne v13, v14, :cond_275

    invoke-virtual {v11, v4}, Landroid/view/View;->requestFocus(I)Z

    move-result v13

    if-eqz v13, :cond_275

    goto :goto_278

    :cond_275
    add-int/lit8 v16, v6, 0x1

    goto :goto_256

    :cond_278
    :goto_278
    return-void

    :cond_279
    move/from16 v21, v5

    :try_start_27b
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getId()I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0
    :try_end_287
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_27b .. :try_end_287} :catch_288

    goto :goto_291

    :catch_288
    move-exception v0

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    :goto_291
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "The application\'s PagerAdapter changed the adapter\'s contents without calling PagerAdapter#notifyDataSetChanged! Expected adapter item count: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, v1, Landroid/support/v4/view/ViewPager;->mExpectedAdapterCount:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ", found: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " Pager id: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " Pager class: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v6, " Problematic adapter: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v1, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public removeOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :cond_9
    return-void
.end method

.method public removeView(Landroid/view/View;)V
    .registers 3

    iget-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mInLayout:Z

    if-eqz v0, :cond_8

    invoke-virtual {p0, p1}, Landroid/support/v4/view/ViewPager;->removeViewInLayout(Landroid/view/View;)V

    goto :goto_b

    :cond_8
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :goto_b
    return-void
.end method

.method public setAdapter(Landroid/support/v4/view/PagerAdapter;)V
    .registers 10

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    const/4 v1, 0x0

    if-eqz v0, :cond_40

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mObserver:Landroid/support/v4/view/ViewPager$PagerObserver;

    invoke-virtual {v0, v2}, Landroid/support/v4/view/PagerAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v0, p0}, Landroid/support/v4/view/PagerAdapter;->startUpdate(Landroid/view/ViewGroup;)V

    move v0, v1

    :goto_12
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_2e

    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager$ItemInfo;

    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget v4, v2, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget-object v5, v2, Landroid/support/v4/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v3, p0, v4, v5}, Landroid/support/v4/view/PagerAdapter;->destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    :cond_2e
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v0, p0}, Landroid/support/v4/view/PagerAdapter;->finishUpdate(Landroid/view/ViewGroup;)V

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->removeNonDecorViews()V

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    invoke-virtual {p0, v1, v1}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    :cond_40
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iput-object p1, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mExpectedAdapterCount:I

    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v2, :cond_8f

    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mObserver:Landroid/support/v4/view/ViewPager$PagerObserver;

    const/4 v3, 0x0

    if-nez v2, :cond_56

    new-instance v2, Landroid/support/v4/view/ViewPager$PagerObserver;

    invoke-direct {v2, p0, v3}, Landroid/support/v4/view/ViewPager$PagerObserver;-><init>(Landroid/support/v4/view/ViewPager;Landroid/support/v4/view/ViewPager$1;)V

    iput-object v2, p0, Landroid/support/v4/view/ViewPager;->mObserver:Landroid/support/v4/view/ViewPager$PagerObserver;

    :cond_56
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v4, p0, Landroid/support/v4/view/ViewPager;->mObserver:Landroid/support/v4/view/ViewPager$PagerObserver;

    invoke-virtual {v2, v4}, Landroid/support/v4/view/PagerAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    iput-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    iget-boolean v2, p0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    const/4 v4, 0x1

    iput-boolean v4, p0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    iget-object v5, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v5}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v5

    iput v5, p0, Landroid/support/v4/view/ViewPager;->mExpectedAdapterCount:I

    iget v5, p0, Landroid/support/v4/view/ViewPager;->mRestoredCurItem:I

    if-ltz v5, :cond_86

    iget-object v5, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v6, p0, Landroid/support/v4/view/ViewPager;->mRestoredAdapterState:Landroid/os/Parcelable;

    iget-object v7, p0, Landroid/support/v4/view/ViewPager;->mRestoredClassLoader:Ljava/lang/ClassLoader;

    invoke-virtual {v5, v6, v7}, Landroid/support/v4/view/PagerAdapter;->restoreState(Landroid/os/Parcelable;Ljava/lang/ClassLoader;)V

    iget v5, p0, Landroid/support/v4/view/ViewPager;->mRestoredCurItem:I

    invoke-virtual {p0, v5, v1, v4}, Landroid/support/v4/view/ViewPager;->setCurrentItemInternal(IZZ)V

    const/4 v1, -0x1

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mRestoredCurItem:I

    iput-object v3, p0, Landroid/support/v4/view/ViewPager;->mRestoredAdapterState:Landroid/os/Parcelable;

    iput-object v3, p0, Landroid/support/v4/view/ViewPager;->mRestoredClassLoader:Ljava/lang/ClassLoader;

    goto :goto_8f

    :cond_86
    if-nez v2, :cond_8c

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->populate()V

    goto :goto_8f

    :cond_8c
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->requestLayout()V

    :cond_8f
    :goto_8f
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mAdapterChangeListener:Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;

    if-eqz v1, :cond_9a

    if-eq v0, p1, :cond_9a

    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mAdapterChangeListener:Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;

    invoke-interface {v1, v0, p1}, Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;->onAdapterChanged(Landroid/support/v4/view/PagerAdapter;Landroid/support/v4/view/PagerAdapter;)V

    :cond_9a
    return-void
.end method

.method setChildrenDrawingOrderEnabledCompat(Z)V
    .registers 8

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x7

    if-lt v0, v1, :cond_3a

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mSetChildrenDrawingOrderEnabled:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_24

    :try_start_b
    const-class v0, Landroid/view/ViewGroup;

    const-string v3, "setChildrenDrawingOrderEnabled"

    new-array v4, v2, [Ljava/lang/Class;

    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v5, v4, v1

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mSetChildrenDrawingOrderEnabled:Ljava/lang/reflect/Method;
    :try_end_1b
    .catch Ljava/lang/NoSuchMethodException; {:try_start_b .. :try_end_1b} :catch_1c

    goto :goto_24

    :catch_1c
    move-exception v0

    const-string v3, "ViewPager"

    const-string v4, "Can\'t find setChildrenDrawingOrderEnabled"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_24
    :goto_24
    :try_start_24
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mSetChildrenDrawingOrderEnabled:Ljava/lang/reflect/Method;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v2, v1

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_31} :catch_32

    goto :goto_3a

    :catch_32
    move-exception v0

    const-string v1, "ViewPager"

    const-string v2, "Error changing children drawing order"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_3a
    :goto_3a
    return-void
.end method

.method public setCurrentItem(I)V
    .registers 4

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    iget-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, p1, v1, v0}, Landroid/support/v4/view/ViewPager;->setCurrentItemInternal(IZZ)V

    return-void
.end method

.method public setCurrentItem(IZ)V
    .registers 4

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    invoke-virtual {p0, p1, p2, v0}, Landroid/support/v4/view/ViewPager;->setCurrentItemInternal(IZZ)V

    return-void
.end method

.method setCurrentItemInternal(IZZ)V
    .registers 5

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Landroid/support/v4/view/ViewPager;->setCurrentItemInternal(IZZI)V

    return-void
.end method

.method setCurrentItemInternal(IZZI)V
    .registers 10

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    const/4 v1, 0x0

    if-eqz v0, :cond_73

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v0}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v0

    if-gtz v0, :cond_e

    goto :goto_73

    :cond_e
    if-nez p3, :cond_20

    iget v0, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ne v0, p1, :cond_20

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-eqz v0, :cond_20

    invoke-direct {p0, v1}, Landroid/support/v4/view/ViewPager;->setScrollingCacheEnabled(Z)V

    return-void

    :cond_20
    const/4 v0, 0x1

    if-gez p1, :cond_25

    const/4 p1, 0x0

    goto :goto_35

    :cond_25
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v2}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v2

    if-lt p1, v2, :cond_35

    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v2}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v2

    add-int/lit8 p1, v2, -0x1

    :cond_35
    :goto_35
    iget v2, p0, Landroid/support/v4/view/ViewPager;->mOffscreenPageLimit:I

    iget v3, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    add-int/2addr v3, v2

    if-gt p1, v3, :cond_41

    iget v3, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    sub-int/2addr v3, v2

    if-ge p1, v3, :cond_57

    :cond_41
    move v3, v1

    :goto_42
    iget-object v4, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_57

    iget-object v4, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/v4/view/ViewPager$ItemInfo;

    iput-boolean v0, v4, Landroid/support/v4/view/ViewPager$ItemInfo;->scrolling:Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_42

    :cond_57
    iget v3, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-eq v3, p1, :cond_5c

    goto :goto_5d

    :cond_5c
    move v0, v1

    :goto_5d
    iget-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    if-eqz v1, :cond_6c

    iput p1, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-eqz v0, :cond_68

    invoke-direct {p0, p1}, Landroid/support/v4/view/ViewPager;->dispatchOnPageSelected(I)V

    :cond_68
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->requestLayout()V

    goto :goto_72

    :cond_6c
    invoke-virtual {p0, p1}, Landroid/support/v4/view/ViewPager;->populate(I)V

    invoke-direct {p0, p1, p2, p4, v0}, Landroid/support/v4/view/ViewPager;->scrollToItem(IZIZ)V

    :goto_72
    return-void

    :cond_73
    :goto_73
    invoke-direct {p0, v1}, Landroid/support/v4/view/ViewPager;->setScrollingCacheEnabled(Z)V

    return-void
.end method

.method setInternalPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)Landroid/support/v4/view/ViewPager$OnPageChangeListener;
    .registers 3

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mInternalPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    iput-object p1, p0, Landroid/support/v4/view/ViewPager;->mInternalPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    return-object v0
.end method

.method public setOffscreenPageLimit(I)V
    .registers 6

    const/4 v0, 0x1

    if-ge p1, v0, :cond_22

    const-string v1, "ViewPager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Requested offscreen page limit "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " too small; defaulting to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x1

    :cond_22
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mOffscreenPageLimit:I

    if-eq p1, v0, :cond_2b

    iput p1, p0, Landroid/support/v4/view/ViewPager;->mOffscreenPageLimit:I

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->populate()V

    :cond_2b
    return-void
.end method

.method setOnAdapterChangeListener(Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v4/view/ViewPager;->mAdapterChangeListener:Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;

    return-void
.end method

.method public setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iput-object p1, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    return-void
.end method

.method public setPageMargin(I)V
    .registers 4

    iget v0, p0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    iput p1, p0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getWidth()I

    move-result v1

    invoke-direct {p0, v1, v1, p1, v0}, Landroid/support/v4/view/ViewPager;->recomputeScrollPosition(IIII)V

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->requestLayout()V

    return-void
.end method

.method public setPageMarginDrawable(I)V
    .registers 3
    .param p1    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->setPageMarginDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setPageMarginDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    iput-object p1, p0, Landroid/support/v4/view/ViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_7

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->refreshDrawableState()V

    :cond_7
    if-nez p1, :cond_b

    const/4 v0, 0x1

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->setWillNotDraw(Z)V

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->invalidate()V

    return-void
.end method

.method public setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V
    .registers 7

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_2e

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p2, :cond_c

    move v2, v1

    goto :goto_d

    :cond_c
    move v2, v0

    :goto_d
    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mPageTransformer:Landroid/support/v4/view/ViewPager$PageTransformer;

    if-eqz v3, :cond_13

    move v3, v1

    goto :goto_14

    :cond_13
    move v3, v0

    :goto_14
    if-eq v2, v3, :cond_18

    move v3, v1

    goto :goto_19

    :cond_18
    move v3, v0

    :goto_19
    iput-object p2, p0, Landroid/support/v4/view/ViewPager;->mPageTransformer:Landroid/support/v4/view/ViewPager$PageTransformer;

    invoke-virtual {p0, v2}, Landroid/support/v4/view/ViewPager;->setChildrenDrawingOrderEnabledCompat(Z)V

    if-eqz v2, :cond_27

    if-eqz p1, :cond_24

    const/4 v1, 0x2

    nop

    :cond_24
    iput v1, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrder:I

    goto :goto_29

    :cond_27
    iput v0, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrder:I

    :goto_29
    if-eqz v3, :cond_2e

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->populate()V

    :cond_2e
    return-void
.end method

.method smoothScrollTo(II)V
    .registers 4

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Landroid/support/v4/view/ViewPager;->smoothScrollTo(III)V

    return-void
.end method

.method smoothScrollTo(III)V
    .registers 21

    move-object/from16 v0, p0

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_d

    invoke-direct {v0, v2}, Landroid/support/v4/view/ViewPager;->setScrollingCacheEnabled(Z)V

    return-void

    :cond_d
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v1

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollY()I

    move-result v9

    sub-int v10, p1, v1

    sub-int v11, p2, v9

    if-nez v10, :cond_27

    if-nez v11, :cond_27

    invoke-direct {v0, v2}, Landroid/support/v4/view/ViewPager;->completeScroll(Z)V

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->populate()V

    invoke-direct {v0, v2}, Landroid/support/v4/view/ViewPager;->setScrollState(I)V

    return-void

    :cond_27
    const/4 v2, 0x1

    invoke-direct {v0, v2}, Landroid/support/v4/view/ViewPager;->setScrollingCacheEnabled(Z)V

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/support/v4/view/ViewPager;->setScrollState(I)V

    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v2

    div-int/lit8 v12, v2, 0x2

    invoke-static {v10}, Ljava/lang/Math;->abs(I)I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x3f800000    # 1.0f

    mul-float/2addr v3, v4

    int-to-float v5, v2

    div-float/2addr v3, v5

    invoke-static {v4, v3}, Ljava/lang/Math;->min(FF)F

    move-result v13

    int-to-float v3, v12

    int-to-float v5, v12

    invoke-virtual {v0, v13}, Landroid/support/v4/view/ViewPager;->distanceInfluenceForSnapDuration(F)F

    move-result v6

    mul-float/2addr v5, v6

    add-float v14, v3, v5

    const/4 v3, 0x0

    invoke-static/range {p3 .. p3}, Ljava/lang/Math;->abs(I)I

    move-result v8

    if-lez v8, :cond_64

    const/4 v4, 0x4

    const/high16 v5, 0x447a0000    # 1000.0f

    int-to-float v6, v8

    div-float v6, v14, v6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    mul-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    mul-int/2addr v4, v5

    goto :goto_7d

    :cond_64
    int-to-float v5, v2

    iget-object v6, v0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget v7, v0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    invoke-virtual {v6, v7}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v6

    mul-float/2addr v5, v6

    invoke-static {v10}, Ljava/lang/Math;->abs(I)I

    move-result v6

    int-to-float v6, v6

    iget v7, v0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    int-to-float v7, v7

    add-float/2addr v7, v5

    div-float/2addr v6, v7

    add-float/2addr v4, v6

    const/high16 v7, 0x42c80000    # 100.0f

    mul-float/2addr v4, v7

    float-to-int v4, v4

    :goto_7d
    const/16 v3, 0x258

    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    move-result v15

    iget-object v3, v0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    move v4, v1

    move v5, v9

    move v6, v10

    move v7, v11

    move/from16 v16, v8

    move v8, v15

    invoke-virtual/range {v3 .. v8}, Landroid/widget/Scroller;->startScroll(IIIII)V

    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    return-void
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .registers 3

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-nez v0, :cond_d

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_b

    goto :goto_d

    :cond_b
    const/4 v0, 0x0

    goto :goto_e

    :cond_d
    :goto_d
    const/4 v0, 0x1

    :goto_e
    return v0
.end method
