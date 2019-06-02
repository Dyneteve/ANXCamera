.class public Landroid/support/v4/widget/DrawerLayout;
.super Landroid/view/ViewGroup;
.source "DrawerLayout.java"

# interfaces
.implements Landroid/support/v4/widget/DrawerLayoutImpl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/widget/DrawerLayout$ChildAccessibilityDelegate;,
        Landroid/support/v4/widget/DrawerLayout$AccessibilityDelegate;,
        Landroid/support/v4/widget/DrawerLayout$LayoutParams;,
        Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;,
        Landroid/support/v4/widget/DrawerLayout$SavedState;,
        Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImplApi21;,
        Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImplBase;,
        Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;,
        Landroid/support/v4/widget/DrawerLayout$SimpleDrawerListener;,
        Landroid/support/v4/widget/DrawerLayout$DrawerListener;,
        Landroid/support/v4/widget/DrawerLayout$EdgeGravity;,
        Landroid/support/v4/widget/DrawerLayout$LockMode;,
        Landroid/support/v4/widget/DrawerLayout$State;
    }
.end annotation


# static fields
.field private static final ALLOW_EDGE_LOCK:Z = false

.field private static final CAN_HIDE_DESCENDANTS:Z

.field private static final CHILDREN_DISALLOW_INTERCEPT:Z = true

.field private static final DEFAULT_SCRIM_COLOR:I = -0x67000000

.field private static final DRAWER_ELEVATION:I = 0xa

.field static final IMPL:Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;

