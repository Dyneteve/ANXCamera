.class public Lcom/android/camera/fragment/FragmentBeauty;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentBeauty.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;
.implements Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;
.implements Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/camera/fragment/BaseFragment;",
        "Landroid/view/View$OnClickListener;",
        "Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;",
        "Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;",
        "Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;",
        "Lio/reactivex/functions/Consumer<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# static fields
.field public static final FRAGMENT_INFO:I = 0xfb

.field private static final INTERVAL:I = 0x5

.field private static final SEEKBAR_PROGRESS_RATIO:I = 0x1


# instance fields
.field private mActiveProgress:I

.field private mAdjustSeekBar:Lcom/android/camera/ui/SeekBarCompat;

.field private mBeautyContent:Landroid/view/View;

.field private mBeautyExtraView:Landroid/view/View;

.field private mBeautyPagerAdapter:Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;

.field private mBeautySettingManager:Lcom/android/camera/fragment/beauty/BeautySettingManager;

.field private mComponentRunningShine:Lcom/android/camera/data/data/runing/ComponentRunningShine;

.field private mCurrentSettingBusiness:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

.field private mCurrentState:I

.field private mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

.field private mFlowableEmitter:Lio/reactivex/FlowableEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/FlowableEmitter<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mIsEyeLightShow:Z

.field private mIsRTL:Z

.field private mSeekBarDisposable:Lio/reactivex/disposables/Disposable;

.field private mSeekBarMaxProgress:I

.field private mViewPager:Lcom/android/camera/ui/NoScrollViewPager;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    const/16 v0, 0x64

    iput v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mSeekBarMaxProgress:I

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentState:I

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/FragmentBeauty;)Lio/reactivex/FlowableEmitter;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mFlowableEmitter:Lio/reactivex/FlowableEmitter;

    return-object p0
.end method

.method static synthetic access$002(Lcom/android/camera/fragment/FragmentBeauty;Lio/reactivex/FlowableEmitter;)Lio/reactivex/FlowableEmitter;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mFlowableEmitter:Lio/reactivex/FlowableEmitter;

    return-object p1
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/FragmentBeauty;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mSeekBarMaxProgress:I

    return p0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/FragmentBeauty;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mActiveProgress:I

    return p0
.end method

.method static synthetic access$202(Lcom/android/camera/fragment/FragmentBeauty;I)I
    .locals 0

    iput p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mActiveProgress:I

    return p1
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/FragmentBeauty;)Lcom/android/camera/ui/SeekBarCompat;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mAdjustSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/FragmentBeauty;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mIsRTL:Z

    return p0
.end method

.method static synthetic access$500(Lcom/android/camera/fragment/FragmentBeauty;)Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    return-object p0
.end method

