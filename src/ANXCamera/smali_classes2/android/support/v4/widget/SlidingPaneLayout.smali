.class public Landroid/support/v4/widget/SlidingPaneLayout;
.super Landroid/view/ViewGroup;
.source "SlidingPaneLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/widget/SlidingPaneLayout$DisableLayerRunnable;,
        Landroid/support/v4/widget/SlidingPaneLayout$AccessibilityDelegate;,
        Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImplJBMR1;,
        Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImplJB;,
        Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImplBase;,
        Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImpl;,
        Landroid/support/v4/widget/SlidingPaneLayout$SavedState;,
        Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;,
        Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;,
        Landroid/support/v4/widget/SlidingPaneLayout$SimplePanelSlideListener;,
        Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;
    }
.end annotation


# static fields
.field private static final DEFAULT_FADE_COLOR:I = -0x33333334

.field private static final DEFAULT_OVERHANG_SIZE:I = 0x20

.field static final IMPL:Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImpl;

.field private static final MIN_FLING_VELOCITY:I = 0x190

.field private static final TAG:Ljava/lang/String; = "SlidingPaneLayout"


# instance fields
.field private mCanSlide:Z

.field private mCoveredFadeColor:I

.field private final mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

.field private mFirstLayout:Z

.field private mInitialMotionX:F

.field private mInitialMotionY:F

.field private mIsUnableToDrag:Z

.field private final mOverhangSize:I

.field private mPanelSlideListener:Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;

.field private mParallaxBy:I

.field private mParallaxOffset:F

.field private final mPostedRunnables:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/support/v4/widget/SlidingPaneLayout$DisableLayerRunnable;",
            ">;"
        }
    .end annotation
.end field

.field private mPreservedOpenState:Z

.field private mShadowDrawableLeft:Landroid/graphics/drawable/Drawable;

.field private mShadowDrawableRight:Landroid/graphics/drawable/Drawable;

.field private mSlideOffset:F

.field private mSlideRange:I

.field private mSlideableView:Landroid/view/View;

.field private mSliderFadeColor:I

.field private final mTmpRect:Landroid/graphics/Rect;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_e

    new-instance v1, Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImplJBMR1;

    invoke-direct {v1}, Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImplJBMR1;-><init>()V

    sput-object v1, Landroid/support/v4/widget/SlidingPaneLayout;->IMPL:Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImpl;

    goto :goto_21

    :cond_e
    const/16 v1, 0x10

    if-lt v0, v1, :cond_1a

    new-instance v1, Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImplJB;

    invoke-direct {v1}, Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImplJB;-><init>()V

    sput-object v1, Landroid/support/v4/widget/SlidingPaneLayout;->IMPL:Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImpl;

    goto :goto_21

    :cond_1a
    new-instance v1, Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImplBase;

    invoke-direct {v1}, Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImplBase;-><init>()V

    sput-object v1, Landroid/support/v4/widget/SlidingPaneLayout;->IMPL:Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImpl;

    :goto_21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v4/widget/SlidingPaneLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v4/widget/SlidingPaneLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 9

    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const v0, -0x33333334

    iput v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSliderFadeColor:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mFirstLayout:Z

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mTmpRect:Landroid/graphics/Rect;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPostedRunnables:Ljava/util/ArrayList;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v2, 0x42000000    # 32.0f

    mul-float/2addr v2, v1

    const/high16 v3, 0x3f000000    # 0.5f

    add-float/2addr v2, v3

    float-to-int v2, v2

    iput v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mOverhangSize:I

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v2

    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Landroid/support/v4/widget/SlidingPaneLayout;->setWillNotDraw(Z)V

    new-instance v4, Landroid/support/v4/widget/SlidingPaneLayout$AccessibilityDelegate;

    invoke-direct {v4, p0}, Landroid/support/v4/widget/SlidingPaneLayout$AccessibilityDelegate;-><init>(Landroid/support/v4/widget/SlidingPaneLayout;)V

    invoke-static {p0, v4}, Landroid/support/v4/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroid/support/v4/view/AccessibilityDelegateCompat;)V

    invoke-static {p0, v0}, Landroid/support/v4/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    new-instance v0, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;

    const/4 v4, 0x0

    invoke-direct {v0, p0, v4}, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;-><init>(Landroid/support/v4/widget/SlidingPaneLayout;Landroid/support/v4/widget/SlidingPaneLayout$1;)V

    invoke-static {p0, v3, v0}, Landroid/support/v4/widget/ViewDragHelper;->create(Landroid/view/ViewGroup;FLandroid/support/v4/widget/ViewDragHelper$Callback;)Landroid/support/v4/widget/ViewDragHelper;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    const/high16 v3, 0x43c80000    # 400.0f

    mul-float/2addr v3, v1

    invoke-virtual {v0, v3}, Landroid/support/v4/widget/ViewDragHelper;->setMinVelocity(F)V

    return-void
.end method

.method static synthetic access$100(Landroid/support/v4/widget/SlidingPaneLayout;)Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mIsUnableToDrag:Z

    return v0
.end method

