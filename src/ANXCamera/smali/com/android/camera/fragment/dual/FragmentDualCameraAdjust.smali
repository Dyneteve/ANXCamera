.class public Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentDualCameraAdjust.java"

# interfaces
.implements Lcom/android/camera/fragment/manually/ManuallyListener;
.implements Lcom/android/camera/protocol/ModeProtocol$DualController;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;
.implements Lcom/android/camera/protocol/ModeProtocol$OnOpticalZoomRatioChangeProtocol;
.implements Lcom/android/camera/protocol/ModeProtocol$SnapShotIndicator;
.implements Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;


# static fields
.field public static final FRAGMENT_INFO:I = 0xff4

.field private static final HIDE_POPUP:I = 0x1

.field private static final TAG:Ljava/lang/String; = "FragmentDualCameraAdjust"


# instance fields
.field private mCurrentState:I

.field private mDualParentLayout:Landroid/view/ViewGroup;

.field private mHandler:Landroid/os/Handler;

.field private mHorizontalSlideLayout:Landroid/view/ViewGroup;

.field private mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

.field private mIsHiding:Z

.field private mIsRecordingOrPausing:Z

.field private mIsStandaloneMacroMode:Z

.field private mIsZoomTo2X:Z

.field private mPassTouchFromZoomButtonToSlide:Z

.field private mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;

.field private mTouchDownX:F

.field private mZoomInAnimator:Landroid/animation/AnimatorSet;

.field private mZoomOutAnimator:Landroid/animation/AnimatorSet;

.field private mZoomRatio:F

.field private mZoomRatioToggleAnimator:Landroid/animation/ValueAnimator;

.field private mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

.field private mZoomSliderLayoutHeight:I

.field private mZoomSliderViewMiddleX:I

.field private mZoomSliderViewTouchListener:Landroid/view/View$OnTouchListener;

.field private mZoomSwitchLayoutHeight:I


# direct methods
.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentState:I

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsRecordingOrPausing:Z

    const/high16 v2, -0x40800000    # -1.0f

    iput v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mTouchDownX:F

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomSliderViewMiddleX:I

    iput-boolean v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsStandaloneMacroMode:Z

    new-instance v0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$1;-><init>(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)V

    iput-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$2;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$2;-><init>(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)V

    iput-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomSliderViewTouchListener:Landroid/view/View$OnTouchListener;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)Landroid/animation/AnimatorSet;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomInAnimator:Landroid/animation/AnimatorSet;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)Landroid/animation/AnimatorSet;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomOutAnimator:Landroid/animation/AnimatorSet;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->sendHideMessage()V

    return-void
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;FI)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->requestZoomRatio(FI)V

    return-void
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->notifyZooming(Z)V

    return-void
.end method