.field private static final LAYOUT_ATTRS:[I

.field public static final LOCK_MODE_LOCKED_CLOSED:I = 0x1

.field public static final LOCK_MODE_LOCKED_OPEN:I = 0x2

.field public static final LOCK_MODE_UNLOCKED:I = 0x0

.field private static final MIN_DRAWER_MARGIN:I = 0x40

.field private static final MIN_FLING_VELOCITY:I = 0x190

.field private static final PEEK_DELAY:I = 0xa0

.field private static final SET_DRAWER_SHADOW_FROM_ELEVATION:Z

.field public static final STATE_DRAGGING:I = 0x1

.field public static final STATE_IDLE:I = 0x0

.field public static final STATE_SETTLING:I = 0x2

.field private static final TAG:Ljava/lang/String; = "DrawerLayout"

.field private static final TOUCH_SLOP_SENSITIVITY:F = 1.0f


# instance fields
.field private final mChildAccessibilityDelegate:Landroid/support/v4/widget/DrawerLayout$ChildAccessibilityDelegate;

.field private mChildrenCanceledTouch:Z

.field private mDisallowInterceptRequested:Z

.field private mDrawStatusBarBackground:Z

.field private mDrawerElevation:F

.field private mDrawerState:I

.field private mFirstLayout:Z

.field private mInLayout:Z

.field private mInitialMotionX:F

.field private mInitialMotionY:F

.field private mLastInsets:Ljava/lang/Object;

.field private final mLeftCallback:Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

.field private final mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

.field private mListener:Landroid/support/v4/widget/DrawerLayout$DrawerListener;

.field private mLockModeLeft:I

.field private mLockModeRight:I

.field private mMinDrawerMargin:I

.field private final mNonDrawerViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final mRightCallback:Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

.field private final mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

.field private mScrimColor:I

.field private mScrimOpacity:F

.field private mScrimPaint:Landroid/graphics/Paint;

.field private mShadowEnd:Landroid/graphics/drawable/Drawable;

.field private mShadowLeft:Landroid/graphics/drawable/Drawable;

.field private mShadowLeftResolved:Landroid/graphics/drawable/Drawable;

.field private mShadowRight:Landroid/graphics/drawable/Drawable;

.field private mShadowRightResolved:Landroid/graphics/drawable/Drawable;

.field private mShadowStart:Landroid/graphics/drawable/Drawable;

.field private mStatusBarBackground:Landroid/graphics/drawable/Drawable;

.field private mTitleLeft:Ljava/lang/CharSequence;

.field private mTitleRight:Ljava/lang/CharSequence;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    const/4 v0, 0x1

    new-array v1, v0, [I

    const/4 v2, 0x0

    const v3, 0x10100b3

    aput v3, v1, v2

    sput-object v1, Landroid/support/v4/widget/DrawerLayout;->LAYOUT_ATTRS:[I

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-lt v1, v3, :cond_13

    move v1, v0

    goto :goto_14

    :cond_13
    move v1, v2

    :goto_14
    sput-boolean v1, Landroid/support/v4/widget/DrawerLayout;->CAN_HIDE_DESCENDANTS:Z

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v1, v3, :cond_1d

    goto :goto_1e

    :cond_1d
    move v0, v2

    :goto_1e
    sput-boolean v0, Landroid/support/v4/widget/DrawerLayout;->SET_DRAWER_SHADOW_FROM_ELEVATION:Z

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v3, :cond_2c

    new-instance v1, Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImplApi21;

    invoke-direct {v1}, Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImplApi21;-><init>()V

    sput-object v1, Landroid/support/v4/widget/DrawerLayout;->IMPL:Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;

    goto :goto_33

    :cond_2c
    new-instance v1, Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImplBase;

    invoke-direct {v1}, Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImplBase;-><init>()V

    sput-object v1, Landroid/support/v4/widget/DrawerLayout;->IMPL:Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;

    :goto_33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v4/widget/DrawerLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v4/widget/DrawerLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 10

    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v0, Landroid/support/v4/widget/DrawerLayout$ChildAccessibilityDelegate;

    invoke-direct {v0, p0}, Landroid/support/v4/widget/DrawerLayout$ChildAccessibilityDelegate;-><init>(Landroid/support/v4/widget/DrawerLayout;)V

    iput-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mChildAccessibilityDelegate:Landroid/support/v4/widget/DrawerLayout$ChildAccessibilityDelegate;

    const/high16 v0, -0x67000000

    iput v0, p0, Landroid/support/v4/widget/DrawerLayout;->mScrimColor:I

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mScrimPaint:Landroid/graphics/Paint;

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/widget/DrawerLayout;->mFirstLayout:Z

    const/4 v1, 0x0

    iput-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mShadowStart:Landroid/graphics/drawable/Drawable;

    iput-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mShadowEnd:Landroid/graphics/drawable/Drawable;

    iput-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mShadowLeft:Landroid/graphics/drawable/Drawable;

    iput-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mShadowRight:Landroid/graphics/drawable/Drawable;

    const/high16 v1, 0x40000

    invoke-virtual {p0, v1}, Landroid/support/v4/widget/DrawerLayout;->setDescendantFocusability(I)V

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v2, 0x42800000    # 64.0f

    mul-float/2addr v2, v1

    const/high16 v3, 0x3f000000    # 0.5f

    add-float/2addr v2, v3

    float-to-int v2, v2

    iput v2, p0, Landroid/support/v4/widget/DrawerLayout;->mMinDrawerMargin:I

    const/high16 v2, 0x43c80000    # 400.0f

    mul-float/2addr v2, v1

    new-instance v3, Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

    const/4 v4, 0x3

    invoke-direct {v3, p0, v4}, Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;-><init>(Landroid/support/v4/widget/DrawerLayout;I)V

    iput-object v3, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftCallback:Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

    new-instance v3, Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

    const/4 v4, 0x5

    invoke-direct {v3, p0, v4}, Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;-><init>(Landroid/support/v4/widget/DrawerLayout;I)V

    iput-object v3, p0, Landroid/support/v4/widget/DrawerLayout;->mRightCallback:Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

    iget-object v3, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftCallback:Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {p0, v4, v3}, Landroid/support/v4/widget/ViewDragHelper;->create(Landroid/view/ViewGroup;FLandroid/support/v4/widget/ViewDragHelper$Callback;)Landroid/support/v4/widget/ViewDragHelper;

    move-result-object v3

    iput-object v3, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    iget-object v3, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v3, v0}, Landroid/support/v4/widget/ViewDragHelper;->setEdgeTrackingEnabled(I)V

    iget-object v3, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v3, v2}, Landroid/support/v4/widget/ViewDragHelper;->setMinVelocity(F)V

    iget-object v3, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftCallback:Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

    iget-object v5, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v3, v5}, Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;->setDragger(Landroid/support/v4/widget/ViewDragHelper;)V

    iget-object v3, p0, Landroid/support/v4/widget/DrawerLayout;->mRightCallback:Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

    invoke-static {p0, v4, v3}, Landroid/support/v4/widget/ViewDragHelper;->create(Landroid/view/ViewGroup;FLandroid/support/v4/widget/ViewDragHelper$Callback;)Landroid/support/v4/widget/ViewDragHelper;

    move-result-object v3

    iput-object v3, p0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    iget-object v3, p0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Landroid/support/v4/widget/ViewDragHelper;->setEdgeTrackingEnabled(I)V

    iget-object v3, p0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v3, v2}, Landroid/support/v4/widget/ViewDragHelper;->setMinVelocity(F)V

    iget-object v3, p0, Landroid/support/v4/widget/DrawerLayout;->mRightCallback:Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

    iget-object v4, p0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v3, v4}, Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;->setDragger(Landroid/support/v4/widget/ViewDragHelper;)V

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/DrawerLayout;->setFocusableInTouchMode(Z)V

    invoke-static {p0, v0}, Landroid/support/v4/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    new-instance v0, Landroid/support/v4/widget/DrawerLayout$AccessibilityDelegate;

    invoke-direct {v0, p0}, Landroid/support/v4/widget/DrawerLayout$AccessibilityDelegate;-><init>(Landroid/support/v4/widget/DrawerLayout;)V

    invoke-static {p0, v0}, Landroid/support/v4/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroid/support/v4/view/AccessibilityDelegateCompat;)V

    const/4 v0, 0x0

    invoke-static {p0, v0}, Landroid/support/v4/view/ViewGroupCompat;->setMotionEventSplittingEnabled(Landroid/view/ViewGroup;Z)V

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getFitsSystemWindows(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_a6

    sget-object v0, Landroid/support/v4/widget/DrawerLayout;->IMPL:Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;

    invoke-interface {v0, p0}, Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;->configureApplyInsets(Landroid/view/View;)V

    sget-object v0, Landroid/support/v4/widget/DrawerLayout;->IMPL:Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;

    invoke-interface {v0, p1}, Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;->getDefaultStatusBarBackground(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mStatusBarBackground:Landroid/graphics/drawable/Drawable;

    :cond_a6
    const/high16 v0, 0x41200000    # 10.0f

    mul-float/2addr v0, v1

    iput v0, p0, Landroid/support/v4/widget/DrawerLayout;->mDrawerElevation:F

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mNonDrawerViews:Ljava/util/ArrayList;

    return-void
.end method

.method static synthetic access$100()[I
    .registers 1

    sget-object v0, Landroid/support/v4/widget/DrawerLayout;->LAYOUT_ATTRS:[I

    return-object v0
.end method

.method static synthetic access$200()Z
    .registers 1

    sget-boolean v0, Landroid/support/v4/widget/DrawerLayout;->CAN_HIDE_DESCENDANTS:Z

    return v0
.end method

.method static synthetic access$300(Landroid/support/v4/widget/DrawerLayout;)Landroid/view/View;
    .registers 2

    invoke-direct {p0}, Landroid/support/v4/widget/DrawerLayout;->findVisibleDrawer()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Landroid/view/View;)Z
    .registers 2

    invoke-static {p0}, Landroid/support/v4/widget/DrawerLayout;->includeChildForAccessibility(Landroid/view/View;)Z

    move-result v0

    return v0
.end method

.method private findVisibleDrawer()Landroid/view/View;
    .registers 5

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_1b

    invoke-virtual {p0, v1}, Landroid/support/v4/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/support/v4/widget/DrawerLayout;->isDrawerView(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_18

    invoke-virtual {p0, v2}, Landroid/support/v4/widget/DrawerLayout;->isDrawerVisible(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_18

    return-object v2

    :cond_18
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_1b
    const/4 v1, 0x0

    return-object v1
.end method

.method static gravityToString(I)Ljava/lang/String;
    .registers 3

    and-int/lit8 v0, p0, 0x3

    const/4 v1, 0x3

    if-ne v0, v1, :cond_8

    const-string v0, "LEFT"

    return-object v0

    :cond_8
    and-int/lit8 v0, p0, 0x5

    const/4 v1, 0x5

    if-ne v0, v1, :cond_10

    const-string v0, "RIGHT"

    return-object v0

    :cond_10
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static hasOpaqueBackground(Landroid/view/View;)Z
    .registers 5

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_11

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_10

    const/4 v1, 0x1

    nop

    :cond_10
    return v1

    :cond_11
    return v1
.end method

.method private hasPeekingDrawer()Z
    .registers 6

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_6
    if-ge v2, v0, :cond_1b

    invoke-virtual {p0, v2}, Landroid/support/v4/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    iget-boolean v4, v3, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->isPeeking:Z

    if-eqz v4, :cond_18

    const/4 v1, 0x1

    return v1

    :cond_18
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_1b
    return v1
.end method

.method private hasVisibleDrawer()Z
    .registers 2

    invoke-direct {p0}, Landroid/support/v4/widget/DrawerLayout;->findVisibleDrawer()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method private static includeChildForAccessibility(Landroid/view/View;)Z
    .registers 3

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getImportantForAccessibility(Landroid/view/View;)I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_10

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getImportantForAccessibility(Landroid/view/View;)I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_10

    const/4 v0, 0x1

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    return v0
.end method

.method private mirror(Landroid/graphics/drawable/Drawable;I)Z
    .registers 4

    if-eqz p1, :cond_e

    invoke-static {p1}, Landroid/support/v4/graphics/drawable/DrawableCompat;->isAutoMirrored(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-nez v0, :cond_9

    goto :goto_e

    :cond_9
    invoke-static {p1, p2}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setLayoutDirection(Landroid/graphics/drawable/Drawable;I)V

    const/4 v0, 0x1

    return v0

    :cond_e
    :goto_e
    const/4 v0, 0x0

    return v0
.end method

.method private resolveLeftShadow()Landroid/graphics/drawable/Drawable;
    .registers 3

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v0

    if-nez v0, :cond_12

    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mShadowStart:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_1e

    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mShadowStart:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, v1, v0}, Landroid/support/v4/widget/DrawerLayout;->mirror(Landroid/graphics/drawable/Drawable;I)Z

    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mShadowStart:Landroid/graphics/drawable/Drawable;

    return-object v1

    :cond_12
    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mShadowEnd:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_1e

    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mShadowEnd:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, v1, v0}, Landroid/support/v4/widget/DrawerLayout;->mirror(Landroid/graphics/drawable/Drawable;I)Z

    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mShadowEnd:Landroid/graphics/drawable/Drawable;

    return-object v1

    :cond_1e
    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mShadowLeft:Landroid/graphics/drawable/Drawable;

    return-object v1
.end method

.method private resolveRightShadow()Landroid/graphics/drawable/Drawable;
    .registers 3

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v0

    if-nez v0, :cond_12

    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mShadowEnd:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_1e

    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mShadowEnd:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, v1, v0}, Landroid/support/v4/widget/DrawerLayout;->mirror(Landroid/graphics/drawable/Drawable;I)Z

    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mShadowEnd:Landroid/graphics/drawable/Drawable;

    return-object v1

    :cond_12
    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mShadowStart:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_1e

    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mShadowStart:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, v1, v0}, Landroid/support/v4/widget/DrawerLayout;->mirror(Landroid/graphics/drawable/Drawable;I)Z

    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mShadowStart:Landroid/graphics/drawable/Drawable;

    return-object v1

    :cond_1e
    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mShadowRight:Landroid/graphics/drawable/Drawable;

    return-object v1
.end method

.method private resolveShadowDrawables()V
    .registers 2

    sget-boolean v0, Landroid/support/v4/widget/DrawerLayout;->SET_DRAWER_SHADOW_FROM_ELEVATION:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    invoke-direct {p0}, Landroid/support/v4/widget/DrawerLayout;->resolveLeftShadow()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mShadowLeftResolved:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0}, Landroid/support/v4/widget/DrawerLayout;->resolveRightShadow()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mShadowRightResolved:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method private updateChildrenImportantForAccessibility(Landroid/view/View;Z)V
    .registers 7

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_23

    invoke-virtual {p0, v1}, Landroid/support/v4/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    if-nez p2, :cond_13

    invoke-virtual {p0, v2}, Landroid/support/v4/widget/DrawerLayout;->isDrawerView(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_17

    :cond_13
    if-eqz p2, :cond_1c

    if-ne v2, p1, :cond_1c

    :cond_17
    const/4 v3, 0x1

    invoke-static {v2, v3}, Landroid/support/v4/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    goto :goto_20

    :cond_1c
    const/4 v3, 0x4

    invoke-static {v2, v3}, Landroid/support/v4/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    :goto_20
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_23
    return-void
.end method


# virtual methods
.method public addFocusables(Ljava/util/ArrayList;II)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;II)V"
        }
    .end annotation

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getDescendantFocusability()I

    move-result v0

    const/high16 v1, 0x60000

    if-ne v0, v1, :cond_9

    return-void

    :cond_9
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    move v3, v1

    move v1, v2

    :goto_11
    if-ge v1, v0, :cond_30

    invoke-virtual {p0, v1}, Landroid/support/v4/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/support/v4/widget/DrawerLayout;->isDrawerView(Landroid/view/View;)Z

    move-result v5

    if-eqz v5, :cond_28

    invoke-virtual {p0, v4}, Landroid/support/v4/widget/DrawerLayout;->isDrawerOpen(Landroid/view/View;)Z

    move-result v5

    if-eqz v5, :cond_2d

    const/4 v3, 0x1

    invoke-virtual {v4, p1, p2, p3}, Landroid/view/View;->addFocusables(Ljava/util/ArrayList;II)V

    goto :goto_2d

    :cond_28
    iget-object v5, p0, Landroid/support/v4/widget/DrawerLayout;->mNonDrawerViews:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2d
    :goto_2d
    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    :cond_30
    if-nez v3, :cond_4f

    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mNonDrawerViews:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    nop

    :goto_39
    if-ge v2, v1, :cond_4f

    iget-object v4, p0, Landroid/support/v4/widget/DrawerLayout;->mNonDrawerViews:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-nez v5, :cond_4c

    invoke-virtual {v4, p1, p2, p3}, Landroid/view/View;->addFocusables(Ljava/util/ArrayList;II)V

    :cond_4c
    add-int/lit8 v2, v2, 0x1

    goto :goto_39

    :cond_4f
    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mNonDrawerViews:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .registers 6

    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->findOpenDrawer()Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_15

    invoke-virtual {p0, p1}, Landroid/support/v4/widget/DrawerLayout;->isDrawerView(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_10

    goto :goto_15

    :cond_10
    const/4 v1, 0x1

    invoke-static {p1, v1}, Landroid/support/v4/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    goto :goto_19

    :cond_15
    :goto_15
    const/4 v1, 0x4

    invoke-static {p1, v1}, Landroid/support/v4/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    :goto_19
    sget-boolean v1, Landroid/support/v4/widget/DrawerLayout;->CAN_HIDE_DESCENDANTS:Z

    if-nez v1, :cond_22

    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mChildAccessibilityDelegate:Landroid/support/v4/widget/DrawerLayout$ChildAccessibilityDelegate;

    invoke-static {p1, v1}, Landroid/support/v4/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroid/support/v4/view/AccessibilityDelegateCompat;)V

    :cond_22
    return-void
.end method

.method cancelChildViewTouch()V
    .registers 12

    iget-boolean v0, p0, Landroid/support/v4/widget/DrawerLayout;->mChildrenCanceledTouch:Z

    if-nez v0, :cond_29

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

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    :goto_17
    if-ge v2, v1, :cond_23

    invoke-virtual {p0, v2}, Landroid/support/v4/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    :cond_23
    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    const/4 v2, 0x1

    iput-boolean v2, p0, Landroid/support/v4/widget/DrawerLayout;->mChildrenCanceledTouch:Z

    :cond_29
    return-void