.method static synthetic access$600(Lcom/android/camera/fragment/FragmentBeauty;ZLandroid/support/v4/app/Fragment;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/android/camera/fragment/FragmentBeauty;->showHideExtraLayout(ZLandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    return-void
.end method

.method private extraEnterAnim()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/NoScrollViewPager;->setTranslationX(F)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/NoScrollViewPager;->setAlpha(F)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/high16 v2, -0x3d380000    # -100.0f

    invoke-virtual {v0, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const-wide/16 v1, 0x78

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Lmiui/view/animation/QuinticEaseInInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/QuinticEaseInInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    return-void
.end method

.method private extraExitAnim()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    const/high16 v1, -0x3d380000    # -100.0f

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/NoScrollViewPager;->setTranslationX(F)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/NoScrollViewPager;->setAlpha(F)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const-wide/16 v1, 0x118

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Lmiui/view/animation/QuinticEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/QuinticEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const-wide/16 v1, 0x78

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    return-void
.end method

.method private hideBeautyLayout(II)Z
    .locals 3

    iget v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentState:I

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    return v2

    :cond_0
    const/4 v0, 0x3

    if-ne v0, p1, :cond_1

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBeauty;->isHiddenBeautyPanelOnShutter()Z

    move-result p1

    if-nez p1, :cond_1

    return v2

    :cond_1
    iput v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentState:I

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->getView()Landroid/view/View;

    move-result-object p1

    if-nez p1, :cond_2

    return v2

    :cond_2
    const/16 v0, 0xc5

    packed-switch p2, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p2

    invoke-virtual {p2, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p2

    check-cast p2, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;

    invoke-interface {p2, v2}, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;->onSwitchCameraActionMenu(I)V

    new-instance p2, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    invoke-direct {p2, p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    const/16 p1, 0xfa

    invoke-virtual {p2, p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    new-instance p2, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {p2}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {p1, p2}, Lcom/android/camera/animation/type/BaseOnSubScribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    new-instance p2, Lcom/android/camera/fragment/-$$Lambda$FragmentBeauty$CzbOmoUE8j0crboHOZzPux34_CY;

    invoke-direct {p2, p0}, Lcom/android/camera/fragment/-$$Lambda$FragmentBeauty$CzbOmoUE8j0crboHOZzPux34_CY;-><init>(Lcom/android/camera/fragment/FragmentBeauty;)V

    invoke-virtual {p1, p2}, Lio/reactivex/Completable;->subscribe(Lio/reactivex/functions/Action;)Lio/reactivex/disposables/Disposable;

    goto :goto_0

    :pswitch_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p2

    invoke-virtual {p2, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p2

    check-cast p2, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;

    invoke-interface {p2, v2}, Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;->onSwitchCameraActionMenu(I)V

    new-instance p2, Lcom/android/camera/animation/type/SlideOutOnSubscribe;

    const/16 v0, 0x50

    invoke-direct {p2, p1, v0}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;-><init>(Landroid/view/View;I)V

    const/16 p1, 0x8c

    invoke-virtual {p2, p1}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    new-instance p2, Lmiui/view/animation/QuinticEaseInInterpolator;

    invoke-direct {p2}, Lmiui/view/animation/QuinticEaseInInterpolator;-><init>()V

    invoke-virtual {p1, p2}, Lcom/android/camera/animation/type/BaseOnSubScribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    new-instance p2, Lcom/android/camera/fragment/-$$Lambda$FragmentBeauty$g0NfeEgDEJ0JffLJyEuXT9d-4_Q;

    invoke-direct {p2, p0}, Lcom/android/camera/fragment/-$$Lambda$FragmentBeauty$g0NfeEgDEJ0JffLJyEuXT9d-4_Q;-><init>(Lcom/android/camera/fragment/FragmentBeauty;)V

    invoke-virtual {p1, p2}, Lio/reactivex/Completable;->subscribe(Lio/reactivex/functions/Action;)Lio/reactivex/disposables/Disposable;

    goto :goto_0

    :pswitch_2
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBeauty;->resetFragment()V

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    :goto_0
    const/4 p1, 0x1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private initAdjustSeekBar()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mSeekBarDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Lcom/android/camera/fragment/FragmentBeauty$2;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/FragmentBeauty$2;-><init>(Lcom/android/camera/fragment/FragmentBeauty;)V

    sget-object v1, Lio/reactivex/BackpressureStrategy;->DROP:Lio/reactivex/BackpressureStrategy;

    invoke-static {v0, v1}, Lio/reactivex/Flowable;->create(Lio/reactivex/FlowableOnSubscribe;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    sget-object v1, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/fragment/FragmentBeauty$1;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentBeauty$1;-><init>(Lcom/android/camera/fragment/FragmentBeauty;)V

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->onBackpressureDrop(Lio/reactivex/functions/Consumer;)Lio/reactivex/Flowable;

    move-result-object v0

    invoke-virtual {v0, p0}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mSeekBarDisposable:Lio/reactivex/disposables/Disposable;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mAdjustSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f02019f

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/SeekBarCompat;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mAdjustSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    new-instance v1, Lcom/android/camera/fragment/FragmentBeauty$3;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentBeauty$3;-><init>(Lcom/android/camera/fragment/FragmentBeauty;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/SeekBarCompat;->setOnSeekBarChangeListener(Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatChangeListener;)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mAdjustSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    new-instance v1, Lcom/android/camera/fragment/FragmentBeauty$4;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentBeauty$4;-><init>(Lcom/android/camera/fragment/FragmentBeauty;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/SeekBarCompat;->setOnSeekBarCompatTouchListener(Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatTouchListener;)V

    return-void
.end method

.method private initShineType()V
    .locals 4

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getUiStyle()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x3

    if-eq v0, v2, :cond_1

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentMode:I

    const/16 v2, 0xab

    if-eq v0, v2, :cond_1

    iget v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentMode:I

    const/16 v2, 0xb0

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyContent:Landroid/view/View;

    const v2, 0x7f0b0069

    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_1

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyContent:Landroid/view/View;

    const v2, 0x7f0b004c

    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    :goto_1
    iget v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentMode:I

    const/16 v2, 0xa5

    if-ne v0, v2, :cond_2

    sget v0, Lcom/android/camera/Util;->sWindowWidth:I

    int-to-float v0, v0

    const/high16 v2, 0x3f400000    # 0.75f

    div-float/2addr v0, v2

    float-to-int v0, v0

    sget v2, Lcom/android/camera/Util;->sWindowWidth:I

    sub-int/2addr v0, v2

    div-int/lit8 v0, v0, 0x2

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0a0180

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    add-int/2addr v0, v2

    goto :goto_2

    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f0a00b9

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    :goto_2
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    invoke-virtual {v2}, Lcom/android/camera/ui/NoScrollViewPager;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyExtraView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    iput v0, v2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    iput v0, v3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautySettingManager:Lcom/android/camera/fragment/beauty/BeautySettingManager;

    if-nez v0, :cond_3

    new-instance v0, Lcom/android/camera/fragment/beauty/BeautySettingManager;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/BeautySettingManager;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautySettingManager:Lcom/android/camera/fragment/beauty/BeautySettingManager;

    :cond_3
    iput v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentState:I

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningShine()Lcom/android/camera/data/data/runing/ComponentRunningShine;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mComponentRunningShine:Lcom/android/camera/data/data/runing/ComponentRunningShine;

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBeauty;->initAdjustSeekBar()V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mComponentRunningShine:Lcom/android/camera/data/data/runing/ComponentRunningShine;

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->getCurrentType()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/FragmentBeauty;->initShineType(Ljava/lang/String;Z)V

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBeauty;->initViewPager()V

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBeauty;->setViewPagerPageByType(Ljava/lang/String;)V

    return-void
.end method

.method private initShineType(Ljava/lang/String;Z)V
    .locals 4

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_0

    return-void

    :cond_0
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mComponentRunningShine:Lcom/android/camera/data/data/runing/ComponentRunningShine;

    invoke-virtual {p2, p1}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->setCurrentType(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->isEyeLightShow()Z

    move-result p2

    const/4 v0, 0x0

    if-eqz p2, :cond_1

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBeauty;->showHideEyeLighting(Z)V

    :cond_1
    const/4 p2, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/16 v2, 0x39

    const/4 v3, 0x1

    if-eq v1, v2, :cond_3

    const/16 v2, 0x620

    if-eq v1, v2, :cond_2

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const-string v1, "6"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const/4 p2, 0x6

    goto :goto_0

    :pswitch_1
    const-string v1, "5"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const/4 p2, 0x5

    goto :goto_0

    :pswitch_2
    const-string v1, "4"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const/4 p2, 0x4

    goto :goto_0

    :pswitch_3
    const-string v1, "3"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const/4 p2, 0x3

    goto :goto_0

    :pswitch_4
    const-string v1, "2"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const/4 p2, 0x2

    goto :goto_0

    :pswitch_5
    const-string v1, "1"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    move p2, v3

    goto :goto_0

    :cond_2
    const-string v1, "11"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const/4 p2, 0x7

    goto :goto_0

    :cond_3
    const-string v1, "9"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    move p2, v0

    :cond_4
    :goto_0
    const/4 v1, 0x0

    packed-switch p2, :pswitch_data_1

    iput-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentSettingBusiness:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    invoke-direct {p0, v0, v3}, Lcom/android/camera/fragment/FragmentBeauty;->setAdjustSeekBarVisible(ZZ)V

    goto :goto_1

    :pswitch_6
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautySettingManager:Lcom/android/camera/fragment/beauty/BeautySettingManager;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mComponentRunningShine:Lcom/android/camera/data/data/runing/ComponentRunningShine;

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->getTypeElementsBeauty()Lcom/android/camera/data/data/runing/TypeElementsBeauty;

    move-result-object v0

    invoke-virtual {p2, p1, v0}, Lcom/android/camera/fragment/beauty/BeautySettingManager;->constructAndGetSetting(Ljava/lang/String;Lcom/android/camera/data/data/runing/TypeElementsBeauty;)Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentSettingBusiness:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    goto :goto_1

    :pswitch_7
    iput-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentSettingBusiness:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    invoke-direct {p0, v0, v3}, Lcom/android/camera/fragment/FragmentBeauty;->setAdjustSeekBarVisible(ZZ)V

    goto :goto_1

    :pswitch_8
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "not allowed, see onMakeupItemSelected"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x31
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_7
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
    .end packed-switch
.end method

.method private initViewPager()V
    .locals 7

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mComponentRunningShine:Lcom/android/camera/data/data/runing/ComponentRunningShine;

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->getItems()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/data/data/ComponentDataItem;

    iget-object v2, v2, Lcom/android/camera/data/data/ComponentDataItem;->mValue:Ljava/lang/String;

    const/4 v5, -0x1

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v6

    packed-switch v6, :pswitch_data_0

    packed-switch v6, :pswitch_data_1

    goto/16 :goto_1

    :pswitch_0
    const-string v3, "13"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0xa

    goto/16 :goto_2

    :pswitch_1
    const-string v3, "12"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x9

    goto :goto_2

    :pswitch_2
    const-string v3, "11"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v3, 0x8

    goto :goto_2

    :pswitch_3
    const-string v3, "10"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v3, 0x7

    goto :goto_2

    :pswitch_4
    const-string v3, "7"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v3, 0x6

    goto :goto_2

    :pswitch_5
    const-string v3, "6"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v3, 0x5

    goto :goto_2

    :pswitch_6
    const-string v3, "5"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v3, 0x4

    goto :goto_2

    :pswitch_7
    const-string v3, "4"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v3, 0x3

    goto :goto_2

    :pswitch_8
    const-string v3, "3"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move v3, v4

    goto :goto_2

    :pswitch_9
    const-string v3, "2"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v3, 0x1

    goto :goto_2

    :pswitch_a
    const-string v4, "1"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_2

    :cond_0
    :goto_1
    move v3, v5

    :goto_2
    packed-switch v3, :pswitch_data_2

    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "unknown beauty type"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_b
    new-instance v2, Lcom/android/camera/fragment/live/FragmentLiveSpeed;

    invoke-direct {v2}, Lcom/android/camera/fragment/live/FragmentLiveSpeed;-><init>()V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :pswitch_c
    new-instance v2, Lcom/android/camera/fragment/live/FragmentLiveSticker;

    invoke-direct {v2}, Lcom/android/camera/fragment/live/FragmentLiveSticker;-><init>()V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :pswitch_d
    new-instance v2, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;

    invoke-direct {v2}, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;-><init>()V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :pswitch_e
    new-instance v2, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;

    invoke-direct {v2}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;-><init>()V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :pswitch_f
    new-instance v2, Lcom/android/camera/fragment/FragmentFilter;

    invoke-direct {v2}, Lcom/android/camera/fragment/FragmentFilter;-><init>()V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :pswitch_10
    new-instance v2, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;

    invoke-direct {v2}, Lcom/android/camera/fragment/beauty/BeautyBodyFragment;-><init>()V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :pswitch_11
    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;

    invoke-direct {v2}, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;-><init>()V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :pswitch_12
    new-instance v2, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;

    invoke-direct {v2}, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;-><init>()V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :pswitch_13
    new-instance v2, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;

    invoke-direct {v2}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;-><init>()V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :pswitch_14
    new-instance v2, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;

    invoke-direct {v2}, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;-><init>()V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :pswitch_15
    new-instance v2, Lcom/android/camera/fragment/beauty/BeautyLevelFragment;

    invoke-direct {v2}, Lcom/android/camera/fragment/beauty/BeautyLevelFragment;-><init>()V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    nop

    :goto_3
    goto/16 :goto_0

    :cond_1
    new-instance v1, Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;Ljava/util/List;)V

    iput-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyPagerAdapter:Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyPagerAdapter:Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/NoScrollViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    invoke-virtual {v0, v4}, Lcom/android/camera/ui/NoScrollViewPager;->setOffscreenPageLimit(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    invoke-virtual {v0, v3}, Lcom/android/camera/ui/NoScrollViewPager;->setFocusable(Z)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    sget-object v1, Lcom/android/camera/fragment/-$$Lambda$FragmentBeauty$TNJSatWOgRFKpHkGpIz0Xtjtopw;->INSTANCE:Lcom/android/camera/fragment/-$$Lambda$FragmentBeauty$TNJSatWOgRFKpHkGpIz0Xtjtopw;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/NoScrollViewPager;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x31
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x61f
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
    .end packed-switch
.end method

.method private isHiddenBeautyPanelOnShutter()Z
    .locals 2

    iget v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentMode:I

    const/16 v1, 0xa2

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentMode:I

    const/16 v1, 0xa1

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentMode:I

    const/16 v1, 0xae

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentMode:I

    const/16 v1, 0xb0

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public static synthetic lambda$hideBeautyLayout$1(Lcom/android/camera/fragment/FragmentBeauty;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBeauty;->onDismissFinished()V

    return-void
.end method

.method public static synthetic lambda$hideBeautyLayout$2(Lcom/android/camera/fragment/FragmentBeauty;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBeauty;->onDismissFinished()V

    return-void
.end method

.method static synthetic lambda$initViewPager$0(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method private onDismissFinished()V
    .locals 2

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBeauty;->resetFragment()V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBeauty;->isHiddenBeautyPanelOnShutter()Z

    move-result v1

    if-eqz v1, :cond_0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isRecording()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBeauty;->resetTips()V

    :cond_1
    return-void
.end method

.method private resetFragment()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mAdjustSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/SeekBarCompat;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/NoScrollViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyPagerAdapter:Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyPagerAdapter:Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;->recycleFragmentList(Landroid/support/v4/app/FragmentManager;)V

    iput-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyPagerAdapter:Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;

    :cond_0
    return-void
.end method

.method private resetTips()V
    .locals 5

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->reInitTipImage()V

    :cond_0
    iget v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentMode:I

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->shouldShowUltraWideStickyTip(I)Z

    move-result v1

    if-eqz v1, :cond_1

    if-eqz v0, :cond_1

    const/16 v1, 0xd

    const v2, 0x7f090240

    invoke-interface {v0, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directlyShowTips(II)V

    :cond_1
    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    invoke-interface {v0, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->updateTipBottomMargin(IZ)V

    :cond_2
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBeauty;->showZoomTipImage()V

    iget v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentMode:I

    const/16 v4, 0xa3

    if-eq v3, v4, :cond_5

    const/16 v4, 0xa5

    if-eq v3, v4, :cond_6

    const/16 v0, 0xa7

    if-eq v3, v0, :cond_4

    const/16 v0, 0xab

    if-eq v3, v0, :cond_3

    goto :goto_0

    :cond_3
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;

    if-eqz v0, :cond_7

    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;->showFNumberPanel(Z)V

    goto :goto_0

    :cond_4
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb5

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ManuallyAdjust;

    if-eqz v0, :cond_7

    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$ManuallyAdjust;->setManuallyLayoutVisible(Z)V

    goto :goto_0

    :cond_5
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v3

    const/16 v4, 0xc3

    invoke-virtual {v3, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v3

    check-cast v3, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;

    if-eqz v3, :cond_6

    invoke-interface {v3, v2}, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;->showOrHideChip(Z)V

    :cond_6
    if-eqz v0, :cond_7

    invoke-interface {v0, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->updateLyingDirectHint(ZZ)V

    :cond_7
    :goto_0
    return-void
.end method

.method private setAdjustSeekBarVisible(ZZ)V
    .locals 0

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mAdjustSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-virtual {p1}, Lcom/android/camera/ui/SeekBarCompat;->getVisibility()I

    move-result p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    if-eqz p2, :cond_1

    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mAdjustSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-direct {p1, p2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mAdjustSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mAdjustSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-virtual {p1}, Lcom/android/camera/ui/SeekBarCompat;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    if-eqz p2, :cond_4

    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mAdjustSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-direct {p1, p2}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_0

    :cond_4
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mAdjustSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-static {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    :goto_0
    return-void
.end method

.method private setSeekBarMode(II)V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentSettingBusiness:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    if-nez v0, :cond_0

    return-void

    :cond_0
    nop

    const/16 v0, 0x64

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const/16 p1, 0xc8

    iput p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mSeekBarMaxProgress:I

    nop

    nop

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mAdjustSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v2, 0x7f02002d

    invoke-virtual {p2, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/SeekBarCompat;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    move p2, v0

    move v2, v1

    goto :goto_0

    :pswitch_1
    iput v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mSeekBarMaxProgress:I

    nop

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mAdjustSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v3, 0x7f02019f

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/SeekBarCompat;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    nop

    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mAdjustSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    iget v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mSeekBarMaxProgress:I

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/SeekBarCompat;->setMax(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mAdjustSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/SeekBarCompat;->setSeekBarPinProgress(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mAdjustSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-virtual {p1, v2}, Lcom/android/camera/ui/SeekBarCompat;->setCenterTwoWayMode(Z)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentSettingBusiness:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    invoke-interface {p1}, Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;->getProgressByCurrentItem()I

    move-result p1

    mul-int/2addr p1, v1

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mAdjustSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-virtual {p2, p1}, Lcom/android/camera/ui/SeekBarCompat;->setProgress(I)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private setViewPagerPageByType(Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mComponentRunningShine:Lcom/android/camera/data/data/runing/ComponentRunningShine;

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->getItems()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/camera/data/data/ComponentDataItem;

    iget-object v3, v3, Lcom/android/camera/data/data/ComponentDataItem;->mValue:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    invoke-virtual {p1, v2, v1}, Lcom/android/camera/ui/NoScrollViewPager;->setCurrentItem(IZ)V

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method private showHideExtraLayout(ZLandroid/support/v4/app/Fragment;Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f0e0023

    invoke-static {p1, v0, p2, p3}, Lcom/android/camera/fragment/FragmentUtils;->addFragmentWithTag(Landroid/support/v4/app/FragmentManager;ILandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    invoke-static {p1, p3}, Lcom/android/camera/fragment/FragmentUtils;->removeFragmentByTag(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)Z

    :goto_0
    return-void
.end method

.method private showHideEyeLighting(Z)V
    .locals 3

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Lcom/android/camera/fragment/FragmentBeauty;->setAdjustSeekBarVisible(ZZ)V

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mi/config/a;->ga()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportBeautyMakeup()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    if-nez v1, :cond_0

    new-instance v1, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    invoke-direct {v1}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;-><init>()V

    iput-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xac

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    if-eqz p1, :cond_1

    const v2, 0x7f090214

    invoke-interface {v1, v0, v2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertTopHint(II)V

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    invoke-virtual {v2}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->getFragmentTag()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/android/camera/fragment/FragmentBeauty;->showHideExtraLayout(ZLandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBeauty;->extraEnterAnim()V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyExtraView:Landroid/view/View;

    new-instance v2, Lcom/android/camera/fragment/FragmentBeauty$5;

    invoke-direct {v2, p0}, Lcom/android/camera/fragment/FragmentBeauty$5;-><init>(Lcom/android/camera/fragment/FragmentBeauty;)V

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->enterAnim(Landroid/view/View;Landroid/support/v4/view/ViewPropertyAnimatorListener;)V

    goto :goto_0

    :cond_1
    const/16 v2, 0x8

    invoke-interface {v1, v2, v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertTopHint(II)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyExtraView:Landroid/view/View;

    new-instance v2, Lcom/android/camera/fragment/FragmentBeauty$6;

    invoke-direct {v2, p0}, Lcom/android/camera/fragment/FragmentBeauty$6;-><init>(Lcom/android/camera/fragment/FragmentBeauty;)V

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->exitAnim(Landroid/view/View;Landroid/support/v4/view/ViewPropertyAnimatorListener;)V

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBeauty;->extraExitAnim()V

    :goto_0
    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mIsEyeLightShow:Z

    :cond_2
    return-void
.end method

.method private showZoomTipImage()V
    .locals 2

    iget v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentMode:I

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->gB()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    :sswitch_1
    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    :sswitch_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$DualController;

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v1

    if-nez v1, :cond_3

    iget v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentMode:I

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result v1

    if-nez v1, :cond_3

    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelOn()Z

    move-result v1

    if-nez v1, :cond_3

    iget v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentMode:I

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->isMacroModeEnabled(I)Z

    move-result v1

    if-nez v1, :cond_3

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$DualController;->showZoomButton()V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    if-eqz v0, :cond_2

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->clearAlertStatus()V

    :cond_2
    nop

    :cond_3
    :goto_0
    return-void

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


# virtual methods
.method public accept(Ljava/lang/Integer;)V
    .locals 1
    .param p1    # Ljava/lang/Integer;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentSettingBusiness:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentSettingBusiness:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-interface {v0, p1}, Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;->setProgressForCurrentItem(I)V

    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/FragmentBeauty;->accept(Ljava/lang/Integer;)V

    return-void
.end method

.method public clearBeauty()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentSettingBusiness:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentSettingBusiness:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    invoke-interface {v0}, Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;->clearBeauty()V

    :cond_0
    return-void
.end method

.method public closeEyeLight()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mEyeLightFragment:Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/BeautyEyeLightFragment;->closeEyeLight()V

    :cond_0
    return-void
.end method

.method public dismiss(I)V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, v0, p1}, Lcom/android/camera/fragment/FragmentBeauty;->hideBeautyLayout(II)Z

    return-void
.end method

.method public getFragmentInto()I
    .locals 1

    const/16 v0, 0xfb

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    const v0, 0x7f04000b

    return v0
.end method

.method public getSupportedBeautyItems(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lcom/android/camera/data/data/runing/ComponentRunningShine$ShineType;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/TypeItem;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautySettingManager:Lcom/android/camera/fragment/beauty/BeautySettingManager;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mComponentRunningShine:Lcom/android/camera/data/data/runing/ComponentRunningShine;

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->getTypeElementsBeauty()Lcom/android/camera/data/data/runing/TypeElementsBeauty;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/android/camera/fragment/beauty/BeautySettingManager;->constructAndGetSetting(Ljava/lang/String;Lcom/android/camera/data/data/runing/TypeElementsBeauty;)Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;->getSupportedTypeArray(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method protected initView(Landroid/view/View;)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mIsRTL:Z

    const v0, 0x7f0e0020

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyContent:Landroid/view/View;

    const v0, 0x7f0e0023

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyExtraView:Landroid/view/View;

    const v0, 0x7f0e0022

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/NoScrollViewPager;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    const v0, 0x7f0e001f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ui/SeekBarCompat;

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mAdjustSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBeauty;->initShineType()V

    return-void
.end method

.method public isBeautyPanelShow()Z
    .locals 2

    iget v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isEyeLightShow()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mIsEyeLightShow:Z

    return v0
.end method

.method public isSeekBarVisible()Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mAdjustSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mAdjustSeekBar:Lcom/android/camera/ui/SeekBarCompat;

    invoke-virtual {v0}, Lcom/android/camera/ui/SeekBarCompat;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public needViewClear()Z
    .locals 1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelRearOn()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->needViewClear()Z

    move-result v0

    return v0
.end method

.method public onBackEvent(I)Z
    .locals 1

    packed-switch p1, :pswitch_data_0

    const/4 v0, 0x2

    goto :goto_0

    :pswitch_0
    const/4 v0, 0x1

    goto :goto_0

    :pswitch_1
    const/4 v0, 0x3

    nop

    :goto_0
    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/FragmentBeauty;->hideBeautyLayout(II)Z

    move-result p1

    return p1

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method public onMakeupItemSelected(Ljava/lang/String;Z)V
    .locals 2

    const-string v0, "pref_eye_light_type_key"

    const/4 v1, 0x1

    if-ne p1, v0, :cond_1

    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->isEyeLightShow()Z

    move-result p1

    xor-int/2addr p1, v1

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBeauty;->showHideEyeLighting(Z)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    invoke-direct {p0, p1, p1}, Lcom/android/camera/fragment/FragmentBeauty;->setAdjustSeekBarVisible(ZZ)V

    :goto_0
    return-void

    :cond_1
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentSettingBusiness:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    if-nez p2, :cond_2

    return-void

    :cond_2
    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentSettingBusiness:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    invoke-interface {p2, p1}, Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;->setCurrentType(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentSettingBusiness:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    invoke-interface {p2}, Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;->getProgressByCurrentItem()I

    move-result p2

    mul-int/2addr p2, v1

    iput p2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mActiveProgress:I

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentSettingBusiness:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    invoke-interface {p2}, Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;->getDefaultProgressByCurrentItem()I

    move-result p2

    mul-int/2addr p2, v1

    invoke-static {p1}, Lcom/android/camera/constant/BeautyConstant;->isSupportTwoWayAdjustable(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/FragmentBeauty;->setSeekBarMode(II)V

    goto :goto_1

    :cond_3
    invoke-direct {p0, v1, p2}, Lcom/android/camera/fragment/FragmentBeauty;->setSeekBarMode(II)V

    :goto_1
    invoke-direct {p0, v1, v1}, Lcom/android/camera/fragment/FragmentBeauty;->setAdjustSeekBarVisible(ZZ)V

    return-void
.end method

.method public onPause()V
    .locals 0

    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->onPause()V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentMode:I

    const/16 p2, 0xa3

    if-ne p1, p2, :cond_0

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 p2, 0xc3

    invoke-virtual {p1, p2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;

    if-eqz p1, :cond_0

    const/4 p2, 0x0

    invoke-interface {p1, p2}, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;->showOrHideChip(Z)V

    :cond_0
    return-void
.end method

.method public provideAnimateElement(ILjava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;I)V"
        }
    .end annotation

    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;I)V

    iget p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentState:I

    const/4 p2, -0x1

    if-ne p1, p2, :cond_0

    return-void

    :cond_0
    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/FragmentBeauty;->onBackEvent(I)Z

    return-void
.end method

.method protected provideEnterAnimation(I)Landroid/view/animation/Animation;
    .locals 2

    const/4 p1, 0x2

    new-array p1, p1, [I

    fill-array-data p1, :array_0

    invoke-static {p1}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object p1

    const-wide/16 v0, 0x118

    invoke-virtual {p1, v0, v1}, Landroid/view/animation/Animation;->setDuration(J)V

    new-instance v0, Lmiui/view/animation/QuinticEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuinticEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    return-object p1

    :array_0
    .array-data 4
        0xa7
        0xa1
    .end array-data
.end method

.method protected provideExitAnimation()Landroid/view/animation/Animation;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/FragmentBeauty;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    const/16 v0, 0xc2

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    const/16 v0, 0xb4

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mIsEyeLightShow:Z

    return-void
.end method

.method public resetBeauty()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentSettingBusiness:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentSettingBusiness:Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;

    invoke-interface {v0}, Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;->resetBeauty()V

    :cond_0
    return-void
.end method

.method public setClickEnable(Z)V
    .locals 3

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->setClickEnable(Z)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyPagerAdapter:Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyPagerAdapter:Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;->getFragmentList()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/Fragment;

    instance-of v2, v1, Lcom/android/camera/fragment/beauty/BeautyLevelFragment;

    if-eqz v2, :cond_0

    check-cast v1, Lcom/android/camera/fragment/beauty/BeautyLevelFragment;

    invoke-virtual {v1, p1}, Lcom/android/camera/fragment/beauty/BeautyLevelFragment;->setEnableClick(Z)V

    goto :goto_1

    :cond_0
    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method public show()V
    .locals 3

    iget v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentMode:I

    const/16 v1, 0xa3

    if-ne v0, v1, :cond_1

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc3

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;->showOrHideChip(Z)V

    :cond_1
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBeauty;->initShineType()V

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->getView()Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/android/camera/animation/type/SlideInOnSubscribe;

    const/16 v2, 0x50

    invoke-direct {v1, v0, v2}, Lcom/android/camera/animation/type/SlideInOnSubscribe;-><init>(Landroid/view/View;I)V

    const/16 v0, 0x118

    invoke-virtual {v1, v0}, Lcom/android/camera/animation/type/SlideInOnSubscribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    new-instance v1, Lmiui/view/animation/QuinticEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/QuinticEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Lcom/android/camera/animation/type/BaseOnSubScribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method public switchShineType(Ljava/lang/String;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/FragmentBeauty;->initShineType(Ljava/lang/String;Z)V

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBeauty;->setViewPagerPageByType(Ljava/lang/String;)V

    return-void
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/FragmentBeauty;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    const/16 v0, 0xc2

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    const/16 v0, 0xb4

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mSeekBarDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mSeekBarDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mSeekBarDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mIsEyeLightShow:Z

    return-void
.end method
