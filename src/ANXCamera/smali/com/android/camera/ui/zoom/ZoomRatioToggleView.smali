.class public Lcom/android/camera/ui/zoom/ZoomRatioToggleView;
.super Landroid/view/ViewGroup;
.source "ZoomRatioToggleView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ViewSpec;,
        Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;
    }
.end annotation


# static fields
.field private static final DEFAULT_DURATION_OF_FADEOUT_ANIMATION:I = 0x190

.field private static final DEFAULT_DURATION_OF_MOVING_ANIMATION:I = 0x104

.field private static final INVALID_INDEX:I = -0x1

.field private static final INVALID_ZOOM_RATIO:F = -1.0f

.field private static final MOVING_DIRECTION_LEFT_TO_RIGHT:I = 0x1

.field private static final MOVING_DIRECTION_RIGHT_TO_LEFT:I = -0x1

.field private static final PIXELS_PER_SECOND:I = 0x3e8

.field private static final TAG:Ljava/lang/String; = "ZoomRatioToggleView"

.field private static final TIMEOUT_FOR_EXIT_ACTIVE_STATE:I = 0x7d0

.field private static final TOUCH_SCROLL_THRESHOLD:I = 0xa

.field private static final TOUCH_STATE_CLICK:I = 0x1

.field private static final TOUCH_STATE_IDLE:I = 0x0

.field private static final TOUCH_STATE_SCROLL:I = 0x2

.field private static final UI_DEBUG_ENABLED:Z = true

.field private static final VELOCITY_THRESHOLD:I = 0x64


# instance fields
.field private mActionListener:Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;

.field private mCircleSize:I

.field private mColor:I

.field private mCurrentSelectedChildIndex:I

.field private mFadeInAnimatorSet:Landroid/animation/AnimatorSet;

.field private mFadeOutAnimatorSet:Landroid/animation/AnimatorSet;

.field private final mInactiveTask:Ljava/lang/Runnable;

.field private final mIndexUpdater:Ljava/lang/Runnable;

.field private mIsImmersive:Z

.field private mIsSuppressed:Z

.field private mItemHeight:I

.field private mItemWidth:I

.field private mLongClickAllowed:Z

.field private mLongPressRunnable:Ljava/lang/Runnable;

.field private mMovingAnimatorSet:Landroid/animation/AnimatorSet;

.field private mOverlayView:Lcom/android/camera/ui/zoom/ZoomRatioView;

.field private mOverlayViewHasBeenAdded:Z

.field private mPaint:Landroid/graphics/Paint;

.field private mRect:Landroid/graphics/Rect;

.field private mScaleX:F

.field private mScaleY:F

.field private mStrokeColor:I

.field private mStrokeWidth:I

.field private mSwipeAllowed:Z

.field private mTouchStartX:I

.field private mTouchStartY:I

.field private mTouchState:I

.field private final mUiHandler:Landroid/os/Handler;

.field private mVelocityTracker:Landroid/view/VelocityTracker;

.field private mZoomInOutAnimatorSet:Landroid/animation/AnimatorSet;