.method static synthetic access$1000(Landroid/support/v4/widget/SlidingPaneLayout;Landroid/view/View;)V
    .registers 2

    invoke-direct {p0, p1}, Landroid/support/v4/widget/SlidingPaneLayout;->invalidateChildRegion(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$1100(Landroid/support/v4/widget/SlidingPaneLayout;)Ljava/util/ArrayList;
    .registers 2

    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPostedRunnables:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$200(Landroid/support/v4/widget/SlidingPaneLayout;)Landroid/support/v4/widget/ViewDragHelper;
    .registers 2

    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    return-object v0
.end method

.method static synthetic access$300(Landroid/support/v4/widget/SlidingPaneLayout;)F
    .registers 2

    iget v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    return v0
.end method

.method static synthetic access$400(Landroid/support/v4/widget/SlidingPaneLayout;)Landroid/view/View;
    .registers 2

    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$502(Landroid/support/v4/widget/SlidingPaneLayout;Z)Z
    .registers 2

    iput-boolean p1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPreservedOpenState:Z

    return p1
.end method

.method static synthetic access$600(Landroid/support/v4/widget/SlidingPaneLayout;I)V
    .registers 2

    invoke-direct {p0, p1}, Landroid/support/v4/widget/SlidingPaneLayout;->onPanelDragged(I)V

    return-void
.end method

.method static synthetic access$700(Landroid/support/v4/widget/SlidingPaneLayout;)Z
    .registers 2

    invoke-direct {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->isLayoutRtlSupport()Z

    move-result v0

    return v0
.end method

.method static synthetic access$800(Landroid/support/v4/widget/SlidingPaneLayout;)I
    .registers 2

    iget v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideRange:I

    return v0
.end method

.method private closePane(Landroid/view/View;I)Z
    .registers 5

    iget-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mFirstLayout:Z

    const/4 v1, 0x0

    if-nez v0, :cond_e

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p2}, Landroid/support/v4/widget/SlidingPaneLayout;->smoothSlideTo(FI)Z

    move-result v0

    if-eqz v0, :cond_d

    goto :goto_e

    :cond_d
    return v1

    :cond_e
    :goto_e
    iput-boolean v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPreservedOpenState:Z

    const/4 v0, 0x1

    return v0
.end method

.method private dimChildView(Landroid/view/View;FI)V
    .registers 11

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    const/4 v1, 0x0

    cmpl-float v1, p2, v1

    if-lez v1, :cond_43

    if-eqz p3, :cond_43

    const/high16 v1, -0x1000000

    and-int/2addr v1, p3

    ushr-int/lit8 v1, v1, 0x18

    int-to-float v2, v1

    mul-float/2addr v2, p2

    float-to-int v2, v2

    shl-int/lit8 v3, v2, 0x18

    const v4, 0xffffff

    and-int/2addr v4, p3

    or-int/2addr v3, v4

    iget-object v4, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimPaint:Landroid/graphics/Paint;

    if-nez v4, :cond_27

    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    iput-object v4, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimPaint:Landroid/graphics/Paint;

    :cond_27
    iget-object v4, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimPaint:Landroid/graphics/Paint;

    new-instance v5, Landroid/graphics/PorterDuffColorFilter;

    sget-object v6, Landroid/graphics/PorterDuff$Mode;->SRC_OVER:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v5, v3, v6}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->getLayerType(Landroid/view/View;)I

    move-result v4

    const/4 v5, 0x2

    if-eq v4, v5, :cond_3f

    iget-object v4, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimPaint:Landroid/graphics/Paint;

    invoke-static {p1, v5, v4}, Landroid/support/v4/view/ViewCompat;->setLayerType(Landroid/view/View;ILandroid/graphics/Paint;)V

    :cond_3f
    invoke-direct {p0, p1}, Landroid/support/v4/widget/SlidingPaneLayout;->invalidateChildRegion(Landroid/view/View;)V

    goto :goto_60

    :cond_43
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->getLayerType(Landroid/view/View;)I

    move-result v1

    if-eqz v1, :cond_60

    iget-object v1, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimPaint:Landroid/graphics/Paint;

    if-eqz v1, :cond_53

    iget-object v1, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimPaint:Landroid/graphics/Paint;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    :cond_53
    new-instance v1, Landroid/support/v4/widget/SlidingPaneLayout$DisableLayerRunnable;

    invoke-direct {v1, p0, p1}, Landroid/support/v4/widget/SlidingPaneLayout$DisableLayerRunnable;-><init>(Landroid/support/v4/widget/SlidingPaneLayout;Landroid/view/View;)V

    iget-object v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPostedRunnables:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {p0, v1}, Landroid/support/v4/view/ViewCompat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    :cond_60
    :goto_60
    return-void
.end method

.method private invalidateChildRegion(Landroid/view/View;)V
    .registers 3

    sget-object v0, Landroid/support/v4/widget/SlidingPaneLayout;->IMPL:Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImpl;

    invoke-interface {v0, p0, p1}, Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImpl;->invalidateChildRegion(Landroid/support/v4/widget/SlidingPaneLayout;Landroid/view/View;)V

    return-void
.end method

.method private isLayoutRtlSupport()Z
    .registers 3

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_8

    goto :goto_9

    :cond_8
    const/4 v1, 0x0

    :goto_9
    return v1
.end method

.method private onPanelDragged(I)V
    .registers 12

    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    if-nez v0, :cond_8

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    return-void

    :cond_8
    invoke-direct {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->isLayoutRtlSupport()Z

    move-result v0

    iget-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    iget-object v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    if-eqz v0, :cond_23

    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getWidth()I

    move-result v3

    sub-int/2addr v3, p1

    sub-int/2addr v3, v2

    goto :goto_24

    :cond_23
    move v3, p1

    :goto_24
    if-eqz v0, :cond_2b

    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingRight()I

    move-result v4

    goto :goto_2f

    :cond_2b
    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingLeft()I

    move-result v4

    :goto_2f
    if-eqz v0, :cond_34

    iget v5, v1, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->rightMargin:I

    goto :goto_36

    :cond_34
    iget v5, v1, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->leftMargin:I

    :goto_36
    add-int v6, v4, v5

    sub-int v7, v3, v6

    int-to-float v7, v7

    iget v8, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideRange:I

    int-to-float v8, v8

    div-float/2addr v7, v8

    iput v7, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    iget v7, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mParallaxBy:I

    if-eqz v7, :cond_4a

    iget v7, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    invoke-direct {p0, v7}, Landroid/support/v4/widget/SlidingPaneLayout;->parallaxOtherViews(F)V

    :cond_4a
    iget-boolean v7, v1, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimWhenOffset:Z

    if-eqz v7, :cond_57

    iget-object v7, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    iget v8, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    iget v9, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSliderFadeColor:I

    invoke-direct {p0, v7, v8, v9}, Landroid/support/v4/widget/SlidingPaneLayout;->dimChildView(Landroid/view/View;FI)V

    :cond_57
    iget-object v7, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    invoke-virtual {p0, v7}, Landroid/support/v4/widget/SlidingPaneLayout;->dispatchOnPanelSlide(Landroid/view/View;)V

    return-void
.end method

.method private openPane(Landroid/view/View;I)Z
    .registers 4

    iget-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mFirstLayout:Z

    if-nez v0, :cond_f

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0, p2}, Landroid/support/v4/widget/SlidingPaneLayout;->smoothSlideTo(FI)Z

    move-result v0

    if-eqz v0, :cond_d

    goto :goto_f

    :cond_d
    const/4 v0, 0x0

    return v0

    :cond_f
    :goto_f
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPreservedOpenState:Z

    return v0
.end method

