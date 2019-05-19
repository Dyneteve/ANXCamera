.class public Lcom/android/camera/ui/ToggleSwitch;
.super Landroid/widget/CompoundButton;
.source "ToggleSwitch.java"

# interfaces
.implements Landroid/widget/Checkable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/ToggleSwitch$OnCheckedChangeListener;,
        Lcom/android/camera/ui/ToggleSwitch$State;
    }
.end annotation


# static fields
.field private static final DEFAULT_ANIMATION_DURATION:I = 0x12c

.field private static final DEFAULT_HEIGHT:I = 0x1c

.field private static final DEFAULT_SHADOW_RADIUS:F = 1.33f

.field private static final DEFAULT_STROKE_WIDTH:I = 0x1

.field private static final DEFAULT_SWITCH_BACKGROUND_COLOR:I = -0x78000000

.field private static final DEFAULT_SWITCH_STROKE_COLOR:I = -0x4c000001

.field private static final DEFAULT_TEXT_OFF_COLOR:I = -0x4c000001

.field private static final DEFAULT_TEXT_OFF_SHADOW_COLOR:I = -0x41000000

.field private static final DEFAULT_TEXT_ON_COLOR:I = -0x1

.field private static final DEFAULT_TEXT_SIZE:I = 0x30

.field private static final DEFAULT_THUMB_COLOR:I = -0xcc5501

.field private static final DEFAULT_THUMB_PADDING:I = 0x2

.field private static final DEFAULT_THUMB_SHADOW_COLOR:I = 0x4d000000

.field private static final DEFAULT_WIDTH:I = 0x36

.field private static final SWITCH_OFF_POS:I = 0x0

.field private static final SWITCH_ON_POS:I = 0x1

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private isMoving:Z

.field private mAnimDuration:I

.field private mBroadcasting:Z

.field private mChecked:Z

.field private mCurrentPos:F

.field private mOnCheckedChangeListener:Lcom/android/camera/ui/ToggleSwitch$OnCheckedChangeListener;

.field private mStrokeWidth:I

.field private mSwitchBackgroundColor:I

.field private mSwitchBackgroundStrokeColor:I

.field private mTextOff:Ljava/lang/String;

.field private mTextOffColor:I

.field private mTextOffShadowColor:I

.field private mTextOffShadowRadius:F

.field private mTextOffWidth:I

.field private mTextOn:Ljava/lang/String;

.field private mTextOnColor:I

.field private mTextOnWidth:I

.field private mTextSize:I

.field private mThumbColor:I

.field private mThumbPadding:I

.field private mThumbShadowColor:I

.field private mThumbShadowRadius:F

.field private mValueAnimator:Landroid/animation/ValueAnimator;