.end method

.method checkDrawerViewAbsoluteGravity(Landroid/view/View;I)Z
    .registers 5

    invoke-virtual {p0, p1}, Landroid/support/v4/widget/DrawerLayout;->getDrawerViewAbsoluteGravity(Landroid/view/View;)I

    move-result v0

    and-int v1, v0, p2

    if-ne v1, p2, :cond_a

    const/4 v1, 0x1

    goto :goto_b

    :cond_a
    const/4 v1, 0x0

    :goto_b
    return v1
.end method

.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 3

    instance-of v0, p1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

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

.method public closeDrawer(I)V
    .registers 6

    invoke-virtual {p0, p1}, Landroid/support/v4/widget/DrawerLayout;->findDrawerWithGravity(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_a

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/DrawerLayout;->closeDrawer(Landroid/view/View;)V

    return-void

    :cond_a
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No drawer view found with gravity "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Landroid/support/v4/widget/DrawerLayout;->gravityToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public closeDrawer(Landroid/view/View;)V
    .registers 5

    invoke-virtual {p0, p1}, Landroid/support/v4/widget/DrawerLayout;->isDrawerView(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_3e

    iget-boolean v0, p0, Landroid/support/v4/widget/DrawerLayout;->mFirstLayout:Z

    if-eqz v0, :cond_17

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    const/4 v1, 0x0

    iput v1, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->knownOpen:Z

    goto :goto_3a

    :cond_17
    const/4 v0, 0x3

    invoke-virtual {p0, p1, v0}, Landroid/support/v4/widget/DrawerLayout;->checkDrawerViewAbsoluteGravity(Landroid/view/View;I)Z

    move-result v0

    if-eqz v0, :cond_2d

    iget-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    neg-int v1, v1

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v2

    invoke-virtual {v0, p1, v1, v2}, Landroid/support/v4/widget/ViewDragHelper;->smoothSlideViewTo(Landroid/view/View;II)Z

    goto :goto_3a

    :cond_2d
    iget-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v2

    invoke-virtual {v0, p1, v1, v2}, Landroid/support/v4/widget/ViewDragHelper;->smoothSlideViewTo(Landroid/view/View;II)Z

    :goto_3a
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->invalidate()V

    return-void

    :cond_3e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "View "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " is not a sliding drawer"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public closeDrawers()V
    .registers 2

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/DrawerLayout;->closeDrawers(Z)V

    return-void
.end method

.method closeDrawers(Z)V
    .registers 12

    const/4 v0, 0x0

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    move v3, v0

    move v0, v2

    :goto_8
    if-ge v0, v1, :cond_4d

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    invoke-virtual {p0, v4}, Landroid/support/v4/widget/DrawerLayout;->isDrawerView(Landroid/view/View;)Z

    move-result v6

    if-eqz v6, :cond_4a

    if-eqz p1, :cond_21

    iget-boolean v6, v5, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->isPeeking:Z

    if-nez v6, :cond_21

    goto :goto_4a

    :cond_21
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v6

    const/4 v7, 0x3

    invoke-virtual {p0, v4, v7}, Landroid/support/v4/widget/DrawerLayout;->checkDrawerViewAbsoluteGravity(Landroid/view/View;I)Z

    move-result v7

    if-eqz v7, :cond_39

    iget-object v7, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    neg-int v8, v6

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v9

    invoke-virtual {v7, v4, v8, v9}, Landroid/support/v4/widget/ViewDragHelper;->smoothSlideViewTo(Landroid/view/View;II)Z

    move-result v7

    or-int/2addr v3, v7

    goto :goto_48

    :cond_39
    iget-object v7, p0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getWidth()I

    move-result v8

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v9

    invoke-virtual {v7, v4, v8, v9}, Landroid/support/v4/widget/ViewDragHelper;->smoothSlideViewTo(Landroid/view/View;II)Z

    move-result v7

    or-int/2addr v3, v7

    :goto_48
    iput-boolean v2, v5, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->isPeeking:Z

    :cond_4a
    :goto_4a
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    :cond_4d
    iget-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftCallback:Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

    invoke-virtual {v0}, Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;->removeCallbacks()V

    iget-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mRightCallback:Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

    invoke-virtual {v0}, Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;->removeCallbacks()V

    if-eqz v3, :cond_5c

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->invalidate()V

    :cond_5c
    return-void
.end method

.method public computeScroll()V
    .registers 6

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v0, :cond_1b

    invoke-virtual {p0, v2}, Landroid/support/v4/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    iget v3, v3, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F

    move-result v1

    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_1b
    iput v1, p0, Landroid/support/v4/widget/DrawerLayout;->mScrimOpacity:F

    iget-object v2, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/support/v4/widget/ViewDragHelper;->continueSettling(Z)Z

    move-result v2

    iget-object v4, p0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v4, v3}, Landroid/support/v4/widget/ViewDragHelper;->continueSettling(Z)Z

    move-result v3

    or-int/2addr v2, v3

    if-eqz v2, :cond_30

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    :cond_30
    return-void
.end method

.method dispatchOnDrawerClosed(Landroid/view/View;)V
    .registers 5

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    iget-boolean v1, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->knownOpen:Z

    if-eqz v1, :cond_2a

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->knownOpen:Z

    iget-object v2, p0, Landroid/support/v4/widget/DrawerLayout;->mListener:Landroid/support/v4/widget/DrawerLayout$DrawerListener;

    if-eqz v2, :cond_16

    iget-object v2, p0, Landroid/support/v4/widget/DrawerLayout;->mListener:Landroid/support/v4/widget/DrawerLayout$DrawerListener;

    invoke-interface {v2, p1}, Landroid/support/v4/widget/DrawerLayout$DrawerListener;->onDrawerClosed(Landroid/view/View;)V

    :cond_16
    invoke-direct {p0, p1, v1}, Landroid/support/v4/widget/DrawerLayout;->updateChildrenImportantForAccessibility(Landroid/view/View;Z)V

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->hasWindowFocus()Z

    move-result v1

    if-eqz v1, :cond_2a

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getRootView()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_2a

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Landroid/view/View;->sendAccessibilityEvent(I)V

    :cond_2a
    return-void
.end method

.method dispatchOnDrawerOpened(Landroid/view/View;)V
    .registers 5

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    iget-boolean v1, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->knownOpen:Z

    if-nez v1, :cond_27

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->knownOpen:Z

    iget-object v2, p0, Landroid/support/v4/widget/DrawerLayout;->mListener:Landroid/support/v4/widget/DrawerLayout$DrawerListener;

    if-eqz v2, :cond_16

    iget-object v2, p0, Landroid/support/v4/widget/DrawerLayout;->mListener:Landroid/support/v4/widget/DrawerLayout$DrawerListener;

    invoke-interface {v2, p1}, Landroid/support/v4/widget/DrawerLayout$DrawerListener;->onDrawerOpened(Landroid/view/View;)V

    :cond_16
    invoke-direct {p0, p1, v1}, Landroid/support/v4/widget/DrawerLayout;->updateChildrenImportantForAccessibility(Landroid/view/View;Z)V

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->hasWindowFocus()Z

    move-result v1

    if-eqz v1, :cond_24

    const/16 v1, 0x20

    invoke-virtual {p0, v1}, Landroid/support/v4/widget/DrawerLayout;->sendAccessibilityEvent(I)V

    :cond_24
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    :cond_27
    return-void
.end method

.method dispatchOnDrawerSlide(Landroid/view/View;F)V
    .registers 4

    iget-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mListener:Landroid/support/v4/widget/DrawerLayout$DrawerListener;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mListener:Landroid/support/v4/widget/DrawerLayout$DrawerListener;

    invoke-interface {v0, p1, p2}, Landroid/support/v4/widget/DrawerLayout$DrawerListener;->onDrawerSlide(Landroid/view/View;F)V

    :cond_9
    return-void
.end method

.method protected drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .registers 27

    move-object/from16 v0, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/DrawerLayout;->getHeight()I

    move-result v9

    invoke-virtual {v0, v8}, Landroid/support/v4/widget/DrawerLayout;->isContentView(Landroid/view/View;)Z

    move-result v10

    const/4 v1, 0x0

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/DrawerLayout;->getWidth()I

    move-result v2

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    move-result v11

    const/4 v3, 0x3

    if-eqz v10, :cond_65

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/DrawerLayout;->getChildCount()I

    move-result v4

    const/4 v5, 0x0

    move v6, v2

    move v2, v1

    move v1, v5

    :goto_22
    if-ge v1, v4, :cond_5b

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    if-eq v12, v8, :cond_58

    invoke-virtual {v12}, Landroid/view/View;->getVisibility()I

    move-result v13

    if-nez v13, :cond_58

    invoke-static {v12}, Landroid/support/v4/widget/DrawerLayout;->hasOpaqueBackground(Landroid/view/View;)Z

    move-result v13

    if-eqz v13, :cond_58

    invoke-virtual {v0, v12}, Landroid/support/v4/widget/DrawerLayout;->isDrawerView(Landroid/view/View;)Z

    move-result v13

    if-eqz v13, :cond_58

    invoke-virtual {v12}, Landroid/view/View;->getHeight()I

    move-result v13

    if-ge v13, v9, :cond_43

    goto :goto_58

    :cond_43
    invoke-virtual {v0, v12, v3}, Landroid/support/v4/widget/DrawerLayout;->checkDrawerViewAbsoluteGravity(Landroid/view/View;I)Z

    move-result v13

    if-eqz v13, :cond_51

    invoke-virtual {v12}, Landroid/view/View;->getRight()I

    move-result v13

    if-le v13, v2, :cond_50

    move v2, v13

    :cond_50
    goto :goto_58

    :cond_51
    invoke-virtual {v12}, Landroid/view/View;->getLeft()I

    move-result v13

    if-ge v13, v6, :cond_58

    move v6, v13

    :cond_58
    :goto_58
    add-int/lit8 v1, v1, 0x1

    goto :goto_22

    :cond_5b
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/DrawerLayout;->getHeight()I

    move-result v1

    invoke-virtual {v7, v2, v5, v6, v1}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    move v12, v2

    move v13, v6

    goto :goto_67

    :cond_65
    move v12, v1

    move v13, v2

    :goto_67
    invoke-super/range {p0 .. p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result v14

    invoke-virtual {v7, v11}, Landroid/graphics/Canvas;->restoreToCount(I)V

    iget v1, v0, Landroid/support/v4/widget/DrawerLayout;->mScrimOpacity:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-lez v1, :cond_ae

    if-eqz v10, :cond_ae

    iget v1, v0, Landroid/support/v4/widget/DrawerLayout;->mScrimColor:I

    const/high16 v2, -0x1000000

    and-int/2addr v1, v2

    ushr-int/lit8 v15, v1, 0x18

    int-to-float v1, v15

    iget v2, v0, Landroid/support/v4/widget/DrawerLayout;->mScrimOpacity:F

    mul-float/2addr v1, v2

    float-to-int v6, v1

    shl-int/lit8 v1, v6, 0x18

    iget v2, v0, Landroid/support/v4/widget/DrawerLayout;->mScrimColor:I

    const v3, 0xffffff

    and-int/2addr v2, v3

    or-int v5, v1, v2

    iget-object v1, v0, Landroid/support/v4/widget/DrawerLayout;->mScrimPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v5}, Landroid/graphics/Paint;->setColor(I)V

    int-to-float v2, v12

    int-to-float v4, v13

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/DrawerLayout;->getHeight()I

    move-result v1

    int-to-float v1, v1

    iget-object v3, v0, Landroid/support/v4/widget/DrawerLayout;->mScrimPaint:Landroid/graphics/Paint;

    move/from16 v17, v1

    move-object v1, v7

    move-object/from16 v16, v3

    const/4 v3, 0x0

    move/from16 v18, v5

    move/from16 v5, v17

    move/from16 v17, v6

    move-object/from16 v6, v16

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_142

    :cond_ae
    iget-object v1, v0, Landroid/support/v4/widget/DrawerLayout;->mShadowLeftResolved:Landroid/graphics/drawable/Drawable;

    const/high16 v5, 0x3f800000    # 1.0f

    if-eqz v1, :cond_f5

    invoke-virtual {v0, v8, v3}, Landroid/support/v4/widget/DrawerLayout;->checkDrawerViewAbsoluteGravity(Landroid/view/View;I)Z

    move-result v1

    if-eqz v1, :cond_f5

    iget-object v1, v0, Landroid/support/v4/widget/DrawerLayout;->mShadowLeftResolved:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getRight()I

    move-result v3

    iget-object v6, v0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v6}, Landroid/support/v4/widget/ViewDragHelper;->getEdgeSize()I

    move-result v6

    int-to-float v15, v3

    int-to-float v4, v6

    div-float/2addr v15, v4

    invoke-static {v15, v5}, Ljava/lang/Math;->min(FF)F

    move-result v4

    invoke-static {v2, v4}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iget-object v4, v0, Landroid/support/v4/widget/DrawerLayout;->mShadowLeftResolved:Landroid/graphics/drawable/Drawable;

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getTop()I

    move-result v5

    add-int v15, v3, v1

    move/from16 v19, v1

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getBottom()I

    move-result v1

    invoke-virtual {v4, v3, v5, v15, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v1, v0, Landroid/support/v4/widget/DrawerLayout;->mShadowLeftResolved:Landroid/graphics/drawable/Drawable;

    const/high16 v4, 0x437f0000    # 255.0f

    mul-float/2addr v4, v2

    float-to-int v4, v4

    invoke-virtual {v1, v4}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    iget-object v1, v0, Landroid/support/v4/widget/DrawerLayout;->mShadowLeftResolved:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v7}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_142

    :cond_f5
    iget-object v1, v0, Landroid/support/v4/widget/DrawerLayout;->mShadowRightResolved:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_142

    const/4 v1, 0x5

    invoke-virtual {v0, v8, v1}, Landroid/support/v4/widget/DrawerLayout;->checkDrawerViewAbsoluteGravity(Landroid/view/View;I)Z

    move-result v1

    if-eqz v1, :cond_142

    iget-object v1, v0, Landroid/support/v4/widget/DrawerLayout;->mShadowRightResolved:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getLeft()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/DrawerLayout;->getWidth()I

    move-result v4

    sub-int/2addr v4, v3

    iget-object v6, v0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v6}, Landroid/support/v4/widget/ViewDragHelper;->getEdgeSize()I

    move-result v6

    int-to-float v15, v4

    int-to-float v2, v6

    div-float/2addr v15, v2

    invoke-static {v15, v5}, Ljava/lang/Math;->min(FF)F

    move-result v2

    const/4 v5, 0x0

    invoke-static {v5, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iget-object v5, v0, Landroid/support/v4/widget/DrawerLayout;->mShadowRightResolved:Landroid/graphics/drawable/Drawable;

    sub-int v15, v3, v1

    move/from16 v20, v1

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getTop()I

    move-result v1

    move/from16 v21, v4

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getBottom()I

    move-result v4

    invoke-virtual {v5, v15, v1, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v1, v0, Landroid/support/v4/widget/DrawerLayout;->mShadowRightResolved:Landroid/graphics/drawable/Drawable;

    const/high16 v4, 0x437f0000    # 255.0f

    mul-float/2addr v4, v2

    float-to-int v4, v4

    invoke-virtual {v1, v4}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    iget-object v1, v0, Landroid/support/v4/widget/DrawerLayout;->mShadowRightResolved:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v7}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_142
    :goto_142
    return v14
.end method

.method findDrawerWithGravity(I)Landroid/view/View;
    .registers 8

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v0

    invoke-static {p1, v0}, Landroid/support/v4/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result v0

    and-int/lit8 v0, v0, 0x7

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    :goto_f
    if-ge v2, v1, :cond_21

    invoke-virtual {p0, v2}, Landroid/support/v4/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {p0, v3}, Landroid/support/v4/widget/DrawerLayout;->getDrawerViewAbsoluteGravity(Landroid/view/View;)I

    move-result v4

    and-int/lit8 v5, v4, 0x7

    if-ne v5, v0, :cond_1e

    return-object v3

    :cond_1e
    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    :cond_21
    const/4 v2, 0x0

    return-object v2
.end method

.method findOpenDrawer()Landroid/view/View;
    .registers 5

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_19

    invoke-virtual {p0, v1}, Landroid/support/v4/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    iget-boolean v3, v3, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->knownOpen:Z

    if-eqz v3, :cond_16

    return-object v2

    :cond_16
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_19
    const/4 v1, 0x0

    return-object v1
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 3

    new-instance v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/support/v4/widget/DrawerLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 4

    new-instance v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/support/v4/widget/DrawerLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 4

    instance-of v0, p1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    if-eqz v0, :cond_d

    new-instance v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    move-object v1, p1

    check-cast v1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    invoke-direct {v0, v1}, Landroid/support/v4/widget/DrawerLayout$LayoutParams;-><init>(Landroid/support/v4/widget/DrawerLayout$LayoutParams;)V

    goto :goto_1f

    :cond_d
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_1a

    new-instance v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    move-object v1, p1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {v0, v1}, Landroid/support/v4/widget/DrawerLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    goto :goto_1f

    :cond_1a
    new-instance v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    invoke-direct {v0, p1}, Landroid/support/v4/widget/DrawerLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    :goto_1f
    return-object v0
.end method

.method public getDrawerElevation()F
    .registers 2

    sget-boolean v0, Landroid/support/v4/widget/DrawerLayout;->SET_DRAWER_SHADOW_FROM_ELEVATION:Z

    if-eqz v0, :cond_7

    iget v0, p0, Landroid/support/v4/widget/DrawerLayout;->mDrawerElevation:F

    return v0

    :cond_7
    const/4 v0, 0x0

    return v0
.end method

.method public getDrawerLockMode(I)I
    .registers 4

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v0

    invoke-static {p1, v0}, Landroid/support/v4/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_e

    iget v1, p0, Landroid/support/v4/widget/DrawerLayout;->mLockModeLeft:I

    return v1

    :cond_e
    const/4 v1, 0x5

    if-ne v0, v1, :cond_14

    iget v1, p0, Landroid/support/v4/widget/DrawerLayout;->mLockModeRight:I

    return v1

    :cond_14
    const/4 v1, 0x0

    return v1
.end method

.method public getDrawerLockMode(Landroid/view/View;)I
    .registers 4

    invoke-virtual {p0, p1}, Landroid/support/v4/widget/DrawerLayout;->getDrawerViewAbsoluteGravity(Landroid/view/View;)I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_a

    iget v1, p0, Landroid/support/v4/widget/DrawerLayout;->mLockModeLeft:I

    return v1

    :cond_a
    const/4 v1, 0x5

    if-ne v0, v1, :cond_10

    iget v1, p0, Landroid/support/v4/widget/DrawerLayout;->mLockModeRight:I

    return v1

    :cond_10
    const/4 v1, 0x0

    return v1
.end method

.method public getDrawerTitle(I)Ljava/lang/CharSequence;
    .registers 4
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v0

    invoke-static {p1, v0}, Landroid/support/v4/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_e

    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mTitleLeft:Ljava/lang/CharSequence;

    return-object v1

    :cond_e
    const/4 v1, 0x5

    if-ne v0, v1, :cond_14

    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mTitleRight:Ljava/lang/CharSequence;

    return-object v1

    :cond_14
    const/4 v1, 0x0

    return-object v1
.end method

.method getDrawerViewAbsoluteGravity(Landroid/view/View;)I
    .registers 4

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    iget v0, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->gravity:I

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v1

    invoke-static {v0, v1}, Landroid/support/v4/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result v1

    return v1
.end method

.method getDrawerViewOffset(Landroid/view/View;)F
    .registers 3

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    iget v0, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    return v0
.end method

.method public getStatusBarBackgroundDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    iget-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mStatusBarBackground:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method isContentView(Landroid/view/View;)Z
    .registers 3

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    iget v0, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->gravity:I

    if-nez v0, :cond_c

    const/4 v0, 0x1

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    :goto_d
    return v0
.end method

.method public isDrawerOpen(I)Z
    .registers 4

    invoke-virtual {p0, p1}, Landroid/support/v4/widget/DrawerLayout;->findDrawerWithGravity(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_b

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/DrawerLayout;->isDrawerOpen(Landroid/view/View;)Z

    move-result v1

    return v1

    :cond_b
    const/4 v1, 0x0

    return v1
.end method

.method public isDrawerOpen(Landroid/view/View;)Z
    .registers 5

    invoke-virtual {p0, p1}, Landroid/support/v4/widget/DrawerLayout;->isDrawerView(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    iget-boolean v0, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->knownOpen:Z

    return v0

    :cond_f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "View "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " is not a drawer"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method isDrawerView(Landroid/view/View;)Z
    .registers 5

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    iget v0, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->gravity:I

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v1

    invoke-static {v0, v1}, Landroid/support/v4/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result v1

    and-int/lit8 v2, v1, 0x7

    if-eqz v2, :cond_16

    const/4 v2, 0x1

    goto :goto_17

    :cond_16
    const/4 v2, 0x0

    :goto_17
    return v2
.end method

.method public isDrawerVisible(I)Z
    .registers 4

    invoke-virtual {p0, p1}, Landroid/support/v4/widget/DrawerLayout;->findDrawerWithGravity(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_b

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/DrawerLayout;->isDrawerVisible(Landroid/view/View;)Z

    move-result v1

    return v1

    :cond_b
    const/4 v1, 0x0

    return v1
.end method

.method public isDrawerVisible(Landroid/view/View;)Z
    .registers 5

    invoke-virtual {p0, p1}, Landroid/support/v4/widget/DrawerLayout;->isDrawerView(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_17

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    iget v0, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_15

    const/4 v0, 0x1

    goto :goto_16

    :cond_15
    const/4 v0, 0x0

    :goto_16
    return v0

    :cond_17
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "View "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " is not a drawer"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method moveDrawerToOffset(Landroid/view/View;F)V
    .registers 9

    invoke-virtual {p0, p1}, Landroid/support/v4/widget/DrawerLayout;->getDrawerViewOffset(Landroid/view/View;)F

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    int-to-float v2, v1

    mul-float/2addr v2, v0

    float-to-int v2, v2

    int-to-float v3, v1

    mul-float/2addr v3, p2

    float-to-int v3, v3

    sub-int v4, v3, v2

    const/4 v5, 0x3

    invoke-virtual {p0, p1, v5}, Landroid/support/v4/widget/DrawerLayout;->checkDrawerViewAbsoluteGravity(Landroid/view/View;I)Z

    move-result v5

    if-eqz v5, :cond_19

    move v5, v4

    goto :goto_1a

    :cond_19
    neg-int v5, v4

    :goto_1a
    invoke-virtual {p1, v5}, Landroid/view/View;->offsetLeftAndRight(I)V

    invoke-virtual {p0, p1, p2}, Landroid/support/v4/widget/DrawerLayout;->setDrawerViewOffset(Landroid/view/View;F)V

    return-void
.end method

.method protected onAttachedToWindow()V
    .registers 2

    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/widget/DrawerLayout;->mFirstLayout:Z

    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/widget/DrawerLayout;->mFirstLayout:Z

    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 6

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onDraw(Landroid/graphics/Canvas;)V

    iget-boolean v0, p0, Landroid/support/v4/widget/DrawerLayout;->mDrawStatusBarBackground:Z

    if-eqz v0, :cond_24

    iget-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mStatusBarBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_24

    sget-object v0, Landroid/support/v4/widget/DrawerLayout;->IMPL:Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;

    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mLastInsets:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;->getTopInset(Ljava/lang/Object;)I

    move-result v0

    if-lez v0, :cond_24

    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mStatusBarBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getWidth()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v3, v2, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mStatusBarBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_24
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 12

    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getActionMasked(Landroid/view/MotionEvent;)I

    move-result v0

    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v1, p1}, Landroid/support/v4/widget/ViewDragHelper;->shouldInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    iget-object v2, p0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v2, p1}, Landroid/support/v4/widget/ViewDragHelper;->shouldInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    or-int/2addr v1, v2

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_70

    goto :goto_5d

    :pswitch_18
    iget-object v5, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    const/4 v6, 0x3

    invoke-virtual {v5, v6}, Landroid/support/v4/widget/ViewDragHelper;->checkTouchSlop(I)Z

    move-result v5

    if-eqz v5, :cond_5d

    iget-object v5, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftCallback:Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

    invoke-virtual {v5}, Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;->removeCallbacks()V

    iget-object v5, p0, Landroid/support/v4/widget/DrawerLayout;->mRightCallback:Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

    invoke-virtual {v5}, Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;->removeCallbacks()V

    goto :goto_5d

    :pswitch_2c
    invoke-virtual {p0, v3}, Landroid/support/v4/widget/DrawerLayout;->closeDrawers(Z)V

    iput-boolean v4, p0, Landroid/support/v4/widget/DrawerLayout;->mDisallowInterceptRequested:Z

    iput-boolean v4, p0, Landroid/support/v4/widget/DrawerLayout;->mChildrenCanceledTouch:Z

    goto :goto_5d

    :pswitch_34
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    iput v5, p0, Landroid/support/v4/widget/DrawerLayout;->mInitialMotionX:F

    iput v6, p0, Landroid/support/v4/widget/DrawerLayout;->mInitialMotionY:F

    iget v7, p0, Landroid/support/v4/widget/DrawerLayout;->mScrimOpacity:F

    const/4 v8, 0x0

    cmpl-float v7, v7, v8

    if-lez v7, :cond_58

    iget-object v7, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    float-to-int v8, v5

    float-to-int v9, v6

    invoke-virtual {v7, v8, v9}, Landroid/support/v4/widget/ViewDragHelper;->findTopChildUnder(II)Landroid/view/View;

    move-result-object v7

    if-eqz v7, :cond_58

    invoke-virtual {p0, v7}, Landroid/support/v4/widget/DrawerLayout;->isContentView(Landroid/view/View;)Z

    move-result v8

    if-eqz v8, :cond_58

    const/4 v2, 0x1

    :cond_58
    iput-boolean v4, p0, Landroid/support/v4/widget/DrawerLayout;->mDisallowInterceptRequested:Z

    iput-boolean v4, p0, Landroid/support/v4/widget/DrawerLayout;->mChildrenCanceledTouch:Z

    nop

    :cond_5d
    :goto_5d
    if-nez v1, :cond_6e

    if-nez v2, :cond_6e

    invoke-direct {p0}, Landroid/support/v4/widget/DrawerLayout;->hasPeekingDrawer()Z

    move-result v5

    if-nez v5, :cond_6e

    iget-boolean v5, p0, Landroid/support/v4/widget/DrawerLayout;->mChildrenCanceledTouch:Z

    if-eqz v5, :cond_6c

    goto :goto_6e

    :cond_6c
    move v3, v4

    nop

    :cond_6e
    :goto_6e
    return v3

    nop

    :pswitch_data_70
    .packed-switch 0x0
        :pswitch_34
        :pswitch_2c
        :pswitch_18
        :pswitch_2c
    .end packed-switch
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 4

    const/4 v0, 0x4

    if-ne p1, v0, :cond_e

    invoke-direct {p0}, Landroid/support/v4/widget/DrawerLayout;->hasVisibleDrawer()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-static {p2}, Landroid/support/v4/view/KeyEventCompat;->startTracking(Landroid/view/KeyEvent;)V

    const/4 v0, 0x1

    return v0

    :cond_e
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 5

    const/4 v0, 0x4

    if-ne p1, v0, :cond_18

    invoke-direct {p0}, Landroid/support/v4/widget/DrawerLayout;->findVisibleDrawer()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_12

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/DrawerLayout;->getDrawerLockMode(Landroid/view/View;)I

    move-result v1

    if-nez v1, :cond_12

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->closeDrawers()V

    :cond_12
    if-eqz v0, :cond_16

    const/4 v1, 0x1

    goto :goto_17

    :cond_16
    const/4 v1, 0x0

    :goto_17
    return v1

    :cond_18
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method protected onLayout(ZIIII)V
    .registers 23

    move-object/from16 v0, p0

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/support/v4/widget/DrawerLayout;->mInLayout:Z

    sub-int v4, p4, p2

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/DrawerLayout;->getChildCount()I

    move-result v5

    const/4 v7, 0x0

    :goto_c
    if-ge v7, v5, :cond_ec

    invoke-virtual {v0, v7}, Landroid/support/v4/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    move-result v9

    const/16 v10, 0x8

    if-ne v9, v10, :cond_20

    nop

    :goto_1b
    move v15, v4

    move/from16 v16, v5

    goto/16 :goto_e4

    :cond_20
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    invoke-virtual {v0, v8}, Landroid/support/v4/widget/DrawerLayout;->isContentView(Landroid/view/View;)Z

    move-result v10

    if-eqz v10, :cond_42

    iget v10, v9, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->leftMargin:I

    iget v11, v9, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->topMargin:I

    iget v12, v9, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->leftMargin:I

    invoke-virtual {v8}, Landroid/view/View;->getMeasuredWidth()I

    move-result v13

    add-int/2addr v12, v13

    iget v13, v9, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->topMargin:I

    invoke-virtual {v8}, Landroid/view/View;->getMeasuredHeight()I

    move-result v14

    add-int/2addr v13, v14

    invoke-virtual {v8, v10, v11, v12, v13}, Landroid/view/View;->layout(IIII)V

    goto :goto_1b

    :cond_42
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    invoke-virtual {v8}, Landroid/view/View;->getMeasuredHeight()I

    move-result v11

    const/4 v12, 0x3

    invoke-virtual {v0, v8, v12}, Landroid/support/v4/widget/DrawerLayout;->checkDrawerViewAbsoluteGravity(Landroid/view/View;I)Z

    move-result v12

    if-eqz v12, :cond_5e

    neg-int v12, v10

    int-to-float v13, v10

    iget v1, v9, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    mul-float/2addr v13, v1

    float-to-int v1, v13

    add-int/2addr v12, v1

    add-int v1, v10, v12

    int-to-float v1, v1

    int-to-float v13, v10

    div-float/2addr v1, v13

    goto :goto_6a

    :cond_5e
    int-to-float v1, v10

    iget v12, v9, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    mul-float/2addr v1, v12

    float-to-int v1, v1

    sub-int v12, v4, v1

    sub-int v1, v4, v12

    int-to-float v1, v1

    int-to-float v13, v10

    div-float/2addr v1, v13

    :goto_6a
    iget v13, v9, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    cmpl-float v13, v1, v13

    if-eqz v13, :cond_72

    const/4 v13, 0x1

    goto :goto_73

    :cond_72
    const/4 v13, 0x0

    :goto_73
    iget v6, v9, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->gravity:I

    and-int/lit8 v6, v6, 0x70

    const/16 v2, 0x10

    if-eq v6, v2, :cond_a6

    const/16 v2, 0x50

    if-eq v6, v2, :cond_8e

    iget v2, v9, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->topMargin:I

    add-int v3, v12, v10

    move v15, v4

    iget v4, v9, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->topMargin:I

    add-int/2addr v4, v11

    invoke-virtual {v8, v12, v2, v3, v4}, Landroid/view/View;->layout(IIII)V

    nop

    move/from16 v16, v5

    goto :goto_cc

    :cond_8e
    move v15, v4

    sub-int v2, p5, p3

    iget v3, v9, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->bottomMargin:I

    sub-int v3, v2, v3

    invoke-virtual {v8}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    sub-int/2addr v3, v4

    add-int v4, v12, v10

    move/from16 v16, v5

    iget v5, v9, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->bottomMargin:I

    sub-int v5, v2, v5

    invoke-virtual {v8, v12, v3, v4, v5}, Landroid/view/View;->layout(IIII)V

    goto :goto_cc

    :cond_a6
    move v15, v4

    move/from16 v16, v5

    sub-int v2, p5, p3

    sub-int v3, v2, v11

    div-int/lit8 v3, v3, 0x2

    iget v4, v9, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->topMargin:I

    if-ge v3, v4, :cond_b6

    iget v3, v9, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->topMargin:I

    goto :goto_c4

    :cond_b6
    add-int v4, v3, v11

    iget v5, v9, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->bottomMargin:I

    sub-int v5, v2, v5

    if-le v4, v5, :cond_c4

    iget v4, v9, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->bottomMargin:I

    sub-int v4, v2, v4

    sub-int v3, v4, v11

    :cond_c4
    :goto_c4
    add-int v4, v12, v10

    add-int v5, v3, v11

    invoke-virtual {v8, v12, v3, v4, v5}, Landroid/view/View;->layout(IIII)V

    nop

    :goto_cc
    if-eqz v13, :cond_d1

    invoke-virtual {v0, v8, v1}, Landroid/support/v4/widget/DrawerLayout;->setDrawerViewOffset(Landroid/view/View;F)V

    :cond_d1
    iget v2, v9, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-lez v2, :cond_da

    const/4 v2, 0x0

    goto :goto_db

    :cond_da
    const/4 v2, 0x4

    :goto_db
    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-eq v3, v2, :cond_e4

    invoke-virtual {v8, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_e4
    :goto_e4
    add-int/lit8 v7, v7, 0x1

    move v4, v15

    move/from16 v5, v16

    const/4 v1, 0x1

    goto/16 :goto_c

    :cond_ec
    move v15, v4

    move/from16 v16, v5

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/support/v4/widget/DrawerLayout;->mInLayout:Z

    iput-boolean v1, v0, Landroid/support/v4/widget/DrawerLayout;->mFirstLayout:Z

    return-void
.end method

.method protected onMeasure(II)V
    .registers 20

    move-object/from16 v0, p0

    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v4

    const/high16 v5, 0x40000000    # 2.0f

    if-ne v1, v5, :cond_18

    if-eq v2, v5, :cond_36

    :cond_18
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/DrawerLayout;->isInEditMode()Z

    move-result v6

    if-eqz v6, :cond_166

    const/high16 v6, -0x80000000

    if-ne v1, v6, :cond_25

    const/high16 v1, 0x40000000    # 2.0f

    goto :goto_2b

    :cond_25
    if-nez v1, :cond_2b

    const/high16 v1, 0x40000000    # 2.0f

    const/16 v3, 0x12c

    :cond_2b
    :goto_2b
    if-ne v2, v6, :cond_30

    const/high16 v2, 0x40000000    # 2.0f

    goto :goto_36

    :cond_30
    if-nez v2, :cond_36

    const/high16 v2, 0x40000000    # 2.0f

    const/16 v4, 0x12c

    :cond_36
    :goto_36
    invoke-virtual {v0, v3, v4}, Landroid/support/v4/widget/DrawerLayout;->setMeasuredDimension(II)V

    iget-object v6, v0, Landroid/support/v4/widget/DrawerLayout;->mLastInsets:Ljava/lang/Object;

    const/4 v7, 0x0

    if-eqz v6, :cond_46

    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/ViewCompat;->getFitsSystemWindows(Landroid/view/View;)Z

    move-result v6

    if-eqz v6, :cond_46

    const/4 v6, 0x1

    goto :goto_47

    :cond_46
    move v6, v7

    :goto_47
    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v8

    const/4 v9, 0x0

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/DrawerLayout;->getChildCount()I

    move-result v10

    nop

    :goto_51
    if-ge v7, v10, :cond_15f

    invoke-virtual {v0, v7}, Landroid/support/v4/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    invoke-virtual {v11}, Landroid/view/View;->getVisibility()I

    move-result v12

    const/16 v13, 0x8

    if-ne v12, v13, :cond_68

    nop

    :goto_60
    move/from16 v5, p1

    move/from16 v16, v1

    move/from16 v1, p2

    goto/16 :goto_f1

    :cond_68
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    check-cast v12, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    if-eqz v6, :cond_8b

    iget v13, v12, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->gravity:I

    invoke-static {v13, v8}, Landroid/support/v4/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result v13

    invoke-static {v11}, Landroid/support/v4/view/ViewCompat;->getFitsSystemWindows(Landroid/view/View;)Z

    move-result v14

    if-eqz v14, :cond_84

    sget-object v14, Landroid/support/v4/widget/DrawerLayout;->IMPL:Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;

    iget-object v15, v0, Landroid/support/v4/widget/DrawerLayout;->mLastInsets:Ljava/lang/Object;

    invoke-interface {v14, v11, v15, v13}, Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;->dispatchChildInsets(Landroid/view/View;Ljava/lang/Object;I)V

    goto :goto_8b

    :cond_84
    sget-object v14, Landroid/support/v4/widget/DrawerLayout;->IMPL:Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;

    iget-object v15, v0, Landroid/support/v4/widget/DrawerLayout;->mLastInsets:Ljava/lang/Object;

    invoke-interface {v14, v12, v15, v13}, Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;->applyMarginInsets(Landroid/view/ViewGroup$MarginLayoutParams;Ljava/lang/Object;I)V

    :cond_8b
    :goto_8b
    invoke-virtual {v0, v11}, Landroid/support/v4/widget/DrawerLayout;->isContentView(Landroid/view/View;)Z

    move-result v13

    if-eqz v13, :cond_ab

    iget v13, v12, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->leftMargin:I

    sub-int v13, v3, v13

    iget v14, v12, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->rightMargin:I

    sub-int/2addr v13, v14

    invoke-static {v13, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v13

    iget v14, v12, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->topMargin:I

    sub-int v14, v4, v14

    iget v15, v12, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->bottomMargin:I

    sub-int/2addr v14, v15

    invoke-static {v14, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v14

    invoke-virtual {v11, v13, v14}, Landroid/view/View;->measure(II)V

    goto :goto_60

    :cond_ab
    invoke-virtual {v0, v11}, Landroid/support/v4/widget/DrawerLayout;->isDrawerView(Landroid/view/View;)Z

    move-result v13

    if-eqz v13, :cond_130

    sget-boolean v13, Landroid/support/v4/widget/DrawerLayout;->SET_DRAWER_SHADOW_FROM_ELEVATION:Z

    if-eqz v13, :cond_c4

    invoke-static {v11}, Landroid/support/v4/view/ViewCompat;->getElevation(Landroid/view/View;)F

    move-result v13

    iget v14, v0, Landroid/support/v4/widget/DrawerLayout;->mDrawerElevation:F

    cmpl-float v13, v13, v14

    if-eqz v13, :cond_c4

    iget v13, v0, Landroid/support/v4/widget/DrawerLayout;->mDrawerElevation:F

    invoke-static {v11, v13}, Landroid/support/v4/view/ViewCompat;->setElevation(Landroid/view/View;F)V

    :cond_c4
    invoke-virtual {v0, v11}, Landroid/support/v4/widget/DrawerLayout;->getDrawerViewAbsoluteGravity(Landroid/view/View;)I

    move-result v13

    and-int/lit8 v13, v13, 0x7

    and-int v14, v9, v13

    if-nez v14, :cond_fb

    iget v14, v0, Landroid/support/v4/widget/DrawerLayout;->mMinDrawerMargin:I

    iget v15, v12, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->leftMargin:I

    add-int/2addr v14, v15

    iget v15, v12, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->rightMargin:I

    add-int/2addr v14, v15

    iget v15, v12, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->width:I

    move/from16 v5, p1

    invoke-static {v5, v14, v15}, Landroid/support/v4/widget/DrawerLayout;->getChildMeasureSpec(III)I

    move-result v14

    iget v15, v12, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->topMargin:I

    iget v0, v12, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v15, v0

    iget v0, v12, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->height:I

    move/from16 v16, v1

    move/from16 v1, p2

    invoke-static {v1, v15, v0}, Landroid/support/v4/widget/DrawerLayout;->getChildMeasureSpec(III)I

    move-result v0

    invoke-virtual {v11, v14, v0}, Landroid/view/View;->measure(II)V

    nop

    :goto_f1
    add-int/lit8 v7, v7, 0x1

    move/from16 v1, v16

    move-object/from16 v0, p0

    const/high16 v5, 0x40000000    # 2.0f

    goto/16 :goto_51

    :cond_fb
    move/from16 v5, p1

    move/from16 v16, v1

    move/from16 v1, p2

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Child drawer has absolute gravity "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v13}, Landroid/support/v4/widget/DrawerLayout;->gravityToString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v15, " but this "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v15, "DrawerLayout"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v15, " already has a "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v15, "drawer view along that edge"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v0, v14}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_130
    move/from16 v5, p1

    move/from16 v16, v1

    move/from16 v1, p2

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Child "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v14, " at index "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v14, " does not have a valid layout_gravity - must be Gravity.LEFT, "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v14, "Gravity.RIGHT or Gravity.NO_GRAVITY"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v0, v13}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_15f
    move/from16 v5, p1

    move/from16 v16, v1

    move/from16 v1, p2

    return-void

    :cond_166
    move/from16 v5, p1

    move v0, v1

    move/from16 v1, p2

    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "DrawerLayout must be measured with MeasureSpec.EXACTLY."

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5

    move-object v0, p1

    check-cast v0, Landroid/support/v4/widget/DrawerLayout$SavedState;

    invoke-virtual {v0}, Landroid/support/v4/widget/DrawerLayout$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    iget v1, v0, Landroid/support/v4/widget/DrawerLayout$SavedState;->openDrawerGravity:I

    if-eqz v1, :cond_19

    iget v1, v0, Landroid/support/v4/widget/DrawerLayout$SavedState;->openDrawerGravity:I

    invoke-virtual {p0, v1}, Landroid/support/v4/widget/DrawerLayout;->findDrawerWithGravity(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_19

    invoke-virtual {p0, v1}, Landroid/support/v4/widget/DrawerLayout;->openDrawer(Landroid/view/View;)V

    :cond_19
    iget v1, v0, Landroid/support/v4/widget/DrawerLayout$SavedState;->lockModeLeft:I

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2}, Landroid/support/v4/widget/DrawerLayout;->setDrawerLockMode(II)V

    iget v1, v0, Landroid/support/v4/widget/DrawerLayout$SavedState;->lockModeRight:I

    const/4 v2, 0x5

    invoke-virtual {p0, v1, v2}, Landroid/support/v4/widget/DrawerLayout;->setDrawerLockMode(II)V

    return-void
.end method

.method public onRtlPropertiesChanged(I)V
    .registers 2

    invoke-direct {p0}, Landroid/support/v4/widget/DrawerLayout;->resolveShadowDrawables()V

    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 5

    invoke-super {p0}, Landroid/view/ViewGroup;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    new-instance v1, Landroid/support/v4/widget/DrawerLayout$SavedState;

    invoke-direct {v1, v0}, Landroid/support/v4/widget/DrawerLayout$SavedState;-><init>(Landroid/os/Parcelable;)V

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->findOpenDrawer()Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_19

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    iget v3, v3, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->gravity:I

    iput v3, v1, Landroid/support/v4/widget/DrawerLayout$SavedState;->openDrawerGravity:I

    :cond_19
    iget v3, p0, Landroid/support/v4/widget/DrawerLayout;->mLockModeLeft:I

    iput v3, v1, Landroid/support/v4/widget/DrawerLayout$SavedState;->lockModeLeft:I

    iget v3, p0, Landroid/support/v4/widget/DrawerLayout;->mLockModeRight:I

    iput v3, v1, Landroid/support/v4/widget/DrawerLayout$SavedState;->lockModeRight:I

    return-object v1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 16

    iget-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v0, p1}, Landroid/support/v4/widget/ViewDragHelper;->processTouchEvent(Landroid/view/MotionEvent;)V

    iget-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v0, p1}, Landroid/support/v4/widget/ViewDragHelper;->processTouchEvent(Landroid/view/MotionEvent;)V

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    and-int/lit16 v2, v0, 0xff

    const/4 v3, 0x3

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eq v2, v3, :cond_74

    packed-switch v2, :pswitch_data_7c

    goto :goto_7b

    :pswitch_1a
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    const/4 v6, 0x1

    iget-object v7, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    float-to-int v8, v2

    float-to-int v9, v3

    invoke-virtual {v7, v8, v9}, Landroid/support/v4/widget/ViewDragHelper;->findTopChildUnder(II)Landroid/view/View;

    move-result-object v7

    if-eqz v7, :cond_5d

    invoke-virtual {p0, v7}, Landroid/support/v4/widget/DrawerLayout;->isContentView(Landroid/view/View;)Z

    move-result v8

    if-eqz v8, :cond_5d

    iget v8, p0, Landroid/support/v4/widget/DrawerLayout;->mInitialMotionX:F

    sub-float v8, v2, v8

    iget v9, p0, Landroid/support/v4/widget/DrawerLayout;->mInitialMotionY:F

    sub-float v9, v3, v9

    iget-object v10, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v10}, Landroid/support/v4/widget/ViewDragHelper;->getTouchSlop()I

    move-result v10

    mul-float v11, v8, v8

    mul-float v12, v9, v9

    add-float/2addr v11, v12

    mul-int v12, v10, v10

    int-to-float v12, v12

    cmpg-float v11, v11, v12

    if-gez v11, :cond_5d

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->findOpenDrawer()Landroid/view/View;

    move-result-object v11

    if-eqz v11, :cond_5d

    invoke-virtual {p0, v11}, Landroid/support/v4/widget/DrawerLayout;->getDrawerLockMode(Landroid/view/View;)I

    move-result v12

    const/4 v13, 0x2

    if-ne v12, v13, :cond_5b

    goto :goto_5c

    :cond_5b
    move v4, v5

    :goto_5c
    move v6, v4

    :cond_5d
    invoke-virtual {p0, v6}, Landroid/support/v4/widget/DrawerLayout;->closeDrawers(Z)V

    iput-boolean v5, p0, Landroid/support/v4/widget/DrawerLayout;->mDisallowInterceptRequested:Z

    goto :goto_7b

    :pswitch_63
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    iput v2, p0, Landroid/support/v4/widget/DrawerLayout;->mInitialMotionX:F

    iput v3, p0, Landroid/support/v4/widget/DrawerLayout;->mInitialMotionY:F

    iput-boolean v5, p0, Landroid/support/v4/widget/DrawerLayout;->mDisallowInterceptRequested:Z

    iput-boolean v5, p0, Landroid/support/v4/widget/DrawerLayout;->mChildrenCanceledTouch:Z

    goto :goto_7b

    :cond_74
    invoke-virtual {p0, v4}, Landroid/support/v4/widget/DrawerLayout;->closeDrawers(Z)V

    iput-boolean v5, p0, Landroid/support/v4/widget/DrawerLayout;->mDisallowInterceptRequested:Z

    iput-boolean v5, p0, Landroid/support/v4/widget/DrawerLayout;->mChildrenCanceledTouch:Z

    :goto_7b
    return v1

    :pswitch_data_7c
    .packed-switch 0x0
        :pswitch_63
        :pswitch_1a
    .end packed-switch
.end method

.method public openDrawer(I)V
    .registers 6

    invoke-virtual {p0, p1}, Landroid/support/v4/widget/DrawerLayout;->findDrawerWithGravity(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_a

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/DrawerLayout;->openDrawer(Landroid/view/View;)V

    return-void

    :cond_a
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No drawer view found with gravity "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Landroid/support/v4/widget/DrawerLayout;->gravityToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public openDrawer(Landroid/view/View;)V
    .registers 5

    invoke-virtual {p0, p1}, Landroid/support/v4/widget/DrawerLayout;->isDrawerView(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_43

    iget-boolean v0, p0, Landroid/support/v4/widget/DrawerLayout;->mFirstLayout:Z

    if-eqz v0, :cond_1b

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->knownOpen:Z

    invoke-direct {p0, p1, v1}, Landroid/support/v4/widget/DrawerLayout;->updateChildrenImportantForAccessibility(Landroid/view/View;Z)V

    goto :goto_3f

    :cond_1b
    const/4 v0, 0x3

    invoke-virtual {p0, p1, v0}, Landroid/support/v4/widget/DrawerLayout;->checkDrawerViewAbsoluteGravity(Landroid/view/View;I)Z

    move-result v0

    if-eqz v0, :cond_2d

    iget-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    const/4 v1, 0x0

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v2

    invoke-virtual {v0, p1, v1, v2}, Landroid/support/v4/widget/ViewDragHelper;->smoothSlideViewTo(Landroid/view/View;II)Z

    goto :goto_3f

    :cond_2d
    iget-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v2

    invoke-virtual {v0, p1, v1, v2}, Landroid/support/v4/widget/ViewDragHelper;->smoothSlideViewTo(Landroid/view/View;II)Z

    :goto_3f
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->invalidate()V

    return-void

    :cond_43
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "View "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " is not a sliding drawer"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .registers 3

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    iput-boolean p1, p0, Landroid/support/v4/widget/DrawerLayout;->mDisallowInterceptRequested:Z

    if-eqz p1, :cond_b

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/DrawerLayout;->closeDrawers(Z)V

    :cond_b
    return-void
.end method

.method public requestLayout()V
    .registers 2

    iget-boolean v0, p0, Landroid/support/v4/widget/DrawerLayout;->mInLayout:Z

    if-nez v0, :cond_7

    invoke-super {p0}, Landroid/view/ViewGroup;->requestLayout()V

    :cond_7
    return-void
.end method

.method public setChildInsets(Ljava/lang/Object;Z)V
    .registers 4

    iput-object p1, p0, Landroid/support/v4/widget/DrawerLayout;->mLastInsets:Ljava/lang/Object;

    iput-boolean p2, p0, Landroid/support/v4/widget/DrawerLayout;->mDrawStatusBarBackground:Z

    if-nez p2, :cond_e

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_e

    const/4 v0, 0x1

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    :goto_f
    invoke-virtual {p0, v0}, Landroid/support/v4/widget/DrawerLayout;->setWillNotDraw(Z)V

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->requestLayout()V

    return-void
.end method

.method public setDrawerElevation(F)V
    .registers 5

    iput p1, p0, Landroid/support/v4/widget/DrawerLayout;->mDrawerElevation:F

    const/4 v0, 0x0

    :goto_3
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1b

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/support/v4/widget/DrawerLayout;->isDrawerView(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_18

    iget v2, p0, Landroid/support/v4/widget/DrawerLayout;->mDrawerElevation:F

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewCompat;->setElevation(Landroid/view/View;F)V

    :cond_18
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_1b
    return-void
.end method

.method public setDrawerListener(Landroid/support/v4/widget/DrawerLayout$DrawerListener;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v4/widget/DrawerLayout;->mListener:Landroid/support/v4/widget/DrawerLayout$DrawerListener;

    return-void
.end method

.method public setDrawerLockMode(I)V
    .registers 3

    const/4 v0, 0x3

    invoke-virtual {p0, p1, v0}, Landroid/support/v4/widget/DrawerLayout;->setDrawerLockMode(II)V

    const/4 v0, 0x5

    invoke-virtual {p0, p1, v0}, Landroid/support/v4/widget/DrawerLayout;->setDrawerLockMode(II)V

    return-void
.end method

.method public setDrawerLockMode(II)V
    .registers 6

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v0

    invoke-static {p2, v0}, Landroid/support/v4/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_e

    iput p1, p0, Landroid/support/v4/widget/DrawerLayout;->mLockModeLeft:I

    goto :goto_13

    :cond_e
    const/4 v2, 0x5

    if-ne v0, v2, :cond_13

    iput p1, p0, Landroid/support/v4/widget/DrawerLayout;->mLockModeRight:I

    :cond_13
    :goto_13
    if-eqz p1, :cond_20

    if-ne v0, v1, :cond_1a

    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    goto :goto_1c

    :cond_1a
    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    :goto_1c
    invoke-virtual {v1}, Landroid/support/v4/widget/ViewDragHelper;->cancel()V

    goto :goto_21

    :cond_20
    const/4 v1, 0x0

    :goto_21
    packed-switch p1, :pswitch_data_3a

    goto :goto_38

    :pswitch_25
    invoke-virtual {p0, v0}, Landroid/support/v4/widget/DrawerLayout;->findDrawerWithGravity(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_38

    invoke-virtual {p0, v1}, Landroid/support/v4/widget/DrawerLayout;->openDrawer(Landroid/view/View;)V

    goto :goto_38

    :pswitch_2f
    invoke-virtual {p0, v0}, Landroid/support/v4/widget/DrawerLayout;->findDrawerWithGravity(I)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_38

    invoke-virtual {p0, v2}, Landroid/support/v4/widget/DrawerLayout;->closeDrawer(Landroid/view/View;)V

    :cond_38
    :goto_38
    return-void

    nop

    :pswitch_data_3a
    .packed-switch 0x1
        :pswitch_2f
        :pswitch_25
    .end packed-switch
.end method

.method public setDrawerLockMode(ILandroid/view/View;)V
    .registers 6

    invoke-virtual {p0, p2}, Landroid/support/v4/widget/DrawerLayout;->isDrawerView(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    iget v0, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->gravity:I

    invoke-virtual {p0, p1, v0}, Landroid/support/v4/widget/DrawerLayout;->setDrawerLockMode(II)V

    return-void

    :cond_12
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "View "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " is not a "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "drawer with appropriate layout_gravity"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setDrawerShadow(II)V
    .registers 4
    .param p1    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Landroid/support/v4/widget/DrawerLayout;->setDrawerShadow(Landroid/graphics/drawable/Drawable;I)V

    return-void
.end method

.method public setDrawerShadow(Landroid/graphics/drawable/Drawable;I)V
    .registers 5

    sget-boolean v0, Landroid/support/v4/widget/DrawerLayout;->SET_DRAWER_SHADOW_FROM_ELEVATION:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const v0, 0x800003

    and-int v1, p2, v0

    if-ne v1, v0, :cond_f

    iput-object p1, p0, Landroid/support/v4/widget/DrawerLayout;->mShadowStart:Landroid/graphics/drawable/Drawable;

    goto :goto_28

    :cond_f
    const v0, 0x800005

    and-int v1, p2, v0

    if-ne v1, v0, :cond_19

    iput-object p1, p0, Landroid/support/v4/widget/DrawerLayout;->mShadowEnd:Landroid/graphics/drawable/Drawable;

    goto :goto_28

    :cond_19
    and-int/lit8 v0, p2, 0x3

    const/4 v1, 0x3

    if-ne v0, v1, :cond_21

    iput-object p1, p0, Landroid/support/v4/widget/DrawerLayout;->mShadowLeft:Landroid/graphics/drawable/Drawable;

    goto :goto_28

    :cond_21
    and-int/lit8 v0, p2, 0x5

    const/4 v1, 0x5

    if-ne v0, v1, :cond_2f

    iput-object p1, p0, Landroid/support/v4/widget/DrawerLayout;->mShadowRight:Landroid/graphics/drawable/Drawable;

    :goto_28
    invoke-direct {p0}, Landroid/support/v4/widget/DrawerLayout;->resolveShadowDrawables()V

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->invalidate()V

    return-void

    :cond_2f
    return-void
.end method

.method public setDrawerTitle(ILjava/lang/CharSequence;)V
    .registers 5

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v0

    invoke-static {p1, v0}, Landroid/support/v4/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_e

    iput-object p2, p0, Landroid/support/v4/widget/DrawerLayout;->mTitleLeft:Ljava/lang/CharSequence;

    goto :goto_13

    :cond_e
    const/4 v1, 0x5

    if-ne v0, v1, :cond_13

    iput-object p2, p0, Landroid/support/v4/widget/DrawerLayout;->mTitleRight:Ljava/lang/CharSequence;

    :cond_13
    :goto_13
    return-void
.end method

.method setDrawerViewOffset(Landroid/view/View;F)V
    .registers 5

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    iget v1, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    cmpl-float v1, p2, v1

    if-nez v1, :cond_d

    return-void

    :cond_d
    iput p2, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    invoke-virtual {p0, p1, p2}, Landroid/support/v4/widget/DrawerLayout;->dispatchOnDrawerSlide(Landroid/view/View;F)V

    return-void
.end method

.method public setScrimColor(I)V
    .registers 2
    .param p1    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    iput p1, p0, Landroid/support/v4/widget/DrawerLayout;->mScrimColor:I

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->invalidate()V

    return-void
.end method

.method public setStatusBarBackground(I)V
    .registers 3

    if-eqz p1, :cond_b

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    iput-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mStatusBarBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->invalidate()V

    return-void
.end method

.method public setStatusBarBackground(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v4/widget/DrawerLayout;->mStatusBarBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->invalidate()V

    return-void
.end method

.method public setStatusBarBackgroundColor(I)V
    .registers 3
    .param p1    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mStatusBarBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->invalidate()V

    return-void
.end method

.method updateDrawerState(IILandroid/view/View;)V
    .registers 10

    iget-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v0}, Landroid/support/v4/widget/ViewDragHelper;->getViewDragState()I

    move-result v0

    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v1}, Landroid/support/v4/widget/ViewDragHelper;->getViewDragState()I

    move-result v1

    const/4 v2, 0x1

    if-eq v0, v2, :cond_1c

    if-ne v1, v2, :cond_12

    goto :goto_1c

    :cond_12
    const/4 v2, 0x2

    if-eq v0, v2, :cond_1a

    if-ne v1, v2, :cond_18

    goto :goto_1a

    :cond_18
    const/4 v2, 0x0

    goto :goto_1d

    :cond_1a
    :goto_1a
    const/4 v2, 0x2

    goto :goto_1d

    :cond_1c
    :goto_1c
    const/4 v2, 0x1

    :goto_1d
    nop

    if-eqz p3, :cond_3e

    if-nez p2, :cond_3e

    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    iget v4, v3, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    const/4 v5, 0x0

    cmpl-float v4, v4, v5

    if-nez v4, :cond_33

    invoke-virtual {p0, p3}, Landroid/support/v4/widget/DrawerLayout;->dispatchOnDrawerClosed(Landroid/view/View;)V

    goto :goto_3e

    :cond_33
    iget v4, v3, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    const/high16 v5, 0x3f800000    # 1.0f

    cmpl-float v4, v4, v5

    if-nez v4, :cond_3e

    invoke-virtual {p0, p3}, Landroid/support/v4/widget/DrawerLayout;->dispatchOnDrawerOpened(Landroid/view/View;)V

    :cond_3e
    :goto_3e
    iget v3, p0, Landroid/support/v4/widget/DrawerLayout;->mDrawerState:I

    if-eq v2, v3, :cond_4d

    iput v2, p0, Landroid/support/v4/widget/DrawerLayout;->mDrawerState:I

    iget-object v3, p0, Landroid/support/v4/widget/DrawerLayout;->mListener:Landroid/support/v4/widget/DrawerLayout$DrawerListener;

    if-eqz v3, :cond_4d

    iget-object v3, p0, Landroid/support/v4/widget/DrawerLayout;->mListener:Landroid/support/v4/widget/DrawerLayout$DrawerListener;

    invoke-interface {v3, v2}, Landroid/support/v4/widget/DrawerLayout$DrawerListener;->onDrawerStateChanged(I)V

    :cond_4d
    return-void
.end method