.method private parallaxOtherViews(F)V
    .registers 13

    invoke-direct {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->isLayoutRtlSupport()Z

    move-result v0

    iget-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    iget-boolean v2, v1, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimWhenOffset:Z

    const/4 v3, 0x0

    if-eqz v2, :cond_1c

    if-eqz v0, :cond_16

    iget v2, v1, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->rightMargin:I

    goto :goto_18

    :cond_16
    iget v2, v1, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->leftMargin:I

    :goto_18
    if-gtz v2, :cond_1c

    const/4 v2, 0x1

    goto :goto_1d

    :cond_1c
    move v2, v3

    :goto_1d
    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildCount()I

    move-result v4

    nop

    :goto_22
    if-ge v3, v4, :cond_5f

    invoke-virtual {p0, v3}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    iget-object v6, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    if-ne v5, v6, :cond_2d

    goto :goto_5c

    :cond_2d
    iget v6, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mParallaxOffset:F

    const/high16 v7, 0x3f800000    # 1.0f

    sub-float v6, v7, v6

    iget v8, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mParallaxBy:I

    int-to-float v8, v8

    mul-float/2addr v6, v8

    float-to-int v6, v6

    iput p1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mParallaxOffset:F

    sub-float v8, v7, p1

    iget v9, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mParallaxBy:I

    int-to-float v9, v9

    mul-float/2addr v8, v9

    float-to-int v8, v8

    sub-int v9, v6, v8

    if-eqz v0, :cond_47

    neg-int v10, v9

    goto :goto_48

    :cond_47
    move v10, v9

    :goto_48
    invoke-virtual {v5, v10}, Landroid/view/View;->offsetLeftAndRight(I)V

    if-eqz v2, :cond_5c

    if-eqz v0, :cond_53

    iget v10, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mParallaxOffset:F

    sub-float/2addr v10, v7

    goto :goto_57

    :cond_53
    iget v10, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mParallaxOffset:F

    sub-float v10, v7, v10

    :goto_57
    iget v7, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCoveredFadeColor:I

    invoke-direct {p0, v5, v10, v7}, Landroid/support/v4/widget/SlidingPaneLayout;->dimChildView(Landroid/view/View;FI)V

    :cond_5c
    :goto_5c
    add-int/lit8 v3, v3, 0x1

    goto :goto_22

    :cond_5f
    return-void
.end method

.method private static viewIsOpaque(Landroid/view/View;)Z
    .registers 6

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->isOpaque(Landroid/view/View;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_8

    return v1

    :cond_8
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x12

    const/4 v3, 0x0

    if-lt v0, v2, :cond_10

    return v3

    :cond_10
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_20

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    move-result v2

    const/4 v4, -0x1

    if-ne v2, v4, :cond_1e

    goto :goto_1f

    :cond_1e
    move v1, v3

    :goto_1f
    return v1

    :cond_20
    return v3
.end method


# virtual methods
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

    invoke-virtual/range {v7 .. v12}, Landroid/support/v4/widget/SlidingPaneLayout;->canScroll(Landroid/view/View;ZIII)Z

    move-result v7

    if-eqz v7, :cond_59

    return v2

    :cond_59
    add-int/lit8 v6, v6, -0x1

    goto :goto_17

    :cond_5c
    if-eqz p2, :cond_72

    invoke-direct {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->isLayoutRtlSupport()Z

    move-result v3

    if-eqz v3, :cond_68

    move/from16 v3, p3

    move v4, v3

    goto :goto_6b

    :cond_68
    move/from16 v3, p3

    neg-int v4, v3

    :goto_6b
    invoke-static {v0, v4}, Landroid/support/v4/view/ViewCompat;->canScrollHorizontally(Landroid/view/View;I)Z

    move-result v4

    if-eqz v4, :cond_74

    goto :goto_75

    :cond_72
    move/from16 v3, p3

    :cond_74
    const/4 v2, 0x0

    :goto_75
    return v2
.end method

.method public canSlide()Z
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    return v0
.end method

.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 3

    instance-of v0, p1, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

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

.method public closePane()Z
    .registers 3

    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Landroid/support/v4/widget/SlidingPaneLayout;->closePane(Landroid/view/View;I)Z

    move-result v0

    return v0
.end method

.method public computeScroll()V
    .registers 3

    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/ViewDragHelper;->continueSettling(Z)Z

    move-result v0

    if-eqz v0, :cond_16

    iget-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    if-nez v0, :cond_13

    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v0}, Landroid/support/v4/widget/ViewDragHelper;->abort()V

    return-void

    :cond_13
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    :cond_16
    return-void
.end method

.method dispatchOnPanelClosed(Landroid/view/View;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPanelSlideListener:Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPanelSlideListener:Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;

    invoke-interface {v0, p1}, Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;->onPanelClosed(Landroid/view/View;)V

    :cond_9
    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/SlidingPaneLayout;->sendAccessibilityEvent(I)V

    return-void
.end method

.method dispatchOnPanelOpened(Landroid/view/View;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPanelSlideListener:Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPanelSlideListener:Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;

    invoke-interface {v0, p1}, Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;->onPanelOpened(Landroid/view/View;)V

    :cond_9
    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/SlidingPaneLayout;->sendAccessibilityEvent(I)V

    return-void
.end method

.method dispatchOnPanelSlide(Landroid/view/View;)V
    .registers 4

    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPanelSlideListener:Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPanelSlideListener:Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;

    iget v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    invoke-interface {v0, p1, v1}, Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;->onPanelSlide(Landroid/view/View;F)V

    :cond_b
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 10

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->draw(Landroid/graphics/Canvas;)V

    invoke-direct {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->isLayoutRtlSupport()Z

    move-result v0

    if-eqz v0, :cond_c

    iget-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mShadowDrawableRight:Landroid/graphics/drawable/Drawable;

    goto :goto_e

    :cond_c
    iget-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mShadowDrawableLeft:Landroid/graphics/drawable/Drawable;

    :goto_e
    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildCount()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_1a

    invoke-virtual {p0, v3}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    goto :goto_1b

    :cond_1a
    const/4 v2, 0x0

    :goto_1b
    if-eqz v2, :cond_46

    if-nez v1, :cond_20

    goto :goto_46

    :cond_20
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v3

    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    move-result v4

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v5

    invoke-direct {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->isLayoutRtlSupport()Z

    move-result v6

    if-eqz v6, :cond_39

    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    move-result v6

    add-int v7, v6, v5

    goto :goto_3f

    :cond_39
    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v7

    sub-int v6, v7, v5

    :goto_3f
    invoke-virtual {v1, v6, v3, v7, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void

    :cond_46
    :goto_46
    return-void
.end method

.method protected drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .registers 11

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    const/4 v1, 0x2

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->save(I)I

    move-result v1

    iget-boolean v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    if-eqz v2, :cond_4c

    iget-boolean v2, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->slideable:Z

    if-nez v2, :cond_4c

    iget-object v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    if-eqz v2, :cond_4c

    iget-object v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mTmpRect:Landroid/graphics/Rect;

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->getClipBounds(Landroid/graphics/Rect;)Z

    invoke-direct {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->isLayoutRtlSupport()Z

    move-result v2

    if-eqz v2, :cond_35

    iget-object v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mTmpRect:Landroid/graphics/Rect;

    iget-object v3, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mTmpRect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->left:I

    iget-object v4, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getRight()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    iput v3, v2, Landroid/graphics/Rect;->left:I

    goto :goto_47

    :cond_35
    iget-object v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mTmpRect:Landroid/graphics/Rect;

    iget-object v3, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mTmpRect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->right:I

    iget-object v4, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    iput v3, v2, Landroid/graphics/Rect;->right:I

    :goto_47
    iget-object v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mTmpRect:Landroid/graphics/Rect;

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    :cond_4c
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v2, v3, :cond_57

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result v2

    goto :goto_b2

    :cond_57
    iget-boolean v2, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimWhenOffset:Z

    if-eqz v2, :cond_a4

    iget v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-lez v2, :cond_a4

    invoke-virtual {p2}, Landroid/view/View;->isDrawingCacheEnabled()Z

    move-result v2

    if-nez v2, :cond_6c

    const/4 v2, 0x1

    invoke-virtual {p2, v2}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    :cond_6c
    invoke-virtual {p2}, Landroid/view/View;->getDrawingCache()Landroid/graphics/Bitmap;

    move-result-object v2

    if-eqz v2, :cond_83

    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v4

    int-to-float v4, v4

    iget-object v5, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    const/4 v3, 0x0

    goto :goto_a2

    :cond_83
    const-string v3, "SlidingPaneLayout"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "drawChild: child view "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, " returned null drawing cache"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result v3

    :goto_a2
    move v2, v3

    goto :goto_b2

    :cond_a4
    invoke-virtual {p2}, Landroid/view/View;->isDrawingCacheEnabled()Z

    move-result v2

    if-eqz v2, :cond_ae

    const/4 v2, 0x0

    invoke-virtual {p2, v2}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    :cond_ae
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result v2

    :goto_b2
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return v2
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    new-instance v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    invoke-direct {v0}, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;-><init>()V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 4

    new-instance v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 4

    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_d

    new-instance v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    move-object v1, p1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {v0, v1}, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    goto :goto_12

    :cond_d
    new-instance v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    invoke-direct {v0, p1}, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    :goto_12
    return-object v0
.end method

.method public getCoveredFadeColor()I
    .registers 2
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation

    iget v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCoveredFadeColor:I

    return v0
.end method

.method public getParallaxDistance()I
    .registers 2

    iget v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mParallaxBy:I

    return v0
.end method

.method public getSliderFadeColor()I
    .registers 2
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation

    iget v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSliderFadeColor:I

    return v0
.end method

.method isDimmed(Landroid/view/View;)Z
    .registers 6

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    iget-boolean v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    if-eqz v2, :cond_1b

    iget-boolean v2, v1, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimWhenOffset:Z

    if-eqz v2, :cond_1b

    iget v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-lez v2, :cond_1b

    const/4 v0, 0x1

    nop

    :cond_1b
    return v0
.end method

.method public isOpen()Z
    .registers 3

    iget-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    if-eqz v0, :cond_f

    iget v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-nez v0, :cond_d

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

.method public isSlideable()Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    return v0
.end method

.method protected onAttachedToWindow()V
    .registers 2

    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mFirstLayout:Z

    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 4

    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mFirstLayout:Z

    const/4 v0, 0x0

    iget-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPostedRunnables:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_d
    if-ge v0, v1, :cond_1d

    iget-object v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPostedRunnables:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/widget/SlidingPaneLayout$DisableLayerRunnable;

    invoke-virtual {v2}, Landroid/support/v4/widget/SlidingPaneLayout$DisableLayerRunnable;->run()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    :cond_1d
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPostedRunnables:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 12

    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getActionMasked(Landroid/view/MotionEvent;)I

    move-result v0

    iget-boolean v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    const/4 v2, 0x1

    if-nez v1, :cond_2a

    if-nez v0, :cond_2a

    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildCount()I

    move-result v1

    if-le v1, v2, :cond_2a

    invoke-virtual {p0, v2}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_2a

    iget-object v3, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    float-to-int v5, v5

    invoke-virtual {v3, v1, v4, v5}, Landroid/support/v4/widget/ViewDragHelper;->isViewUnder(Landroid/view/View;II)Z

    move-result v3

    xor-int/2addr v3, v2

    iput-boolean v3, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPreservedOpenState:Z

    :cond_2a
    iget-boolean v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    if-eqz v1, :cond_aa

    iget-boolean v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mIsUnableToDrag:Z

    if-eqz v1, :cond_36

    if-eqz v0, :cond_36

    goto/16 :goto_aa

    :cond_36
    const/4 v1, 0x3

    const/4 v3, 0x0

    if-eq v0, v1, :cond_a4

    if-ne v0, v2, :cond_3d

    goto :goto_a4

    :cond_3d
    const/4 v1, 0x0

    if-eqz v0, :cond_73

    const/4 v4, 0x2

    if-eq v0, v4, :cond_44

    goto :goto_96

    :cond_44
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    iget v6, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mInitialMotionX:F

    sub-float v6, v4, v6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    iget v7, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mInitialMotionY:F

    sub-float v7, v5, v7

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    iget-object v8, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v8}, Landroid/support/v4/widget/ViewDragHelper;->getTouchSlop()I

    move-result v8

    int-to-float v9, v8

    cmpl-float v9, v6, v9

    if-lez v9, :cond_96

    cmpl-float v9, v7, v6

    if-lez v9, :cond_96

    iget-object v9, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v9}, Landroid/support/v4/widget/ViewDragHelper;->cancel()V

    iput-boolean v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mIsUnableToDrag:Z

    return v3

    :cond_73
    iput-boolean v3, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mIsUnableToDrag:Z

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    iput v4, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mInitialMotionX:F

    iput v5, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mInitialMotionY:F

    iget-object v6, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    iget-object v7, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    float-to-int v8, v4

    float-to-int v9, v5

    invoke-virtual {v6, v7, v8, v9}, Landroid/support/v4/widget/ViewDragHelper;->isViewUnder(Landroid/view/View;II)Z

    move-result v6

    if-eqz v6, :cond_96

    iget-object v6, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    invoke-virtual {p0, v6}, Landroid/support/v4/widget/SlidingPaneLayout;->isDimmed(Landroid/view/View;)Z

    move-result v6

    if-eqz v6, :cond_96

    const/4 v1, 0x1

    :cond_96
    :goto_96
    iget-object v4, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v4, p1}, Landroid/support/v4/widget/ViewDragHelper;->shouldInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v4

    if-nez v4, :cond_a3

    if-eqz v1, :cond_a1

    goto :goto_a3

    :cond_a1
    move v2, v3

    nop

    :cond_a3
    :goto_a3
    return v2

    :cond_a4
    :goto_a4
    iget-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v1}, Landroid/support/v4/widget/ViewDragHelper;->cancel()V

    return v3

    :cond_aa
    :goto_aa
    iget-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v1}, Landroid/support/v4/widget/ViewDragHelper;->cancel()V

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    return v1
.end method

.method protected onLayout(ZIIII)V
    .registers 30

    move-object/from16 v0, p0

    invoke-direct/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->isLayoutRtlSupport()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_10

    iget-object v3, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Landroid/support/v4/widget/ViewDragHelper;->setEdgeTrackingEnabled(I)V

    goto :goto_15

    :cond_10
    iget-object v3, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v3, v2}, Landroid/support/v4/widget/ViewDragHelper;->setEdgeTrackingEnabled(I)V

    :goto_15
    sub-int v5, p4, p2

    if-eqz v1, :cond_1e

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingRight()I

    move-result v6

    goto :goto_22

    :cond_1e
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingLeft()I

    move-result v6

    :goto_22
    if-eqz v1, :cond_29

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingLeft()I

    move-result v7

    goto :goto_2d

    :cond_29
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingRight()I

    move-result v7

    :goto_2d
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingTop()I

    move-result v8

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildCount()I

    move-result v9

    move v10, v6

    move v11, v10

    iget-boolean v12, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mFirstLayout:Z

    if-eqz v12, :cond_49

    iget-boolean v12, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    if-eqz v12, :cond_46

    iget-boolean v12, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mPreservedOpenState:Z

    if-eqz v12, :cond_46

    const/high16 v12, 0x3f800000    # 1.0f

    goto :goto_47

    :cond_46
    const/4 v12, 0x0

    :goto_47
    iput v12, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    :cond_49
    move v15, v10

    const/4 v10, 0x0

    :goto_4b
    if-ge v10, v9, :cond_f1

    invoke-virtual {v0, v10}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v12

    const/16 v13, 0x8

    if-ne v12, v13, :cond_5e

    nop

    move/from16 v20, v6

    goto/16 :goto_ea

    :cond_5e
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    check-cast v12, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v13

    const/16 v16, 0x0

    iget-boolean v14, v12, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->slideable:Z

    if-eqz v14, :cond_b1

    iget v14, v12, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->leftMargin:I

    iget v3, v12, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->rightMargin:I

    add-int/2addr v14, v3

    sub-int v3, v5, v7

    iget v4, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mOverhangSize:I

    sub-int/2addr v3, v4

    invoke-static {v11, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    sub-int/2addr v3, v15

    sub-int/2addr v3, v14

    iput v3, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideRange:I

    if-eqz v1, :cond_85

    iget v4, v12, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->rightMargin:I

    goto :goto_87

    :cond_85
    iget v4, v12, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->leftMargin:I

    :goto_87
    add-int v18, v15, v4

    add-int v18, v18, v3

    div-int/lit8 v19, v13, 0x2

    move/from16 v20, v6

    add-int v6, v18, v19

    move/from16 v21, v14

    sub-int v14, v5, v7

    if-le v6, v14, :cond_99

    const/4 v6, 0x1

    goto :goto_9a

    :cond_99
    const/4 v6, 0x0

    :goto_9a
    iput-boolean v6, v12, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimWhenOffset:Z

    int-to-float v6, v3

    iget v14, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    mul-float/2addr v6, v14

    float-to-int v6, v6

    add-int v14, v6, v4

    add-int/2addr v15, v14

    int-to-float v14, v6

    move/from16 v22, v3

    iget v3, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideRange:I

    int-to-float v3, v3

    div-float/2addr v14, v3

    iput v14, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    nop

    const/high16 v4, 0x3f800000    # 1.0f

    goto :goto_cd

    :cond_b1
    move/from16 v20, v6

    iget-boolean v3, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    if-eqz v3, :cond_ca

    iget v3, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mParallaxBy:I

    if-eqz v3, :cond_ca

    iget v3, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    const/high16 v4, 0x3f800000    # 1.0f

    sub-float v14, v4, v3

    iget v3, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mParallaxBy:I

    int-to-float v3, v3

    mul-float/2addr v14, v3

    float-to-int v3, v14

    move v15, v11

    move/from16 v16, v3

    goto :goto_cd

    :cond_ca
    const/high16 v4, 0x3f800000    # 1.0f

    move v15, v11

    :goto_cd
    if-eqz v1, :cond_d6

    sub-int v3, v5, v15

    add-int v3, v3, v16

    sub-int v6, v3, v13

    goto :goto_da

    :cond_d6
    sub-int v6, v15, v16

    add-int v3, v6, v13

    :goto_da
    move v14, v8

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v17

    add-int v4, v14, v17

    invoke-virtual {v2, v6, v8, v3, v4}, Landroid/view/View;->layout(IIII)V

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v17

    add-int v11, v11, v17

    :goto_ea
    add-int/lit8 v10, v10, 0x1

    move/from16 v6, v20

    const/4 v2, 0x1

    goto/16 :goto_4b

    :cond_f1
    move/from16 v20, v6

    iget-boolean v2, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mFirstLayout:Z

    if-eqz v2, :cond_12f

    iget-boolean v2, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    if-eqz v2, :cond_11a

    iget v2, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mParallaxBy:I

    if-eqz v2, :cond_104

    iget v2, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    invoke-direct {v0, v2}, Landroid/support/v4/widget/SlidingPaneLayout;->parallaxOtherViews(F)V

    :cond_104
    iget-object v2, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    iget-boolean v2, v2, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimWhenOffset:Z

    if-eqz v2, :cond_12a

    iget-object v2, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    iget v3, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    iget v4, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSliderFadeColor:I

    invoke-direct {v0, v2, v3, v4}, Landroid/support/v4/widget/SlidingPaneLayout;->dimChildView(Landroid/view/View;FI)V

    goto :goto_12a

    :cond_11a
    const/4 v2, 0x0

    :goto_11b
    if-ge v2, v9, :cond_12a

    invoke-virtual {v0, v2}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    iget v4, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSliderFadeColor:I

    const/4 v6, 0x0

    invoke-direct {v0, v3, v6, v4}, Landroid/support/v4/widget/SlidingPaneLayout;->dimChildView(Landroid/view/View;FI)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_11b

    :cond_12a
    :goto_12a
    iget-object v2, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/support/v4/widget/SlidingPaneLayout;->updateObscuredViewsVisibility(Landroid/view/View;)V

    :cond_12f
    const/4 v2, 0x0

    iput-boolean v2, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mFirstLayout:Z

    return-void
.end method

.method protected onMeasure(II)V
    .registers 35

    move-object/from16 v0, p0

    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v3

    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v4

    const/high16 v5, -0x80000000

    const/high16 v6, 0x40000000    # 2.0f

    if-eq v1, v6, :cond_32

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->isInEditMode()Z

    move-result v7

    if-eqz v7, :cond_2a

    if-ne v1, v5, :cond_23

    const/high16 v1, 0x40000000    # 2.0f

    goto :goto_49

    :cond_23
    if-nez v1, :cond_49

    const/high16 v1, 0x40000000    # 2.0f

    const/16 v2, 0x12c

    goto :goto_49

    :cond_2a
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "Width must have an exact value or MATCH_PARENT"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_32
    if-nez v3, :cond_49

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->isInEditMode()Z

    move-result v7

    if-eqz v7, :cond_41

    if-nez v3, :cond_49

    const/high16 v3, -0x80000000

    const/16 v4, 0x12c

    goto :goto_49

    :cond_41
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "Height must not be UNSPECIFIED"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_49
    :goto_49
    const/4 v7, 0x0

    const/4 v8, -0x1

    if-eq v3, v5, :cond_5e

    if-eq v3, v6, :cond_50

    goto :goto_6a

    :cond_50
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingTop()I

    move-result v9

    sub-int v9, v4, v9

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingBottom()I

    move-result v10

    sub-int/2addr v9, v10

    move v8, v9

    move v7, v9

    goto :goto_6a

    :cond_5e
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingTop()I

    move-result v9

    sub-int v9, v4, v9

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingBottom()I

    move-result v10

    sub-int v8, v9, v10

    :goto_6a
    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingLeft()I

    move-result v11

    sub-int v11, v2, v11

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingRight()I

    move-result v12

    sub-int/2addr v11, v12

    move v12, v11

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildCount()I

    move-result v13

    const/4 v14, 0x2

    if-le v13, v14, :cond_86

    const-string v14, "SlidingPaneLayout"

    const-string v15, "onMeasure: More than two child views are not supported."

    invoke-static {v14, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_86
    const/4 v14, 0x0

    iput-object v14, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    move v15, v12

    move v12, v7

    const/4 v7, 0x0

    :goto_8c
    const/16 v6, 0x8

    const/16 v17, 0x1

    const/16 v18, 0x0

    if-ge v7, v13, :cond_142

    invoke-virtual {v0, v7}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v19

    move-object/from16 v14, v19

    check-cast v14, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    move/from16 v20, v1

    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-ne v1, v6, :cond_b0

    const/4 v1, 0x0

    iput-boolean v1, v14, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimWhenOffset:Z

    nop

    :goto_ac
    move/from16 v21, v4

    goto/16 :goto_136

    :cond_b0
    iget v1, v14, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->weight:F

    cmpl-float v1, v1, v18

    if-lez v1, :cond_be

    iget v1, v14, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->weight:F

    add-float/2addr v9, v1

    iget v1, v14, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->width:I

    if-nez v1, :cond_be

    goto :goto_ac

    :cond_be
    iget v1, v14, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->leftMargin:I

    iget v6, v14, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->rightMargin:I

    add-int/2addr v1, v6

    iget v6, v14, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->width:I

    move/from16 v21, v4

    const/4 v4, -0x2

    if-ne v6, v4, :cond_d3

    sub-int v4, v11, v1

    const/high16 v6, -0x80000000

    invoke-static {v4, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    :goto_d2
    goto :goto_e9

    :cond_d3
    iget v4, v14, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->width:I

    const/4 v6, -0x1

    if-ne v4, v6, :cond_e1

    sub-int v4, v11, v1

    const/high16 v6, 0x40000000    # 2.0f

    invoke-static {v4, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    goto :goto_d2

    :cond_e1
    const/high16 v6, 0x40000000    # 2.0f

    iget v4, v14, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->width:I

    invoke-static {v4, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    :goto_e9
    iget v6, v14, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->height:I

    move/from16 v22, v1

    const/4 v1, -0x2

    if-ne v6, v1, :cond_f7

    const/high16 v1, -0x80000000

    invoke-static {v8, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    :goto_f6
    goto :goto_10b

    :cond_f7
    iget v1, v14, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->height:I

    const/4 v6, -0x1

    if-ne v1, v6, :cond_103

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v8, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    goto :goto_f6

    :cond_103
    const/high16 v1, 0x40000000    # 2.0f

    iget v6, v14, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->height:I

    invoke-static {v6, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    :goto_10b
    move v1, v6

    invoke-virtual {v5, v4, v1}, Landroid/view/View;->measure(II)V

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v6

    move/from16 v23, v1

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    move/from16 v24, v4

    const/high16 v4, -0x80000000

    if-ne v3, v4, :cond_125

    if-le v1, v12, :cond_125

    invoke-static {v1, v8}, Ljava/lang/Math;->min(II)I

    move-result v12

    :cond_125
    sub-int/2addr v15, v6

    if-gez v15, :cond_12b

    move/from16 v4, v17

    goto :goto_12c

    :cond_12b
    const/4 v4, 0x0

    :goto_12c
    iput-boolean v4, v14, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->slideable:Z

    or-int/2addr v4, v10

    iget-boolean v10, v14, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->slideable:Z

    if-eqz v10, :cond_135

    iput-object v5, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    :cond_135
    move v10, v4

    :goto_136
    add-int/lit8 v7, v7, 0x1

    move/from16 v1, v20

    move/from16 v4, v21

    const/high16 v5, -0x80000000

    const/high16 v6, 0x40000000    # 2.0f

    goto/16 :goto_8c

    :cond_142
    move/from16 v20, v1

    move/from16 v21, v4

    if-nez v10, :cond_155

    cmpl-float v1, v9, v18

    if-lez v1, :cond_14d

    goto :goto_155

    :cond_14d
    move/from16 v26, v3

    move/from16 v30, v8

    move/from16 v27, v13

    goto/16 :goto_296

    :cond_155
    :goto_155
    iget v1, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mOverhangSize:I

    sub-int v1, v11, v1

    const/4 v4, 0x0

    :goto_15a
    if-ge v4, v13, :cond_290

    invoke-virtual {v0, v4}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v7

    if-ne v7, v6, :cond_173

    nop

    :goto_167
    move/from16 v29, v1

    move/from16 v26, v3

    :goto_16b
    move/from16 v30, v8

    move/from16 v27, v13

    :goto_16f
    const/high16 v1, 0x40000000    # 2.0f

    goto/16 :goto_282

    :cond_173
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v14

    if-ne v14, v6, :cond_180

    goto :goto_167

    :cond_180
    iget v14, v7, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->width:I

    if-nez v14, :cond_18d

    iget v14, v7, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->weight:F

    cmpl-float v14, v14, v18

    if-lez v14, :cond_18d

    move/from16 v14, v17

    goto :goto_18e

    :cond_18d
    const/4 v14, 0x0

    :goto_18e
    if-eqz v14, :cond_193

    const/16 v19, 0x0

    goto :goto_197

    :cond_193
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v19

    :goto_197
    move/from16 v25, v19

    if-eqz v10, :cond_204

    iget-object v6, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    if-eq v5, v6, :cond_204

    iget v6, v7, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->width:I

    if-gez v6, :cond_1f8

    move/from16 v6, v25

    if-gt v6, v1, :cond_1b3

    move/from16 v26, v3

    iget v3, v7, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->weight:F

    cmpl-float v3, v3, v18

    if-lez v3, :cond_1b0

    goto :goto_1b5

    :cond_1b0
    move/from16 v29, v1

    goto :goto_16b

    :cond_1b3
    move/from16 v26, v3

    :goto_1b5
    if-eqz v14, :cond_1dc

    iget v3, v7, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->height:I

    move/from16 v27, v13

    const/4 v13, -0x2

    if-ne v3, v13, :cond_1c7

    const/high16 v3, -0x80000000

    invoke-static {v8, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v13

    const/high16 v3, 0x40000000    # 2.0f

    goto :goto_1e8

    :cond_1c7
    iget v3, v7, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->height:I

    const/4 v13, -0x1

    if-ne v3, v13, :cond_1d3

    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v8, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v13

    :goto_1d2
    goto :goto_1e8

    :cond_1d3
    const/high16 v3, 0x40000000    # 2.0f

    iget v13, v7, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->height:I

    invoke-static {v13, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v13

    goto :goto_1d2

    :cond_1dc
    move/from16 v27, v13

    const/high16 v3, 0x40000000    # 2.0f

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v13

    invoke-static {v13, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v13

    :goto_1e8
    move/from16 v28, v14

    invoke-static {v1, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v14

    invoke-virtual {v5, v14, v13}, Landroid/view/View;->measure(II)V

    nop

    move/from16 v29, v1

    move/from16 v30, v8

    goto/16 :goto_16f

    :cond_1f8
    move/from16 v26, v3

    move/from16 v27, v13

    move/from16 v29, v1

    move/from16 v30, v8

    const/high16 v1, 0x40000000    # 2.0f

    goto/16 :goto_282

    :cond_204
    move/from16 v26, v3

    move/from16 v27, v13

    move/from16 v28, v14

    move/from16 v6, v25

    iget v3, v7, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->weight:F

    cmpl-float v3, v3, v18

    if-lez v3, :cond_27c

    iget v3, v7, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->width:I

    if-nez v3, :cond_23c

    iget v3, v7, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->height:I

    const/4 v13, -0x2

    if-ne v3, v13, :cond_223

    const/high16 v3, -0x80000000

    invoke-static {v8, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v14

    move v3, v14

    goto :goto_247

    :cond_223
    const/high16 v3, -0x80000000

    iget v14, v7, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->height:I

    const/4 v3, -0x1

    if-ne v14, v3, :cond_233

    const/high16 v14, 0x40000000    # 2.0f

    invoke-static {v8, v14}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v16

    move/from16 v3, v16

    goto :goto_247

    :cond_233
    const/high16 v14, 0x40000000    # 2.0f

    iget v3, v7, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->height:I

    invoke-static {v3, v14}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    goto :goto_247

    :cond_23c
    const/4 v13, -0x2

    const/high16 v14, 0x40000000    # 2.0f

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    invoke-static {v3, v14}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    :goto_247
    if-eqz v10, :cond_261

    iget v14, v7, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->leftMargin:I

    iget v13, v7, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->rightMargin:I

    add-int/2addr v14, v13

    sub-int v13, v11, v14

    move/from16 v29, v1

    move/from16 v30, v8

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v13, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    if-eq v6, v13, :cond_25f

    invoke-virtual {v5, v8, v3}, Landroid/view/View;->measure(II)V

    :cond_25f
    goto/16 :goto_16f

    :cond_261
    move/from16 v29, v1

    move/from16 v30, v8

    const/4 v1, 0x0

    invoke-static {v1, v15}, Ljava/lang/Math;->max(II)I

    move-result v8

    iget v13, v7, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->weight:F

    int-to-float v14, v8

    mul-float/2addr v13, v14

    div-float/2addr v13, v9

    float-to-int v13, v13

    add-int v14, v6, v13

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v14, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v14

    invoke-virtual {v5, v14, v3}, Landroid/view/View;->measure(II)V

    goto :goto_282

    :cond_27c
    move/from16 v29, v1

    move/from16 v30, v8

    const/high16 v1, 0x40000000    # 2.0f

    :goto_282
    add-int/lit8 v4, v4, 0x1

    move/from16 v3, v26

    move/from16 v13, v27

    move/from16 v1, v29

    move/from16 v8, v30

    const/16 v6, 0x8

    goto/16 :goto_15a

    :cond_290
    move/from16 v26, v3

    move/from16 v30, v8

    move/from16 v27, v13

    :goto_296
    move v1, v2

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingTop()I

    move-result v3

    add-int/2addr v3, v12

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingBottom()I

    move-result v4

    add-int/2addr v3, v4

    invoke-virtual {v0, v1, v3}, Landroid/support/v4/widget/SlidingPaneLayout;->setMeasuredDimension(II)V

    iput-boolean v10, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    iget-object v4, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v4}, Landroid/support/v4/widget/ViewDragHelper;->getViewDragState()I

    move-result v4

    if-eqz v4, :cond_2b5

    if-nez v10, :cond_2b5

    iget-object v4, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v4}, Landroid/support/v4/widget/ViewDragHelper;->abort()V

    :cond_2b5
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 4

    move-object v0, p1

    check-cast v0, Landroid/support/v4/widget/SlidingPaneLayout$SavedState;

    invoke-virtual {v0}, Landroid/support/v4/widget/SlidingPaneLayout$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    iget-boolean v1, v0, Landroid/support/v4/widget/SlidingPaneLayout$SavedState;->isOpen:Z

    if-eqz v1, :cond_12

    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->openPane()Z

    goto :goto_15

    :cond_12
    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->closePane()Z

    :goto_15
    iget-boolean v1, v0, Landroid/support/v4/widget/SlidingPaneLayout$SavedState;->isOpen:Z

    iput-boolean v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPreservedOpenState:Z

    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    invoke-super {p0}, Landroid/view/ViewGroup;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    new-instance v1, Landroid/support/v4/widget/SlidingPaneLayout$SavedState;

    invoke-direct {v1, v0}, Landroid/support/v4/widget/SlidingPaneLayout$SavedState;-><init>(Landroid/os/Parcelable;)V

    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->isSlideable()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->isOpen()Z

    move-result v2

    goto :goto_16

    :cond_14
    iget-boolean v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPreservedOpenState:Z

    :goto_16
    iput-boolean v2, v1, Landroid/support/v4/widget/SlidingPaneLayout$SavedState;->isOpen:Z

    return-object v1
.end method

.method protected onSizeChanged(IIII)V
    .registers 6

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->onSizeChanged(IIII)V

    if-eq p1, p3, :cond_8

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mFirstLayout:Z

    :cond_8
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 13

    iget-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    if-nez v0, :cond_9

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    :cond_9
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v0, p1}, Landroid/support/v4/widget/ViewDragHelper;->processTouchEvent(Landroid/view/MotionEvent;)V

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    and-int/lit16 v2, v0, 0xff

    packed-switch v2, :pswitch_data_64

    goto :goto_63

    :pswitch_19
    iget-object v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    invoke-virtual {p0, v2}, Landroid/support/v4/widget/SlidingPaneLayout;->isDimmed(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_63

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    iget v4, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mInitialMotionX:F

    sub-float v4, v2, v4

    iget v5, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mInitialMotionY:F

    sub-float v5, v3, v5

    iget-object v6, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v6}, Landroid/support/v4/widget/ViewDragHelper;->getTouchSlop()I

    move-result v6

    mul-float v7, v4, v4

    mul-float v8, v5, v5

    add-float/2addr v7, v8

    mul-int v8, v6, v6

    int-to-float v8, v8

    cmpg-float v7, v7, v8

    if-gez v7, :cond_63

    iget-object v7, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    iget-object v8, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    float-to-int v9, v2

    float-to-int v10, v3

    invoke-virtual {v7, v8, v9, v10}, Landroid/support/v4/widget/ViewDragHelper;->isViewUnder(Landroid/view/View;II)Z

    move-result v7

    if-eqz v7, :cond_63

    iget-object v7, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    const/4 v8, 0x0

    invoke-direct {p0, v7, v8}, Landroid/support/v4/widget/SlidingPaneLayout;->closePane(Landroid/view/View;I)Z

    goto :goto_63

    :pswitch_56
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    iput v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mInitialMotionX:F

    iput v3, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mInitialMotionY:F

    nop

    :cond_63
    :goto_63
    return v1

    :pswitch_data_64
    .packed-switch 0x0
        :pswitch_56
        :pswitch_19
    .end packed-switch
.end method

.method public openPane()Z
    .registers 3

    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Landroid/support/v4/widget/SlidingPaneLayout;->openPane(Landroid/view/View;I)Z

    move-result v0

    return v0
.end method

.method public requestChildFocus(Landroid/view/View;Landroid/view/View;)V
    .registers 4

    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->requestChildFocus(Landroid/view/View;Landroid/view/View;)V

    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->isInTouchMode()Z

    move-result v0

    if-nez v0, :cond_16

    iget-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    if-nez v0, :cond_16

    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    if-ne p1, v0, :cond_13

    const/4 v0, 0x1

    goto :goto_14

    :cond_13
    const/4 v0, 0x0

    :goto_14
    iput-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPreservedOpenState:Z

    :cond_16
    return-void
.end method

.method setAllChildrenVisible()V
    .registers 6

    const/4 v0, 0x0

    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildCount()I

    move-result v1

    :goto_5
    if-ge v0, v1, :cond_19

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    const/4 v4, 0x4

    if-ne v3, v4, :cond_16

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_19
    return-void
.end method

.method public setCoveredFadeColor(I)V
    .registers 2
    .param p1    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    iput p1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCoveredFadeColor:I

    return-void
.end method

.method public setPanelSlideListener(Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPanelSlideListener:Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;

    return-void
.end method

.method public setParallaxDistance(I)V
    .registers 2

    iput p1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mParallaxBy:I

    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->requestLayout()V

    return-void
.end method

.method public setShadowDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0, p1}, Landroid/support/v4/widget/SlidingPaneLayout;->setShadowDrawableLeft(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setShadowDrawableLeft(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mShadowDrawableLeft:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method public setShadowDrawableRight(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mShadowDrawableRight:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method public setShadowResource(I)V
    .registers 3
    .param p1    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/SlidingPaneLayout;->setShadowDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setShadowResourceLeft(I)V
    .registers 3

    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/SlidingPaneLayout;->setShadowDrawableLeft(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setShadowResourceRight(I)V
    .registers 3

    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/SlidingPaneLayout;->setShadowDrawableRight(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setSliderFadeColor(I)V
    .registers 2
    .param p1    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    iput p1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSliderFadeColor:I

    return-void
.end method

.method public smoothSlideClosed()V
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->closePane()Z

    return-void
.end method

.method public smoothSlideOpen()V
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->openPane()Z

    return-void
.end method

.method smoothSlideTo(FI)Z
    .registers 11

    iget-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    invoke-direct {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->isLayoutRtlSupport()Z

    move-result v0

    iget-object v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    if-eqz v0, :cond_31

    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingRight()I

    move-result v3

    iget v4, v2, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->rightMargin:I

    add-int/2addr v3, v4

    iget-object v4, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v4

    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getWidth()I

    move-result v5

    int-to-float v5, v5

    int-to-float v6, v3

    iget v7, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideRange:I

    int-to-float v7, v7

    mul-float/2addr v7, p1

    add-float/2addr v6, v7

    int-to-float v7, v4

    add-float/2addr v6, v7

    sub-float/2addr v5, v6

    float-to-int v3, v5

    goto :goto_3f

    :cond_31
    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingLeft()I

    move-result v3

    iget v4, v2, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->leftMargin:I

    add-int/2addr v3, v4

    int-to-float v4, v3

    iget v5, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideRange:I

    int-to-float v5, v5

    mul-float/2addr v5, p1

    add-float/2addr v4, v5

    float-to-int v3, v4

    :goto_3f
    iget-object v4, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    iget-object v5, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    iget-object v6, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    move-result v6

    invoke-virtual {v4, v5, v3, v6}, Landroid/support/v4/widget/ViewDragHelper;->smoothSlideViewTo(Landroid/view/View;II)Z

    move-result v4

    if-eqz v4, :cond_57

    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->setAllChildrenVisible()V

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    const/4 v1, 0x1

    return v1

    :cond_57
    return v1
.end method

.method updateObscuredViewsVisibility(Landroid/view/View;)V
    .registers 22

    move-object/from16 v0, p1

    invoke-direct/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->isLayoutRtlSupport()Z

    move-result v1

    if-eqz v1, :cond_12

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getWidth()I

    move-result v2

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingRight()I

    move-result v3

    sub-int/2addr v2, v3

    goto :goto_16

    :cond_12
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingLeft()I

    move-result v2

    :goto_16
    if-eqz v1, :cond_1d

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingLeft()I

    move-result v3

    goto :goto_26

    :cond_1d
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getWidth()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingRight()I

    move-result v4

    sub-int/2addr v3, v4

    :goto_26
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingTop()I

    move-result v4

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getHeight()I

    move-result v5

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingBottom()I

    move-result v6

    sub-int/2addr v5, v6

    const/4 v6, 0x0

    if-eqz v0, :cond_4d

    invoke-static/range {p1 .. p1}, Landroid/support/v4/widget/SlidingPaneLayout;->viewIsOpaque(Landroid/view/View;)Z

    move-result v7

    if-eqz v7, :cond_4d

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getLeft()I

    move-result v7

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getRight()I

    move-result v8

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTop()I

    move-result v9

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getBottom()I

    move-result v10

    goto :goto_51

    :cond_4d
    move v10, v6

    move v9, v6

    move v8, v6

    move v7, v6

    :goto_51
    const/4 v11, 0x0

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildCount()I

    move-result v12

    :goto_56
    if-ge v11, v12, :cond_ae

    move-object/from16 v13, p0

    invoke-virtual {v13, v11}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v14

    if-ne v14, v0, :cond_64

    nop

    move/from16 v16, v1

    goto :goto_b2

    :cond_64
    if-eqz v1, :cond_68

    move v15, v3

    goto :goto_69

    :cond_68
    move v15, v2

    :goto_69
    invoke-virtual {v14}, Landroid/view/View;->getLeft()I

    move-result v6

    invoke-static {v15, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    invoke-virtual {v14}, Landroid/view/View;->getTop()I

    move-result v15

    invoke-static {v4, v15}, Ljava/lang/Math;->max(II)I

    move-result v15

    if-eqz v1, :cond_7d

    move v0, v2

    goto :goto_7e

    :cond_7d
    move v0, v3

    :goto_7e
    move/from16 v16, v1

    invoke-virtual {v14}, Landroid/view/View;->getRight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-virtual {v14}, Landroid/view/View;->getBottom()I

    move-result v1

    invoke-static {v5, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    if-lt v6, v7, :cond_9b

    if-lt v15, v9, :cond_9b

    if-gt v0, v8, :cond_9b

    if-gt v1, v10, :cond_9b

    const/16 v17, 0x4

    goto :goto_9d

    :cond_9b
    const/16 v17, 0x0

    :goto_9d
    move/from16 v18, v17

    move/from16 v19, v0

    move/from16 v0, v18

    invoke-virtual {v14, v0}, Landroid/view/View;->setVisibility(I)V

    add-int/lit8 v11, v11, 0x1

    move/from16 v1, v16

    move-object/from16 v0, p1

    const/4 v6, 0x0

    goto :goto_56

    :cond_ae
    move-object/from16 v13, p0

    move/from16 v16, v1

    :goto_b2
    return-void
.end method
