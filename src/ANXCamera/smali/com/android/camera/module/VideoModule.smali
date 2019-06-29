.class public Lcom/android/camera/module/VideoModule;
.super Lcom/android/camera/module/VideoBase;
.source "VideoModule.java"

# interfaces
.implements Landroid/media/MediaRecorder$OnErrorListener;
.implements Landroid/media/MediaRecorder$OnInfoListener;
.implements Lcom/android/camera/protocol/ModeProtocol$AutoZoomModuleProtocol;
.implements Lcom/android/camera/protocol/ModeProtocol$TopConfigProtocol;
.implements Lcom/android/camera/ui/ObjectView$ObjectViewListener;
.implements Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/VideoModule$JpegPictureCallback;
    }
.end annotation


# static fields
.field private static final HEVC_VIDEO_ENCODER_BITRATE:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAX_DURATION_4K:I = 0x75300

.field private static final RESET_VIDEO_AUTO_FOCUS_TIME:I = 0xbb8

.field public static final SIZE_1080:Landroid/util/Size;

.field public static final SIZE_720:Landroid/util/Size;

.field private static final START_OFFSET_MS:J = 0x1c2L

.field private static final VIDEO_HFR_FRAME_RATE_120:I = 0x78

.field private static final VIDEO_HFR_FRAME_RATE_240:I = 0xf0

.field public static final VIDEO_MAX_SINGLE_FILE_SIZE:J = 0xdac00000L

.field public static final VIDEO_MIN_SINGLE_FILE_SIZE:J

.field private static final VIDEO_NORMAL_FRAME_RATE:I = 0x1e


# instance fields
.field private isAutoZoomTracking:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private isShowOrHideUltraWideHint:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mAutoZoomDataDisposable:Lio/reactivex/disposables/Disposable;

.field private mAutoZoomEmitter:Lio/reactivex/FlowableEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/FlowableEmitter<",
            "Landroid/hardware/camera2/CaptureResult;",
            ">;"
        }
    .end annotation
.end field

.field private mAutoZoomUiDisposable:Lio/reactivex/disposables/Disposable;

.field private mAutoZoomViewProtocol:Lcom/android/camera/protocol/ModeProtocol$AutoZoomViewProtocol;

.field private mCaptureTimeLapse:Z

.field private mCountDownTimer:Landroid/os/CountDownTimer;

.field private volatile mCurrentFileNumber:I

.field private mDumpOrig960:Ljava/lang/Boolean;

.field private mFovcEnabled:Z

.field private mFrameRate:I

.field private mHfrFPSLower:I

.field private mHfrFPSUpper:I

.field private final mLock:Ljava/lang/Object;

.field private mMediaRecorder:Landroid/media/MediaRecorder;

.field private mMediaRecorderPostProcessing:Z

.field private mMediaRecorderWorking:Z

.field private mNextVideoFileName:Ljava/lang/String;

.field private mNextVideoValues:Landroid/content/ContentValues;

.field private mPauseClickTime:J

.field private volatile mPendingStopRecorder:Z

.field private mProfile:Landroid/media/CamcorderProfile;

.field private mQuality:I

.field private mQuickCapture:Z

.field private mRecorderSurface:Landroid/view/Surface;

.field private mRecordingTime:Ljava/lang/String;

.field private mRecordingTimeCountsDown:Z

.field private mSlowModeFps:Ljava/lang/String;

.field private mSnapshotInProgress:Z

.field private mSpeed:Ljava/lang/String;

.field private mSplitWhenReachMaxSize:Z

.field private mStopRecorderDone:Ljava/util/concurrent/CountDownLatch;

.field private mTimeBetweenTimeLapseFrameCaptureMs:I

.field private mTopAlert:Lcom/android/camera/protocol/ModeProtocol$TopAlert;

.field private mTrackLostCount:I

.field private mVideoRecordTime:J

.field private mVideoRecordedDuration:J


