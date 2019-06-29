.class public Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;
.super Ljava/lang/Object;
.source "MimojiAvatarEngineImpl.java"

# interfaces
.implements Lcom/android/camera/SurfaceTextureScreenNail$ExternalFrameProcessor;
.implements Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;
.implements Lcom/android/camera2/Camera2Proxy$PreviewCallback;


# static fields
.field private static final HANDLER_RECORDING_CURRENT_FILE_SIZE:I = 0x3

.field private static final HANDLER_RECORDING_CURRENT_TIME:I = 0x1

.field private static final HANDLER_RECORDING_MAX_DURATION_REACHED:I = 0x2

.field private static final HANDLER_RECORDING_MAX_FILE_SIZE_REACHED:I = 0x4

.field private static final HANDLER_RESOURCE_ERROR_BROKEN:I = 0x0

.field private static final START_OFFSET_MS:J = 0x1c2L

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mActivityBase:Lcom/android/camera/ActivityBase;

.field private mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

.field private final mAvatarLock:Ljava/lang/Object;

.field private mAvatarTemplatePath:Ljava/lang/String;

.field private mCameraView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

.field private mCaptureCallback:Lcom/arcsoft/avatar/RecordModule$MediaResultCallback;

.field private mContentValues:Landroid/content/ContentValues;

.field private mContext:Landroid/content/Context;

.field private mCountDownTimer:Landroid/os/CountDownTimer;

.field private mCurrentScreenOrientation:I

.field private mDeviceRotation:I

.field private mDrawSize:Landroid/util/Size;

.field private mFaceDectectResult:I

.field private mGetThumCountDownLatch:Ljava/util/concurrent/CountDownLatch;

.field private mHandler:Landroid/os/Handler;

.field private volatile mIsAvatarInited:Z

.field private mIsFaceDetectSuccess:Z

.field private mIsFrontCamera:Z

.field private mIsRecordStopping:Z

.field private volatile mIsRecording:Z

.field private mIsShutterButtonClick:Z

.field private mIsStopRender:Z

.field private mLastNeedBeauty:Z

.field private mLoadHandler:Landroid/os/Handler;

.field private mLoadResourceHandler:Landroid/os/Handler;

.field private mLoadResourceThread:Landroid/os/HandlerThread;

.field private mLoadThread:Landroid/os/HandlerThread;

.field private mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

.field private mMaxVideoDurationInMs:I

.field private mMimojiEditor:Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

.field private mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

.field private mNeedCapture:Z

.field private mNeedShowNoFaceTips:Z

.field private mOrientation:I

.field private mPreviewHeight:I

.field private mPreviewWidth:I

.field private mRecordModule:Lcom/arcsoft/avatar/RecordModule;

.field private mRecordingListener:Lcom/arcsoft/avatar/recoder/RecordingListener;

.field private mSaveVideoPath:Ljava/lang/String;

.field private mShowAvatar:Z

