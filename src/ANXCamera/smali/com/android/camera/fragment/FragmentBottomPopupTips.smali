.class public Lcom/android/camera/fragment/FragmentBottomPopupTips;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentBottomPopupTips.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/FragmentBottomPopupTips$TipImageType;
    }
.end annotation


# static fields
.field private static final ANIM_DELAY_SHOW:I = 0x3

.field private static final ANIM_DIRECT_HIDE:I = 0x1

.field private static final ANIM_DIRECT_SHOW:I = 0x0

.field private static final ANIM_HIDE:I = 0x4

.field private static final ANIM_SHOW:I = 0x2

.field private static final CALL_TYPE_NOTIFY:I = 0x1

.field private static final CALL_TYPE_PROVIDE:I = 0x0

.field private static final CENTER_TIP_IMAGE_MIMOJI:I = 0x22

.field private static final CENTER_TIP_IMAGE_SPEED:I = 0x21

.field public static final FRAGMENT_INFO:I = 0xff1

.field private static final LEFT_TIP_IMAGE_CLOSE:I = 0x14

.field private static final LEFT_TIP_IMAGE_LIGHTING:I = 0x13

.field private static final LEFT_TIP_IMAGE_STICKER:I = 0x12

.field private static final LEFT_TIP_IMAGE_ULTRA_WIDE:I = 0x15

.field private static final MAX_RED_DOT_TIME:J = 0x5265c00L

.field private static final MSG_HIDE_TIP:I = 0x1

.field private static final TIP_IMAGE_INVALID:I = -0x1

.field private static final TIP_IMAGE_STICKER:I = 0x2

.field private static final TIP_SHINE:I = 0x3


# instance fields
.field private INIT_TAG:Z

.field private mBottomTipHeight:I

.field private mCenterRedDot:Landroid/view/View;

.field private mCenterTipImage:Landroid/widget/ImageView;

.field private mCloseIv:Landroid/widget/ImageView;

.field private mCloseType:I

.field private mCurrentTipMessage:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private mCurrentTipType:I

.field private mHandler:Landroid/os/Handler;

.field private mIsShowLeftImageIntro:Z

.field private mIsShowLyingDirectHint:Z

.field private mLastTipMessage:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private mLastTipType:I

.field private mLeftImageIntro:Landroid/widget/FrameLayout;

.field private mLeftImageIntroAnimator:Landroid/animation/AnimatorSet;

.field private mLeftImageIntroContent:Landroid/widget/TextView;

.field private mLeftImageIntroRadius:I

.field private mLeftImageIntroWidth:I

.field private mLeftTipImage:Landroid/widget/ImageView;

.field private mLightingPattern:Landroid/widget/TextView;

.field private mLyingDirectHint:Landroid/widget/TextView;

.field private mMimojiTextview:Landroid/widget/TextView;

.field private mPortraitSuccessHint:Landroid/view/View;

.field private mQrCodeButton:Landroid/widget/TextView;

.field private mRootView:Landroid/view/View;

.field private mSpeedTipImage:Landroid/view/ViewGroup;

.field private mTipImage:Landroid/widget/ImageView;

.field private mTipMessage:Landroid/widget/TextView;

.field private stringLightingRes:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->INIT_TAG:Z

    iput v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCloseType:I

    new-instance v0, Lcom/android/camera/fragment/FragmentBottomPopupTips$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips$1;-><init>(Lcom/android/camera/fragment/FragmentBottomPopupTips;)V

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/FragmentBottomPopupTips;)Landroid/widget/TextView;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/FragmentBottomPopupTips;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipType:I

    return p0
.end method

.method static synthetic access$102(Lcom/android/camera/fragment/FragmentBottomPopupTips;I)I
    .locals 0

    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipType:I

    return p1
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/FragmentBottomPopupTips;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    return p0
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/FragmentBottomPopupTips;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipMessage:I

    return p0
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/FragmentBottomPopupTips;)Landroid/widget/TextView;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$500(Lcom/android/camera/fragment/FragmentBottomPopupTips;)Landroid/widget/TextView;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mMimojiTextview:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$600(Lcom/android/camera/fragment/FragmentBottomPopupTips;)Landroid/widget/FrameLayout;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntro:Landroid/widget/FrameLayout;

    return-object p0
.end method