.field private mZoomRatio:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mTouchState:I

    invoke-static {}, Lcom/android/camera/HybridZoomingSystem;->getDefaultOpticalZoomRatioIndex()I

    move-result p2

    iput p2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    iget p2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    invoke-static {p2}, Lcom/android/camera/HybridZoomingSystem;->getOpticalZoomRatioAt(I)F

    move-result p2

    iput p2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mZoomRatio:F

    const/high16 p2, 0x3f800000    # 1.0f

    iput p2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mScaleX:F

    iput p2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mScaleY:F

    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mLongClickAllowed:Z

    iput-boolean p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mSwipeAllowed:Z

    iput-boolean p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsImmersive:Z

    iput-boolean p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsSuppressed:Z

    new-instance p2, Landroid/os/Handler;

    invoke-direct {p2}, Landroid/os/Handler;-><init>()V

    iput-object p2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mUiHandler:Landroid/os/Handler;

    iput-boolean p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mOverlayViewHasBeenAdded:Z

    new-instance p1, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$1;

    invoke-direct {p1, p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$1;-><init>(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)V

    iput-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIndexUpdater:Ljava/lang/Runnable;

    new-instance p1, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$4;

    invoke-direct {p1, p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$4;-><init>(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)V

    iput-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mInactiveTask:Ljava/lang/Runnable;

    invoke-direct {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->init()V

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)F
    .locals 0

    iget p0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mZoomRatio:F

    return p0
.end method

.method static synthetic access$100(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)Z
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->isAnimating()Z

    move-result p0

    return p0
.end method

.method static synthetic access$1000(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mActionListener:Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsImmersive:Z

    return p0
.end method

.method static synthetic access$1200(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsSuppressed:Z

    return p0
.end method

.method static synthetic access$1300(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->startFadeInAnimation()V

    return-void
.end method

.method static synthetic access$1400(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    return p0
.end method

.method static synthetic access$1500(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)Landroid/animation/AnimatorSet;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mFadeOutAnimatorSet:Landroid/animation/AnimatorSet;

    return-object p0
.end method

.method static synthetic access$200(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mUiHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;IZ)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->setSelectedChildIndex(IZ)V

    return-void
.end method

.method static synthetic access$500(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mTouchState:I

    return p0
.end method

.method static synthetic access$600(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mTouchStartX:I

    return p0
.end method

.method static synthetic access$700(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mTouchStartY:I

    return p0
.end method

.method static synthetic access$800(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;II)I
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getContainingChildIndex(II)I

    move-result p0

    return p0
.end method

.method static synthetic access$900(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->longClickChild(I)V

    return-void
.end method

.method private announceCurrentZoomRatioForAccessibility()V
    .locals 5

    iget v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mZoomRatio:F

    invoke-static {v0}, Lcom/android/camera/HybridZoomingSystem;->toDecimal(F)F

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const v4, 0x7f090100

    invoke-direct {p0, v4, v2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->setContentDescription(Ljava/lang/CharSequence;)V

    new-array v1, v1, [Ljava/lang/Object;

    aput-object v0, v1, v3

    invoke-direct {p0, v4, v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->announceForAccessibility(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private clickChildAt(II)V
    .locals 2

    invoke-direct {p0, p1, p2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getContainingChildIndex(II)I

    move-result p1

    const/4 p2, -0x1

    if-eq p1, p2, :cond_4

    iget v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    const/4 v1, 0x1

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mZoomInOutAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsImmersive:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsSuppressed:Z

    if-nez v0, :cond_0

    iget p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    add-int/2addr p1, v1

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildCount()I

    move-result v0

    rem-int/2addr p1, v0

    :cond_0
    invoke-direct {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->isLayoutRTL()Z

    move-result v0

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    if-le p1, v0, :cond_1

    :goto_0
    move p2, v1

    goto :goto_1

    :cond_1
    goto :goto_1

    :cond_2
    iget v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    if-ge p1, v0, :cond_3

    goto :goto_0

    :cond_3
    :goto_1
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v1, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->moveTo(IIIZ)V

    :cond_4
    return-void
.end method

.method private static debugUi(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private endTouch(F)V
    .locals 4

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const/high16 v1, 0x42c80000    # 100.0f

    cmpl-float v0, v0, v1

    const/4 v1, 0x0

    if-ltz v0, :cond_8

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsImmersive:Z

    if-nez v0, :cond_8

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsSuppressed:Z

    if-nez v0, :cond_8

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mSwipeAllowed:Z

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    cmpl-float p1, p1, v0

    const/4 v0, 0x1

    if-lez p1, :cond_0

    move p1, v0

    goto :goto_0

    :cond_0
    const/4 p1, -0x1

    :goto_0
    invoke-direct {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->isLayoutRTL()Z

    move-result v2

    if-eqz v2, :cond_4

    if-ne p1, v0, :cond_2

    iget v2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildCount()I

    move-result v3

    sub-int/2addr v3, v0

    if-ne v2, v3, :cond_1

    iget v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    goto :goto_2

    :cond_1
    iget v2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    add-int/2addr v0, v2

    goto :goto_2

    :cond_2
    iget v2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    if-nez v2, :cond_3

    :goto_1
    move v0, v1

    goto :goto_2

    :cond_3
    iget v2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    add-int/lit8 v0, v2, -0x1

    goto :goto_2

    :cond_4
    if-ne p1, v0, :cond_6

    iget v2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    if-nez v2, :cond_5

    goto :goto_1

    :cond_5
    iget v2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    add-int/lit8 v0, v2, -0x1

    goto :goto_2

    :cond_6
    iget v2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildCount()I

    move-result v3

    sub-int/2addr v3, v0

    if-ne v2, v3, :cond_7

    iget v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    goto :goto_2

    :cond_7
    iget v2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    add-int/2addr v2, v0

    move v0, v2

    :goto_2
    const/4 v2, 0x2

    invoke-direct {p0, v0, p1, v2, v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->moveTo(IIIZ)V

    :cond_8
    iget-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz p1, :cond_9

    iget-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {p1}, Landroid/view/VelocityTracker;->recycle()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mVelocityTracker:Landroid/view/VelocityTracker;

    :cond_9
    iget-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mLongPressRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->removeCallbacks(Ljava/lang/Runnable;)Z

    iput v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mTouchState:I

    return-void
.end method

.method private ensureViewOverlayHasBeenAdded()V
    .locals 2

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mOverlayViewHasBeenAdded:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getOverlay()Landroid/view/ViewGroupOverlay;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mOverlayView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroupOverlay;->add(Landroid/view/View;)V

    const-string v0, "ZoomRatioToggleView"

    const-string v1, "addOverlayView()"

    invoke-static {v0, v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mOverlayViewHasBeenAdded:Z

    :cond_0
    return-void
.end method

.method private ensureViewOverlayHasBeenRemoved()V
    .locals 2

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mOverlayViewHasBeenAdded:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getOverlay()Landroid/view/ViewGroupOverlay;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mOverlayView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroupOverlay;->remove(Landroid/view/View;)V

    const-string v0, "ZoomRatioToggleView"

    const-string v1, "removeOverlayView()"

    invoke-static {v0, v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mOverlayViewHasBeenAdded:Z

    :cond_0
    return-void
.end method

.method private getContainingChildIndex(II)I
    .locals 4

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mRect:Landroid/graphics/Rect;

    if-nez v0, :cond_0

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mRect:Landroid/graphics/Rect;

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildCount()I

    move-result v1

    :goto_0
    if-ge v0, v1, :cond_2

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mRect:Landroid/graphics/Rect;

    invoke-virtual {v2, v3}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    iget-object v2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mRect:Landroid/graphics/Rect;

    invoke-virtual {v2, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v2

    if-eqz v2, :cond_1

    return v0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, -0x1

    return p1
.end method

.method private getDimensionPixelSize(I)I
    .locals 1
    .param p1    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    return p1
.end method

.method private getOverlayView()Lcom/android/camera/ui/zoom/ZoomRatioView;
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->ensureViewOverlayHasBeenAdded()V

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mOverlayView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    return-object v0
.end method

.method private varargs getString(I[Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p1    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private init()V
    .locals 4

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->setWillNotDraw(Z)V

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mPaint:Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    const v0, 0x7f0a0097

    invoke-direct {p0, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getDimensionPixelSize(I)I

    move-result v0

    const v1, 0x7f0a0099

    invoke-direct {p0, v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getDimensionPixelSize(I)I

    move-result v1

    mul-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCircleSize:I

    const v0, 0x7f0a0032

    invoke-direct {p0, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mStrokeWidth:I

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b0061

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mStrokeColor:I

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b0060

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mColor:I

    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mMovingAnimatorSet:Landroid/animation/AnimatorSet;

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mMovingAnimatorSet:Landroid/animation/AnimatorSet;

    const-wide/16 v1, 0x104

    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mMovingAnimatorSet:Landroid/animation/AnimatorSet;

    new-instance v1, Lmiui/maml/animation/interpolater/QuartEaseOutInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/QuartEaseOutInterpolater;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mFadeInAnimatorSet:Landroid/animation/AnimatorSet;

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mFadeInAnimatorSet:Landroid/animation/AnimatorSet;

    const-wide/16 v1, 0x190

    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mFadeInAnimatorSet:Landroid/animation/AnimatorSet;

    new-instance v3, Lmiui/maml/animation/interpolater/SineEaseInOutInterpolater;

    invoke-direct {v3}, Lmiui/maml/animation/interpolater/SineEaseInOutInterpolater;-><init>()V

    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mFadeOutAnimatorSet:Landroid/animation/AnimatorSet;

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mFadeOutAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mFadeOutAnimatorSet:Landroid/animation/AnimatorSet;

    new-instance v1, Lmiui/maml/animation/interpolater/SineEaseInOutInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/SineEaseInOutInterpolater;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f060001

    invoke-static {v0, v1}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object v0

    check-cast v0, Landroid/animation/AnimatorSet;

    iput-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mZoomInOutAnimatorSet:Landroid/animation/AnimatorSet;

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mZoomInOutAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0, p0}, Landroid/animation/AnimatorSet;->setTarget(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mZoomInOutAnimatorSet:Landroid/animation/AnimatorSet;

    new-instance v1, Lmiui/view/animation/QuadraticEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/QuadraticEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    return-void
.end method

.method private isAnimating()Z
    .locals 3

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mMovingAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    const-string v0, "ZoomRatioToggleView"

    const-string v2, "isAnimating(): move"

    invoke-static {v0, v2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mFadeInAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "ZoomRatioToggleView"

    const-string v2, "isAnimating(): fadein"

    invoke-static {v0, v2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mFadeOutAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "ZoomRatioToggleView"

    const-string v2, "isAnimating(): fadeout"

    invoke-static {v0, v2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_2
    const/4 v0, 0x0

    return v0
.end method

.method private isLayoutRTL()Z
    .locals 3

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    move v1, v2

    nop

    :cond_1
    return v1
.end method

.method private longClickChild(I)V
    .locals 1

    iget v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    if-ne p1, v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mLongClickAllowed:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsImmersive:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsSuppressed:Z

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mActionListener:Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;

    if-eqz v0, :cond_1

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->performHapticFeedback(I)Z

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mActionListener:Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;

    check-cast p1, Lcom/android/camera/ui/zoom/ZoomRatioView;

    invoke-interface {v0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;->onLongClick(Lcom/android/camera/ui/zoom/ZoomRatioView;)Z

    :cond_1
    return-void
.end method

.method private moveTo(IIIZ)V
    .locals 16

    move-object/from16 v6, p0

    move/from16 v7, p1

    move/from16 v3, p3

    const-string v0, "ZoomRatioToggleView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "move E: target = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " V.S. current = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v6, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    const/4 v1, 0x2

    const/4 v2, -0x1

    if-eq v7, v2, :cond_5

    iget v2, v6, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    if-eq v7, v2, :cond_5

    iget-boolean v2, v6, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsSuppressed:Z

    if-nez v2, :cond_5

    iget-object v2, v6, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mUiHandler:Landroid/os/Handler;

    iget-object v4, v6, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIndexUpdater:Ljava/lang/Runnable;

    invoke-virtual {v2, v4}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget v2, v6, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    sub-int v2, v7, v2

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    const/4 v4, 0x0

    if-eq v3, v0, :cond_1

    if-ne v3, v1, :cond_0

    goto :goto_0

    :cond_0
    move v5, v4

    goto :goto_1

    :cond_1
    :goto_0
    const/16 v5, 0x104

    :goto_1
    mul-int v2, v2, p2

    iget v8, v6, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mItemWidth:I

    mul-int/2addr v2, v8

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildCount()I

    move-result v9

    move v10, v4

    :goto_2
    if-ge v10, v9, :cond_4

    invoke-virtual {v6, v10}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Lcom/android/camera/ui/zoom/ZoomRatioView;

    invoke-virtual {v11}, Lcom/android/camera/ui/zoom/ZoomRatioView;->getTranslationX()F

    move-result v12

    if-ne v10, v7, :cond_2

    sget-object v13, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v14, v1, [F

    fill-array-data v14, :array_0

    invoke-static {v11, v13, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v13

    invoke-interface {v8, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v13, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    new-array v14, v1, [F

    aput v12, v14, v4

    int-to-float v15, v2

    add-float/2addr v12, v15

    aput v12, v14, v0

    invoke-static {v11, v13, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v11

    invoke-interface {v8, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_2
    iget v13, v6, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    if-ne v10, v13, :cond_3

    sget-object v13, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v14, v1, [F

    fill-array-data v14, :array_1

    invoke-static {v11, v13, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v13

    invoke-interface {v8, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v13, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    new-array v14, v1, [F

    aput v12, v14, v4

    int-to-float v15, v2

    add-float/2addr v12, v15

    aput v12, v14, v0

    invoke-static {v11, v13, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v11

    invoke-interface {v8, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_3
    sget-object v13, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v14, v1, [F

    fill-array-data v14, :array_2

    invoke-static {v11, v13, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v13

    invoke-interface {v8, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v13, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    new-array v14, v1, [F

    aput v12, v14, v4

    int-to-float v15, v2

    add-float/2addr v12, v15

    aput v12, v14, v0

    invoke-static {v11, v13, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v11

    invoke-interface {v8, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_3
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    :cond_4
    iget v0, v6, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    invoke-virtual {v6, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/android/camera/ui/zoom/ZoomRatioView;

    invoke-virtual/range {p0 .. p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lcom/android/camera/ui/zoom/ZoomRatioView;

    iput v7, v6, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    iget-object v0, v6, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mMovingAnimatorSet:Landroid/animation/AnimatorSet;

    int-to-long v9, v5

    invoke-virtual {v0, v9, v10}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    iget-object v0, v6, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mMovingAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->removeAllListeners()V

    iget-object v9, v6, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mMovingAnimatorSet:Landroid/animation/AnimatorSet;

    new-instance v10, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;

    move-object v0, v10

    move-object v1, v6

    move/from16 v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$3;-><init>(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;Lcom/android/camera/ui/zoom/ZoomRatioView;ILcom/android/camera/ui/zoom/ZoomRatioView;Z)V

    invoke-virtual {v9, v10}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object v0, v6, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mMovingAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0, v8}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    iget-object v0, v6, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mMovingAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    const-string v0, "ZoomRatioToggleView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "start moving to: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    :cond_5
    iget v2, v6, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    if-ne v7, v2, :cond_9

    if-eqz p4, :cond_6

    iget-boolean v2, v6, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsImmersive:Z

    if-nez v2, :cond_6

    iget-boolean v2, v6, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsSuppressed:Z

    if-nez v2, :cond_6

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_6

    const-string v2, "ZoomRatioToggleView"

    const-string v4, "same index only run startFadeInAnimation"

    invoke-static {v2, v4}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct/range {p0 .. p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->startFadeInAnimation()V

    :cond_6
    invoke-virtual/range {p0 .. p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/android/camera/ui/zoom/ZoomRatioView;

    if-eqz v2, :cond_8

    iget v4, v6, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mZoomRatio:F

    invoke-virtual {v2, v4}, Lcom/android/camera/ui/zoom/ZoomRatioView;->setZoomRatio(F)V

    if-eq v3, v0, :cond_7

    if-ne v3, v1, :cond_8

    :cond_7
    iget-object v0, v6, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mActionListener:Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;

    if-eqz v0, :cond_8

    iget-object v0, v6, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mActionListener:Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;

    invoke-interface {v0, v2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;->onClick(Lcom/android/camera/ui/zoom/ZoomRatioView;)V

    :cond_8
    goto :goto_4

    :cond_9
    const-string v0, "ZoomRatioToggleView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "moving ignored: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    :goto_4
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->announceCurrentZoomRatioForAccessibility()V

    const-string v0, "ZoomRatioToggleView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "move X: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private setSelectedChildIndex(IZ)V
    .locals 3

    invoke-direct {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->isLayoutRTL()Z

    move-result v0

    const/4 v1, -0x1

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    if-le p1, v0, :cond_0

    :goto_0
    move v1, v2

    goto :goto_1

    :cond_0
    goto :goto_1

    :cond_1
    iget v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    if-ge p1, v0, :cond_2

    goto :goto_0

    :cond_2
    :goto_1
    const/4 v0, 0x0

    invoke-direct {p0, p1, v1, v0, p2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->moveTo(IIIZ)V

    return-void
.end method

.method private startFadeInAnimation()V
    .locals 6

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    invoke-virtual {p0, v2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/android/camera/ui/zoom/ZoomRatioView;

    iget v4, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    const/4 v5, 0x2

    if-eq v2, v4, :cond_0

    invoke-virtual {v3}, Lcom/android/camera/ui/zoom/ZoomRatioView;->getIconView()Landroid/widget/ImageView;

    move-result-object v3

    sget-object v4, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v5, v5, [F

    fill-array-data v5, :array_0

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_0
    invoke-virtual {v3}, Lcom/android/camera/ui/zoom/ZoomRatioView;->getIconView()Landroid/widget/ImageView;

    move-result-object v3

    sget-object v4, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v5, v5, [F

    fill-array-data v5, :array_1

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mFadeInAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->removeAllListeners()V

    iget-object v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mFadeInAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mFadeInAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method private startLongPressCheck()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mLongPressRunnable:Ljava/lang/Runnable;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$2;

    invoke-direct {v0, p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$2;-><init>(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;)V

    iput-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mLongPressRunnable:Ljava/lang/Runnable;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mLongPressRunnable:Ljava/lang/Runnable;

    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private startScrollIfNeeded(Landroid/view/MotionEvent;)Z
    .locals 2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    iget v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mTouchStartX:I

    add-int/lit8 v1, v1, -0xa

    if-lt v0, v1, :cond_1

    iget v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mTouchStartX:I

    add-int/lit8 v1, v1, 0xa

    if-gt v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mTouchStartY:I

    add-int/lit8 v0, v0, -0xa

    if-lt p1, v0, :cond_1

    iget v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mTouchStartY:I

    add-int/lit8 v0, v0, 0xa

    if-le p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mLongPressRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->removeCallbacks(Ljava/lang/Runnable;)Z

    const/4 p1, 0x2

    iput p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mTouchState:I

    const/4 p1, 0x1

    return p1
.end method

.method private startTouch(Landroid/view/MotionEvent;)V
    .locals 1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mTouchStartX:I

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mTouchStartY:I

    invoke-direct {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->startLongPressCheck()V

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    const/4 p1, 0x1

    iput p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mTouchState:I

    return-void
.end method


# virtual methods
.method public isImmersive()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsImmersive:Z

    return v0
.end method

.method public isSuppressed()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsSuppressed:Z

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "ZoomRatioToggleView"

    const-string v0, "UI AUTOMATIC TEST: CLICKED"

    invoke-static {p1, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getWidth()I

    move-result p1

    div-int/lit8 p1, p1, 0x2

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    invoke-direct {p0, p1, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->clickChildAt(II)V

    :cond_0
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 13

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCircleSize:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    iget v2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCircleSize:I

    div-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    iget v3, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCircleSize:I

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v2, v3

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    iget v4, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCircleSize:I

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v3, v4

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v4

    iget v5, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mScaleX:F

    iget v6, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mScaleY:F

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getWidth()I

    move-result v7

    int-to-float v7, v7

    const/high16 v8, 0x40000000    # 2.0f

    div-float/2addr v7, v8

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getHeight()I

    move-result v9

    int-to-float v9, v9

    div-float/2addr v9, v8

    invoke-virtual {p1, v5, v6, v7, v9}, Landroid/graphics/Canvas;->scale(FFFF)V

    iget-object v5, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mPaint:Landroid/graphics/Paint;

    iget v6, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mColor:I

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v5, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mPaint:Landroid/graphics/Paint;

    sget-object v6, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    int-to-float v0, v0

    int-to-float v1, v1

    int-to-float v2, v2

    int-to-float v3, v3

    iget-object v12, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mPaint:Landroid/graphics/Paint;

    move-object v7, p1

    move v8, v0

    move v9, v1

    move v10, v2

    move v11, v3

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawOval(FFFFLandroid/graphics/Paint;)V

    iget-object v5, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mPaint:Landroid/graphics/Paint;

    iget v6, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mStrokeWidth:I

    int-to-float v6, v6

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v5, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mPaint:Landroid/graphics/Paint;

    iget v6, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mStrokeColor:I

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v5, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mPaint:Landroid/graphics/Paint;

    sget-object v6, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v12, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawOval(FFFFLandroid/graphics/Paint;)V

    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->restoreToCount(I)V

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method protected onFinishInflate()V
    .locals 9

    invoke-super {p0}, Landroid/view/ViewGroup;->onFinishInflate()V

    invoke-static {}, Lcom/android/camera/HybridZoomingSystem;->getSupportedOpticalZoomRatios()[F

    move-result-object v0

    array-length v0, v0

    if-gtz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const/4 v2, 0x0

    const v3, 0x7f04005d

    invoke-virtual {v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ui/zoom/ZoomRatioView;

    iput-object v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mOverlayView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    iget-object v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mOverlayView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    invoke-virtual {v1}, Lcom/android/camera/ui/zoom/ZoomRatioView;->getTextView()Landroid/widget/TextView;

    move-result-object v1

    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mOverlayView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    invoke-virtual {v1, v4}, Lcom/android/camera/ui/zoom/ZoomRatioView;->setIconify(Z)V

    iget v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildCount()I

    move-result v5

    if-eq v0, v5, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->removeAllViews()V

    move v5, v4

    :goto_0
    if-ge v5, v0, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v6

    invoke-virtual {v6, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/android/camera/ui/zoom/ZoomRatioView;

    invoke-virtual {v6}, Lcom/android/camera/ui/zoom/ZoomRatioView;->getIconView()Landroid/widget/ImageView;

    move-result-object v7

    invoke-virtual {v7, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    invoke-virtual {v6}, Lcom/android/camera/ui/zoom/ZoomRatioView;->getTextView()Landroid/widget/TextView;

    move-result-object v7

    invoke-virtual {v7, v4}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-static {v5}, Lcom/android/camera/HybridZoomingSystem;->getOpticalZoomRatioAt(I)F

    move-result v7

    invoke-virtual {v6, v7}, Lcom/android/camera/ui/zoom/ZoomRatioView;->setZoomRatio(F)V

    invoke-virtual {v6, v5}, Lcom/android/camera/ui/zoom/ZoomRatioView;->setZoomRatioIndex(I)V

    if-eq v5, v1, :cond_1

    const/4 v7, 0x1

    goto :goto_1

    :cond_1
    move v7, v4

    :goto_1
    invoke-virtual {v6, v7}, Lcom/android/camera/ui/zoom/ZoomRatioView;->setIconify(Z)V

    new-instance v7, Landroid/view/ViewGroup$LayoutParams;

    const/4 v8, -0x2

    invoke-direct {v7, v8, v8}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v6, v7}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    const/4 v2, 0x2

    if-eq v0, v2, :cond_0

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->endTouch(F)V

    return v1

    :cond_0
    const-string v0, "ZoomRatioToggleView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onInterceptTouchEvent() MOVE: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsImmersive:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->startScrollIfNeeded(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    :cond_1
    const-string v0, "ZoomRatioToggleView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onInterceptTouchEvent() DOWN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v3, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsImmersive:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsImmersive:Z

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsSuppressed:Z

    if-eqz v0, :cond_3

    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    float-to-int v2, v2

    invoke-direct {p0, v0, v2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getContainingChildIndex(II)I

    move-result v0

    iget v2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    if-eq v0, v2, :cond_3

    return v1

    :cond_3
    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mUiHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mInactiveTask:Ljava/lang/Runnable;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-direct {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->isAnimating()Z

    move-result v0

    if-eqz v0, :cond_4

    return v1

    :cond_4
    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_5

    return v1

    :cond_5
    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mActionListener:Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mActionListener:Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;

    invoke-interface {v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;->isInteractive()Z

    move-result v0

    if-nez v0, :cond_6

    return v1

    :cond_6
    invoke-direct {p0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->startTouch(Landroid/view/MotionEvent;)V

    return v1
.end method

.method protected onLayout(ZIIII)V
    .locals 4

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildCount()I

    move-result p1

    if-gtz p1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/android/camera/HybridZoomingSystem;->getDefaultOpticalZoomRatioIndex()I

    move-result p2

    invoke-direct {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->isLayoutRTL()Z

    move-result p3

    if-nez p3, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getWidth()I

    move-result p4

    div-int/lit8 p4, p4, 0x2

    iget p5, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mItemWidth:I

    div-int/lit8 p5, p5, 0x2

    sub-int/2addr p4, p5

    iget p5, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mItemWidth:I

    mul-int/2addr p2, p5

    sub-int/2addr p4, p2

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getWidth()I

    move-result p4

    div-int/lit8 p4, p4, 0x2

    iget p5, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mItemWidth:I

    div-int/lit8 p5, p5, 0x2

    sub-int/2addr p4, p5

    iget p5, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mItemWidth:I

    mul-int/2addr p2, p5

    add-int/2addr p4, p2

    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getHeight()I

    move-result p2

    div-int/lit8 p2, p2, 0x2

    iget p5, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mItemHeight:I

    div-int/lit8 p5, p5, 0x2

    sub-int/2addr p2, p5

    const/4 p5, 0x0

    move v0, p4

    move p4, p5

    :goto_1
    if-ge p4, p1, :cond_3

    invoke-virtual {p0, p4}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mItemWidth:I

    add-int/2addr v2, v0

    iget v3, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mItemHeight:I

    add-int/2addr v3, p2

    invoke-virtual {v1, v0, p2, v2, v3}, Landroid/view/View;->layout(IIII)V

    if-nez p3, :cond_2

    iget v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mItemWidth:I

    add-int/2addr v0, v1

    goto :goto_2

    :cond_2
    iget v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mItemWidth:I

    sub-int/2addr v0, v1

    :goto_2
    add-int/lit8 p4, p4, 0x1

    goto :goto_1

    :cond_3
    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getWidth()I

    move-result p1

    div-int/lit8 p1, p1, 0x2

    iget p2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mItemWidth:I

    div-int/lit8 p2, p2, 0x2

    sub-int/2addr p1, p2

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getHeight()I

    move-result p2

    div-int/lit8 p2, p2, 0x2

    iget p3, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mItemHeight:I

    div-int/lit8 p3, p3, 0x2

    sub-int/2addr p2, p3

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getWidth()I

    move-result p3

    div-int/lit8 p3, p3, 0x2

    iget p4, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mItemWidth:I

    div-int/lit8 p4, p4, 0x2

    add-int/2addr p3, p4

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getHeight()I

    move-result p4

    div-int/lit8 p4, p4, 0x2

    iget v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mItemHeight:I

    div-int/lit8 v0, v0, 0x2

    add-int/2addr p4, v0

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mOverlayView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    iget v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mItemWidth:I

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    iget v3, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mItemHeight:I

    invoke-static {v3, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    invoke-virtual {v0, v1, v3}, Lcom/android/camera/ui/zoom/ZoomRatioView;->measure(II)V

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mOverlayView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    invoke-virtual {v0}, Lcom/android/camera/ui/zoom/ZoomRatioView;->getTextView()Landroid/widget/TextView;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mItemWidth:I

    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    iget v3, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mItemHeight:I

    invoke-static {v3, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->measure(II)V

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mOverlayView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/android/camera/ui/zoom/ZoomRatioView;->layout(IIII)V

    iget-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mOverlayView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    invoke-virtual {p1}, Lcom/android/camera/ui/zoom/ZoomRatioView;->getTextView()Landroid/widget/TextView;

    move-result-object p1

    iget p2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mItemWidth:I

    iget p3, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mItemHeight:I

    invoke-virtual {p1, p5, p5, p2, p3}, Landroid/widget/TextView;->layout(IIII)V

    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "ZoomRatioToggleView"

    const-string v0, "UI AUTOMATIC TEST: LONGCLICKED"

    invoke-static {p1, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    iget p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    invoke-direct {p0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->longClickChild(I)V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method protected onMeasure(II)V
    .locals 9

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->measureChildren(II)V

    nop

    nop

    nop

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    move v4, v3

    move v5, v4

    :goto_0
    if-ge v2, v0, :cond_1

    invoke-virtual {p0, v2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v7

    const/16 v8, 0x8

    if-eq v7, v8, :cond_0

    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    add-int/2addr v4, v7

    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    add-int/lit8 v3, v3, 0x1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    if-nez v3, :cond_2

    move v0, v1

    goto :goto_1

    :cond_2
    div-int v0, v4, v3

    :goto_1
    iput v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mItemWidth:I

    iput v5, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mItemHeight:I

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getPaddingRight()I

    move-result v2

    add-int/2addr v0, v2

    add-int/2addr v4, v0

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getPaddingTop()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getPaddingBottom()I

    move-result v2

    add-int/2addr v0, v2

    add-int/2addr v5, v0

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getSuggestedMinimumHeight()I

    move-result v0

    invoke-static {v5, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getSuggestedMinimumWidth()I

    move-result v2

    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    nop

    invoke-static {v2, p1, v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->resolveSizeAndState(III)I

    move-result p1

    invoke-static {v0, p2, v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->resolveSizeAndState(III)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->setMeasuredDimension(II)V

    return-void
.end method

.method public onPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 4

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    const v1, 0x8000

    if-ne v0, v1, :cond_1

    :cond_0
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object p1

    const v0, 0x7f090100

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mZoomRatio:F

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-direct {p0, v0, v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    nop

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_0

    invoke-direct {p0, v3}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->endTouch(F)V

    goto/16 :goto_0

    :pswitch_0
    const-string v0, "ZoomRatioToggleView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onTouchEvent() MOVE: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v3, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsImmersive:Z

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsImmersive:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mLongClickAllowed:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mActionListener:Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mActionListener:Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;

    invoke-interface {v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;->isInteractive()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mActionListener:Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;

    invoke-interface {v0, p0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;->onTouch(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_1

    return v4

    :cond_1
    iget v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mTouchState:I

    if-ne v0, v4, :cond_2

    invoke-direct {p0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->startScrollIfNeeded(Landroid/view/MotionEvent;)Z

    :cond_2
    iget v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mTouchState:I

    if-ne v0, v2, :cond_b

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    goto/16 :goto_0

    :pswitch_1
    const-string v0, "ZoomRatioToggleView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onTouchEvent() UP: "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v5, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsImmersive:Z

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsImmersive:Z

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mLongClickAllowed:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mActionListener:Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mActionListener:Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;

    invoke-interface {v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;->isInteractive()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mActionListener:Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;

    invoke-interface {v0, p0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;->onTouch(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_3

    return v4

    :cond_3
    iget v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mTouchState:I

    if-ne v0, v4, :cond_4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    float-to-int v1, v1

    invoke-direct {p0, v0, v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->clickChildAt(II)V

    :cond_4
    nop

    iget v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mTouchState:I

    if-ne v0, v2, :cond_5

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    iget-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v0, 0x3e8

    invoke-virtual {p1, v0}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    iget-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {p1}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v3

    :cond_5
    invoke-direct {p0, v3}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->endTouch(F)V

    goto :goto_0

    :pswitch_2
    const-string v0, "ZoomRatioToggleView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onTouchEvent() DOWN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v3, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsImmersive:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsImmersive:Z

    if-nez v0, :cond_6

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsSuppressed:Z

    if-eqz v0, :cond_7

    :cond_6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    float-to-int v2, v2

    invoke-direct {p0, v0, v2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getContainingChildIndex(II)I

    move-result v0

    iget v2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    if-eq v0, v2, :cond_7

    return v1

    :cond_7
    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mUiHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mInactiveTask:Ljava/lang/Runnable;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-direct {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->isAnimating()Z

    move-result v0

    if-eqz v0, :cond_8

    return v1

    :cond_8
    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_9

    return v1

    :cond_9
    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mActionListener:Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mActionListener:Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;

    invoke-interface {v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;->isInteractive()Z

    move-result v0

    if-nez v0, :cond_a

    return v1

    :cond_a
    const-string v0, "ZoomRatioToggleView"

    const-string v1, "onTouchEvent() start inactive timer"

    invoke-static {v0, v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->startInactiveTimer()V

    invoke-direct {p0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->startTouch(Landroid/view/MotionEvent;)V

    nop

    :cond_b
    :goto_0
    return v4

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public setActionListener(Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mActionListener:Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;

    return-void
.end method

.method public setCaptureCount(I)V
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsImmersive:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsSuppressed:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/zoom/ZoomRatioView;

    if-eqz v0, :cond_2

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioView;->setCaptureCount(I)V

    goto :goto_1

    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getOverlayView()Lcom/android/camera/ui/zoom/ZoomRatioView;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioView;->setCaptureCount(I)V

    :cond_2
    :goto_1
    return-void
.end method

.method public setEnabled(Z)V
    .locals 3

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setEnabled(Z)V

    const-string v0, "ZoomRatioToggleView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setEnabled(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setImmersive(Z)V
    .locals 3

    const-string v0, "ZoomRatioToggleView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setImmersive(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsImmersive:Z

    if-ne p1, v0, :cond_0

    const-string v0, "ZoomRatioToggleView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setImmersive() ignored: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iput-boolean p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsImmersive:Z

    iget-boolean p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsImmersive:Z

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    invoke-direct {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getOverlayView()Lcom/android/camera/ui/zoom/ZoomRatioView;

    move-result-object p1

    iget v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mZoomRatio:F

    invoke-virtual {p1, v1}, Lcom/android/camera/ui/zoom/ZoomRatioView;->setZoomRatio(F)V

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildCount()I

    move-result p1

    :goto_0
    if-ge v0, p1, :cond_4

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ui/zoom/ZoomRatioView;

    if-eqz v1, :cond_1

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/zoom/ZoomRatioView;->setVisibility(I)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    iget-boolean p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsSuppressed:Z

    if-nez p1, :cond_4

    invoke-direct {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->ensureViewOverlayHasBeenRemoved()V

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildCount()I

    move-result p1

    move v1, v0

    :goto_1
    if-ge v1, p1, :cond_3

    invoke-virtual {p0, v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/android/camera/ui/zoom/ZoomRatioView;

    invoke-virtual {v2, v0}, Lcom/android/camera/ui/zoom/ZoomRatioView;->setVisibility(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_3
    iget p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mZoomRatio:F

    invoke-static {p1}, Lcom/android/camera/HybridZoomingSystem;->getOpticalZoomRatioIndex(F)I

    move-result p1

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->setSelectedChildIndex(IZ)V

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->isEnabled()Z

    move-result p1

    if-eqz p1, :cond_4

    const-string p1, "ZoomRatioToggleView"

    const-string v0, "setImmersive() start inactive timer"

    invoke-static {p1, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->startInactiveTimer()V

    :cond_4
    return-void
.end method

.method public setLongClickAllowed(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mLongClickAllowed:Z

    return-void
.end method

.method public setRotation(F)V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mOverlayView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mOverlayView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioView;->setRotation(F)V

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildCount()I

    move-result v1

    :goto_0
    if-ge v0, v1, :cond_2

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v2, p1}, Landroid/view/View;->setRotation(F)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public setScaleX(F)V
    .locals 1

    iput p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mScaleX:F

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mOverlayView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mOverlayViewHasBeenAdded:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mOverlayView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioView;->setScaleX(F)V

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->invalidate()V

    return-void
.end method

.method public setScaleY(F)V
    .locals 1

    iput p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mScaleY:F

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mOverlayView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mOverlayViewHasBeenAdded:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mOverlayView:Lcom/android/camera/ui/zoom/ZoomRatioView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioView;->setScaleY(F)V

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->invalidate()V

    return-void
.end method

.method public setSuppressed(Z)V
    .locals 5

    const-string v0, "ZoomRatioToggleView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setSuppressed(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsSuppressed:Z

    if-ne p1, v0, :cond_0

    return-void

    :cond_0
    iput-boolean p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsSuppressed:Z

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsImmersive:Z

    :cond_1
    iget-boolean p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsSuppressed:Z

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    invoke-direct {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getOverlayView()Lcom/android/camera/ui/zoom/ZoomRatioView;

    move-result-object p1

    iget v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mZoomRatio:F

    invoke-virtual {p1, v1}, Lcom/android/camera/ui/zoom/ZoomRatioView;->setZoomRatio(F)V

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildCount()I

    move-result p1

    :goto_0
    if-ge v0, p1, :cond_4

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ui/zoom/ZoomRatioView;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/zoom/ZoomRatioView;->setVisibility(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    iget-boolean p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsImmersive:Z

    if-nez p1, :cond_4

    invoke-direct {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->ensureViewOverlayHasBeenRemoved()V

    iget p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mZoomRatio:F

    invoke-static {p1}, Lcom/android/camera/HybridZoomingSystem;->getOpticalZoomRatioIndex(F)I

    move-result p1

    invoke-virtual {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildCount()I

    move-result v1

    move v2, v0

    :goto_1
    if-ge v2, v1, :cond_4

    invoke-virtual {p0, v2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/android/camera/ui/zoom/ZoomRatioView;

    if-ne v2, p1, :cond_3

    iget v4, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mZoomRatio:F

    invoke-virtual {v3, v4}, Lcom/android/camera/ui/zoom/ZoomRatioView;->setZoomRatio(F)V

    :cond_3
    invoke-virtual {v3, v0}, Lcom/android/camera/ui/zoom/ZoomRatioView;->setVisibility(I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_4
    return-void
.end method

.method public setSwipeAllowed(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mSwipeAllowed:Z

    return-void
.end method

.method public setVisibility(I)V
    .locals 3

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setVisibility(I)V

    const-string v0, "ZoomRatioToggleView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setVisibility(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/android/camera/Util;->viewVisibilityToString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setZoomRatio(FI)V
    .locals 4

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {p1}, Lcom/android/camera/HybridZoomingSystem;->getOpticalZoomRatioIndex(F)I

    move-result v0

    const-string v1, "ZoomRatioToggleView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setZoomRatio(): zooming action = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lcom/android/camera/ui/zoom/ZoomingAction;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "ZoomRatioToggleView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setZoomRatio():  current index = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mCurrentSelectedChildIndex:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "ZoomRatioToggleView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setZoomRatio():   current zoom = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mZoomRatio:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "ZoomRatioToggleView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setZoomRatio():   target index = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "ZoomRatioToggleView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setZoomRatio():    target zoom = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    iput p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mZoomRatio:F

    iget-boolean p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsSuppressed:Z

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getOverlayView()Lcom/android/camera/ui/zoom/ZoomRatioView;

    move-result-object p1

    iget p2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mZoomRatio:F

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/zoom/ZoomRatioView;->setZoomRatio(F)V

    invoke-direct {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->announceCurrentZoomRatioForAccessibility()V

    const-string p1, "ZoomRatioToggleView"

    const-string p2, "setZoomRatio(): mIsSuppressed"

    invoke-static {p1, p2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-boolean p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsImmersive:Z

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getOverlayView()Lcom/android/camera/ui/zoom/ZoomRatioView;

    move-result-object p1

    iget p2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mZoomRatio:F

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/zoom/ZoomRatioView;->setZoomRatio(F)V

    invoke-direct {p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->announceCurrentZoomRatioForAccessibility()V

    const-string p1, "ZoomRatioToggleView"

    const-string p2, "setZoomRatio(): mIsImmersive"

    invoke-static {p1, p2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    if-nez p2, :cond_2

    const-string p1, "ZoomRatioToggleView"

    const-string p2, "setZoomRatio(): ignored as source is toggle button"

    invoke-static {p1, p2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->debugUi(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    const/4 p1, -0x1

    if-ne p2, p1, :cond_3

    iget-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mUiHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mInactiveTask:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mUiHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIndexUpdater:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIndexUpdater:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unexpected zooming action: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lcom/android/camera/ui/zoom/ZoomingAction;->toString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "setZoomRatio() must be called on main ui thread."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public startInactiveTimer()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mUiHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mInactiveTask:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsImmersive:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mIsSuppressed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mFadeOutAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mUiHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->mInactiveTask:Ljava/lang/Runnable;

    const-wide/16 v2, 0x7d0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method
