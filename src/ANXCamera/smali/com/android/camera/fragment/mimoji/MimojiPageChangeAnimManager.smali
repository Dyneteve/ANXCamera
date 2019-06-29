.class public Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;
.super Ljava/lang/Object;
.source "MimojiPageChangeAnimManager.java"


# instance fields
.field private MOVE_TOP_DISPLACEMENT_OF_EDIT_LAYOUT:I

.field private MOVE_TOP_DISPLACEMENT_OF_GL:I

.field private editTabHeight:I

.field private heightEditLayout:I

.field private heightEditParentLayout:I

.field private heightSurfacePixelBuffer:I

.field private layoutParamsEditLayout:Landroid/widget/RelativeLayout$LayoutParams;

.field private layoutParamsTextureView:Landroid/widget/RelativeLayout$LayoutParams;

.field private mContext:Landroid/content/Context;

.field public mLocationAllEditContent:[I

.field public mLocationTextureView:[I

.field private mMimojiEditGLTextureView:Lcom/android/camera/ui/MimojiEditGLTextureView;

.field private mRlAllEditContent:Landroid/widget/LinearLayout;

.field navigationBackHeight:I

.field private resources:Landroid/content/res/Resources;

.field private screenHeight:I

.field private screenWidth:I

.field private widthSurfacePixel:I

.field xCoordinateStartTexture:I


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x3

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mLocationTextureView:[I

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mLocationAllEditContent:[I

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;)Landroid/widget/RelativeLayout$LayoutParams;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->layoutParamsTextureView:Landroid/widget/RelativeLayout$LayoutParams;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;)Lcom/android/camera/ui/MimojiEditGLTextureView;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mMimojiEditGLTextureView:Lcom/android/camera/ui/MimojiEditGLTextureView;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;)Landroid/widget/LinearLayout;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mRlAllEditContent:Landroid/widget/LinearLayout;

    return-object p0
.end method


# virtual methods
.method public getNavigationBarHeight(Landroid/content/Context;)I
    .locals 1

    invoke-static {p1}, Lcom/android/camera/Util;->checkDeviceHasNavigationBar(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/android/camera/Util;->getNavigationBarHeight(Landroid/content/Context;)I

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public initView(Landroid/content/Context;Lcom/android/camera/ui/MimojiEditGLTextureView;Landroid/widget/LinearLayout;I)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mMimojiEditGLTextureView:Lcom/android/camera/ui/MimojiEditGLTextureView;

    iput-object p3, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mRlAllEditContent:Landroid/widget/LinearLayout;

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->resources:Landroid/content/res/Resources;

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mContext:Landroid/content/Context;

    const-string/jumbo p2, "window"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/WindowManager;

    new-instance p2, Landroid/util/DisplayMetrics;

    invoke-direct {p2}, Landroid/util/DisplayMetrics;-><init>()V

    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    iget p1, p2, Landroid/util/DisplayMetrics;->widthPixels:I

    iput p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->screenWidth:I

    iget p1, p2, Landroid/util/DisplayMetrics;->heightPixels:I

    iput p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->screenHeight:I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->resources:Landroid/content/res/Resources;

    const p2, 0x7f0a015a

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->widthSurfacePixel:I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->resources:Landroid/content/res/Resources;

    const p2, 0x7f0a015b

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->heightSurfacePixelBuffer:I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->resources:Landroid/content/res/Resources;

    const p2, 0x7f0a018f

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->editTabHeight:I

    iget p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->screenHeight:I

    iget p2, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->navigationBackHeight:I

    sub-int/2addr p1, p2

    iput p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->heightEditParentLayout:I

    invoke-virtual {p0, p4}, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->resetViewsCorridinate(I)V

    return-void
.end method

.method public resetEditLayoutViewPosition()V
    .locals 5

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mLocationAllEditContent:[I

    const/4 v1, 0x1

    aget v0, v0, v1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->layoutParamsEditLayout:Landroid/widget/RelativeLayout$LayoutParams;

    if-nez v0, :cond_1

    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->screenHeight:I

    div-int/lit8 v0, v0, 0x2

    iget v3, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->editTabHeight:I

    add-int/2addr v0, v3

    iget-object v3, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v3}, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->getNavigationBarHeight(Landroid/content/Context;)I

    move-result v3

    add-int/2addr v0, v3

    iput v0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->heightEditLayout:I

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mLocationAllEditContent:[I

    aput v2, v0, v2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mLocationAllEditContent:[I

    iget v3, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->heightEditParentLayout:I

    iget v4, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->heightEditLayout:I

    sub-int/2addr v3, v4

    aput v3, v0, v1

    iget v0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->heightEditLayout:I

    iput v0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->MOVE_TOP_DISPLACEMENT_OF_EDIT_LAYOUT:I

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v3, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->screenWidth:I

    iget v4, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->heightEditLayout:I

    invoke-direct {v0, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->layoutParamsEditLayout:Landroid/widget/RelativeLayout$LayoutParams;

    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->layoutParamsEditLayout:Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v3, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mLocationAllEditContent:[I

    aget v2, v3, v2

    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->layoutParamsEditLayout:Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mLocationAllEditContent:[I

    aget v1, v2, v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mRlAllEditContent:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->layoutParamsEditLayout:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public resetLayoutPosition(I)V
    .locals 0

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->resetEditLayoutViewPosition()V

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->resetTextureViewPosition(I)V

    return-void
.end method

.method public resetTextureViewPosition(I)V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->layoutParamsTextureView:Landroid/widget/RelativeLayout$LayoutParams;

    if-nez v0, :cond_0

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->widthSurfacePixel:I

    iget v2, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->widthSurfacePixel:I

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->layoutParamsTextureView:Landroid/widget/RelativeLayout$LayoutParams;

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x2

    if-ne p1, v1, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->resources:Landroid/content/res/Resources;

    const v3, 0x7f0a018d

    invoke-virtual {p1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->navigationBackHeight:I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->resources:Landroid/content/res/Resources;

    const v3, 0x7f0a0158

    invoke-virtual {p1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    iget p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->screenWidth:I

    div-int/2addr p1, v2

    iget v3, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->widthSurfacePixel:I

    div-int/2addr v3, v2

    sub-int/2addr p1, v3

    iput p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->xCoordinateStartTexture:I

    iget p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->xCoordinateStartTexture:I

    iget v2, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->heightSurfacePixelBuffer:I

    add-int/2addr p1, v2

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mLocationTextureView:[I

    iget v3, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->xCoordinateStartTexture:I

    aput v3, v2, v0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mLocationTextureView:[I

    aput p1, v0, v1

    goto :goto_0

    :cond_1
    const/4 v3, 0x4

    if-eq p1, v3, :cond_2

    if-ne p1, v2, :cond_3

    :cond_2
    iget p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->screenWidth:I

    div-int/2addr p1, v2

    iget v3, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->widthSurfacePixel:I

    div-int/2addr v3, v2

    sub-int/2addr p1, v3

    iput p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->xCoordinateStartTexture:I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mLocationTextureView:[I

    iget v2, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->xCoordinateStartTexture:I

    aput v2, p1, v0

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mLocationTextureView:[I

    aput v0, p1, v1

    :cond_3
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->updateTextureViewPosition()V

    return-void
.end method

.method public resetViewsCorridinate(I)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->resetTextureViewPosition(I)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->resetEditLayoutViewPosition()V

    return-void
.end method

.method public translateYEditLayout()V
    .locals 10

    new-instance v9, Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v7, 0x1

    const/4 v8, 0x0

    move-object v0, v9

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    const-wide/16 v0, 0x1f4

    invoke-virtual {v9, v0, v1}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    new-instance v0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager$3;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager$3;-><init>(Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;)V

    invoke-virtual {v9, v0}, Landroid/view/animation/TranslateAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mRlAllEditContent:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v9}, Landroid/widget/LinearLayout;->startAnimation(Landroid/view/animation/Animation;)V

    return-void
.end method

.method public translateYTextureView()V
    .locals 4

    const/4 v0, 0x2

    new-array v0, v0, [F

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mLocationTextureView:[I

    const/4 v2, 0x1

    aget v1, v1, v2

    int-to-float v1, v1

    const/4 v3, 0x0

    aput v1, v0, v3

    const/4 v1, 0x0

    aput v1, v0, v2

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    new-instance v1, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager$1;

    invoke-direct {v1, p0, v0}, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager$1;-><init>(Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;Landroid/animation/ValueAnimator;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance v1, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager$2;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager$2;-><init>(Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method

.method public updateEditLayoutViewPosition()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->layoutParamsEditLayout:Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mLocationAllEditContent:[I

    const/4 v2, 0x0

    aget v1, v1, v2

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->layoutParamsEditLayout:Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mLocationAllEditContent:[I

    const/4 v2, 0x1

    aget v1, v1, v2

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mRlAllEditContent:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->layoutParamsEditLayout:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public updateLayoutPosition()V
    .locals 0

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->updateTextureViewPosition()V

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->updateEditLayoutViewPosition()V

    return-void
.end method

.method public updateOperateState(I)V
    .locals 0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->translateYTextureView()V

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->translateYEditLayout()V

    goto :goto_0

    :pswitch_1
    nop

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public updateTextureViewPosition()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->layoutParamsTextureView:Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mLocationTextureView:[I

    const/4 v2, 0x0

    aget v1, v1, v2

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->layoutParamsTextureView:Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mLocationTextureView:[I

    const/4 v2, 0x1

    aget v1, v1, v2

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->mMimojiEditGLTextureView:Lcom/android/camera/ui/MimojiEditGLTextureView;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->layoutParamsTextureView:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/MimojiEditGLTextureView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method
