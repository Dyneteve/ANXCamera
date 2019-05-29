.class public Lcom/android/camera/fragment/bottom/FragmentBottomAction;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentBottomAction.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
.implements Lcom/android/camera/protocol/ModeProtocol$BottomMenuProtocol;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBeautyRecording;
.implements Lcom/android/camera/protocol/ModeProtocol$HandlerSwitcher;
.implements Lcom/android/camera/protocol/ModeProtocol$ModeChangeController;
.implements Lcom/android/camera/ui/CameraSnapView$SnapListener;
.implements Lcom/android/camera/ui/ModeSelectView$onModeClickedListener;


# static fields
.field public static final FRAGMENT_INFO:I = 0xf1

.field private static final MSG_SHOW_PROGRESS:I = 0x1

.field private static final TAG:Ljava/lang/String; = "FragmentBottomAction"


# instance fields
.field private mBackEnable:Z

.field private mBottomActionView:Landroid/widget/FrameLayout;

.field private mBottomAnimator:Landroid/animation/ValueAnimator;

.field private mBottomMenuLayout:Landroid/view/View;

.field private mBottomRecordingCameraPicker:Landroid/widget/ImageView;

.field private mBottomRecordingTime:Landroid/widget/TextView;

.field private mBottomRollDownHeight:I

.field private mCameraPickEnable:Z

.field private mCameraPicker:Landroid/widget/ImageView;

.field private mCaptureProgressDelay:I

.field private mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

.field private mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

.field private mCurrentBeautyActionMenuType:I

.field private mCurrentLiveActionMenuType:I

.field private mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

.field private mFilterListHeight:I

.field private mFragmentLayoutExtra:Landroid/view/View;

.field private mFragmentLayoutExtra2:Landroid/view/View;

.field private mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

.field private mHandler:Landroid/os/Handler;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "HandlerLeak"
        }
    .end annotation
.end field

.field private mInLoading:Z

.field private mInMimojiCreate:Z

.field private mInMimojiEdit:Z

.field private mIsBottomRollDown:Z

.field private mIsIntentAction:Z

.field private mIsShowLighting:Z

.field private mLastPauseTime:J

.field private mLongPressBurst:Z

.field private mMimojiBack:Landroid/widget/ImageView;

.field private mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

.field private mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

.field private mPostProcess:Landroid/widget/ProgressBar;

.field private mRecordProgressDelay:I

.field private mRecordingPause:Landroid/widget/ImageView;

.field private mRecordingReverse:Landroid/widget/ImageView;

.field private mRecordingSnap:Landroid/widget/ImageView;

.field private mReverseDialog:Landroid/app/AlertDialog;

.field private mShutterButton:Lcom/android/camera/ui/CameraSnapView;

.field private mSineEaseOut:Lmiui/view/animation/SineEaseOutInterpolator;

.field private mThumbnailImage:Landroid/widget/ImageView;

.field private mThumbnailImageLayout:Landroid/view/ViewGroup;

.field private mThumbnailProgress:Landroid/widget/ProgressBar;

.field private mV9bottomParentLayout:Landroid/widget/RelativeLayout;

.field private mVideoCaptureEnable:Z

.field private mVideoPauseSupported:Z

.field private mVideoRecordingPaused:Z

.field private mVideoRecordingStarted:Z

.field private mVideoReverseEnable:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsBottomRollDown:Z

    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$1;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ProgressBar;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Lcom/android/camera/ui/ModeSelectView;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    return p0
.end method