.method static synthetic access$500(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsZoomTo2X:Z

    return p0
.end method

.method static synthetic access$502(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsZoomTo2X:Z

    return p1
.end method

.method static synthetic access$600(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->notifyZoom2X(Z)V

    return-void
.end method

.method static synthetic access$702(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsHiding:Z

    return p1
.end method

.method static synthetic access$800(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)Landroid/view/ViewGroup;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    return-object p0
.end method

.method private adjustViewBackground(Landroid/view/View;I)V
    .locals 0

    const p2, 0x7f0b004c

    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    return-void
.end method

.method private alphaOutZoomButtonAndSlideView()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsHiding:Z

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;->setEnable(Z)V

    new-instance v0, Lcom/android/camera/animation/type/TranslateYAlphaOutOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    iget v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomSliderLayoutHeight:I

    invoke-direct {v0, v2, v3}, Lcom/android/camera/animation/type/TranslateYAlphaOutOnSubscribe;-><init>(Landroid/view/View;I)V

    new-instance v2, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {v2}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    invoke-virtual {v0, v2}, Lcom/android/camera/animation/type/TranslateYAlphaOutOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    new-instance v2, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;

    invoke-direct {v2, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;-><init>(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)V

    invoke-virtual {v0, v2}, Lio/reactivex/Completable;->subscribe(Lio/reactivex/functions/Action;)Lio/reactivex/disposables/Disposable;

    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    const/16 v2, 0xa3

    if-ne v0, v2, :cond_0

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xc3

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;

    if-eqz v0, :cond_0

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;->showOrHideChip(Z)V

    :cond_0
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentState:I

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    new-instance v0, Lcom/android/camera/animation/type/TranslateYAlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomSliderLayoutHeight:I

    invoke-direct {v0, v1, v2}, Lcom/android/camera/animation/type/TranslateYAlphaOutOnSubscribe;-><init>(Landroid/view/View;I)V

    new-instance v1, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {v1}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Lcom/android/camera/animation/type/TranslateYAlphaOutOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->hideZoomButton()V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    if-eqz v0, :cond_2

    const/4 v1, 0x2

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertUpdateValue(I)V

    :cond_2
    :goto_0
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->notifyTipsMargin()V

    return-void
.end method

.method private static getViewSpecForCapturingMode(I)Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ViewSpec;
    .locals 6

    nop

    nop

    nop

    nop

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, -0x1

    const/4 v3, 0x1

    if-ne v0, v3, :cond_1

    nop

    nop

    :cond_0
    :goto_0
    move p0, v3

    move v0, p0

    :goto_1
    move v3, v1

    goto/16 :goto_18

    :cond_1
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isMacroModeEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->hu()Z

    move-result v0

    if-nez v0, :cond_2

    nop

    goto :goto_0

    :cond_2
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isAutoZoomEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_3

    nop

    goto :goto_0

    :cond_3
    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_2_OR_MORE_SAT:Z

    if-eqz v0, :cond_0

    const/16 v0, 0xa1

    if-ne p0, v0, :cond_8

    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_2_SAT:Z

    if-eqz v0, :cond_4

    nop

    :goto_2
    move p0, v2

    goto :goto_3

    :cond_4
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isMacroModeEnabled(I)Z

    move-result v0

    if-nez v0, :cond_5

    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result p0

    if-nez p0, :cond_5

    nop

    move p0, v3

    goto :goto_3

    :cond_5
    goto :goto_2

    :goto_3
    if-ne p0, v2, :cond_6

    move v0, v3

    goto :goto_4

    :cond_6
    nop

    move v0, v1

    :goto_4
    if-ne p0, v2, :cond_7

    goto :goto_5

    :cond_7
    move v3, v1

    :goto_5
    nop

    :goto_6
    move v2, p0

    move p0, v3

    goto :goto_1

    :cond_8
    const/16 v0, 0xae

    if-ne p0, v0, :cond_d

    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_2_SAT:Z

    if-eqz v0, :cond_9

    nop

    :goto_7
    move p0, v2

    goto :goto_8

    :cond_9
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isMacroModeEnabled(I)Z

    move-result v0

    if-nez v0, :cond_a

    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result p0

    if-nez p0, :cond_a

    nop

    move p0, v3

    goto :goto_8

    :cond_a
    goto :goto_7

    :goto_8
    if-ne p0, v2, :cond_b

    move v0, v3

    goto :goto_9

    :cond_b
    nop

    move v0, v1

    :goto_9
    if-ne p0, v2, :cond_c

    goto :goto_a

    :cond_c
    move v3, v1

    :goto_a
    goto :goto_6

    :cond_d
    const/16 v0, 0xa2

    if-ne p0, v0, :cond_14

    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_2_SAT:Z

    if-eqz v0, :cond_e

    nop

    :goto_b
    move p0, v2

    goto :goto_d

    :cond_e
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v4, 0xc2

    invoke-virtual {v0, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;

    if-eqz v0, :cond_f

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;->isBeautyPanelShow()Z

    move-result v0

    if-eqz v0, :cond_f

    goto :goto_b

    :cond_f
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isMacroModeEnabled(I)Z

    move-result v0

    if-nez v0, :cond_10

    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result p0

    if-nez p0, :cond_10

    nop

    :goto_c
    move p0, v3

    goto :goto_d

    :cond_10
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->hu()Z

    move-result p0

    if-eqz p0, :cond_11

    goto :goto_c

    :cond_11
    goto :goto_b

    :goto_d
    if-ne p0, v2, :cond_12

    move v0, v3

    goto :goto_e

    :cond_12
    nop

    move v0, v1

    :goto_e
    if-ne p0, v2, :cond_13

    goto :goto_f

    :cond_13
    move v3, v1

    :goto_f
    goto :goto_6

    :cond_14
    const/16 v0, 0xa9

    if-ne p0, v0, :cond_18

    sget-boolean p0, Lcom/android/camera/HybridZoomingSystem;->IS_2_SAT:Z

    if-eqz p0, :cond_15

    nop

    move p0, v2

    goto :goto_10

    :cond_15
    nop

    move p0, v3

    :goto_10
    if-ne p0, v2, :cond_16

    move v0, v3

    goto :goto_11

    :cond_16
    nop

    move v0, v1

    :goto_11
    if-ne p0, v2, :cond_17

    goto :goto_12

    :cond_17
    move v3, v1

    :goto_12
    goto/16 :goto_6

    :cond_18
    const/16 v0, 0xa3

    if-ne p0, v0, :cond_1b

    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isMacroModeEnabled(I)Z

    move-result v0

    if-nez v0, :cond_19

    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result p0

    if-nez p0, :cond_19

    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelRearOn()Z

    move-result p0

    if-nez p0, :cond_19

    goto :goto_13

    :cond_19
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->hu()Z

    move-result p0

    if-eqz p0, :cond_1a

    nop

    :goto_13
    move v2, v3

    goto :goto_14

    :cond_1a
    nop

    :goto_14
    sget-boolean p0, Lcom/android/camera/HybridZoomingSystem;->IS_2_SAT:Z

    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_2_SAT:Z

    nop

    nop

    :goto_15
    move v5, v0

    move v0, p0

    move p0, v5

    goto :goto_18

    :cond_1b
    const/16 v0, 0xa5

    if-ne p0, v0, :cond_1d

    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isMacroModeEnabled(I)Z

    move-result v0

    if-nez v0, :cond_1c

    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result p0

    if-nez p0, :cond_1c

    nop

    move v2, v3

    goto :goto_16

    :cond_1c
    nop

    :goto_16
    sget-boolean p0, Lcom/android/camera/HybridZoomingSystem;->IS_2_SAT:Z

    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_2_SAT:Z

    nop

    goto :goto_15

    :cond_1d
    const/16 v0, 0xad

    if-ne p0, v0, :cond_1e

    nop

    nop

    nop

    nop

    nop

    move p0, v3

    move v0, p0

    move v2, v0

    goto :goto_18

    :cond_1e
    const/16 v0, 0xa6

    if-ne p0, v0, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/mi/config/a;->gB()Z

    move-result p0

    if-eqz p0, :cond_1f

    nop

    move v2, v3

    goto :goto_17

    :cond_1f
    nop

    :goto_17
    nop

    nop

    nop

    goto/16 :goto_0

    :goto_18
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedOpticalZoom()Z

    move-result v4

    if-eqz v4, :cond_20

    move v1, v3

    goto :goto_19

    :cond_20
    nop

    :goto_19
    new-instance v3, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ViewSpec;

    invoke-direct {v3, v2, v0, p0, v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ViewSpec;-><init>(IZZZ)V

    return-object v3
.end method

.method private initSlideZoomView(Lcom/android/camera/data/data/ComponentData;)V
    .locals 4

    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_2_SAT:Z

    const/16 v1, 0xad

    if-nez v0, :cond_1

    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_3_SAT:Z

    if-eqz v0, :cond_2

    new-instance v0, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->getContext()Landroid/content/Context;

    move-result-object v2

    iget v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    invoke-direct {v0, v2, p1, v3, p0}, Lcom/android/camera/fragment/manually/adapter/sat/TriSatZoomSliderAdapter;-><init>(Landroid/content/Context;Lcom/android/camera/data/data/ComponentData;ILcom/android/camera/fragment/manually/ManuallyListener;)V

    iput-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;

    goto :goto_1

    :cond_1
    :goto_0
    new-instance v0, Lcom/android/camera/fragment/manually/adapter/sat/DuoSatZoomSliderAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->getContext()Landroid/content/Context;

    move-result-object v2

    iget v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    invoke-direct {v0, v2, p1, v3, p0}, Lcom/android/camera/fragment/manually/adapter/sat/DuoSatZoomSliderAdapter;-><init>(Landroid/content/Context;Lcom/android/camera/data/data/ComponentData;ILcom/android/camera/fragment/manually/ManuallyListener;)V

    iput-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;

    :cond_2
    :goto_1
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/HorizontalSlideView;->setOnPositionSelectListener(Lcom/android/camera/ui/HorizontalSlideView$OnPositionSelectListener;)V

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/HorizontalSlideView;->setJustifyEnabled(Z)V

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/HorizontalSlideView;->setDrawAdapter(Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;)V

    sget-boolean p1, Lcom/android/camera/HybridZoomingSystem;->IS_2_SAT:Z

    if-nez p1, :cond_5

    iget p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    if-ne p1, v1, :cond_3

    goto :goto_2

    :cond_3
    sget-boolean p1, Lcom/android/camera/HybridZoomingSystem;->IS_3_SAT:Z

    if-eqz p1, :cond_6

    invoke-static {}, Lcom/android/camera/CameraSettings;->readZoom()F

    move-result p1

    invoke-static {p1}, Lcom/android/camera/HybridZoomingSystem;->toDecimal(F)F

    move-result p1

    sget v0, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_ULTR:F

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_4

    sget v0, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_TELE:F

    cmpg-float v0, p1, v0

    if-gtz v0, :cond_4

    const/high16 v0, 0x41200000    # 10.0f

    mul-float/2addr p1, v0

    float-to-int p1, p1

    sget v1, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_ULTR:F

    mul-float/2addr v1, v0

    float-to-int v0, v1

    sub-int/2addr p1, v0

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/HorizontalSlideView;->setSelection(I)V

    goto :goto_3

    :cond_4
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->updateZoomSliderPosition()V

    goto :goto_3

    :cond_5
    :goto_2
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->updateZoomSliderPosition()V

    :cond_6
    :goto_3
    return-void
.end method

.method private initiateZoomRatio()V
    .locals 4

    invoke-static {}, Lcom/android/camera/CameraSettings;->isZoomByCameraSwitchingSupported()Z

    move-result v0

    if-eqz v0, :cond_4

    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getCameraLensType(I)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "ultra"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget v0, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_ULTR:F

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    goto :goto_0

    :cond_0
    const-string/jumbo v1, "wide"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    sget v0, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_WIDE:F

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    goto :goto_0

    :cond_1
    const-string v1, "tele"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    sget v0, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_TELE:F

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    goto :goto_0

    :cond_2
    const-string v1, "macro"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    sget v0, Lcom/android/camera/HybridZoomingSystem;->sDefaultStandaloneMacroOpticalZoomRatio:F

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    :goto_0
    const-string v0, "FragmentDualCameraAdjust"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "initiateZoomRatio(): lens-switch-zoom: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    :cond_3
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "initiateZoomRatio(): Unknown camera lens type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_4
    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    if-eqz v0, :cond_5

    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    const/16 v1, 0xa2

    if-ne v0, v1, :cond_5

    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    const-string v1, "1.0"

    invoke-static {v0, v1}, Lcom/android/camera/HybridZoomingSystem;->getZoomRatioHistory(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    const-string v0, "FragmentDualCameraAdjust"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "initiateZoomRatio(): fake-sat-zoom: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    :cond_5
    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    if-eqz v0, :cond_6

    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    const/16 v1, 0xae

    if-ne v0, v1, :cond_6

    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    const-string v1, "1.0"

    invoke-static {v0, v1}, Lcom/android/camera/HybridZoomingSystem;->getZoomRatioHistory(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    const-string v0, "FragmentDualCameraAdjust"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "initiateZoomRatio(): fake-sat-zoom: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    :cond_6
    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    if-eqz v0, :cond_7

    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    const/16 v1, 0xa1

    if-ne v0, v1, :cond_7

    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    const-string v1, "1.0"

    invoke-static {v0, v1}, Lcom/android/camera/HybridZoomingSystem;->getZoomRatioHistory(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    const-string v0, "FragmentDualCameraAdjust"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "initiateZoomRatio(): fake-sat-zoom: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    :cond_7
    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    if-eqz v0, :cond_9

    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedOpticalZoom()Z

    move-result v0

    if-nez v0, :cond_9

    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    const/16 v1, 0xa3

    if-eq v0, v1, :cond_8

    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    const/16 v1, 0xa5

    if-ne v0, v1, :cond_9

    :cond_8
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    const-string v1, "1.0"

    invoke-static {v0, v1}, Lcom/android/camera/HybridZoomingSystem;->getZoomRatioHistory(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    const-string v0, "FragmentDualCameraAdjust"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "initiateZoomRatio(): fake-sat-zoom: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_9
    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    if-eqz v0, :cond_a

    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    const/16 v1, 0xa9

    if-ne v0, v1, :cond_a

    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    const-string v1, "1.0"

    invoke-static {v0, v1}, Lcom/android/camera/HybridZoomingSystem;->getZoomRatioHistory(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    const-string v0, "FragmentDualCameraAdjust"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "initiateZoomRatio(): fake-sat-zoom: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_a
    sget v0, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_WIDE:F

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    const-string v0, "FragmentDualCameraAdjust"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "initiateZoomRatio(): real-sat-zoom: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    return-void
.end method

.method private notifyTipsMargin()V
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directHideTipImage()V

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directlyHideTips()V

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directShowOrHideLeftTipImage(Z)V

    :cond_0
    return-void
.end method

.method private notifyZoom2X(Z)V
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xae

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/android/camera/Util;->isZoomAnimationEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    if-eqz p1, :cond_1

    :cond_0
    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;->onDualZoomHappened(Z)V

    :cond_1
    return-void
.end method

.method private notifyZooming(Z)V
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xae

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;->onDualLensZooming(Z)V

    :cond_0
    return-void
.end method

.method private requestZoomRatio(FI)V
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xae

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;->onDualZoomValueChanged(FI)V

    :cond_0
    return-void
.end method

.method private sendHideMessage()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x1388

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method

.method private showSlideView()V
    .locals 4

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsHiding:Z

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;->setEnable(Z)V

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    iget v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomSliderLayoutHeight:I

    int-to-float v3, v3

    invoke-static {v1, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v1, v3}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    new-instance v1, Lcom/android/camera/animation/type/TranslateYOnSubscribe;

    iget-object v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-direct {v1, v3, v0}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;-><init>(Landroid/view/View;I)V

    new-instance v3, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v3}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {v1, v3}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v1

    invoke-static {v1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v1

    invoke-virtual {v1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->setImmersiveModeEnabled(Z)V

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomSliderLayoutHeight:I

    int-to-float v2, v2

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    new-instance v1, Lcom/android/camera/animation/type/TranslateYOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-direct {v1, v2, v0}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;-><init>(Landroid/view/View;I)V

    new-instance v2, Lmiui/view/animation/BackEaseOutInterpolator;

    invoke-direct {v2}, Lmiui/view/animation/BackEaseOutInterpolator;-><init>()V

    invoke-virtual {v1, v2}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v1

    invoke-static {v1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v1

    invoke-virtual {v1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->notifyTipsMargin()V

    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    const/16 v2, 0xa3

    if-ne v1, v2, :cond_0

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xc3

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;

    if-eqz v1, :cond_0

    invoke-interface {v1, v0}, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;->showOrHideChip(Z)V

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directHideLyingDirectHint()V

    :cond_1
    return-void
.end method

.method private switchCameraLens()V
    .locals 4

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getManuallyDualLens()Lcom/android/camera/data/data/config/ComponentManuallyDualLens;

    move-result-object v0

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xae

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;

    if-eqz v1, :cond_0

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    invoke-interface {v1, v0, v2}, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;->onDualLensSwitch(Lcom/android/camera/data/data/config/ComponentManuallyDualLens;I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->updateZoomRatio(I)V

    :cond_0
    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "ultra"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->STRING_ZOOM_RATIO_ULTR:Ljava/lang/String;

    goto :goto_0

    :cond_1
    const-string/jumbo v1, "wide"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->STRING_ZOOM_RATIO_WIDE:Ljava/lang/String;

    goto :goto_0

    :cond_2
    const-string v1, "tele"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->STRING_ZOOM_RATIO_TELE:Ljava/lang/String;

    :goto_0
    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    invoke-static {v1, v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackDualZoomChanged(ILjava/lang/String;)V

    return-void

    :cond_3
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "switchCameraLens(): Unknown camera lens type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private updateZoomSliderPosition()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;

    invoke-static {}, Lcom/android/camera/CameraSettings;->readZoom()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;->mapZoomRatioToPosition(F)F

    move-result v0

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;

    invoke-virtual {v2}, Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;->getCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    int-to-float v2, v2

    div-float/2addr v0, v2

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/HorizontalSlideView;->setSelection(F)V

    :cond_0
    return-void
.end method


# virtual methods
.method public getFragmentInto()I
    .locals 1

    const/16 v0, 0xff4

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    const v0, 0x7f04001b

    return v0
.end method

.method public hideSlideView()V
    .locals 6

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsHiding:Z

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;->setEnable(Z)V

    new-instance v1, Lcom/android/camera/animation/type/TranslateYOnSubscribe;

    iget-object v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    iget v4, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomSliderLayoutHeight:I

    invoke-direct {v1, v3, v4}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;-><init>(Landroid/view/View;I)V

    new-instance v3, Lmiui/view/animation/ElasticEaseOutInterpolator;

    const v4, 0x3f8ccccd    # 1.1f

    const/high16 v5, 0x40000000    # 2.0f

    invoke-direct {v3, v4, v5}, Lmiui/view/animation/ElasticEaseOutInterpolator;-><init>(FF)V

    invoke-virtual {v1, v3}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v1

    invoke-static {v1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v1

    new-instance v3, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$6;

    invoke-direct {v3, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$6;-><init>(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)V

    invoke-virtual {v1, v3}, Lio/reactivex/Completable;->subscribe(Lio/reactivex/functions/Action;)Lio/reactivex/disposables/Disposable;

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    const/4 v3, 0x0

    invoke-static {v1, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->setImmersiveModeEnabled(Z)V

    new-instance v1, Lcom/android/camera/animation/type/TranslateYOnSubscribe;

    iget-object v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    iget v4, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomSliderLayoutHeight:I

    invoke-direct {v1, v3, v4}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;-><init>(Landroid/view/View;I)V

    new-instance v3, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {v3}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    invoke-virtual {v1, v3}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v1

    invoke-static {v1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v1

    invoke-virtual {v1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v3, 0xaf

    invoke-virtual {v1, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    if-eqz v1, :cond_1

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->reInitTipImage()V

    :cond_1
    if-eqz v1, :cond_2

    invoke-interface {v1, v2, v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->updateLyingDirectHint(ZZ)V

    :cond_2
    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    const/16 v2, 0xa3

    if-ne v1, v2, :cond_3

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xc3

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;

    if-eqz v1, :cond_3

    invoke-interface {v1, v0}, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;->showOrHideChip(Z)V

    :cond_3
    return-void
.end method

.method public hideZoomButton()V
    .locals 2

    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentState:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    iput v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentState:I

    new-instance v0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsHiding:Z

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;->setEnable(Z)V

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomSliderLayoutHeight:I

    int-to-float v1, v1

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomSliderLayoutHeight:I

    int-to-float v1, v1

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    :cond_1
    return-void
.end method

.method protected initView(Landroid/view/View;)V
    .locals 4

    nop

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    const v0, 0x7f0e005e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    const v0, 0x7f0e0061

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    const v0, 0x7f0e0060

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    iput-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-virtual {v0, p0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->setActionListener(Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ToggleStateListener;)V

    const v0, 0x7f0e005f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    const v0, 0x7f0e0062

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ui/HorizontalSlideView;

    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomSliderViewTouchListener:Landroid/view/View$OnTouchListener;

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/HorizontalSlideView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    const/4 v0, 0x2

    div-int/2addr p1, v0

    iput p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomSliderViewMiddleX:I

    new-instance p1, Landroid/animation/ValueAnimator;

    invoke-direct {p1}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleAnimator:Landroid/animation/ValueAnimator;

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {p1, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-static {}, Lcom/android/camera/Util;->isZoomAnimationEnabled()Z

    move-result p1

    if-eqz p1, :cond_1

    sget-boolean p1, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v1, 0x64

    invoke-virtual {p1, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    goto :goto_1

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v1, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    :goto_1
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$3;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$3;-><init>(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)V

    invoke-virtual {p1, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$4;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$4;-><init>(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)V

    invoke-virtual {p1, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    nop

    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->getContext()Landroid/content/Context;

    move-result-object p1

    const/high16 v1, 0x7f060000

    invoke-static {p1, v1}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object p1

    check-cast p1, Landroid/animation/AnimatorSet;

    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomInAnimator:Landroid/animation/AnimatorSet;

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomInAnimator:Landroid/animation/AnimatorSet;

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-virtual {p1, v1}, Landroid/animation/AnimatorSet;->setTarget(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomInAnimator:Landroid/animation/AnimatorSet;

    new-instance v1, Lmiui/view/animation/QuadraticEaseInOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/QuadraticEaseInOutInterpolator;-><init>()V

    invoke-virtual {p1, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    nop

    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->getContext()Landroid/content/Context;

    move-result-object p1

    const v1, 0x7f060002

    invoke-static {p1, v1}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object p1

    check-cast p1, Landroid/animation/AnimatorSet;

    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomOutAnimator:Landroid/animation/AnimatorSet;

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomOutAnimator:Landroid/animation/AnimatorSet;

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-virtual {p1, v1}, Landroid/animation/AnimatorSet;->setTarget(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomOutAnimator:Landroid/animation/AnimatorSet;

    new-instance v1, Lmiui/view/animation/QuadraticEaseInOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/QuadraticEaseInOutInterpolator;-><init>()V

    invoke-virtual {p1, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    int-to-float p1, p1

    const/high16 v2, 0x3f400000    # 0.75f

    div-float v2, p1, v2

    sub-float/2addr v2, p1

    const/high16 p1, 0x40000000    # 2.0f

    div-float/2addr v2, p1

    float-to-int p1, v2

    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0a0180

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    add-int/2addr p1, v2

    iput p1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    iput p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomSliderLayoutHeight:I

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-virtual {p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    iput p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomSwitchLayoutHeight:I

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    invoke-direct {p0, p1, v1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->adjustViewBackground(Landroid/view/View;I)V

    iget p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->provideAnimateElement(ILjava/util/List;I)V

    return-void
.end method

.method public isInteractive()Z
    .locals 3

    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->isEnableClick()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xa1

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    if-eqz v0, :cond_2

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isRecording()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    return v1

    :cond_2
    const/4 v0, 0x1

    return v0
.end method

.method public isSlideVisible()Z
    .locals 3

    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentState:I

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;->isEnable()Z

    move-result v0

    return v0

    :cond_1
    return v1
.end method

.method public isZoomVisible()Z
    .locals 3

    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isMacroModeEnabled(I)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->hu()Z

    move-result v0

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentState:I

    const/4 v2, 0x1

    if-eq v0, v2, :cond_1

    return v1

    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-virtual {v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_2

    return v1

    :cond_2
    return v2
.end method

.method public notifyAfterFrameAvailable(I)V
    .locals 2

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->notifyAfterFrameAvailable(I)V

    iget p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->provideAnimateElement(ILjava/util/List;I)V

    return-void
.end method

.method public notifyDataChanged(II)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->notifyDataChanged(II)V

    const/4 p2, 0x3

    if-eq p1, p2, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    iget p2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->adjustViewBackground(Landroid/view/View;I)V

    :goto_0
    return-void
.end method

.method public onBackEvent(I)Z
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsHiding:Z

    if-eqz v0, :cond_1

    return v1

    :cond_1
    const/4 v0, 0x3

    const/4 v2, 0x1

    if-ne p1, v0, :cond_2

    iget p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    const/16 v0, 0xad

    if-ne p1, v0, :cond_2

    move p1, v2

    goto :goto_0

    :cond_2
    nop

    move p1, v1

    :goto_0
    if-nez p1, :cond_3

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_3

    return v1

    :cond_3
    if-eqz p1, :cond_4

    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->alphaOutZoomButtonAndSlideView()V

    goto :goto_1

    :cond_4
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->hideSlideView()V

    :goto_1
    return v2
.end method

.method public onClick(Lcom/android/camera/ui/zoom/ZoomRatioView;)V
    .locals 5

    invoke-virtual {p1}, Lcom/android/camera/ui/zoom/ZoomRatioView;->getZoomRatioIndex()I

    move-result p1

    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->isSlideVisible()Z

    move-result v0

    if-nez v0, :cond_5

    const-string v0, "FragmentDualCameraAdjust"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onClick(): current zoom ratio index = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "FragmentDualCameraAdjust"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onClick(): current zoom ratio value = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-virtual {v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->isSuppressed()Z

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/android/camera/CameraSettings;->isZoomByCameraSwitchingSupported()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->switchCameraLens()V

    goto/16 :goto_1

    :cond_0
    iget p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    sget v0, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_WIDE:F

    cmpl-float p1, p1, v0

    if-nez p1, :cond_1

    iget p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->STRING_ZOOM_RATIO_TELE:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackDualZoomChanged(ILjava/lang/String;)V

    iput-boolean v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsZoomTo2X:Z

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleAnimator:Landroid/animation/ValueAnimator;

    new-array v0, v1, [F

    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    aput v1, v0, v3

    sget v1, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_TELE:F

    aput v1, v0, v2

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_1

    :cond_1
    iget p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    sget v0, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_TELE:F

    cmpg-float p1, p1, v0

    if-gtz p1, :cond_2

    iget p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->STRING_ZOOM_RATIO_WIDE:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackDualZoomChanged(ILjava/lang/String;)V

    iput-boolean v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsZoomTo2X:Z

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleAnimator:Landroid/animation/ValueAnimator;

    new-array v0, v1, [F

    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    aput v1, v0, v3

    sget v1, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_WIDE:F

    aput v1, v0, v2

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_1

    :cond_2
    iget p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    sget-object v0, Lcom/android/camera/HybridZoomingSystem;->STRING_ZOOM_RATIO_WIDE:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackDualZoomChanged(ILjava/lang/String;)V

    sget p1, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_TELE:F

    invoke-direct {p0, p1, v3}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->requestZoomRatio(FI)V

    sget p1, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_WIDE:F

    invoke-direct {p0, p1, v3}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->requestZoomRatio(FI)V

    goto :goto_1

    :cond_3
    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    if-eqz v0, :cond_5

    iget-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsStandaloneMacroMode:Z

    if-eqz v0, :cond_4

    invoke-static {p1}, Lcom/android/camera/HybridZoomingSystem;->getStandaloneMacroOpticalZoomRatioAt(I)F

    move-result p1

    goto :goto_0

    :cond_4
    invoke-static {p1}, Lcom/android/camera/HybridZoomingSystem;->getOpticalZoomRatioAt(I)F

    move-result p1

    :goto_0
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    invoke-static {p1}, Lcom/android/camera/HybridZoomingSystem;->toString(F)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/android/camera/statistic/CameraStatUtil;->trackDualZoomChanged(ILjava/lang/String;)V

    iput-boolean v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsZoomTo2X:Z

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleAnimator:Landroid/animation/ValueAnimator;

    new-array v1, v1, [F

    iget v4, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    aput v4, v1, v3

    aput p1, v1, v2

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    :cond_5
    :goto_1
    const/4 p1, 0x5

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->onBackEvent(I)Z

    return-void
.end method

.method public onLongClick(Lcom/android/camera/ui/zoom/ZoomRatioView;)Z
    .locals 2

    new-instance p1, Lcom/android/camera/data/data/config/ComponentManuallyDualZoom;

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/android/camera/data/data/config/ComponentManuallyDualZoom;-><init>(Lcom/android/camera/data/data/runing/DataItemRunning;)V

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->initSlideZoomView(Lcom/android/camera/data/data/ComponentData;)V

    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->showSlideView()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mPassTouchFromZoomButtonToSlide:Z

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->hideQrCodeTip()V

    :cond_0
    return p1
.end method

.method public onManuallyDataChanged(Lcom/android/camera/data/data/ComponentData;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->isInModeChanging()Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    :cond_0
    const-string/jumbo p1, "\u6ed1\u52a8\u6761"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackZoomAdjusted(Ljava/lang/String;)V

    invoke-static {p3}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    const/4 p2, 0x3

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->requestZoomRatio(FI)V

    return-void
.end method

.method public onOpticalZoomRatioUpdate(Z)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->onDatasetChange(Z)V

    iput-boolean p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsStandaloneMacroMode:Z

    return-void
.end method

.method public onTouch(Lcom/android/camera/ui/zoom/ZoomRatioToggleView;Landroid/view/MotionEvent;)Z
    .locals 5

    iget-boolean p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mPassTouchFromZoomButtonToSlide:Z

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v1, 0x0

    const/high16 v2, -0x40800000    # -1.0f

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mTouchDownX:F

    cmpl-float p1, p1, v2

    if-nez p1, :cond_1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mTouchDownX:F

    invoke-virtual {p2, v0}, Landroid/view/MotionEvent;->setAction(I)V

    iget p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomSliderViewMiddleX:I

    int-to-float p1, p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    invoke-virtual {p2, p1, v0}, Landroid/view/MotionEvent;->setLocation(FF)V

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/HorizontalSlideView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_0

    :cond_1
    iget p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomSliderViewMiddleX:I

    int-to-float p1, p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mTouchDownX:F

    sub-float/2addr v0, v2

    add-float/2addr p1, v0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    invoke-virtual {p2, p1, v0}, Landroid/view/MotionEvent;->setLocation(FF)V

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/HorizontalSlideView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomSliderViewTouchListener:Landroid/view/View$OnTouchListener;

    invoke-interface {p1, v1, p2}, Landroid/view/View$OnTouchListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    goto :goto_0

    :pswitch_1
    iget p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomSliderViewMiddleX:I

    int-to-float p1, p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    iget v4, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mTouchDownX:F

    sub-float/2addr v3, v4

    add-float/2addr p1, v3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {p2, p1, v3}, Landroid/view/MotionEvent;->setLocation(FF)V

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/HorizontalSlideView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomSliderViewTouchListener:Landroid/view/View$OnTouchListener;

    invoke-interface {p1, v1, p2}, Landroid/view/View$OnTouchListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    iput-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mPassTouchFromZoomButtonToSlide:Z

    iput v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mTouchDownX:F

    :goto_0
    const/4 p1, 0x1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public provideAnimateElement(ILjava/util/List;I)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;I)V"
        }
    .end annotation

    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;I)V

    invoke-static {p1}, Lcom/android/camera/CameraSettings;->isMacroModeEnabled(I)Z

    move-result p3

    iget-boolean v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsStandaloneMacroMode:Z

    if-eq p3, v1, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mi/config/a;->hu()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-virtual {v1, p3}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->onDatasetChange(Z)V

    iput-boolean p3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsStandaloneMacroMode:Z

    :cond_0
    const/4 p3, 0x0

    iput-boolean p3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsRecordingOrPausing:Z

    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->initiateZoomRatio()V

    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    invoke-static {v1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->getViewSpecForCapturingMode(I)Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ViewSpec;

    move-result-object v1

    iget v2, v1, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ViewSpec;->visibility:I

    const/4 v3, -0x1

    const/4 v4, 0x1

    if-ne v2, v4, :cond_4

    const/4 v2, 0x4

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->onBackEvent(I)Z

    nop

    invoke-static {}, Lcom/android/camera/HybridZoomingSystem;->getZoomingSourceIdentity()I

    move-result v2

    if-eqz v2, :cond_1

    const-string v5, "FragmentDualCameraAdjust"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "provideAnimateElement(): getZoomingSourceIdentity: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    nop

    move v2, v4

    goto :goto_0

    :cond_1
    move v2, p3

    :goto_0
    const-string v5, "FragmentDualCameraAdjust"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "provideAnimateElement(): initialized zoom ratio: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v7, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    iget v6, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDegree:I

    int-to-float v6, v6

    invoke-virtual {v5, v6}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->setRotation(F)V

    iget-object v5, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    iget-boolean v6, v1, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ViewSpec;->suppress:Z

    invoke-virtual {v5, v6}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->setSuppressed(Z)V

    iget-object v5, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    if-nez v2, :cond_3

    iget-boolean v2, v1, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ViewSpec;->immersive:Z

    if-eqz v2, :cond_2

    goto :goto_1

    :cond_2
    move v2, p3

    goto :goto_2

    :cond_3
    :goto_1
    move v2, v4

    :goto_2
    invoke-virtual {v5, v2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->setImmersive(Z)V

    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    iget v5, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    invoke-virtual {v2, v5, v3}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->setZoomRatio(FI)V

    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    iget-boolean v5, v1, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ViewSpec;->useSlider:Z

    invoke-virtual {v2, v5}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->setLongClickAllowed(Z)V

    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-virtual {v2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->startInactiveTimer()V

    :cond_4
    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentState:I

    iget v5, v1, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ViewSpec;->visibility:I

    if-ne v2, v5, :cond_5

    return-void

    :cond_5
    iget v1, v1, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ViewSpec;->visibility:I

    iput v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentState:I

    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentState:I

    const/16 v2, 0xa5

    const/16 v5, 0x50

    if-eq v1, v3, :cond_a

    if-eq v1, v4, :cond_6

    goto/16 :goto_5

    :cond_6
    iget-object p3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-static {p3, v5}, Lcom/android/camera/animation/type/SlideInOnSubscribe;->directSetResult(Landroid/view/View;I)V

    iget-object p3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-static {p3, v5}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->directSetResult(Landroid/view/View;I)V

    iget-object p3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomSliderLayoutHeight:I

    int-to-float v1, v1

    invoke-static {p3, v1}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    if-eqz p2, :cond_9

    const/16 p3, 0xa7

    if-ne p1, v2, :cond_7

    if-eq v0, p3, :cond_7

    goto :goto_3

    :cond_7
    if-ne v0, p3, :cond_8

    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object p3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-direct {p1, p3}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    const/16 p3, 0x96

    invoke-virtual {p1, p3}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5

    :cond_8
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object p3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-direct {p1, p3}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5

    :cond_9
    :goto_3
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_5

    :cond_a
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result p1

    if-nez p1, :cond_d

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;

    if-eqz p1, :cond_b

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;

    invoke-virtual {p1, p3}, Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;->setEnable(Z)V

    :cond_b
    if-nez p2, :cond_c

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto :goto_5

    :cond_c
    new-instance p1, Lcom/android/camera/animation/type/SlideOutOnSubscribe;

    iget-object p3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-direct {p1, p3, v5}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;-><init>(Landroid/view/View;I)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5

    :cond_d
    if-eqz p2, :cond_f

    if-ne v0, v2, :cond_e

    goto :goto_4

    :cond_e
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object p3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-direct {p1, p3}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5

    :cond_f
    :goto_4
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    :goto_5
    return-void
.end method

.method public provideRotateItem(Ljava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;I)V"
        }
    .end annotation

    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->provideRotateItem(Ljava/util/List;I)V

    iget-object p2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-virtual {p2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getVisibility()I

    move-result p2

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    const/16 v0, 0xb6

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    invoke-static {}, Lcom/mi/config/b;->isSupportedOpticalZoom()Z

    move-result v0

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    if-eqz v0, :cond_1

    :cond_0
    const/16 v0, 0xb8

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->hu()Z

    move-result v0

    if-eqz v0, :cond_2

    const/16 v0, 0xcb

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    :cond_2
    return-void
.end method

.method public setClickEnable(Z)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->setClickEnable(Z)V

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->setEnabled(Z)V

    :cond_0
    return-void
.end method

.method public setImmersiveModeEnabled(Z)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->setImmersive(Z)V

    return-void
.end method

.method public setRecordingOrPausing(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsRecordingOrPausing:Z

    return-void
.end method

.method public setSnapNumValue(I)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->setCaptureCount(I)V

    return-void
.end method

.method public setSnapNumVisible(ZZ)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    if-eqz p1, :cond_3

    if-eqz p2, :cond_2

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result p1

    if-nez p1, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->hideSlideView()V

    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomInAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    iget p2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDegree:I

    int-to-float p2, p2

    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompat;->setRotation(Landroid/view/View;F)V

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->setVisibility(I)V

    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->setImmersive(Z)V

    goto :goto_1

    :cond_3
    const/4 p1, -0x1

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->updateZoomRatio(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->setImmersive(Z)V

    if-eqz p2, :cond_4

    iget-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomOutAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    :cond_4
    :goto_1
    return-void
.end method

.method public showZoomButton()V
    .locals 2

    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsRecordingOrPausing:Z

    if-eqz v0, :cond_1

    return-void

    :cond_1
    iput v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentState:I

    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->updateZoomRatio(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDegree:I

    int-to-float v1, v1

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setRotation(Landroid/view/View;F)V

    new-instance v0, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    const/16 v0, 0xb6

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    invoke-static {}, Lcom/mi/config/b;->isSupportedOpticalZoom()Z

    move-result v0

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    if-eqz v0, :cond_1

    :cond_0
    const/16 v0, 0xb8

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->hu()Z

    move-result v0

    if-eqz v0, :cond_2

    const/16 v0, 0xcb

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    :cond_2
    return-void
.end method

.method public updateZoomRatio(I)V
    .locals 3

    invoke-static {}, Lcom/android/camera/CameraSettings;->isZoomByCameraSwitchingSupported()Z

    move-result v0

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getCameraLensType(I)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "ultra"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget v0, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_ULTR:F

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    goto :goto_0

    :cond_0
    const-string/jumbo v1, "wide"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    sget v0, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_WIDE:F

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    goto :goto_0

    :cond_1
    const-string v1, "tele"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    sget v0, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_TELE:F

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    :goto_0
    goto :goto_1

    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "updateZoomRatio(): Unknown camera lens type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    invoke-static {}, Lcom/android/camera/CameraSettings;->readZoom()F

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    :goto_1
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_4

    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    invoke-static {v0}, Lcom/android/camera/HybridZoomingSystem;->isOpticalZoomRatio(F)Z

    move-result v0

    if-eqz v0, :cond_5

    :cond_4
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    invoke-virtual {v0, v1, p1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->setZoomRatio(FI)V

    const/4 v0, 0x3

    if-eq p1, v0, :cond_5

    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->updateZoomSliderPosition()V

    :cond_5
    return-void
.end method

.method public visibleHeight()I
    .locals 2

    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentState:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->isSlideVisible()Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomSliderLayoutHeight:I

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioToggleView:Lcom/android/camera/ui/zoom/ZoomRatioToggleView;

    invoke-virtual {v1}, Lcom/android/camera/ui/zoom/ZoomRatioToggleView;->getHeight()I

    move-result v1

    add-int/2addr v0, v1

    return v0

    :cond_1
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomSwitchLayoutHeight:I

    return v0
.end method