.method static synthetic access$700(Lcom/android/camera/fragment/FragmentBottomPopupTips;Landroid/view/View;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->setBeautyIntroButtonWidth(Landroid/view/View;I)V

    return-void
.end method

.method static synthetic access$800(Lcom/android/camera/fragment/FragmentBottomPopupTips;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->directHideLeftImageIntro()V

    return-void
.end method

.method private adjustViewBackground(I)V
    .locals 2

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getUiStyle()I

    move-result p1

    const/4 v0, 0x1

    const v1, 0x7f020022

    if-eq p1, v0, :cond_0

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setBackgroundResource(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mMimojiTextview:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setBackgroundResource(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    const v0, 0x7f020023

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setBackgroundResource(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mMimojiTextview:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setBackgroundResource(I)V

    :goto_0
    return-void
.end method

.method private checkLeftImageTipClose(I)I
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->isShowLightingView()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p1, 0x14

    :cond_0
    return p1
.end method

.method private closeFilter()V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->showCloseTip(IZ)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->showOrHideFilter()V

    :cond_0
    return-void
.end method

.method private closeLight()V
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-virtual {p0, v1, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->showCloseTip(IZ)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xa4

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    if-eqz v1, :cond_0

    invoke-interface {v1, v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->showOrHideLighting(Z)V

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateLeftTipImage()V

    return-void
.end method

.method private directHideLeftImageIntro()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mIsShowLeftImageIntro:Z

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroAnimator:Landroid/animation/AnimatorSet;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntro:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntro:Landroid/widget/FrameLayout;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    :cond_1
    return-void
.end method

.method private getLeftImageIntroWide()I
    .locals 4

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroContent:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Landroid/widget/TextView;->measure(II)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroContent:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0a0141

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0a0142

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    add-int/2addr v0, v1

    add-int/2addr v0, v2

    iget v2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroRadius:I

    sub-int/2addr v2, v1

    mul-int/lit8 v2, v2, 0x2

    add-int/2addr v0, v2

    return v0
.end method

.method private getTipBottomMargin(I)I
    .locals 8

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$DualController;

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xb5

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$ManuallyAdjust;

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xc2

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v3

    const/16 v4, 0xd2

    invoke-virtual {v3, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v3

    check-cast v3, Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0a0120

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    nop

    iget v5, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    const v6, 0x7f0a0139

    const/16 v7, 0xa5

    if-ne v5, v7, :cond_3

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    if-eqz v0, :cond_2

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    div-int/lit8 p1, p1, 0x2

    sub-int/2addr v0, p1

    goto/16 :goto_0

    :cond_2
    sget p1, Lcom/android/camera/Util;->sWindowWidth:I

    int-to-float p1, p1

    const/high16 v0, 0x3f400000    # 0.75f

    div-float/2addr p1, v0

    float-to-int p1, p1

    sget v0, Lcom/android/camera/Util;->sWindowWidth:I

    sub-int/2addr p1, v0

    div-int/lit8 p1, p1, 0x2

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a0092

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    add-int/2addr v0, p1

    goto/16 :goto_0

    :cond_3
    if-eqz v1, :cond_4

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$ManuallyAdjust;->visibleHeight()I

    move-result v5

    if-lez v5, :cond_4

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$ManuallyAdjust;->visibleHeight()I

    move-result v0

    goto/16 :goto_0

    :cond_4
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getVisibility()I

    move-result v1

    const v5, 0x7f0a00b9

    if-nez v1, :cond_7

    sget-boolean v1, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    if-eqz v1, :cond_5

    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedOpticalZoom()Z

    move-result v1

    if-nez v1, :cond_7

    :cond_5
    if-eqz v2, :cond_6

    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;->isBeautyPanelShow()Z

    move-result p1

    if-eqz p1, :cond_6

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    add-int v0, p1, v4

    goto/16 :goto_0

    :cond_6
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getHeight()I

    move-result v0

    goto :goto_0

    :cond_7
    if-eqz v0, :cond_8

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$DualController;->isZoomVisible()Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$DualController;->visibleHeight()I

    move-result v0

    goto :goto_0

    :cond_8
    if-eqz v3, :cond_9

    invoke-interface {v3}, Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;->isFNumberVisible()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-interface {v3}, Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;->visibleHeight()I

    move-result p1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mRootView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    float-to-int v0, v0

    add-int/2addr v0, p1

    goto :goto_0

    :cond_9
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;

    if-eqz v0, :cond_a

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;->isSeekBarVisible()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a0067

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    add-int/2addr v0, p1

    goto :goto_0

    :cond_a
    if-eqz v2, :cond_b

    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;->isBeautyPanelShow()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    add-int v0, p1, v4

    goto :goto_0

    :cond_b
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    div-int/lit8 p1, p1, 0x2

    sub-int/2addr v0, p1

    :goto_0
    return v0
.end method

.method private hideAllTipImage()V
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTipImage()V

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideLeftTipImage()V

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->directHideLeftImageIntro()V

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideSpeedTipImage()V

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideZoomTipImage(I)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideCenterTipImage()V

    return-void
.end method

.method private hideTip(Landroid/view/View;)Z
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_0

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private hideZoomTipImage(I)V
    .locals 1

    sparse-switch p1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->gB()Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    :sswitch_1
    sget-boolean p1, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    :sswitch_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xb6

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$DualController;

    if-eqz p1, :cond_3

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$DualController;->hideZoomButton()V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xac

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    if-eqz p1, :cond_2

    const/4 v0, 0x2

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertUpdateValue(I)V

    :cond_2
    nop

    :cond_3
    :goto_0
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0xa1 -> :sswitch_1
        0xa2 -> :sswitch_1
        0xa3 -> :sswitch_2
        0xa5 -> :sswitch_2
        0xa6 -> :sswitch_0
        0xad -> :sswitch_2
        0xae -> :sswitch_1
    .end sparse-switch
.end method

.method private isPortraitSuccessHintVisible()Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mPortraitSuccessHint:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private onLeftImageClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    if-eqz v0, :cond_0

    sget-boolean p1, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    if-nez p1, :cond_0

    const/16 p1, 0xcd

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    goto :goto_0

    :pswitch_1
    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCloseType:I

    packed-switch p1, :pswitch_data_1

    goto :goto_0

    :pswitch_2
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->closeLight()V

    goto :goto_0

    :pswitch_3
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->closeFilter()V

    goto :goto_0

    :pswitch_4
    if-eqz v0, :cond_0

    const/16 p1, 0xcb

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    :cond_0
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_4
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method private reConfigBottomTipOf960FPS()V
    .locals 3

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isFPS960(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/16 v0, 0x9

    const v1, 0x7f090224

    const/4 v2, 0x4

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->showTips(III)V

    return-void
.end method

.method private reConfigBottomTipOfMacro()V
    .locals 1

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isMacroModeEnabled(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    return-void
.end method

.method private reConfigBottomTipOfMimoji()V
    .locals 3

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    const/16 v1, 0xb1

    if-ne v0, v1, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInMimojiCreate()Z

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0x13

    const v1, 0x7f09035b

    const/4 v2, 0x2

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->showTips(III)V

    :cond_0
    return-void
.end method

.method private reIntTipViewMarginBottom(Landroid/view/View;I)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {p0, p2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getTipBottomMargin(I)I

    move-result p2

    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    if-eq v1, p2, :cond_0

    iput p2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_0
    return-void
.end method

.method private setBeautyIntroButtonWidth(Landroid/view/View;I)V
    .locals 1

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iput p2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method private showBeauty(I)V
    .locals 1

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xa4

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->showOrHideShine()V

    :cond_0
    return-void
.end method

.method private showLiveSpeed()V
    .locals 2

    const-string v0, "live_speed"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveClick(Ljava/lang/String;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc5

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;

    if-eqz v0, :cond_0

    const/16 v1, 0xa5

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;->onSwitchLiveActionMenu(I)V

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    if-eqz v0, :cond_1

    const/16 v1, 0xd

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    :cond_1
    return-void
.end method

.method private showLiveSticker()V
    .locals 2

    const-string v0, "live_sticker"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveClick(Ljava/lang/String;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc5

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;

    if-eqz v0, :cond_0

    const/16 v1, 0xa4

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;->onSwitchLiveActionMenu(I)V

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    if-eqz v0, :cond_1

    const/16 v1, 0xc

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    :cond_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    if-eqz v0, :cond_2

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directlyHideTips()V

    :cond_2
    return-void
.end method

.method private showMimojiPanel()V
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc5

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;

    if-eqz v0, :cond_0

    const/16 v1, 0xa6

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;->onSwitchLiveActionMenu(I)V

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    if-eqz v0, :cond_1

    const/16 v1, 0xe

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    :cond_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    if-eqz v0, :cond_2

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directlyHideTips()V

    :cond_2
    return-void
.end method

.method private startLeftImageIntroAnim(I)V
    .locals 6

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    return-void

    :cond_0
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->directShowOrHideLeftTipImage(Z)V

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntro:Landroid/widget/FrameLayout;

    invoke-virtual {v1, p1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroAnimator:Landroid/animation/AnimatorSet;

    if-nez v1, :cond_1

    const/4 v1, 0x2

    new-array v2, v1, [I

    iget v3, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroWidth:I

    aput v3, v2, p1

    iget v3, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroRadius:I

    mul-int/2addr v3, v1

    aput v3, v2, v0

    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v2

    const-wide/16 v3, 0x12c

    invoke-virtual {v2, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroContent:Landroid/widget/TextView;

    const-string v4, "alpha"

    new-array v5, v1, [F

    fill-array-data v5, :array_0

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    const-wide/16 v4, 0xfa

    invoke-virtual {v3, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    new-instance v4, Lcom/android/camera/fragment/FragmentBottomPopupTips$6;

    invoke-direct {v4, p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips$6;-><init>(Lcom/android/camera/fragment/FragmentBottomPopupTips;)V

    invoke-virtual {v2, v4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance v4, Landroid/animation/AnimatorSet;

    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v4, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroAnimator:Landroid/animation/AnimatorSet;

    iget-object v4, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroAnimator:Landroid/animation/AnimatorSet;

    new-array v1, v1, [Landroid/animation/Animator;

    aput-object v2, v1, p1

    aput-object v3, v1, v0

    invoke-virtual {v4, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroAnimator:Landroid/animation/AnimatorSet;

    new-instance v0, Landroid/view/animation/PathInterpolator;

    const v1, 0x3dcccccd    # 0.1f

    const/high16 v2, 0x3e800000    # 0.25f

    invoke-direct {v0, v2, v1, v2, v1}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroAnimator:Landroid/animation/AnimatorSet;

    const-wide/16 v0, 0x7d0

    invoke-virtual {p1, v0, v1}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroAnimator:Landroid/animation/AnimatorSet;

    new-instance v0, Lcom/android/camera/fragment/FragmentBottomPopupTips$7;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips$7;-><init>(Lcom/android/camera/fragment/FragmentBottomPopupTips;)V

    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntro:Landroid/widget/FrameLayout;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setAlpha(F)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroContent:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->clearAnimation()V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->cancel()V

    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    invoke-static {}, Lcom/android/camera/CameraSettings;->addPopupUltraWideIntroShowTimes()V

    return-void

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private updateCenterTipImage(IILjava/util/List;)V
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move-object/from16 v3, p3

    const/16 v4, 0xae

    const/16 v5, 0x12

    const/4 v6, -0x1

    const/16 v7, 0x22

    const/4 v8, 0x1

    if-eq v1, v4, :cond_4

    const/16 v4, 0xb1

    if-eq v1, v4, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    check-cast v4, Lcom/android/camera/ActivityBase;

    invoke-virtual {v4}, Lcom/android/camera/ActivityBase;->startFromKeyguard()Z

    move-result v4

    if-eqz v4, :cond_2

    iget-boolean v4, v0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->INIT_TAG:Z

    if-nez v4, :cond_1

    iput-boolean v8, v0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->INIT_TAG:Z

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object v4

    const-string v9, "close_state"

    invoke-virtual {v4, v9}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setCurrentMimojiState(Ljava/lang/String;)V

    :cond_1
    nop

    :goto_0
    move v4, v7

    goto :goto_2

    :cond_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInMimojiPreview()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->getMimojiPannelState()Z

    move-result v4

    if-nez v4, :cond_3

    goto :goto_0

    :cond_3
    :goto_1
    move v4, v6

    goto :goto_2

    :cond_4
    nop

    nop

    move v4, v5

    :goto_2
    nop

    iget-object v9, v0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mRootView:Landroid/view/View;

    const v10, 0x7f0e0044

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/FrameLayout;

    invoke-virtual {v9}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    check-cast v10, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v11, 0x0

    if-eq v4, v6, :cond_c

    const/16 v6, 0x51

    const v12, 0x7f0200f9

    const v13, 0x7f0200fa

    if-eq v4, v5, :cond_7

    if-eq v4, v7, :cond_5

    move v5, v8

    move v12, v11

    goto/16 :goto_6

    :cond_5
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->getCurrentMimojiState()Ljava/lang/String;

    move-result-object v5

    const-string v7, "add_state"

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_6

    const-string v7, "close_state"

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_6

    nop

    move v12, v13

    goto :goto_3

    :cond_6
    nop

    :goto_3
    iput v6, v10, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    :goto_4
    move v5, v8

    goto :goto_6

    :cond_7
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentLiveSticker()Ljava/lang/String;

    move-result-object v5

    const-string v7, ""

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    goto :goto_5

    :cond_8
    nop

    move v12, v13

    :goto_5
    iget-object v5, v0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterRedDot:Landroid/view/View;

    if-eqz v5, :cond_a

    invoke-static {}, Lcom/android/camera/CameraSettings;->getTTLiveStickerNeedRedDot()Z

    move-result v5

    invoke-static {}, Lcom/android/camera/CameraSettings;->getLiveStickerRedDotTime()J

    move-result-wide v13

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v15

    const-wide/16 v17, 0x0

    cmp-long v7, v13, v17

    if-lez v7, :cond_9

    sub-long/2addr v15, v13

    const-wide/32 v13, 0x5265c00

    cmp-long v7, v15, v13

    if-gez v7, :cond_a

    :cond_9
    if-eqz v5, :cond_a

    iget-object v5, v0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterRedDot:Landroid/view/View;

    invoke-virtual {v5, v11}, Landroid/view/View;->setVisibility(I)V

    :cond_a
    sget-boolean v5, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    if-nez v5, :cond_b

    iput v6, v10, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    goto :goto_4

    :cond_b
    const v5, 0x800053

    iput v5, v10, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    goto :goto_4

    :cond_c
    nop

    iget-object v5, v0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterRedDot:Landroid/view/View;

    if-eqz v5, :cond_d

    iget-object v5, v0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterRedDot:Landroid/view/View;

    const/16 v6, 0x8

    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    :cond_d
    move v5, v11

    move v12, v5

    :goto_6
    if-lez v12, :cond_e

    invoke-virtual {v9}, Landroid/widget/FrameLayout;->requestLayout()V

    iget-object v6, v0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-virtual {v6, v12}, Landroid/widget/ImageView;->setImageResource(I)V

    :cond_e
    iget-object v6, v0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-direct {v0, v1, v6, v11}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateImageBgColor(ILandroid/view/View;Z)V

    iget-object v1, v0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_f

    iget-object v1, v0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v1, v4, :cond_f

    return-void

    :cond_f
    if-eqz v5, :cond_10

    iget-object v1, v0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    iget v6, v0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mDegree:I

    int-to-float v6, v6

    invoke-static {v1, v6}, Landroid/support/v4/view/ViewCompat;->setRotation(Landroid/view/View;F)V

    :cond_10
    iget-object v1, v0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    if-nez v3, :cond_12

    if-eqz v5, :cond_11

    nop

    :goto_7
    move v8, v11

    goto :goto_9

    :cond_11
    goto :goto_9

    :cond_12
    const/16 v1, 0xa5

    if-eqz v5, :cond_15

    if-ne v2, v1, :cond_14

    invoke-static {}, Lcom/mi/config/b;->isSupportedOpticalZoom()Z

    move-result v1

    if-eqz v1, :cond_13

    goto :goto_7

    :cond_13
    const/4 v8, 0x3

    goto :goto_9

    :cond_14
    const/4 v8, 0x2

    goto :goto_9

    :cond_15
    if-eq v2, v1, :cond_17

    iget v2, v0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    if-ne v2, v1, :cond_16

    goto :goto_8

    :cond_16
    const/4 v8, 0x4

    goto :goto_9

    :cond_17
    :goto_8
    nop

    :goto_9
    packed-switch v8, :pswitch_data_0

    goto :goto_a

    :pswitch_0
    new-instance v1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, v0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-direct {v1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_a

    :pswitch_1
    new-instance v1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v0, v0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-direct {v1, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    const/16 v0, 0x96

    invoke-virtual {v1, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/animation/type/BaseOnSubScribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_a

    :pswitch_2
    new-instance v1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v0, v0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-direct {v1, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_a

    :pswitch_3
    iget-object v0, v0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_a

    :pswitch_4
    iget-object v0, v0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    nop

    :goto_a
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private updateImageBgColor(ILandroid/view/View;Z)V
    .locals 2

    if-eqz p3, :cond_0

    const p3, 0x7f020010

    const v0, 0x7f0201a6

    goto :goto_0

    :cond_0
    const p3, 0x7f020013

    const v0, 0x7f0201a7

    :goto_0
    const/16 v1, 0xa5

    if-eq p1, v1, :cond_1

    invoke-virtual {p2, p3}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_1

    :cond_1
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    nop

    :goto_1
    return-void
.end method

.method private updateLeftTipImage(IIILjava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;)V"
        }
    .end annotation

    nop

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->isNormalIntent()Z

    move-result v1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mi/config/a;->isSupportUltraWide()Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_0

    sget-boolean v2, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    if-nez v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    nop

    move v2, v4

    :goto_0
    const/4 v5, -0x1

    const/16 v6, 0x15

    packed-switch p2, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_4

    :pswitch_1
    if-eqz v1, :cond_b

    const/16 p1, 0x13

    packed-switch v0, :pswitch_data_1

    goto :goto_1

    :pswitch_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fJ()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_2

    :pswitch_3
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fI()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_2

    :cond_1
    :goto_1
    move p1, v5

    :goto_2
    goto/16 :goto_5

    :pswitch_4
    if-nez v0, :cond_b

    if-eqz v1, :cond_b

    if-eqz v2, :cond_b

    invoke-static {p2}, Lcom/android/camera/CameraSettings;->isAutoZoomEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_4

    :cond_2
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mIsShowLeftImageIntro:Z

    if-eqz v0, :cond_3

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->startLeftImageIntroAnim(I)V

    return-void

    :cond_3
    goto :goto_3

    :pswitch_5
    invoke-static {p2}, Lcom/android/camera/CameraSettings;->isMacroModeEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_4

    :cond_4
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelRearOn()Z

    move-result v1

    if-eqz v1, :cond_5

    goto :goto_4

    :cond_5
    if-eqz v2, :cond_b

    if-nez v0, :cond_b

    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mIsShowLeftImageIntro:Z

    if-eqz v0, :cond_6

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->startLeftImageIntroAnim(I)V

    return-void

    :cond_6
    goto :goto_3

    :pswitch_6
    invoke-static {p2}, Lcom/android/camera/CameraSettings;->isMacroModeEnabled(I)Z

    move-result v7

    if-eqz v7, :cond_7

    goto :goto_4

    :cond_7
    if-nez v0, :cond_b

    if-eqz v1, :cond_b

    if-eqz v2, :cond_b

    invoke-static {p2}, Lcom/android/camera/CameraSettings;->isAutoZoomEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_8

    goto :goto_4

    :cond_8
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mIsShowLeftImageIntro:Z

    if-eqz v0, :cond_9

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->startLeftImageIntroAnim(I)V

    return-void

    :cond_9
    goto :goto_3

    :pswitch_7
    if-eqz v2, :cond_b

    if-nez v0, :cond_b

    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mIsShowLeftImageIntro:Z

    if-eqz v0, :cond_a

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->startLeftImageIntroAnim(I)V

    return-void

    :cond_a
    nop

    :goto_3
    move p1, v6

    goto :goto_5

    :cond_b
    :goto_4
    move p1, v5

    :goto_5
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->checkLeftImageTipClose(I)I

    move-result p1

    nop

    nop

    nop

    const v0, 0x7f0200f9

    if-eq p1, v5, :cond_11

    if-eq p1, v6, :cond_e

    const/16 v1, 0x22

    if-eq p1, v1, :cond_d

    packed-switch p1, :pswitch_data_2

    move v2, v3

    move v0, v4

    move v1, v0

    goto :goto_9

    :pswitch_8
    const v0, 0x7f0200d0

    const v1, 0x7f09026a

    nop

    move v2, v3

    goto :goto_9

    :pswitch_9
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentLiveSticker()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c

    goto :goto_6

    :cond_c
    const v0, 0x7f0200fa

    goto :goto_6

    :cond_d
    nop

    nop

    :goto_6
    move v2, v3

    move v1, v4

    goto :goto_9

    :cond_e
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result v0

    if-eqz v0, :cond_f

    const v1, 0x7f02015b

    goto :goto_7

    :cond_f
    const v1, 0x7f02015a

    :goto_7
    if-eqz v0, :cond_10

    const v0, 0x7f09024b

    goto :goto_8

    :cond_10
    const v0, 0x7f09024c

    :goto_8
    nop

    move v2, v3

    move v8, v1

    move v1, v0

    move v0, v8

    goto :goto_9

    :cond_11
    nop

    nop

    move v0, v4

    move v1, v0

    move v2, v1

    :goto_9
    if-lez v0, :cond_12

    iget-object v5, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-virtual {v5, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    :cond_12
    if-lez v1, :cond_13

    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v0

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_13
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-direct {p0, p2, v0, v4}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateImageBgColor(ILandroid/view/View;Z)V

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object p2

    if-eqz p2, :cond_14

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    if-ne p2, p1, :cond_14

    return-void

    :cond_14
    if-eqz v2, :cond_15

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mDegree:I

    int-to-float v0, v0

    invoke-static {p2, v0}, Landroid/support/v4/view/ViewCompat;->setRotation(Landroid/view/View;F)V

    :cond_15
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    if-nez p4, :cond_17

    if-eqz v2, :cond_16

    nop

    move v3, v4

    goto :goto_d

    :cond_16
    goto :goto_d

    :cond_17
    const/16 p1, 0xa5

    if-eqz v2, :cond_1a

    if-ne p3, p1, :cond_19

    invoke-static {}, Lcom/mi/config/b;->isSupportedOpticalZoom()Z

    move-result p1

    if-eqz p1, :cond_18

    nop

    move v3, v4

    goto :goto_b

    :cond_18
    const/4 p1, 0x3

    goto :goto_a

    :cond_19
    const/4 p1, 0x2

    :goto_a
    move v3, p1

    :goto_b
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->directHideLeftImageIntro()V

    goto :goto_d

    :cond_1a
    if-eq p3, p1, :cond_1c

    iget p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    if-ne p2, p1, :cond_1b

    goto :goto_c

    :cond_1b
    const/4 v3, 0x4

    goto :goto_d

    :cond_1c
    :goto_c
    nop

    :goto_d
    packed-switch v3, :pswitch_data_3

    goto :goto_e

    :pswitch_a
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-direct {p1, p2}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p4, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_e

    :pswitch_b
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-direct {p1, p2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    const/16 p2, 0x96

    invoke-virtual {p1, p2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/android/camera/animation/type/BaseOnSubScribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p4, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_e

    :pswitch_c
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-direct {p1, p2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p4, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_e

    :pswitch_d
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_e

    :pswitch_e
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    nop

    :goto_e
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_0
        :pswitch_5
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_7
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x12
        :pswitch_9
        :pswitch_8
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x0
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
    .end packed-switch
.end method

.method private updateLightingPattern(ZZ)V
    .locals 1

    if-eqz p1, :cond_0

    const/4 p1, -0x1

    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningLighting()Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    move-result-object p1

    const/16 v0, 0xab

    invoke-virtual {p1, v0}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    const-string v0, "0"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->isLandScape()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLightingPattern:Landroid/widget/TextView;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->starAnimatetViewGone(Landroid/view/View;Z)V

    goto :goto_0

    :cond_2
    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    if-lez p1, :cond_3

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLightingPattern:Landroid/widget/TextView;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->startAnimateViewVisible(Landroid/view/View;Z)V

    :cond_3
    :goto_0
    return-void
.end method

.method private updateSpeedTipImage(IILjava/util/List;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;)V"
        }
    .end annotation

    nop

    nop

    const/4 v0, -0x1

    const/16 v1, 0x21

    const/16 v2, 0xae

    if-eq p1, v2, :cond_0

    move p1, v0

    goto :goto_0

    :cond_0
    nop

    move p1, v1

    :goto_0
    nop

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq p1, v0, :cond_2

    if-eq p1, v1, :cond_1

    move v4, v2

    move v5, v4

    move v0, v3

    goto :goto_1

    :cond_1
    const v0, 0x7f040005

    nop

    move v4, v2

    move v5, v3

    goto :goto_1

    :cond_2
    nop

    nop

    move v5, v2

    move v0, v3

    move v4, v0

    :goto_1
    iget-object v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-virtual {v6}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_3

    iget-object v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-virtual {v6}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ne v6, p1, :cond_3

    nop

    move v6, v3

    goto :goto_2

    :cond_3
    move v6, v2

    :goto_2
    if-eqz v6, :cond_4

    iget-object v7, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-virtual {v7}, Landroid/view/ViewGroup;->removeAllViews()V

    if-lez v0, :cond_4

    iget-object v7, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v8, v0, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_4
    const/4 v0, 0x2

    if-ne p1, v1, :cond_6

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentLiveSpeedText()Ljava/lang/String;

    move-result-object v1

    iget-object v7, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    const v8, 0x7f0e0015

    invoke-virtual {v7, v8}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    invoke-virtual {v7, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    const v7, 0x7f0e0014

    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentLiveSpeed()Ljava/lang/String;

    move-result-object v7

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    const v7, 0x7f0200f7

    invoke-virtual {v1, v7}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_3

    :cond_5
    const v7, 0x7f0200f6

    invoke-virtual {v1, v7}, Landroid/widget/ImageView;->setImageResource(I)V

    :cond_6
    :goto_3
    if-nez v6, :cond_7

    return-void

    :cond_7
    if-eqz v4, :cond_8

    if-eqz v5, :cond_8

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    iget v5, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mDegree:I

    int-to-float v5, v5

    invoke-static {v1, v5}, Landroid/support/v4/view/ViewCompat;->setRotation(Landroid/view/View;F)V

    goto :goto_4

    :cond_8
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    const/4 v5, 0x0

    invoke-static {v1, v5}, Landroid/support/v4/view/ViewCompat;->setRotation(Landroid/view/View;F)V

    :goto_4
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/view/ViewGroup;->setTag(Ljava/lang/Object;)V

    if-nez p3, :cond_a

    if-eqz v4, :cond_9

    nop

    :goto_5
    move v2, v3

    goto :goto_6

    :cond_9
    goto :goto_6

    :cond_a
    if-eqz v4, :cond_d

    const/16 p1, 0xa3

    if-ne p2, p1, :cond_c

    invoke-static {}, Lcom/mi/config/b;->isSupportedOpticalZoom()Z

    move-result p1

    if-eqz p1, :cond_b

    goto :goto_5

    :cond_b
    const/4 v2, 0x3

    goto :goto_6

    :cond_c
    nop

    move v2, v0

    goto :goto_6

    :cond_d
    const/4 v2, 0x4

    :goto_6
    packed-switch v2, :pswitch_data_0

    goto :goto_7

    :pswitch_0
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-direct {p1, p2}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_7

    :pswitch_1
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-direct {p1, p2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    const/16 p2, 0x96

    invoke-virtual {p1, p2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/android/camera/animation/type/BaseOnSubScribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_7

    :pswitch_2
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-direct {p1, p2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_7

    :pswitch_3
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_7

    :pswitch_4
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    nop

    :goto_7
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private updateTipImage(IILjava/util/List;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;)V"
        }
    .end annotation

    nop

    const/4 v0, -0x1

    const/16 v1, 0xa5

    const/4 v2, 0x3

    if-eq p1, v1, :cond_2

    const/16 v3, 0xab

    if-eq p1, v3, :cond_1

    const/16 v3, 0xae

    if-eq p1, v3, :cond_0

    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    goto :goto_1

    :pswitch_0
    invoke-direct {p0, p1, p2, p3}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateCenterTipImage(IILjava/util/List;)V

    goto :goto_1

    :pswitch_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/runing/DataItemRunning;->supportPopShineEntry()Z

    move-result v3

    if-eqz v3, :cond_4

    goto :goto_0

    :pswitch_2
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->isAutoZoomEnabled(I)Z

    move-result v3

    if-nez v3, :cond_4

    invoke-static {p1}, Lcom/android/camera/CameraSettings;->isMacroModeEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_1

    :cond_0
    :pswitch_3
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/runing/DataItemRunning;->supportPopShineEntry()Z

    move-result v3

    if-eqz v3, :cond_4

    nop

    :goto_0
    move v3, v2

    goto :goto_2

    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/runing/DataItemRunning;->supportPopShineEntry()Z

    move-result v3

    if-eqz v3, :cond_4

    goto :goto_0

    :cond_2
    :pswitch_4
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->isMacroModeEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_3

    goto :goto_1

    :cond_3
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/runing/DataItemRunning;->supportPopShineEntry()Z

    move-result v3

    if-eqz v3, :cond_4

    goto :goto_0

    :cond_4
    :goto_1
    move v3, v0

    :goto_2
    nop

    nop

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eq v3, v0, :cond_6

    const/16 v6, 0x22

    if-eq v3, v6, :cond_5

    packed-switch v3, :pswitch_data_2

    move v8, v4

    move v6, v5

    move v7, v6

    goto :goto_4

    :pswitch_5
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningShine()Lcom/android/camera/data/data/runing/ComponentRunningShine;

    move-result-object v6

    invoke-virtual {v6, p1}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->getBottomEntryRes(I)I

    move-result v6

    const v7, 0x7f0900f7

    nop

    move v8, v4

    goto :goto_4

    :pswitch_6
    const v6, 0x7f020090

    nop

    :goto_3
    move v8, v4

    move v7, v5

    goto :goto_4

    :cond_5
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningShine()Lcom/android/camera/data/data/runing/ComponentRunningShine;

    move-result-object v6

    invoke-virtual {v6, p1}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->getBottomEntryRes(I)I

    move-result v6

    goto :goto_3

    :cond_6
    nop

    nop

    move v6, v5

    move v7, v6

    move v8, v7

    :goto_4
    if-lez v6, :cond_7

    iget-object v9, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {v9, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    :cond_7
    if-lez v7, :cond_8

    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v6

    if-eqz v6, :cond_8

    iget-object v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {p0, v7}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_8
    iget-object v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-direct {p0, p1, v6, v5}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateImageBgColor(ILandroid/view/View;Z)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_9

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-ne p1, v3, :cond_9

    return-void

    :cond_9
    if-eqz v8, :cond_a

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    iget v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mDegree:I

    int-to-float v6, v6

    invoke-static {p1, v6}, Landroid/support/v4/view/ViewCompat;->setRotation(Landroid/view/View;F)V

    :cond_a
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    if-nez p3, :cond_c

    if-eqz v8, :cond_b

    nop

    :goto_5
    move v2, v5

    goto :goto_8

    :cond_b
    nop

    :goto_6
    move v2, v4

    goto :goto_8

    :cond_c
    if-eqz v8, :cond_f

    if-ne p2, v1, :cond_e

    invoke-static {}, Lcom/mi/config/b;->isSupportedOpticalZoom()Z

    move-result p1

    if-eqz p1, :cond_d

    goto :goto_5

    :cond_d
    goto :goto_8

    :cond_e
    const/4 v2, 0x2

    goto :goto_8

    :cond_f
    if-eq p2, v1, :cond_11

    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    if-ne p1, v1, :cond_10

    goto :goto_7

    :cond_10
    const/4 v2, 0x4

    goto :goto_8

    :cond_11
    :goto_7
    goto :goto_6

    :goto_8
    packed-switch v2, :pswitch_data_3

    goto :goto_a

    :pswitch_7
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-direct {p1, p2}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_a

    :pswitch_8
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-direct {p1, p2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    const/16 p2, 0x96

    invoke-virtual {p1, p2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/android/camera/animation/type/BaseOnSubScribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_a

    :pswitch_9
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-direct {p1, p2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_a

    :pswitch_a
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_a

    :pswitch_b
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 p2, 0xa2

    invoke-virtual {p1, p2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    if-eqz p1, :cond_12

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->isShowLightingView()Z

    move-result p1

    if-eqz p1, :cond_12

    goto :goto_9

    :cond_12
    move v4, v5

    :goto_9
    if-eqz v4, :cond_13

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    :cond_13
    if-nez v4, :cond_14

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    :cond_14
    :goto_a
    return-void

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_3
        :pswitch_2
        :pswitch_4
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xb0
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x2
        :pswitch_6
        :pswitch_5
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x0
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
    .end packed-switch
.end method


# virtual methods
.method public containTips(I)Z
    .locals 1
    .param p1    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getString(I)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public directHideCenterTipImage()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public directHideLyingDirectHint()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLyingDirectHint:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method

.method public directHideTipImage()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    const/4 v2, -0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method public directShowLeftImageIntro()V
    .locals 4

    invoke-static {}, Lcom/android/camera/CameraSettings;->isShowUltraWideIntro()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mIsShowLeftImageIntro:Z

    :cond_0
    const/4 v0, 0x0

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    iget v2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    const/4 v3, 0x0

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateLeftTipImage(IIILjava/util/List;)V

    return-void
.end method

.method public directShowOrHideLeftTipImage(Z)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    if-nez v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateLeftTipImage()V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    :goto_0
    return-void
.end method

.method public directlyHideTips()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->cancel()V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc3

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;->showOrHideChip(Z)V

    :cond_1
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipType:I

    const/4 v1, 0x6

    const/4 v2, 0x4

    if-ne v0, v1, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->isPortraitHintVisible()Z

    move-result v0

    if-nez v0, :cond_2

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipType:I

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipMessage:I

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->showTips(III)V

    :cond_2
    iput v2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipType:I

    return-void
.end method

.method public directlyShowTips(II)V
    .locals 2
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->cancel()V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    iput v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipType:I

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipMessage:I

    iput v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipMessage:I

    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    iput p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipMessage:I

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    return-void
.end method

.method public getCurrentBottomTipMsg()I
    .locals 1

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    return v0
.end method

.method public getFragmentInto()I
    .locals 1

    const/16 v0, 0xff1

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    const v0, 0x7f040012

    return v0
.end method

.method public hideCenterTipImage()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    new-instance v0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterRedDot:Landroid/view/View;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterRedDot:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    return-void

    :cond_2
    :goto_0
    return-void
.end method

.method public hideLeftTipImage()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    new-instance v0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public hideMimojiTip()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mMimojiTextview:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mMimojiTextview:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method public hideQrCodeTip()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method public hideSpeedTipImage()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setTag(Ljava/lang/Object;)V

    new-instance v0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public hideTipImage()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    new-instance v0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method protected initView(Landroid/view/View;)V
    .locals 4

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mRootView:Landroid/view/View;

    const v0, 0x7f0e0042

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    const v1, 0x800055

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    const v0, 0x7f0e0043

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    const v1, 0x800053

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    const v2, 0x7f020118

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0e0049

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0e0044

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    sget-boolean v3, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    if-eqz v3, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedOpticalZoom()Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_0

    :cond_0
    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    goto :goto_1

    :cond_1
    :goto_0
    const/16 v1, 0x51

    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    :goto_1
    const v1, 0x7f0e0045

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v1, 0x7f0e0046

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterRedDot:Landroid/view/View;

    const v0, 0x7f0e0047

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntro:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntro:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0e0048

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroContent:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a0096

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroRadius:I

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getLeftImageIntroWide()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftImageIntroWidth:I

    const v0, 0x7f0e004b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    const v0, 0x7f0e004c

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mMimojiTextview:Landroid/widget/TextView;

    const v0, 0x7f0e0050

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLyingDirectHint:Landroid/widget/TextView;

    const v0, 0x7f0e004a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    const v0, 0x7f0e004d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mPortraitSuccessHint:Landroid/view/View;

    const v0, 0x7f0e004e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLightingPattern:Landroid/widget/TextView;

    nop

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->adjustViewBackground(I)V

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->provideAnimateElement(ILjava/util/List;I)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isFromScreenSlide()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-static {v0}, Lcom/android/camera/Util;->startScreenSlideAlphaInAnimation(Landroid/view/View;)V

    :cond_2
    const v0, 0x7f0e004f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCloseIv:Landroid/widget/ImageView;

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCloseIv:Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a0037

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBottomTipHeight:I

    return-void
.end method

.method public isLightingHintVisible()Z
    .locals 2

    nop

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$VerticalProtocol;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$VerticalProtocol;->isAnyViewVisible()Z

    move-result v0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLightingPattern:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    goto :goto_2

    :cond_2
    :goto_1
    const/4 v1, 0x1

    :goto_2
    return v1
.end method

.method public isPortraitHintVisible()Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mPortraitSuccessHint:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isTipShowing()Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public notifyAfterFrameAvailable(I)V
    .locals 0

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->notifyAfterFrameAvailable(I)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->reConfigBottomTipOfUltraWide()V

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->reConfigBottomTipOfMacro()V

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->reConfigBottomTipOf960FPS()V

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->reConfigBottomTipOfMimoji()V

    return-void
.end method

.method public notifyDataChanged(II)V
    .locals 2

    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->notifyDataChanged(II)V

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->adjustViewBackground(I)V

    goto :goto_0

    :pswitch_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->directlyHideTips()V

    :goto_0
    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    iget p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateTipImage(IILjava/util/List;)V

    const/4 p1, 0x1

    iget p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-direct {p0, p1, p2, v1, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateLeftTipImage(IIILjava/util/List;)V

    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    iget p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-direct {p0, p1, p2, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateSpeedTipImage(IILjava/util/List;)V

    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    iget p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-direct {p0, p1, p2, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateCenterTipImage(IILjava/util/List;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onBackEvent(I)Z
    .locals 3

    const/16 v0, 0x9

    const/4 v1, 0x0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    const/4 v2, 0x6

    if-eq p1, v2, :cond_0

    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    const/4 v2, 0x7

    if-eq p1, v2, :cond_0

    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    const/16 v2, 0xb

    if-eq p1, v2, :cond_0

    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    if-eq p1, v0, :cond_0

    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    const/16 v2, 0xc

    if-eq p1, v2, :cond_0

    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    const/16 v2, 0x12

    if-eq p1, v2, :cond_0

    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    const/16 v2, 0xd

    if-eq p1, v2, :cond_0

    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    const/16 v2, 0x11

    if-ne p1, v2, :cond_1

    :cond_0
    return v1

    :cond_1
    :pswitch_1
    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    if-ne p1, v0, :cond_2

    return v1

    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTip(Landroid/view/View;)Z

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mPortraitSuccessHint:Landroid/view/View;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTip(Landroid/view/View;)Z

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTip(Landroid/view/View;)Z

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLightingPattern:Landroid/widget/TextView;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTip(Landroid/view/View;)Z

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mHandler:Landroid/os/Handler;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    nop

    :pswitch_2
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v0

    if-eqz v0, :cond_2

    return-void

    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    goto/16 :goto_3

    :sswitch_0
    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCloseType:I

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_3

    :pswitch_0
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->closeLight()V

    goto/16 :goto_3

    :pswitch_1
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->closeFilter()V

    goto/16 :goto_3

    :sswitch_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideQrCodeTip()V

    const-string p1, "counter"

    const-string v0, "qrcode_detected"

    invoke-static {p1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xc3

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;->showQRCodeResult()V

    goto/16 :goto_3

    :sswitch_2
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x21

    if-ne v0, v1, :cond_3

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideAllTipImage()V

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->showLiveSpeed()V

    goto :goto_0

    :sswitch_3
    const/16 v0, 0x15

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-static {}, Lcom/android/camera/CameraSettings;->setPopupUltraWideIntroClicked()V

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->directHideLeftImageIntro()V

    goto :goto_1

    :cond_3
    :goto_0
    :sswitch_4
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/16 v0, 0x12

    if-eq p1, v0, :cond_5

    const/16 v0, 0x22

    if-eq p1, v0, :cond_4

    goto :goto_3

    :cond_4
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideAllTipImage()V

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->showMimojiPanel()V

    goto :goto_3

    :cond_5
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideAllTipImage()V

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->showLiveSticker()V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterRedDot:Landroid/view/View;

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterRedDot:Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    const/4 p1, 0x0

    invoke-static {p1}, Lcom/android/camera/CameraSettings;->setTTLiveStickerNeedRedDot(Z)V

    goto :goto_3

    :goto_1
    :sswitch_5
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->onLeftImageClick(Landroid/view/View;)V

    goto :goto_3

    :sswitch_6
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideAllTipImage()V

    invoke-static {}, Lcom/android/camera/CameraSettings;->setPopupTipBeautyIntroClicked()V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    packed-switch p1, :pswitch_data_1

    goto :goto_2

    :pswitch_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideQrCodeTip()V

    const-string p1, "counter"

    const-string v0, "beauty_button"

    invoke-static {p1, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->showBeauty(I)V

    goto :goto_2

    :pswitch_3
    const/4 p1, 0x4

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    nop

    :goto_2
    nop

    :cond_6
    :goto_3
    return-void

    :sswitch_data_0
    .sparse-switch
        0x7f0e0042 -> :sswitch_6
        0x7f0e0043 -> :sswitch_5
        0x7f0e0045 -> :sswitch_4
        0x7f0e0047 -> :sswitch_3
        0x7f0e0049 -> :sswitch_2
        0x7f0e004b -> :sswitch_1
        0x7f0e004f -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x2
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method public provideAnimateElement(ILjava/util/List;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;I)V"
        }
    .end annotation

    const/4 v0, 0x3

    const/4 v1, 0x0

    if-eq p3, v0, :cond_0

    iget v2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    if-eq v2, p1, :cond_1

    :cond_0
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCloseIv:Landroid/widget/ImageView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    iput v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCloseType:I

    :cond_1
    iget v2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;I)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->isInModeChanging()Z

    move-result v3

    if-nez v3, :cond_2

    if-ne p3, v0, :cond_3

    :cond_2
    iput-boolean v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mIsShowLyingDirectHint:Z

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->directHideLyingDirectHint()V

    :cond_3
    const/4 p3, 0x4

    invoke-virtual {p0, p3}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->onBackEvent(I)Z

    nop

    invoke-virtual {p0, v1, v1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateTipBottomMargin(IZ)V

    invoke-direct {p0, p1, v2, p2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateTipImage(IILjava/util/List;)V

    invoke-direct {p0, v1, p1, v2, p2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateLeftTipImage(IIILjava/util/List;)V

    invoke-direct {p0, p1, v2, p2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateSpeedTipImage(IILjava/util/List;)V

    invoke-direct {p0, p1, v2, p2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateCenterTipImage(IILjava/util/List;)V

    return-void
.end method

.method protected provideEnterAnimation(I)Landroid/view/animation/Animation;
    .locals 2

    const/16 v0, 0xf0

    if-eq p1, v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getFragmentInto()I

    move-result v0

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    new-array p1, p1, [I

    const/4 v0, 0x0

    const/16 v1, 0xa1

    aput v1, p1, v0

    invoke-static {p1}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object p1

    return-object p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public provideRotateItem(Ljava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;I)V"
        }
    .end annotation

    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->provideRotateItem(Ljava/util/List;I)V

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getVisibility()I

    move-result p2

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getVisibility()I

    move-result p2

    if-nez p2, :cond_1

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    if-eqz p2, :cond_2

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getVisibility()I

    move-result p2

    if-nez p2, :cond_2

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    if-eqz p2, :cond_3

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getVisibility()I

    move-result p2

    if-nez p2, :cond_3

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    const/16 v0, 0x21

    if-eq p2, v0, :cond_3

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mSpeedTipImage:Landroid/view/ViewGroup;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    if-eqz p2, :cond_4

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getVisibility()I

    move-result p2

    if-nez p2, :cond_4

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCenterTipImage:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_4
    const/4 p1, 0x0

    const/4 p2, 0x1

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateLightingPattern(ZZ)V

    return-void
.end method

.method public reConfigBottomTipOfUltraWide()V
    .locals 4

    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    const/16 v1, 0xa5

    const/16 v2, 0xa3

    const/16 v3, 0xa2

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    if-eq v2, v0, :cond_1

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    if-eq v1, v0, :cond_1

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    if-eq v3, v0, :cond_1

    const/16 v0, 0xa9

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    if-eq v0, v1, :cond_1

    const/16 v0, 0xae

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    if-eq v0, v1, :cond_1

    const/16 v0, 0xa1

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    if-eq v0, v1, :cond_1

    return-void

    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    if-eq v2, v0, :cond_1

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    if-eq v1, v0, :cond_1

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    if-eq v3, v0, :cond_1

    return-void

    :cond_1
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isAutoZoomEnabled(I)Z

    move-result v0

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    if-ne v3, v1, :cond_2

    if-eqz v0, :cond_2

    return-void

    :cond_2
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isMacroModeEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_3

    return-void

    :cond_3
    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    if-eqz v0, :cond_5

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    const-string v1, "1.0"

    invoke-static {v0, v1}, Lcom/android/camera/HybridZoomingSystem;->getZoomRatioHistory(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, v1}, Lcom/android/camera/HybridZoomingSystem;->toFloat(Ljava/lang/String;F)F

    move-result v0

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_4

    return-void

    :cond_4
    goto :goto_0

    :cond_5
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result v0

    if-nez v0, :cond_6

    return-void

    :cond_6
    :goto_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;

    if-eqz v0, :cond_7

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;->isBeautyPanelShow()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    const/16 v1, 0xd

    if-eqz v0, :cond_8

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->shouldShowUltraWideSatTip(I)Z

    move-result v0

    if-eqz v0, :cond_9

    const v0, 0x7f0902a7

    const/4 v2, 0x2

    invoke-virtual {p0, v1, v0, v2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->showTips(III)V

    goto :goto_1

    :cond_8
    const v0, 0x7f090240

    const/4 v2, 0x4

    invoke-virtual {p0, v1, v0, v2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->showTips(III)V

    :cond_9
    :goto_1
    return-void
.end method

.method public reInitTipImage()V
    .locals 3

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->provideAnimateElement(ILjava/util/List;I)V

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->reConfigBottomTipOfMacro()V

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->reConfigBottomTipOf960FPS()V

    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    const/16 v0, 0xaf

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    const-string v0, "pref_camera_first_ultra_wide_use_hint_shown_key"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isShowUltraWideIntro()Z

    move-result v0

    if-eqz v0, :cond_0

    if-nez p1, :cond_0

    iput-boolean v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mIsShowLeftImageIntro:Z

    :cond_0
    return-void
.end method

.method public selectBeautyTipImage(Z)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    const v0, 0x7f02008e

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    const v0, 0x7f02008c

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    :goto_0
    return-void
.end method

.method public setLightingPattern(Ljava/lang/String;)V
    .locals 2

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const-string v1, "8"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x8

    goto :goto_1

    :pswitch_1
    const-string v1, "7"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x7

    goto :goto_1

    :pswitch_2
    const-string v1, "6"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x6

    goto :goto_1

    :pswitch_3
    const-string v1, "5"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x5

    goto :goto_1

    :pswitch_4
    const-string v1, "4"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x4

    goto :goto_1

    :pswitch_5
    const-string v1, "3"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x3

    goto :goto_1

    :pswitch_6
    const-string v1, "2"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x2

    goto :goto_1

    :pswitch_7
    const-string v1, "1"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_1

    :pswitch_8
    const-string v1, "0"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_1

    :cond_0
    :goto_0
    move p1, v0

    :goto_1
    packed-switch p1, :pswitch_data_1

    goto :goto_2

    :pswitch_9
    const p1, 0x7f09020d

    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    goto :goto_2

    :pswitch_a
    const p1, 0x7f09020a

    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    goto :goto_2

    :pswitch_b
    const p1, 0x7f09020b

    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    goto :goto_2

    :pswitch_c
    const p1, 0x7f09020c

    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    goto :goto_2

    :pswitch_d
    const p1, 0x7f090209

    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    goto :goto_2

    :pswitch_e
    const p1, 0x7f090208

    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    goto :goto_2

    :pswitch_f
    const p1, 0x7f090207

    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    goto :goto_2

    :pswitch_10
    const p1, 0x7f090206

    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    goto :goto_2

    :pswitch_11
    iput v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    nop

    :goto_2
    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLightingPattern:Landroid/widget/TextView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_3

    :cond_1
    const/16 p1, 0xc

    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTip(Landroid/view/View;)Z

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mPortraitSuccessHint:Landroid/view/View;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTip(Landroid/view/View;)Z

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->directHideTipImage()V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLightingPattern:Landroid/widget/TextView;

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBottomTipHeight:I

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->reIntTipViewMarginBottom(Landroid/view/View;I)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLightingPattern:Landroid/widget/TextView;

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->stringLightingRes:I

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->isLandScape()Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLightingPattern:Landroid/widget/TextView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    :cond_2
    :goto_3
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x30
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
    .end packed-switch
.end method

.method public setPortraitHintVisible(I)V
    .locals 2

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->isLightingHintVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-nez p1, :cond_1

    const/4 v0, 0x7

    goto :goto_0

    :cond_1
    const/4 v0, 0x4

    :goto_0
    iput v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipType:I

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->directlyHideTips()V

    if-nez p1, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mPortraitSuccessHint:Landroid/view/View;

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBottomTipHeight:I

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->reIntTipViewMarginBottom(Landroid/view/View;I)V

    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mPortraitSuccessHint:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public showCloseTip(IZ)V
    .locals 2

    if-eqz p2, :cond_1

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    const/16 v1, 0xa7

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCloseType:I

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCloseType:I

    :goto_0
    invoke-virtual {p0, p2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->showOrHideCloseImage(Z)V

    return-void
.end method

.method public showMimoji()V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideAllTipImage()V

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->showMimojiPanel()V

    return-void
.end method

.method public showMimojiTip()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mMimojiTextview:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTip(Landroid/view/View;)Z

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mMimojiTextview:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mMimojiTextview:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->reIntTipViewMarginBottom(Landroid/view/View;I)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mMimojiTextview:Landroid/widget/TextView;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    new-instance v0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mMimojiTextview:Landroid/widget/TextView;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    const/16 v1, 0xbb8

    invoke-virtual {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mMimojiTextview:Landroid/widget/TextView;

    new-instance v1, Lcom/android/camera/fragment/FragmentBottomPopupTips$5;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips$5;-><init>(Lcom/android/camera/fragment/FragmentBottomPopupTips;)V

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method

.method public showOrHideCloseImage(Z)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const v0, 0x7f0200fd

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    if-eqz p1, :cond_3

    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_2

    iget p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCloseType:I

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    const v0, 0x7f09026b

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    nop

    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    const/16 v0, 0x14

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_1

    :cond_3
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLeftTipImage:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    :goto_1
    return-void
.end method

.method public showQrCodeTip()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->directHideLyingDirectHint()V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTip(Landroid/view/View;)Z

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->reIntTipViewMarginBottom(Landroid/view/View;I)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    new-instance v1, Lcom/android/camera/fragment/FragmentBottomPopupTips$4;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips$4;-><init>(Lcom/android/camera/fragment/FragmentBottomPopupTips;)V

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method

.method public showTips(III)V
    .locals 3
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    const/4 v0, 0x6

    if-ne p1, v0, :cond_0

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    const/16 v1, 0xab

    if-eq v0, v1, :cond_0

    return-void

    :cond_0
    const/16 v0, 0xa

    if-ne p1, v0, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->getBogusCameraId()I

    move-result v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->isLightingHintVisible()Z

    move-result v0

    if-eqz v0, :cond_2

    return-void

    :cond_2
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->isPortraitSuccessHintVisible()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mPortraitSuccessHint:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTip(Landroid/view/View;)Z

    :cond_3
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    iput v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipType:I

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipMessage:I

    iput v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipMessage:I

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipMessage:I

    const v1, 0x7f09034b

    if-ne v0, v1, :cond_4

    const v0, 0x7f090342

    if-ne p2, v0, :cond_4

    return-void

    :cond_4
    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    iput p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipMessage:I

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTip(Landroid/view/View;)Z

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->directHideLyingDirectHint()V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBottomTipHeight:I

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->reIntTipViewMarginBottom(Landroid/view/View;I)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    iget p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipMessage:I

    invoke-virtual {p0, p2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    new-instance p2, Lcom/android/camera/fragment/FragmentBottomPopupTips$2;

    invoke-direct {p2, p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips$2;-><init>(Lcom/android/camera/fragment/FragmentBottomPopupTips;)V

    const-wide/16 v0, 0xbb8

    invoke-virtual {p1, p2, v0, v1}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_5
    nop

    const/4 p1, 0x0

    packed-switch p3, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const/16 p2, 0x1770

    goto :goto_1

    :pswitch_1
    const/16 p2, 0xbb8

    goto :goto_1

    :pswitch_2
    const/16 p2, 0x7d0

    goto :goto_1

    :pswitch_3
    goto :goto_0

    :pswitch_4
    const/16 p2, 0x3a98

    goto :goto_1

    :pswitch_5
    const/16 p2, 0x1388

    goto :goto_1

    :pswitch_6
    const/16 p2, 0x3e8

    goto :goto_1

    :goto_0
    move p2, p1

    :goto_1
    iget-object p3, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mHandler:Landroid/os/Handler;

    const/4 v0, 0x0

    invoke-virtual {p3, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    if-lez p2, :cond_6

    iget-object p3, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mHandler:Landroid/os/Handler;

    const/4 v0, 0x1

    int-to-long v1, p2

    invoke-virtual {p3, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :cond_6
    iget p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    const/16 p3, 0xa3

    if-ne p2, p3, :cond_7

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p2

    const/16 p3, 0xc3

    invoke-virtual {p2, p3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p2

    check-cast p2, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;

    if-eqz p2, :cond_7

    invoke-interface {p2, p1}, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;->showOrHideChip(Z)V

    :cond_7
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public showTips(IIII)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/fragment/FragmentBottomPopupTips$3;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/android/camera/fragment/FragmentBottomPopupTips$3;-><init>(Lcom/android/camera/fragment/FragmentBottomPopupTips;III)V

    int-to-long p1, p4

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public showTipsWithOrientation(IIIII)V
    .locals 0

    packed-switch p5, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->isLandScape()Z

    move-result p5

    if-nez p5, :cond_0

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->showTips(IIII)V

    goto :goto_0

    :pswitch_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->isLandScape()Z

    move-result p5

    if-eqz p5, :cond_0

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->showTips(IIII)V

    goto :goto_0

    :pswitch_2
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->showTips(IIII)V

    nop

    :cond_0
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    const/16 v0, 0xaf

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mIsShowLeftImageIntro:Z

    return-void
.end method

.method public updateLeftTipImage()V
    .locals 4

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {p0, v2, v0, v1, v3}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateLeftTipImage(IIILjava/util/List;)V

    return-void
.end method

.method public updateLyingDirectHint(ZZ)V
    .locals 6

    if-nez p2, :cond_0

    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mIsShowLyingDirectHint:Z

    :cond_0
    iget-boolean p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mIsShowLyingDirectHint:Z

    const/16 p2, 0x8

    if-eqz p1, :cond_5

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xb6

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$DualController;

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$DualController;->isSlideVisible()Z

    move-result p1

    if-eqz p1, :cond_1

    move p1, v0

    goto :goto_0

    :cond_1
    nop

    move p1, v1

    :goto_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xb4

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;

    if-eqz v2, :cond_2

    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;->isSeekBarVisible()Z

    move-result v2

    if-eqz v2, :cond_2

    move v2, v0

    goto :goto_1

    :cond_2
    nop

    move v2, v1

    :goto_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v4

    const/16 v5, 0xc2

    invoke-virtual {v4, v5}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v4

    check-cast v4, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;

    if-eqz v4, :cond_3

    invoke-interface {v4}, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;->isBeautyPanelShow()Z

    move-result v4

    if-eqz v4, :cond_3

    goto :goto_2

    :cond_3
    move v0, v1

    :goto_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->isTipShowing()Z

    move-result v4

    if-nez v4, :cond_4

    if-nez p1, :cond_4

    if-nez v2, :cond_4

    if-nez v0, :cond_4

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLyingDirectHint:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLyingDirectHint:Landroid/widget/TextView;

    const/high16 p2, 0x43340000    # 180.0f

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setRotation(F)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLyingDirectHint:Landroid/widget/TextView;

    iget p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBottomTipHeight:I

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->reIntTipViewMarginBottom(Landroid/view/View;I)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLyingDirectHint:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-static {v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackLyingDirectShow(I)V

    goto :goto_3

    :cond_4
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLyingDirectHint:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_3
    goto :goto_4

    :cond_5
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLyingDirectHint:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_6

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLyingDirectHint:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_6
    :goto_4
    return-void
.end method

.method public updateTipBottomMargin(IZ)V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mRootView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    if-ge v0, p1, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mRootView:Landroid/view/View;

    int-to-float v1, p1

    const v2, 0x3f99999a    # 1.2f

    mul-float/2addr v1, v2

    float-to-int v1, v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    :cond_0
    if-eqz p2, :cond_2

    int-to-float p2, p1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mRootView:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->getTranslationY(Landroid/view/View;)F

    move-result v0

    cmpg-float p2, p2, v0

    if-gez p2, :cond_1

    new-instance p2, Lcom/android/camera/animation/type/TranslateYOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mRootView:Landroid/view/View;

    neg-int p1, p1

    invoke-direct {p2, v0, p1}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;-><init>(Landroid/view/View;I)V

    new-instance p1, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {p1}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    invoke-virtual {p2, p1}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_0

    :cond_1
    new-instance p2, Lcom/android/camera/animation/type/TranslateYOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mRootView:Landroid/view/View;

    neg-int p1, p1

    invoke-direct {p2, v0, p1}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;-><init>(Landroid/view/View;I)V

    new-instance p1, Lmiui/view/animation/BackEaseOutInterpolator;

    invoke-direct {p1}, Lmiui/view/animation/BackEaseOutInterpolator;-><init>()V

    invoke-virtual {p2, p1}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_0

    :cond_2
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mRootView:Landroid/view/View;

    neg-int p1, p1

    invoke-static {p2, p1}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->directSetResult(Landroid/view/View;I)V

    :goto_0
    return-void
.end method

.method public updateTipImage()V
    .locals 3

    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateTipImage(IILjava/util/List;)V

    return-void
.end method