.method static synthetic access$1200(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    return p0
.end method

.method static synthetic access$1400(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBackEnable:Z

    return p0
.end method

.method static synthetic access$1600(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mMimojiBack:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$1700(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ProgressBar;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    return-object p0
.end method

.method static synthetic access$302(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mReverseDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Lcom/android/camera/ui/CameraSnapView;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    return-object p0
.end method

.method static synthetic access$500(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Lcom/android/camera/fragment/bottom/BottomActionMenu;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    return-object p0
.end method

.method static synthetic access$600(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    return p0
.end method

.method static synthetic access$700(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/widget/ImageView;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$800(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Landroid/view/ViewGroup;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    return-object p0
.end method

.method static synthetic access$900(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    return p0
.end method

.method private adjustViewBackground(Landroid/view/View;I)V
    .locals 2

    const v0, 0x7f0b003e

    const/16 v1, 0xa5

    if-ne p2, v1, :cond_0

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    return-void

    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/data/data/runing/DataItemRunning;->getUiStyle()I

    move-result p2

    const/4 v1, 0x1

    if-eq p2, v1, :cond_1

    const/4 v1, 0x3

    if-eq p2, v1, :cond_1

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0

    :cond_1
    const p2, 0x7f0b004b

    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    :goto_0
    return-void
.end method

.method private animateViews(ILjava/util/List;Landroid/view/View;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    if-nez p2, :cond_0

    invoke-static {p3}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_0

    :cond_0
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    invoke-direct {p1, p3}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    if-nez p2, :cond_2

    invoke-static {p3}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_0

    :cond_2
    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    invoke-direct {p1, p3}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_0
    return-void
.end method

.method private changeCamera(Landroid/view/View;)V
    .locals 10

    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_0

    nop

    move v4, v3

    goto :goto_0

    :cond_0
    nop

    move v4, v2

    :goto_0
    invoke-static {}, Lcom/android/camera/HybridZoomingSystem;->clearZoomRatioHistory()V

    invoke-virtual {v0, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCameraId(I)V

    const-wide/16 v5, 0x12c

    if-ne v4, v3, :cond_1

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const/high16 v0, -0x3ccc0000    # -180.0f

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->rotationBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_1

    :cond_1
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const/high16 v0, 0x43340000    # 180.0f

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->rotationBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    :goto_1
    const-string p1, "FragmentBottomAction"

    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v5, "switch camera from %d to %d, for module 0x%x"

    const/4 v6, 0x3

    new-array v7, v6, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v3

    iget v8, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v9, 0x2

    aput-object v8, v7, v9

    invoke-static {v0, v5, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-ne v1, v3, :cond_2

    move p1, v3

    goto :goto_2

    :cond_2
    move p1, v2

    :goto_2
    if-ne v4, v3, :cond_3

    move v2, v3

    nop

    :cond_3
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-static {p1, v2, v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackSwitchCameraStart(ZZI)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xac

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    const/4 v0, 0x4

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->removeExtraMenu(I)V

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/4 v2, 0x5

    const/16 v5, 0xa2

    if-eq v1, v5, :cond_6

    const/16 v4, 0xa6

    if-eq v1, v4, :cond_5

    packed-switch v1, :pswitch_data_0

    packed-switch v1, :pswitch_data_1

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/Camera;

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-static {v0}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/android/camera/module/loader/StartControl;->setResetType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {v0, v9}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    goto/16 :goto_5

    :pswitch_0
    nop

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd9

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;

    if-eqz v0, :cond_4

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;->isOnCreateMimoji()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->mimojiStart()V

    new-array v0, v9, [I

    fill-array-data v0, :array_0

    invoke-interface {p1, v3, v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->disableMenuItem(Z[I)V

    goto :goto_3

    :cond_4
    move v6, v9

    :goto_3
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/Camera;

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-static {v0}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/android/camera/module/loader/StartControl;->setResetType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {v0, v6}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    goto/16 :goto_5

    :pswitch_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/Camera;

    invoke-static {v4}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/module/loader/StartControl;->setResetType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {v0, v9}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    goto/16 :goto_5

    :pswitch_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1, v5}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/Camera;

    invoke-static {v5}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {v0, v9}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    goto :goto_5

    :cond_5
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    const/16 v1, 0xb0

    invoke-virtual {p1, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/Camera;

    invoke-static {v1}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/module/loader/StartControl;->setResetType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {v0, v9}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    goto :goto_5

    :cond_6
    nop

    if-nez v4, :cond_9

    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/DataRepository;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/camera/data/backup/DataBackUp;->isLastVideoFastMotion()Z

    move-result v0

    if-eqz v0, :cond_7

    const/16 p1, 0xa9

    goto :goto_4

    :cond_7
    invoke-interface {p1}, Lcom/android/camera/data/backup/DataBackUp;->isLastVideoSlowMotion()Z

    move-result v0

    if-eqz v0, :cond_8

    const/16 p1, 0xa8

    goto :goto_4

    :cond_8
    invoke-interface {p1}, Lcom/android/camera/data/backup/DataBackUp;->isLastVideoHFRMode()Z

    move-result p1

    if-eqz p1, :cond_9

    const/16 p1, 0xaa

    goto :goto_4

    :cond_9
    move p1, v5

    :goto_4
    if-eq p1, v5, :cond_a

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    :cond_a
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/Camera;

    invoke-static {p1}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    invoke-virtual {p1, v2}, Lcom/android/camera/module/loader/StartControl;->setResetType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    invoke-virtual {p1, v3}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    invoke-virtual {p1, v9}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    nop

    :goto_5
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_b

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v0, 0x7f090102

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v0, 0x8000

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/EdgeHorizonScrollView;->sendAccessibilityEvent(I)V

    :cond_b
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xa8
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xb0
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :array_0
    .array-data 4
        0xe1
        0xc1
    .end array-data
.end method

.method private initThumbLayoutByIntent()V
    .locals 4

    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-nez v0, :cond_3

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->startFromSecureKeyguard()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->isGalleryLocked()Z

    move-result v3

    if-eqz v3, :cond_1

    :cond_0
    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->isJumpBack()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v0

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v3, v2}, Lcom/android/camera/ThumbnailUpdater;->setThumbnail(Lcom/android/camera/Thumbnail;ZZ)V

    return-void

    :cond_1
    invoke-static {}, Lcom/android/camera/permission/PermissionManager;->checkStoragePermissions()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ThumbnailUpdater;->getLastThumbnail()V

    :cond_2
    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    const v1, 0x7f020204

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    :goto_0
    return-void
.end method

.method private isFPS960()Z
    .locals 2

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xac

    if-ne v0, v1, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fB()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigSlowMotion()Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->isSlowMotionFps960()Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private isThumbLoading()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInLoading:Z

    return v0
.end method

.method private setProgressBarVisible(I)V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v0

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    const-wide/16 v0, 0x12c

    const/4 v2, 0x2

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Landroid/widget/ProgressBar;->setAlpha(F)V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    new-array p1, v2, [F

    fill-array-data p1, :array_0

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    const-wide/16 v0, 0xa0

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    new-instance v0, Landroid/view/animation/PathInterpolator;

    const v1, 0x3dcccccd    # 0.1f

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x3e800000    # 0.25f

    invoke-direct {v0, v3, v1, v3, v2}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$5;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$5;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result p1

    const/16 v3, 0x8

    if-ne p1, v3, :cond_2

    return-void

    :cond_2
    new-array p1, v2, [F

    fill-array-data p1, :array_1

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v0, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$6;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$6;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$7;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$7;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    :goto_0
    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private setRecordingTimeState(I)V
    .locals 1

    packed-switch p1, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    :pswitch_1
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_1

    :pswitch_2
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_0

    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_2

    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_1

    :pswitch_3
    iget p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v0, 0xae

    if-eq p1, v0, :cond_1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    const-string v0, "00:15"

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    nop

    :cond_2
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private showReverseConfirmDialog()V
    .locals 3

    const-string v0, "live\u5f55\u5236\u56de\u9000"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveClick(Ljava/lang/String;)V

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f09027a

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    new-instance v1, Lcom/android/camera/fragment/bottom/FragmentBottomAction$8;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$8;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    const v2, 0x7f09027b

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    new-instance v1, Lcom/android/camera/fragment/bottom/FragmentBottomAction$9;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$9;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;)V

    const v2, 0x7f0901b7

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mReverseDialog:Landroid/app/AlertDialog;

    return-void
.end method

.method private startBottomAnimation(Z)V
    .locals 7

    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsBottomRollDown:Z

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsBottomRollDown:Z

    const v0, 0x3f666666    # 0.9f

    const-wide/16 v1, 0x12c

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1, v4}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const-wide/16 v5, 0x96

    invoke-virtual {p1, v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFilterListHeight:I

    int-to-float v5, v5

    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget v3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRollDownHeight:I

    int-to-float v3, v3

    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {p1, v4}, Landroid/support/v4/view/ViewCompat;->setScaleX(Landroid/view/View;F)V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {p1, v4}, Landroid/support/v4/view/ViewCompat;->setScaleY(Landroid/view/View;F)V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->scaleX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->scaleY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto/16 :goto_0

    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const-wide/16 v5, 0x32

    invoke-virtual {p1, v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const-wide/16 v5, 0xfa

    invoke-virtual {p1, v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mSineEaseOut:Lmiui/view/animation/SineEaseOutInterpolator;

    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    iget v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFilterListHeight:I

    int-to-float v5, v5

    invoke-static {p1, v5}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    iget v5, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRollDownHeight:I

    int-to-float v5, v5

    invoke-static {p1, v5}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setScaleX(Landroid/view/View;F)V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setScaleY(Landroid/view/View;F)V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->scaleX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->scaleY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    :goto_0
    return-void
.end method

.method private startExtraLayoutAnimation(Landroid/view/View;Z)V
    .locals 6

    const/high16 v0, 0x3f800000    # 1.0f

    const-wide/16 v1, 0x12c

    const/4 v3, 0x0

    if-eqz p2, :cond_0

    iget p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFilterListHeight:I

    neg-int p2, p2

    int-to-float p2, p2

    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$2;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$2;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Landroid/view/View;)V

    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_0

    :cond_0
    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    const-wide/16 v4, 0x96

    invoke-virtual {p2, v4, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mSineEaseOut:Lmiui/view/animation/SineEaseOutInterpolator;

    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    invoke-virtual {p2, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFilterListHeight:I

    neg-int v0, v0

    int-to-float v0, v0

    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$3;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$3;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Landroid/view/View;)V

    invoke-virtual {p2, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    :goto_0
    return-void
.end method

.method private startExtraLayoutExchangeAnimation(Landroid/view/View;)V
    .locals 3

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFilterListHeight:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const-wide/16 v1, 0xfa

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Lcom/android/camera/fragment/bottom/FragmentBottomAction$4;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$4;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    return-void
.end method

.method private updateBottomInRecording(ZZ)V
    .locals 5

    const/16 v0, 0x8

    const/4 v1, 0x1

    if-eqz p1, :cond_0

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v2}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v2

    if-eq v2, v0, :cond_0

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    :cond_0
    iget v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v3, 0xa2

    const/4 v4, 0x0

    if-eq v2, v3, :cond_5

    const/16 v3, 0xac

    if-eq v2, v3, :cond_4

    const/16 v3, 0xae

    if-eq v2, v3, :cond_3

    const/16 v3, 0xb1

    if-eq v2, v3, :cond_1

    packed-switch v2, :pswitch_data_0

    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBackEnable:Z

    goto :goto_1

    :cond_1
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    iget-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInMimojiCreate:Z

    if-eqz v2, :cond_2

    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBackEnable:Z

    goto :goto_1

    :cond_2
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBackEnable:Z

    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    goto :goto_1

    :cond_3
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    goto :goto_1

    :cond_4
    :pswitch_0
    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBackEnable:Z

    goto :goto_1

    :cond_5
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->isIntentAction()Z

    move-result v2

    if-nez v2, :cond_6

    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoCaptureVisible()Z

    move-result v2

    iput-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    :cond_6
    invoke-static {}, Lcom/mi/config/b;->gY()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v2

    if-nez v2, :cond_7

    goto :goto_0

    :cond_7
    move v1, v4

    :goto_0
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBackEnable:Z

    nop

    :goto_1
    if-eqz p1, :cond_a

    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_8

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    const v3, 0x7f02016c

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setSoundEffectsEnabled(Z)V

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    :cond_8
    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    if-eqz v1, :cond_9

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v3, 0x7f02016a

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setSoundEffectsEnabled(Z)V

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    :cond_9
    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    if-eqz v1, :cond_a

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    const v2, 0x7f02012a

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setSoundEffectsEnabled(Z)V

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_a
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_b
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    if-eqz p2, :cond_c

    const-wide/16 v1, 0xfa

    goto :goto_2

    :cond_c
    const-wide/16 v1, 0x0

    :goto_2
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$10;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Z)V

    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    new-instance v0, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction$11;-><init>(Lcom/android/camera/fragment/bottom/FragmentBottomAction;Z)V

    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xa8
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public animateShineBeauty(Z)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->animateShineBeauty(Z)V

    return-void
.end method

.method public canSnap()Z
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isBlockSnap()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public canSwipeChangeMode()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInPreviewSurface()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public changeModeByGravity(II)V
    .locals 7

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x5

    const/4 v2, 0x3

    const v3, 0x800003

    const v4, 0x800005

    if-eqz v0, :cond_2

    if-ne p1, v2, :cond_1

    nop

    :goto_0
    move p1, v4

    goto :goto_2

    :cond_1
    if-ne p1, v1, :cond_4

    goto :goto_1

    :cond_2
    if-ne p1, v2, :cond_3

    nop

    :goto_1
    move p1, v3

    goto :goto_2

    :cond_3
    if-ne p1, v1, :cond_4

    goto :goto_0

    :cond_4
    :goto_2
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-static {v0}, Lcom/android/camera/data/data/global/ComponentModuleList;->getTransferredMode(I)I

    move-result v0

    nop

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/ComponentModuleList;->getItems()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    move v5, v2

    :goto_3
    if-ge v5, v1, :cond_6

    iget-object v6, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    invoke-virtual {v6, v5}, Lcom/android/camera/data/data/global/ComponentModuleList;->getMode(I)I

    move-result v6

    if-ne v6, v0, :cond_5

    nop

    nop

    move v2, v5

    goto :goto_4

    :cond_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    :cond_6
    :goto_4
    if-eq p1, v3, :cond_8

    if-eq p1, v4, :cond_7

    goto :goto_5

    :cond_7
    add-int/lit8 v1, v1, -0x1

    if-ge v2, v1, :cond_9

    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_8
    if-lez v2, :cond_9

    add-int/lit8 v2, v2, -0x1

    :cond_9
    :goto_5
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    invoke-virtual {p1, v2}, Lcom/android/camera/data/data/global/ComponentModuleList;->getMode(I)I

    move-result p1

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->changeModeByNewMode(II)V

    return-void
.end method

.method public changeModeByNewMode(II)V
    .locals 4

    const/16 v0, 0xa6

    if-ne p1, v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fR()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p1, 0xb0

    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    if-ne p1, v0, :cond_1

    return-void

    :cond_1
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xa2

    if-eq v0, v1, :cond_2

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :cond_2
    :pswitch_0
    if-eq p1, v1, :cond_7

    packed-switch p1, :pswitch_data_1

    :goto_0
    const/16 v0, 0xae

    const/4 v1, 0x1

    if-ne p1, v0, :cond_3

    invoke-static {}, Lcom/android/camera/CameraSettings;->isLiveModuleClicked()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->setLiveModuleClicked(Z)V

    :cond_3
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    const/16 v2, 0xa3

    if-ne p1, v2, :cond_4

    const-string p1, "SQUARE"

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getTempRatioGlobal(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigRatio()Lcom/android/camera/data/data/config/ComponentConfigRatio;

    move-result-object v3

    invoke-virtual {v3, v2, p1}, Lcom/android/camera/data/data/config/ComponentConfigRatio;->getMappingModeByRatio(ILjava/lang/String;)I

    move-result p1

    :cond_4
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isThumbLoading()Z

    move-result v2

    if-eqz v2, :cond_5

    return-void

    :cond_5
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xa1

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    if-eqz v2, :cond_6

    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v2

    if-eqz v2, :cond_6

    return-void

    :cond_6
    iput p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-virtual {v0, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/Camera;

    invoke-static {p1}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setStartDelay(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setResetType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    const/4 p2, 0x2

    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    return-void

    :cond_7
    :pswitch_1
    return-void

    :pswitch_data_0
    .packed-switch 0xa8
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xa8
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public expandShineBottomMenu(Lcom/android/camera/data/data/runing/ComponentRunningShine;)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-virtual {v0, p1, v1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->expandShine(Lcom/android/camera/data/data/runing/ComponentRunningShine;I)V

    return-void
.end method

.method public filterUiChange()V
    .locals 0

    return-void
.end method

.method public forceSwitchFront()Z
    .locals 2

    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->onClick(Landroid/view/View;)V

    return v1
.end method

.method public getBeautyActionMenuType()I
    .locals 1

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentBeautyActionMenuType:I

    return v0
.end method

.method public getFragmentInto()I
    .locals 1

    const/16 v0, 0xf1

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    const v0, 0x7f04000f

    return v0
.end method

.method public hideExtra()V
    .locals 2

    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->showOrHideLighting(Z)V

    :cond_0
    return-void
.end method

.method protected initView(Landroid/view/View;)V
    .locals 3

    const v0, 0x7f0d0029

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomActionView:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomActionView:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a0077

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRollDownHeight:I

    const v0, 0x7f0d0033

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    nop

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0a0071

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    sget v2, Lcom/android/camera/Util;->sNavigationBarHeight:I

    add-int/2addr v1, v2

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getComponentModuleList()Lcom/android/camera/data/data/global/ComponentModuleList;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    new-instance v0, Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0d002a

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout;

    invoke-direct {v0, v1, v2}, Lcom/android/camera/fragment/bottom/BottomActionMenu;-><init>(Landroid/content/Context;Landroid/widget/FrameLayout;)V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getCameraOperateMenuView()Lcom/android/camera/ui/EdgeHorizonScrollView;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v0, 0x7f0d002b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomMenuLayout:Landroid/view/View;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getCameraOperateSelectView()Lcom/android/camera/ui/ModeSelectView;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    iget v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/ui/ModeSelectView;->init(Lcom/android/camera/data/data/global/ComponentModuleList;I)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {v0, p0}, Lcom/android/camera/ui/ModeSelectView;->setOnModeClickedListener(Lcom/android/camera/ui/ModeSelectView$onModeClickedListener;)V

    const v0, 0x7f0d0034

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    const v1, 0x7f0d0035

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    const v0, 0x7f0d0038

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    const v0, 0x7f0d0037

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v0, 0x7f0d0039

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/CameraSnapView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    const v0, 0x7f0d003c

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    const v0, 0x7f0d003d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    const v0, 0x7f0d003e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    const v0, 0x7f0d002f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra:Landroid/view/View;

    const v0, 0x7f0d0030

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra2:Landroid/view/View;

    const v0, 0x7f0d003a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    const v0, 0x7f0d0031

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    const v0, 0x7f0d0032

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0, p0}, Lcom/android/camera/ui/CameraSnapView;->setSnapListener(Lcom/android/camera/ui/CameraSnapView$SnapListener;)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/CameraSnapView;->setSnapClickEnable(Z)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f100004

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCaptureProgressDelay:I

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f100005

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordProgressDelay:I

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0d0036

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mMimojiBack:Landroid/widget/ImageView;

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mMimojiBack:Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {p1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object p1

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->adjustViewBackground(Landroid/view/View;I)V

    iget p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/4 v0, 0x0

    const/4 v2, 0x2

    invoke-virtual {p0, p1, v0, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->provideAnimateElement(ILjava/util/List;I)V

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->isIntentAction()Z

    move-result p1

    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    new-instance p1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {p1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    new-instance p1, Lmiui/view/animation/SineEaseOutInterpolator;

    invoke-direct {p1}, Lmiui/view/animation/SineEaseOutInterpolator;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mSineEaseOut:Lmiui/view/animation/SineEaseOutInterpolator;

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a000d

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFilterListHeight:I

    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    invoke-static {p1, v1}, Lcom/android/camera/Util;->setAccessibilityFocusable(Landroid/view/View;Z)V

    :cond_0
    return-void
.end method

.method public isShowFilterView()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isShowLightingView()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    return v0
.end method

.method public notifyAfterFrameAvailable(I)V
    .locals 3

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->notifyAfterFrameAvailable(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    if-nez p1, :cond_0

    new-instance p1, Lcom/android/camera/fragment/FragmentLighting;

    invoke-direct {p1}, Lcom/android/camera/fragment/FragmentLighting;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f0d0030

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {v2}, Lcom/android/camera/fragment/FragmentLighting;->getFragmentTag()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v0, v1, v2}, Lcom/android/camera/fragment/FragmentUtils;->addFragmentWithTag(Landroid/support/v4/app/FragmentManager;ILandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentLighting;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/FragmentLighting;->reInitAdapterBgMode(Z)V

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {p1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->initBeautyMenuView()V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {p1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object p1

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->adjustViewBackground(Landroid/view/View;I)V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result p1

    if-nez p1, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->processingFinish()V

    :cond_2
    return-void
.end method

.method public notifyDataChanged(II)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->notifyDataChanged(II)V

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->isIntentAction()Z

    move-result p1

    iget-boolean p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    if-eq p1, p2, :cond_0

    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-virtual {p1, p2, v0}, Lcom/android/camera/ui/ModeSelectView;->init(Lcom/android/camera/data/data/global/ComponentModuleList;I)V

    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->initThumbLayoutByIntent()V

    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInLoading:Z

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentLighting;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentLighting;->reInit()V

    :cond_1
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_3

    const/16 p1, 0xa2

    iget p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    if-ne p1, p2, :cond_2

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    const p2, 0x7f0900d5

    invoke-virtual {p0, p2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/CameraSnapView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    const p2, 0x7f0900d4

    invoke-virtual {p0, p2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/android/camera/ui/CameraSnapView;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_3
    :goto_0
    return-void
.end method

.method public onAngleChanged(F)V
    .locals 0

    return-void
.end method

.method public onBackEvent(I)Z
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-eqz p1, :cond_0

    move p1, v1

    goto :goto_0

    :cond_0
    nop

    move p1, v0

    :goto_0
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->hideExtra()V

    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xac

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateContentDescription()V

    :cond_1
    return v1

    :cond_2
    return v0
.end method

.method public onBeautyRecordingStart()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    return-void
.end method

.method public onBeautyRecordingStop()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    return-void
.end method

.method public onBottomMenuAnimate(II)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->bottomMenuAnimate(II)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

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

    if-nez v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ActivityBase;

    invoke-virtual {v1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/camera/module/Module;->isIgnoreTouchEvent()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string p1, "FragmentBottomAction"

    const-string v0, "onClick: ignore click event, because module isn\'t ready"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_6

    :pswitch_1
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoReverseEnable:Z

    if-eqz p1, :cond_5

    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-nez p1, :cond_3

    goto :goto_0

    :cond_3
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->hasSegments()Z

    move-result p1

    if-nez p1, :cond_4

    return-void

    :cond_4
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->showReverseConfirmDialog()V

    goto/16 :goto_6

    :cond_5
    :goto_0
    return-void

    :pswitch_2
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoCaptureEnable:Z

    if-eqz p1, :cond_9

    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-nez p1, :cond_6

    goto :goto_2

    :cond_6
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ActivityBase;

    if-eqz p1, :cond_8

    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v0

    instance-of v0, v0, Lcom/android/camera/module/VideoModule;

    if-nez v0, :cond_7

    goto :goto_1

    :cond_7
    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object p1

    check-cast p1, Lcom/android/camera/module/VideoModule;

    invoke-virtual {p1}, Lcom/android/camera/module/VideoModule;->takeVideoSnapShoot()Z

    goto/16 :goto_6

    :cond_8
    :goto_1
    const-string p1, "FragmentBottomAction"

    const-string v0, "onClick: recording snap is not allowed!!!"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_9
    :goto_2
    return-void

    :pswitch_3
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_a

    return-void

    :cond_a
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isThumbLoading()Z

    move-result v0

    if-eqz v0, :cond_b

    return-void

    :cond_b
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->hideExtra()V

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->changeCamera(Landroid/view/View;)V

    goto/16 :goto_6

    :pswitch_4
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoPauseSupported:Z

    if-eqz p1, :cond_11

    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-nez p1, :cond_c

    goto :goto_5

    :cond_c
    iget p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v0, 0xa2

    if-eq p1, v0, :cond_10

    const/16 v0, 0xae

    if-eq p1, v0, :cond_d

    packed-switch p1, :pswitch_data_1

    return-void

    :cond_d
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLastPauseTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-lez p1, :cond_e

    const-wide/16 v2, 0x1f4

    cmp-long p1, v0, v2

    if-gez p1, :cond_e

    return-void

    :cond_e
    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingPaused:Z

    if-eqz p1, :cond_f

    const-string p1, "live\u5f55\u5236\u7ee7\u7eed"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveClick(Ljava/lang/String;)V

    goto :goto_3

    :cond_f
    const-string p1, "live\u5f55\u5236\u6682\u505c"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveClick(Ljava/lang/String;)V

    :goto_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLastPauseTime:J

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ActivityBase;

    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object p1

    check-cast p1, Lcom/android/camera/module/LiveModule;

    invoke-virtual {p1}, Lcom/android/camera/module/LiveModule;->onPauseButtonClick()V

    goto :goto_4

    :cond_10
    :pswitch_5
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ActivityBase;

    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object p1

    check-cast p1, Lcom/android/camera/module/VideoModule;

    invoke-virtual {p1}, Lcom/android/camera/module/VideoModule;->onPauseButtonClick()V

    nop

    :goto_4
    goto :goto_6

    :cond_11
    :goto_5
    return-void

    :pswitch_6
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInMimojiCreate:Z

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mMimojiBack:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    const/16 v1, 0xb1

    invoke-virtual {v0, v1, p1}, Lcom/android/camera/ui/CameraSnapView;->intoPattern(IZ)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xd4

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onMimojiCreateBack()V

    goto :goto_6

    :pswitch_7
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isThumbLoading()Z

    move-result p1

    if-eqz p1, :cond_12

    return-void

    :cond_12
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->isIntentAction()Z

    move-result p1

    if-nez p1, :cond_13

    const/4 p1, 0x0

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onThumbnailClicked(Landroid/view/View;)V

    goto :goto_6

    :cond_13
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onReviewCancelClicked()V

    goto :goto_6

    :pswitch_8
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingPaused:Z

    if-nez v0, :cond_14

    return-void

    :cond_14
    const-string v0, "live\u5f55\u5236\u5207\u6362"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveClick(Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->changeCamera(Landroid/view/View;)V

    nop

    :goto_6
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x7f0d0032
        :pswitch_8
        :pswitch_0
        :pswitch_7
        :pswitch_0
        :pswitch_6
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xa8
        :pswitch_5
        :pswitch_5
        :pswitch_5
    .end packed-switch
.end method

.method public onHandleSwitcher(I)Z
    .locals 2

    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    const/4 v1, 0x1

    if-eqz v0, :cond_3

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/FragmentLighting;->switchLighting(I)V

    :cond_2
    return v1

    :cond_3
    :goto_0
    return v1
.end method

.method public onModeClicked(I)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isShowFilterView()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isShowLightingView()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->changeModeByNewMode(II)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public onResume()V
    .locals 0

    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->onResume()V

    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->initThumbLayoutByIntent()V

    return-void
.end method

.method public onSnapClick()V
    .locals 4

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "FragmentBottomAction"

    const-string v1, "onSnapClick: disabled"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_1

    const-string v0, "FragmentBottomAction"

    const-string v1, "onSnapClick: no context"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-interface {v1}, Lcom/android/camera/module/Module;->isIgnoreTouchEvent()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v0, "FragmentBottomAction"

    const-string v1, "onSnapClick: ignore onSnapClick event, because module isn\'t ready"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "FragmentBottomAction"

    const-string v1, "onSnapClick: ignore onSnapClick event, because screen slide is off"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_3
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    if-nez v0, :cond_4

    const-string v0, "FragmentBottomAction"

    const-string v1, "onSnapClick: no camera action"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_4
    const-string v1, "FragmentBottomAction"

    const-string v2, "onSnapClick"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xa

    packed-switch v1, :pswitch_data_0

    :pswitch_0
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isBlockSnap()Z

    move-result v1

    if-eqz v1, :cond_8

    const-string v0, "FragmentBottomAction"

    const-string v1, "onSnapClick: block snap"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_1
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v1

    if-eqz v1, :cond_5

    const-string v0, "FragmentBottomAction"

    const-string v1, "onSnapClick: doing action"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_5
    :pswitch_2
    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    const/4 v3, 0x1

    if-nez v1, :cond_6

    iput-boolean v3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    :cond_6
    iget-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInMimojiCreate:Z

    if-eqz v1, :cond_7

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd9

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;

    if-eqz v0, :cond_9

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;->onCreateCapture()Z

    move-result v0

    if-eqz v0, :cond_9

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInMimojiCreate:Z

    iput-boolean v3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInMimojiEdit:Z

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mMimojiBack:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    :cond_7
    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonClick(I)V

    goto :goto_0

    :cond_8
    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonClick(I)V

    nop

    :cond_9
    :goto_0
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v0

    if-eqz v0, :cond_c

    const/16 v0, 0xa2

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    if-ne v0, v1, :cond_b

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isRecording()Z

    move-result v0

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v1, 0x7f090104

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_1

    :cond_a
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v1, 0x7f090105

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_1

    :cond_b
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v1, 0x7f090103

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setContentDescription(Ljava/lang/CharSequence;)V

    :goto_1
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v1, 0x8000

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->sendAccessibilityEvent(I)V

    :cond_c
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onSnapLongPress()V
    .locals 3

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

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

    if-nez v0, :cond_1

    return-void

    :cond_1
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v1

    if-eqz v1, :cond_2

    return-void

    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/android/camera/Camera;

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {v1}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v1

    if-eqz v1, :cond_3

    return-void

    :cond_3
    const-string v1, "FragmentBottomAction"

    const-string v2, "onSnapLongPress"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonLongClick()Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLongPressBurst:Z

    :cond_4
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xb1

    if-ne v0, v1, :cond_5

    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInMimojiCreate:Z

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    const/16 v1, 0xa2

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/ui/CameraSnapView;->intoPattern(IZ)V

    :cond_5
    return-void
.end method

.method public onSnapLongPressCancelIn()V
    .locals 3

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

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

    if-nez v0, :cond_1

    return-void

    :cond_1
    const-string v1, "FragmentBottomAction"

    const-string v2, "onSnapLongPressCancelIn"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonLongClickCancel(Z)V

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xa3

    if-eq v0, v1, :cond_3

    const/16 v1, 0xa5

    if-eq v0, v1, :cond_2

    const/16 v1, 0xa7

    if-eq v0, v1, :cond_2

    const/16 v1, 0xab

    if-eq v0, v1, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->onSnapClick()V

    goto :goto_0

    :cond_3
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLongPressBurst:Z

    if-eqz v0, :cond_4

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLongPressBurst:Z

    :cond_4
    :goto_0
    return-void
.end method

.method public onSnapLongPressCancelOut()V
    .locals 3

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

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

    if-nez v0, :cond_1

    return-void

    :cond_1
    const-string v1, "FragmentBottomAction"

    const-string v2, "onSnapLongPressCancelOut"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonLongClickCancel(Z)V

    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLongPressBurst:Z

    if-eqz v0, :cond_2

    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mLongPressBurst:Z

    :cond_2
    return-void
.end method

.method public onSnapPrepare()V
    .locals 3

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

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

    if-nez v0, :cond_1

    return-void

    :cond_1
    const-string v1, "FragmentBottomAction"

    const-string v2, "onSnapPrepare"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x1

    const/4 v2, 0x2

    invoke-interface {v0, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonFocus(ZI)V

    return-void
.end method

.method public onSwitchBeautyActionMenu(I)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_0
    iput p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentBeautyActionMenuType:I

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1, v1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->switchMenuMode(IIZ)V

    return-void
.end method

.method public onSwitchCameraActionMenu(I)V
    .locals 2

    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xae

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->switchMenuMode(IZ)V

    return-void
.end method

.method public onSwitchLiveActionMenu(I)V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_0
    iput p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentLiveActionMenuType:I

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    const/4 v1, 0x2

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p1, v2}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->switchMenuMode(IIZ)V

    return-void
.end method

.method public onTrackSnapMissTaken(J)V
    .locals 4

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xba

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;

    if-nez v0, :cond_1

    return-void

    :cond_1
    const-string v1, "FragmentBottomAction"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onTrackSnapMissTaken "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, "ms"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;->onTrackShutterButtonMissTaken(J)V

    return-void
.end method

.method public onTrackSnapTaken(J)V
    .locals 4

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xba

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;

    if-nez v0, :cond_1

    return-void

    :cond_1
    const-string v1, "FragmentBottomAction"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onTrackSnapTaken "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, "ms"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;->onTrackShutterButtonTaken(J)V

    return-void
.end method

.method public processingAudioCapture(Z)V
    .locals 0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->startRing()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->stopRing()V

    :goto_0
    return-void
.end method

.method public processingFailed()V
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->updateLoading(Z)V

    return-void
.end method

.method public processingFinish()V
    .locals 4

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/CameraSnapView;->setVisibility(I)V

    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setEnabled(Z)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/ModeSelectView;->setEnabled(Z)V

    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingPaused:Z

    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setProgressBarVisible(I)V

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v2}, Lcom/android/camera/ui/CameraSnapView;->showRoundPaintItem()V

    iget v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v3, 0xae

    if-eq v2, v3, :cond_3

    const/16 v3, 0xb1

    if-eq v2, v3, :cond_2

    goto :goto_0

    :cond_2
    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInMimojiCreate:Z

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mMimojiBack:Landroid/widget/ImageView;

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ModeSelectView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0, v3, v1}, Lcom/android/camera/ui/CameraSnapView;->intoPattern(IZ)V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ModeSelectView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setRecordingTimeState(I)V

    nop

    :goto_0
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v3

    invoke-static {v1, v0, v1, v2, v3}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->generate(ZIZZZ)Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->configVariables()Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v2, v0}, Lcom/android/camera/ui/CameraSnapView;->triggerAnimation(Lcom/android/camera/fragment/bottom/BottomAnimationConfig;)V

    invoke-direct {p0, v1, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->updateBottomInRecording(ZZ)V

    return-void
.end method

.method public processingMimojiBack()V
    .locals 3

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInMimojiCreate:Z

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/ModeSelectView;->setVisibility(I)V

    new-instance v1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v2}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v1

    invoke-virtual {v1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setAlpha(F)V

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mMimojiBack:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setEnabled(Z)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ModeSelectView;->setEnabled(Z)V

    return-void
.end method

.method public processingMimojiPrepare()V
    .locals 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInMimojiCreate:Z

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setEnabled(Z)V

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/ModeSelectView;->setEnabled(Z)V

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    invoke-direct {p0, v0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->updateBottomInRecording(ZZ)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    const/16 v1, 0xa3

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/ui/CameraSnapView;->intoPattern(IZ)V

    return-void
.end method

.method public processingPause()V
    .locals 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingPaused:Z

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->pauseRecording()V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v1, 0x7f02016b

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v1, 0x7f0900da

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xae

    if-ne v0, v1, :cond_1

    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setRecordingTimeState(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->addSegmentNow()V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ModeSelectView;->setVisibility(I)V

    new-instance v0, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v2}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_1
    return-void
.end method

.method public processingPostAction()V
    .locals 5

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/CameraSnapView;->setVisibility(I)V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->hideRoundPaintItem()V

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v3

    const/4 v4, 0x1

    invoke-static {v4, v0, v1, v2, v3}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->generate(ZIZZZ)Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->configVariables()Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v2, v0}, Lcom/android/camera/ui/CameraSnapView;->triggerAnimation(Lcom/android/camera/fragment/bottom/BottomAnimationConfig;)V

    invoke-direct {p0, v1, v4}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->updateBottomInRecording(ZZ)V

    invoke-direct {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setProgressBarVisible(I)V

    return-void
.end method

.method public processingPrepare()V
    .locals 5

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v4, v0, v3, v1, v2}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->generate(ZIZZZ)Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->configVariables()Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    invoke-direct {p0, v3, v3}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->updateBottomInRecording(ZZ)V

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/CameraSnapView;->prepareRecording(Lcom/android/camera/fragment/bottom/BottomAnimationConfig;)V

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xae

    if-ne v0, v1, :cond_0

    invoke-direct {p0, v3}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setRecordingTimeState(I)V

    :cond_0
    return-void
.end method

.method public processingResume()V
    .locals 5

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingPaused:Z

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v1}, Lcom/android/camera/ui/CameraSnapView;->resumeRecording()V

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v2, 0x7f02016a

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v2, 0x7f0900d9

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xae

    if-ne v1, v2, :cond_2

    const/4 v1, 0x4

    invoke-direct {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setRecordingTimeState(I)V

    new-instance v1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v2}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v1

    invoke-virtual {v1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getVisibility()I

    move-result v1

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    const/16 v3, 0x8

    if-nez v1, :cond_0

    move v4, v3

    goto :goto_0

    :cond_0
    move v4, v0

    :goto_0
    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    if-nez v1, :cond_1

    move v0, v3

    nop

    :cond_1
    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_2
    return-void
.end method

.method public processingStart()V
    .locals 5

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setEnabled(Z)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ModeSelectView;->setEnabled(Z)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    iget v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v3

    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v4

    invoke-static {v1, v2, v0, v3, v4}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->generate(ZIZZZ)Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->configVariables()Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/CameraSnapView;->triggerAnimation(Lcom/android/camera/fragment/bottom/BottomAnimationConfig;)V

    return-void
.end method

.method public processingWorkspace(Z)V
    .locals 2

    const/16 v0, 0x8

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->showRoundPaintItem()V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->invalidate()V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v1, 0x7f02016b

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-direct {p1, v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-ne p1, v0, :cond_1

    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-direct {p1, v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-ne p1, v0, :cond_5

    new-instance p1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->pauseRecording()V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->hideRoundPaintItem()V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->invalidate()V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {p1}, Lcom/android/camera/ui/CameraSnapView;->addSegmentNow()V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_3

    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    :cond_3
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_4

    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    :cond_4
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_5

    new-instance p1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->targetGone()Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    :cond_5
    :goto_0
    return-void
.end method

.method public provideAnimateElement(ILjava/util/List;I)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;I)V"
        }
    .end annotation

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x3

    if-ne p3, v3, :cond_0

    move v3, v2

    goto :goto_0

    :cond_0
    nop

    move v3, v1

    :goto_0
    if-nez v3, :cond_1

    if-eq v0, p1, :cond_3

    :cond_1
    iget-object v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mReverseDialog:Landroid/app/AlertDialog;

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mReverseDialog:Landroid/app/AlertDialog;

    invoke-virtual {v4}, Landroid/app/AlertDialog;->dismiss()V

    :cond_2
    iget-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-eqz v4, :cond_3

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->showOrHideLightingView()Z

    :cond_3
    const/16 v4, 0xb1

    if-ne v0, v4, :cond_5

    iget-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInMimojiCreate:Z

    if-eqz v4, :cond_5

    if-nez v3, :cond_4

    return-void

    :cond_4
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->processingFinish()V

    :cond_5
    const/16 v4, 0xae

    if-ne v0, v4, :cond_7

    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-eqz v0, :cond_7

    if-nez v3, :cond_6

    return-void

    :cond_6
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->processingFinish()V

    :cond_7
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;I)V

    const/16 p3, 0xa5

    if-eq p1, p3, :cond_8

    goto :goto_1

    :cond_8
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {p3}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object p3

    const v0, 0x7f0b003e

    invoke-virtual {p3, v0}, Landroid/view/View;->setBackgroundResource(I)V

    :goto_1
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {p3}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->clearBottomMenu()V

    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    if-eqz p2, :cond_9

    move v0, v2

    goto :goto_2

    :cond_9
    move v0, v1

    :goto_2
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v3

    invoke-virtual {p3, p1, v0, v3}, Lcom/android/camera/ui/CameraSnapView;->setParameters(IZZ)V

    const-string p3, "FragmentBottomAction"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "provideAnimateElement: newMode = "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", mCurrentMode = "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", animateInElements = "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p3, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    if-nez p3, :cond_a

    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {p3}, Lcom/android/camera/ui/ModeSelectView;->getVisibility()I

    move-result p3

    if-eqz p3, :cond_a

    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {p3, v1}, Lcom/android/camera/ui/ModeSelectView;->setVisibility(I)V

    :cond_a
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {p3, p1, p2}, Lcom/android/camera/ui/ModeSelectView;->judgePosition(ILjava/util/List;)V

    const/4 p3, -0x1

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    nop

    iput-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    goto :goto_4

    :pswitch_1
    nop

    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInMimojiCreate:Z

    iput-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    goto :goto_4

    :pswitch_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->gg()Z

    move-result p1

    if-eqz p1, :cond_b

    nop

    iput-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    goto :goto_4

    :cond_b
    nop

    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    goto :goto_3

    :pswitch_3
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->gC()Z

    move-result p1

    if-eqz p1, :cond_c

    nop

    iput-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    goto :goto_4

    :cond_c
    nop

    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    goto :goto_3

    :pswitch_4
    nop

    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    nop

    :goto_3
    move v2, p3

    goto :goto_4

    :pswitch_5
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->fR()Z

    move-result p1

    if-eqz p1, :cond_d

    nop

    iput-boolean v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    goto :goto_4

    :cond_d
    nop

    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPickEnable:Z

    goto :goto_3

    :goto_4
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_e

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-ne p1, v2, :cond_e

    return-void

    :cond_e
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p1, p3}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-direct {p0, v2, p2, p1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->animateViews(ILjava/util/List;Landroid/view/View;)V

    return-void

    :pswitch_data_0
    .packed-switch 0xa6
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_4
        :pswitch_4
        :pswitch_0
        :pswitch_4
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method protected provideEnterAnimation(I)Landroid/view/animation/Animation;
    .locals 2

    const/16 v0, 0xf0

    if-eq p1, v0, :cond_0

    const/4 p1, 0x1

    new-array p1, p1, [I

    const/4 v0, 0x0

    const/16 v1, 0xa1

    aput v1, p1, v0

    invoke-static {p1}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object p1

    const-wide/16 v0, 0x96

    invoke-virtual {p1, v0, v1}, Landroid/view/animation/Animation;->setStartOffset(J)V

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected provideExitAnimation()Landroid/view/animation/Animation;
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/16 v2, 0xa2

    aput v2, v0, v1

    invoke-static {v0}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object v0

    return-object v0
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

    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mPostProcess:Landroid/widget/ProgressBar;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingCameraPicker:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordingReverse:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    const/16 v0, 0xb3

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    const/16 v0, 0xa2

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    const/16 v0, 0xb7

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    const/16 v0, 0xc5

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    return-void
.end method

.method public setClickEnable(Z)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->setClickEnable(Z)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/CameraSnapView;->setSnapClickEnable(Z)V

    return-void
.end method

.method public setLightingViewStatus(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    return-void
.end method

.method public showOrHideBottomViewWithAnim(Z)V
    .locals 7

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mModeSelectLayout:Lcom/android/camera/fragment/bottom/BottomActionMenu;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomActionMenu;->getView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    if-eqz p1, :cond_0

    move v5, v4

    goto :goto_0

    :cond_0
    move v5, v3

    :goto_0
    invoke-virtual {v0, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v6, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {v6}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    invoke-virtual {v0, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    if-eqz p1, :cond_1

    move v6, v4

    goto :goto_1

    :cond_1
    move v6, v3

    :goto_1
    invoke-virtual {v0, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCameraPicker:Landroid/widget/ImageView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v6, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {v6}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    invoke-virtual {v0, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    if-eqz p1, :cond_2

    move v3, v4

    nop

    :cond_2
    invoke-virtual {v0, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    return-void
.end method

.method public showOrHideFilterView()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public showOrHideLightingView()Z
    .locals 3

    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startBottomAnimation(Z)V

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra2:Landroid/view/View;

    invoke-direct {p0, v2, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutAnimation(Landroid/view/View;Z)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentLighting;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLighting:Lcom/android/camera/fragment/FragmentLighting;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentLighting;->reInit()V

    :cond_1
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startBottomAnimation(Z)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mFragmentLayoutExtra2:Landroid/view/View;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->startExtraLayoutAnimation(Landroid/view/View;Z)V

    :goto_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    xor-int/2addr v0, v1

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsShowLighting:Z

    return v0
.end method

.method public showOrHideMimojiProgress(Z)V
    .locals 5

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->hideRoundPaintItem()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->showRoundPaintItem()V

    :goto_0
    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isFPS960()Z

    move-result v1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v3, v0, v4, v1, v2}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->generate(ZIZZZ)Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BottomAnimationConfig;->configVariables()Lcom/android/camera/fragment/bottom/BottomAnimationConfig;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/CameraSnapView;->triggerAnimation(Lcom/android/camera/fragment/bottom/BottomAnimationConfig;)V

    if-eqz p1, :cond_1

    move v0, v4

    goto :goto_1

    :cond_1
    const/16 v0, 0x8

    :goto_1
    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->setProgressBarVisible(I)V

    if-nez p1, :cond_2

    iput-boolean v3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInMimojiCreate:Z

    iput-boolean v4, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInMimojiEdit:Z

    :cond_2
    return-void
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    const/16 v0, 0xb3

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    const/16 v0, 0xa2

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    const/16 v0, 0xb7

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    const/16 v0, 0xc5

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    return-void
.end method

.method public updateLoading(Z)V
    .locals 3

    if-nez p1, :cond_2

    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    if-eqz p1, :cond_0

    return-void

    :cond_0
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInLoading:Z

    iget v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCurrentMode:I

    const/16 v1, 0xa6

    if-eq v0, v1, :cond_1

    const/16 v1, 0xac

    if-eq v0, v1, :cond_1

    const/16 v1, 0xae

    if-eq v0, v1, :cond_1

    const/16 v1, 0xb0

    if-eq v0, v1, :cond_1

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mCaptureProgressDelay:I

    int-to-long v1, v1

    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    :cond_1
    :pswitch_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    iget v1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mRecordProgressDelay:I

    int-to-long v1, v1

    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInLoading:Z

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public updateRecordingTime(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mBottomRecordingTime:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public updateThumbnail(Lcom/android/camera/Thumbnail;ZI)V
    .locals 2

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ActivityBase;

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getStartFromKeyguard()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    if-eq p3, v1, :cond_1

    return-void

    :cond_1
    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object p3

    const/4 v0, 0x0

    if-eqz p3, :cond_2

    invoke-virtual {p3}, Lcom/android/camera/ThumbnailUpdater;->getThumbnail()Lcom/android/camera/Thumbnail;

    move-result-object v1

    if-eq v1, p1, :cond_2

    invoke-virtual {p3, p1, v0, v0}, Lcom/android/camera/ThumbnailUpdater;->setThumbnail(Lcom/android/camera/Thumbnail;ZZ)V

    const-string p3, "FragmentBottomAction"

    const-string v1, "inconsistent thumbnail"

    invoke-static {p3, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {p3, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mInLoading:Z

    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    invoke-virtual {p3}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result p3

    const/16 v0, 0x8

    if-eq p3, v0, :cond_3

    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    invoke-virtual {p3, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    :cond_3
    iget-boolean p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mIsIntentAction:Z

    if-eqz p3, :cond_4

    return-void

    :cond_4
    if-nez p1, :cond_5

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    const p2, 0x7f02017e

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void

    :cond_5
    nop

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-virtual {p1}, Lcom/android/camera/Thumbnail;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-static {p3, p1}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawableFactory;->create(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object p3

    const/4 v0, 0x1

    invoke-virtual {p3, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    invoke-virtual {p1, v0}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->setCircular(Z)V

    iget-object p3, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {p3, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    if-eqz p2, :cond_7

    iget-boolean p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-eqz p1, :cond_6

    goto :goto_0

    :cond_6
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    const p2, 0x3e99999a    # 0.3f

    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    const/high16 p2, 0x3f000000    # 0.5f

    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompat;->setScaleX(Landroid/view/View;F)V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompat;->setScaleY(Landroid/view/View;F)V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-virtual {p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->scaleX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->scaleY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const-wide/16 p2, 0x50

    invoke-virtual {p1, p2, p3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    return-void

    :cond_7
    :goto_0
    return-void
.end method