# direct methods
.method static constructor <clinit>()V
    .locals 4

    nop

    const-wide/32 v0, 0x800000

    const-wide/32 v2, 0x3200000

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    sput-wide v0, Lcom/android/camera/module/VideoModule;->VIDEO_MIN_SINGLE_FILE_SIZE:J

    new-instance v0, Landroid/util/Size;

    const/16 v1, 0x780

    const/16 v2, 0x438

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    sput-object v0, Lcom/android/camera/module/VideoModule;->SIZE_1080:Landroid/util/Size;

    new-instance v0, Landroid/util/Size;

    const/16 v1, 0x500

    const/16 v2, 0x2d0

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    sput-object v0, Lcom/android/camera/module/VideoModule;->SIZE_720:Landroid/util/Size;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/android/camera/module/VideoModule;->HEVC_VIDEO_ENCODER_BITRATE:Ljava/util/HashMap;

    sget-object v0, Lcom/android/camera/module/VideoModule;->HEVC_VIDEO_ENCODER_BITRATE:Ljava/util/HashMap;

    const-string v1, "3840x2160:30"

    const v2, 0x24b76a0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/camera/module/VideoModule;->HEVC_VIDEO_ENCODER_BITRATE:Ljava/util/HashMap;

    const-string v1, "1920x1080:30"

    const v2, 0xeafc40

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/camera/module/VideoModule;->HEVC_VIDEO_ENCODER_BITRATE:Ljava/util/HashMap;

    const-string v1, "1280x720:30"

    const v2, 0xa47d60

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/camera/module/VideoModule;->HEVC_VIDEO_ENCODER_BITRATE:Ljava/util/HashMap;

    const-string v1, "720x480:30"

    const v2, 0x150e00

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    const-class v0, Lcom/android/camera/module/VideoModule;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera/module/VideoBase;-><init>(Ljava/lang/String;)V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->isAutoZoomTracking:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->isShowOrHideUltraWideHint:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput v1, p0, Lcom/android/camera/module/VideoModule;->mTimeBetweenTimeLapseFrameCaptureMs:I

    const-string v0, "normal"

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    const/4 v0, 0x5

    iput v0, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/module/VideoModule;->mPauseClickTime:J

    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/android/camera/module/VideoModule;->mLock:Ljava/lang/Object;

    iput-wide v0, p0, Lcom/android/camera/module/VideoModule;->mVideoRecordTime:J

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mDumpOrig960:Ljava/lang/Boolean;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/module/VideoModule;Lcom/android/camera2/autozoom/AutoZoomCaptureResult;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/module/VideoModule;->consumeAutoZoomData(Lcom/android/camera2/autozoom/AutoZoomCaptureResult;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/android/camera/module/VideoModule;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    return p0
.end method

.method static synthetic access$102(Lcom/android/camera/module/VideoModule;Lio/reactivex/FlowableEmitter;)Lio/reactivex/FlowableEmitter;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomEmitter:Lio/reactivex/FlowableEmitter;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/android/camera/module/VideoModule;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/VideoModule;->mFrameRate:I

    return p0
.end method

.method static synthetic access$1200(Lcom/android/camera/module/VideoModule;)Z
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS960()Z

    move-result p0

    return p0
.end method

.method static synthetic access$1300(Lcom/android/camera/module/VideoModule;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderPostProcessing:Z

    return p0
.end method

.method static synthetic access$1400(Lcom/android/camera/module/VideoModule;)Z
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isActivityResumed()Z

    move-result p0

    return p0
.end method

.method static synthetic access$1500(Lcom/android/camera/module/VideoModule;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/module/VideoModule;->postProcessVideo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1600(Lcom/android/camera/module/VideoModule;)Lcom/android/camera/protocol/ModeProtocol$AutoZoomViewProtocol;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomViewProtocol:Lcom/android/camera/protocol/ModeProtocol$AutoZoomViewProtocol;

    return-object p0
.end method

.method static synthetic access$1702(Lcom/android/camera/module/VideoModule;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/module/VideoModule;->mSnapshotInProgress:Z

    return p1
.end method

.method static synthetic access$1800(Lcom/android/camera/module/VideoModule;I)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/module/VideoModule;->needImageThumbnail(I)Z

    move-result p0

    return p0
.end method

.method static synthetic access$200(Lcom/android/camera/module/VideoModule;)Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/VideoModule;->mTopAlert:Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/camera/module/VideoModule;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->onMediaRecorderReleased()V

    return-void
.end method

.method static synthetic access$400(Lcom/android/camera/module/VideoModule;)Ljava/util/concurrent/CountDownLatch;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/VideoModule;->mStopRecorderDone:Ljava/util/concurrent/CountDownLatch;

    return-object p0
.end method

.method static synthetic access$402(Lcom/android/camera/module/VideoModule;Ljava/util/concurrent/CountDownLatch;)Ljava/util/concurrent/CountDownLatch;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/VideoModule;->mStopRecorderDone:Ljava/util/concurrent/CountDownLatch;

    return-object p1
.end method

.method static synthetic access$500(Lcom/android/camera/module/VideoModule;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$600(Lcom/android/camera/module/VideoModule;)Landroid/media/MediaRecorder;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    return-object p0
.end method

.method static synthetic access$700(Lcom/android/camera/module/VideoModule;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->releaseMediaRecorder()V

    return-void
.end method

.method static synthetic access$800(Lcom/android/camera/module/VideoModule;)Z
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS120()Z

    move-result p0

    return p0
.end method

.method static synthetic access$900(Lcom/android/camera/module/VideoModule;)Z
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS240()Z

    move-result p0

    return p0
.end method

.method private consumeAutoZoomData(Lcom/android/camera2/autozoom/AutoZoomCaptureResult;)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->isAutoZoomTracking:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomViewProtocol:Lcom/android/camera/protocol/ModeProtocol$AutoZoomViewProtocol;

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$AutoZoomViewProtocol;->feedData(Lcom/android/camera2/autozoom/AutoZoomCaptureResult;)V

    :cond_1
    return-void

    :cond_2
    :goto_0
    return-void
.end method

.method private convertSizeToQuality(Ljava/lang/String;)I
    .locals 4

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, -0x6683aa6a

    const/4 v2, -0x1

    if-eq v0, v1, :cond_1

    const v1, 0x2fce7329

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "1920x1080"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    const-string v0, "1280x720"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    goto :goto_1

    :cond_2
    :goto_0
    move v0, v2

    :goto_1
    packed-switch v0, :pswitch_data_0

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "unexpected hfr video size "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :pswitch_0
    const/4 p1, 0x5

    return p1

    :pswitch_1
    const/4 p1, 0x6

    return p1

    nop

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private countDownForVideoBokeh()V
    .locals 7

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCountDownTimer:Landroid/os/CountDownTimer;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    :cond_1
    new-instance v0, Lcom/android/camera/module/VideoModule$5;

    const-wide/16 v3, 0x76f2

    const-wide/16 v5, 0x3e8

    move-object v1, v0

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lcom/android/camera/module/VideoModule$5;-><init>(Lcom/android/camera/module/VideoModule;JJ)V

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mCountDownTimer:Landroid/os/CountDownTimer;

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->start()Landroid/os/CountDownTimer;

    return-void
.end method

.method private forceToNormalMode()V
    .locals 3

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_video_speed_key"

    const-string v2, "normal"

    invoke-interface {v0, v1, v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    const-string v0, "normal"

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    return-void
.end method

.method private getHSRValue()I
    .locals 5

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->isFaceBeautyOn(Lcom/android/camera/fragment/beauty/BeautyValues;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v0

    if-eqz v0, :cond_1

    return v1

    :cond_1
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isFastMotionModule()Z

    move-result v0

    if-nez v0, :cond_9

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSlowMotionModule()Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_1

    :cond_2
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isAutoZoomEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_3

    return v1

    :cond_3
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isUltraWideBackCamera()Z

    move-result v0

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getHSRValue(Z)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_8

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_8

    const-string v2, "off"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    goto :goto_0

    :cond_4
    iget v2, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    const/16 v3, 0x8

    if-ne v2, v3, :cond_5

    const/16 v2, 0xf00

    const/16 v3, 0x870

    iget v4, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    invoke-static {v2, v3, v4}, Lcom/android/camera/CameraSettings;->isSupportFpsRange(III)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_5
    iget v2, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    const/4 v3, 0x6

    if-ne v2, v3, :cond_7

    const/16 v2, 0x780

    const/16 v3, 0x438

    iget v4, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    invoke-static {v2, v3, v4}, Lcom/android/camera/CameraSettings;->isSupportFpsRange(III)Z

    move-result v2

    if-nez v2, :cond_7

    :cond_6
    return v1

    :cond_7
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0

    :cond_8
    :goto_0
    return v1

    :cond_9
    :goto_1
    return v1
.end method

.method private getHevcVideoEncoderBitRate(Landroid/media/CamcorderProfile;)I
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p1, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string/jumbo v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p1, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p1, Landroid/media/CamcorderProfile;->videoFrameRate:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/android/camera/module/VideoModule;->HEVC_VIDEO_ENCODER_BITRATE:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object p1, Lcom/android/camera/module/VideoModule;->HEVC_VIDEO_ENCODER_BITRATE:Ljava/util/HashMap;

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    goto :goto_0

    :cond_0
    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "no pre-defined bitrate for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget p1, p1, Landroid/media/CamcorderProfile;->videoBitRate:I

    :goto_0
    return p1
.end method

.method private getHfrSetting()Ljava/lang/String;
    .locals 3

    invoke-static {}, Lcom/android/camera/CameraSettings;->getHfrSetting()Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/module/VideoModule;->mBogusCameraId:I

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getSupportedHfrSettings(I)Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :cond_0
    return-object v0
.end method

.method private getOperatingModeForPreview()I
    .locals 1

    iget v0, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isAutoZoomEnabled(I)Z

    move-result v0

    nop

    if-eqz v0, :cond_0

    const v0, 0x80f4

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private getRecorderMaxFileSize(I)J
    .locals 6

    invoke-static {}, Lcom/android/camera/storage/Storage;->getLeftSpace()J

    move-result-wide v0

    const-wide/32 v2, 0x3200000

    sub-long/2addr v0, v2

    if-lez p1, :cond_0

    int-to-long v2, p1

    cmp-long p1, v2, v0

    if-gez p1, :cond_0

    nop

    move-wide v0, v2

    :cond_0
    const-wide v2, 0xdac00000L

    cmp-long p1, v0, v2

    if-lez p1, :cond_1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->fX()Z

    move-result p1

    if-eqz p1, :cond_1

    nop

    move-wide v0, v2

    goto :goto_0

    :cond_1
    sget-wide v2, Lcom/android/camera/module/VideoModule;->VIDEO_MIN_SINGLE_FILE_SIZE:J

    cmp-long p1, v0, v2

    if-gez p1, :cond_2

    sget-wide v0, Lcom/android/camera/module/VideoModule;->VIDEO_MIN_SINGLE_FILE_SIZE:J

    :cond_2
    :goto_0
    iget-wide v2, p0, Lcom/android/camera/module/VideoModule;->mIntentRequestSize:J

    const-wide/16 v4, 0x0

    cmp-long p1, v2, v4

    if-lez p1, :cond_3

    iget-wide v2, p0, Lcom/android/camera/module/VideoModule;->mIntentRequestSize:J

    cmp-long p1, v2, v0

    if-gez p1, :cond_3

    iget-wide v0, p0, Lcom/android/camera/module/VideoModule;->mIntentRequestSize:J

    :cond_3
    return-wide v0
.end method

.method private getRecorderOrientationHint()I
    .locals 3

    nop

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getSensorOrientation()I

    move-result v0

    iget v1, p0, Lcom/android/camera/module/VideoModule;->mOrientation:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v1

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/android/camera/module/VideoModule;->mOrientation:I

    sub-int/2addr v0, v1

    add-int/lit16 v0, v0, 0x168

    rem-int/lit16 v0, v0, 0x168

    goto :goto_0

    :cond_0
    iget v1, p0, Lcom/android/camera/module/VideoModule;->mOrientation:I

    add-int/2addr v0, v1

    rem-int/lit16 v0, v0, 0x168

    goto :goto_0

    :cond_1
    nop

    :goto_0
    return v0
.end method

.method private getSpeedRecordVideoLength(JD)J
    .locals 2

    const-wide/16 v0, 0x0

    cmpl-double v0, p3, v0

    if-nez v0, :cond_0

    const-wide/16 p1, 0x0

    return-wide p1

    :cond_0
    long-to-double p1, p1

    div-double/2addr p1, p3

    nop

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getNormalVideoFrameRate()I

    move-result p3

    int-to-double p3, p3

    div-double/2addr p1, p3

    const-wide p3, 0x408f400000000000L    # 1000.0

    mul-double/2addr p1, p3

    double-to-long p1, p1

    return-wide p1
.end method

.method private initAutoZoom()V
    .locals 2

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->go()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isAutoZoomEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->startAutoZoom()V

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->stopAutoZoom()V

    :goto_0
    new-instance v0, Lcom/android/camera/module/VideoModule$3;

    invoke-direct {v0, p0}, Lcom/android/camera/module/VideoModule$3;-><init>(Lcom/android/camera/module/VideoModule;)V

    sget-object v1, Lio/reactivex/BackpressureStrategy;->DROP:Lio/reactivex/BackpressureStrategy;

    invoke-static {v0, v1}, Lio/reactivex/Flowable;->create(Lio/reactivex/FlowableOnSubscribe;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    sget-object v1, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/VideoModule$2;

    invoke-direct {v1, p0}, Lcom/android/camera/module/VideoModule$2;-><init>(Lcom/android/camera/module/VideoModule;)V

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/VideoModule$1;

    invoke-direct {v1, p0}, Lcom/android/camera/module/VideoModule$1;-><init>(Lcom/android/camera/module/VideoModule;)V

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomDataDisposable:Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method private initRecorderSurface()V
    .locals 1

    invoke-static {}, Landroid/media/MediaCodec;->createPersistentInputSurface()Landroid/view/Surface;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mRecorderSurface:Landroid/view/Surface;

    return-void
.end method

.method private initializeObjectTrack(Landroid/graphics/RectF;Z)Z
    .locals 1

    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoModule;->mapTapCoordinate(Ljava/lang/Object;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->stopObjectTracking(Z)V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->initializeObjectTrack(Landroid/graphics/RectF;Z)Z

    move-result p1

    return p1
.end method

.method private initializeRecorder(Z)Z
    .locals 11

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "initializeRecorder>>"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v2

    const/4 v3, 0x0

    if-nez v2, :cond_0

    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v0, "initializeRecorder: null host"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v3

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->closeVideoFileDescriptor()V

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->cleanupEmptyFile()V

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isCaptureIntent()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/camera/module/VideoModule;->parseIntent(Landroid/content/Intent;)V

    :cond_1
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    if-nez v2, :cond_2

    iget v2, p0, Lcom/android/camera/module/VideoModule;->mOutputFormat:I

    iget v4, p0, Lcom/android/camera/module/VideoModule;->mCurrentFileNumber:I

    iget-object v5, p0, Lcom/android/camera/module/VideoModule;->mSlowModeFps:Ljava/lang/String;

    invoke-virtual {p0, v2, v4, v5, p1}, Lcom/android/camera/module/VideoModule;->genContentValues(IILjava/lang/String;Z)Landroid/content/ContentValues;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    const-string v4, "_data"

    invoke-virtual {v2, v4}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    :cond_2
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mStopRecorderDone:Ljava/util/concurrent/CountDownLatch;

    if-eqz v2, :cond_3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    :try_start_0
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mStopRecorderDone:Ljava/util/concurrent/CountDownLatch;

    const-wide/16 v6, 0x3e8

    sget-object v8, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v6, v7, v8}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    invoke-virtual {v2}, Ljava/lang/InterruptedException;->printStackTrace()V

    :goto_0
    sget-object v2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "initializeRecorder: waitTime="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sub-long/2addr v7, v4

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    nop

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_1
    iget-object v6, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    if-nez v6, :cond_4

    new-instance v4, Landroid/media/MediaRecorder;

    invoke-direct {v4}, Landroid/media/MediaRecorder;-><init>()V

    iput-object v4, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    goto :goto_1

    :cond_4
    iget-object v6, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v6}, Landroid/media/MediaRecorder;->reset()V

    sget-boolean v6, Lcom/android/camera/module/VideoModule;->DEBUG:Z

    if-eqz v6, :cond_5

    sget-object v6, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "initializeRecorder: t1="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long/2addr v8, v4

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_5
    :goto_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    const/4 v2, 0x0

    const/4 v4, 0x1

    :try_start_2
    iget-object v5, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-direct {p0, v5}, Lcom/android/camera/module/VideoModule;->setupRecorder(Landroid/media/MediaRecorder;)V

    iget-object v5, p0, Lcom/android/camera/module/VideoModule;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    if-eqz v5, :cond_6

    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    iget-object v5, p0, Lcom/android/camera/module/VideoModule;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v5}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v5

    invoke-virtual {p1, v5}, Landroid/media/MediaRecorder;->setOutputFile(Ljava/io/FileDescriptor;)V

    goto :goto_3

    :cond_6
    invoke-static {}, Lcom/android/camera/storage/Storage;->isUseDocumentMode()Z

    move-result v5

    if-eqz v5, :cond_8

    if-nez p1, :cond_7

    goto :goto_2

    :cond_7
    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    invoke-static {p1, v4}, Lcom/android/camera/FileCompat;->getParcelFileDescriptor(Ljava/lang/String;Z)Landroid/os/ParcelFileDescriptor;

    move-result-object p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :try_start_3
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/media/MediaRecorder;->setOutputFile(Ljava/io/FileDescriptor;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-object v2, p1

    goto :goto_3

    :catchall_0
    move-exception v0

    move-object v2, p1

    move-object p1, v0

    goto/16 :goto_6

    :catch_1
    move-exception v2

    move-object v10, v2

    move-object v2, p1

    move-object p1, v10

    goto :goto_4

    :cond_8
    :goto_2
    :try_start_4
    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    iget-object v5, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    invoke-virtual {p1, v5}, Landroid/media/MediaRecorder;->setOutputFile(Ljava/lang/String;)V

    :goto_3
    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    iget-object v5, p0, Lcom/android/camera/module/VideoModule;->mRecorderSurface:Landroid/view/Surface;

    invoke-virtual {p1, v5}, Landroid/media/MediaRecorder;->setInputSurface(Landroid/view/Surface;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {p1}, Landroid/media/MediaRecorder;->prepare()V

    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {p1, p0}, Landroid/media/MediaRecorder;->setOnErrorListener(Landroid/media/MediaRecorder$OnErrorListener;)V

    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {p1, p0}, Landroid/media/MediaRecorder;->setOnInfoListener(Landroid/media/MediaRecorder$OnInfoListener;)V

    sget-boolean p1, Lcom/android/camera/module/VideoModule;->DEBUG:Z

    if-eqz p1, :cond_9

    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "initializeRecorder: t2="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long/2addr v8, v5

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p1, v5}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :cond_9
    invoke-static {v2}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    nop

    move v3, v4

    goto :goto_5

    :catchall_1
    move-exception p1

    goto :goto_6

    :catch_2
    move-exception p1

    :goto_4
    :try_start_5
    sget-object v4, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "prepare failed for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    nop

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->releaseMediaRecorder()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    invoke-static {v2}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    nop

    :goto_5
    sget-boolean p1, Lcom/android/camera/module/VideoModule;->DEBUG:Z

    if-eqz p1, :cond_a

    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mRecorderSurface:Landroid/view/Surface;

    invoke-direct {p0, p1}, Lcom/android/camera/module/VideoModule;->showSurfaceInfo(Landroid/view/Surface;)V

    :cond_a
    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "initializeRecorder<<time="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v3

    :goto_6
    invoke-static {v2}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    throw p1

    :catchall_2
    move-exception p1

    :try_start_6
    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    throw p1
.end method

.method private isActivityResumed()Z
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isDump960Orig()Z
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mDumpOrig960:Ljava/lang/Boolean;

    if-nez v0, :cond_1

    const-string v0, "camera.record.960origdump"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :goto_0
    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mDumpOrig960:Ljava/lang/Boolean;

    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mDumpOrig960:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method private isEisOn()Z
    .locals 3

    iget v0, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    const/4 v1, 0x1

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->is4KHigherVideoQuality(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/module/VideoModule;->isSupport4KUHDEIS()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->isFaceBeautyOn(Lcom/android/camera/fragment/beauty/BeautyValues;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isMovieSolidOn()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->getHSRValue()I

    move-result v0

    const/16 v2, 0x3c

    if-eq v0, v2, :cond_2

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isNormalMode()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFastMode()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_3

    invoke-static {}, Lcom/mi/config/b;->jx()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isBackCamera()Z

    move-result v0

    :cond_3
    invoke-static {}, Lcom/mi/config/b;->hA()Z

    move-result v2

    if-eqz v2, :cond_4

    if-nez v0, :cond_4

    iget v2, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->isMacroModeEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_4

    nop

    move v0, v1

    :cond_4
    return v0
.end method

.method private isFPS120()Z
    .locals 2

    const-string v0, "slow_motion_120"

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mSlowModeFps:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private isFPS240()Z
    .locals 2

    const-string v0, "slow_motion_240"

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mSlowModeFps:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private isFPS960()Z
    .locals 2

    const-string v0, "slow_motion_960"

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mSlowModeFps:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private isFastMode()Z
    .locals 2

    const-string v0, "fast"

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private isHFRMode()Z
    .locals 2

    const-string v0, "hfr"

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private isNormalMode()Z
    .locals 2

    const-string v0, "normal"

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private isSlowMode()Z
    .locals 2

    const-string v0, "slow"

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private isSplitWhenReachMaxSize()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mSplitWhenReachMaxSize:Z

    return v0
.end method

.method private static isSupport4KUHDEIS()Z
    .locals 1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->isSupport4KUHDEIS()Z

    move-result v0

    return v0
.end method

.method private needDisableEISAndOIS()Z
    .locals 3

    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "videoStabilization: disabled EIS and OIS when VIDEO_BOKEH is opened"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_0
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isAutoZoomEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "videoStabilization: disabled EIS and OIS when AutoZoom is opened"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private needImageThumbnail(I)Z
    .locals 1

    const/16 v0, 0xc

    if-eq p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private notifyAutoZoomStartUiHint()V
    .locals 3

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->notifyAutoZoomStopUiHint()V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mTopAlert:Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mTopAlert:Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->isExtraMenuShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const-wide/16 v0, 0x7d0

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {v0, v1, v2}, Lio/reactivex/Observable;->timer(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/VideoModule$11;

    invoke-direct {v1, p0}, Lcom/android/camera/module/VideoModule$11;-><init>(Lcom/android/camera/module/VideoModule;)V

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomUiDisposable:Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method private notifyAutoZoomStopUiHint()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomUiDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomUiDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomUiDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomUiDisposable:Lio/reactivex/disposables/Disposable;

    :cond_0
    return-void
.end method

.method private onMaxFileSizeReached()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2, v2}, Lcom/android/camera/module/VideoModule;->saveVideo(Ljava/lang/String;Landroid/content/ContentValues;ZZ)Landroid/net/Uri;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method private onMediaRecorderReleased()V
    .locals 8

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "onMediaRecorderReleased>>"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mAudioManager:Landroid/media/AudioManager;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->restoreMusicSound()V

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isCaptureIntent()Z

    move-result v2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v2, :cond_3

    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mPaused:Z

    if-nez v2, :cond_3

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoUri:Landroid/net/Uri;

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    iget-object v6, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    invoke-direct {p0, v2, v6, v4, v4}, Lcom/android/camera/module/VideoModule;->saveVideo(Ljava/lang/String;Landroid/content/ContentValues;ZZ)Landroid/net/Uri;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoUri:Landroid/net/Uri;

    sget-object v2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "onMediaRecorderReleased: outputUri="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoUri:Landroid/net/Uri;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoUri:Landroid/net/Uri;

    if-eqz v2, :cond_1

    move v2, v4

    goto :goto_0

    :cond_1
    nop

    move v2, v5

    :goto_0
    iget-boolean v6, p0, Lcom/android/camera/module/VideoModule;->mQuickCapture:Z

    if-eqz v6, :cond_2

    invoke-virtual {p0, v2}, Lcom/android/camera/module/VideoModule;->doReturnToCaller(Z)V

    goto :goto_1

    :cond_2
    if-eqz v2, :cond_3

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->showAlert()V

    :cond_3
    :goto_1
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    if-eqz v2, :cond_5

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isCaptureIntent()Z

    move-result v2

    if-nez v2, :cond_4

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    iget-object v6, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    invoke-direct {p0, v2, v6, v4, v5}, Lcom/android/camera/module/VideoModule;->saveVideo(Ljava/lang/String;Landroid/content/ContentValues;ZZ)Landroid/net/Uri;

    :cond_4
    iput-object v3, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    iput-object v3, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    goto :goto_2

    :cond_5
    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mPaused:Z

    if-nez v2, :cond_6

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v2

    if-nez v2, :cond_6

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/ThumbnailUpdater;->getLastThumbnail()V

    :cond_6
    :goto_2
    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderPostProcessing:Z

    if-eqz v2, :cond_7

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xd4

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    if-eqz v2, :cond_7

    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPostSavingFinish()V

    :cond_7
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    new-instance v3, Landroid/content/Intent;

    const-string v6, "com.android.camera.action.stop_video_recording"

    invoke-direct {v3, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/android/camera/Camera;->sendBroadcast(Landroid/content/Intent;)V

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    invoke-virtual {v2, v3, v5}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    sget-object v2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v3, "listen none"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0, v4}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    const-string v2, "continuous-video"

    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mVideoFocusMode:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocusStateIfNeeded()V

    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mPaused:Z

    if-nez v2, :cond_8

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v2

    if-nez v2, :cond_8

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v3, 0x2

    invoke-interface {v2, v3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->clearFocusView(I)V

    const-string v2, "continuous-video"

    invoke-virtual {p0, v2, v5}, Lcom/android/camera/module/VideoModule;->setVideoFocusMode(Ljava/lang/String;Z)V

    new-array v2, v4, [I

    const/16 v3, 0xe

    aput v3, v2, v5

    invoke-virtual {p0, v2}, Lcom/android/camera/module/VideoModule;->updatePreferenceInWorkThread([I)V

    :cond_8
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->keepScreenOnAwhile()V

    sget-object v2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onMediaRecorderReleased<<time="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v0

    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackStopVideoRecordEnd()V

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->doLaterReleaseIfNeed()V

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderPostProcessing:Z

    if-eqz v0, :cond_9

    iput-boolean v5, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderPostProcessing:Z

    :cond_9
    iput-boolean v5, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderWorking:Z

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/module/VideoModule$8;

    invoke-direct {v1, p0}, Lcom/android/camera/module/VideoModule$8;-><init>(Lcom/android/camera/module/VideoModule;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private onStartRecorderFail()V
    .locals 2

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->releaseMediaRecorder()V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAudioManager:Landroid/media/AudioManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->restoreMusicSound()V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onFailed()V

    return-void
.end method

.method private onStartRecorderSucceed()V
    .locals 5

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS960()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    invoke-virtual {p0, v1}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    new-instance v2, Landroid/content/Intent;

    const-string v3, "com.android.camera.action.start_video_recording"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Lcom/android/camera/Camera;->sendBroadcast(Landroid/content/Intent;)V

    iput-boolean v1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderWorking:Z

    iput-boolean v1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    const/16 v2, 0xa8

    if-eq v0, v2, :cond_2

    iget v0, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    const/16 v2, 0xac

    if-eq v0, v2, :cond_2

    iget v0, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    const/16 v2, 0xaa

    if-eq v0, v2, :cond_2

    iget v0, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isMacroModeEnabled(I)Z

    move-result v0

    if-nez v0, :cond_2

    iget v0, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isAutoZoomEnabled(I)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isBackCamera()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0, v1}, Lcom/android/camera/module/VideoModule;->updateZoomRatioToggleButtonState(Z)V

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isUltraWideBackCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    sget v0, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_ULTR:F

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->setMinZoomRatio(F)V

    sget v0, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_ULTR:F

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v2}, Lcom/android/camera2/CameraCapabilities;->getMaxZoomRatio()F

    move-result v2

    mul-float/2addr v0, v2

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->setMaxZoomRatio(F)V

    goto :goto_0

    :cond_1
    sget v0, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_WIDE:F

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->setMinZoomRatio(F)V

    const/high16 v0, 0x40c00000    # 6.0f

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v2}, Lcom/android/camera2/CameraCapabilities;->getMaxZoomRatio()F

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->setMaxZoomRatio(F)V

    :cond_2
    :goto_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/camera/module/VideoModule;->mRecordingStartTime:J

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/camera/module/VideoModule;->mPauseClickTime:J

    const-string v2, ""

    iput-object v2, p0, Lcom/android/camera/module/VideoModule;->mRecordingTime:Ljava/lang/String;

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    const/16 v4, 0x20

    invoke-virtual {v2, v3, v4}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    sget-object v2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v3, "listen call state"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->countDownForVideoBokeh()V

    goto :goto_1

    :cond_3
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateRecordingTime()V

    :goto_1
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->keepScreenOn()V

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v2}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/AutoLockManager;->removeMessage()V

    invoke-virtual {p0, v1, v0}, Lcom/android/camera/module/VideoModule;->trackGeneralInfo(IZ)V

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->keepPowerSave()V

    return-void
.end method

.method private pauseVideoRecording()V
    .locals 4

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "pauseVideoRecording"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    if-nez v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->pauseMediaRecorder(Landroid/media/MediaRecorder;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "failed to pause media recorder"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/camera/module/VideoModule;->mRecordingStartTime:J

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/android/camera/module/VideoModule;->mVideoRecordedDuration:J

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x2a

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateRecordingTime()V

    :cond_0
    return-void
.end method

.method private postProcessVideo(Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    :cond_0
    nop

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ".bak"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v3, Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/android/camera/storage/Storage;->generatePrimaryFilepath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x0

    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v7

    invoke-virtual {v7}, Lcom/mi/config/a;->gp()Z

    move-result v7

    invoke-static {v5, v6, v7}, Lcom/miui/extravideo/interpolation/VideoInterpolator;->doDecodeAndEncodeSync(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {v2, v3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v5

    if-eqz v5, :cond_1

    const/4 v4, 0x1

    nop

    :cond_1
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isDump960Orig()Z

    move-result v5

    if-eqz v5, :cond_2

    new-instance v5, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".orig.mp4"

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v5, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v5}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    goto :goto_0

    :cond_2
    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    if-nez v4, :cond_3

    :goto_1
    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v5, "960fps processing failed. delete the files."

    invoke-static {p1, v5}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_3

    :catch_0
    move-exception p1

    :try_start_1
    sget-object v5, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v6, "960fps processing failed."

    invoke-static {v5, v6, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v4, :cond_3

    goto :goto_1

    :cond_3
    :goto_2
    if-eqz v4, :cond_4

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    nop

    :cond_4
    return-object v0

    :goto_3
    if-nez v4, :cond_5

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v3, "960fps processing failed. delete the files."

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    :cond_5
    throw p1
.end method

.method private releaseMediaRecorder()V
    .locals 7

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "releaseRecorder"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->cleanupEmptyFile()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->reset()V

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "releaseRecorder: t1="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v5, v2

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->release()V

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "releaseRecorder: t2="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v2

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private releaseRecorderSurface()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mRecorderSurface:Landroid/view/Surface;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mRecorderSurface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    :cond_0
    return-void
.end method

.method private releaseResources()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomEmitter:Lio/reactivex/FlowableEmitter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v0}, Lio/reactivex/FlowableEmitter;->onComplete()V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomUiDisposable:Lio/reactivex/disposables/Disposable;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomUiDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomUiDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    iput-object v1, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomUiDisposable:Lio/reactivex/disposables/Disposable;

    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomDataDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomDataDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomDataDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    iput-object v1, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomDataDisposable:Lio/reactivex/disposables/Disposable;

    :cond_2
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->stopTracking(I)V

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->stopAutoZoom()V

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->closeCamera()V

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->releaseMediaRecorder()V

    return-void
.end method

.method private saveVideo(Ljava/lang/String;Landroid/content/ContentValues;ZZ)Landroid/net/Uri;
    .locals 3

    nop

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "saveVideo: path="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " isFinal="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "datetaken"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p2, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    if-nez p4, :cond_0

    iget-object p4, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p4}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object p4

    invoke-virtual {p4, p1, p2, p3}, Lcom/android/camera/storage/ImageSaver;->addVideo(Ljava/lang/String;Landroid/content/ContentValues;Z)V

    goto :goto_0

    :cond_0
    iget-object p3, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p3}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object p3

    const/4 p4, 0x0

    invoke-virtual {p3, p1, p2, p4}, Lcom/android/camera/storage/ImageSaver;->addVideoSync(Ljava/lang/String;Landroid/content/ContentValues;Z)Landroid/net/Uri;

    move-result-object p1

    goto :goto_1

    :cond_1
    sget-object p2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "saveVideo: failed to save "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    const/4 p1, 0x0

    :goto_1
    return-object p1
.end method

.method private setJpegQuality()V
    .locals 4

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mBogusCameraId:I

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/media/CameraProfile;->getJpegEncodingQualityParameter(II)I

    move-result v0

    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "jpegQuality="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setJpegQuality(I)V

    return-void
.end method

.method private setNextOutputFile(Ljava/lang/String;)Z
    .locals 7

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v0, "setNextOutputFile, filePath is empty"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_0
    invoke-static {}, Lcom/android/camera/storage/Storage;->isUseDocumentMode()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-static {v0, p1}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->setNextOutputFile(Landroid/media/MediaRecorder;Ljava/lang/String;)Z

    move-result p1

    return p1

    :cond_1
    const/4 v0, 0x0

    const/4 v2, 0x1

    :try_start_0
    invoke-static {p1, v2}, Lcom/android/camera/FileCompat;->getParcelFileDescriptor(Ljava/lang/String;Z)Landroid/os/ParcelFileDescriptor;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->setNextOutputFile(Landroid/media/MediaRecorder;Ljava/io/FileDescriptor;)Z

    move-result v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {v2}, Lcom/android/camera/Util;->closeSafely(Ljava/io/Closeable;)V

    return v0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception p1

    move-object v2, v0

    goto :goto_1

    :catch_1
    move-exception v2

    move-object v6, v2

    move-object v2, v0

    move-object v0, v6

    :goto_0
    :try_start_2
    sget-object v3, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "open file failed, filePath "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    invoke-static {v2}, Lcom/android/camera/Util;->closeSafely(Ljava/io/Closeable;)V

    nop

    return v1

    :goto_1
    invoke-static {v2}, Lcom/android/camera/Util;->closeSafely(Ljava/io/Closeable;)V

    throw p1
.end method

.method private setParameterExtra(Landroid/media/MediaRecorder;Ljava/lang/String;)V
    .locals 5

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Class;

    const-class v2, Landroid/media/MediaRecorder;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "setParameter"

    const-string v4, "(Ljava/lang/String;)V"

    invoke-static {v1, v2, v4}, Lcom/android/camera/Util;->getMethod([Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Method;

    move-result-object v2

    if-eqz v2, :cond_0

    aget-object v1, v1, v3

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p2, v0, v3

    invoke-virtual {v2, v1, p1, v0}, Lmiui/reflect/Method;->invoke(Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private setSplitWhenReachMaxSize(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/module/VideoModule;->mSplitWhenReachMaxSize:Z

    return-void
.end method

.method private setupRecorder(Landroid/media/MediaRecorder;)V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isNormalMode()Z

    move-result v0

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v0, :cond_1

    if-nez v1, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS120()Z

    move-result v4

    if-nez v4, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS240()Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_0

    :cond_0
    move v4, v3

    goto :goto_1

    :cond_1
    :goto_0
    nop

    move v4, v2

    :goto_1
    const/4 v5, 0x2

    invoke-virtual {p1, v5}, Landroid/media/MediaRecorder;->setVideoSource(I)V

    const/4 v6, 0x5

    if-eqz v4, :cond_2

    invoke-virtual {p1, v6}, Landroid/media/MediaRecorder;->setAudioSource(I)V

    :cond_2
    iget-object v7, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v7, v7, Landroid/media/CamcorderProfile;->fileFormat:I

    invoke-virtual {p1, v7}, Landroid/media/MediaRecorder;->setOutputFormat(I)V

    iget-object v7, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v7, v7, Landroid/media/CamcorderProfile;->videoCodec:I

    invoke-virtual {p1, v7}, Landroid/media/MediaRecorder;->setVideoEncoder(I)V

    iget-object v7, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v7, v7, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    iget-object v8, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v8, v8, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-virtual {p1, v7, v8}, Landroid/media/MediaRecorder;->setVideoSize(II)V

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->getHSRValue()I

    move-result v7

    if-lez v7, :cond_3

    invoke-virtual {p1, v7}, Landroid/media/MediaRecorder;->setVideoFrameRate(I)V

    sget-object v8, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "setVideoFrameRate: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :cond_3
    iget-object v8, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v8, v8, Landroid/media/CamcorderProfile;->videoFrameRate:I

    invoke-virtual {p1, v8}, Landroid/media/MediaRecorder;->setVideoFrameRate(I)V

    sget-object v8, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "setVideoFrameRate: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v10, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v10, v10, Landroid/media/CamcorderProfile;->videoFrameRate:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_2
    iget-object v8, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v8, v8, Landroid/media/CamcorderProfile;->videoCodec:I

    if-ne v6, v8, :cond_4

    iget-object v6, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    invoke-direct {p0, v6}, Lcom/android/camera/module/VideoModule;->getHevcVideoEncoderBitRate(Landroid/media/CamcorderProfile;)I

    move-result v6

    sget-object v8, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "H265 bitrate: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    :cond_4
    iget-object v6, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v6, v6, Landroid/media/CamcorderProfile;->videoBitRate:I

    sget-object v8, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "H264 bitrate: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_3
    invoke-virtual {p1, v6}, Landroid/media/MediaRecorder;->setVideoEncodingBitRate(I)V

    if-eqz v4, :cond_5

    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v4, v4, Landroid/media/CamcorderProfile;->audioBitRate:I

    invoke-virtual {p1, v4}, Landroid/media/MediaRecorder;->setAudioEncodingBitRate(I)V

    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v4, v4, Landroid/media/CamcorderProfile;->audioChannels:I

    invoke-virtual {p1, v4}, Landroid/media/MediaRecorder;->setAudioChannels(I)V

    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v4, v4, Landroid/media/CamcorderProfile;->audioSampleRate:I

    invoke-virtual {p1, v4}, Landroid/media/MediaRecorder;->setAudioSamplingRate(I)V

    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v4, v4, Landroid/media/CamcorderProfile;->audioCodec:I

    invoke-virtual {p1, v4}, Landroid/media/MediaRecorder;->setAudioEncoder(I)V

    :cond_5
    iget-boolean v4, p0, Lcom/android/camera/module/VideoModule;->mCaptureTimeLapse:Z

    if-eqz v4, :cond_6

    const-wide v0, 0x408f400000000000L    # 1000.0

    iget v4, p0, Lcom/android/camera/module/VideoModule;->mTimeBetweenTimeLapseFrameCaptureMs:I

    int-to-double v4, v4

    div-double/2addr v0, v4

    invoke-virtual {p1, v0, v1}, Landroid/media/MediaRecorder;->setCaptureRate(D)V

    goto :goto_5

    :cond_6
    if-nez v0, :cond_a

    if-nez v1, :cond_7

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoNewSlowMotion()Z

    move-result v0

    if-eqz v0, :cond_9

    :cond_7
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mFrameRate:I

    invoke-virtual {p1, v0}, Landroid/media/MediaRecorder;->setVideoFrameRate(I)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-ge v0, v1, :cond_8

    int-to-long v0, v6

    iget v4, p0, Lcom/android/camera/module/VideoModule;->mFrameRate:I

    int-to-long v4, v4

    mul-long/2addr v0, v4

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getNormalVideoFrameRate()I

    move-result v4

    int-to-long v4, v4

    div-long/2addr v0, v4

    long-to-int v0, v0

    goto :goto_4

    :cond_8
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mFrameRate:I

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getNormalVideoFrameRate()I

    move-result v1

    div-int/2addr v0, v1

    div-int/2addr v0, v5

    mul-int/2addr v0, v6

    :goto_4
    invoke-virtual {p1, v0}, Landroid/media/MediaRecorder;->setVideoEncodingBitRate(I)V

    :cond_9
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mFrameRate:I

    int-to-double v0, v0

    invoke-virtual {p1, v0, v1}, Landroid/media/MediaRecorder;->setCaptureRate(D)V

    goto :goto_5

    :cond_a
    if-lez v7, :cond_b

    invoke-virtual {p1, v7}, Landroid/media/MediaRecorder;->setVideoFrameRate(I)V

    int-to-double v0, v7

    invoke-virtual {p1, v0, v1}, Landroid/media/MediaRecorder;->setCaptureRate(D)V

    :cond_b
    :goto_5
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    invoke-virtual {p1, v0}, Landroid/media/MediaRecorder;->setMaxDuration(I)V

    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object v0

    if-eqz v0, :cond_c

    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v4

    double-to-float v1, v4

    invoke-virtual {v0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v4

    double-to-float v0, v4

    invoke-virtual {p1, v1, v0}, Landroid/media/MediaRecorder;->setLocation(FF)V

    :cond_c
    const-string v0, "camera.debug.video_max_size"

    invoke-static {v0, v3}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/camera/module/VideoModule;->getRecorderMaxFileSize(I)J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v1, v4, v6

    const-wide v6, 0xdac00000L

    if-lez v1, :cond_d

    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "maxFileSize="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v1, v8}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1, v4, v5}, Landroid/media/MediaRecorder;->setMaxFileSize(J)V

    cmp-long v1, v4, v6

    if-lez v1, :cond_d

    const-string v1, "param-use-64bit-offset=1"

    invoke-direct {p0, p1, v1}, Lcom/android/camera/module/VideoModule;->setParameterExtra(Landroid/media/MediaRecorder;Ljava/lang/String;)V

    :cond_d
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mi/config/a;->fX()Z

    move-result v1

    if-eqz v1, :cond_f

    if-gtz v0, :cond_e

    cmp-long v0, v4, v6

    if-nez v0, :cond_f

    :cond_e
    invoke-direct {p0, v2}, Lcom/android/camera/module/VideoModule;->setSplitWhenReachMaxSize(Z)V

    goto :goto_6

    :cond_f
    invoke-direct {p0, v3}, Lcom/android/camera/module/VideoModule;->setSplitWhenReachMaxSize(Z)V

    :goto_6
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS240()Z

    move-result v0

    if-nez v0, :cond_10

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS960()Z

    move-result v0

    if-eqz v0, :cond_11

    :cond_10
    :try_start_0
    const-string/jumbo v0, "video-param-i-frames-interval=0.033"

    invoke-direct {p0, p1, v0}, Lcom/android/camera/module/VideoModule;->setParameterExtra(Landroid/media/MediaRecorder;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_7

    :catch_0
    move-exception v0

    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_11
    :goto_7
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->getRecorderOrientationHint()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/media/MediaRecorder;->setOrientationHint(I)V

    iget p1, p0, Lcom/android/camera/module/VideoModule;->mOrientationCompensation:I

    iput p1, p0, Lcom/android/camera/module/VideoModule;->mOrientationCompensationAtRecordStart:I

    return-void
.end method

.method private shouldApplyUltraWideLDC()Z
    .locals 3

    iget v0, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->shouldUltraWideVideoLDCBeVisibleInMode(I)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mActualCameraId:I

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getUltraWideCameraId()I

    move-result v2

    if-eq v0, v2, :cond_1

    return v1

    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraWideVideoLDCEnabled()Z

    move-result v0

    return v0
.end method

.method private showSurfaceInfo(Landroid/view/Surface;)V
    .locals 7

    invoke-virtual {p1}, Landroid/view/Surface;->isValid()Z

    move-result v0

    invoke-static {p1}, Landroid/hardware/camera2/utils/SurfaceUtils;->isSurfaceForHwVideoEncoder(Landroid/view/Surface;)Z

    move-result v1

    invoke-static {p1}, Landroid/hardware/camera2/utils/SurfaceUtils;->getSurfaceSize(Landroid/view/Surface;)Landroid/util/Size;

    move-result-object v2

    invoke-static {p1}, Landroid/hardware/camera2/utils/SurfaceUtils;->getSurfaceFormat(Landroid/view/Surface;)I

    move-result v3

    sget-object v4, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "showSurfaceInfo: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string/jumbo p1, "|"

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string/jumbo p1, "|"

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string/jumbo p1, "|"

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string/jumbo p1, "|"

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private startHighSpeedRecordSession()V
    .locals 6

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "startHighSpeedRecordSession"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->checkDisplayOrientation()V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mErrorCallback:Lcom/android/camera/CameraErrorCallbackImpl;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPictureSize(Lcom/android/camera/CameraSize;)V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceCreatedTimestamp()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/VideoModule;->mSurfaceCreatedTimestamp:J

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    new-instance v1, Landroid/view/Surface;

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mRecorderSurface:Landroid/view/Surface;

    new-instance v3, Landroid/util/Range;

    iget v4, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSLower:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget v5, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSUpper:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    invoke-virtual {v0, v1, v2, v3, p0}, Lcom/android/camera2/Camera2Proxy;->startHighSpeedRecordSession(Landroid/view/Surface;Landroid/view/Surface;Landroid/util/Range;Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocused()V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mRecorderSurface:Landroid/view/Surface;

    invoke-direct {p0, v0}, Lcom/android/camera/module/VideoModule;->showSurfaceInfo(Landroid/view/Surface;)V

    return-void
.end method

.method private startPreviewAfterRecord()V
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->unlockAEAF()V

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isCaptureIntent()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoNewSlowMotion()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->startRecordPreview()V

    goto :goto_1

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->startHighSpeedRecordPreview()V

    :cond_3
    :goto_1
    return-void

    :cond_4
    :goto_2
    return-void
.end method

.method private startPreviewSession()V
    .locals 10

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "startPreviewSession"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->checkDisplayOrientation()V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p0}, Lcom/android/camera2/Camera2Proxy;->setFocusCallback(Lcom/android/camera2/Camera2Proxy$FocusCallback;)V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mErrorCallback:Lcom/android/camera/CameraErrorCallbackImpl;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPictureSize(Lcom/android/camera/CameraSize;)V

    new-instance v3, Landroid/view/Surface;

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    invoke-direct {v3, v0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceCreatedTimestamp()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/VideoModule;->mSurfaceCreatedTimestamp:J

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->getOperatingModeForPreview()I

    move-result v7

    const/4 v8, 0x0

    move-object v9, p0

    invoke-virtual/range {v2 .. v9}, Lcom/android/camera2/Camera2Proxy;->startPreviewSession(Landroid/view/Surface;ZZZIZLcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    return-void
.end method

.method private startRecordSession()V
    .locals 8

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startRecordSession: mode="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->checkDisplayOrientation()V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mErrorCallback:Lcom/android/camera/CameraErrorCallbackImpl;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPictureSize(Lcom/android/camera/CameraSize;)V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setVideoSnapshotSize(Lcom/android/camera/CameraSize;)V

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mAELockOnlySupported:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p0}, Lcom/android/camera2/Camera2Proxy;->setFocusCallback(Lcom/android/camera2/Camera2Proxy$FocusCallback;)V

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getOperatingMode()I

    move-result v5

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "startRecordSession: operatingMode = 0x%x"

    const/4 v7, 0x1

    new-array v2, v7, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceCreatedTimestamp()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/VideoModule;->mSurfaceCreatedTimestamp:J

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    new-instance v2, Landroid/view/Surface;

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    invoke-direct {v2, v0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mRecorderSurface:Landroid/view/Surface;

    const/4 v4, 0x1

    move-object v6, p0

    invoke-virtual/range {v1 .. v6}, Lcom/android/camera2/Camera2Proxy;->startRecordSession(Landroid/view/Surface;Landroid/view/Surface;ZILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocused()V

    iput-boolean v7, p0, Lcom/android/camera/module/VideoModule;->mPreviewing:Z

    return-void
.end method

.method private startRecorder()Z
    .locals 4

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/camera/module/VideoModule;->initializeRecorder(Z)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return v2

    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->start()V

    iput-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderWorking:Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    nop

    return v0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v3, "could not start recorder"

    invoke-static {v1, v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    instance-of v0, v0, Ljava/lang/IllegalStateException;

    if-eqz v0, :cond_1

    const v0, 0x7f09017a

    const v1, 0x7f09017c

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/VideoModule;->showConfirmMessage(II)V

    :cond_1
    return v2
.end method

.method private startVideoRecordingIfNeeded()V
    .locals 5

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isOpenOnly()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "android.intent.extra.CAMERA_OPEN_ONLY"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->getTimerDurationSeconds()I

    move-result v0

    const/16 v1, 0x3c

    if-le v0, v1, :cond_1

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "Caller delivered a wrong duration time large as 60s!"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/android/camera/module/VideoModule$4;

    invoke-direct {v2, p0}, Lcom/android/camera/module/VideoModule$4;-><init>(Lcom/android/camera/module/VideoModule;)V

    const/4 v3, -0x1

    if-ne v0, v3, :cond_2

    const-wide/16 v3, 0x5dc

    goto :goto_0

    :cond_2
    mul-int/lit16 v0, v0, 0x3e8

    int-to-long v3, v0

    :goto_0
    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "android.intent.extra.TIMER_DURATION_SECONDS"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    :goto_1
    return-void
.end method

.method private stopRecorder()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "CheckResult"
        }
    .end annotation

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mPendingStopRecorder:Z

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    new-instance v0, Lcom/android/camera/module/VideoModule$7;

    invoke-direct {v0, p0}, Lcom/android/camera/module/VideoModule$7;-><init>(Lcom/android/camera/module/VideoModule;)V

    invoke-static {v0}, Lio/reactivex/Single;->create(Lio/reactivex/SingleOnSubscribe;)Lio/reactivex/Single;

    move-result-object v0

    sget-object v1, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    invoke-virtual {v0, v1}, Lio/reactivex/Single;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v0

    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/VideoModule$6;

    invoke-direct {v1, p0}, Lcom/android/camera/module/VideoModule$6;-><init>(Lcom/android/camera/module/VideoModule;)V

    invoke-virtual {v0, v1}, Lio/reactivex/Single;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method private updateAutoZoomMode()V
    .locals 2

    iget v0, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isAutoZoomEnabled(I)Z

    move-result v0

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setAutoZoomMode(I)V

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setAutoZoomScaleOffset(F)V

    :cond_0
    return-void
.end method

.method private updateFpsRange()V
    .locals 7

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v0

    if-nez v0, :cond_6

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v0

    if-nez v0, :cond_6

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoNewSlowMotion()Z

    move-result v0

    if-eqz v0, :cond_1

    goto/16 :goto_3

    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getSupportedFpsRange()[Landroid/util/Range;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v2, v0, v1

    array-length v3, v0

    :goto_0
    if-ge v1, v3, :cond_5

    aget-object v4, v0, v1

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->getHSRValue()I

    move-result v5

    const/16 v6, 0x3c

    if-ne v5, v6, :cond_2

    new-instance v2, Landroid/util/Range;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v2, v0, v1}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    goto :goto_2

    :cond_2
    invoke-virtual {v2}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v4}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ge v5, v6, :cond_3

    goto :goto_1

    :cond_3
    invoke-virtual {v2}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v5

    invoke-virtual {v4}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v6

    if-ne v5, v6, :cond_4

    invoke-virtual {v2}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v4}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ge v5, v6, :cond_4

    nop

    :goto_1
    move-object v2, v4

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_5
    :goto_2
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "bestRange = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setFpsRange(Landroid/util/Range;)V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setVideoFpsRange(Landroid/util/Range;)V

    goto :goto_4

    :cond_6
    :goto_3
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mHfrFPSLower = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSLower:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", mHfrFPSUpper = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSUpper:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    new-instance v1, Landroid/util/Range;

    iget v2, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSLower:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSUpper:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setVideoFpsRange(Landroid/util/Range;)V

    :goto_4
    return-void
.end method

.method private updateFrontMirror()V
    .locals 2

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/mi/config/b;->jx()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->gf()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontMirror()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setFrontMirror(Z)V

    return-void
.end method

.method private updateHFRDeflicker()V
    .locals 2

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->gp()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS960()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setHFRDeflickerEnable(Z)V

    :cond_1
    return-void
.end method

.method private updateHfrFPSRange(Landroid/util/Size;I)V
    .locals 6

    nop

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraCapabilities;->getSupportedHighSpeedVideoFPSRange(Landroid/util/Size;)[Landroid/util/Range;

    move-result-object p1

    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_2

    aget-object v3, p1, v2

    invoke-virtual {v3}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, p2, :cond_1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v3}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ge v4, v5, :cond_1

    :cond_0
    nop

    move-object v1, v3

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {v1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSLower:I

    invoke-virtual {v1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSUpper:I

    return-void
.end method

.method private updateMacroMode()V
    .locals 2

    iget v0, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isMacroModeEnabled(I)Z

    move-result v0

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setMacroMode(Z)V

    return-void
.end method

.method private updateMutexModePreference()V
    .locals 2

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "on"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/android/camera/MutexModeManager;->setMutexMode(I)V

    :cond_0
    return-void
.end method

.method private updatePictureAndPreviewSize()V
    .locals 7

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v0, v0, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    int-to-double v0, v0

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v2, v2, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    int-to-double v2, v2

    div-double/2addr v0, v2

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const-class v3, Landroid/media/MediaRecorder;

    invoke-virtual {v2, v3}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v3, v3, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v4, v4, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-static {v2, v0, v1, v3, v4}, Lcom/android/camera/Util;->getOptimalVideoSnapshotPictureSize(Ljava/util/List;DII)Lcom/android/camera/CameraSize;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/module/VideoModule;->mVideoSize:Lcom/android/camera/CameraSize;

    sget-object v3, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "videoSize: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    nop

    nop

    invoke-static {}, Lcom/mi/config/b;->iv()Z

    move-result v3

    const v4, 0x7fffffff

    if-eqz v3, :cond_0

    iget v4, v2, Lcom/android/camera/CameraSize;->width:I

    iget v3, v2, Lcom/android/camera/CameraSize;->height:I

    goto :goto_0

    :cond_0
    move v3, v4

    :goto_0
    iget-object v5, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const/16 v6, 0x100

    invoke-virtual {v5, v6}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(I)Ljava/util/List;

    move-result-object v5

    invoke-static {v5, v0, v1, v4, v3}, Lcom/android/camera/Util;->getOptimalVideoSnapshotPictureSize(Ljava/util/List;DII)Lcom/android/camera/CameraSize;

    move-result-object v3

    iput-object v3, p0, Lcom/android/camera/module/VideoModule;->mPictureSize:Lcom/android/camera/CameraSize;

    sget-object v4, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "pictureSize: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v3, v2, Lcom/android/camera/CameraSize;->width:I

    sget v4, Lcom/android/camera/Util;->sWindowHeight:I

    if-gt v3, v4, :cond_2

    iget v3, v2, Lcom/android/camera/CameraSize;->width:I

    const/16 v4, 0x2d0

    if-ge v3, v4, :cond_1

    goto :goto_1

    :cond_1
    iget v3, v2, Lcom/android/camera/CameraSize;->width:I

    iget v2, v2, Lcom/android/camera/CameraSize;->height:I

    goto :goto_2

    :cond_2
    :goto_1
    sget v3, Lcom/android/camera/Util;->sWindowHeight:I

    sget v2, Lcom/android/camera/Util;->sWindowWidth:I

    :goto_2
    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const-class v5, Landroid/graphics/SurfaceTexture;

    invoke-virtual {v4, v5}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v4

    invoke-static {v4, v0, v1, v3, v2}, Lcom/android/camera/Util;->getOptimalVideoSnapshotPictureSize(Ljava/util/List;DII)Lcom/android/camera/CameraSize;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v0, v0, Lcom/android/camera/CameraSize;->width:I

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/VideoModule;->updateCameraScreenNailSize(II)V

    return-void
.end method

.method private updateUltraWideLDC()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->shouldApplyUltraWideLDC()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setUltraWideLDC(Z)V

    return-void
.end method

.method private updateVideoStabilization()V
    .locals 4

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->needDisableEISAndOIS()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setEnableEIS(Z)V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setEnableOIS(Z)V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/CameraScreenNail;->setVideoStabilizationCropped(Z)V

    return-void

    :cond_1
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isEisOn()Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "videoStabilization: EIS"

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setEnableEIS(Z)V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setEnableOIS(Z)V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isEISPreviewSupported()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/android/camera/CameraScreenNail;->setVideoStabilizationCropped(Z)V

    goto :goto_0

    :cond_2
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "videoStabilization: OIS"

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setEnableEIS(Z)V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setEnableOIS(Z)V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/CameraScreenNail;->setVideoStabilizationCropped(Z)V

    :cond_3
    :goto_0
    return-void
.end method


# virtual methods
.method public varargs consumePreference([I)V
    .locals 6
    .param p1    # [I
        .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
        .end annotation
    .end param

    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_4

    aget v2, p1, v1

    packed-switch v2, :pswitch_data_0

    :pswitch_0
    sget-boolean v3, Lcom/android/camera/module/VideoModule;->DEBUG:Z

    if-nez v3, :cond_3

    sget-object v3, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "no consumer for this updateType: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    :pswitch_1
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateModuleRelated()V

    goto/16 :goto_2

    :pswitch_2
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->updateHFRDeflicker()V

    goto/16 :goto_2

    :pswitch_3
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->updateMacroMode()V

    goto/16 :goto_2

    :pswitch_4
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->updateAutoZoomMode()V

    goto/16 :goto_2

    :pswitch_5
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->updateUltraWideLDC()V

    goto/16 :goto_2

    :pswitch_6
    goto/16 :goto_2

    :pswitch_7
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->updateFrontMirror()V

    goto/16 :goto_2

    :pswitch_8
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateDeviceOrientation()V

    goto :goto_2

    :pswitch_9
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v2, v3}, Lcom/android/camera2/Camera2Proxy;->setVideoSnapshotSize(Lcom/android/camera/CameraSize;)V

    goto :goto_2

    :pswitch_a
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->updateVideoStabilization()V

    goto :goto_2

    :pswitch_b
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateExposureMeteringMode()V

    goto :goto_2

    :pswitch_c
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->focusCenter()V

    goto :goto_2

    :pswitch_d
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->applyZoomRatio()V

    goto :goto_2

    :pswitch_e
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->updateFpsRange()V

    goto :goto_2

    :pswitch_f
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateVideoFocusMode()V

    goto :goto_2

    :pswitch_10
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateBeauty()V

    goto :goto_2

    :pswitch_11
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->setEvValue()V

    goto :goto_2

    :pswitch_12
    goto :goto_2

    :pswitch_13
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateFlashPreference()V

    goto :goto_2

    :pswitch_14
    invoke-static {}, Lcom/mi/config/b;->hX()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    const-string v2, "0"

    goto :goto_1

    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAntiBanding()Ljava/lang/String;

    move-result-object v2

    :goto_1
    invoke-virtual {p0, v2}, Lcom/android/camera/module/VideoModule;->updateAntiBanding(Ljava/lang/String;)V

    goto :goto_2

    :pswitch_15
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateFace()V

    goto :goto_2

    :pswitch_16
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateFocusArea()V

    goto :goto_2

    :pswitch_17
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->updatePictureAndPreviewSize()V

    nop

    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    :cond_3
    new-instance p1, Ljava/lang/RuntimeException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "no consumer for this updateType: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_4
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_17
        :pswitch_0
        :pswitch_16
        :pswitch_0
        :pswitch_15
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_e
        :pswitch_12
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_d
        :pswitch_c
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_b
        :pswitch_12
        :pswitch_a
        :pswitch_0
        :pswitch_9
        :pswitch_12
        :pswitch_8
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_7
        :pswitch_0
        :pswitch_12
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_6
        :pswitch_5
        :pswitch_0
        :pswitch_0
        :pswitch_12
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected doLaterReleaseIfNeed()V
    .locals 2

    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->doLaterReleaseIfNeed()V

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS960()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isTextureExpired()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "doLaterReleaseIfNeed: restartModule..."

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->restartModule()V

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "doLaterReleaseIfNeed: dismissBlurCover..."

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->dismissBlurCover()V

    :cond_1
    :goto_0
    return-void
.end method

.method protected enableFaceDetection()Z
    .locals 5

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->gY()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isBackCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoNewSlowMotion()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v2, "pref_camera_facedetection_key"

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f100006

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    invoke-virtual {v0, v2, v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    nop

    :cond_1
    return v1
.end method

.method protected fetchProfile(II)Landroid/media/CamcorderProfile;
    .locals 0

    invoke-static {p1, p2}, Landroid/media/CamcorderProfile;->get(II)Landroid/media/CamcorderProfile;

    move-result-object p1

    return-object p1
.end method

.method protected getNormalVideoFrameRate()I
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v0, v0, Landroid/media/CamcorderProfile;->videoFrameRate:I

    return v0

    :cond_0
    const/16 v0, 0x1e

    return v0
.end method

.method protected getOperatingMode()I
    .locals 5

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v0

    const v1, 0x8009

    const v2, 0x8004

    const/4 v3, 0x0

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v0

    if-eqz v0, :cond_0

    const v1, 0x8002

    goto/16 :goto_1

    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isEisOn()Z

    move-result v0

    if-eqz v0, :cond_1

    nop

    move v1, v2

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportVideoBeauty()Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_1

    :cond_2
    nop

    move v1, v3

    goto :goto_1

    :cond_3
    const v0, 0xf010

    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v4}, Lcom/android/camera2/CameraCapabilities;->isSupportVideoBeauty()Z

    move-result v4

    if-eqz v4, :cond_4

    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    invoke-virtual {p0, v4}, Lcom/android/camera/module/VideoModule;->isFaceBeautyOn(Lcom/android/camera/fragment/beauty/BeautyValues;)Z

    move-result v4

    if-eqz v4, :cond_4

    nop

    move v0, v1

    goto :goto_0

    :cond_4
    iget v1, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    if-nez v1, :cond_5

    nop

    move v0, v3

    goto :goto_0

    :cond_5
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isEisOn()Z

    move-result v1

    if-eqz v1, :cond_6

    nop

    move v0, v2

    :cond_6
    :goto_0
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v1}, Lcom/android/camera2/CameraCapabilities;->isFovcSupported()Z

    move-result v1

    if-eqz v1, :cond_8

    if-eqz v0, :cond_7

    const/4 v3, 0x1

    nop

    :cond_7
    iput-boolean v3, p0, Lcom/android/camera/module/VideoModule;->mFovcEnabled:Z

    :cond_8
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->getHSRValue()I

    move-result v1

    const/16 v2, 0x3c

    if-ne v1, v2, :cond_9

    const v0, 0x803c

    :cond_9
    move v1, v0

    iget v0, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isAutoZoomEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const v1, 0x80f4

    :cond_a
    :goto_1
    return v1
.end method

.method public getSupportedSettingKeys()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isBackCamera()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "pref_video_speed_fast_key"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-static {}, Lcom/mi/config/b;->hX()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "pref_video_speed_slow_key"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    return-object v0
.end method

.method protected isAEAFLockSupported()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS960()Z

    move-result v0

    if-nez v0, :cond_0

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

.method protected isCameraSwitchingDuringZoomingAllowed()Z
    .locals 2

    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    const/16 v1, 0xa2

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    const/16 v1, 0xa9

    if-ne v0, v1, :cond_1

    :cond_0
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isMacroModeEnabled(I)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isBackCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isNeedHapticFeedback()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    if-eqz v0, :cond_0

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

.method public isNeedMute()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mObjectTrackingStarted:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    if-nez v0, :cond_0

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

.method public isPostProcessing()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderPostProcessing:Z

    return v0
.end method

.method protected isShowHFRDuration()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isUnInterruptable()Z
    .locals 1

    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->isUnInterruptable()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isNormalMode()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderWorking:Z

    if-eqz v0, :cond_0

    const-string v0, "recorder release"

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mUnInterruptableReason:Ljava/lang/String;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mUnInterruptableReason:Ljava/lang/String;

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected isZoomEnabled()Z
    .locals 2

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS960()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isAutoZoomEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    return v1

    :cond_1
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->isZoomEnabled()Z

    move-result v0

    return v0
.end method

.method public onBackPressed()Z
    .locals 9

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isCreated()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mPaused:Z

    const/4 v2, 0x1

    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mStereoSwitchThread:Lcom/android/camera/module/VideoBase$StereoSwitchThread;

    if-eqz v0, :cond_2

    return v1

    :cond_2
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS960()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderPostProcessing:Z

    if-eqz v0, :cond_3

    return v2

    :cond_3
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-eqz v0, :cond_5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/android/camera/module/VideoModule;->mLastBackPressedTime:J

    sub-long v5, v3, v5

    const-wide/16 v7, 0xbb8

    cmp-long v0, v5, v7

    if-lez v0, :cond_4

    iput-wide v3, p0, Lcom/android/camera/module/VideoModule;->mLastBackPressedTime:J

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    const v1, 0x7f090125

    invoke-static {v0, v1}, Lcom/android/camera/ToastUtils;->showToast(Landroid/content/Context;I)V

    goto :goto_0

    :cond_4
    invoke-virtual {p0, v2, v1}, Lcom/android/camera/module/VideoModule;->stopVideoRecording(ZZ)V

    :goto_0
    return v2

    :cond_5
    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result v0

    if-eqz v0, :cond_6

    return v2

    :cond_6
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->isAutoZoomTracking:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-virtual {p0, v1}, Lcom/android/camera/module/VideoModule;->stopTracking(I)V

    return v2

    :cond_7
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->onBackPressed()Z

    move-result v0

    return v0

    :cond_8
    :goto_1
    return v2
.end method

.method protected onCameraOpened()V
    .locals 1

    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->onCameraOpened()V

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateBeauty()V

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->readVideoPreferences()V

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->initializeFocusManager()V

    sget-object v0, Lcom/android/camera/constant/UpdateConstant;->VIDEO_TYPES_INIT:[I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->updatePreferenceTrampoline([I)V

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/module/VideoModule;->initializeRecorder(Z)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoNewSlowMotion()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->startRecordSession()V

    goto :goto_1

    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->startHighSpeedRecordSession()V

    goto :goto_1

    :cond_2
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->startPreviewSession()V

    :goto_1
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->initAutoZoom()V

    return-void
.end method

.method public onCreate(II)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/android/camera/module/VideoBase;->onCreate(II)V

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->changeConflictPreference()V

    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/CameraIntentManager;->isVideoCaptureIntent()Z

    move-result p1

    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoModule;->setCaptureIntent(Z)V

    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object p1

    sget p2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    invoke-virtual {p1, p2}, Lcom/android/camera/effect/EffectController;->setEffect(I)V

    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object p1

    iget-object p2, p0, Lcom/android/camera/module/VideoModule;->mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

    invoke-virtual {p1, p2}, Lcom/android/camera/SensorStateManager;->setSensorStateListener(Lcom/android/camera/SensorStateManager$SensorStateListener;)V

    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/CameraIntentManager;->isQuickCapture()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/android/camera/module/VideoModule;->mQuickCapture:Z

    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {p1, p0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setObjectViewListener(Lcom/android/camera/ui/ObjectView$ObjectViewListener;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    const-string p2, "phone"

    invoke-virtual {p1, p2}, Lcom/android/camera/Camera;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/telephony/TelephonyManager;

    iput-object p1, p0, Lcom/android/camera/module/VideoModule;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    const-string p1, "continuous-video"

    iput-object p1, p0, Lcom/android/camera/module/VideoModule;->mVideoFocusMode:Ljava/lang/String;

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 p2, 0xd6

    invoke-virtual {p1, p2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$AutoZoomViewProtocol;

    iput-object p1, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomViewProtocol:Lcom/android/camera/protocol/ModeProtocol$AutoZoomViewProtocol;

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 p2, 0xac

    invoke-virtual {p1, p2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    iput-object p1, p0, Lcom/android/camera/module/VideoModule;->mTopAlert:Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->initRecorderSurface()V

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->onCameraOpened()V

    return-void
.end method

.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->onDestroy()V

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->releaseRecorderSurface()V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x2d

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method

.method public onError(Landroid/media/MediaRecorder;II)V
    .locals 2

    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MediaRecorder error. what="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " extra="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p1, p3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x1

    if-eq p2, p1, :cond_0

    const/16 p3, 0x64

    if-ne p2, p3, :cond_2

    :cond_0
    iget-boolean p2, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-eqz p2, :cond_1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/module/VideoModule;->stopVideoRecording(ZZ)V

    :cond_1
    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    :cond_2
    return-void
.end method

.method public onGestureTrack(Landroid/graphics/RectF;Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mInStartingFocusRecording:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isBackCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/mi/config/b;->hZ()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->is4KHigherVideoQuality(I)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isCaptureIntent()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/VideoModule;->initializeObjectTrack(Landroid/graphics/RectF;Z)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onInfo(Landroid/media/MediaRecorder;II)V
    .locals 2

    iget-boolean p1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-nez p1, :cond_0

    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onInfo: ignore event "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 p1, 0x0

    const/4 p3, 0x1

    packed-switch p2, :pswitch_data_0

    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onInfo what : "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :pswitch_0
    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string p2, "next output file started"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->onMaxFileSizeReached()V

    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mNextVideoValues:Landroid/content/ContentValues;

    iput-object p1, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mNextVideoFileName:Ljava/lang/String;

    iput-object p1, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/camera/module/VideoModule;->mNextVideoValues:Landroid/content/ContentValues;

    iput-object p1, p0, Lcom/android/camera/module/VideoModule;->mNextVideoFileName:Ljava/lang/String;

    goto/16 :goto_0

    :pswitch_1
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSplitWhenReachMaxSize()Z

    move-result p1

    sget-object p2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "max file size is approaching. split: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p1, :cond_2

    iget p1, p0, Lcom/android/camera/module/VideoModule;->mCurrentFileNumber:I

    add-int/2addr p1, p3

    iput p1, p0, Lcom/android/camera/module/VideoModule;->mCurrentFileNumber:I

    iget p1, p0, Lcom/android/camera/module/VideoModule;->mOutputFormat:I

    iget p2, p0, Lcom/android/camera/module/VideoModule;->mCurrentFileNumber:I

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/module/VideoModule;->genContentValues(II)Landroid/content/ContentValues;

    move-result-object p1

    const-string p2, "_data"

    invoke-virtual {p1, p2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    sget-object p3, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "nextVideoPath: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p3, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0, p2}, Lcom/android/camera/module/VideoModule;->setNextOutputFile(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_1

    iput-object p1, p0, Lcom/android/camera/module/VideoModule;->mNextVideoValues:Landroid/content/ContentValues;

    iput-object p2, p0, Lcom/android/camera/module/VideoModule;->mNextVideoFileName:Ljava/lang/String;

    :cond_1
    goto :goto_0

    :pswitch_2
    sget-object p2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "reached max size. fileNumber="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/camera/module/VideoModule;->mCurrentFileNumber:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0, p3, p1}, Lcom/android/camera/module/VideoModule;->stopVideoRecording(ZZ)V

    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/ui/ScreenHint;->isScreenHintVisible()Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    const p2, 0x7f0900cc

    invoke-static {p1, p2, p3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :pswitch_3
    invoke-virtual {p0, p3, p1}, Lcom/android/camera/module/VideoModule;->stopVideoRecording(ZZ)V

    nop

    :cond_2
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x320
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onObjectStable()V
    .locals 0

    return-void
.end method

.method public onPause()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mFovcEnabled:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isEISPreviewSupported()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isEisOn()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->notifyVideoStreamEnd()V

    :cond_1
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->onPause()V

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->waitStereoSwitchThread()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->stopObjectTracking(Z)V

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->releaseResources()V

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->updateStereoSettings(Z)V

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->closeVideoFileDescriptor()V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->reset()V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->stopFaceDetection(Z)V

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->resetScreenOn()V

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v1}, Lcom/android/camera/ui/PopupManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/ui/PopupManager;

    move-result-object v1

    invoke-virtual {v1, v2, v0}, Lcom/android/camera/ui/PopupManager;->notifyShowPopup(Landroid/view/View;I)V

    :cond_2
    return-void
.end method

.method public onPauseButtonClick()V
    .locals 6

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPauseButtonClick: isRecordingPaused="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, " isRecording="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-eqz v2, :cond_3

    iget-wide v2, p0, Lcom/android/camera/module/VideoModule;->mPauseClickTime:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x1f4

    cmp-long v2, v2, v4

    if-gez v2, :cond_0

    goto :goto_3

    :cond_0
    iput-wide v0, p0, Lcom/android/camera/module/VideoModule;->mPauseClickTime:J

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    iget-boolean v1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    if-eqz v1, :cond_2

    :try_start_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x18

    if-lt v1, v2, :cond_1

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-static {v1}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->resumeMediaRecorder(Landroid/media/MediaRecorder;)V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->start()V

    :goto_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lcom/android/camera/module/VideoModule;->mVideoRecordedDuration:J

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lcom/android/camera/module/VideoModule;->mRecordingStartTime:J

    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/android/camera/module/VideoModule;->mVideoRecordedDuration:J

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const/16 v2, 0x2a

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    const-string v1, ""

    iput-object v1, p0, Lcom/android/camera/module/VideoModule;->mRecordingTime:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateRecordingTime()V

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onResume()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    sget-object v2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v3, "failed to resume media recorder"

    invoke-static {v2, v3, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->releaseMediaRecorder()V

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onFailed()V

    :goto_1
    goto :goto_2

    :cond_2
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->pauseVideoRecording()V

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v1

    invoke-static {v1}, Lcom/android/camera/statistic/CameraStatUtil;->trackPauseVideoRecording(Z)V

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPause()V

    :goto_2
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "onPauseButtonClick"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_3
    :goto_3
    return-void
.end method

.method public onPreviewLayoutChanged(Landroid/graphics/Rect;)V
    .locals 3

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPreviewLayoutChanged: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0, p1}, Lcom/android/camera/Camera;->onLayoutChange(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/CameraScreenNail;->setDisplayArea(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraScreenNail;->getRenderWidth()I

    move-result v1

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraScreenNail;->getRenderHeight()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setRenderSize(II)V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    invoke-virtual {v0, v1, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    :cond_0
    return-void
.end method

.method public onPreviewMetaDataUpdate(Landroid/hardware/camera2/CaptureResult;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/camera/module/VideoBase;->onPreviewMetaDataUpdate(Landroid/hardware/camera2/CaptureResult;)V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->isAutoZoomTracking:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v0, p1}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public onPreviewSessionFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/android/camera/module/VideoBase;->onPreviewSessionFailed(Landroid/hardware/camera2/CameraCaptureSession;)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    return-void
.end method

.method public onPreviewSessionSuccess(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 4

    invoke-super {p0, p1}, Lcom/android/camera/module/VideoBase;->onPreviewSessionSuccess(Landroid/hardware/camera2/CameraCaptureSession;)V

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isCreated()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v0, "onPreviewSessionSuccess: module is not ready"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0, v1}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    return-void

    :cond_0
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onPreviewSessionSuccess: session="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/module/VideoModule;->mFaceDetectionEnabled:Z

    sget-object p1, Lcom/android/camera/constant/UpdateConstant;->VIDEO_TYPES_ON_PREVIEW_SUCCESS:[I

    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoModule;->updatePreferenceInWorkThread([I)V

    invoke-virtual {p0, v1}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    return-void
.end method

.method protected onPreviewStart()V
    .locals 2
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mPreviewing:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0, p0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->initializeFocusView(Lcom/android/camera/ui/FocusView$ExposureViewListener;)V

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->updateMutexModePreference()V

    const/4 v0, 0x1

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/VideoModule;->onShutterButtonFocus(ZI)V

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->startVideoRecordingIfNeeded()V

    :cond_0
    return-void
.end method

.method public onSharedPreferenceChanged()V
    .locals 8

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mPaused:Z

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v0, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v0, v0, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v1, v1, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->readVideoPreferences()V

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v2, v2, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    if-ne v2, v0, :cond_2

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v2, v2, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    if-eq v2, v1, :cond_3

    :cond_2
    sget-object v2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v4, "profile size changed [%d %d]->[%d %d]"

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v6, 0x0

    aput-object v0, v5, v6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x1

    aput-object v0, v5, v1

    const/4 v0, 0x2

    iget-object v7, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v7, v7, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v0

    const/4 v0, 0x3

    iget-object v7, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v7, v7, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v0

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-array v0, v1, [I

    aput v1, v0, v6

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->updatePreferenceTrampoline([I)V

    :cond_3
    return-void

    :cond_4
    :goto_0
    return-void
.end method

.method public onShutterButtonClick(I)V
    .locals 4

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onShutterButtonClick isRecording="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, " inStartingFocusRecording="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mInStartingFocusRecording:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mInStartingFocusRecording:Z

    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/android/camera/module/VideoModule;->mLastBackPressedTime:J

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isIgnoreTouchEvent()Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v0, "onShutterButtonClick: ignore touch event"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v1

    if-eqz v1, :cond_1

    return-void

    :cond_1
    iget-boolean v1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    nop

    invoke-virtual {p0, v2, v0}, Lcom/android/camera/module/VideoModule;->stopVideoRecording(ZZ)V

    goto :goto_0

    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v3, 0xd4

    invoke-virtual {v1, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPrepare()V

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->checkCallingState()Z

    move-result v3

    if-nez v3, :cond_3

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onFailed()V

    return-void

    :cond_3
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v3}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    invoke-static {}, Lcom/android/camera/storage/Storage;->isLowStorageAtLastPoint()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onFailed()V

    return-void

    :cond_4
    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoModule;->setTriggerMode(I)V

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoModule;->playCameraSound(I)V

    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->canRecord()Z

    move-result p1

    if-eqz p1, :cond_5

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->startVideoRecording()V

    goto :goto_0

    :cond_5
    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v0, "wait for autoFocus"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mInStartingFocusRecording:Z

    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const/16 v0, 0x37

    const-wide/16 v1, 0xbb8

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :goto_0
    return-void
.end method

.method public onShutterButtonFocus(ZI)V
    .locals 0

    return-void
.end method

.method public onSingleTapUp(IIZ)V
    .locals 2

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mPaused:Z

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->isSessionReady()Z

    move-result v0

    if-eqz v0, :cond_6

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mSnapshotInProgress:Z

    if-nez v0, :cond_6

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/module/VideoModule;->isInTapableRect(II)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrameAvailable()Z

    move-result v0

    if-nez v0, :cond_1

    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string p2, "onSingleTapUp: frame not available"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v0

    if-eqz v0, :cond_2

    return-void

    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xab

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromTapDown(II)Z

    move-result v0

    if-eqz v0, :cond_3

    return-void

    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->isAutoZoomTracking:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_4

    return-void

    :cond_4
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mObjectTrackingStarted:Z

    if-eqz v0, :cond_5

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->stopObjectTracking(Z)V

    :cond_5
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->unlockAEAF()V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFocusViewType(Z)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/VideoModule;->mTouchFocusStartingTime:J

    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0, p1, p2}, Landroid/graphics/Point;-><init>(II)V

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->mapTapCoordinate(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget p2, v0, Landroid/graphics/Point;->x:I

    iget v0, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {p1, p2, v0, p3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onSingleTapUp(IIZ)V

    return-void

    :cond_6
    :goto_0
    return-void
.end method

.method public onStop()V
    .locals 2

    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->onStop()V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->exitSavePowerMode()V

    return-void
.end method

.method public onTrackLost()V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->notifyAutoZoomStartUiHint()V

    return-void
.end method

.method public onTrackLosting()V
    .locals 1

    iget v0, p0, Lcom/android/camera/module/VideoModule;->mTrackLostCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/camera/module/VideoModule;->mTrackLostCount:I

    return-void
.end method

.method public onUserInteraction()V
    .locals 1

    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->onUserInteraction()V

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->keepPowerSave()V

    :cond_0
    return-void
.end method

.method public onVideoRecordStopped()V
    .locals 3

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onVideoRecordStopped: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mPendingStopRecorder:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mPendingStopRecorder:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->stopRecorder()V

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->startPreviewAfterRecord()V

    :cond_0
    return-void
.end method

.method protected onWaitStopCallbackTimeout()V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->stopRecorder()V

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->startPreviewAfterRecord()V

    return-void
.end method

.method public onZoomingActionEnd(I)V
    .locals 3

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onZoomingActionEnd(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/android/camera/ui/zoom/ZoomingAction;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " @hash: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$DualController;

    if-eqz v0, :cond_2

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$DualController;->isSlideVisible()Z

    move-result v1

    if-nez v1, :cond_2

    const/4 v1, 0x2

    if-eq p1, v1, :cond_0

    const/4 v1, 0x1

    if-ne p1, v1, :cond_2

    :cond_0
    iget-boolean p1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-nez p1, :cond_2

    iget-boolean p1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    iget p1, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    invoke-static {p1}, Lcom/android/camera/CameraSettings;->isMacroModeEnabled(I)Z

    move-result p1

    if-nez p1, :cond_2

    const/4 p1, 0x0

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$DualController;->setImmersiveModeEnabled(Z)V

    :cond_2
    :goto_0
    return-void
.end method

.method public onZoomingActionStart(I)V
    .locals 3

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onZoomingActionStart(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/android/camera/ui/zoom/ZoomingAction;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " @hash: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->isExtraMenuShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->hideExtraMenu()V

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$DualController;

    if-eqz v0, :cond_3

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eq p1, v1, :cond_1

    if-ne p1, v2, :cond_3

    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->hu()Z

    move-result p1

    if-eqz p1, :cond_2

    iget p1, p0, Lcom/android/camera/module/VideoModule;->mActualCameraId:I

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getStandaloneMacroCameraId()I

    move-result v1

    if-ne p1, v1, :cond_2

    const/4 p1, 0x0

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$DualController;->setImmersiveModeEnabled(Z)V

    goto :goto_0

    :cond_2
    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$DualController;->setImmersiveModeEnabled(Z)V

    :cond_3
    :goto_0
    return-void
.end method

.method protected pauseMediaRecorder(Landroid/media/MediaRecorder;)V
    .locals 0

    invoke-static {p1}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->pauseMediaRecorder(Landroid/media/MediaRecorder;)V

    return-void
.end method

.method public pausePreview()V
    .locals 2

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "pausePreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mPreviewing:Z

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->currentIsMainThread()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->stopObjectTracking(Z)V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->pausePreview()V

    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocused()V

    :cond_2
    return-void
.end method

.method public reShowMoon()V
    .locals 1

    iget v0, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isAutoZoomEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->notifyAutoZoomStartUiHint()V

    :cond_0
    return-void
.end method

.method protected readVideoPreferences()V
    .locals 10

    iget v0, p0, Lcom/android/camera/module/VideoModule;->mActualCameraId:I

    iget v1, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getVideoQuality(II)I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/CameraIntentManager;->getVideoQuality()I

    move-result v3
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    if-lez v3, :cond_0

    nop

    move v0, v1

    goto :goto_0

    :cond_0
    nop

    move v0, v2

    :goto_0
    goto :goto_1

    :catch_0
    move-exception v3

    :goto_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/runing/DataItemRunning;->getVideoSpeed()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoNewSlowMotion()Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v3, "fps960"

    iput-object v3, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    goto :goto_2

    :cond_1
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/camera/module/VideoModule;->mSlowModeFps:Ljava/lang/String;

    :goto_2
    iput v2, p0, Lcom/android/camera/module/VideoModule;->mTimeBetweenTimeLapseFrameCaptureMs:I

    iput-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mCaptureTimeLapse:Z

    const-string v3, "fast"

    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/16 v4, 0x3e8

    if-eqz v3, :cond_5

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v3

    const-string v5, "pref_video_time_lapse_frame_interval_key"

    const v6, 0x7f09003a

    invoke-virtual {p0, v6}, Lcom/android/camera/module/VideoModule;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/android/camera/module/VideoModule;->mTimeBetweenTimeLapseFrameCaptureMs:I

    iget v3, p0, Lcom/android/camera/module/VideoModule;->mTimeBetweenTimeLapseFrameCaptureMs:I

    if-eqz v3, :cond_2

    move v3, v1

    goto :goto_3

    :cond_2
    move v3, v2

    :goto_3
    iput-boolean v3, p0, Lcom/android/camera/module/VideoModule;->mCaptureTimeLapse:Z

    iget-boolean v3, p0, Lcom/android/camera/module/VideoModule;->mCaptureTimeLapse:Z

    if-eqz v3, :cond_4

    add-int/lit16 v0, v0, 0x3e8

    if-lt v0, v4, :cond_3

    const/16 v3, 0x3f0

    if-le v0, v3, :cond_4

    :cond_3
    add-int/lit16 v0, v0, -0x3e8

    iput-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mCaptureTimeLapse:Z

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->forceToNormalMode()V

    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v3}, Lcom/android/camera/ui/RotateTextToast;->getInstance(Landroid/app/Activity;)Lcom/android/camera/ui/RotateTextToast;

    move-result-object v3

    const v5, 0x7f090127

    iget v6, p0, Lcom/android/camera/module/VideoModule;->mOrientation:I

    invoke-virtual {v3, v5, v6}, Lcom/android/camera/ui/RotateTextToast;->show(II)V

    :cond_4
    rem-int/lit16 v3, v0, 0x3e8

    iput v3, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    goto/16 :goto_b

    :cond_5
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v3

    const/4 v5, 0x5

    const/16 v6, 0x78

    const/4 v7, 0x6

    if-nez v3, :cond_c

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v3

    if-eqz v3, :cond_6

    goto :goto_6

    :cond_6
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoNewSlowMotion()Z

    move-result v3

    if-eqz v3, :cond_a

    iput v7, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    sget-object v0, Lcom/android/camera/module/VideoModule;->SIZE_1080:Landroid/util/Size;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getNewSlowMotionIQ()I

    move-result v3

    if-ne v3, v5, :cond_7

    sget-object v0, Lcom/android/camera/module/VideoModule;->SIZE_720:Landroid/util/Size;

    iput v3, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    :cond_7
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v7

    invoke-virtual {v7}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigSlowMotion()Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;

    move-result-object v7

    const/16 v8, 0xac

    invoke-virtual {v7, v8}, Lcom/android/camera/data/data/config/ComponentConfigSlowMotion;->getComponentValue(I)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/android/camera/module/VideoModule;->mSlowModeFps:Ljava/lang/String;

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS120()Z

    move-result v7

    if-eqz v7, :cond_8

    invoke-direct {p0, v0, v6}, Lcom/android/camera/module/VideoModule;->updateHfrFPSRange(Landroid/util/Size;I)V

    :goto_4
    move v0, v3

    goto :goto_5

    :cond_8
    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getSupportedHfrSettings(I)Ljava/util/ArrayList;

    move-result-object v6

    const-string v7, "1920x1080:240"

    invoke-interface {v6, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_9

    sget-object v0, Lcom/android/camera/module/VideoModule;->SIZE_720:Landroid/util/Size;

    iput v5, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    move v3, v5

    :cond_9
    const/16 v5, 0xf0

    invoke-direct {p0, v0, v5}, Lcom/android/camera/module/VideoModule;->updateHfrFPSRange(Landroid/util/Size;I)V

    goto :goto_4

    :goto_5
    goto/16 :goto_b

    :cond_a
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v3}, Lcom/android/camera2/CameraCapabilities;->isSupportVideoBeauty()Z

    move-result v3

    if-eqz v3, :cond_b

    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    invoke-virtual {p0, v3}, Lcom/android/camera/module/VideoModule;->isFaceBeautyOn(Lcom/android/camera/fragment/beauty/BeautyValues;)Z

    move-result v3

    if-eqz v3, :cond_b

    invoke-static {v0, v7}, Ljava/lang/Math;->min(II)I

    move-result v0

    :cond_b
    iput v0, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    goto/16 :goto_b

    :cond_c
    :goto_6
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->getHfrSetting()Ljava/lang/String;

    move-result-object v3

    const-string v8, ":"

    invoke-virtual {v3, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v9

    if-eqz v9, :cond_d

    aget-object v5, v8, v2

    invoke-direct {p0, v5}, Lcom/android/camera/module/VideoModule;->convertSizeToQuality(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    goto :goto_7

    :cond_d
    invoke-static {v0, v7}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v0, v5}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    :goto_7
    iget v5, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    const/4 v9, -0x1

    if-ne v5, v9, :cond_e

    sget-object v5, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "invalid hfr setting: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->forceToNormalMode()V

    iput v0, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    goto :goto_a

    :cond_e
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    nop

    if-ne v7, v0, :cond_f

    new-instance v3, Landroid/util/Size;

    const/16 v5, 0x780

    const/16 v7, 0x438

    invoke-direct {v3, v5, v7}, Landroid/util/Size;-><init>(II)V

    goto :goto_8

    :cond_f
    new-instance v3, Landroid/util/Size;

    const/16 v5, 0x500

    const/16 v7, 0x2d0

    invoke-direct {v3, v5, v7}, Landroid/util/Size;-><init>(II)V

    :goto_8
    aget-object v5, v8, v1

    invoke-static {v5, v6}, Lcom/android/camera/Util;->parseInt(Ljava/lang/String;I)I

    move-result v5

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v7

    if-eqz v7, :cond_11

    iget-object v5, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v5, v3}, Lcom/android/camera2/CameraCapabilities;->getSupportedHFRVideoFPSList(Landroid/util/Size;)Ljava/util/List;

    move-result-object v5

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_10

    goto :goto_9

    :cond_10
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    goto :goto_9

    :cond_11
    move v6, v5

    :goto_9
    invoke-direct {p0, v3, v6}, Lcom/android/camera/module/VideoModule;->updateHfrFPSRange(Landroid/util/Size;I)V

    :goto_a
    nop

    :goto_b
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    if-eqz v3, :cond_12

    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v3, v3, Landroid/media/CamcorderProfile;->quality:I

    rem-int/2addr v3, v4

    iget v5, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    if-eq v3, v5, :cond_12

    invoke-virtual {p0, v2}, Lcom/android/camera/module/VideoModule;->stopObjectTracking(Z)V

    :cond_12
    iget v3, p0, Lcom/android/camera/module/VideoModule;->mBogusCameraId:I

    invoke-virtual {p0, v3, v0}, Lcom/android/camera/module/VideoModule;->fetchProfile(II)Landroid/media/CamcorderProfile;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getVideoEncoder()I

    move-result v3

    iput v3, v0, Landroid/media/CamcorderProfile;->videoCodec:I

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v0, v0, Landroid/media/CamcorderProfile;->fileFormat:I

    iput v0, p0, Lcom/android/camera/module/VideoModule;->mOutputFormat:I

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v5, "frameRate=%d profileSize=%dx%d codec=%d"

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Object;

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->getHSRValue()I

    move-result v7

    if-lez v7, :cond_13

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->getHSRValue()I

    move-result v7

    goto :goto_c

    :cond_13
    iget-object v7, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v7, v7, Landroid/media/CamcorderProfile;->videoFrameRate:I

    :goto_c
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v2

    iget-object v7, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v7, v7, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v1

    const/4 v1, 0x2

    iget-object v7, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v7, v7, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v1

    const/4 v1, 0x3

    iget-object v7, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v7, v7, Landroid/media/CamcorderProfile;->videoCodec:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v1

    invoke-static {v3, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v0

    if-nez v0, :cond_15

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v0

    if-nez v0, :cond_15

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoNewSlowMotion()Z

    move-result v0

    if-eqz v0, :cond_14

    goto :goto_d

    :cond_14
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v0, v0, Landroid/media/CamcorderProfile;->videoFrameRate:I

    iput v0, p0, Lcom/android/camera/module/VideoModule;->mFrameRate:I

    goto :goto_e

    :cond_15
    :goto_d
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSUpper:I

    iput v0, p0, Lcom/android/camera/module/VideoModule;->mFrameRate:I

    :goto_e
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS960()Z

    move-result v0

    if-eqz v0, :cond_16

    const/16 v0, 0x7d0

    iput v0, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    goto :goto_10

    :cond_16
    :try_start_1
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->getVideoDurationTime()I

    move-result v0

    mul-int/2addr v0, v4

    iput v0, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_f

    :catch_1
    move-exception v0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->gZ()Z

    move-result v0

    if-eqz v0, :cond_17

    iget v0, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->is4KHigherVideoQuality(I)Z

    move-result v0

    if-eqz v0, :cond_17

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mCaptureTimeLapse:Z

    if-nez v0, :cond_17

    const v0, 0x75300

    iput v0, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    goto :goto_f

    :cond_17
    iput v2, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    :goto_f
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    if-eqz v0, :cond_18

    iget v0, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    if-ge v0, v4, :cond_18

    iput v4, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    :cond_18
    :goto_10
    return-void
.end method

.method public registerProtocol()V
    .locals 3

    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->registerProtocol()V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa9

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    sget-boolean v0, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v1

    const/4 v2, 0x4

    new-array v2, v2, [I

    fill-array-data v2, :array_0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/impl/ImplFactory;->initAdditional(Lcom/android/camera/ActivityBase;[I)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v1

    const/4 v2, 0x3

    new-array v2, v2, [I

    fill-array-data v2, :array_1

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/impl/ImplFactory;->initAdditional(Lcom/android/camera/ActivityBase;[I)V

    :goto_0
    return-void

    :array_0
    .array-data 4
        0xa4
        0xae
        0xc7
        0xd4
    .end array-data

    :array_1
    .array-data 4
        0xa4
        0xc7
        0xd4
    .end array-data
.end method

.method protected resizeForPreviewAspectRatio()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/camera/Util;->getDisplayRotation(Landroid/app/Activity;)I

    move-result v0

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v1}, Lcom/android/camera2/CameraCapabilities;->getSensorOrientation()I

    move-result v1

    sub-int/2addr v1, v0

    add-int/lit16 v1, v1, 0x168

    rem-int/lit16 v1, v1, 0xb4

    if-nez v1, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mVideoSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->height:I

    int-to-float v1, v1

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mVideoSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->width:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setPreviewAspectRatio(F)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mVideoSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->width:I

    int-to-float v1, v1

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mVideoSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->height:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setPreviewAspectRatio(F)V

    :goto_0
    return-void
.end method

.method public resumePreview()V
    .locals 2

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v1, "resumePreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mPreviewing:Z

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    :cond_0
    return-void
.end method

.method public setAutoZoomMode(I)V
    .locals 2

    const/4 p1, 0x1

    new-array p1, p1, [I

    const/4 v0, 0x0

    const/16 v1, 0x33

    aput v1, p1, v0

    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoModule;->updatePreferenceInWorkThread([I)V

    return-void
.end method

.method public setAutoZoomStartCapture(Landroid/graphics/RectF;)V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x4

    new-array v1, v1, [F

    const/4 v2, 0x0

    iget v3, p1, Landroid/graphics/RectF;->left:F

    aput v3, v1, v2

    const/4 v2, 0x1

    iget v3, p1, Landroid/graphics/RectF;->top:F

    aput v3, v1, v2

    const/4 v2, 0x2

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v3

    aput v3, v1, v2

    const/4 v2, 0x3

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result p1

    aput p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setAutoZoomStartCapture([F)V

    :cond_0
    return-void
.end method

.method public setAutoZoomStopCapture(I)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p1}, Lcom/android/camera2/Camera2Proxy;->setAutoZoomStopCapture(I)V

    :cond_0
    return-void
.end method

.method public startAiLens()V
    .locals 0

    return-void
.end method

.method public startAutoZoom()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->isShowOrHideUltraWideHint:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->isAutoZoomTracking:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/module/VideoModule$9;

    invoke-direct {v1, p0}, Lcom/android/camera/module/VideoModule$9;-><init>(Lcom/android/camera/module/VideoModule;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->notifyAutoZoomStartUiHint()V

    return-void
.end method

.method public startObjectTracking()V
    .locals 3

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startObjectTracking: started="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mObjectTrackingStarted:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public startPreview()V
    .locals 3

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startPreview: previewing="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mPreviewing:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->checkDisplayOrientation()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mPreviewing:Z

    return-void
.end method

.method public startTracking(Landroid/graphics/RectF;)V
    .locals 6

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mTopAlert:Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    const/4 v1, 0x0

    const/4 v2, 0x4

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mTopAlert:Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    const-wide/16 v3, 0x0

    invoke-interface {v0, v2, v1, v3, v4}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertAiDetectTipHint(IIJ)V

    :cond_1
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->notifyAutoZoomStopUiHint()V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v3, -0x1

    invoke-virtual {v0, v3}, Lcom/android/camera2/Camera2Proxy;->setAutoZoomStopCapture(I)V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    new-array v3, v2, [F

    iget v4, p1, Landroid/graphics/RectF;->left:F

    aput v4, v3, v1

    iget v1, p1, Landroid/graphics/RectF;->top:F

    const/4 v4, 0x1

    aput v1, v3, v4

    const/4 v1, 0x2

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v5

    aput v5, v3, v1

    const/4 v1, 0x3

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result p1

    aput p1, v3, v1

    invoke-virtual {v0, v3}, Lcom/android/camera2/Camera2Proxy;->setAutoZoomStartCapture([F)V

    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    new-array v0, v2, [F

    fill-array-data v0, :array_0

    invoke-virtual {p1, v0}, Lcom/android/camera2/Camera2Proxy;->setAutoZoomStartCapture([F)V

    iget-object p1, p0, Lcom/android/camera/module/VideoModule;->isAutoZoomTracking:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    iget-boolean p1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackSelectObject(Z)V

    return-void

    :cond_2
    :goto_0
    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method protected startVideoRecording()V
    .locals 3

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startVideoRecording: mode="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackStartVideoRecordStart(Ljava/lang/String;Z)V

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isCaptureIntent()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    const/4 v0, -0x1

    goto :goto_0

    :cond_1
    move v0, v1

    :goto_0
    iput v0, p0, Lcom/android/camera/module/VideoModule;->mCurrentFileNumber:I

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->silenceSounds()V

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->startRecorder()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->onStartRecorderFail()V

    return-void

    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xd4

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    if-eqz v0, :cond_3

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onStart()V

    :cond_3
    sget-object v0, Lcom/android/camera/constant/UpdateConstant;->VIDEO_TYPES_RECORD:[I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->updatePreferenceTrampoline([I)V

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v0

    if-nez v0, :cond_5

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v0

    if-nez v0, :cond_5

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoNewSlowMotion()Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_1

    :cond_4
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->startRecording()V

    goto :goto_2

    :cond_5
    :goto_1
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->startHighSpeedRecording()V

    :goto_2
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v2, "startVideoRecording process done"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iput v1, p0, Lcom/android/camera/module/VideoModule;->mTrackLostCount:I

    invoke-static {}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackStartVideoRecordEnd()V

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->onStartRecorderSucceed()V

    return-void
.end method

.method public stopAutoZoom()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->isShowOrHideUltraWideHint:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->isAutoZoomTracking:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/module/VideoModule$10;

    invoke-direct {v1, p0}, Lcom/android/camera/module/VideoModule$10;-><init>(Lcom/android/camera/module/VideoModule;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->notifyAutoZoomStopUiHint()V

    return-void
.end method

.method public stopObjectTracking(Z)V
    .locals 2

    sget-object p1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "stopObjectTracking: started="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/android/camera/module/VideoModule;->mObjectTrackingStarted:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public stopTracking(I)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->isAutoZoomTracking:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->isAutoZoomTracking:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setAutoZoomStopCapture(I)V

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setAutoZoomStopCapture(I)V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mAutoZoomViewProtocol:Lcom/android/camera/protocol/ModeProtocol$AutoZoomViewProtocol;

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$AutoZoomViewProtocol;->onTrackingStopped(I)V

    :cond_1
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->notifyAutoZoomStartUiHint()V

    return-void
.end method

.method public stopVideoRecording(ZZ)V
    .locals 21

    move-object/from16 v0, p0

    move/from16 v1, p1

    sget-object v2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "stopVideoRecording>>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v4, v0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string/jumbo v4, "|"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v2, v0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-nez v2, :cond_0

    return-void

    :cond_0
    iget-object v2, v0, Lcom/android/camera/module/VideoModule;->isAutoZoomTracking:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    invoke-virtual {v0, v3}, Lcom/android/camera/module/VideoModule;->stopTracking(I)V

    :cond_1
    iput-boolean v3, v0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    iput-boolean v3, v0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-direct/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->isFPS960()Z

    move-result v2

    const/4 v6, 0x1

    if-eqz v2, :cond_3

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v7

    iget-wide v9, v0, Lcom/android/camera/module/VideoModule;->mRecordingStartTime:J

    sub-long/2addr v7, v9

    const-wide/16 v9, 0x7d0

    sub-long/2addr v9, v7

    const-wide/16 v7, 0x64

    cmp-long v2, v9, v7

    if-gtz v2, :cond_2

    move v2, v6

    goto :goto_0

    :cond_2
    nop

    move v2, v3

    :goto_0
    if-eqz v2, :cond_3

    iput-boolean v6, v0, Lcom/android/camera/module/VideoModule;->mMediaRecorderPostProcessing:Z

    :cond_3
    sget-boolean v2, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    if-eqz v2, :cond_5

    iget v2, v0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    const/16 v7, 0xa8

    if-eq v2, v7, :cond_5

    iget v2, v0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    const/16 v7, 0xac

    if-eq v2, v7, :cond_5

    iget v2, v0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    const/16 v7, 0xaa

    if-eq v2, v7, :cond_5

    iget v2, v0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->isMacroModeEnabled(I)Z

    move-result v2

    if-nez v2, :cond_5

    iget v2, v0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->isAutoZoomEnabled(I)Z

    move-result v2

    if-nez v2, :cond_5

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->isBackCamera()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-virtual {v0, v3}, Lcom/android/camera/module/VideoModule;->updateZoomRatioToggleButtonState(Z)V

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->isUltraWideBackCamera()Z

    move-result v2

    if-eqz v2, :cond_4

    sget v2, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_ULTR:F

    invoke-virtual {v0, v2}, Lcom/android/camera/module/VideoModule;->setMinZoomRatio(F)V

    sget v2, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_ULTR:F

    iget-object v7, v0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v7}, Lcom/android/camera2/CameraCapabilities;->getMaxZoomRatio()F

    move-result v7

    mul-float/2addr v2, v7

    invoke-virtual {v0, v2}, Lcom/android/camera/module/VideoModule;->setMaxZoomRatio(F)V

    goto :goto_1

    :cond_4
    sget v2, Lcom/android/camera/HybridZoomingSystem;->FLOAT_ZOOM_RATIO_ULTR:F

    invoke-virtual {v0, v2}, Lcom/android/camera/module/VideoModule;->setMinZoomRatio(F)V

    const/high16 v2, 0x40c00000    # 6.0f

    iget-object v7, v0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v7}, Lcom/android/camera2/CameraCapabilities;->getMaxZoomRatio()F

    move-result v7

    invoke-static {v2, v7}, Ljava/lang/Math;->min(FF)F

    move-result v2

    invoke-virtual {v0, v2}, Lcom/android/camera/module/VideoModule;->setMaxZoomRatio(F)V

    :cond_5
    :goto_1
    invoke-virtual {v0, v3}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    iget-object v2, v0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v2, :cond_7

    iget-object v2, v0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v1, :cond_6

    const/4 v3, 0x0

    goto :goto_2

    :cond_6
    move-object v3, v0

    :goto_2
    invoke-virtual {v2, v3}, Lcom/android/camera2/Camera2Proxy;->stopRecording(Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;)V

    :cond_7
    iget-object v2, v0, Lcom/android/camera/module/VideoModule;->mCountDownTimer:Landroid/os/CountDownTimer;

    if-eqz v2, :cond_8

    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v2

    if-eqz v2, :cond_8

    iget-object v2, v0, Lcom/android/camera/module/VideoModule;->mCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v2}, Landroid/os/CountDownTimer;->cancel()V

    :cond_8
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xd4

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    if-eqz v2, :cond_a

    iget-boolean v3, v0, Lcom/android/camera/module/VideoModule;->mMediaRecorderPostProcessing:Z

    if-eqz v3, :cond_9

    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPostSavingStart()V

    goto :goto_3

    :cond_9
    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onFinish()V

    :cond_a
    :goto_3
    iget-object v2, v0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v2, :cond_b

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoNewSlowMotion()Z

    move-result v2

    if-nez v2, :cond_b

    iget v2, v0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->isAutoZoomEnabled(I)Z

    move-result v2

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v7

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->getModuleIndex()I

    move-result v8

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->getModuleIndex()I

    move-result v3

    invoke-static {v3}, Lcom/android/camera/CameraSettings;->isUltraWideConfigOpen(I)Z

    move-result v10

    iget-object v11, v0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    iget v12, v0, Lcom/android/camera/module/VideoModule;->mQuality:I

    iget-object v3, v0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v3}, Lcom/android/camera2/Camera2Proxy;->getFlashMode()I

    move-result v13

    iget v14, v0, Lcom/android/camera/module/VideoModule;->mFrameRate:I

    iget v15, v0, Lcom/android/camera/module/VideoModule;->mTimeBetweenTimeLapseFrameCaptureMs:I

    iget-object v3, v0, Lcom/android/camera/module/VideoModule;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    move-wide/from16 v19, v4

    iget-wide v4, v0, Lcom/android/camera/module/VideoModule;->mVideoRecordTime:J

    move v9, v2

    move-object/from16 v16, v3

    move-wide/from16 v17, v4

    invoke-static/range {v7 .. v18}, Lcom/android/camera/statistic/CameraStatUtil;->trackVideoRecorded(ZIZZLjava/lang/String;IIIILcom/android/camera/fragment/beauty/BeautyValues;J)V

    invoke-static {}, Lcom/android/camera/statistic/CameraStatUtil;->trackUltraWideVideoTaken()V

    if-eqz v2, :cond_c

    sget-object v2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "track count is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v0, Lcom/android/camera/module/VideoModule;->mTrackLostCount:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget v2, v0, Lcom/android/camera/module/VideoModule;->mTrackLostCount:I

    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->trackLostCount(I)V

    goto :goto_4

    :cond_b
    move-wide/from16 v19, v4

    :cond_c
    :goto_4
    const-wide/16 v2, 0x0

    iput-wide v2, v0, Lcom/android/camera/module/VideoModule;->mVideoRecordTime:J

    if-eqz v1, :cond_d

    invoke-direct/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->stopRecorder()V

    invoke-direct/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->startPreviewAfterRecord()V

    goto :goto_5

    :cond_d
    iput-boolean v6, v0, Lcom/android/camera/module/VideoModule;->mPendingStopRecorder:Z

    iget-object v1, v0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const/16 v2, 0x2e

    const-wide/16 v3, 0x12c

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :goto_5
    iget-object v1, v0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v1}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/AutoLockManager;->hibernateDelayed()V

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->exitSavePowerMode()V

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "stopVideoRecording<<time="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long v2, v2, v19

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public takeVideoSnapShoot()Z
    .locals 4

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mPaused:Z

    const/4 v1, 0x0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-nez v0, :cond_5

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mSnapshotInProgress:Z

    if-nez v0, :cond_5

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-nez v0, :cond_0

    goto/16 :goto_1

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_1

    return v1

    :cond_1
    invoke-static {}, Lcom/android/camera/storage/Storage;->isLowStorageAtLastPoint()Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v3, "capture: low storage"

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    nop

    invoke-virtual {p0, v2, v1}, Lcom/android/camera/module/VideoModule;->stopVideoRecording(ZZ)V

    return v1

    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/storage/ImageSaver;->isBusy()Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v2, "capture: ImageSaver is full"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/camera/ui/RotateTextToast;->getInstance(Landroid/app/Activity;)Lcom/android/camera/ui/RotateTextToast;

    move-result-object v0

    const v2, 0x7f0901b4

    invoke-virtual {v0, v2, v1}, Lcom/android/camera/ui/RotateTextToast;->show(II)V

    return v1

    :cond_3
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mBogusCameraId:I

    iget v1, p0, Lcom/android/camera/module/VideoModule;->mOrientation:I

    invoke-static {v0, v1}, Lcom/android/camera/Util;->getJpegRotation(II)I

    move-result v0

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setJpegRotation(I)V

    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setGpsLocation(Landroid/location/Location;)V

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->setJpegQuality()V

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->updateFrontMirror()V

    invoke-static {}, Lcom/mi/config/b;->iC()Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_0

    :cond_4
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getCameraRotation()I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/android/camera/CameraScreenNail;->animateCapture(I)V

    :goto_0
    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string v3, "capture: start"

    invoke-static {v1, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    new-instance v3, Lcom/android/camera/module/VideoModule$JpegPictureCallback;

    invoke-direct {v3, p0, v0}, Lcom/android/camera/module/VideoModule$JpegPictureCallback;-><init>(Lcom/android/camera/module/VideoModule;Landroid/location/Location;)V

    invoke-virtual {v1, v3}, Lcom/android/camera2/Camera2Proxy;->captureVideoSnapshot(Lcom/android/camera2/Camera2Proxy$PictureCallback;)V

    iput-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mSnapshotInProgress:Z

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v0

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackVideoSnapshot(Z)V

    return v2

    :cond_5
    :goto_1
    return v1
.end method

.method public unRegisterProtocol()V
    .locals 2

    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->unRegisterProtocol()V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa9

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/impl/ImplFactory;->detachAdditional()V

    return-void
.end method

.method protected updateRecordingTime()V
    .locals 13

    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->updateRecordingTime()V

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isFPS960()Z

    move-result v0

    if-nez v0, :cond_e

    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v0

    if-eqz v0, :cond_1

    goto/16 :goto_6

    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/camera/module/VideoModule;->mRecordingStartTime:J

    sub-long/2addr v0, v2

    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    if-eqz v2, :cond_2

    iget-wide v0, p0, Lcom/android/camera/module/VideoModule;->mVideoRecordedDuration:J

    :cond_2
    iget v2, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    const/4 v3, 0x0

    if-eqz v2, :cond_3

    iget v2, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    const v4, 0xea60

    sub-int/2addr v2, v4

    int-to-long v4, v2

    cmp-long v2, v0, v4

    if-ltz v2, :cond_3

    const/4 v2, 0x1

    goto :goto_0

    :cond_3
    move v2, v3

    :goto_0
    if-eqz v2, :cond_4

    const-wide/16 v4, 0x0

    iget v6, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    int-to-long v6, v6

    sub-long/2addr v6, v0

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    const-wide/16 v6, 0x3e7

    add-long/2addr v4, v6

    goto :goto_1

    :cond_4
    move-wide v4, v0

    :goto_1
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isNormalMode()Z

    move-result v6

    const-wide/16 v7, 0x3e8

    if-nez v6, :cond_a

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v6

    if-eqz v6, :cond_5

    goto :goto_4

    :cond_5
    nop

    const-string v6, "fast"

    iget-object v9, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    const-wide/16 v9, 0x0

    if-eqz v6, :cond_6

    iget v6, p0, Lcom/android/camera/module/VideoModule;->mTimeBetweenTimeLapseFrameCaptureMs:I

    int-to-double v6, v6

    double-to-long v11, v6

    goto :goto_2

    :cond_6
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v6

    if-eqz v6, :cond_7

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isShowHFRDuration()Z

    move-result v6

    if-eqz v6, :cond_7

    const-wide v6, 0x408f400000000000L    # 1000.0

    iget v8, p0, Lcom/android/camera/module/VideoModule;->mFrameRate:I

    int-to-double v11, v8

    div-double/2addr v6, v11

    const/16 v8, 0x3e8

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getNormalVideoFrameRate()I

    move-result v11

    mul-int/2addr v8, v11

    iget v11, p0, Lcom/android/camera/module/VideoModule;->mFrameRate:I

    div-int/2addr v8, v11

    int-to-long v11, v8

    goto :goto_2

    :cond_7
    move-wide v11, v7

    move-wide v6, v9

    :goto_2
    cmpl-double v8, v6, v9

    if-eqz v8, :cond_9

    nop

    invoke-direct {p0, v0, v1, v6, v7}, Lcom/android/camera/module/VideoModule;->getSpeedRecordVideoLength(JD)J

    move-result-wide v3

    const-string v5, "fast"

    iget-object v8, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    invoke-static {v3, v4, v5}, Lcom/android/camera/Util;->millisecondToTimeString(JZ)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mRecordingTime:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    double-to-long v7, v6

    goto :goto_5

    :cond_8
    :goto_3
    move-wide v7, v11

    goto :goto_5

    :cond_9
    invoke-static {v4, v5, v3}, Lcom/android/camera/Util;->millisecondToTimeString(JZ)Ljava/lang/String;

    move-result-object v3

    goto :goto_3

    :cond_a
    :goto_4
    div-long v9, v4, v7

    iput-wide v9, p0, Lcom/android/camera/module/VideoModule;->mVideoRecordTime:J

    invoke-static {v4, v5, v3}, Lcom/android/camera/Util;->millisecondToTimeString(JZ)Ljava/lang/String;

    move-result-object v3

    :goto_5
    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mTopAlert:Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    if-eqz v4, :cond_b

    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mTopAlert:Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    invoke-interface {v4, v3}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateRecordingTime(Ljava/lang/String;)V

    :cond_b
    iput-object v3, p0, Lcom/android/camera/module/VideoModule;->mRecordingTime:Ljava/lang/String;

    iget-boolean v3, p0, Lcom/android/camera/module/VideoModule;->mRecordingTimeCountsDown:Z

    if-eq v3, v2, :cond_c

    iput-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mRecordingTimeCountsDown:Z

    :cond_c
    const-wide/16 v2, 0x1f4

    iget-boolean v4, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    if-nez v4, :cond_d

    rem-long/2addr v0, v7

    sub-long v2, v7, v0

    :cond_d
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x2a

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void

    :cond_e
    :goto_6
    return-void
.end method