.field private mTextureId:[I

.field private mUiHandler:Landroid/os/Handler;

.field private mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Lcom/android/camera/ActivityBase;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x3a98

    iput v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMaxVideoDurationInMs:I

    const/16 v0, 0x5a

    iput v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDeviceRotation:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    iput v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCurrentScreenOrientation:I

    const-string v1, ""

    iput-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsShutterButtonClick:Z

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsStopRender:Z

    iput v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mFaceDectectResult:I

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFaceDetectSuccess:Z

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mNeedCapture:Z

    new-instance v2, Landroid/os/HandlerThread;

    const-string v3, "LoadConfig"

    invoke-direct {v2, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadThread:Landroid/os/HandlerThread;

    new-instance v2, Landroid/os/HandlerThread;

    const-string v3, "LoadResource"

    invoke-direct {v2, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadResourceThread:Landroid/os/HandlerThread;

    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarLock:Ljava/lang/Object;

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mTextureId:[I

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mNeedShowNoFaceTips:Z

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsRecordStopping:Z

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLastNeedBeauty:Z

    new-instance v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;

    invoke-direct {v1, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    iput-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCaptureCallback:Lcom/arcsoft/avatar/RecordModule$MediaResultCallback;

    new-instance v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$14;

    invoke-direct {v1, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$14;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    iput-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordingListener:Lcom/arcsoft/avatar/recoder/RecordingListener;

    new-instance v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$15;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$15;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mHandler:Landroid/os/Handler;

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getGLView()Lcom/android/camera/ui/V6CameraGLSurfaceView;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCameraView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCameraAppImpl()Lcom/android/camera/CameraAppImpl;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraAppImpl;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xa6

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iput-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadResourceThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    new-instance v1, Landroid/os/Handler;

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadResourceThread:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadResourceHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    new-instance v1, Landroid/os/Handler;

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadThread:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadHandler:Landroid/os/Handler;

    new-instance v1, Landroid/os/Handler;

    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getMainLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-direct {v1, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mUiHandler:Landroid/os/Handler;

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsAvatarInited:Z

    iget-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/MimojiHelper;->init(Landroid/content/Context;)V

    return-void
.end method

.method private CaptureCallback(Ljava/nio/ByteBuffer;)V
    .locals 11

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDrawSize:Landroid/util/Size;

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDrawSize:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    new-instance v8, Landroid/graphics/Matrix;

    invoke-direct {v8}, Landroid/graphics/Matrix;-><init>()V

    iget-boolean p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v2, -0x40800000    # -1.0f

    const/16 v10, 0x10e

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    if-eqz p1, :cond_0

    iget p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDeviceRotation:I

    const/16 v3, 0x5a

    if-eq p1, v3, :cond_1

    iget p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDeviceRotation:I

    if-ne p1, v10, :cond_0

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDeviceRotation:I

    rem-int/lit16 p1, p1, 0xb4

    if-nez p1, :cond_2

    invoke-virtual {v8, v2, v1}, Landroid/graphics/Matrix;->postScale(FF)Z

    goto :goto_1

    :cond_1
    :goto_0
    invoke-virtual {v8, v1, v2}, Landroid/graphics/Matrix;->postScale(FF)Z

    :cond_2
    :goto_1
    const/4 v4, 0x0

    const/4 v5, 0x0

    iget-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDrawSize:Landroid/util/Size;

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v6

    iget-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDrawSize:Landroid/util/Size;

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v7

    const/4 v9, 0x0

    move-object v3, v0

    invoke-static/range {v3 .. v9}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object p1

    const/4 v1, 0x0

    invoke-static {v1}, Lcom/android/camera/module/BaseModule;->getJpegQuality(Z)I

    move-result v2

    invoke-static {p1, v2}, Lcom/android/camera/Util;->getBitmapData(Landroid/graphics/Bitmap;I)[B

    move-result-object v2

    iget-boolean v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    if-eqz v3, :cond_3

    iget v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDeviceRotation:I

    rem-int/lit16 v3, v3, 0xb4

    if-nez v3, :cond_3

    iget v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDeviceRotation:I

    add-int/lit16 v3, v3, 0xb4

    rem-int/lit16 v3, v3, 0x168

    goto :goto_2

    :cond_3
    iget v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDeviceRotation:I

    :goto_2
    iget-boolean v4, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    if-eqz v4, :cond_4

    move-object v4, v0

    goto :goto_3

    :cond_4
    move-object v4, p1

    :goto_3
    iget-boolean v5, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    const/4 v6, 0x0

    invoke-static {v6, v4, v3, v5}, Lcom/android/camera/Thumbnail;->createThumbnail(Landroid/net/Uri;Landroid/graphics/Bitmap;IZ)Lcom/android/camera/Thumbnail;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/Thumbnail;->startWaitingForUri()V

    iget-object v4, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {v4}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v4, v3, v5, v5}, Lcom/android/camera/ThumbnailUpdater;->setThumbnail(Lcom/android/camera/Thumbnail;ZZ)V

    new-instance v3, Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const/4 v7, -0x4

    invoke-direct {v3, v4, v5, v7, v6}, Lcom/xiaomi/camera/core/ParallelTaskData;-><init>(JILjava/lang/String;)V

    invoke-virtual {v3, v2, v1}, Lcom/xiaomi/camera/core/ParallelTaskData;->fillJpegData([BI)V

    iget-boolean v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    iget v4, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDeviceRotation:I

    invoke-static {v2, v4}, Lcom/android/camera/Util;->getJpegRotation(II)I

    move-result v2

    add-int/2addr v2, v10

    rem-int/lit16 v2, v2, 0x168

    new-instance v4, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    iget-object v5, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDrawSize:Landroid/util/Size;

    iget-object v7, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDrawSize:Landroid/util/Size;

    iget-object v8, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDrawSize:Landroid/util/Size;

    invoke-direct {v4, v5, v7, v8}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;-><init>(Landroid/util/Size;Landroid/util/Size;Landroid/util/Size;)V

    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object v5

    invoke-static {}, Lcom/android/camera/CameraSettings;->isDualCameraWaterMarkOpen()Z

    move-result v7

    invoke-virtual {v4, v7}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setHasDualWaterMark(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object v4

    invoke-virtual {v4, v2}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setJpegRotation(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object v2

    invoke-static {v1}, Lcom/android/camera/module/BaseModule;->getJpegQuality(Z)I

    move-result v4

    invoke-virtual {v2, v4}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setJpegQuality(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object v2

    sget v4, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    invoke-virtual {v2, v4}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setFilterId(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object v2

    const/4 v4, -0x1

    iget v7, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mOrientation:I

    if-ne v4, v7, :cond_5

    goto :goto_4

    :cond_5
    iget v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mOrientation:I

    :goto_4
    invoke-virtual {v2, v1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setOrientation(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object v1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isTimeWaterMarkOpen()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-static {}, Lcom/android/camera/Util;->getTimeWatermark()Ljava/lang/String;

    move-result-object v6

    nop

    :cond_6
    invoke-virtual {v1, v6}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setTimeWaterMarkString(Ljava/lang/String;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object v1

    invoke-direct {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->getDeviceWaterMarkParam()Lcom/android/camera/effect/renders/DeviceWatermarkParam;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setDeviceWatermarkParam(Lcom/android/camera/effect/renders/DeviceWatermarkParam;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object v1

    invoke-direct {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setPictureInfo(Lcom/xiaomi/camera/core/PictureInfo;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setLocation(Landroid/location/Location;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->build()Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/xiaomi/camera/core/ParallelTaskData;->fillParameter(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;)V

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {v1}, Lcom/android/camera/ActivityBase;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/android/camera/storage/ImageSaver;->onParallelProcessFinish(Lcom/xiaomi/camera/core/ParallelTaskData;)Z

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    iget-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object p1

    check-cast p1, Lcom/android/camera/module/LiveModule;

    invoke-virtual {p1}, Lcom/android/camera/module/LiveModule;->onMimojiCaptureCallback()V

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1002(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mUiHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$1202(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    return p1
.end method

.method static synthetic access$1300(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/android/camera/module/impl/component/MimojiStatusManager;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Landroid/os/ParcelFileDescriptor;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    return-object p0
.end method

.method static synthetic access$1402(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Landroid/os/ParcelFileDescriptor;)Landroid/os/ParcelFileDescriptor;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    return-object p1
.end method

.method static synthetic access$1500(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/recoder/RecordingListener;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordingListener:Lcom/arcsoft/avatar/recoder/RecordingListener;

    return-object p0
.end method

.method static synthetic access$1600(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCurrentScreenOrientation:I

    return p0
.end method

.method static synthetic access$1700(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mPreviewWidth:I

    return p0
.end method

.method static synthetic access$1800(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mPreviewHeight:I

    return p0
.end method

.method static synthetic access$1900(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/android/camera/ActivityBase;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsAvatarInited:Z

    return p0
.end method

.method static synthetic access$2002(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsRecording:Z

    return p1
.end method

.method static synthetic access$202(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsAvatarInited:Z

    return p1
.end method

.method static synthetic access$2102(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsRecordStopping:Z

    return p1
.end method

.method static synthetic access$2200(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mSaveVideoPath:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$2300(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Landroid/content/ContentValues;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContentValues:Landroid/content/ContentValues;

    return-object p0
.end method

.method static synthetic access$2400(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Ljava/util/concurrent/CountDownLatch;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mGetThumCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    return-object p0
.end method

.method static synthetic access$2500(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Ljava/nio/ByteBuffer;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->CaptureCallback(Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method static synthetic access$2600(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$2700(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mOrientation:I

    return p0
.end method

.method static synthetic access$2800(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    return p0
.end method

.method static synthetic access$2900(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mNeedShowNoFaceTips:Z

    return p0
.end method

.method static synthetic access$300(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/AvatarEngine;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    return-object p0
.end method

.method static synthetic access$3000(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->onProfileFinish()V

    return-void
.end method

.method static synthetic access$302(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Lcom/arcsoft/avatar/AvatarEngine;)Lcom/arcsoft/avatar/AvatarEngine;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    return-object p1
.end method

.method static synthetic access$3100(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->reloadConfig()V

    return-void
.end method

.method static synthetic access$500(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/RecordModule;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    return-object p0
.end method

.method static synthetic access$502(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Lcom/arcsoft/avatar/RecordModule;)Lcom/arcsoft/avatar/RecordModule;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    return-object p1
.end method

.method static synthetic access$600(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$700(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/RecordModule$MediaResultCallback;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCaptureCallback:Lcom/arcsoft/avatar/RecordModule$MediaResultCallback;

    return-object p0
.end method

.method static synthetic access$802(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Landroid/util/Size;)Landroid/util/Size;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDrawSize:Landroid/util/Size;

    return-object p1
.end method

.method static synthetic access$902(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsStopRender:Z

    return p1
.end method

.method private animateCapture()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ActivityBase;->playCameraSound(I)V

    return-void
.end method

.method public static create(Lcom/android/camera/ActivityBase;)Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;
    .locals 1

    new-instance v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-direct {v0, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;-><init>(Lcom/android/camera/ActivityBase;)V

    return-object v0
.end method

.method private createAvatar([BII)V
    .locals 14

    move-object v0, p0

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    sget-object v2, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PersonTemplatePath:Ljava/lang/String;

    if-eq v1, v2, :cond_0

    sget-object v1, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PersonTemplatePath:Ljava/lang/String;

    iput-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    sget-object v2, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PersonTemplatePath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/arcsoft/avatar/AvatarEngine;->setTemplatePath(Ljava/lang/String;)V

    :cond_0
    new-instance v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;

    invoke-direct {v1}, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;-><init>()V

    iget-object v2, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v3, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    sget-object v4, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PersonTemplatePath:Ljava/lang/String;

    mul-int/lit8 v7, p2, 0x4

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v12, 0x0

    sget-object v13, Lcom/android/camera/module/impl/component/-$$Lambda$MimojiAvatarEngineImpl$RJYDigwssyCC_737Br9t7yY1-rs;->INSTANCE:Lcom/android/camera/module/impl/component/-$$Lambda$MimojiAvatarEngineImpl$RJYDigwssyCC_737Br9t7yY1-rs;

    move/from16 v5, p2

    move/from16 v6, p3

    move-object v8, p1

    move-object v11, v1

    invoke-virtual/range {v3 .. v13}, Lcom/arcsoft/avatar/AvatarEngine;->avatarProfile(Ljava/lang/String;III[BIZLcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileInfo;Lcom/arcsoft/avatar/AvatarConfig$UpdateProgressCallback;)I

    move-result v3

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sget-object v2, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "avatarProfile res: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ", status:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ", gender: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->gender:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget v2, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    const/16 v4, 0xfe

    if-eq v2, v4, :cond_a

    iget v2, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    const/16 v4, 0xf6

    if-ne v2, v4, :cond_1

    goto/16 :goto_1

    :cond_1
    iget v2, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-ne v2, v3, :cond_2

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f09034c

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    :cond_2
    iget v2, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    and-int/lit8 v2, v2, 0x2

    if-nez v2, :cond_3

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f09034d

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    :cond_3
    iget v2, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    and-int/lit8 v2, v2, 0x4

    if-nez v2, :cond_4

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f09034e

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_4
    iget v2, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    and-int/lit8 v2, v2, 0x8

    if-nez v2, :cond_5

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f09034f

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_5
    iget v2, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    and-int/lit8 v2, v2, 0x10

    if-nez v2, :cond_6

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f090350

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_6
    iget v2, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    and-int/lit8 v2, v2, 0x20

    if-nez v2, :cond_7

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f090351

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_7
    iget v2, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    and-int/lit8 v2, v2, 0x40

    if-nez v2, :cond_8

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f090352

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_8
    iget v1, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    and-int/lit16 v1, v1, 0x80

    if-nez v1, :cond_9

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f090353

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_9
    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f090354

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    :goto_0
    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    new-instance v2, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$13;

    invoke-direct {v2, v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$13;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    invoke-virtual {v1, v2}, Lcom/android/camera/ActivityBase;->runOnUiThread(Ljava/lang/Runnable;)V

    iget-object v0, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/LiveModule;

    invoke-virtual {v0, v4}, Lcom/android/camera/module/LiveModule;->onMimojiCreateCompleted(Z)V

    return-void

    :cond_a
    :goto_1
    sget-object v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "result = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mUiHandler:Landroid/os/Handler;

    new-instance v2, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$12;

    invoke-direct {v2, v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$12;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private getDeviceWaterMarkParam()Lcom/android/camera/effect/renders/DeviceWatermarkParam;
    .locals 10

    invoke-static {}, Lcom/android/camera/CameraSettings;->isDualCameraWaterMarkOpen()Z

    move-result v0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCameraWaterMarkOpen()Z

    move-result v1

    nop

    nop

    nop

    if-nez v0, :cond_1

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    :goto_0
    move v3, v0

    move v4, v1

    goto :goto_2

    :cond_1
    :goto_1
    const/4 v0, 0x0

    const/4 v1, 0x1

    goto :goto_0

    :goto_2
    const/4 v0, 0x0

    if-eqz v3, :cond_2

    const v1, 0x7f0a0179

    invoke-static {v1, v0}, Lcom/android/camera/CameraSettings;->getResourceFloat(IF)F

    move-result v1

    const v2, 0x7f0a017a

    invoke-static {v2, v0}, Lcom/android/camera/CameraSettings;->getResourceFloat(IF)F

    move-result v2

    const v5, 0x7f0a017b

    invoke-static {v5, v0}, Lcom/android/camera/CameraSettings;->getResourceFloat(IF)F

    move-result v0

    :goto_3
    move v9, v0

    move v7, v1

    move v8, v2

    goto :goto_4

    :cond_2
    if-eqz v4, :cond_3

    const v1, 0x7f0a0176

    invoke-static {v1, v0}, Lcom/android/camera/CameraSettings;->getResourceFloat(IF)F

    move-result v1

    const v2, 0x7f0a0177

    invoke-static {v2, v0}, Lcom/android/camera/CameraSettings;->getResourceFloat(IF)F

    move-result v2

    const v5, 0x7f0a0178

    invoke-static {v5, v0}, Lcom/android/camera/CameraSettings;->getResourceFloat(IF)F

    move-result v0

    goto :goto_3

    :cond_3
    move v7, v0

    move v8, v7

    move v9, v8

    :goto_4
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelRearOn()Z

    move-result v5

    new-instance v0, Lcom/android/camera/effect/renders/DeviceWatermarkParam;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getDualCameraWaterMarkFilePathVendor()Ljava/lang/String;

    move-result-object v6

    move-object v2, v0

    invoke-direct/range {v2 .. v9}, Lcom/android/camera/effect/renders/DeviceWatermarkParam;-><init>(ZZZLjava/lang/String;FFF)V

    return-object v0
.end method

.method private getMimojiPara()Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iget-boolean v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    if-eqz v1, :cond_5

    new-instance v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;

    invoke-direct {v0}, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;-><init>()V

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-virtual {v1, v0}, Lcom/arcsoft/avatar/AvatarEngine;->getConfigValue(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;)V

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getMimojiConfigValue(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;)Ljava/util/Map;

    move-result-object v0

    const-string v1, ""

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    sget-object v3, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PersonTemplatePath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v1, "custom"

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    sget-object v3, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PigTemplatePath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v1, "pig"

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    sget-object v3, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->BearTemplatePath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v1, "bear"

    goto :goto_0

    :cond_2
    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    sget-object v3, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->RoyanTemplatePath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string v1, "royan"

    goto :goto_0

    :cond_3
    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    sget-object v3, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->RabbitTemplatePath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string v1, "rabbit"

    :cond_4
    :goto_0
    const-string/jumbo v2, "\u840c\u62cd\u5206\u7c7b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_5
    const-string/jumbo v1, "\u840c\u62cd\u5206\u7c7b"

    const-string v2, "null"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1
    return-object v0
.end method

.method private getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;
    .locals 2

    new-instance v0, Lcom/xiaomi/camera/core/PictureInfo;

    invoke-direct {v0}, Lcom/xiaomi/camera/core/PictureInfo;-><init>()V

    invoke-direct {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->isFrontMirror()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/camera/core/PictureInfo;->setFrontMirror(Z)Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/xiaomi/camera/core/PictureInfo;->setSensorType(Z)Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/xiaomi/camera/core/PictureInfo;->setBokehFrontCamera(Z)Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v0

    const-string v1, "off"

    invoke-virtual {v0, v1}, Lcom/xiaomi/camera/core/PictureInfo;->setHdrType(Ljava/lang/String;)Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->getOperatingMode()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/camera/core/PictureInfo;->setOpMode(I)Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/PictureInfo;->end()V

    return-object v0
.end method

.method private initMimojiResource(Landroid/content/Context;)V
    .locals 4

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->gw()Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/android/camera/CameraSettings;->getMimojiModleVersion()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setIsLoading(Z)V

    :cond_0
    sget-object v0, Lcom/android/camera/fragment/mimoji/MimojiHelper;->MIMOJI_DIR:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/FileUtils;->hasDir(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/android/camera/fragment/mimoji/MimojiHelper;->MIMOJI_DIR:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/FileUtils;->delDir(Ljava/lang/String;)Z

    :cond_1
    const v0, 0x8000

    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const-string v2, "mimoji/data.zip"

    sget-object v3, Lcom/android/camera/fragment/mimoji/MimojiHelper;->MIMOJI_DIR:Ljava/lang/String;

    invoke-static {v1, v2, v3, v0}, Lcom/android/camera/Util;->verifyAssetZip(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "verify asset zip failed..."

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadResourceHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$2;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$2;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private isFrontMirror()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isLiveShotOn()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontMirror()Z

    move-result v0

    return v0
.end method

.method static synthetic lambda$createAvatar$0(I)V
    .locals 0

    return-void
.end method

.method private onProfileFinish()V
    .locals 3

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    const-string v1, "onProfileFinish"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPostSavingFinish()V

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    const/4 v2, -0x1

    invoke-interface {v0, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertMimojiFaceDetect(ZI)V

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->releaseRender()V

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->mimojiEnd()V

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_EDIT_MID:I

    invoke-virtual {v0, v1}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setMode(I)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xe0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    const/4 v1, 0x1

    if-eqz v0, :cond_2

    const/16 v2, 0x69

    invoke-interface {v0, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;->startMimojiEdit(ZI)V

    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/LiveModule;

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule;->onMimojiCreateCompleted(Z)V

    const-string/jumbo v0, "\u840c\u62cd\u53d6\u666f\u9875\u70b9\u51fb\u62cd\u7167"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackMimojiClick(Ljava/lang/String;)V

    return-void
.end method

.method private quit()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadResourceThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    return-void
.end method

.method private release()V
    .locals 3

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    const-string v1, "avatar release"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mGetThumCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mGetThumCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    :cond_0
    :goto_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsAvatarInited:Z

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadHandler:Landroid/os/Handler;

    new-instance v2, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$4;

    invoke-direct {v2, p0, v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$4;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;I)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    if-eqz v0, :cond_1

    :try_start_1
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    sget-object v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    const-string v2, "fail to close fd"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    :cond_1
    return-void
.end method

.method private reloadConfig()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->getMode()I

    move-result v0

    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_PREVIEW:I

    if-eq v0, v1, :cond_2

    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_NONE:I

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_EDIT_MID:I

    if-eq v0, v1, :cond_1

    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_EIDT:I

    if-ne v0, v1, :cond_5

    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    sget-object v1, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PersonTemplatePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/arcsoft/avatar/AvatarEngine;->setTemplatePath(Ljava/lang/String;)V

    sget-object v0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PersonTemplatePath:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xe0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    if-eqz v0, :cond_5

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;->resetConfig()V

    goto :goto_1

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_PREVIEW:I

    invoke-virtual {v0, v1}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setMode(I)V

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->getmCurrentMimojiInfo()Lcom/android/camera/fragment/mimoji/MimojiInfo;

    move-result-object v0

    if-eqz v0, :cond_4

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    iget-object v2, v0, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mAvatarTemplatePath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    iget-object v2, v0, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mAvatarTemplatePath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/arcsoft/avatar/AvatarEngine;->setTemplatePath(Ljava/lang/String;)V

    iget-object v1, v0, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mAvatarTemplatePath:Ljava/lang/String;

    iput-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    :cond_3
    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mConfigPath:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->isPrefabModel(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-virtual {v1, v0}, Lcom/arcsoft/avatar/AvatarEngine;->loadConfig(Ljava/lang/String;)V

    :cond_4
    nop

    :cond_5
    :goto_1
    return-void
.end method

.method private updateBeauty()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/BaseModule;

    instance-of v1, v0, Lcom/android/camera/module/LiveModule;

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningShine()Lcom/android/camera/data/data/runing/ComponentRunningShine;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->supportBeautyLevel()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v1, 0x3

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->setFaceBeautyLevel(I)V

    goto :goto_0

    :cond_1
    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->supportSmoothLevel()Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0x28

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->setFaceBeautySmoothLevel(I)V

    :cond_2
    :goto_0
    const/4 v1, 0x1

    new-array v1, v1, [I

    const/4 v2, 0x0

    const/16 v3, 0xd

    aput v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    return-void
.end method

.method private updateVideoOrientation(I)V
    .locals 3

    const/16 v0, 0x13b

    if-le p1, v0, :cond_0

    const/16 v1, 0x168

    if-le p1, v1, :cond_1

    :cond_0
    const/16 v1, 0x2d

    if-ltz p1, :cond_2

    if-gt p1, v1, :cond_2

    :cond_1
    const/4 p1, 0x0

    iput p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCurrentScreenOrientation:I

    goto :goto_0

    :cond_2
    const/16 v2, 0x87

    if-le p1, v1, :cond_3

    if-gt p1, v2, :cond_3

    const/16 p1, 0x5a

    iput p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCurrentScreenOrientation:I

    goto :goto_0

    :cond_3
    const/16 v1, 0xe1

    if-le p1, v2, :cond_4

    if-gt p1, v1, :cond_4

    const/16 p1, 0xb4

    iput p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCurrentScreenOrientation:I

    goto :goto_0

    :cond_4
    if-le p1, v1, :cond_5

    if-gt p1, v0, :cond_5

    const/16 p1, 0x10e

    iput p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCurrentScreenOrientation:I

    :cond_5
    :goto_0
    return-void
.end method


# virtual methods
.method public backToPreview(ZZ)V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInMimojiEdit()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInMimojiEditMid()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    if-nez p1, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->getmCurrentMimojiInfo()Lcom/android/camera/fragment/mimoji/MimojiInfo;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->getmCurrentMimojiInfo()Lcom/android/camera/fragment/mimoji/MimojiInfo;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v1, v0, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mConfigPath:Ljava/lang/String;

    invoke-static {v1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->isPrefabModel(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mAvatarTemplatePath:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/arcsoft/avatar/AvatarEngine;->setTemplatePath(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mConfigPath:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/arcsoft/avatar/AvatarEngine;->loadConfig(Ljava/lang/String;)V

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_PREVIEW:I

    invoke-virtual {v0, v1}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setMode(I)V

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->getmCurrentMimojiInfo()Lcom/android/camera/fragment/mimoji/MimojiInfo;

    move-result-object v0

    const/4 v1, 0x1

    if-nez v0, :cond_3

    if-eqz p1, :cond_4

    :cond_3
    iput-boolean v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    :cond_4
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsStopRender:Z

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xac

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xaf

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->reInitTipImage()V

    if-eqz p2, :cond_5

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->getMimojiPannelState()Z

    move-result p2

    if-nez p2, :cond_5

    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showMimoji()V

    :cond_5
    const/4 p2, -0x1

    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertMimojiFaceDetect(ZI)V

    const/4 p2, 0x2

    new-array p2, p2, [I

    fill-array-data p2, :array_0

    invoke-interface {v0, v1, p2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->enableMenuItem(Z[I)V

    iget-object p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    if-eqz p2, :cond_6

    iget-object p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p2, v1, v0}, Lcom/arcsoft/avatar/AvatarEngine;->setRenderScene(ZF)V

    :cond_6
    invoke-virtual {p0, p1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->setDisableSingleTapUp(Z)V

    return-void

    :array_0
    .array-data 4
        0xc5
        0xc1
    .end array-data
.end method

.method protected getOperatingMode()I
    .locals 1

    nop

    const v0, 0x800b

    return v0
.end method

.method public initAvatarEngine(IIIIZ)V
    .locals 8

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "initAvatarEngine with parameters : displayOrientation = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", width = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", height = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", isFrontCamera = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mPreviewWidth:I

    iput p4, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mPreviewHeight:I

    iput-boolean p5, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    iput p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mOrientation:I

    iget-object p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    invoke-direct {p0, p2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->initMimojiResource(Landroid/content/Context;)V

    iget-object p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {p2}, Lcom/android/camera/ActivityBase;->startFromKeyguard()Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    sget v0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_PREVIEW:I

    invoke-virtual {p2, v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setMode(I)V

    iget-object p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {p2}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->reset()V

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    iget-object p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadHandler:Landroid/os/Handler;

    new-instance v7, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;

    move-object v0, v7

    move-object v1, p0

    move v3, p1

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;IIIIZ)V

    invoke-virtual {p2, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public isOnCreateMimoji()Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInMimojiCreate()Z

    move-result v0

    return v0
.end method

.method public isProcessorReady()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsAvatarInited:Z

    return v0
.end method

.method public isRecordStopping()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsRecordStopping:Z

    return v0
.end method

.method public isRecording()Z
    .locals 3

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Recording = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsRecording:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsRecording:Z

    return v0
.end method

.method public onCaptureImage()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mNeedCapture:Z

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {v1}, Lcom/android/camera/ActivityBase;->getCurrentModuleIndex()I

    move-result v1

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getFlashMode(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->getMimojiPara()Ljava/util/Map;

    move-result-object v2

    iget-boolean v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    invoke-static {v2, v1, v0, v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackMimojiCaptureOrRecord(Ljava/util/Map;Ljava/lang/String;ZZ)V

    return-void
.end method

.method public onCreateCapture()Z
    .locals 5

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    const-string v1, "onCreateCapture"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mFaceDectectResult:I

    const/4 v1, 0x0

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFaceDetectSuccess:Z

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v0

    instance-of v2, v0, Lcom/android/camera/module/LiveModule;

    const/4 v3, 0x1

    if-eqz v2, :cond_1

    check-cast v0, Lcom/android/camera/module/LiveModule;

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->setFaceBeautyLevel(I)V

    new-array v2, v3, [I

    const/16 v4, 0xd

    aput v4, v2, v1

    invoke-virtual {v0, v2}, Lcom/android/camera/module/LiveModule;->updatePreferenceInWorkThread([I)V

    :cond_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    invoke-interface {v0, v3}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->showOrHideMimojiProgress(Z)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    if-eqz v0, :cond_2

    const/16 v1, 0x13

    const v2, 0x7f09034b

    const/4 v4, 0x2

    invoke-interface {v0, v1, v2, v4}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showTips(III)V

    :cond_2
    iput-boolean v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsShutterButtonClick:Z

    invoke-direct {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->animateCapture()V

    return v3

    :cond_3
    :goto_0
    return v1
.end method

.method public onDeviceRotationChange(I)V
    .locals 1

    iput p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDeviceRotation:I

    invoke-direct {p0, p1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->updateVideoOrientation(I)V

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiEditor:Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiEditor:Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;->onDeviceRotationChange(I)V

    :cond_0
    return-void
.end method

.method public onDrawFrame(Landroid/graphics/Rect;IIZ)V
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    const/16 v3, 0x4000

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    if-eqz v2, :cond_2

    if-eqz v1, :cond_2

    iget-boolean v2, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsStopRender:Z

    if-nez v2, :cond_2

    nop

    const/4 v2, 0x0

    if-eqz p4, :cond_0

    move/from16 v1, p2

    move/from16 v6, p3

    invoke-static {v2, v2, v1, v6}, Landroid/opengl/GLES20;->glViewport(IIII)V

    goto :goto_0

    :cond_0
    sget v6, Lcom/android/camera/Util;->sWindowHeight:I

    iget v7, v1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v6, v7

    iget v7, v1, Landroid/graphics/Rect;->right:I

    iget v8, v1, Landroid/graphics/Rect;->bottom:I

    iget v1, v1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v8, v1

    invoke-static {v2, v6, v7, v8}, Landroid/opengl/GLES20;->glViewport(IIII)V

    iget-boolean v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mNeedCapture:Z

    if-eqz v1, :cond_1

    sget-object v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    const-string v6, "onCapture start"

    invoke-static {v1, v6}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    invoke-virtual {v1}, Lcom/arcsoft/avatar/RecordModule;->capture()V

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {v1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v1

    check-cast v1, Lcom/android/camera/module/LiveModule;

    const/4 v6, 0x3

    invoke-virtual {v1, v6}, Lcom/android/camera/module/LiveModule;->setCameraStatePublic(I)V

    iput-boolean v2, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mNeedCapture:Z

    :cond_1
    :goto_0
    invoke-static {v5, v5, v5, v4}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    invoke-static {v3}, Landroid/opengl/GLES20;->glClear(I)V

    iget-object v7, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    const/16 v8, 0x5a

    iget-boolean v9, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    iget v10, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDeviceRotation:I

    const/4 v11, 0x0

    const/4 v12, 0x0

    iget-object v13, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mTextureId:[I

    const/4 v14, 0x0

    iget-boolean v15, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    invoke-virtual/range {v7 .. v15}, Lcom/arcsoft/avatar/RecordModule;->startRender(IZIIZ[I[BZ)V

    goto :goto_1

    :cond_2
    invoke-static {v5, v5, v5, v4}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    invoke-static {v3}, Landroid/opengl/GLES20;->glClear(I)V

    :goto_1
    return-void
.end method

.method public onMimojiCreate()V
    .locals 4

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    const-string v1, "start create mimoji"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_CREATE:I

    invoke-virtual {v0, v1}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setMode(I)V

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->mimojiStart()V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->prepareCreateMimoji()V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    if-eqz v0, :cond_0

    const/16 v1, 0x13

    const v2, 0x7f090343

    const/4 v3, 0x2

    invoke-interface {v0, v1, v2, v3}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showTips(III)V

    :cond_0
    return-void
.end method

.method public onMimojiDeleted()V
    .locals 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setmCurrentMimojiInfo(Lcom/android/camera/fragment/mimoji/MimojiInfo;)V

    return-void
.end method

.method public onMimojiSelect(Lcom/android/camera/fragment/mimoji/MimojiInfo;)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$5;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$5;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Lcom/android/camera/fragment/mimoji/MimojiInfo;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onPreviewFrame(Landroid/media/Image;Lcom/android/camera2/Camera2Proxy;I)V
    .locals 8

    iget-boolean p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsAvatarInited:Z

    if-nez p2, :cond_0

    sget-object p1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    const-string p2, "onPreviewFrame mIsAvatarInited false  ,need init"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-object p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    if-nez p2, :cond_1

    iget-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadHandler:Landroid/os/Handler;

    new-instance p2, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;

    invoke-direct {p2, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_1
    invoke-static {p1}, Lcom/arcsoft/avatar/util/AsvloffscreenUtil;->buildNV21SingleBuffer(Landroid/media/Image;)Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;

    move-result-object p2

    iget-object p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    const/4 v7, 0x0

    if-eqz p3, :cond_9

    iget-object p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {p3}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInMimojiEditMid()Z

    move-result p3

    if-nez p3, :cond_7

    iget-object p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {p3}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInMimojiEdit()Z

    move-result p3

    if-eqz p3, :cond_2

    goto :goto_2

    :cond_2
    iget-object p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarLock:Ljava/lang/Object;

    monitor-enter p3

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    iget v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mOrientation:I

    iget v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDeviceRotation:I

    iget-boolean v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    invoke-static {v1, v2, v3}, Lcom/android/camera/fragment/mimoji/MimojiHelper;->getOutlineOrientation(IIZ)I

    move-result v1

    iget-boolean v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    invoke-virtual {v0, p2, v1, v2}, Lcom/arcsoft/avatar/RecordModule;->startProcess(Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;IZ)Z

    move-result v0

    monitor-exit p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-boolean p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mNeedShowNoFaceTips:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_3

    iget-boolean v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    if-eqz v2, :cond_3

    move v2, v1

    goto :goto_0

    :cond_3
    move v2, v7

    :goto_0
    iput-boolean v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mNeedShowNoFaceTips:Z

    iget-boolean v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mNeedShowNoFaceTips:Z

    if-eq p3, v2, :cond_4

    goto :goto_1

    :cond_4
    move v1, v7

    :goto_1
    if-eqz v1, :cond_5

    iget-object p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {p3}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInMimojiCreate()Z

    move-result p3

    if-nez p3, :cond_5

    iget-object p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mUiHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$11;

    invoke-direct {v1, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$11;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    invoke-virtual {p3, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_5
    iget-boolean p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLastNeedBeauty:Z

    if-eq p3, v0, :cond_6

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLastNeedBeauty:Z

    invoke-direct {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->updateBeauty()V

    :cond_6
    iget-object p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCameraView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    invoke-virtual {p3}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->requestRender()V

    goto :goto_3

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_7
    :goto_2
    iget-object p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiEditor:Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    if-nez p3, :cond_8

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p3

    const/16 v0, 0xe0

    invoke-virtual {p3, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p3

    check-cast p3, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    iput-object p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiEditor:Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    :cond_8
    iget-object p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiEditor:Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    if-eqz p3, :cond_9

    new-instance v5, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;

    invoke-direct {v5}, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;-><init>()V

    iget-object p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarLock:Ljava/lang/Object;

    monitor-enter p3

    :try_start_2
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    const/16 v2, 0x5a

    iget-boolean v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    iget v4, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mOrientation:I

    const/4 v6, 0x1

    move-object v1, p2

    invoke-virtual/range {v0 .. v6}, Lcom/arcsoft/avatar/AvatarEngine;->avatarProcessWithInfoEx(Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;IZILcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;Z)I

    monitor-exit p3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    iget-object p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiEditor:Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    invoke-interface {p3}, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;->requestRender()V

    goto :goto_3

    :catchall_1
    move-exception p1

    :try_start_3
    monitor-exit p3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p1

    :cond_9
    :goto_3
    iget-object p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {p3}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInMimojiCreate()Z

    move-result p3

    if-eqz p3, :cond_a

    iput-boolean v7, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    iget-object p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarLock:Ljava/lang/Object;

    monitor-enter p3

    :try_start_4
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    iget v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mOrientation:I

    iget v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDeviceRotation:I

    iget-boolean v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    invoke-static {v1, v2, v3}, Lcom/android/camera/fragment/mimoji/MimojiHelper;->getOutlineOrientation(IIZ)I

    move-result v1

    invoke-virtual {v0, p2, v1}, Lcom/arcsoft/avatar/AvatarEngine;->outlineProcessEx(Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mFaceDectectResult:I

    monitor-exit p3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    iget-object p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    if-eqz p3, :cond_a

    iget-object p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mFaceDectectResult:I

    invoke-interface {p3, v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->mimojiFaceDetect(I)V

    goto :goto_4

    :catchall_2
    move-exception p1

    :try_start_5
    monitor-exit p3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw p1

    :cond_a
    :goto_4
    iget-boolean p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsShutterButtonClick:Z

    if-eqz p3, :cond_c

    iput-boolean v7, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsShutterButtonClick:Z

    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object p3

    aget-object p3, p3, v7

    invoke-virtual {p3}, Landroid/media/Image$Plane;->getRowStride()I

    move-result p3

    invoke-virtual {p2}, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->getYData()[B

    move-result-object p2

    invoke-virtual {p1}, Landroid/media/Image;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/media/Image;->getHeight()I

    move-result p1

    invoke-static {p2, v0, p1, p3}, Lcom/android/camera/fragment/mimoji/BitmapUtils;->rawByteArray2RGBABitmap([BIII)Landroid/graphics/Bitmap;

    move-result-object p1

    iget-boolean p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    if-eqz p2, :cond_b

    const/16 p2, -0x5a

    goto :goto_5

    :cond_b
    const/16 p2, 0x5a

    :goto_5
    invoke-static {p1, p2}, Lcom/android/camera/fragment/mimoji/BitmapUtils;->rotateBitmap(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getRowBytes()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    mul-int/2addr v0, v1

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/Bitmap;->copyPixelsToBuffer(Ljava/nio/Buffer;)V

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->createAvatar([BII)V

    :cond_c
    return-void
.end method

.method public onRecordStart(Landroid/content/ContentValues;)V
    .locals 4

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    const-string v1, "start record..."

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsRecording:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCurrentModuleIndex()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getFlashMode(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->getMimojiPara()Ljava/util/Map;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    const/4 v3, 0x0

    invoke-static {v1, v0, v3, v2}, Lcom/android/camera/statistic/CameraStatUtil;->trackMimojiCaptureOrRecord(Ljava/util/Map;Ljava/lang/String;ZZ)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsRecording:Z

    iput-boolean v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsRecordStopping:Z

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContentValues:Landroid/content/ContentValues;

    const-string v1, "_data"

    invoke-virtual {p1, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mSaveVideoPath:Ljava/lang/String;

    :try_start_0
    iget-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mSaveVideoPath:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/android/camera/FileCompat;->getParcelFileDescriptor(Ljava/lang/String;Z)Landroid/os/ParcelFileDescriptor;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    iget-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCameraView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    new-instance v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$6;

    invoke-direct {v0, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$6;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->updateRecordingTime()V

    return-void
.end method

.method public onRecordStop(Z)V
    .locals 2

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    const-string v1, "stop record..."

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsRecordStopping:Z

    if-eqz p1, :cond_0

    new-instance p1, Ljava/util/concurrent/CountDownLatch;

    invoke-direct {p1, v0}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mGetThumCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCountDownTimer:Landroid/os/CountDownTimer;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {p1}, Landroid/os/CountDownTimer;->cancel()V

    :cond_1
    iget-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCameraView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    new-instance v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$8;

    invoke-direct {v0, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$8;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onResume()V
    .locals 2

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    const-string v1, "reset"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/RecordModule;->reset()V

    :cond_0
    return-void
.end method

.method public registerProtocol()V
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd9

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    return-void
.end method

.method public releaseRender()V
    .locals 3

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsStopRender:Z

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v1}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInPreviewSurface()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadHandler:Landroid/os/Handler;

    new-instance v2, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$3;

    invoke-direct {v2, p0, v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$3;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;I)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xe0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;->releaseRender()V

    :cond_1
    :goto_0
    return-void
.end method

.method public setDetectSuccess(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFaceDetectSuccess:Z

    return-void
.end method

.method public setDisableSingleTapUp(Z)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/LiveModule;

    invoke-virtual {v0, p1}, Lcom/android/camera/module/LiveModule;->setDisableSingleTapUp(Z)V

    return-void
.end method

.method public unRegisterProtocol()V
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd9

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    invoke-direct {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->release()V

    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->releaseRender()V

    invoke-direct {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->quit()V

    return-void
.end method

.method protected updateRecordingTime()V
    .locals 7

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCountDownTimer:Landroid/os/CountDownTimer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    :cond_0
    new-instance v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$7;

    iget v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMaxVideoDurationInMs:I

    int-to-long v1, v1

    const-wide/16 v3, 0x1c2

    add-long/2addr v3, v1

    const-wide/16 v5, 0x3e8

    move-object v1, v0

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$7;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;JJ)V

    iput-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCountDownTimer:Landroid/os/CountDownTimer;

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->start()Landroid/os/CountDownTimer;

    return-void
.end method