.field private state:Lcom/android/camera/ui/ToggleSwitch$State;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/ui/ToggleSwitch;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/ui/ToggleSwitch;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/widget/CompoundButton;-><init>(Landroid/content/Context;)V

    const-string p1, "ON"

    iput-object p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOn:Ljava/lang/String;

    const-string p1, "OFF"

    iput-object p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOff:Ljava/lang/String;

    const/high16 p1, -0x78000000

    iput p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mSwitchBackgroundColor:I

    const p1, -0x4c000001

    iput p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mSwitchBackgroundStrokeColor:I

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/ToggleSwitch;->dp2px(F)I

    move-result p1

    iput p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mStrokeWidth:I

    const p1, -0xcc5501

    iput p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mThumbColor:I

    const/high16 p1, 0x4d000000    # 1.34217728E8f

    iput p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mThumbShadowColor:I

    const p1, 0x3faa3d71    # 1.33f

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/ToggleSwitch;->dp2pxFloat(F)F

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mThumbShadowRadius:F

    const/high16 v0, -0x41000000    # -0.5f

    iput v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOffShadowColor:I

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/ToggleSwitch;->dp2pxFloat(F)F

    move-result p1

    iput p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOffShadowRadius:F

    const/high16 p1, 0x40000000    # 2.0f

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/ToggleSwitch;->dp2px(F)I

    move-result p1

    iput p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mThumbPadding:I

    const/16 p1, 0x12c

    iput p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mAnimDuration:I

    iget-boolean p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mChecked:Z

    if-eqz p1, :cond_0

    sget-object p1, Lcom/android/camera/ui/ToggleSwitch$State;->SWITCH_ON:Lcom/android/camera/ui/ToggleSwitch$State;

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/android/camera/ui/ToggleSwitch$State;->SWITCH_OFF:Lcom/android/camera/ui/ToggleSwitch$State;

    :goto_0
    iput-object p1, p0, Lcom/android/camera/ui/ToggleSwitch;->state:Lcom/android/camera/ui/ToggleSwitch$State;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/ToggleSwitch;->setClickable(Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5

    invoke-direct {p0, p1, p2}, Landroid/widget/CompoundButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const-string v0, "ON"

    iput-object v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOn:Ljava/lang/String;

    const-string v0, "OFF"

    iput-object v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOff:Ljava/lang/String;

    sget-object v0, Lcom/android/camera/R$styleable;->ToggleSwitch:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x0

    const/high16 v0, -0x78000000

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mSwitchBackgroundColor:I

    const v0, -0x4c000001

    const/4 v1, 0x1

    invoke-virtual {p1, v1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/android/camera/ui/ToggleSwitch;->mSwitchBackgroundStrokeColor:I

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {p0, v2}, Lcom/android/camera/ui/ToggleSwitch;->dp2px(F)I

    move-result v2

    const/4 v3, 0x2

    invoke-virtual {p1, v3, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/android/camera/ui/ToggleSwitch;->mStrokeWidth:I

    const/4 v2, 0x4

    const v3, -0xcc5501

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/android/camera/ui/ToggleSwitch;->mThumbColor:I

    const/4 v2, 0x5

    const/high16 v3, 0x4d000000    # 1.34217728E8f

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/android/camera/ui/ToggleSwitch;->mThumbShadowColor:I

    const v2, 0x3faa3d71    # 1.33f

    invoke-virtual {p0, v2}, Lcom/android/camera/ui/ToggleSwitch;->dp2pxFloat(F)F

    move-result v3

    const/4 v4, 0x6

    invoke-virtual {p1, v4, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v3

    iput v3, p0, Lcom/android/camera/ui/ToggleSwitch;->mThumbShadowRadius:F

    const/high16 v3, 0x40000000    # 2.0f

    invoke-virtual {p0, v3}, Lcom/android/camera/ui/ToggleSwitch;->dp2px(F)I

    move-result v3

    const/4 v4, 0x3

    invoke-virtual {p1, v4, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    iput v3, p0, Lcom/android/camera/ui/ToggleSwitch;->mThumbPadding:I

    const/4 v3, 0x7

    invoke-virtual {p1, v3}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOn:Ljava/lang/String;

    const/16 v3, 0x9

    invoke-virtual {p1, v3}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOff:Ljava/lang/String;

    const/16 v3, 0x8

    const/4 v4, -0x1

    invoke-virtual {p1, v3, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    iput v3, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOnColor:I

    const/16 v3, 0xa

    invoke-virtual {p1, v3, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOffColor:I

    const/16 v0, 0xb

    const/high16 v3, -0x41000000    # -0.5f

    invoke-virtual {p1, v0, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOffShadowColor:I

    invoke-virtual {p0, v2}, Lcom/android/camera/ui/ToggleSwitch;->dp2pxFloat(F)F

    move-result v0

    const/16 v2, 0xd

    invoke-virtual {p1, v2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOffShadowRadius:F

    const/16 v0, 0xc

    const/16 v2, 0x30

    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextSize:I

    const/16 v0, 0xe

    const/16 v2, 0x12c

    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mAnimDuration:I

    const/16 v0, 0xf

    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/android/camera/ui/ToggleSwitch;->mChecked:Z

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    invoke-direct {p0}, Lcom/android/camera/ui/ToggleSwitch;->caculateTextWidth()V

    iget-boolean p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mChecked:Z

    if-eqz p1, :cond_0

    sget-object p1, Lcom/android/camera/ui/ToggleSwitch$State;->SWITCH_ON:Lcom/android/camera/ui/ToggleSwitch$State;

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/android/camera/ui/ToggleSwitch$State;->SWITCH_OFF:Lcom/android/camera/ui/ToggleSwitch$State;

    :goto_0
    iput-object p1, p0, Lcom/android/camera/ui/ToggleSwitch;->state:Lcom/android/camera/ui/ToggleSwitch$State;

    invoke-virtual {p0, v1}, Lcom/android/camera/ui/ToggleSwitch;->setClickable(Z)V

    return-void
.end method

.method static synthetic access$002(Lcom/android/camera/ui/ToggleSwitch;F)F
    .locals 0

    iput p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mCurrentPos:F

    return p1
.end method

.method static synthetic access$102(Lcom/android/camera/ui/ToggleSwitch;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/ui/ToggleSwitch;->isMoving:Z

    return p1
.end method

.method private animateToCheckedState()V
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mValueAnimator:Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mValueAnimator:Landroid/animation/ValueAnimator;

    iget v1, p0, Lcom/android/camera/ui/ToggleSwitch;->mAnimDuration:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mValueAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lmiui/view/animation/QuarticEaseInOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/QuarticEaseInOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mValueAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/camera/ui/ToggleSwitch$1;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/ToggleSwitch$1;-><init>(Lcom/android/camera/ui/ToggleSwitch;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mValueAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/camera/ui/ToggleSwitch$2;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/ToggleSwitch$2;-><init>(Lcom/android/camera/ui/ToggleSwitch;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mValueAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mValueAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mCurrentPos:F

    :cond_0
    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private caculateTextWidth()V
    .locals 6

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    iget v3, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextSize:I

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v3, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOn:Ljava/lang/String;

    iget-object v4, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOn:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v5, v4, v0}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    iget-object v3, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOff:Ljava/lang/String;

    iget-object v4, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOff:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v2, v3, v5, v4, v1}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOnWidth:I

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOffWidth:I

    return-void
.end method

.method private cancelPositionAnimator()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mValueAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mValueAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_0
    return-void
.end method

.method private compBackgroundRoundRectAttr()[F
    .locals 6

    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->getHeight()I

    move-result v1

    nop

    int-to-float v0, v0

    const/4 v2, 0x0

    sub-float/2addr v0, v2

    nop

    int-to-float v1, v1

    sub-float/2addr v1, v2

    sub-float v3, v1, v2

    const/high16 v4, 0x3f000000    # 0.5f

    mul-float/2addr v3, v4

    const/4 v4, 0x5

    new-array v4, v4, [F

    const/4 v5, 0x0

    aput v2, v4, v5

    const/4 v5, 0x1

    aput v2, v4, v5

    const/4 v2, 0x2

    aput v0, v4, v2

    const/4 v0, 0x3

    aput v1, v4, v0

    const/4 v0, 0x4

    aput v3, v4, v0

    return-object v4
.end method

.method private compThumbRoundRectAttr(F)[F
    .locals 7

    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->getHeight()I

    move-result v1

    iget v2, p0, Lcom/android/camera/ui/ToggleSwitch;->mThumbPadding:I

    const/4 v3, 0x2

    mul-int/2addr v2, v3

    sub-int/2addr v1, v2

    iget v2, p0, Lcom/android/camera/ui/ToggleSwitch;->mThumbPadding:I

    iget v4, p0, Lcom/android/camera/ui/ToggleSwitch;->mStrokeWidth:I

    add-int/2addr v2, v4

    int-to-float v2, v2

    const/high16 v4, 0x3f800000    # 1.0f

    sub-float/2addr v4, p1

    mul-float/2addr v2, v4

    int-to-float v0, v0

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v0, v4

    iget v5, p0, Lcom/android/camera/ui/ToggleSwitch;->mThumbPadding:I

    int-to-float v5, v5

    div-float/2addr v5, v4

    add-float/2addr v5, v0

    mul-float/2addr v5, p1

    add-float/2addr v2, v5

    iget p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mStrokeWidth:I

    int-to-float p1, p1

    sub-float/2addr v0, p1

    iget p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mThumbPadding:I

    int-to-float p1, p1

    const/high16 v5, 0x40400000    # 3.0f

    mul-float/2addr p1, v5

    div-float/2addr p1, v4

    sub-float/2addr v0, p1

    add-float/2addr v0, v2

    iget p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mThumbPadding:I

    iget v4, p0, Lcom/android/camera/ui/ToggleSwitch;->mStrokeWidth:I

    add-int/2addr p1, v4

    int-to-float p1, p1

    int-to-float v1, v1

    add-float/2addr v1, p1

    iget v4, p0, Lcom/android/camera/ui/ToggleSwitch;->mStrokeWidth:I

    mul-int/2addr v4, v3

    int-to-float v4, v4

    sub-float/2addr v1, v4

    sub-float v4, v1, p1

    const/high16 v5, 0x3f000000    # 0.5f

    mul-float/2addr v4, v5

    const/4 v5, 0x5

    new-array v5, v5, [F

    const/4 v6, 0x0

    aput v2, v5, v6

    const/4 v2, 0x1

    aput p1, v5, v2

    aput v0, v5, v3

    const/4 p1, 0x3

    aput v1, v5, p1

    const/4 p1, 0x4

    aput v4, v5, p1

    return-object v5
.end method

.method private drawRoundRect(Landroid/graphics/Canvas;I[FZ)V
    .locals 4

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    sget-object v2, Landroid/graphics/Paint$Cap;->SQUARE:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setColor(I)V

    if-eqz p4, :cond_0

    iget p2, p0, Lcom/android/camera/ui/ToggleSwitch;->mThumbShadowRadius:F

    iget p4, p0, Lcom/android/camera/ui/ToggleSwitch;->mThumbShadowColor:I

    const/4 v3, 0x0

    invoke-virtual {v0, p2, v3, v3, p4}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    :cond_0
    const/4 p2, 0x0

    aget p2, p3, p2

    aget p4, p3, v1

    const/4 v1, 0x2

    aget v1, p3, v1

    const/4 v3, 0x3

    aget v3, p3, v3

    invoke-virtual {v2, p2, p4, v1, v3}, Landroid/graphics/RectF;->set(FFFF)V

    const/4 p2, 0x4

    aget p4, p3, p2

    aget p2, p3, p2

    invoke-virtual {p1, v2, p4, p2, v0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method private drawRoundRectStroke(Landroid/graphics/Canvas;I)V
    .locals 7

    iget v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mStrokeWidth:I

    if-gtz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->getHeight()I

    move-result v1

    iget v2, p0, Lcom/android/camera/ui/ToggleSwitch;->mStrokeWidth:I

    int-to-float v2, v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    int-to-float v0, v0

    sub-float/2addr v0, v2

    iget v4, p0, Lcom/android/camera/ui/ToggleSwitch;->mStrokeWidth:I

    int-to-float v4, v4

    div-float/2addr v4, v3

    int-to-float v1, v1

    sub-float/2addr v1, v4

    sub-float v3, v1, v4

    const/high16 v5, 0x3f000000    # 0.5f

    mul-float/2addr v3, v5

    new-instance v5, Landroid/graphics/Paint;

    const/4 v6, 0x1

    invoke-direct {v5, v6}, Landroid/graphics/Paint;-><init>(I)V

    sget-object v6, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v5, p2}, Landroid/graphics/Paint;->setColor(I)V

    iget p2, p0, Lcom/android/camera/ui/ToggleSwitch;->mStrokeWidth:I

    int-to-float p2, p2

    invoke-virtual {v5, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    new-instance p2, Landroid/graphics/RectF;

    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    invoke-virtual {p2, v2, v4, v0, v1}, Landroid/graphics/RectF;->set(FFFF)V

    invoke-virtual {p1, p2, v3, v3, v5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method private drawSwitchOff(Landroid/graphics/Canvas;)V
    .locals 3

    invoke-direct {p0}, Lcom/android/camera/ui/ToggleSwitch;->compBackgroundRoundRectAttr()[F

    move-result-object v0

    iget v1, p0, Lcom/android/camera/ui/ToggleSwitch;->mSwitchBackgroundColor:I

    const/4 v2, 0x0

    invoke-direct {p0, p1, v1, v0, v2}, Lcom/android/camera/ui/ToggleSwitch;->drawRoundRect(Landroid/graphics/Canvas;I[FZ)V

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/ui/ToggleSwitch;->compThumbRoundRectAttr(F)[F

    move-result-object v0

    iget v1, p0, Lcom/android/camera/ui/ToggleSwitch;->mThumbColor:I

    const/4 v2, 0x1

    invoke-direct {p0, p1, v1, v0, v2}, Lcom/android/camera/ui/ToggleSwitch;->drawRoundRect(Landroid/graphics/Canvas;I[FZ)V

    iget v1, p0, Lcom/android/camera/ui/ToggleSwitch;->mSwitchBackgroundStrokeColor:I

    invoke-direct {p0, p1, v1}, Lcom/android/camera/ui/ToggleSwitch;->drawRoundRectStroke(Landroid/graphics/Canvas;I)V

    invoke-direct {p0, p1, v0}, Lcom/android/camera/ui/ToggleSwitch;->drawText(Landroid/graphics/Canvas;[F)V

    return-void
.end method

.method private drawSwitchOffAnim(Landroid/graphics/Canvas;)V
    .locals 3

    invoke-direct {p0}, Lcom/android/camera/ui/ToggleSwitch;->compBackgroundRoundRectAttr()[F

    move-result-object v0

    iget v1, p0, Lcom/android/camera/ui/ToggleSwitch;->mSwitchBackgroundColor:I

    const/4 v2, 0x0

    invoke-direct {p0, p1, v1, v0, v2}, Lcom/android/camera/ui/ToggleSwitch;->drawRoundRect(Landroid/graphics/Canvas;I[FZ)V

    iget v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mSwitchBackgroundStrokeColor:I

    invoke-direct {p0, p1, v0}, Lcom/android/camera/ui/ToggleSwitch;->drawRoundRectStroke(Landroid/graphics/Canvas;I)V

    iget v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mCurrentPos:F

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, v0

    invoke-direct {p0, v1}, Lcom/android/camera/ui/ToggleSwitch;->compThumbRoundRectAttr(F)[F

    move-result-object v0

    iget v1, p0, Lcom/android/camera/ui/ToggleSwitch;->mThumbColor:I

    const/4 v2, 0x1

    invoke-direct {p0, p1, v1, v0, v2}, Lcom/android/camera/ui/ToggleSwitch;->drawRoundRect(Landroid/graphics/Canvas;I[FZ)V

    invoke-direct {p0, p1, v0}, Lcom/android/camera/ui/ToggleSwitch;->drawText(Landroid/graphics/Canvas;[F)V

    return-void
.end method

.method private drawSwitchOn(Landroid/graphics/Canvas;)V
    .locals 3

    invoke-direct {p0}, Lcom/android/camera/ui/ToggleSwitch;->compBackgroundRoundRectAttr()[F

    move-result-object v0

    iget v1, p0, Lcom/android/camera/ui/ToggleSwitch;->mSwitchBackgroundColor:I

    const/4 v2, 0x0

    invoke-direct {p0, p1, v1, v0, v2}, Lcom/android/camera/ui/ToggleSwitch;->drawRoundRect(Landroid/graphics/Canvas;I[FZ)V

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-direct {p0, v0}, Lcom/android/camera/ui/ToggleSwitch;->compThumbRoundRectAttr(F)[F

    move-result-object v0

    iget v1, p0, Lcom/android/camera/ui/ToggleSwitch;->mThumbColor:I

    const/4 v2, 0x1

    invoke-direct {p0, p1, v1, v0, v2}, Lcom/android/camera/ui/ToggleSwitch;->drawRoundRect(Landroid/graphics/Canvas;I[FZ)V

    iget v1, p0, Lcom/android/camera/ui/ToggleSwitch;->mSwitchBackgroundStrokeColor:I

    invoke-direct {p0, p1, v1}, Lcom/android/camera/ui/ToggleSwitch;->drawRoundRectStroke(Landroid/graphics/Canvas;I)V

    invoke-direct {p0, p1, v0}, Lcom/android/camera/ui/ToggleSwitch;->drawText(Landroid/graphics/Canvas;[F)V

    return-void
.end method

.method private drawSwitchOnAnim(Landroid/graphics/Canvas;)V
    .locals 3

    invoke-direct {p0}, Lcom/android/camera/ui/ToggleSwitch;->compBackgroundRoundRectAttr()[F

    move-result-object v0

    iget v1, p0, Lcom/android/camera/ui/ToggleSwitch;->mSwitchBackgroundColor:I

    const/4 v2, 0x0

    invoke-direct {p0, p1, v1, v0, v2}, Lcom/android/camera/ui/ToggleSwitch;->drawRoundRect(Landroid/graphics/Canvas;I[FZ)V

    iget v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mSwitchBackgroundStrokeColor:I

    invoke-direct {p0, p1, v0}, Lcom/android/camera/ui/ToggleSwitch;->drawRoundRectStroke(Landroid/graphics/Canvas;I)V

    iget v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mCurrentPos:F

    invoke-direct {p0, v0}, Lcom/android/camera/ui/ToggleSwitch;->compThumbRoundRectAttr(F)[F

    move-result-object v0

    iget v1, p0, Lcom/android/camera/ui/ToggleSwitch;->mThumbColor:I

    const/4 v2, 0x1

    invoke-direct {p0, p1, v1, v0, v2}, Lcom/android/camera/ui/ToggleSwitch;->drawRoundRect(Landroid/graphics/Canvas;I[FZ)V

    invoke-direct {p0, p1, v0}, Lcom/android/camera/ui/ToggleSwitch;->drawText(Landroid/graphics/Canvas;[F)V

    return-void
.end method

.method private drawText(Landroid/graphics/Canvas;[F)V
    .locals 7

    iget-object p2, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOff:Ljava/lang/String;

    const/4 v0, 0x1

    const/high16 v1, 0x40000000    # 2.0f

    const/high16 v2, 0x3f000000    # 0.5f

    const/4 v3, 0x0

    if-eqz p2, :cond_1

    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2, v0}, Landroid/graphics/Paint;-><init>(I)V

    sget-object v4, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {p2, v4}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    iget v4, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextSize:I

    int-to-float v4, v4

    invoke-virtual {p2, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    invoke-virtual {p2}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v4

    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->getMeasuredHeight()I

    move-result v5

    iget v6, v4, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    sub-int/2addr v5, v6

    iget v6, v4, Landroid/graphics/Paint$FontMetricsInt;->top:I

    add-int/2addr v5, v6

    div-int/lit8 v5, v5, 0x2

    iget v4, v4, Landroid/graphics/Paint$FontMetricsInt;->top:I

    sub-int/2addr v5, v4

    iget-boolean v4, p0, Lcom/android/camera/ui/ToggleSwitch;->mChecked:Z

    if-eqz v4, :cond_0

    iget v4, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOffColor:I

    invoke-virtual {p2, v4}, Landroid/graphics/Paint;->setColor(I)V

    iget v4, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOffShadowRadius:F

    iget v6, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOffShadowColor:I

    invoke-virtual {p2, v4, v3, v3, v6}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    goto :goto_0

    :cond_0
    iget v4, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOnColor:I

    invoke-virtual {p2, v4}, Landroid/graphics/Paint;->setColor(I)V

    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->getWidth()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v2

    iget v6, p0, Lcom/android/camera/ui/ToggleSwitch;->mThumbPadding:I

    int-to-float v6, v6

    div-float/2addr v6, v1

    add-float/2addr v4, v6

    iget v6, p0, Lcom/android/camera/ui/ToggleSwitch;->mStrokeWidth:I

    int-to-float v6, v6

    add-float/2addr v4, v6

    iget v6, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOffWidth:I

    int-to-float v6, v6

    sub-float/2addr v4, v6

    mul-float/2addr v4, v2

    iget-object v6, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOff:Ljava/lang/String;

    int-to-float v5, v5

    invoke-virtual {p1, v6, v4, v5, p2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    :cond_1
    iget-object p2, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOn:Ljava/lang/String;

    if-eqz p2, :cond_3

    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2, v0}, Landroid/graphics/Paint;-><init>(I)V

    sget-object v0, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    iget v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextSize:I

    int-to-float v0, v0

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    invoke-virtual {p2}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->getMeasuredHeight()I

    move-result v4

    iget v5, v0, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    sub-int/2addr v4, v5

    iget v5, v0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    add-int/2addr v4, v5

    div-int/lit8 v4, v4, 0x2

    iget v0, v0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    sub-int/2addr v4, v0

    iget-boolean v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mChecked:Z

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOnColor:I

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_1

    :cond_2
    iget v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOffColor:I

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setColor(I)V

    iget v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOffShadowRadius:F

    iget v5, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOffShadowColor:I

    invoke-virtual {p2, v0, v3, v3, v5}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    :goto_1
    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v3, 0x40400000    # 3.0f

    mul-float/2addr v0, v3

    div-float/2addr v0, v1

    iget v3, p0, Lcom/android/camera/ui/ToggleSwitch;->mThumbPadding:I

    int-to-float v3, v3

    div-float/2addr v3, v1

    sub-float/2addr v0, v3

    iget v1, p0, Lcom/android/camera/ui/ToggleSwitch;->mStrokeWidth:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    iget v1, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOnWidth:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    mul-float/2addr v0, v2

    iget-object v1, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOn:Ljava/lang/String;

    int-to-float v2, v4

    invoke-virtual {p1, v1, v0, v2, p2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    :cond_3
    return-void
.end method


# virtual methods
.method public dp2px(F)I
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method public dp2pxFloat(F)F
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    return p1
.end method

.method public isChecked()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mChecked:Z

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 6

    invoke-super {p0, p1}, Landroid/widget/CompoundButton;->onDraw(Landroid/graphics/Canvas;)V

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/ui/ToggleSwitch;->setLayerType(ILandroid/graphics/Paint;)V

    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->getHeight()I

    move-result v1

    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->getPaddingLeft()I

    move-result v2

    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->getPaddingTop()I

    move-result v3

    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->getPaddingRight()I

    move-result v4

    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->getPaddingBottom()I

    move-result v5

    sub-int/2addr v0, v2

    sub-int/2addr v0, v4

    sub-int/2addr v1, v3

    sub-int/2addr v1, v5

    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->getWidth()I

    move-result v4

    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->getHeight()I

    move-result v5

    sub-int/2addr v0, v4

    div-int/lit8 v0, v0, 0x2

    add-int/2addr v2, v0

    sub-int/2addr v1, v5

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v3, v1

    int-to-float v0, v2

    int-to-float v1, v3

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    sget-object v0, Lcom/android/camera/ui/ToggleSwitch$3;->$SwitchMap$com$android$camera$ui$ToggleSwitch$State:[I

    iget-object v1, p0, Lcom/android/camera/ui/ToggleSwitch;->state:Lcom/android/camera/ui/ToggleSwitch$State;

    invoke-virtual {v1}, Lcom/android/camera/ui/ToggleSwitch$State;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-direct {p0, p1}, Lcom/android/camera/ui/ToggleSwitch;->drawSwitchOffAnim(Landroid/graphics/Canvas;)V

    goto :goto_0

    :pswitch_1
    invoke-direct {p0, p1}, Lcom/android/camera/ui/ToggleSwitch;->drawSwitchOnAnim(Landroid/graphics/Canvas;)V

    goto :goto_0

    :pswitch_2
    invoke-direct {p0, p1}, Lcom/android/camera/ui/ToggleSwitch;->drawSwitchOff(Landroid/graphics/Canvas;)V

    goto :goto_0

    :pswitch_3
    invoke-direct {p0, p1}, Lcom/android/camera/ui/ToggleSwitch;->drawSwitchOn(Landroid/graphics/Canvas;)V

    nop

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onMeasure(II)V
    .locals 5

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p1

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p2

    const/high16 v2, 0x42580000    # 54.0f

    invoke-virtual {p0, v2}, Lcom/android/camera/ui/ToggleSwitch;->dp2px(F)I

    move-result v2

    iget v3, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOnWidth:I

    add-int/2addr v2, v3

    iget v3, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOffWidth:I

    add-int/2addr v2, v3

    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->getPaddingLeft()I

    move-result v3

    add-int/2addr v2, v3

    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->getPaddingRight()I

    move-result v3

    add-int/2addr v2, v3

    const/high16 v3, 0x41e00000    # 28.0f

    invoke-virtual {p0, v3}, Lcom/android/camera/ui/ToggleSwitch;->dp2px(F)I

    move-result v3

    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->getPaddingTop()I

    move-result v4

    add-int/2addr v3, v4

    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->getPaddingBottom()I

    move-result v4

    add-int/2addr v3, v4

    const/high16 v4, -0x80000000

    if-eq p1, v4, :cond_0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v2

    :cond_0
    if-eq p2, v4, :cond_1

    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    move-result v3

    :cond_1
    invoke-virtual {p0, v2, v3}, Lcom/android/camera/ui/ToggleSwitch;->setMeasuredDimension(II)V

    return-void
.end method

.method public setAnimDuration(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mAnimDuration:I

    return-void
.end method

.method public setChecked(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/ui/ToggleSwitch;->isMoving:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mChecked:Z

    if-eq v0, p1, :cond_6

    iput-boolean p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mChecked:Z

    iget-boolean p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mBroadcasting:Z

    if-eqz p1, :cond_1

    return-void

    :cond_1
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mBroadcasting:Z

    iget-object p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mOnCheckedChangeListener:Lcom/android/camera/ui/ToggleSwitch$OnCheckedChangeListener;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mOnCheckedChangeListener:Lcom/android/camera/ui/ToggleSwitch$OnCheckedChangeListener;

    iget-boolean v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mChecked:Z

    invoke-interface {p1, p0, v0}, Lcom/android/camera/ui/ToggleSwitch$OnCheckedChangeListener;->onCheckedChanged(Lcom/android/camera/ui/ToggleSwitch;Z)V

    :cond_2
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mBroadcasting:Z

    iget-boolean p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mChecked:Z

    if-eqz p1, :cond_3

    sget-object p1, Lcom/android/camera/ui/ToggleSwitch$State;->SWITCHING_ANIM_ON:Lcom/android/camera/ui/ToggleSwitch$State;

    iput-object p1, p0, Lcom/android/camera/ui/ToggleSwitch;->state:Lcom/android/camera/ui/ToggleSwitch$State;

    goto :goto_0

    :cond_3
    sget-object p1, Lcom/android/camera/ui/ToggleSwitch$State;->SWITCHING_ANIM_OFF:Lcom/android/camera/ui/ToggleSwitch$State;

    iput-object p1, p0, Lcom/android/camera/ui/ToggleSwitch;->state:Lcom/android/camera/ui/ToggleSwitch$State;

    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->isAttachedToWindow()Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->isLaidOut()Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-direct {p0}, Lcom/android/camera/ui/ToggleSwitch;->animateToCheckedState()V

    goto :goto_1

    :cond_4
    invoke-direct {p0}, Lcom/android/camera/ui/ToggleSwitch;->cancelPositionAnimator()V

    const/4 p1, 0x0

    iput p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mCurrentPos:F

    iget-boolean p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mChecked:Z

    if-eqz p1, :cond_5

    sget-object p1, Lcom/android/camera/ui/ToggleSwitch$State;->SWITCH_ON:Lcom/android/camera/ui/ToggleSwitch$State;

    iput-object p1, p0, Lcom/android/camera/ui/ToggleSwitch;->state:Lcom/android/camera/ui/ToggleSwitch$State;

    goto :goto_1

    :cond_5
    sget-object p1, Lcom/android/camera/ui/ToggleSwitch$State;->SWITCH_OFF:Lcom/android/camera/ui/ToggleSwitch$State;

    iput-object p1, p0, Lcom/android/camera/ui/ToggleSwitch;->state:Lcom/android/camera/ui/ToggleSwitch$State;

    :cond_6
    :goto_1
    return-void
.end method

.method public setOnCheckedChangeListener(Lcom/android/camera/ui/ToggleSwitch$OnCheckedChangeListener;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mOnCheckedChangeListener:Lcom/android/camera/ui/ToggleSwitch$OnCheckedChangeListener;

    return-void
.end method

.method public setTextOnAndOff(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOn:Ljava/lang/String;

    iput-object p2, p0, Lcom/android/camera/ui/ToggleSwitch;->mTextOff:Ljava/lang/String;

    invoke-direct {p0}, Lcom/android/camera/ui/ToggleSwitch;->caculateTextWidth()V

    invoke-virtual {p0}, Lcom/android/camera/ui/ToggleSwitch;->requestLayout()V

    return-void
.end method

.method public toggle()V
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/ui/ToggleSwitch;->mChecked:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/ToggleSwitch;->setChecked(Z)V

    return-void
.end method
